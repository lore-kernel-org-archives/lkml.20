Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302979;
	b=XZ/EC4BZN8LFdLIu/1zQE9siA5eGV9zfr935KeHq20yGnpHRuRmvtmGhhHeOzR7ABEEC
	 SsuCQO+CPdMg9JHkNCUB8TQiOtENFMRWYS8E/zob28v9uBA7BQO732IaGuVtk6RPvXp1I
	 bKuVG7imi+qnjxb6BGruPIgPMW6I0+xvZefKpC46KKVkG+WhkABVBRcbegpIQl4+8RIb5
	 5Ph7Cpjmr0x74VRK/TngT1Tgpd+p9bFaPRu3eVwYQrRco+zbiBqnuqJ0Auja8dUsB41gM
	 8arIzsK8m3E8Bsh+c38xXnGwU/yG4NVhVUKPGRZaIS4Xm/ze9LDIX05q/fXVxg8JRsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yscYkUexLWJfxvh+W/7HnXySz2cjzUF/oCyCwV+MFns=;
	b=5lfsEtPGPapm6EnBnllW7hkJkwdfvss9m7d+RVhVpakIDO9QUDjQMdDhD8FxLpcDp+GY
	 x+FpSyRGTU2rUBZIbFu4/z08BJ5uFyOIodVQLQOzyFulxGaJtski0GdYZX1kAOozWA3Ds
	 2y9PaQwJJwC9Nrxy+K5YcvxqEw4kqMP6VpGDZkUKBOyy4yw2MuvLlY/HahZ1Szu8bcolu
	 PKLQjfS3J2Oi9gzfCgh3exFzOypKzoAUZ+1XwVMbq88adpfjlYj2++Wz9qlSXN9x4CHH2
	 PMkkbTgCKxB55AT69HGjQxyhn3cam8sXuAxWim7rrhy8BjifGU1MuoHt0AJ3b9VzsJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eELcwMWz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="akKAedr/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EC8606C65D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EC8606C65D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eELcwMWz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akKAedr/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZPqI3850073
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yscYkUexLWJfxvh+W/7HnX
	ySz2cjzUF/oCyCwV+MFns=; b=eELcwMWzeM+to2VgT1HQOigHgksKzMfnZN9Qhu
	CKvy254934GdSSfVJtwuEDgbwsfvmHwLK4b5ESZKMbcgJoMCp9T1Eacwz9ADFOYb
	tCLw484LbXB32XlcFmytva3xKYxDu+nfti4+r2vKSNr8Dpaue5W9tJJx3b8x+mZg
	5TLRh8BQxZLhaA8MoN20/T32bsY/kkiIqZztay9aHjNAbfqSM3bYRpmUBPzLvmmz
	3KFc9ZZN6EjA5gxtjt9lk1wmCYHHMEF3Hcq94+KqxMSNjwkm3u3Yp2We4sxJ9Wl6
	5q9a0nosvrDgFCcKQEiuifmJvMsWqA/8Q8cDNI2Fz4DnB4pg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwg6ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so330944385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302977; x=1794907777; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yscYkUexLWJfxvh+W/7HnXySz2cjzUF/oCyCwV+MFns=;
        b=akKAedr/rjcEFJfGCjQuWjKGQTPyAfCzzsGjXUiOGHsoGZT8y3EC3k6kMmvnbVYD5a
         q4K3RzhcrohhTz04liQAVgq9YoijGKYBwvj8wu/Sl/I0EYCNAvYPJO1pQ1Xa/M+Ltw6e
         l19t7dSjfZX4f/vil8jOJDgUsfR3v2XBlV41v8S15uGGuBzFB5U+M1C+/a00Oqraj0SO
         FxZOc7Vz7hSPsIaQvy1k40p4l6jikg3Vp87blMXiYo797d7He7uAwkEhm+r+Myeyjg4N
         iH2lXdrSkx4xgd4vRg9SkXINSWiiNTW8hK/YymxK+R9yHJln9RN7Hs81JWK8TxCEqiFH
         /A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302977; x=1794907777;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yscYkUexLWJfxvh+W/7HnXySz2cjzUF/oCyCwV+MFns=;
        b=ACn6X4wsU5BQ0GGKXZCOd4bAGqfMUp6bj70KooFSFzU1xFUmYYFhMcTeAuLFgm3gob
         OhEtJ4I+m3Kw6TzG6t4PZmJwdAYKIQn0gzUko6fTWNgQPoEbUYtSg3K2FU2nMNApSBAr
         5gnksMn6tWRMZWMpFrfOZrd5XaEv9INSpbBIb1bwiJCfnrH4DaILde8RPd3buntOQi9X
         nqk37UFxEyJU2qtjLq9xw1GrvehDqgL0KItxanaGkJ7clALEcAiIPREUOTsUuUr9v1AJ
         ee77U3epJO2HEZSYZepMlAboPbHWnIvgtIoGudd+Jg/cqSBsQSBVQx6BuENMj2NPPxYI
         NGrg==
X-Forwarded-Encrypted: i=1; AL+hErEcUpicbExumhxbYj0xrgNfhplBLjEWgDzQf97pYRal/gg8otj2DGNKu5pOwfOvNXCfdKwCMlDk/4VaOGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jk2Owh1+on/31c3TgV1PKFHvgiIAnO/8oe11w4w2aRUM7EmwM
	BFCC29Xf3oGO/5Yg2cpZg8/iRKHR42jjL2u/1R8EuyrTxNNVgqi5NtaZfy+ExWgyTuJ7d+PoHGi
	/DPKeIYcj5835meY/ZujITgSQrN3kBDygJ4RhM0mvxb+6SYEC1h0fWNETDh00yOkZdfk=
X-Gm-Gg: AYBFou3K8YKNbKK2JSvhWPK6SUtkLXxymNvEH27X84+g1f1+6vdZtGQevE1SBHlghvy
	mURiEHfZxPeCtl5m1xba8vWY15IA/CaM6uO0go4B3py9IOhjvsBF67WEMONh6I/pKDkHRQkDSnn
	lPYguz+q8tr/1uHySUahPnZ7R9pRe0L2LejAaJgmDMoIsDhpvYBSK2cZCPlAPuxIyLrmWzFUwXi
	qE40i7dEKMdhAWIb0m9bI/Yt5ftYZWJve2s7HPplftpTgZMNd2jM5UN/WESb1us51PWpPM3Kmbw
	GF28spRnvjoUg8zcLmGXRGB+leXkgNQXehkfWRIyX3W5SgHKf3r/MkIPSbaYesi0wb/p8zA4J0f
	79MaGN6Er1PQ76+k2uqYGRKNDFqp/MtekOdPuPPxAotupJjIOfiDWF0AgRkaL+SJ5fT5JR2QZrg
	6CV/XRlPCReOG+K3KHXBWZ+9DPVsLY+RjspeHf0J3NirOuGHDlCfMnZe5SAHwpDMM=
X-Received: by 2002:a05:620a:c4d:b0:93e:c12c:4416 with SMTP id af79cd13be357-9479f42082dmr320113685a.82.1794302977564;
        Tue, 10 Nov 2026 01:29:37 -0800 (PST)
X-Received: by 2002:a05:620a:c4d:b0:93e:c12c:4416 with SMTP id af79cd13be357-9479f42082dmr320111685a.82.1794302977112;
        Tue, 10 Nov 2026 01:29:37 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm3891597f8f.25.2026.11.10.01.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:29:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:29:34 +0100
Subject: [PATCH v2] gpiolib: keep the line state workqueue alive until
 device release
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
Message-Id: <20261110-gpio-line-state-wq-uaf-v2-1-ce6d8266656e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP3j8moC/4WNSwqDQBBEryK9Tosz/qKr3CO4GLTVBnV0Wk2Ce
 PdMvEA2Ba+gXh0g5JgEyuAARzsL28mDvgVQ92bqCLnxDDrSmVJRgd3MFgeeCGU1K+Frwc20SHm
 cxFmaFsXdgB/Pjlp+X+Jn5blnWa37XD+7+rV/lbtChZqUzmoTJzpvHlYkXDYz1HYcQx9Qnef5B
 WR0QKzDAAAA
X-Change-ID: 20261109-gpio-line-state-wq-uaf-e7343655998a
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2653;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MWVJTIMmNEMqwOuajXFKHuQmIYtJhpU72NPWNNIzx9Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8uP/58d7genk90ttA0p2qWwt+OyBxzCbbUeKx
 4/FYeBXtVWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavLj/wAKCRAFnS7L/zaE
 w9PeD/4nw6H/XdZcD/cO0ilbNcICZxhjkddWj6elKnd1HRfMiqfgxE65SQ8TC9l5reJ8tSb61tj
 4u7LMifQgWIAx/ZgSVYkdiK1NyJe7Dui3/8yi8KUUrdSqg12/QfCHHvYpyyeUWCe6ZY+6tSe+Cp
 Hnv/YxEGfB7eGteTMBtucb8OPHgT2HomJQegxIfPlC/ZYO/E/1+jAFkFqM8xskJ5XonhYTr9TI8
 WP2QqZEo1RL4RbTNrO/XAZRk3n/sCaGTJ55FFQyDkH8R1n0D1QaeyMe0/PcBqCaHJJkZj9g80p5
 MsaoRoJU+eMM8TL3tPCIyrkbJMjXpa+N+/VES/a1i4gQrgjbN2pgw9c2RA68i4Q61s4YxRlbdof
 B3L87vHuSdQpHdVqICsFbdfUNaHBghHaqots9gCEfPsla8+HR1knKJr9AUoedZZnGOTwnZurn/b
 Z+l1/0Sf40EfDNLCDNvuUn9CUjnB5wmyGx8ZwiudyncbPQb0rHyYaMv0bkWBkR4H42u6ysc9/ld
 aXacVSAjKlkF/29nyF9yLC63qYhOjIFvWtQn2cGBTObsLcuMFoynYst2g7LVD7AYiDAMmfpEs5d
 YpbRafuRxOvuMzCGq/FBhqdZLpEOuGfMCRqNDl+Ruv+0ni4MwpbmEiZfotBts+BswjNeS6uweK3
 1ljRGfS4TEa3gZw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9jwyGLQdoSKEsV1hTmfbbO0yQ6hNuzdU
X-Proofpoint-ORIG-GUID: 9jwyGLQdoSKEsV1hTmfbbO0yQ6hNuzdU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXx+8EgNUkYPUi
 5RMEI3UgMUWcOdXmFpIvmlEzmfPAESsT/lgAOBLEKdhzfT7xg9c7BRCpRUKF39z8p/dIgKEfddN
 nRQWrztj4+rsJED9bAtEE5gC7uOC/PA=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af2e402 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KQQni2JmCJhbBse-3uIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX8ed4TDR48BN4
 ebdh49NSR81dA/zadU1skSIZPRzEG8JCYfz2hlKaYrfJHppW+gddbovvaBuyC2sHtAmh1sk5q5b
 xx1kc5YFZFownm819/6x8rI2sc9EEHXrccg5kq1a8aHk/7IoaUayOwSWxptSbJ7AufYoEuWqhOf
 B6VYSGrhHI29/1IbcEp8OR29lx/pFDFbEcLLK7Qc71vj8iQM6HI377/xnCMq85y5oAezDjnW7bx
 wj0tYPaDMg5KS4QpiC22NIJv6vhyNLuBE4UQ/reJXUz1B+/NvO20zm/Gl3D1ny76nAuXpgcafpk
 1uZJq6BTPyjoWd1eorP0550VyLOtuU8z9hQ83UhBfnSqKrIgU2szyH9Lue5B1sA6tTu6WS/NOfa
 UuqOHmqiwl2Wsj3RMjtQq8Zb9dob56/c2v4vn8h5/zHLJwXIraTOZIu9t38fKOV0zWmujEz9PWy
 9XaVRY6TyynGHjKO4VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037

gpiod_line_state_notify() races with a concurrent gpiochip_remove() which
unconditionally destroys the line state workqueue causing
a use-after-free situation where queue_work() can schedule a work on a
freed workqueue.

Keep the line state workqueue alive until GPIO device release.

Cc: stable@vger.kernel.org
Fixes: 07c61d4da43f ("gpiolib: notify user-space about in-kernel line state changes")
Closes: https://sashiko.dev/#/bug/linux-d0e9e518-2348-4fe3-857d-f3d61a42f159
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Clear the workqueue pointer on cdev_device_add() failure in
  gpiolib_cdev_register() (sashiko)
- Link to v1: https://patch.msgid.link/20261109-gpio-line-state-wq-uaf-v1-1-2e126ca3427d@oss.qualcomm.com
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 drivers/gpio/gpiolib.c      | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..2a27ff7ff4f8247d87284e5d6419ada26d86abdc 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2758,6 +2758,7 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
 	if (ret) {
 		destroy_workqueue(gdev->line_state_wq);
+		gdev->line_state_wq = NULL;
 		return ret;
 	}
 
@@ -2768,7 +2769,6 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
-	destroy_workqueue(gdev->line_state_wq);
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
 	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..c954c7eec2bee3a8dd55b949ec9b92f31461b25d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -28,6 +28,7 @@
 #include <linux/srcu.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
+#include <linux/workqueue.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -898,6 +899,9 @@ static void gpiodev_release(struct device *dev)
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	if (gdev->line_state_wq)
+		destroy_workqueue(gdev->line_state_wq);
+
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-gpio-line-state-wq-uaf-e7343655998a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

