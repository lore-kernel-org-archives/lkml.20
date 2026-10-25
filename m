Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=189.12.192.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965845;
	b=0USXxps0xi9pwiwRnkXh6NASxGAS5GxxLE4VIWf7st9eDiC8VMKGRyAb2Xus08xW5oC7
	 8++gJWL2MN4u32sxg2J1AmxJG1JCIuqeYieKxJygnxLvI5xrVwc089AF5OZjqomMarLQI
	 C10g8rDIen8Z20Y3hX8bmmUD7B1HkeU8cY9jMcmyVVazZUsWZUPCDVgxmT8upZiMjoFeu
	 ilGJhjfJLcXnhGgwCSVAKveTTHH4lqSNAlGuzFojk3vRyqnbELv1BpfDj02rvcTNcb+4r
	 ghyq5anJYHOzo7HG96IZbii7cVfPbhnPxp+1kIZs9fRiqAS0kNVKcL1k/Bu74FTq3+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965845;
	h=DMARC-Filter:X-Hostinger-Mail-Ref:DKIM-Signature:Feedback-ID:
	 X-Hostinger-Mail-Id:Received:DKIM-Signature:Received:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:X-CM-Analysis:X-CM-Envelope;
	bh=QdUdWKI7gemfcyeHi5uKu4TGwE/B8K8A/8p+9RAy1oU=;
	b=inTbjgrlZCoikxzfzSX1msJe15w4TRC61kadqdXz+j3jCM2XH7L2zlTuPXR8S/9UJifJ
	 zNUfLJE+1BWDjfwt9vXz7zrOM5HjV5TZDLPrgS37GP2v8Tgcrq+AwmhY6PrS1KPReRe7z
	 WFyibyQBPBU0vuVsFzBvB7aNqY0puSi6fQ0PWOOht3IwVt4L7u9QxdNaeSnzBcfpNUg0J
	 aQqnvOlpzjy1Mfxpz6k2ec/wAYzAVXP1QoroKCrLh8TFVDcApmCcm4q40XUgIiMUb6G35
	 DfD6FwMrZOdR7+KaQP1IXMUqGy4r4UyFTEm7A7Sx802WaOCxLqvNro2yLRJixNc7XoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=espilon.net;
	spf=pass smtp.mailfrom=espilon.net;
	dkim=pass header.d=relay.mail.hostinger.com header.i=@relay.mail.hostinger.com header.a=rsa-sha256 header.s=oak202607 header.b=mHQ9P1b5;
	dkim=pass header.d=espilon.net header.i=@espilon.net header.a=rsa-sha256 header.s=hostingermail1 header.b=z1bsC494;
	arc=none smtp.remote-ip=189.12.192.2
Received: from oak3.relay.mail.hostinger.com (oak3.relay.mail.hostinger.com [189.12.192.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F3606A327
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7F3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=espilon.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=espilon.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=relay.mail.hostinger.com header.i=@relay.mail.hostinger.com header.a=rsa-sha256 header.s=oak202607 header.b=mHQ9P1b5;
	dkim=pass (2048-bit key, unprotected) header.d=espilon.net header.i=@espilon.net header.a=rsa-sha256 header.s=hostingermail1 header.b=z1bsC494
X-Hostinger-Mail-Ref: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoibGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyI
	sInRlbmFudCI6ImV1bjB1cz1lc3BpbG9uLm5ldCIsInhfY3VzdG9tZXIiOiJldW4wdXNAZXNwaW
	xvbi5uZXQifQ==
DKIM-Signature: v=1; a=rsa-sha256; d=relay.mail.hostinger.com; s=oak202607;
	c=relaxed/relaxed; bh=QdUdWKI7gemfcyeHi5uKu4TGwE/B8K8A/8p+9RAy1oU=;
	h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:
		content-type:date:date:feedback-id:feedback-id:from:from:in-reply-to:
		list-id:list-unsubscribe:list-unsubscribe-post:message-id:message-id:
		mime-version:mime-version:references:reply-to:subject:subject:to:to:
		x-hostinger-mail-id:x-hostinger-mail-id; t=1792965837;
	b=mHQ9P1b5fIUf7F7h9If5dxZQmSeHeJEB0xo4fv5ZGSiGmvq+M5Iv+i0YcM7Z/Etl8S32OOW4J
	IgYTP9LYcyx1fujntpI26OgAnuzK3wYTgjvz9PhWuTWnlbs1OaIIQYsDNULpCG26ypqG0DcoMPl
	H08HQK0VncDwbmqksUr1QsptAU3g1TGFKprra4WMQy6+l+PnOrHH4qD7tPf9FtFrhHxHOJP07vt
	yfqbayD5PS9oSIWBNaQcTotrE83hQenTvNIv3W6aIyARF2B/RBk3c16AMHz9cmQR9XjcV4j2ELJ
	Z3jwKiWpHrFqmM7U5+l4Px/3INqa+X3/qDo7ezeIzgow==;
Feedback-ID: oak202607:espilon.net:hmail
X-Hostinger-Mail-Id: fa0685e6d0bf11f19e89bc24115bb549
Received: from fr-int-smtpout22.hostinger.io (::ffff:148.222.54.26)
  by fr-int-hmail-krelay2.hostinger.io (KumoMTA ::ffff:148.222.54.54) 
  with ESMTPS (TLSv1_3:TLS13_AES_256_GCM_SHA384)  id fa0685e6d0bf11f19e89bc24115bb549 for <linux-kernel@vger.kernel.org>;
  Sun, 25 Oct 2026 22:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=espilon.net;
	s=hostingermail1; t=1792965837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QdUdWKI7gemfcyeHi5uKu4TGwE/B8K8A/8p+9RAy1oU=;
	b=z1bsC494emwgfutNkyhhCDQ9iVNmKan9eTK0Hchfd3F0Yh6iBDr5cvkjBFgRZDvQ2hc3kt
	nf4gMkBpPCqUe7qy0tk2663FyiUUgOvWLXvuuis/fjlNAJsrDM8lRi2MSoEKOde0kmOlqI
	oWq2VgiGg8qCEDoRqaPA+NOP7b3v3YWC+gn8BgTIm/0+xfFfgMN5h1YlLsg9/GAvwMvTpr
	yJ1/3G/C5TCe4JR1iteqNIHjAXQOuBi3EjNc9cKp8tRRKEDqb+R9ZwSKrXcv+P9IVSvDHG
	oZn1qOa4gmDGe0JZ31rYOE/BDariFhlo0msAWmTwWdJS0iAyl1Zs9cXRct3umg==
Received: from [127.0.1.1] (unknown [IPv6:2001:861:5b02:4810:d535:8293:aee4:a9e])
	(Authenticated sender: eun0us@espilon.net)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4jCW4F0Nl3z1003;
	Sun, 25 Oct 2026 22:03:57 +0000 (UTC)
From: Marouane El Moufid <eun0us@espilon.net>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] fs/adfs: bound F+ directory entry name length
Message-ID: <179296581973.931625.5260582703376775024@espilon.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Sun, 25 Oct 2026 22:03:57 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=CoDtcW4D c=1 sm=1 tr=0 ts=6ade7ccd a=NNrdi8j+18+XpAC5aQBFGw==:617 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=ICNSGLm3AAAA:8 a=KJVV_1SJKfEbDMfVY7UA:9 a=CjuIK1q_8ugA:10 a=-W5iAdWQbIJCsXvgvhpT:22
X-CM-Envelope: MS4xfKJfFyJwkKSy0bzPvsDDfK2FTGcWurSuC3L597x1Lx5iwjjRV7/7nOoPf6U/8dyrEGmy3FnKosDJAUsX677jWZkOCCgThGVImaYB+aNR5adfebRKR6fF 4GytyD2etpujbQPjIrXKy2MNHtEqPFIvjI3pcfKgFYlmO1na6S+WBN0V4qkHBuBYSLG/pSe4op07OojgrGlAIVFnb+0xSjPVsHS9Yu485m36bX6s1khgySwa I/mmytzlenUMD10wGIV83oV6cvSQuEMryNeEXn85AFYzHQdYGngQ5cRmGHBxc13yTG4VRgo6PBU43q6NCcWlq//oIxiFWKnvj7UwLyidRsQ=

adfs_fplus_getnext() reads the entry name length (bigdirobnamelen, u32)
from disk and passes it to adfs_dir_copyfrom() as the length to copy into
the fixed 260-byte on-stack obj->name buffer. adfs_dir_copyfrom() bounds
only the source, so a crafted F+ directory entry overflows the stack
(KASAN: stack-out-of-bounds, write; stack-protector panic), reachable
from a mounted crafted ADFS image by a readdir (ls).

Reject an entry whose name does not fit in obj->name, leaving room for
the optional ",xyz" filetype suffix appended by adfs_object_fixup().

Signed-off-by: Marouane El Moufid <eun0us@espilon.net>
---
 fs/adfs/dir_fplus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -192,6 +192,8 @@
 	obj->indaddr  = le32_to_cpu(bde.bigdirindaddr);
 	obj->attr     = le32_to_cpu(bde.bigdirattr);
 	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);
+	if (obj->name_len > ADFS_MAX_NAME_LEN - 4)
+		return -EINVAL;

 	offset = adfs_fplus_offset(h, le32_to_cpu(h->bigdirentries));
 	offset += le32_to_cpu(bde.bigdirobnameptr);
