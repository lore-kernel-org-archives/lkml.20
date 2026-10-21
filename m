Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585479;
	b=ASK07Wng/613Mjrq4CFXRMdTS8w9RKP7whlhatSkbp8uyDoT+4zR4/xL+fo9kWo30fOu
	 T0my/a+DELgaJ1bW5Ohq0/3XmOBuXQucd9glbotVTd5qpZpdw1xgn74lAtrCs7WCvy0hD
	 rwekNJ8YTvMWqd6uOTjIbNpz2PzeQyeDF3aS+8b79vgwJckqEsiIAhgQpDwd929K4tc3u
	 WNwqmnwXgE2IZs28Btpzm5VZOxIZcqEvnQL1SdfdS65LSCCHhc5DVdbKeDCk5V5+FIQmd
	 mUq3Hzb5YqN1hMTtLCyKZLt6SDpCSgpwlFOihboAtr2yV/KC+2tU77Djbm7AKzunA3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NNzfE8E+HIVrmfub6HmwGi2K/UFS+cXxulUqMdHzE+I=;
	b=Sxc3d4IaxQuKIzZ0a9ldCc+8e7uULd9gA2urbIeHlaVf6ZiPE0E2JlFGOxsSQdAskART
	 vMaxZdIGGuJSBgKJatevOXX7J/XM8Dw41bcc0ASHZLZyBeKYoXgG4BHq/F7zdv0TN0FWz
	 TtWvrxez50TtSmTP26R5of8jXtJ5Wiu1spGuEHmxMFL978c9XhDMsDVBB0lKM21wWP+3v
	 5fQCMtsjSlGJy5Rbhxai8FJ4ahSJXQU52TkEpNM5SrzdzzXdZm797eIxw1FlkUN9gPk7O
	 WVCpAHuX8z5HTNVfyKTEAqnXCEY875gn5lNgeGaP06gAOEqjgD4BsGisyXq7lBL71GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzNlW8oV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrNMCp6o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8D606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D8D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzNlW8oV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrNMCp6o
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfvpC3224730
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NNzfE8E+HIVrmfub6HmwGi
	2K/UFS+cXxulUqMdHzE+I=; b=AzNlW8oV1alNfwIjwjwW+EAgNjGVhtnr8wLVfQ
	0eeNPwt+tiZPAwT+ONRiIPVnxjHcBg1vlYygG2mE3206FcdWHuy71JFeQQ9D5SvK
	9zdkaaqT3Sj+9PKrqnYPTJmXNKHh0hz96Bsa2WEvSBV48sqgvqSFEQCgGMbh2I+z
	aJjgPuJGwPngsd5LmLoT7YzSnMcAb9jBS7EgMJt5pTDslLNDytV5Tx4ZVw+GukQI
	OzGX/7qetQhRaBb+GAsfP46U5jctRT+XlndtV32poqgKHSOO4i82sy2AuIRkm7Wu
	VQ/wIdWSJlEyRUtEksz0miVJ9HsaEi7n0XD3t3t6vlbzUBBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78yqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:24:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso330270685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585477; x=1793190277; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NNzfE8E+HIVrmfub6HmwGi2K/UFS+cXxulUqMdHzE+I=;
        b=NrNMCp6ooE8yOgLuCUbyXNQq9sowcTlcG9ZoQ5MBR0eq0PX8kvCGw6yQdTkoSZ07xD
         lxsFwggE/vdrsIQJd6teTXe0LnoXw+8DXW9IyseZBe+ksGCFP+SLC11U2KAiByL+AN85
         gP+YYGTz834MW5FmSamHGEO1dc8raMRmu3xslgiW0IS7vpHLEyRl+ZoHDDRDXtJ00Z7s
         Cg1N91s6jPTj26RgSUYlPoekvz7cl7OCPP7xcdfzyIh1d+RXOIcivBNYgEg4JG0UBF1w
         pkU4dXaEgOV96W38BisXNhtHJn6EfsaI1YHxT0UkoYIhNiOoFq4k/pfMEvAAHwd9xFY1
         0GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585477; x=1793190277;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NNzfE8E+HIVrmfub6HmwGi2K/UFS+cXxulUqMdHzE+I=;
        b=Vy0SIsZ6ylt4s36vToEbKZZVRe7mRUuk1HnNcy9GCSgppTwZP8U1XxL0RGVD10C07W
         xzP7Wo+qgKJhh/p6Bs4nG4Y8TnXcl0ok0/xYAB92+fdTQJZrwjtSp5JNaiPS/QfvHRqD
         Riu9VkVnI+g8n9hl0rxpQNYfwnL+z6XwrbKJwY87noX1B5pFx5j0oGxb4os02UoVImLx
         mcKuO2LlyqmVvl6CBKddh3TAluWxXiQQ3YJqx4/4TsIKSW1sglSikCwxClXD4+69F5JM
         HD1ZVJj2+uUDLIJ7+W99bYkN3zZuhzGzW8jXkSNawHSIJ5S0rlqG2fPDO9oN+r+VJH0q
         kAhA==
X-Forwarded-Encrypted: i=1; AKwUvBz45vw0PRmqMAvQdDE7nR52qYQBUZut++Nkmpj/GxgX4vq+OQo+CoCXGe18scvQB6QzFDi1PtXRJv9vvNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsRMHC2zzRIeHIviv+SX10s48St/YRpQiW+DiHabKJM82zHL1n
	7vI8DMh7u6G74r2ehpXE0IqvCb64h8D2cUyE2sL7ZGdUgYMCnNiHTCGGQ1HDTYQEqFJpMF97dKI
	cD+y4hIhxFNJdIeBTnU5F09cd+KQiTCZnAjUhXFaC4VUnIYKRRhZ2zHA8lDejwb1OT3U=
X-Gm-Gg: AYBFou312iXWr15kvjqOUgYt26b3iF+6ivPfLlvWf/rLmRU93mpQ1lU/UAOck9/lYmL
	/vf5qU/0wEyveZmKGbGMy438aDc4JUDBYcBaDkBgL1xOvdCKzp4MbEdogHu2edwttjuKV1+Eg+E
	eY2um/3A4fAl9CegHjcBwQzA+R3qrt712TRef9bmnXlVGq4kbOyinltWpZ9oWtspKMGlH8+P49B
	UE48bCI+52IGZXsaRXRg5hEAkKeyVFuI6AjEpsHPnJUhIaLZ8VfQ05La8GA1nWimZH05P5EvQ0X
	YJT5uEtwqU2aFnalLxE5dSqTxZi3lO6O7RrnPQyoaL4jmuXCz70X4GluVSx+3UaUIFkLzN7P0SB
	VsdyUjQ4af/WCLLtY+1n92nN03gje
X-Received: by 2002:a05:620a:4493:b0:93f:4498:603a with SMTP id af79cd13be357-93f4c993775mr771859285a.35.1792585476835;
        Wed, 21 Oct 2026 05:24:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:93f:4498:603a with SMTP id af79cd13be357-93f4c993775mr771856685a.35.1792585476312;
        Wed, 21 Oct 2026 05:24:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583ffa8sm5403940f8f.51.2026.10.21.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:24:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:24:29 +0200
Subject: [PATCH] gpio: virtuser: constify struct configfs_attribute
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
Message-Id: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPyu2GoC/x2NSwrDMAwFrxK0rsA2aT69SskiOLKrjR0kNwSC7
 x63m4FZzHsXKAmTwqu7QOhg5Zya2EcH/rOmSMhbc3DGDdY4i3HnjAdL+bYSfU5afgwcg+Jaiih
 6E54jbfMwTT20oV0o8Pk/eS+13oOTHvd0AAAA
X-Change-ID: 20261021-gpio-virtuser-const-configfs-attrs-c0f57ed96884
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7bLb7fLTC06kg6yZomaW8t7+VtRnOZNaDgAV0I8jEl4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2K7/pYllIlsfoRxi+gsUuPC1odAdTq3a7VqNG
 Gw9RHQBjjWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatiu/wAKCRAFnS7L/zaE
 w+IJD/4sBjUhI0qo2MwnfCTudQQhfBdXxSiX4EYSjAbWXJA/3R+cq87GrJ96COhkplio3Eam7Gg
 EDdbitNRH1QzrTk/FiP31S/IiqvZoYHpol1UbvCJ7NJqSRkLyIQQIOfEb9KzlY2295ZNiVXvCXr
 sBJ9eI4QV9mszeF8YFm6Hnet+s+XBKtGBegG4nS/Z6b16ky+v8OyX/9P1MXqAFRz7HwelkA/AYa
 7Vbwkf9LRTHOBFAak94Ph8f5/aBwCVIMJ9f1+yZsQDzfAi+XEwPMC3S0vQj1/uRwp4to7BHwEyb
 CxKXQwehgHQFCs/TWg/Y8YubqzscV1M0mf+CngZO9yFegqb4R2JDFHsr13B1ti4mZvTmhuyD+YI
 csG94mI9WPrwvEtzKvQi9+4XjOaOIuiotciIX9dxBANWKwPYp3QSDd5KnkX/m0Dcce/PUZUJzRz
 Uybfrfk5wHUo7fzaULFL8o11H918U1s8+xEvVVzDbM0dbwHq8xGcPRp5f0r+hLk1Ma5VSFhieEr
 NagzF4k5opAJCjr7e1D5o9mzt5AUrz17FmQFWpq+pbokrK4qSrwyFzR0nBVc7hbniSnrWciKgzJ
 G+OyM3tdMybpAcc9z3WyRjf1xUxVINnx3qQ7DYOb5FnbWRmRYtNkz738O8YgDDOhFoLwUZgIF74
 xfG2gXswCztCQLg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: l-K5c95fWwSAFbwlllxWW8F0bWtnHT7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX/jAiP4+8zvQ0
 wYXVum37F9T8bOzRD/V0ECG7dcGkYXT13iXdQJiG0K9o+9MTpPKt0vV5Mop0YV+qSefBHGOy8Lx
 Je/kDi+fmVkUXJsoXRTyLkDgrNCDKEyAwaahLbPOfWOb97tkDRABVV0oV8k4wNi6zZ2Slfs4mso
 p8v2ed4CEQy2Xc/oZO4ztaN9Ejn+uAZ5woafbaTR2g76t2ptrIjBPEYtBXIdr6AH9QZjAhpfZGu
 TWbMFem5kCKNtmkW0JbKAebdemf+j7OfeJibtktiBbMKDG3mQkGpDVj0muQN/VimKfpVeaugJVC
 UhBcDxyX99fTuIvC9zblLTpZX5HzQaBtQzyRLn6K8OrPfENAhVa1TYDhIj4yDappfTnK2Hf2bRM
 5cJDA7hRKGh+TW3PdCShd7soXM08nuePeE9Sh9C6HxHmHaqg61ewbG1FAif8mCi7UmVDHv6Teik
 8NmVW+DtKZcsgvHVbzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX4v1ljcfcOsYB
 2KqfMGiWAzlGdYc94+XTvMcNz8V6ibGJmvxK8HKSKJQ8w2yJX2LicDdjb9nJ8seq2q7SYwqRU8q
 jkfusiyZFlFrzKKDih0EJkEiAKCY9QA=
X-Proofpoint-ORIG-GUID: l-K5c95fWwSAFbwlllxWW8F0bWtnHT7a
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8af05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=LLimkM0tROmH98zYQz4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210049

In preparation for the constification of configfs attributes, make the
existing instances of struct configfs_attribute in gpio-virtuser const
and use the new st_attrs_const field of struct config_item_type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-virtuser.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 70ddccccc1c4064fa92d57e460c4d3a3e0e93725..bbf42b9d45957175ec06d47533888350890191d4 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1321,7 +1321,7 @@ gpio_virtuser_lookup_entry_config_transitory_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, transitory);
 
-static struct configfs_attribute *gpio_virtuser_lookup_entry_config_attrs[] = {
+static const struct configfs_attribute *const gpio_virtuser_lookup_entry_config_attrs[] = {
 	&gpio_virtuser_lookup_entry_config_attr_key,
 	&gpio_virtuser_lookup_entry_config_attr_offset,
 	&gpio_virtuser_lookup_entry_config_attr_drive,
@@ -1571,7 +1571,7 @@ gpio_virtuser_device_config_live_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_virtuser_device_config_, live);
 
-static struct configfs_attribute *gpio_virtuser_device_config_attrs[] = {
+static const struct configfs_attribute *const gpio_virtuser_device_config_attrs[] = {
 	&gpio_virtuser_device_config_attr_dev_name,
 	&gpio_virtuser_device_config_attr_live,
 	NULL
@@ -1600,7 +1600,7 @@ configfs_item_operations gpio_virtuser_lookup_entry_config_item_ops = {
 static const struct
 config_item_type gpio_virtuser_lookup_entry_config_group_type = {
 	.ct_item_ops	= &gpio_virtuser_lookup_entry_config_item_ops,
-	.ct_attrs	= gpio_virtuser_lookup_entry_config_attrs,
+	.ct_attrs_const	= gpio_virtuser_lookup_entry_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1716,7 +1716,7 @@ static const struct configfs_group_operations gpio_virtuser_device_config_group_
 static const struct config_item_type gpio_virtuser_device_config_group_type = {
 	.ct_group_ops	= &gpio_virtuser_device_config_group_ops,
 	.ct_item_ops	= &gpio_virtuser_device_config_item_ops,
-	.ct_attrs	= gpio_virtuser_device_config_attrs,
+	.ct_attrs_const	= gpio_virtuser_device_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpio-virtuser-const-configfs-attrs-c0f57ed96884

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

