Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638191;
	b=cuwNJRwmzEdQV0MRvUu6nMnaRg6jS2LCPD4LwFgDan8pEqyLDVFLXtzyj8RMpt+b0gna
	 4y0+Mf6iNrciNHXzytuJQ8KlZqkKNgSWZLMIopjR/f73NorI5e2nFioal/jAyq9hef9++
	 OcA8UzsfLV8wTjNlmqwYx8k13LEEKpRPLm+6Agpv4FiNX8zZsQeMx4ZLsZe8aMCqph9YL
	 z4NdiXtdw+9g7H70iue2LWAK2B773ZMKTzDRvviKSbvdtP0vxuf0mbMPiuN5CmdIPKuro
	 Lg5HSW8wm+FiZs9q0h90IgeTu4zyOZsagPmVRU2FeFQzGl8zLDvPth35vmMQJPS5HNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638191;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=qPCoOsumpjMP2E0szWRq10e3ThrnMjRyH/pPWSsshCw=;
	b=0I5PcxxJboC6oKC2FFHNogz2ogRx7Iwi2+JvK+wgRKYEZqBsWuBSC4Zc3Dr2oSgTfHIO
	 0gSd72zBQLywzAl32RSRM2fVI2h3F7+c4Mab6gnqoYc+lVtTrMN/Mx8hE4viEHIIK0Yul
	 DcPIed5MbS1fd/NHpwInh1ul3CLZJKZCmkJo5fTGOtNF4Er3Pln8dQ8BwZFuKqYz3bcZh
	 cgrYT2WA56L2kjhjo6QGjmb2wtdmQfHUH1YIQE8Rk4XXkesicclfmHWe3NDqMeACe/QTm
	 nP6Iq//Va/OpCfk9T7K5dKMckYSXUazcjEs60A3jUy1Ame/BecUtIpXSlRdzgXoxSGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=EBGl9Pnt;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF706076F95
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF706076F95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=EBGl9Pnt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=qPCoOsumpjMP2E0szWRq10e3ThrnMjRyH/pPWSsshCw=; b=EBGl9PntM8bwekRqcrleQsdxMp
	FryCGh7HFBfulUD8lNcqWmi9HEChFjvP8R7OK8wOf4Z9TalTh+lO7W39sMangNQjxFEnowQuQgkLd
	IR4u5bLZiE666HkzDWgX8Sk0yhRxcsDLPS6idTkd357rw9JOtsv5QW7v7feddx1NFbbXwBPAXRPmk
	VxaGiSSFAJvmhS9vHOwDW+JnPu+ySZYJJJi/UgIf8ibrK5TQqt5QJBQwBTxlnUwtHFnHXoiHqyvei
	unxLQanCgKDVUhKUpksrIt9qFGyVKUzXLhZHktlwI0SGZSGlYAOEi0hSHy5iyM1yvc0oSTvAVsTqu
	KPDIG8/Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xNvE6-006IJW-0I;
	Mon, 02 Nov 2026 16:49:42 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 02 Nov 2026 08:49:37 -0800
Subject: [PATCH] x86/sev: Fix kmemleak false positive for the RMP segment
 descriptors
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
Message-Id: <20261102-sev-rmp-kmemleak-v1-1-e6fb2eb96e79@debian.org>
X-B4-Tracking: v=1; b=H4sIACC/6GoC/yXMQQrCMBBG4auUWTuQjBioVxEXMf7qWFNLphah9
 O7Gdvkt3pvJUBRGx2amgklN332F3zWUHrG/g/VaTeIkeO+EDROXPHCXkV+IHbvDvg1tTOIlUM2
 Ggpt+1+XpvNk+lyfS+P/QsvwAjpBVHnQAAAA=
X-Change-ID: 20261102-sev-rmp-kmemleak-053969ac2126
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, 
 Nikunj A Dadhania <nikunj@amd.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364; i=leitao@debian.org;
 h=from:subject:message-id; bh=W+1vV5Ug65oqAApkeEnK2Q/D96RlyFgRbi3NR5UKTss=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6L8hxvVrrlAv9bBuLthw4Z6UtjBveV0ddOQGh
 5qd+wLUvFOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaui/IQAKCRA1o5Of/Hh3
 bSRGEACDXRxcFmjQZhVlvCw/xVGj8YR4g4vLp23L9STr2YQgWOlFcvECHEYOYIV9Z/Wk1GRwHvS
 txE78MFiYy0gQ7slz4ty99TYDS4Dh6fSZu1lqEgyXWSSiWaoNWadJzJpD/9AeOzckSA5ZKBGMHn
 17+wNf/YsS/tv+6JivD9cDnHf/nQedMS4KKgBbmtVM4xlDfkJtzsVHt2bRwd5CNjscVaUnIoTC3
 QSY/oZdqGIWrFefCMDLuLPmwvb92svRRMzT8rHLTtJHYoyYBxpIRmWHG04rL6iCH/8wNIF8aYT9
 SVVOIv9Gl6WTzmQvE5R7/kyQ9mbKsRJBF7Gmw2nJmAeGssjv3QAdiQgoxONR7WUCbcOH3Y9kYIk
 eNo96auYXqvVrO50S/I4HvzPYZswFvKjXliyUF9z0Y+bUMzff9WLS8b2bQiZdd6kl8t1W4oXc5o
 +X4P8rNES3XXGtY8QHcr/+xb3saMGTLrnHfHn9OvO1PiuXdulp3IPVP4MWQSMGAky8kO3IOFof9
 Bm2Zl5NOP/SfVhTsBQlPiWcACfrazBwJjrVmUZjLz443kIEjC9bzryAbCY+GhVl01zdAfjvo9wW
 yJf5gtw+LYm7qy/78/B6AdzmI2BmGjLBO2OSLoFOFdNkQhg8UShKTk68P9vQQmFkS6oJJWFT8YX
 EzyWFr9PQ3F/Axw==
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
reference, and mark these segments as leaked when they are not.

Register the table with kmemleak, so it is scanned like any other
object.

kmemleak_alloc() registers a block of memory with kmemleak, so kmemleak
scans it and counts pointers into it, do it with rmp_segment_table.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/virt/svm/sev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index bd70c4d0b774a3..751ccbdfeba98d 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -20,6 +20,7 @@
 #include <linux/amd-iommu.h>
 #include <linux/nospec.h>
 #include <linux/workqueue.h>
+#include <linux/kmemleak.h>
 
 #include <asm/sev.h>
 #include <asm/processor.h>
@@ -361,6 +362,7 @@ static void __init free_rmp_segment_table(void)
 		kfree(desc);
 	}
 
+	kmemleak_free(rmp_segment_table);
 	free_page((unsigned long)rmp_segment_table);
 
 	rmp_segment_table = NULL;
@@ -376,6 +378,7 @@ static bool __init alloc_rmp_segment_table(void)
 		return false;
 
 	rmp_segment_table = page_address(page);
+	kmemleak_alloc(rmp_segment_table, RST_SIZE, 1, GFP_KERNEL);
 
 	return true;
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sev-rmp-kmemleak-053969ac2126

Best regards,
--  
Breno Leitao <leitao@debian.org>

