Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989962;
	b=4L92NBR7PH6LpKEfBHTzucLN0ahzscOiHQ937MASkqqx260PILxv2kp2genWhkJA0Jed
	 VK9Xd+EPYm5IdGyW3o9Pyao2aUHeL+mb3p/fWtqkbaqybKoZ/b+5Moug7+iVk37BQtL9s
	 8GmrpBdP+GRPprhUEc36QvwGFHNm66KlAuu+nd6g0ch7p2rdIQzwPPhKf+HRYvMP7z+Ab
	 5A33WCTaJ9/VV6qhTa5MgZAD+X8CTYmOvxV209P1I0Yb4dXVbim+yw8Dyfx7cCZGVgLdM
	 Xl+DIL8aZNMqdyH89/mE9PhCxqwzo4jdQ5ppXY6ef6uHbsYWruHWTaLVC0HXAuoqfhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J3DoOx+7KwqVIr6jxYa/DyB1bbCV4XdJJBW9Yy/mfpI=;
	b=Y2OKyJFRdjmbbt3C4Dta3q/ZWkCPimeTnhKolEcDRSUkruQ5F49cYCqMUoApwO3lbtVy
	 LXxGwzx0ZnYIjqTsmsFvOFTvwwHBZQDGvtc7dghKLVeiTnmt8VQ2aQrzzuwc4cZu8u8+P
	 L6cQJ/eTXH6rB0WYxKaSsbnqGGvYlBvrUzthZOjQkedpFUu9SoWxU/a1hUvfFlgybrPed
	 UJWFN9IsMN2v+iF9c08X0WUyf2NqbNCknY75600s8n3YGBnBGSRbTuSYgfZtYnuzI3Mc/
	 z+hOBWXg94KMjx9rBlBhfN+Q+NXJvYA+e/I3Awa5rlL66xM/MzxyS067RfkPFTgMqiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gqZTLOFK;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA76606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA76606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gqZTLOFK
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f036b17easo7056677eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792989961; x=1793594761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3DoOx+7KwqVIr6jxYa/DyB1bbCV4XdJJBW9Yy/mfpI=;
        b=gqZTLOFKVYQJF7VBfihMP4KTKK9ROJu8RFfm1rzK1k/Yw096E9V3HfleN2a4Ve4fdr
         1jQUuDCzqJ1GVEiDkakRHAx+i/qb8VZWxwwvf9qFlZ0HLWIF3SxG9EOns6wkYNW++jyv
         3EEC8xzBozrUv7xI6z+wTRhZELPOwNGrGICEfkH1bCy/hKUWxMKKIaYP7ImYXTMAXxJm
         b4hEXT7BHxbLphZ/ewKRcHKJFfJE2Sc+eu8+nTmwOIUTaS8Jf8jens/4eCnq2gV+pxmt
         CigppTaWgJ1NWyjjVSua9WNtl0u41kVaAmqJY9tvnEmPOfwgxKRuVzIs3vI7vWxPvb9x
         loWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792989961; x=1793594761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3DoOx+7KwqVIr6jxYa/DyB1bbCV4XdJJBW9Yy/mfpI=;
        b=HToBZKqYXhkd8QiXnypUKtID0fSsyP0mLGBMwqGwjo3fwlyBwXh0/yZs3XZScUxVm/
         fcaNANeCgwMn2oc6KGiyiUOcmQoP9xGknFrfqaMklWiryXPogsdFvdJziwxSSzkDKfzW
         7BkB9/O6w0HecScjSYT9oxUxyw4cGksIOCmANXjRX6NVcxiSqDNpNzCf2t+aeRrsRBQM
         kJSc0Ed6zPXfCTCiRyz1vwZ7urI8KOX4rTLfANEtGMSkeqAsegI4dSAqu1PrIzGZH//1
         NlK+YUIDyEksow8gD2XUvUxQtDwWjbDi08rgi1woHRky75R9jINHEcTtiWdqyxdVLoni
         /+fw==
X-Forwarded-Encrypted: i=1; AKwUvByipkIzquzjNGotJEdV1y6GoSzXfDKxXt2QG72brEBRf3828yBhM+h+azkPujRWgi+tSq/2HNpvgBJnWjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu2+09/Z0fRJ50JovR+ZZJuct2kN8+FDUkAAiqmriSGKoWDewG
	9XFVd38Yqyvi2awKptcv+qbC18k3S5e5RO1zpyiVcKWkgBx8aLWPtHbe
X-Gm-Gg: AYBFou1Ni9y7TSKKUQQ9ZCrPBAKt909S7H07C017Y0ztU4eE+vaMGZFHiiCOfHEMOaz
	Db9MbdhcIT+Cwr6l8uuYJvIQh9cMSiXc5UwzhPRfWmvl0qv2om6KWeruL6bZ+RdLkTKmm0tWmtX
	O3HH+3eIIrMwsqgvI2kSq2vo0l6dxUJDotHbDKC7K2v+mj93jZ4JyCqqvTk3uBxHGqsxamqumUX
	DjQnbSIZuenOFQZSgnHZatn8QJooftqHIzP8x7ia41clLSH5+nl0HbN9YbYvjUqgG7QCLaRLwB+
	a/pQBSjTwmhfemIQytpQ0FrMb5G9qPyogutmLR30r4iaq5KM/ErGNWCb5z/lKImDnu8KLX8S9Vg
	QPjTxVvuFr5NZzygv6Vdts9Gl6CRTD/28HB8uccQNkRjy+LdCXjbiK1JljFq97KamqfWGDqktGP
	El7mXdhOWSbwUOmX9jrarwb/SDB4y39hhs4b2Spnre6a91mj8pACjJmybSLXrSk9rY8kkXAobgK
	G5xj8o0Z5mMUeQ1CTi6BStDGZScyWXWBz02RONwO7K49ySMYFMKTaW5jGQLswn0AEezDExsz/Pg
X-Received: by 2002:a05:693c:4195:10b0:360:905a:7c27 with SMTP id 5a478bee46e88-369e84e701dmr9620677eec.26.1792989960862;
        Sun, 25 Oct 2026 21:46:00 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a005c0188sm7281133eec.9.2026.10.25.21.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:46:00 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v2] staging: fbtft: Fix line length warning
Date: Mon, 26 Oct 2026 10:15:23 +0530
Message-ID: <20261026044523.18516-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Split the line in fbtft_init_dbg macro to keep it within the limit of 100
columns and address the checkpatch warning. Also aligned backslashes (\)
for the macro. Added a temproray variable for platform data.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index fd7f8fc2afba..ceaa9a3906ef 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -421,12 +421,11 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)-> \
-	    display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
+#define fbtft_init_dbg(dev, format, arg...)						\
+do {											\
+	struct fbtft_platform_data *pdata = dev_get_platdata((dev));			\
+	if (unlikely(pdata && (pdata->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS)))	\
+		dev_info(dev, format, ##arg);						\
 } while (0)
 
 #define fbtft_par_dbg(level, par, format, arg...)            \
-- 
2.56.0

