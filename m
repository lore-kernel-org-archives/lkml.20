Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564191;
	b=3nBPKaqQK0HHgzOMuBNVPAiXq8NavnJPFH+akqz7cEQ9nq+/HSOrDUMEiUcKebibYnO6
	 BiS/G5yh9TV3iA69cjxct1t00mKgVNDyhZWEQcJdluSIDBhKW2qSOpzNyZ0UIhsaZ5aIk
	 G/Y91PC+vU4DGRFKZt2x/DkoT2BM/8sSM50iwEsXxClkjlPjKT6huUTSZlznYL5e43lA8
	 UQyPrMPRdjIO5fLtM5Er8dSCQP08Pi5n5lRw1E+X9ju41ZUnL3xnjWZQc4K+g59sIJ6vg
	 Yfk5DbPeu4d1OR8gdl3mTt8HzUPqQV6bsmiBygXWKi0MK/KWDzQFF/4YONG6YG6BdjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BqTXqaIxt0sZIdIo6UKmgjkLMbcGDQb8Vj6tAnCQxek=;
	b=1KfZghh49mxFBIG62yo+nhtxmpeQs3Mf6f8W9cH9KkY0wM1h519iEHsy51U8cFVtJlHE
	 DD00uWkkQmVWfi+N7a81Echoi+W3yWGLsPSzOJihB0J+oPEWv0Q95qHo7Qbbg04hCKpFu
	 QdnpV5HXy/itFQghLRa5Z6aWBGQOUXBbS9cwwrqCcPxLE8jAiw68B+6EgWDxSly3lbcFp
	 l88XzPuZXztLkmS5/Qedx4iGFQ2K4uBsaTWsUS/jxI38zEjnFlqb3aCO+nZeAluLgXPH/
	 J3mOCG9uc6X5elCmZ6fAQvqVk199HxuZ34f8ptl2277jbGilASLpqH8xuOQPSFxnLcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TJG64jdv;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=YpdMkAvW;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BE8606A331
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17BE8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TJG64jdv;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=YpdMkAvW
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1DVuGq2338394
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 15:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=BqTX
	qaIxt0sZIdIo6UKmgjkLMbcGDQb8Vj6tAnCQxek=; b=TJG64jdvVFfZcvxcctU+
	Eks2NAQ4Ak6/S12o0lVe0S6I8BOT8+fgifY4zlFiNb62u00yxwXiCetjKEcO2YLk
	UpkEXUyaS7nicbe/fvUUYzZz1ury4X2Lf6scvZJ/9wRzbX5IEX7czXTDzjaE7fzh
	ScmGjD71fxSRFDlYQUj+V6cvUaHwDpQ9gbD0G8+FqmLikYqHDEzMpT6LKzKO6nOq
	NL0Zk6yBNYIX/3DGrDO9+/d7VcEQZpRnsqnUPMUgmSGhoRZVP1cPbjCA9ip1EQR8
	zzVAocsbjHjSL7rRwvRd/8xR2bP6zQsTgY+krrMaGZ+Z3cGUzpFTx5uZrJVy7tlf
	aQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hnxrruay8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:16:30 -0500 (EST)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so536265137.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793564189; x=1794168989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqTXqaIxt0sZIdIo6UKmgjkLMbcGDQb8Vj6tAnCQxek=;
        b=YpdMkAvWTJMPJ2txdznmb+h5yx9f22LGssPYaV8uOMkLkmV6aO5FAaLq1wG/sd7oCP
         x+DQHqEb8e6qfc6SKHIlj62ZbdmNpctUitUi/pJryu1+R6y/pwzDWbPiPIjkO32ruwri
         rFzFd3S1mRcs5D0R8V4par6Aam03bFNQZD21ILFWwZc1noSv0Yj3A4c8g50v0+TXfkER
         hr6QtQVHlooN5u2AN+OJXuK7Ss+/+rxhsX2JREBf/GwyDuTMSKJMlluw/uyW+rMYxOQR
         F9x4vJoebVXk+iLlMyO67BtnPDAlwnS3I/b8p7xbb/cICFcEeFzl/1cimeCxOejppa6H
         IcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564189; x=1794168989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqTXqaIxt0sZIdIo6UKmgjkLMbcGDQb8Vj6tAnCQxek=;
        b=y/oMwEvxZ73Slm41mCHhXx2yYgY5s6iDcdqWI6qBRCPF5QToqcapmHk1BSLmQRQW87
         mysq/UcJwOwlUrBDxeV6tg9WnSstnZToidqmoRwHzqCBsQTTsj41n98P5tZqgmTfjfA7
         zAm0GD7lA9gQs+b0ClZf1n0B1HENAfW8q5kvGa7mOd8qEfHL0fe5eU2jc0ypvRfCJ5Vk
         D0OmX7t4mNhFiYFNMhZ8Q9tEY5F79Lyz54xPPKEmlj0QUy+YBnAvfY0xhfAXxauSXtR1
         RK+OSI/Hgj3VV730WFKkqCZddRJFZJ47xZdigbF1LdnyWbAQPA7QdaGlfQiggKn90caJ
         0w3A==
X-Forwarded-Encrypted: i=1; AKwUvBz+uco6zwkn7Wj2qnHfy7eTTylmBSkNTftRkbEWOP1/uYriZOTBNBivpYrWXJOOg6lI5Aj70fu5niyp9ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Oaq3N8A2mZiuWeQ3Gs80YUXZlFDU9TiXLFt2/MAeXWU1/6kk
	tIlGUUg/MyVS7TSJNpQhzpXNfOiiyR8i8gmuG8mBwAs7LKMmpNX1oYd6fIgcMgZ1PgrN0fPcTBD
	apXF/wzKMO7H4CWvw2LrwHv+Rw+wXl9eghbMEsHYCWcQiXzTxbSuq3qu+43DbGd7S+Vvteg==
X-Gm-Gg: AYBFou2+ZVcszQo6kbZ943Mq520qsu9d8oJOGiwtw1d3QYwY1xlaCEveClOHHUmiHlm
	HGvBuvEX6/1T5z+Z02Tri9Uo03XODM5VxLPG58AcfFjokXwKns5AwwOlgNHmr6Lsx4szCZ4ItcH
	nrDn3fm4NncSYopyeRLFckGSc6yeeF7k9vx5EFi+8xJ1HzIkcoI0NSO4o8bD7NIJhANubKNbvCC
	C4yqwpfoMSD1RYpMO5pkLQTdQzrWvkzwYXFsY6BWaNoWqu2VU4PJx7yRLG08SIirIQGf27iR8Ag
	SvylNG1HrlGy92hC44zjBoJr/W9Hm6HONPe9RcO+WI/OyIl1meUl/j85SFMiVyVv53PAWDRv0v5
	OSRxBqdhKDq6+q4I5pS81Yk2IWVHEgCcnR/Ggs4zF23OgtYpRM7I7hIGLVAg=
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d072baa484mr2927966137.9.1793564189543;
        Sun, 01 Nov 2026 12:16:29 -0800 (PST)
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d072baa484mr2927962137.9.1793564189082;
        Sun, 01 Nov 2026 12:16:29 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm15661423f8f.23.2026.11.01.12.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:16:28 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 01 Nov 2026 15:16:14 -0500
Subject: [PATCH 2/2] fscrypt: remove fscrypt_is_bounce_page()
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
Message-Id: <20261101-fscrypt-page-helpers-v1-2-bcfbfaf6a237@columbia.edu>
References: <20261101-fscrypt-page-helpers-v1-0-bcfbfaf6a237@columbia.edu>
In-Reply-To: <20261101-fscrypt-page-helpers-v1-0-bcfbfaf6a237@columbia.edu>
To: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793564181; l=1123;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=FuaDbBzgAylLyOkBuu6fOUJHcXnEh9zDTWNhiRskaFA=;
 b=2cJwYDDDrxsrDKPoMFODyRhRItzplz+Yx9oEv+a8snVPKzI6TGsnhK1uqKmGbTwaZaAyFWvNG
 fIH82I14oOhAlPB4WGMiCOPGIpva2qkQtCcvMk/ZCD4PfO/iwJv4xUi
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4MCBTYWx0ZWRfX6Ls2mfLxf7tq
 MV2z2GGGJQ3x1NTDfx+WmCNytZczPRERyZv7ElZGibw5C81vapH0YrUgxmjpn7LYeYo8hKaAEEG
 5bsWnhR3GhU3KkJXM4JwIg5/Rk0EjMXqHyqQ/DwxPAlnTWZxD4rM
X-Proofpoint-ORIG-GUID: 4bO82bDBgZwEZ6uThJuj45mLCvVTeqSd
X-Authority-Analysis: v=2.4 cv=HYaB3SE8 c=1 sm=1 tr=0 ts=6ae79e1e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=slkTkWUpcQ_TrhisGP8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 4bO82bDBgZwEZ6uThJuj45mLCvVTeqSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4MCBTYWx0ZWRfX9Wp/rXHZlpKu
 h4y0GMN9Z5eKiHsXLoHTVPqxYFyTI/0HOyls/6Dp4tX3aeRpLofviMeg/AZcE2j5Fi8VOnOSH9Z
 EQp9X3edI/IbCPbIu+s2U6qZB0YcLS0k/SqflnOzN+WxF1jR4xx68Bbvbnw88YAdakjuWLK1X3d
 nDCu7HRu6eNIlXnx/oR2oMFUevwdojhSV5FhGbY4EnYaV0fe50doGH9k7CHsVKQN7PYT7tZThfm
 0ILdy870byiRcwC6OVlHFSgKzJrjxLDxDQeEvgsZmMJo82mURo0RfEQCyGowZwHEAucLWQLmUMX
 AP2hqaqoMgoix+uOtjXnz+jUP5mw2fkKBzdeevfbVFhKlkQx0qCyAVV5ukc2JXL7iprd9/pi7sU
 WX4ev7kiedtn3euRvBrO7WW3G746T4yH7339lYzcKqZW9QoZ80eHIG3S7EWpGrK3cAylMYpTnMO
 xvsSYfdKDSqn5fOQ1bw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11953
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 bulkscore=10
 impostorscore=10 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010080

fscrypt_is_bounce_page() no longer has any callers, so remove it. This
removes a use of page->mapping.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/fscrypt.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e70f630fab0c..3a238bebbdf1 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -356,11 +356,6 @@ int fscrypt_decrypt_block_inplace(const struct inode *inode, struct page *page,
 				  unsigned int len, unsigned int offs,
 				  u64 lblk_num);
 
-static inline bool fscrypt_is_bounce_page(struct page *page)
-{
-	return page->mapping == NULL;
-}
-
 static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 {
 	return folio->mapping == NULL;
@@ -522,11 +517,6 @@ static inline int fscrypt_decrypt_block_inplace(const struct inode *inode,
 	return -EOPNOTSUPP;
 }
 
-static inline bool fscrypt_is_bounce_page(struct page *page)
-{
-	return false;
-}
-
 static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 {
 	return false;

-- 
2.39.5

