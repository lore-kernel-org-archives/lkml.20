Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814515;
	b=eJl+pQfFDzu8/JPmaP/9+5doaA9y6LoCH9nebMBvr3Q4EG8bY43OYhGysOT3xycls8no
	 XbfrE9++CeUp5d2+zBlw7K/p119BIeG2Hpol+6CKeo0IhH5ciu2cFYd4plBhSOu2dAaaY
	 DmXobLDFh0sNdyuYzuQkA1ZLxrpK1rFYixDawkHiPJf/AzI1MX54CpWAtomAr2+8a1pWY
	 k6aPYKv8sGOPXv7p+ad756no5iDxRsPBxOtTtFChaTavdO83A12/oYScRsz1INRPWmz9o
	 ftZEUSlLxRcZepcZeft1ojpnu7a3T0VjDB4NrEPc7jZXNYv1gdFCv6D7CyxpK+JaiNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814515;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qfvio25cdXXS1J1fIZqL5jA3i+NA1ppNqoJBEYXQEA4=;
	b=cJPeY0RE+DALxwuEVDLgdOaCqSO2X+6qQYZ3ZiZBMmVhhOLaqyFNERcSvW5hwkUOMPwB
	 PHuZtmL+2e4ZHksoQvD5LbJDczGUpYJlSHPRGNDItLN6+Wacot4VUu8aeaZJGKRzDp3C7
	 zVz/aBKSGrS0N9uUejZs8s5QkORC+pCbyfYtwrFs7jlbaMZC02ZNQEdROtALbYPUD3aDI
	 w5z2jPVQ7vx2ZeRFp2i9x3P/QnnmX67ycpUL+obrdFByXdvBwRrifz02R790uf3HT2nD/
	 8YJB8TSTB1doygmAgbr+fjmI76lN44zrravPNKIBk569+mwDqqLAQXbv8Pb35WwchZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="nTRRIPr/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF493606D811
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF493606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nTRRIPr/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F1D41BB0;
	Wed,  4 Nov 2026 09:48:31 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098CA3F673;
	Wed,  4 Nov 2026 09:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814514; bh=Id1g8MWz/JqcFn8xOCbYiIJXp1f20zUGkCEjpJhFp4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nTRRIPr/r432V+L/3ury9XzvpvELtc5YkaMsZ+uy/ruNyJ53xSonfP1ErvFV4gIm5
	 as4/S72BBKQBhxfECSDh/A6HXN9tn7fjTEx5aGE+QpX5tS20pmOk9GxJtBSLTn4Kp6
	 /oBVbxgJhs6l+x5QEaCSgi2556D6b5jDo4fnU3UU=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:48:02 +0000
Subject: [PATCH v2 08/10] irqchip/gic-v5: Invalidate ITS device cache
 before freeing ITT
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
Message-Id: <20261104-host_gicv5_fixes-v2-8-e47ad20ea3c8@arm.com>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
In-Reply-To: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
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
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
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

