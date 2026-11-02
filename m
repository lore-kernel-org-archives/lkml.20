Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626452;
	b=eN+fdKA5Xai18s//YAJhqJKWZBUN8UxfK0qdU0HgdVGpDOHpjvdK6GZsqPjOqtGMljUm
	 4Kw1lLUj7MviXms7HAJSMyqRJu5rv0NTvSw5OdskxGsuGTOPSCOvL2XyIXC6XTnEfTOG0
	 yweGjYM4BqVFRBKseGhamm1LuMOHE2SBYaNG/eAldAVKEIbvFaspr4p1nHG3vxNEfZaOg
	 R8xG/FVoqSxUgbmHr3twBymfOOH4Z8vhzj6bzFAykwrjMlIHyUcpVWmUwdFGdhGEtg+Wc
	 CjiWRMug2ab7BxnoyWM73VBHg1SHZGOh3Y9sR9tWCzOSWF9fZORq7hlLXk9gi8GXp7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626452;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LGbo+YY/7yG0EnpBf+d/5DqhQQyR+pRToBdx3xDVyzE=;
	b=orFW6z4j7FWmCUpLo+OP6JF+AWM9A82L+WMZbZln97/jK046oC/df5fDGcbbhjHgVIqa
	 HxXHCbQYopxkiirxa0IsfO3xV1GirdVE2tOT/JS2aHeKH+xrdM/2HgZUbLIHdWfBYri/p
	 Mm2+VJQL8qAbPdfkCcmQqCpuVHN930UgIHC3uRIncmZrEgyjC/P1fqd30qu4kWcTHxzS1
	 LSdAZYyKCzctSK64Lp3BQeSA/6oMCoL0xRdAbnnLq0ht5fj+hW3+iuRga0N9LPE6xpbQr
	 38/W4eHwPWfOjnL6By85aOULi+EV5VI+8gxe4yjVGLm+oqGQOdhKgqRPP/bB60SQLOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ET3jklls;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1694A60A262C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1694A60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ET3jklls
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BA8A1595;
	Mon,  2 Nov 2026 05:34:08 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AC5F3FA1F;
	Mon,  2 Nov 2026 05:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626451; bh=HWATMbyBT6rG2LNQKZLsakPPWq+Jh98XFBRJ4xV02pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ET3jkllsDEP7Y5930vqbCq95uuPct85Y45iIR7xL8q0mIPgh5oXt4ktn8N7t9j3AS
	 aPK/Mz+L4/HQ0sEj7nYfWr4q6mOFfCX+Ek5aiUfWMY9FsALe6U4/vOQ4iegS6dFi+e
	 w7ADwlo/h54bavE0IYyTg0OyKMT4PkoMmJyPW4Xo=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:33:01 +0000
Subject: [PATCH 08/10] irqchip/gic-v5: Invalidate ITS device cache before
 freeing ITT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-host_gicv5_fixes-v1-8-743b61626fc5@arm.com>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
In-Reply-To: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2

A cached device table entry can still reference the ITT after its
memory is freed via kfree(), even if the DTE has been marked as
invalid. Once the memory has been released, it could be reallocated,
and it would be unfortunate for the hardware to interpret this as a
valid ITT.

Invalidate the device cache and wait for completion before freeing the
ITT during device teardown.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 8628de326f28d..4de07bbdc4923 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -556,6 +556,7 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 				       struct gicv5_its_dev *its_dev)
 {
 	__le64 *dte;
+	int ret;
 
 	dte = gicv5_its_devtab_get_dte_ref(its, its_dev->device_id, false);
 
@@ -568,9 +569,10 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	/* Zero everything - make it clear that this is an invalid entry */
 	its_write_table_entry(its, dte, 0);
 
+	ret = gicv5_its_device_cache_inv(its, its_dev);
 	gicv5_its_free_itt(its_dev);
 
-	return gicv5_its_device_cache_inv(its, its_dev);
+	return ret;
 }
 
 /*

-- 
2.34.1

