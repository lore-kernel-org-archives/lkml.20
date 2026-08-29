Received: from tabos.org (krueger-it.net [145.239.1.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FA3264C1;
	Sat, 29 Aug 2026 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.1.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981705; cv=none; b=Hdke2pdWjvw7ZSRuHBWDkY0Sw//1U+qENgPe4wW8xj9rW+zsx0W36tU1TQkmWJ5dfo1jdI6RK0Nk0xz3BTfFZypy/BfVJXkZB50QieRMUBWmDD3z/GTbgkTFVkiQIfMlapMYz5gxcFF1bfayx1jcGY9K9Zzb2rFANuZaEFeVJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981705; c=relaxed/simple;
	bh=Ok9Z+aNEAobzVAXg1AwhXnjlhJo+bqUj8lFemWQXKiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNY6UwmUE6HDBRUuXyYoKToTLY3he68jSyZiMDMPlpl6bBI6jEtiPrvdgEXz8VQzyWH8fwn05cfw2QFYAbtzEP/8hQ1X4xPFDOgYTPk6ydAr8l2oghQeRvap9oTZiZ+1+4i1vmIVa2SvzQg5t8yhoenuJl22MjDVQTV6e5Qad/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org; spf=pass smtp.mailfrom=tabos.org; dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b=Ua7OHnaE; arc=none smtp.client-ip=145.239.1.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tabos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b="Ua7OHnaE"
Received: from c0d1ngstat1on.fritz.box (unknown [94.31.74.100])
	by dserver.krueger-it.net (Postfix) with ESMTPA id 7585762E1411;
	Sat, 29 Aug 2026 07:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tabos.org;
	s=default; t=1787981126;
	bh=UdHZK7Mg/NXZyv5cMjzZSaTyOSP+rFTBfvyCEiYkjos=; h=From:To:Subject;
	b=Ua7OHnaEET0VJSkICT6AvcTf9lM8sIVI+xPVY9kKsQ6dGfTjGmXDhTdlWu8YyIJsD
	 0u4oZluheeY+KxcLHWPhx0/4ZuRnJ2IpiSKI0DdtRJuCo4CTZa/vJ5Sb1UUieyEGHP
	 roeuN9hie9KXl2NVhubvSY1/eYfK5a8zxBEqWt9E8p8WgVorFV/ww9d3BWdlWGh1ZP
	 QnHEak4+r8uBuLGJt6WYhPIAZlWLNcZZpYMUWI+ah+2XOqpbv5d2/s8SjU+gb2y8WE
	 QdopLBEnHH7kJ501I/k+GOAt4RrLMXMLSTj7BS6tN9dWoH+D9w//CYc9RQN+6p8JQG
	 7nN6+380tmNaQ==
Authentication-Results: dserver.krueger-it.net;
	spf=pass (sender IP is 94.31.74.100) smtp.mailfrom=jan.brummer@tabos.org smtp.helo=c0d1ngstat1on.fritz.box
Received-SPF: pass (dserver.krueger-it.net: connection is authenticated)
From: Jan-Michael Brummer <jan.brummer@tabos.org>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tian.shu.qiu@intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan-Michael Brummer <jan.brummer@tabos.org>
Subject: [PATCH 2/2] media: i2c: ak7375: Do not mark the VCM active before powering it
Date: Sat, 29 Aug 2026 07:25:14 +0200
Message-ID: <20260829052514.18178-4-jan.brummer@tabos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829052514.18178-1-jan.brummer@tabos.org>
References: <20260829052514.18178-1-jan.brummer@tabos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

probe() calls pm_runtime_set_active() while the regulators are still
off, so runtime PM believes a powered device is present.  The following
pm_runtime_idle() runs the suspend path against an unpowered chip, which
fails its I2C writes and then calls regulator_bulk_disable() on
regulators that were never enabled - later tripping the enable/disable
balance check in regulator_bulk_free() on unbind.

Mark the device suspended instead and drop the idle call, so the first
resume happens when something actually uses the VCM.  While at it,
disable the regulators again when resume fails, which leaked an enable
count for the same reason.

Fixes: 90ee26fb2f50 ("media: ak7375: Add ak7375 lens voice coil driver")
Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
---
 drivers/media/i2c/ak7375.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 4f311c4..2763bbe 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -235,9 +235,12 @@ static int ak7375_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto err_cleanup;
 
-	pm_runtime_set_active(&client->dev);
+	/*
+	 * The regulators are off at this point, so the device is suspended,
+	 * not active.
+	 */
+	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
 
 	return 0;
 
@@ -328,6 +331,8 @@ static int __maybe_unused ak7375_vcm_resume(struct device *dev)
 			       cdef->mode_active, 1);
 	if (ret) {
 		dev_err(dev, "%s I2C failure: %d\n", __func__, ret);
+		regulator_bulk_disable(ARRAY_SIZE(ak7375_supply_names),
+				       ak7375_dev->supplies);
 		return ret;
 	}
 
