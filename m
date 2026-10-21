Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572005;
	b=HDnPDbB+tu/UDDZuvyqy9ZBgINTmEtp3OL560IT2LuIX8bsvs7ZHfjxCBi8xx+6QC1M/
	 CErb8ZW2k+CdsJRV9cS62woPi9GmJd4wr4lG9V6fkZ28JM/UxDmSdB5MvOJRcrvPj05YK
	 FWX+cM2jPFz4c8CN7FNbw3z7WTzfW/JZT4e21xC1TVtJhN26cP7U8Ie5vmgDPkJdXam8T
	 yMaoQu1ul/HoM8KK6rqqzNkm3qlb1wEDC9uQ03mnOhRhtLU5YQbSmD/lmB3fbRAVRgt5c
	 1g9iEAfRpl7w/AZIUpDsNnRM9cc+fvG2gmrNI+FC5REM1tLlFJ/UaAZuH+Og3XjuSmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572005;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=R3wC1JPd18KvPMWWOaNn6dj8NYQPZH/iR9+7PTFAozg=;
	b=0XmdoGFU5WKWD1yEHCqdvhnMY4QiHL0844sbOb/cWPVLLgSc0KbobGMD3dh0o6QA0nKD
	 et0ASETbcAV96EzgFewKA8bWLMFOWiRL3nrGUiY1SIXuDLN2g2PpyY9r+PeB2HcU9e83r
	 Zjx2xfQMJOqK44Z3cwav9Tkv2Pkj6tZOyJuLn9Es1IEOa7ESoWSzALyBBmx6gZp3CaQs7
	 aG1+v9RWLlypnFfDeZ3MdnGjtsMjxSl9O9MkPeSKH9zPpajdhbRnjZHeBJtivoUJYdpfY
	 nBsLL0ly/4IhR86pGzTIyHeiX+Q76gI62jcvIZrsNwfmeAAXNPZSuTDHB3IwQdlIsHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=RrD+Fnjt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qBgqKCYl;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4360A381F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF4360A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2 header.b=RrD+Fnjt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qBgqKCYl
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 13968EC0235
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:40:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 21 Oct 2026 04:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1792572004; x=1792658404; bh=R3wC1JPd18
	KvPMWWOaNn6dj8NYQPZH/iR9+7PTFAozg=; b=RrD+Fnjt702H5uTiBWvupeXSZj
	qTdyIvI4zz1GeM7WzQiSIky0Aul9mzU2HviWFZCDPZBXxDUyrSdi0HCwDahPxuBb
	RmZbxwvvEbRrgPaosKThAfBpG0CeyC6lj8B0q+Ph6uu1VBYqdaIEben64OUIORE1
	nN5hjlggnMKOtJMkbV5njmgV/wkBnoLpHDUwvJXu722i3k3mGoP8S5IQ3JRPtskL
	TBxFOmz/2Fdw+s5bT1jx6YzUA5XhsZVqQKO79ROZ115rHMg/eRfsUf49EKa/hi6r
	379E8lTEKiUK6v7I3jmXco64Kr/TXSr0htl8DwjW+dimmWYxBKbHq/gy7ZrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792572004; x=
	1792658404; bh=R3wC1JPd18KvPMWWOaNn6dj8NYQPZH/iR9+7PTFAozg=; b=q
	BgqKCYlP/QpRKUTOJcxDIDbuHLKa+TDNXnyuunR1PZMe68qbGJCFjeubrc+AeFRo
	Wreyw0eR17heWm8+dvvK7PP8qfAkhG630ere3WI2u095nub9bx27AGJudMZe51AE
	FpX4SdCo/92YhG/YtrgXeNRDF8gqGtE6SW8HQnenDUcNAHzePaCskDYzMzU/OQL7
	JKgWZ8WDBZfSjRoTVb78qEjwgrm/f/Uf6+3nTliUH7F3KnBdZ9P+4poxoN9gXt1a
	r6hRshnWSnCrDWcA9GKit3x2dViCKolnzzVqmQYa40uyVqujKcddYpt2DIKjuQIx
	2G1/foMEGUU4G1dhB1ezA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792572004; d=invisiblethingslab.com;
	mf=PHZhbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:PGYI/+tRqE/bYo2brIf4s2Aiag1kyGSwblHkWRypBhnM+xL
	oqkRSbZpp9tjDOPiGfWAkQCqrtEieLWjK6LC4wkr3uvXvuylpudgbiX6+fL+319F
	PJeppBS/Lv739qI23Xz1oX8ggjdXfS5jL10ixgFN1Sv9tQFzeSykB/GLUiyitWmu
	4RgiwcFMFOaJ3RUlF0ow26R/PqjvyaVREh7/1JhhcoexF2jn+/pAqI9XWRp+D9PB
	33kfvDH8NjlsJLpg69qs9g6WQP8bRFstl0OcHEgpiFzJgPOvi5qPPPUMqHXhPa5k
	8pz97cb+dka2YfH4GODZZ3P2BBUoC3EmV2ewQLg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:y26MGpA102mWR2TadjRDKL1Mv+2OFyq71aY+/6228Qc=:a4kf+vVraiqrr1PQbOh4rjyht/6Hl0n1XbpxcyRmQbY=;
X-ME-Sender: <xms:Y3rYasNt3gWyGEymAOeCJcEkrOLFirTPmtmIIiRa3HWSakAsUijgOA>
    <xme:Y3rYatD4_zibLhLwnpvdKiG-bnwB_D4QHvB3sL_taE_aY9sRdiMEBKstgWOrDtDKx
    Pdj-CMSsXz_D0p0xuFnxWjAdMGJSvR-PDMMZAssgt8Xf0A_Tx7a>
X-ME-Received: <xmr:Y3rYaoMc8gvQTyH1MyfsvjQ9W_wv-MVMAEvgv3r-cdQfmcFoLIuWTJuJGL0u-WqWlmDUE1_gfYRfydGyRbPJ6Sj5uEVhiMUZqUjNL9bRWAmMPTrnNXWo2k2NiQYfkA>
X-ME-Proxy-Cause: dmFkZTEPpr9PTmsu9mAqZaSuT5MxI2aubm3CsxGChrzKRK91OcndI/l7tJu+NMEFJuF0DZ
    GIiG+h5CR2GBKlA0T/mp1bK1eBlDsJyhFQghHgjGPJfWYZdhrTajibc3jm8S6Oux7G0ma1
    rqzQ2K5cDJrtFRlHSZ6HqUynScBfpM0jZYeQjV2P472PAQel6yNLh5LOSuLqRkCVXa+OcW
    6BEdzTV6wF3MCTJQ7+niRd+bRSEMLL21FPX1EAjFDCQqxTUOlBoYC3NrdTEhVBgQ1sGASo
    YJvaNNZQyZowva7JsrV36YyECAepm1VSeuwjTLpifU9a7/8IIN9f6oPhmhrkB4GkQTMXc+
    9fxZv+qBLXsS10fDy+9tbFT/wSmfwiQ3K0IkB6M4VK+q6uK0Wo0J9O7U0CprHzp5+majco
    4mhA+LxWbAL03Il8PU0dIYFegZjLGdsjFmTwbxX3BCRN0fiDOoQSDOkORtv3Hg3pv2VC04
    +uxHK7PcSg4r+glfexNPOsI512jurmnTBWWaETwx8eACwmps269eZZinLYXAYiI40PCMyr
    ocVFchvE8Q6lopsx4a2oENuCVve/R3oJnbwyTcJvkPV3oHxoXCqaFo0j0gMl/X+7pzLrso
    qFhKZc4TVnFDXNd/GG11Oto6XTWfiF3+mPa+tO612T1TpV9nJUJqrhGOGFjg
X-ME-Proxy: <xmx:Y3rYase4Zfh2QIGcdVn19qr9dIhRkpVcLiAPXd428GieotQAemiZvA>
    <xmx:Y3rYah5qjK6Y-oFesMZE1iP-zL8ZIIylEbR26RabU5T1VBISgSvS1w>
    <xmx:Y3rYamJwPxhICz5VeN_UEhmz6neeaPUhNDXNlleA0tU2k0wd71_1yg>
    <xmx:Y3rYajUt0xjIJciussFxJTb42_lt_9-5iWyQFT2ObNfzifgHyxaSUA>
    <xmx:ZHrYaoVs9OfgGCQzYodvXhDgaOmW_YDXKoWffSp6hb4lqHR6zRA7_Gxo>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 04:40:01 -0400 (EDT)
From: Val Packett <val@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Dongwon Kim <dongwon.kim@intel.com>
Cc: Val Packett <val@invisiblethingslab.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] udmabuf: Fix list length overflow check
Date: Wed, 21 Oct 2026 05:39:11 -0300
Message-ID: <20261021083933.1983894-2-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021083933.1983894-1-val@invisiblethingslab.com>
References: <20261021083933.1983894-1-val@invisiblethingslab.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The udmabuf list length limit was made configurable, creating the
possibility for integer overflow that was not properly detected.
If the system administrator set the udmabuf.list_limit tunable to
a large value like INT_MAX, that would allow udmabuf users to submit
a list whose length would overflow the u32 length variable.

Use memdup_array_user() instead of raw memdup_user() to make the length
calculation an overflow-checked multiplication.

Cc: stable@vger.kernel.org
Fixes: 2e717a55982a ("udmabuf: configurable list_limit and size_limit_mb")
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
 drivers/dma-buf/udmabuf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd0046242..654ebe7f6b3f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -470,14 +470,13 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
 	int ret = -EINVAL;
-	u32 lsize;
 
 	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
 		return -EFAULT;
 	if (head.count > list_limit)
 		return -EINVAL;
-	lsize = sizeof(struct udmabuf_create_item) * head.count;
-	list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
+	list = memdup_array_user((void __user *)(arg + sizeof(head)),
+				head.count, sizeof(struct udmabuf_create_item));
 	if (IS_ERR(list))
 		return PTR_ERR(list);
 
-- 
2.55.0

