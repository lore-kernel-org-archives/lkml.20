Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714643;
	b=pedlZLXFSPkewfkK3uH3+3LIE+0ZnvRDMrcHiWUY2/8TxZF/Mk9AC2jEIZS5rZmmYqY9
	 b8kGRSy/naHJ5i4nbpDp2QZw8jMgMC3dEZHTlFEbj65iwzt8DU09KMzEZKvSYkOm4i99f
	 xK6VIrwUszfcLsz8SBmXtPq4gZNbQwTwpOupVxOdq2t5zT76azf8SZ3Fm+hLs0kaNJO+F
	 nuGIX5267EUI+6EcUDJkFP0IU0YYqwsITnXamAi1F9h26hrbFE87q5A2oS6Z9hBIfZTDF
	 OYN6lHhlCCrA3E263GbypJWE+YdZ7vTxXkL0Hf3dC+fBo8Q77q6hjz252MJOLeB+T4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714643;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=m8eClOJBMhf72fJLFIoN+wxoKK/2oma6t1vRDNte5XY=;
	b=S3ifXtBPw6QaZVzqA+rAGclcBu01J2Ny9Nv2WA0IargLpKy67x4HKMho6uzyKiL7ss2s
	 Hv8wMD4DgVybHTT4qXHhQ1LnuS+8Bt8UbYUFI1lleIL5EOKM1ohHZjECqVvaFpIfcFt50
	 3zGvi2EUKjoq+ixnXe6JAMoTH1VqKgdq3FOUf6qQe9CJe6sUcPMfgdJspqSFguKC+Pflg
	 +zylZ48HOOQ8f+TFk4U9Pblrb9oW+xlhFcr+CUfbDvxLnY7SnUDx48LjRXIEgdDnljpHZ
	 186jFK4kpYJyMI6zfHMUjZ1nWehTqxiFxYh/Ec57MGPI2ElFLl235LBxqvsTFt7s1uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="Za/7n3lT";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D31606EE9B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D31606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Za/7n3lT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=m8eClOJBMhf72fJLFIoN+wxoKK/2oma6t1vRDNte5XY=; b=Za/7n3lTRA8pVSmUidbanNlX9x
	Iw014mIR7m9/BRQz+JbV4bsTpB6wDNSwYNpb7uCmCv2lNjvePcVsAwCLhEXkOgn9rU/fZtWnuDnUH
	agH2ubBdakyMqQMN4yapY/PONrLkZ8W/hgRtE4kSHrDzxUbs04/g0+PRIKB2mjKYauwY632PGp6wi
	LBxEVS7OzeUfnkTKe3rqPCU95wu/LIHA2A7Vhgn03Zx467MuoZ0wCUSbHlmNcmaVHH1dmIOir4jB1
	aERs5OK2VgSv1hdRTjEyF0ZuZCtp/sdhNesGA2xrCnKqK9xUJJmLyapSvWmsfqHuv03aL2Hk2DUeE
	snKWEZLw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOF79-006zDA-0Z;
	Tue, 03 Nov 2026 14:03:51 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 06:01:56 -0800
Subject: [PATCH v2] x86/sev: Fix kmemleak false positive for the RMP
 segment descriptors
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
Message-Id: <20261103-sev-rmp-kmemleak-v2-1-9c1ba28cf7c5@debian.org>
X-B4-Tracking: v=1; b=H4sIAFPp6WoC/32NQQ6CMBBFr0Jm7Rg6xpq68h6GRQsDjAglLTYaw
 t0F3Lt8yfvvzxA5CEe4ZjMEThLFDyvQIYOytUPDKNXKQDlppXLCyAlDP2LXc/9k22F+PhltbEm
 KNKyzMXAt7z15L34cX+7B5bR1NqOVOPnw2T+T2rw/+aRQIevaETuj+WJuFTuxw9GHBoplWb7aq
 r6VwwAAAA==
X-Change-ID: 20261102-sev-rmp-kmemleak-053969ac2126
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, 
 Nikunj A Dadhania <nikunj@amd.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, 
 kernel-team@meta.com, Dave Hansen <dave.hansen@intel.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759; i=leitao@debian.org;
 h=from:subject:message-id; bh=YHG4uUqHn2DGTtc2QvLc3aO/usHzyPX1g6bQeXU2Ulg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6enDJqaMVrhrmo0JafUtxqMdtzftVX8bGyYgF
 pB0/3MGgZSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaunpwwAKCRA1o5Of/Hh3
 bedQD/41mawsP0+OSFDOhr4DOoTJOPymVdYgHhPtZ/Az/jHr4aMNwmNw/pw2AOu3KkJT3VR3kEz
 65XUJ1i0vT+JkmApeULbty9YgHy8FqmSvYOc2aRa8++adlSg9MEONpIBqx9ZwMJ8Mnlyj0p+mCM
 aoo6wlpWU2iainDH1HQYSyOx5toFo+KuOLw0/AjzuEqueUPXuYykmGGXRbfVO9Gbs0y2tD9sBXY
 Tp/+tk5IorIXsOJrqIRRQJN9M4rlDkq5ZzRMKQ4FQvyZ+5tS/OoKXCbXLGwP2jqbgEv/jm86Pd6
 i1Au0YYxiQNBGDPFn1bhZHY+Xrf+pHEXxDua6IiC/08NifHWqZAO4hgGiwTO/rpRD0/N7Rp1n1d
 q5i82hRHl0fVvbBRq7I6g72TyXYsBUHQL8BtMH2p1Ioc+UNFMmA7UPMPMm2dflfskLDqbNm4Nwa
 3Vuaa6+ql3pliycJrDdiP/ftRx9ood+36lEQrOtzf2KiwV+Vb9wtsbDXX1DrvZmLDEGtZcvfitL
 4sS5IURs6njxaMiBkM9ynZXRE61lMs9lKH4WbmZXo8RQAQadhfyTjd72wD5jeIz1tbC0ne3a6yQ
 duUUjIWKWComhFFw6MrQKLvnNI08YqRX0qXllFBb6v9Ge+WH/qmZ2tUqDVs0vr0rTVxaqtuwrOv
 gN0fKLhhV2EQUWg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

kmemleak reports the RMP segment descriptor as leaked on SEV-SNP hosts:

  unreferenced object 0xff11000140e23b40 (size 32):
    comm "swapper/0", pid 1, jiffies 4294680964
    hex dump (first 32 bytes):
      00 00 00 40 00 00 a0 ff 00 fc 05 04 00 00 00 00  ...@............
      00 c0 5f 40 00 00 00 00 00 00 00 00 00 00 00 00  .._@............
    backtrace (crc abf63fca):
      __kmalloc_cache_noprof+0x2e2/0x650
      alloc_rmp_segment_desc+0xdf/0x250
      setup_contiguous_rmptable+0xb0/0xd0
      setup_rmptable+0x13/0x60
      snp_rmptable_init+0x45/0xd0
      iommu_snp_enable+0x77/0xb0
      state_next+0x184/0xed0
      iommu_go_to_state+0x3a/0x90
      pci_iommu_init+0x32/0x50

The descriptor is still in use: get_raw_rmpentry() reads it on every RMP
lookup. Its only reference lives in rmp_segment_table[], and
alloc_rmp_segment_table() takes that table from the page allocator.
kmemleak does not scan page allocator memory, so it never sees the
reference and reports the descriptor as leaked.

Nothing requires the table to come from the page allocator, so allocate
it with kzalloc(). kmemleak tracks and scans slab objects, so it now
sees the descriptor pointers in the table.

Fixes: 0f14af0d1d7d ("x86/sev: Treat the contiguous RMP table as a single RMP segment")
Suggested-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Allocate rmp_segment_table with kzalloc() instead of registering the
  page with kmemleak (Dave Hansen)
- Add the Fixes: and Suggested-by: tags
- Link to v1: https://patch.msgid.link/20261102-sev-rmp-kmemleak-v1-1-e6fb2eb96e79@debian.org
---
 arch/x86/virt/svm/sev.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index bd70c4d0b774a3..18141c93b6d7c8 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -361,7 +361,7 @@ static void __init free_rmp_segment_table(void)
 		kfree(desc);
 	}
 
-	free_page((unsigned long)rmp_segment_table);
+	kfree(rmp_segment_table);
 
 	rmp_segment_table = NULL;
 }
@@ -369,14 +369,10 @@ static void __init free_rmp_segment_table(void)
 /* Allocate the table used to index into the RMP segments */
 static bool __init alloc_rmp_segment_table(void)
 {
-	struct page *page;
-
-	page = alloc_page(__GFP_ZERO);
-	if (!page)
+	rmp_segment_table = kzalloc(RST_SIZE, GFP_KERNEL);
+	if (!rmp_segment_table)
 		return false;
 
-	rmp_segment_table = page_address(page);
-
 	return true;
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sev-rmp-kmemleak-053969ac2126

Best regards,
--  
Breno Leitao <leitao@debian.org>

