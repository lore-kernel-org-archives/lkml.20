Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713698;
	b=f/gbT7jPlmAwNc0TPCffmCem84bamDnGp54lniQ/swuLEVGbnDZfz6ogvAMqeu9S4/ov
	 YZ49Lbunekp551DOPenjJZZO814UTP754+n4h12ZAlNWpo2R4gXj3uAd5hKhFgtRpZTPc
	 lUFYo1h/b87T3W93GdzRCuc3iYADJgVamfjatjEFALwj0C6ZzCfpb8vjw4HeDVY97kJh6
	 gYZ7YZ2wNu2zv7WeIaqb0j65BHPBKIQRRr5b8BS3AciVYdSVPylEK5Ucj2sE3ITQbWFsm
	 Jbm+RL689qvP5T5p0kabK0dZ2qOXhD16lKuqmpM65s7garyH1YHvbzIu6A4/dkFGKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
	b=bLYDe568j/OS6AKp2sODD5jaejgnw1qhP/HxXk6RbiioHE1pYM5z2T+kYlDejJSYHXYg
	 ymLHksEyDBwHr4lsFJAkXb4chlvR5x3i9f9mQN38ic/CRt6n/+WLlE/PDKWoG7nW/lAlY
	 PmfTfq+qDbHRk+jrobwVbtdpRhlKsyiY59gQ/cUKxN2BmTEjs4BTcNIfrJfQt+pJij+oT
	 MdQw6ueLfHoppR8rNXspGdHwwP3ucWo3ttDk+rz/Qed50iMSQEeCm6qsqKyo8RQX5YTA4
	 xZ1iMmkbBrLtKQEym1qwHGI5v5aNbrUfP9P3pUsChkLh6js17WlnUNYHvM8Cfpwetzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcE9shxk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dB5/14SI";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAED606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AAED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcE9shxk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dB5/14SI
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZKev3612538
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QMKVm+mFH7XNX3dJ+CLq5u
	G8xadpJM1yNzclNMJoASw=; b=YcE9shxkeYClE6VG30Kleq8AprjzntTetuIpYu
	A3BnCTaDZCWgL2gZTOO+ripLJuIik/67bHIpmUCpYCoh7m+aXx5Q4T+FEb/N5bGr
	Y7BF4d78YCwUyCZmiK8tXyR0OD60dKc+CsN2AHyiaby8KmhPzSRJjrd10oeZL9cy
	M7NsGMC7FoMhBVWtNO8Ym2FWJ9XFJ9VV1Q6RnJ8jMHchchw0QnF3AACQMqPWNHyA
	9tCyFnouWueZJKt5qYVNg/T0U5v5a9YD3KxbXwBhLPRD41Qu+TtkA8pYpDiqh/xo
	EiIVgtQaf6F4XsyO3nEN69U3uS6b63YxmSUSPdCGZT5nae5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9aguu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:48:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so615075985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713696; x=1794318496; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
        b=dB5/14SIqvn8rITO7K1TNCWYePzuYRJKmGePR2rH9Fa9G617qgYK0o4v0bMBNQur5V
         uqmgKpuEYyEDnSEPLSEL7EUuNOlHDmHK60ljwgZY9xgTkeyyyWhLJRq7eEJpnY2NjHt/
         z/KbN5vzY3XGhodexmLx4kRlT+PC1HEhPsSEL5hm2NLADTxG7wKvU9mT7PHa32kXTItZ
         glDietFntU1qTd6HlNAbVPgkrmbIzXJQ7jW3eIFggRrQta97ipBIG2YrkmV1/lsbwJc4
         nZNEzvA4zE8FPTTOHmCcywLEGKrfz49CKwJ0j7JYn1GCpsoQ3FXr8JXZ9kVkKPq4rv77
         ptEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713696; x=1794318496;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
        b=CmjJ4U+p8DNYRz4fRfCjUmcPVMsNEeoeKcRykgSmTF9s4Tb931PyXltyg6gU64SEWK
         GZfoQEtOXgZsIkKlKUOMDeLWM4NydYwbdHyCVx7eC2l5iLoPaCs/ZEOQGCUVa5fftgCC
         fdEbkx8ZSxsTo9gy9tp+8OXTcrNKFzlbxMwwp505gP/JjBx0j8aBEfU75l4cucdG+dMI
         S1owVdnToFcG/6ErLgugzSFJWWtpqbqeYYoGZ3x1tKud9NaGMU1H/eF7IFJ5Od3Tvyyp
         feCrGsskdrxWeW7TktJeCJibAueYvv/jpeODpszASx0aVjBfp+yrfinjD2y80e8NfdP1
         ztAg==
X-Forwarded-Encrypted: i=1; AKwUvBw782wwb8ruozD5oHxVxfxmua7TfCipkMgYloD5yMT/0Decukjla1aF26c9wcDkt+2LTHXaxwpHTMEnJGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z99m7Lpr41Yd2cwiY/oAECFE34EHjfmTa93DcwuYMrDP0f2yJiN
	6OLyZB4RGhT4Pd9U1W/xyB2fZTrukHKcu8fKUvXowcF8ihpv/74UunJt/mNeOcrzRVPUz5thZbS
	SqcWkO1JrUVajZwn/qlD4NOjkQEAv/Ed3fP2PgPZnHBHy/XyzLuUyXyZhepFHSG2W/UU=
X-Gm-Gg: AYBFou3tntb9FZxaM4M1ubde+TOLdf0nQjhItcwv3dgZ08QD+Pap8P7xG5XTcPVhC8t
	l9r3bbJlXPHTUrZID5uwI5Hrc1OzfrUZFvMoxg0+6Tkyoj3h9+lL/gLsUMgV00T/DZhJ4iRl0yy
	tYVQuW9E6TstMseIac3m599TdnJJN6T0l0GUIVUsqlJ3ODtQGQJPfksUTgoEg2XidB9gZlRSxLy
	CP8OpUKL9XU+VsMCwQ4GfKcqS5zMDGssRwXmc0tt3EGwnGCmVNRtXk13tbeZr3Ogj+N8KYI7Q7y
	5Fhuj/F9XaleKrf6PDxOWIXwah1qd8Du2J7ZOr80D0tuBxMkdTPaizZqG1Ef/P0urSxrzT6Zxfd
	0dEWZ4oxL57ISVejl5STbGW3coBDSrfDuOv8dg9Ls1bDMl+Rf22u9T/FNEHfCctcL5pMegolkz1
	/oig==
X-Received: by 2002:a05:620a:2710:b0:93a:2e8:5af5 with SMTP id af79cd13be357-944214dc4d3mr2082621585a.6.1793713696414;
        Tue, 03 Nov 2026 05:48:16 -0800 (PST)
X-Received: by 2002:a05:620a:2710:b0:93a:2e8:5af5 with SMTP id af79cd13be357-944214dc4d3mr2082618285a.6.1793713695970;
        Tue, 03 Nov 2026 05:48:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm64445875e9.4.2026.11.03.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:48:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:48:12 +0100
Subject: [PATCH] ASoC: pcm3168a: don't request the reset GPIO as
 non-exclusive
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
Message-Id: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABvm6WoC/x3MwQqDMAwA0F+RnBdIKlS3Xxk7SI0a2NrSMCmI/
 27x+C7vAJOiYvDqDiiyq2mKDfzoIGxTXAV1bgZHzjNTjzn8evbjhDFFlBq+f9NdcM2aDJmePAa
 mgRYHrchFFq13//6c5wX8WIN5bgAAAA==
X-Change-ID: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5xo07OYm0SeDrgdQSQeYnj47BAStuVdTnBufjs9Uu8c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eYeaPuq5MOiXyMJQLVX11+K5CPHddyNo4VCQ
 EKxe4wsrdSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunmHgAKCRAFnS7L/zaE
 w/RnEACVKHXpPbQLfWI61qABDe8AwFPmGd9guHC01zlwTBbanUyvNA3CmYHGKtMGx1dDejHZxwi
 uYAsr1wO5Bk6Izcbd4z7vZxKZhkTXtgtZ/zBLy0JZKZr5HsD1TKQ8shj9RR5LyQC94LyC2oGAX0
 VVrWNZF8vjuhbppUvhOWJG/n5b7Grot1SP9gFocMpyxqiprbtKPLECJtt0vefOh+7nWLB/0r9db
 lXpqatfeUA1BO1nZ7dXcle/0ffvTgi8p+Zb7aPpHWhx/LxTJdYRkYb2N06OKgfciaHz5jz05qtp
 SVkvpCs/yI8VSsrhPcAf4vdhQ37Z76VI50wHgUbbHgGxTl2WB7W+1h7OP6WNbWNrAZDudVT4usY
 xcksA2tB967y1FucpTqOCGqO1RQgLo8/krlhjk2R3jwh4yESXiohonYtLhxG4px/Cjal9+lWOK9
 4aHE3T0Fcaa/I5ZpOGZbf+uDhPpTuD1EwCB0991Xgiyuie2cjRkwigNH3CECU47wZGYukD+KNUC
 /Gz3RlVXa4HtwqdB9bo8TaDpVjDaIqNU+1BpjMb7tED72CHU5kCC4HbkdL3B34o5bwe+PrF8ENX
 /n841MLPdI2axz8LKeu9885RwjEnOMcJ0PFuPSKGAq3XUGEuYUHaWlCSE+vz/krmoYrLkkD44YJ
 mqwVMakQHGYDv/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Ij3oG9jZJc_fDp1QBjy0zClxdZLy3P79
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfXzZ/Vd2BBajOI
 EFbQoa/Xyo/G3ZJ8MCdFT90umqTdmZraCKWKJkI8wSvbSzw+S+yQlY7UYLm3J+GsFrPqfzLubNW
 1tRNFpqL52jtdoaAjbCh3FykbIM5UZc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX7vWup+8renqR
 +Iz1SBdkPJEHfpCWA/eZLS3jdr9Tb7rzA29VKVRzB81iNx8goYZQtaYnZEOCrk0fHChunE2K2PI
 57XQlGwBOYSfLi7XKB4Fo4xhdcJKEIdPKda/xSZ6f7cFRDH5m6Ex84t+ENouKSzCkuL36jfICSR
 qZ0aFn+zSrns4yJywBhoJNnPLJ0jcNLgHiHrAh+PII9f4Mu6ErR8BsZqd0r2H/frejnaNLNvhm9
 8fLhdfawJp/dQv0IkQRLm2PXm3xOK5+bUIUBc/WZgwdsHVuGY+He7PegD1HWkX1+Fmj7by72dsu
 xyLblPc8zFM9cuIpbYZLM5xYchYZGiBttiREuIAqMPLwiukIEWHdxXy3sI17NpW6b5s7tuzJkR9
 GJXuwViSZ0fod7hYolISWEJ4btG5ELQkDGXYzBacAsiSbyNOXTib5Y68YlO7SlbUMjeCrSnF4WN
 F+S2Oii0H8N3OBxfbRA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9e621 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RTQ-KL1RhNhVEIJxQikA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Ij3oG9jZJc_fDp1QBjy0zClxdZLy3P79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030054

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
rely on the GPIO shared proxy. All users of this codec driver are ARM64
and this architecture now enables automatically shared GPIOs for
everyone. The driver now longer has to care about the sharing so drop
the flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 sound/soc/codecs/pcm3168a.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 6f45ea4869a75d77344b06e1092aeedcea160058..c1a263216ea6d88757053e93d782b8c8c01f8d1e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -725,16 +725,11 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	dev_set_drvdata(dev, pcm3168a);
 
 	/*
-	 * Request the reset (connected to RST pin) gpio line as non exclusive
-	 * as the same reset line might be connected to multiple pcm3168a codec
-	 *
 	 * The RST is low active, we want the GPIO line to be high initially, so
 	 * request the initial level to LOW which in practice means DEASSERTED:
 	 * The deasserted level of GPIO_ACTIVE_LOW is HIGH.
 	 */
-	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset",
-						GPIOD_OUT_LOW |
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(pcm3168a->gpio_rst))
 		return dev_err_probe(dev, PTR_ERR(pcm3168a->gpio_rst),
 				     "failed to acquire RST gpio\n");

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

