Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674836;
	b=k/WTmtnnex0hFZ0HQ8CjDNDF5Tq4fYCc45RYSjCfQePHt1AZfckZFFcXMzF2/H9ptyeV
	 oX5gA4ddwsQlTDK833dILnTNaa4MBawvAi9cHPvFi2poHBjaW8cuDDTi3qo37ebZGMz9s
	 zl4IuVbgVvJitXwYqqOteMaX6YCGK3wSycFekRIc65YUmZoX7tBGuOg3BBO/WXQSsuo0I
	 j7fe465aZ3K+vJxfOZS1dqQsAwRRnUoneS0lhX5uVjEn5tFORdRob/Mkp9fdpbXnaYm98
	 aQmPXW0FY0DS2xW2I4/Vm0Pw4+hwYvUbYua1LrpXbrKOCX0xA6Jj8HO41ucyZvsPBVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=4orBA17LG+6yMhJxEwoDee1XxS6KoCjmhb+0Rvf5Gtc=;
	b=ySnufhbfLu5S3jQB0ljHaWO5e/Us0y/f0CjcMMquTFwAES1XEv52ekv3H9KzIoD2VUEQ
	 AY+a+f5z0+n1uUUCB+wZg7XIzumkSKGTvzkadGSMIHy/8AjXnqvI63r5aYMmEiDyztL2T
	 cSEkTe8hZ2DF6xwqLLoTxkV9mHIybFVzRmnp+ys44JDjP/5/PDwvI2G/G66zuX5jozlQe
	 E1aOd0M9a6z840ZPVDlmbBjWo4bNLHece8TzX54c3l1+DchaJHSFlvuIYaogfyMC+e8G6
	 Y7c4gH5W+QW4NLjGdxU8/r6TJcqoAbGmb50cXT+rX9qCWxrbAD2dcNBs86s8R3klgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=5GANXBKY;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741160A2604
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8741160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=5GANXBKY
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jRg5Q5B4dz4xPSF;
	Sun, 15 Nov 2026 00:47:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794674826;
	bh=uy3aECGD8Sfpa0HTsqpqvXCqlYoBtRbnXcj1FuuqDpI=;
	h=Date:From:To:Cc:Subject;
	b=5GANXBKYm/HTQXaAzQLIUZTK7QnM+2TZQDcz2vgzNUlwU9D+mnWFErG9kz2kW/kLR
	 DPnSnfrZhrTQR1Z02T5u0XhhtqGdO+WiXuYST6UgwZVxEfLPMzk4VtY1rkweNPz8Jv
	 Y/1EFYeD5NG8XWoUs67D9RnuCWVw0dZnPuxsl63wdE/MVXrfsbi6OntJY/Zk3964f/
	 D1JyqvCTtOmwP9kRDOpKF1RPrLpnEh4R2VjzrhnU0iw2T5j3Uq5H+ykBzhd55WRUoH
	 Jw5E6NoGc+ZR7KOchHKHfgIeluTBGca4pORhAr5I5jxqz0rSHVBinRZ9pYeWIxsDVC
	 nkcGbnbnKQtjg==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6AEGl4JO089813;
	Sun, 15 Nov 2026 00:47:05 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 00:47:08 +0800 (CST)
X-Zmail-TransId: 2afb6af8908cacc-33a99
X-Mailer: Zmail v1.0
Message-ID: <20261115004708909xx05JgB9nXnOCG0zL7h_K@zte.com.cn>
Date: Sun, 15 Nov 2026 00:47:08 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <akpm@linux-foundation.org>, <david@kernel.org>
Cc: <linux-mm@kvack.org>, <virtualization@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtbS9iYWxsb29uOiBmaXggTlJfQkFMTE9PTl9QQUdFUyBhY2NvdW50aW5nIG9uIG1pZ3JhdGlvbiBmYWlsdXJl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AEGl4JO089813
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 15 Nov 2026 00:47:06 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF8908A.002/4jRg5Q5B4dz4xPSF

From: Shao Mingyin <shao.mingyin@zte.com.cn>

mm/balloon: fix NR_BALLOON_PAGES accounting on migration failure

A balloon driver's -ENOENT migration result means that the old page was
deflated but the replacement was not inflated. vmw_balloon returns this
when its deflate operation succeeds and the subsequent inflate fails.

balloon_page_migrate() accounts the deflation and frees the old page,
but does not decrement NR_BALLOON_PAGES. Each such failure therefore
leaves one extra page in the per-node count, which also contributes to
the Balloon value in /proc/meminfo.

Decrement the counter on the old page's node, matching normal dequeue
accounting.

Fixes: 4d689474e1b2 ("balloon_compaction: update the NR_BALLOON_PAGES state")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Build-tested mm/balloon.o with W=1 and CONFIG_BALLOON_MIGRATION=y on
x86_64. The vmw_balloon -ENOENT callback path was reviewed statically.
No VMware hardware or hypervisor runtime test was performed.


 mm/balloon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/balloon.c b/mm/balloon.c
index 96a8f1e20bc66ae46a571a4f51243789bb362925..44c211ba8e6b0b86236ec0e05ca1eb4b9c444a8e 100644
--- a/mm/balloon.c
+++ b/mm/balloon.c
@@ -313,6 +313,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	} else {
 		/* Old page was deflated but new page not inflated. */
 		__count_vm_event(BALLOON_DEFLATE);
+		dec_node_page_state(page, NR_BALLOON_PAGES);
 
 		if (b_dev_info->adjust_managed_page_count)
 			adjust_managed_page_count(page, 1);

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0
