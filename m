Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA700538D73
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877604; cv=none; b=n+upFcJKDUW78y6Q2NMuQFgtngCWWoKle4dqlZexL0CVRPZdbQjdpiyOzW9PHK/6cdD1jnqiDniAzirxlHMvjDN/EpZhmVoORDe+qA94S5SvL/qdt0JttqReH7p/+uZoRmF9LizQPl6HKWggz2ntqtDU/C4WtiU77qvmo8W5W34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877604; c=relaxed/simple;
	bh=KVsuIyiH5SB/1+xKdlUgJ1F2EW9DnV0+Qj4eqAyuRUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=otg3S3slU8usbOd61RvRT5FJgCWlKwDGIYrjY/RUyajOj3LO4W9k5lq/Khz3EPawhSYRhwKiJmAgLAzFwd6Eo5l45b8xI8DJSomYaFEx7g0kHGXiJ0fpwSAEBY8/74DsxoXN6JmsEEB9toXA7doYmM1SKuXer0CQqz+uCItiX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g9hqNW2L; arc=none smtp.client-ip=91.218.175.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g9hqNW2L"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KVsuIyiH5SB/1+xKdlUgJ1F2EW9DnV0+Qj4eqAyuRUo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788877594; v=1; x=1789482394;
 b=g9hqNW2LcNLLLCtn9UMeGlfa5Q4h4g98K7xEuiX+kheDKs71iCgh7uXLixB47QWqiqqCKhq9
 gy+s+dfT1glSMFh68f7+n+PTyvclNwUCE1n29sxKGAJaez28Latuw6RPbuLeOusxg/je1Q5s2si
 /8Qo+waJGUEWl3uhtA3vWTrE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e08221fc077519c4;
	Tue, 08 Sep 2026 14:26:34 +0000
X-Mizu-Trace-ID: e08221fc077519c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] irqchip/gic-v3-its: Don't clamp nvecs to zero when id_bits is 32
Date: Tue,  8 Sep 2026 15:26:31 +0100
Message-Id: <20260908142632.2795308-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908142632.2795308-1-fuad.tabba@linux.dev>
References: <20260908142632.2795308-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GITS_TYPER_IDBITS is five bits, so id_bits reaches 32 and
min_t(unsigned int, ...) truncates BIT(32) to 0. nvecs becomes 0,
its_lpi_alloc() rejects that, and its_msi_prepare() returns -ENOMEM.
On 32-bit ARM the shift is undefined instead.

The clamp is correct for every value below the maximum, so only that
one value is affected.

Fixes: ce9e40a9a5e5c ("irqchip/gic-v3-its: Limit number of per-device MSIs to the range the ITS supports")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af235373..81a96149f9154 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3484,7 +3484,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	 * Also honor the ITS's own EID limit.
 	 */
 	id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
-	nvecs = min_t(unsigned int, nvecs, BIT(id_bits));
+	nvecs = min_t(u64, nvecs, BIT_ULL(id_bits));
 	nr_ites = max(2, nvecs);
 	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz = max(sz, ITS_ITT_ALIGN);
-- 
2.39.5

