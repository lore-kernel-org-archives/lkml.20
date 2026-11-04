Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806635;
	b=qTRXl/r/sMOX+oImEMBTIt5+w+mMNBqtA4YU7xyyViW2NY13OQJS4kENRIWHRc8hW6hZ
	 9itE/ddoKVot7yUtDEPfcp2e3YZHbfrfbyjc5t8m/hS+MKXGX7VY+WbpZgOTqJDBJ6zqv
	 Wrs7Ps/1rmBeEIds7e5CF9qtWRe4idJ73FaiTvJ+PzLO+C2xLiK/DT7qMhro8nUHiW0/n
	 ZvTnsFq6KIWiCNc4rgicvb7g/ur8iCy3YoOc/ew3ZZf8aTUBunrzUDNy6DKjRnow5kL3o
	 YxwTQB8a40vYk2whdsHVrLLVr1+OZd3Yx0e+qTrGbwDTtanW8RO6sifWfY61wSfzvEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GCbBZCwClFeXgTJ1PJCgJEYnCrArAy2gbqD5QND+lDg=;
	b=pQ7vWPVB9bsnlSWJoDbTryJUiR2SzpmsX0h/lvFgQIWjONXqjOcNdIsogo7eUKhdFPXa
	 LhEQ6XNkwevgHTrZA5nBd7nbYtbNpyU6UuHhc8rRHHKXwqRQJPWUtvUxXveLiHE0ywezT
	 EBmHchIK9W7T5LcP8Z01WM5W8EoQR8WwwNLfO1q71z6HLX+LdxTxgJ0vCwWTUAOmXWGhu
	 ZBkShn6Sajs3AMUGeABsmw6QfaUzrLIAOFh3xUfg4nfvyrcZbLVJmMPxRrcH+LjeS42/u
	 GGiKjERWCzQ2K/3KVXRvMMnO1/v35a3xQnvSCgKFuLJI7dWVP6Hr3UUYyHdsMsfZumw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jeTchmkp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ERhd0yeB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DFD60A3804
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DFD60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jeTchmkp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ERhd0yeB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZxd8608499
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 15:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCbBZCwClFeXgTJ1PJCgJEYnCrArAy2gbqD5QND+lDg=; b=jeTchmkpguMrM6s/
	rCn/xyF2hEtqPbuLPOU7p+cv7mPrd+HC4rdN2DVssjRV1pv6mJqoxxPWW3O7y5U3
	NU9Qx91PzK47/GlX3LpVm8gn5Z+BPngfkvupzEHP1kLyQO78bLc3YgqD4ArJYux7
	l6qv5LgAchjs0Nf5abIRKJHJKGwSJTP4lRVbXXww2FWFPidSVurVwJWH64bChNtI
	H5LEiRz7SFXGmfH2+3T9Z4knXdKg/yUVTiVZmn4wDRxTvjSJhPSFQfA7j2p1AwhH
	0S2RtiyroWsmWZ8fGO6XPFJoIYVyUWWMwK9JRqA6WfFXqu93tvrxtYL4Y7GiHRck
	2tq0yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r81071-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:37:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso182881985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806633; x=1794411433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCbBZCwClFeXgTJ1PJCgJEYnCrArAy2gbqD5QND+lDg=;
        b=ERhd0yeBQ/MXSV7yO/KaLrze7HIgsostCegawaf2veAgJphFCvjiXOInIuQ0pSzZVC
         8Mq/t0PoEF4ekChgBht7FHj5ovy6vwJUidQHHoHia2+WkUqyq4MMeIRQEKpkRqd7oZ38
         7nWGLPw933iYF61ZUrQ/WrDgK4Y4I/n6b9nyMn2z5P7GA1/+obrjKY4dmOXwAhoF85yI
         GjP44jT0eEUc37DlkgogsGm8h5c7vb5OO4oTUr8+GWVDt4x0OSvyIninr9GPSqM/wknO
         ybHE1By+xxQTB0d07dNWlJOWpDdgjvaBIyr/icJ4zSIJ66wtsrmJzmlad/+PDb7kuvfC
         mUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806633; x=1794411433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCbBZCwClFeXgTJ1PJCgJEYnCrArAy2gbqD5QND+lDg=;
        b=YVr57FeELLXYu1Uv/iLyGE4aCVO22lLY51q2RUIx7AVvVs7RvR6M9QoigJm5DmxHxM
         uT5jvmmzUoA2I3HrprvVz9kivqOuN3A/EKrtUoc43f1nKLWjjoKV6km0BJZbUYZoYZPl
         lIpq4fseotIm5M2XHw5kOS0xzK74n/hg8gdKE2rAZPgz9fejYGlj5YAet+Tn+lu4SsUP
         1Gr1g2gUrZCn9LVLOt0ZV3OB5/atP4AzG4/IDqK3gPxihW49T3HXxqgd9WOF0oauuJjt
         6/O9hhlNRQCyHuizdYK67rtSg4qZb0C2fallGoGJKESSguNLItxtwmPkpp1nUwEZlDy9
         O1PA==
X-Forwarded-Encrypted: i=1; AKwUvBwB5zO4IHrfhYL7r+It8ljN64E9VHl347p99nz1qhA2zE2ctyse8/Sd8I0LhJdjvDx1GrgJqOB9hZPsi7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RSgIiDb0ljVPoV06DLJG+JMDQFAh93FLPmeaXF9prO9czjGsI
	wlBfEcdWeX5AiZOMOWERu9uiwd+gRUzmoUx8Pm0TNkG8WBuqJ4WwBzVoHtg6wwpf9hBr/WCuSwE
	Y2nTPOiAOmqubatWG10FtE0OuZVaPHz+PW87lBneKfWeg+iv1PDPBeSJfSJjnsF+hrQB7y1378P
	g=
X-Gm-Gg: AYBFou2iogKq/4vB5EwGeKppvHtOPjRRfS7RsoNqx8xCFScJCGpGkeUPYBrY9DPWJsF
	jvVooZ52cEX/g/MCq7l54riyGUU1HX6+CtvzfsoA7mq+rLlkeTwO9QcKpVdLmLoVxSJByhFhaLR
	obgHtMEpvldd09147FSPBhZc9/bTznYYrg0rehvPNhKUzCDqHWEIOX54Ge8SQtYiYVYRHOu3B74
	NVwigj5V0AcYBB5m9MViy10LLXNr77NJY4Ioc7duiUiClk07kMR2Cptmc57AdS+ZTR/UYCdzchy
	exyqL//sQHjgixTFpEvaWyWPsTcJyCNj+EWQCv0r1RdrTPLlCMjdf1ociB+YqHwstTdz1S4XdJ+
	K3jvjZy8DYaD4uQehObAdQKaWE8es9Hpme7QDJqS/lx34ISXZtTqN/ACuwnQjjX1i2uipQdtHHI
	XAsQ==
X-Received: by 2002:a05:620a:2956:b0:93e:c12c:9b70 with SMTP id af79cd13be357-944217fdc45mr2749574185a.75.1793806633158;
        Wed, 04 Nov 2026 07:37:13 -0800 (PST)
X-Received: by 2002:a05:620a:2956:b0:93e:c12c:9b70 with SMTP id af79cd13be357-944217fdc45mr2749565985a.75.1793806632550;
        Wed, 04 Nov 2026 07:37:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:37:00 +0100
Subject: [PATCH 5/5] gpio: cdev: don't overwrite the whole flags field when
 configuring lines
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
Message-Id: <20261104-gpio-desc-flags-atomic-v1-5-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7645;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pq6cge19dk9+EffQ4hfudn4NJAXnoLBAAiELZ4DhP20=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61EbHFo7YQ0voMFdfqzY04wMF+BB6WMhy6jS4
 rIYz991AXGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGwAKCRAFnS7L/zaE
 w/hnEACjTxc7SeocOi03cjeL+Vs5h49rLbEAdOTvWsme6DLvf0QmLAGVxD1RkvEfLqckDJpCq0U
 hWh+wpRRHs64kCQ5Jzq4KNNgjRKopaREi1HRhuTYrJT4sVTZtlqEZh+IumGJPQ0uRhXypPrW9Rl
 clXS7ouxEPV7ll7zPA1tyCcxAfhw9d1ExKe7iHKIvLbgZxfhnb/cffMeV448MEEg1QC5193kykI
 xgsIcqoTGiQ04WJKctVTsI4SODxz/aAbljqPVMxgx6nUdV3NZcIxHPWa1Ag4CAMnDya8K8R53UR
 SFoYcXKd02wo7xWS8rZs5et+ET/TKrCJCJjfOcfIt02UzI+7UZIR/WsDq+Ub65xT40oF/10yQq9
 uKrhULbONcC45KxNbU3f4Iar6XfN3Iu2ohxxATEcpuSpSZN98pYZl9bvcOPdWFC1VH8GOmDh0oA
 rANfT82V8UEE7mDlE/kvWgYbjX1eoRCPMTKTxzHDJhFDC0qrKvhIXVVuMWtHHIK96GeHTcJSO52
 /VEEyaDINuQGi/tslDnqHfZlmjF+Wwx29zVxnOpcslYZeg2H6nonyGzCx5y9kObxXjd4Mm65+R+
 +Q57VC2D98TusT7qHSN9SMewICsiE2c7VaCYJa3UhJz8Ot8vWSt/z0xrvPUXHuFu04nKjDhVXLu
 gA9COtE6updDWlw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: zl8UnZYGge2r649-IJ2r4E2ReOvWcgJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX1njTBj6FHs9v
 54FOm25VGRG+P83WjdLWl48LiTSk0oR4qW2Ez5YwhrBzFA5q28t+r0EMi9zIIxgySWzldC+BOcK
 vtQJN2JEp6qI8cBBd4lXmNd9ksBKCiynVRUsmwJiyl89rtIH2eKMoy3iTWJMvARWSfDHoI8D8ig
 j5T+egQY9z1Ta2e0FOBOJ4YSMPE90WvqYfF9Tn1/vLnd2apfiIDZkRibjYS1C2V7Vraf5odff/F
 NipKd7E586/xbrgNmbgsvuQL3ibiEhuMA5YsAvT0kyz43OhO34M/VelA+ndDKXTkYhR+8KfjHM+
 3O75RPAbb9fOiNZ8GgosArGCh/8GyN1z2f4eg/wNio5frIUMDTO1dC21uJF6RaHxdaWFu7T/e0q
 h4Tqjxx29xm1c/j8USUvLoW12uPQqK4T1rGe/ZvsF4V52PkntHhtkyoJ56f9ZcFrsJHeVSEYqzo
 5LHB9zDgZtpjFfS/mbA==
X-Proofpoint-GUID: zl8UnZYGge2r649-IJ2r4E2ReOvWcgJ3
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb512a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FxeHtzAkRt4RPYSLnXUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXw8SawsYkWaHM
 m8GN+OtftYy2RSRkDlSlUTg0XvtOan2aTHkwiC3uH1MPPyoLh7OwBcrTJQ1PT6pNWwfVf7GAmEG
 YnK+3xYt411HrtJCgbS7hoCK0iqqtEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040062

linehandle_flags_to_desc_flags() and
gpio_v2_line_config_flags_to_desc_flags() read the flags word with
READ_ONCE(), modify the local copy and write it back with WRITE_ONCE().

The per-request config_mutex does not exclude sysfs, the irq core or
drivers touching the same descriptor, so bits they set or clear
concurrently can be lost.

Build the mask of bits owned by the line configuration and their new
values locally and apply them with gpiod_update_flags(). The whole
group changes in a single atomic step.

Cc: stable@vger.kernel.org
Fixes: b7adfb6076ff ("gpio: cdev: update flags at once when reconfiguring from user-space")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-cdev.c | 118 ++++++++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 53 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 3f1f8c9acfc3c10d5b3e86b70009f1226793cbc7..b7f0aec12c8551e39d042a1999fdfb5683ae97d7 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -140,24 +140,30 @@ static int linehandle_validate_flags(u32 flags)
 	return 0;
 }
 
-static void linehandle_flags_to_desc_flags(u32 lflags, unsigned long *flagsp)
-{
-	unsigned long flags = READ_ONCE(*flagsp);
-
-	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
-		   lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
-	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
-		   lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
-	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
-		   lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
-	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
-	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
-	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
-
-	WRITE_ONCE(*flagsp, flags);
+static void linehandle_flags_to_desc_flags(u32 lflags, struct gpio_desc *desc)
+{
+	const unsigned long mask = BIT(GPIOD_FLAG_ACTIVE_LOW) |
+				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
+				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
+				   BIT(GPIOD_FLAG_PULL_UP) |
+				   BIT(GPIOD_FLAG_PULL_DOWN) |
+				   BIT(GPIOD_FLAG_BIAS_DISABLE);
+	unsigned long val = 0;
+
+	__assign_bit(GPIOD_FLAG_ACTIVE_LOW, &val,
+		     lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
+	__assign_bit(GPIOD_FLAG_OPEN_DRAIN, &val,
+		     lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
+	__assign_bit(GPIOD_FLAG_OPEN_SOURCE, &val,
+		     lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
+	__assign_bit(GPIOD_FLAG_PULL_UP, &val,
+		     lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
+	__assign_bit(GPIOD_FLAG_PULL_DOWN, &val,
+		     lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
+	__assign_bit(GPIOD_FLAG_BIAS_DISABLE, &val,
+		     lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+
+	gpiod_update_flags(desc, mask, val);
 }
 
 static long linehandle_set_config(struct linehandle_state *lh,
@@ -182,7 +188,7 @@ static long linehandle_set_config(struct linehandle_state *lh,
 
 	for (i = 0; i < lh->num_descs; i++) {
 		desc = lh->descs[i];
-		linehandle_flags_to_desc_flags(lflags, &desc->flags);
+		linehandle_flags_to_desc_flags(lflags, desc);
 
 		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
 			int val = !!gcnf.default_values[i];
@@ -346,7 +352,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (ret)
 			return ret;
 		lh->descs[i] = desc;
-		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
+		linehandle_flags_to_desc_flags(handlereq.flags, desc);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1224,36 +1230,42 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 }
 
 static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
-						    unsigned long *flagsp)
-{
-	unsigned long flags = READ_ONCE(*flagsp);
-
-	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
-
-	assign_bit(GPIOD_FLAG_EDGE_RISING, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
-	assign_bit(GPIOD_FLAG_EDGE_FALLING, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
-
-	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
-	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
-
-	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
-	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
-	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
-
-	assign_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
-	assign_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
-
-	WRITE_ONCE(*flagsp, flags);
+						    struct gpio_desc *desc)
+{
+	const unsigned long mask = BIT(GPIOD_FLAG_ACTIVE_LOW) |
+				   BIT(GPIOD_FLAG_EDGE_RISING) |
+				   BIT(GPIOD_FLAG_EDGE_FALLING) |
+				   BIT(GPIOD_FLAG_OPEN_DRAIN) |
+				   BIT(GPIOD_FLAG_OPEN_SOURCE) |
+				   BIT(GPIOD_FLAG_PULL_UP) |
+				   BIT(GPIOD_FLAG_PULL_DOWN) |
+				   BIT(GPIOD_FLAG_BIAS_DISABLE) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
+				   BIT(GPIOD_FLAG_EVENT_CLOCK_HTE);
+	unsigned long val = 0;
+
+	__assign_bit(GPIOD_FLAG_ACTIVE_LOW, &val,
+		     lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
+	__assign_bit(GPIOD_FLAG_EDGE_RISING, &val,
+		     lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
+	__assign_bit(GPIOD_FLAG_EDGE_FALLING, &val,
+		     lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
+	__assign_bit(GPIOD_FLAG_OPEN_DRAIN, &val,
+		     lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
+	__assign_bit(GPIOD_FLAG_OPEN_SOURCE, &val,
+		     lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
+	__assign_bit(GPIOD_FLAG_PULL_UP, &val,
+		     lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
+	__assign_bit(GPIOD_FLAG_PULL_DOWN, &val,
+		     lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
+	__assign_bit(GPIOD_FLAG_BIAS_DISABLE, &val,
+		     lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+	__assign_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &val,
+		     lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
+	__assign_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &val,
+		     lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
+
+	gpiod_update_flags(desc, mask, val);
 }
 
 static long linereq_get_values(struct linereq *lr, void __user *ip)
@@ -1411,7 +1423,7 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 		 */
 		if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
 			continue;
-		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		gpio_v2_line_config_flags_to_desc_flags(flags, desc);
 		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
 		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
 			int val = gpio_v2_line_config_output_value(&lc, i);
@@ -1667,7 +1679,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 		lr->lines[i].desc = desc;
 		flags = gpio_v2_line_config_flags(lc, i);
-		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		gpio_v2_line_config_flags_to_desc_flags(flags, desc);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -2062,7 +2074,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	le->desc = desc;
 	le->eflags = eflags;
 
-	linehandle_flags_to_desc_flags(lflags, &desc->flags);
+	linehandle_flags_to_desc_flags(lflags, desc);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)

-- 
2.47.3

