Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936712;
	b=GTf3kSGB4rsOSPPU+DvUCLIcOR6x7us+6gXRuirWVMStVSwRbze1zh80dcFVdyErcUvi
	 9g5c/E8M+eWNnHea3JhoT/TlvJf8kJkULJvikN+7GlADFT2qYUSB9wFim4knD+sl5mUFK
	 Pw8SdxQqp4hdX3F3srVgnPdwyKDvy643twE8pvr6Y+hTMoZpf7VAbQUe5xkSVmPrDu5m7
	 p8ijHpSow1K32wCSPXobcY4GKOo9/4/U/jbkqhl7zZGe2MYGb57+jkfJ/lxH+Ov3i2GXF
	 YfgPbJU28kZLmyUjihnhLLlr8ZVG4x599igSnzWcZ2zxAFa2v5rc5Jzsydh2DwQN/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936712;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qa3Jdd3z9Vvc81S3y4DHQHJ7zKHZJOZDq4QmheJddA0=;
	b=5UXStMjlOeyNYZvfh5cCmHaYrcBrGKNw+megm39p2VEwcOea6BmOkSpbirq2nfOcGQuS
	 6kVj/z/qzpkKhz1FKpKRLDmXMw90u3gtgRIwOJNTmwX0a/uofk6AiB32AuKXWxUkgfOyZ
	 RFx8Bo+CNoOnWG6EmdwbjW2h6M3yb3TomrAcH18uzN7MkK/sdQjZ+e3ZxoSeMcpBgEEwQ
	 3MDM0q2mK+j9g05x9UYhRYqd5Creb+HR5KGrnkUFvGmF2P5xx78uc1dcy3mrE9ItGX1TG
	 Qg1iOZH9VhGp0gd5Ye4IDnNBX6+wehtJzFMzmZTwE+5RzW49InJSmxqDFCtg/w0Gq6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R1AEfjq5;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E726606A32D;
	Fri,  6 Nov 2026 03:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E726606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R1AEfjq5
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793936701; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Qa3Jdd3z9Vvc81S3y4DHQHJ7zKHZJOZDq4QmheJddA0=;
	b=R1AEfjq5XbLNaK7A6moV+lNZD1EtvI1UEXlLf6hGIXu4q0bde1dZXma2LddMefjngiK3EP1br0VHrNs7fxN0gBXGZ652QkmYV/+X9mmV4HbQITvxrxMNrXvzwoG/UwBYdDvQKjEvQwduNF772bEIC3RxPXY3AeIMYT/KBGSR1pE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XEAF1-._1793936691;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XEAF1-._1793936691 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 11:45:01 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH v2] EDAC/amd64: Fix double free of private data on registration failure
Date: Fri,  6 Nov 2026 11:44:37 +0800
Message-ID: <20261106034449.1659689-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261106000205.GBau0Y_faMvFp2_fM6@fat_crate.local>
References: <20261106000205.GBau0Y_faMvFp2_fM6@fat_crate.local>
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

If edac_mc_add_mc_with_groups() fails, init_one_instance() calls
edac_mc_free(), which frees mci->pvt_info. probe_one_instance() then
accesses and frees the same private data, causing a use-after-free
and a double free.

Clear mci->pvt_info before calling edac_mc_free() to leave the cleanup
to probe_one_instance(). The normal remove path already clears it.

Fixes: 0bbb265f7089 ("EDAC/mc: Get rid of silly one-shot struct allocation in edac_mc_alloc()")
Reported-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
v2:
- Explain why probe_one_instance() retains ownership of pvt on failure.
- Drop the stable Cc.
- Add Yazen's Reviewed-by.
- Rebase onto ras/edac-for-next (28f141ff14c48).

v1: https://lore.kernel.org/linux-edac/20261021062925.1838750-1-tongweilin@linux.alibaba.com/

 drivers/edac/amd64_edac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index a8e76a79833b..d4abc5200ea1 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3973,6 +3973,11 @@ static int init_one_instance(struct amd64_pvt *pvt)
 	ret = -ENODEV;
 	if (edac_mc_add_mc_with_groups(mci, amd64_edac_attr_groups)) {
 		edac_dbg(1, "failed edac_mc_add_mc()\n");
+		/*
+		 * probe_one_instance() allocates pvt and frees it on failure.
+		 * Keep edac_mc_free() from freeing it here.
+		 */
+		mci->pvt_info = NULL;
 		edac_mc_free(mci);
 		return ret;
 	}

base-commit: 28f141ff14c48abd38518a87d1026851dd12717e
-- 
2.43.7

