Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906865;
	b=0KYtbMaycCggWnLYvxcllkWJ3KpUTHBvNpGIm0n1801RAiRfSC/9wjSZ/4XR/YWvlYft
	 3th8L3D1fY/5kihpkksE9NNLkxvQBkdBLjzBbNf0eFptC98vBxctBmGtzEbwolhgIKWI1
	 Cfhivi2VAwKyCkyK9A/3GHMgYDbmRR17xEluCI/Y8qZafaN42L3EVCKEcHUZcVhMBcppx
	 RluCNec/gx5v6E9HMkdG9/ufyZUbRvEDFoUcwniNHX3T5k/JfN8xUA2bp0YU7z/ni7VEg
	 TdziuRtmzuvdtkd1psBcBOrrL9puDR1LwKThnRl19IEPurNU4zKiO7l8vd50C4CKmWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fbbEG3gQeTzOUIsTltAH47maYBG1Ws8wsE+J4GEN+e0=;
	b=KoO3ypFdEM5KpU51jgF7s25bhBdnyt3911iVBYatcKQXq2oe2pM68ryg1ix1tg63Tusv
	 jjYU0hoZZD5/ITCf4HwIOB/31vpd/H3Bze0kBEAC4ci1at9PRnjsHeFTOIl2ONpuC9g2y
	 rFtFiXIoNVpNOIKxCwfxCoNelLBwkyeKhAOhA2Ys2VR0rZztMAVPOXG1ryRUIZ4paCqgk
	 zIMsPNrZNCffpgODuziSXyBd9Rq4lv0L3pjkuQB7Ia+x4ceAYH4uDBZBFeFoSW9TcyfNs
	 j5sQ+ORiyWTyknG/GaJwjsZtJcMivI66l92gUzxploOLeZOP4dRnz/xNy6SWCrh8Sbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+j3H3DU;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6758B606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6758B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+j3H3DU
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53cd0c8614eso16511441cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906864; x=1794511664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbbEG3gQeTzOUIsTltAH47maYBG1Ws8wsE+J4GEN+e0=;
        b=F+j3H3DUF7XihgOWTB8+UzKP+a41nWACjrgGh2kwbIrgOV4ps8NJpxwhBZIcj7NL9x
         iMpt6xOiQbnGOpe/J7wfRK7XsCFr4+mofGpue9Ipkb/ChvYpZyubXjXen4/hGsLlA2BJ
         HStoq1AmjzcUKKFo6GG3HpH4BE/QkACE20F0CINekOOg1dW/dyyzblHmXzlnclOOwS+1
         09/PO+5wBGHq3h9V3ADyxWKAeIi8GeW1trh8wzV82WQqGwE31m0jEBeC0Fn6ti/Y3jcn
         Uvye39h8CSc0E3WmzpyBjlpUfJMMiGKHqLK/veLE+FntjNSnqVt1HzxaWW40cevQskLD
         xAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906864; x=1794511664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbbEG3gQeTzOUIsTltAH47maYBG1Ws8wsE+J4GEN+e0=;
        b=PkqHf2rz4d46tpOKoSsmlXgFlxb/RngDX5WfJdsnoxxbUSHFI5YBskVyZjbdlV4Mos
         q0r8UkTuN47xn83uy5V6cz11y02ZpiYgxbv/kJ6859Kk0zHjKbb3ibOwYIzSngic4UGD
         60YvPma76PNWSJ/Thw83XWoksNxkuwk4/JCcNpPvYFrkaWfxPOBgIMD+kSiJPmNI2qfD
         x4J/ZbsQL6FVzgxPaAh2+NlFRO9XMMKL0q7f0wv8MyIeUHmbCsVC5kvxkbbSKHQs5jUl
         6sav/36RjwxeJrtUbQwpz9D45vJzir8UFcWcE3+KS1AIDSoqlFb5K3wyAW0H81ebCdc9
         TErw==
X-Forwarded-Encrypted: i=1; AKwUvBwKOEGMUtJlFeyaTOS7/N24OfV9pdUtfUMT6wKhgaVTqKXxsvq4Jv/CGDhcvGR5QQn2QC7pypvBBPYuIio=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l6jdg3gVBKLDUQuVwEqbrpkwdfRBgQmadQJ9ssoz2z4sBQtCm
	qe4QajLEugIodb8fj7bWjsHdrfBoWAxveAUa/PDfRa7JPt61I1/t2oUi
X-Gm-Gg: AYBFou1/+3fWM8F2uH3LxLBjZPwSyXDPqyMuHoVskcjV3+WDBCzze9yyAMI8dhcJ0DV
	0dLDdfrJc1k1rMxaAcig2rD5xzREjTW9KZkyXVk+PpKCbixTX6jt+Tyv6x5P0xS7NOQwjw17lim
	akXn0mvqfLVMCkHKrAMkZ4F0iaJ+6IbX9EiVSL0jGxzuYAeBVnhstPtg98BAQ6KRhYoQpL8+HgX
	qMZaYA0mHqw0MvwjpjJspx0E8kAIbz0N+kCSTSf+75567j6PBO++nRYlgfdtAWWu+f+hP2aiD7c
	Kyn+/+7LdZZlPODT7+JVfaxMnLRVwlgkw1qbZXnqKuhI8xYhUOus1Gizpy8YBmhmhZUPG9povRE
	w8P0I8ITYu4PkJ5WFCovK9ZlQeEcAxKBItuVFbmBQZ8aDTiaZxOKHSoTSxX6XxUeABfGQQ1bVUC
	Jptg9JUct8GdhgFLdj+xJ22Upj/nommxf4/90BRLIB0QK3kySpV9kCXlmFNH65EHurQbsQ+YHkw
	JAso9vta3yajy5Y3jAAMWRzZ8eX/e66GH19h+EkNEbRJvIFLIyX/lLshxxf5+9OYADUrFUYHguw
	wc3kTlTpuRlpShO2grObhEib0tQX3GojCiaYuTuWy/3cTx6Byd5emw==
X-Received: by 2002:ac8:5ad4:0:b0:536:6383:577f with SMTP id d75a77b69052e-54e15b66b1cmr4847061cf.64.1793906864051;
        Thu, 05 Nov 2026 11:27:44 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25785890sm925801cf.7.2026.11.05.11.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:27:43 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/hyperv: Don't free a paging domain the hypervisor did not delete
Date: Thu,  5 Nov 2026 14:27:08 -0500
Message-ID: <20261105192738.70664-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hv_iommu_paging_domain_free() frees all page-table pages with
pt_iommu_deinit() and only then asks the hypervisor to delete the
device domain that points at them. If HVCALL_DELETE_DEVICE_DOMAIN
fails, hv_delete_device_domain() only logs the error, returns the
domain ID to the IDA, and the domain is freed anyway.

The hypervisor then keeps a device domain whose page tables have been
freed and can be reused for anything. The ID is also handed out again
by the next paging domain allocation, while the hypervisor still has a
domain with that ID.

Delete the domain before freeing its page tables, and keep the ID, the
page tables and the domain if the hypervisor fails to delete it.

Fixes: 2690d4156b51 ("iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 with HYPERV and HYPERV_PVIOMMU,
W=1); I have no Hyper-V guest with the para-virtualized IOMMU to test
it on.

 drivers/iommu/hyperv/hv-iommu-guest.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/hyperv/hv-iommu-guest.c b/drivers/iommu/hyperv/hv-iommu-guest.c
index 876a22f21f1e..205c642c8d40 100644
--- a/drivers/iommu/hyperv/hv-iommu-guest.c
+++ b/drivers/iommu/hyperv/hv-iommu-guest.c
@@ -107,7 +107,7 @@ static int hv_create_device_domain(struct hv_iommu_domain *hv_domain)
 	return hv_result_to_errno(status);
 }
 
-static void hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
+static int hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
 {
 	u64 status;
 	unsigned long flags;
@@ -122,11 +122,15 @@ static void hv_delete_device_domain(struct hv_iommu_domain *hv_domain)
 
 	local_irq_restore(flags);
 
-	if (!hv_result_success(status))
+	if (!hv_result_success(status)) {
+		/* The domain still exists, so its ID cannot be reused */
 		hv_status_err(status, "HVCALL_DELETE_DEVICE_DOMAIN failed\n");
+		return hv_result_to_errno(status);
+	}
 
 	ida_free(&hv_domain->hv_iommu->domain_ids,
 		 hv_domain->device_domain.domain_id.id);
+	return 0;
 }
 
 static int
@@ -466,11 +470,16 @@ static void hv_iommu_paging_domain_free(struct iommu_domain *domain)
 {
 	struct hv_iommu_domain *hv_domain = to_hv_iommu_domain(domain);
 
+	/*
+	 * If the hypervisor still has the domain, it may still use its page
+	 * tables, so leak them.
+	 */
+	if (hv_delete_device_domain(hv_domain))
+		return;
+
 	/* Free all remaining mappings */
 	pt_iommu_deinit(&hv_domain->pt_iommu);
 
-	hv_delete_device_domain(hv_domain);
-
 	kfree(hv_domain);
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

