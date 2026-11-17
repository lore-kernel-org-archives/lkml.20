Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919583;
	b=a0YZ04FVqyVJ/YtptVpeK840Z+t4hGkTvNQLgrBeeBBw2uLwnarmJvbpDVKMAbT/lFHg
	 /4XRicCrr8EULGID8hAgRH/zEs9o627Sq+/PXgsvSdtp7lehIg+H3op7V6h6tOj4/9OnR
	 86KkhA85frEKzuUrxBLXOjC3uU6KhCa7aKRqqaL52buQ2GEg6prmPNbeN83oXoPJOa8Mi
	 beDxev427FjcT5aRCZnnXcpvztk1B3y5eJPatp/PuHmItlccTIt2HU5klSlNh0bDTn8lR
	 1Fp+jDfE19MQozsstKqJ1BcF4qsqnN5Mbs9COwI7Cz0UDz5gL3gNSVpSMO6xIdAPmVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919583;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=YnxVKAW4+DdAcyfkrcKJtarFPNPOGVQzKeTY2Yur2CM=;
	b=hm6jWYjQ/oFkEaPTIHw0cgGgRxfkpf7VXuRn05GSxi4whJuFf/raLzsEDdSKBsVPUNqq
	 MpW7BbIAZf5XpXGFZd0lqfPPxoGszrsEJpV2NTxmrnUoRM5dnQh4A+2pzIKCT8nTDw2Nl
	 6E5zfsueopp/AVQQ8jKDZW/q2oT6dw/RhOwFuxsMJdw+KAwGZWiDoSx+QOqCpSTqBtCBc
	 /W6gzEr1fmpft6gmfH0lWZunLwBU+Hviy1FLljoeH0RXnemrp7hmcSprYxmhJ+bFA5tfH
	 5nakJMJzUHuhiZ03lWVkjwpbVV+EkfT1DQv5x00e+2afvL9W+RM+O2wKkDNAag1SCfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FVdHXBU9;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lFqzxq0O;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AA9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AA9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FVdHXBU9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lFqzxq0O
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 60CECEC08E4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:46:21 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 17 Nov 2026 07:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794919575;
	 x=1795005975; bh=YnxVKAW4+DdAcyfkrcKJtarFPNPOGVQzKeTY2Yur2CM=; b=
	FVdHXBU9EAHNkmTDKyYCnzi9b76B81eb0z7i0qH3PcPWGKFs/WX9W6JNJB4ToM+p
	weKy6T6F/+oFsSSDlPwae/ycxVZEjjjIt4WT6/eiD7aYiPkuIMSN1IOEhudtsc9w
	T/uqUaix7qCCqNbG1UUy1d05XBWTrNiGjE8kwUwpya16R276DXaL9o+rGTfXH3YW
	kBQQdgquU8Etnr2C3wRIH4+aH7UmzATRGWuusnVXaVrzr2mBPH3hYG78nu+Jm5HH
	oDt0SKqmvOnai6Ufj5lslD/w3uEhW7ZmvJuTgg4GyZBm9MimbFEhBrF3sJVhdRwj
	In+I822lYu23bBw6szr7Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794919575; x=
	1795005975; bh=YnxVKAW4+DdAcyfkrcKJtarFPNPOGVQzKeTY2Yur2CM=; b=l
	Fqzxq0OIGtcTJH+Ayl9lhXsRi4hQonAG7Re7Lh1eS4Hew8SM7l7LGNux2pOHaLBi
	In8QgY7CX8YGfoIEY4FUv2xckMaoLoCXeWbDdI3RBWuAMA7WRtFGDLKHXi1d9He3
	HDC1oSzw1iUTB4rSAvYTnkGmY7+UfefJS4s3sp44lnOszLyp/v7tw0lYFyZNWyHA
	OQ+2NuhXafiup/56PJQk6jFklz/spItSyy+ij+OSp1Tpw3spw9SHu5ymUUEjmXKb
	rSKnHPnXq2TKJwcUjFlg45NNnhyRbKd+06GwTdv4KvaSlIPz686ryPINArh3aDxW
	TrQtUKx2Gv+HsLDCMLIYg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794919575; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:AVLJueqKjSnaadLwaHB0iODxZEq2aOPnHV6+dLNU5zDcwYd
	b/twnu4wH6udVefdNj/AbHlam9RedpCsV0IKTI2KpTFP0LvfZkliP8o++L0DBYzR
	Jv+DQJsKifBMzefykqrGND8RSJJmxVen2r3LQrgb6pEv+b0dpCxJwh6XhLSFrsoi
	9wkYpl4fHjfw5MSGpiVj0TG+TC2Uvxfpae7rJ9Gkba0bqkGi6wEplPRtK8mfLiVF
	vXqzeNcBKVHbFh9Qr3mX3vIyNQA5t6nTiS9dVhG36rmYtMhNay8N8t1TgYf5kxAX
	W2xeGZTaZV50KyfBWaQNNv4EjXej0nvNsbLy5NA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:l9jwFaigUlP2Semq1pBSvPA3q9zJvNN8b8OZDwzhLp8=:UPUUtkX4R6DS9/Yu6LpWZqAbGWKyCTDEJxdw++jr0Bs=;
X-ME-Sender: <xms:kUz8agq6XN9cp_cqSuE7y9Mt7cCL-O_s_rnO4uahNRkbmFygGMr-yQ>
    <xme:kUz8ahcGZ3IXoi7JVaLiQhj5qr40JBzC0_-BB55wmm7PqcxHic-0yOggIZg9o4rU7
    0WKcAE3pi_56824W1PZ0dPuT_157Cq_BNjGUXXJQr1QW4DSdDwucYrw>
X-ME-Proxy-Cause: dmFkZTEQ6l2HKVovdikndXCQnuzqOGyZJgaZz86ZLw177hPDftS30oVMEijNYMV1UfTvYh
    gsPHRgVgloyv3vsz3E2nQEt7/GZAQYru/bf7ixTMTpCdGPjwYRslcw0pzEOSBfusBs3rkd
    j5qv+iImW+0q3I8QiJ69Bo8VRKVEHoVvQG7wh8sowDUoa23IdW56CbW3JeJAuNl2jUckYd
    UHFheAed3wq4x/srblo0ST6uiFq9n0zZ/Au7ja7VFUzDA51GrdgZ3+UjpWx9nwR0c+Lrb6
    EcjyS+GLwHLnF9q+1z1ikew4hX+SJ/p+zE3/PdhMhAobNRsagxN77g+3JM+YSJ76/ZMBKA
    hfEjtDJ3ezkKBwi2DZP536aPnz2iC9efLlmXPYMsb/JWSwEKqyDdW7bjVcX837dtfJMP47
    r2teeJ3cbcR2+F9laJAkTs/1vT5VWhovexqg0uVYcTHAbPwY2QXRVx1B+6KbXexIDp6jAs
    3a1HN75YvgaarUavgmHcpMMf7sEJhVBvXky4LZHtaqsTNDCeQ1UsnCzbCRXggft3Mf80kD
    5ODjp9nFtwX5Axz80fvLxmOBm1oScxUQ7gGKx+GqmZihk4vgmS50JC5jONrTd/Of3plHx3
    loPKDYlcZV93QFS9AZPHj5BxI8wMi6NB+GbZxL2wj5+jaQLCnkBsjBn0JQHQ
X-ME-Proxy: <xmx:k0z8asnbc5FinHeSZn-pp9JNrkdpjs0lcPYJHc7RbYXNcqmjsa-ZEA>
    <xmx:k0z8aiOpgUMwS6oLAjjlc7yNIPQCR3caegdZGbjDvFF-nhJZBZjLlg>
    <xmx:k0z8am6XXv8jjTDdPcNNfqR4kuTwVWz1nWnFcPBYmZdyb1VkCZxwGg>
    <xmx:k0z8ambtKBqrdnGPGaDjwl_K9BBiQ69q-Ze9JYtIHmVj_xYREhR9aA>
    <xmx:l0z8aogw5VB-aSa7rqcut_3EOCZkhoCbRstY0fNmO-LuibVSkqxZ5QjY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 942BE32A009C; Tue, 17 Nov 2026 07:46:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AqUefEB18S3J
Date: Tue, 17 Nov 2026 13:44:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Gregory Price" <gourry@gourry.net>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "David Hildenbrand (Red Hat)" <david@kernel.org>, "Zi Yan" <ziy@nvidia.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, rakie.kim@sk.com,
 "Ying Huang" <ying.huang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, larips <larips950@gmail.com>,
 stable@vger.kernel.org
Message-Id: <3b9d974c-18d3-4113-b7a6-1f785f19b318@app.fastmail.com>
In-Reply-To: <20261117101910.1820066-1-gourry@gourry.net>
References: <20261117101910.1820066-1-gourry@gourry.net>
Subject: Re: [PATCH] mm/mempolicy: limit compat bitmap reads to the source nodemask
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 11:19, Gregory Price (Meta) wrote:
> A 32-bit get_mempolicy() call can read past the kernel's stack nodemask.
> With 64 possible nodes and maxnode=65, copy_nodes_to_user() computes an
> eight-byte copy, but compat_put_bitmap() reads two native words.

I don't quite follow the explanation yet:

if maxnode=65, shouldn't that result in copying 16 bytes on x86-64
and 12 bytes on compat mode?

It looks like compat mode adjusts the wrong variable and we should
be doing this instead:

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 6d662a9a8c74..f9a7be9f4432 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1749,12 +1749,12 @@ static int get_nodes(nodemask_t *nodes, const unsigned long __user *nmask,
 static int copy_nodes_to_user(unsigned long __user *mask, unsigned long maxnode,
 			      nodemask_t *nodes)
 {
-	unsigned long copy = ALIGN(maxnode-1, 64) / 8;
+	unsigned long copy = ALIGN(maxnode-1, BITS_PER_LONG) / 8;
 	unsigned int nbytes = BITS_TO_LONGS(nr_node_ids) * sizeof(long);
 	bool compat = in_compat_syscall();
 
 	if (compat)
-		nbytes = BITS_TO_COMPAT_LONGS(nr_node_ids) * sizeof(compat_long_t);
+		copy = ALIGN(maxnode-1, BITS_PER_COMPAT_LONG) / 8;
 
 	if (copy > nbytes) {
 		if (copy > PAGE_SIZE)

Now in the maxnode=65 example, it should clear 4 bytes and put copy
the 8 byte bitmap.

      Arnd
