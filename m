Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290966;
	b=II4nbRXwiXkEjYmwtZJmiKRZdSgboL2h2BtAM8jFdFOniqd3hQp4U98D8VBddwLNHDr+
	 lLFobBwo/9n/PzeHp71T9EK7FJtCb1E80tXYkWDWafYFn7788nPBaq98Ia9+cXeOa7NMO
	 ZKl5PxACVGY5t/UcNeteiIzzAD/qRFKvYGDDLgcNX2GtWBNqmJDSwiSTLDJ9NZPx3ZU/q
	 PNDs9+TaPCapfSYYKwQAAHN862JFc08Ow7TnnBM9Zq4cll+8TW32HHXoZ2bQG+M5vzHb5
	 +i8E6VHrB4PqMqCoQbTPxj5vsJyN05cz0QXgdDttuK2bfs8e2o+M0zM50KIU/d2w9pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
	b=0ZUEDr/5KtrwhMF/iNjAuNZmdIqclUUp+/s4CM1Kp5Pcq8dNupsQkKUpGo7AsUrO7qXN
	 z3740B4ozWc88kzm00eMPPS+H33GduAMh1GFo3AgfjgDxR4FkdpgY6ryhJl15tZYzLEcI
	 PaezjSVYpf0Vffzd7a6nC2NAht9ap5YIF3EuL2RmF5kyVGsuBLQjYCMuzCGCz7Ma8TIZr
	 zjW4PIGuqSjigDXgPPNQj25/mZOJyZ7TL55jT7q3m+BaXDQzznpkK9JwRVBGgj9fYCr3s
	 MDQdE6MJsYA9IEK8FlC4zcMSMvKaM02bjry5XUzshW5iX3EIDfwtwxI1Kn1fuxcpj4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhLMs4QY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RKyQPisq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A560A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8A560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhLMs4QY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RKyQPisq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxEh3872942
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=; b=YhLMs4QYMkk84PXE
	ujN1T9q0pNInevXnOwHmFJaJDM4GBxYPwv9ApuXWOrXAsQT4UDSoSpfe0XD7o/V0
	Wci4/ZvRI+MPuukSqsks3hp09aQbd/HWtkAy0DCFn0Cehl/VUEG/xCkZ5zjAF/kl
	IFaUrg451t1pyPi+gAgzjMbNqlhLSs8RQSHmGDZONhbY59mVauTh07B+dVp623KD
	wrFj24iBK/t5Kqd99UYmeqfXRO7ttWo8xbAL3bktV0nfL/aRC7aXJXNntJhYwpRE
	gHzJLTk44d/d2i8mxr46BgqDNjgRMOLFEyicMPVmrkoVnBFsMGRxKp+JZl8O8Jty
	zPaxag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7620t71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:22:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so417540585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290964; x=1793895764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=RKyQPisqcolWS9iNUi1qGrHIjONY1c76Ohki6YNiswPW5v9c02Jzpq4BiCaJ1FymG7
         fLf2HbymWgn9DkGfxqdPGUR7jujxRBe+sdmm8r7xlo7XVU2vJsb9Hnc9iajnvcH5J7c+
         RaRt9CpuaseISF1lxfB7qbAPAe9WO2Yqx2WsLdREkaKMzbugKXnN4Mhg7LMsZZVZx775
         2MKZNxYNxHTpQ4uju17hvqU/Rg5PoP/7zeKtwDBhq9gn+yE978DtBtXkeHOPLfyjroYI
         ZmxyekmRImIy9xcRoWi2ZoDrTv7ZrT8hK5W9z1lYN34Uf/MRqJNiMmDQjGTjv3bCc6Kj
         nHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290964; x=1793895764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=tfpOsuXwXsvlGzeB8ywQXjbh5KNxQ73mTZMPf+4rF6oxTEhRhjbu+VNuT4Sly0fZ/7
         vmRiwfrrmklEActPXilWox80HCWYMTyx1VxABuUlwoviyTeYdGp8VZauplMamChKZInV
         EIq5rAStjT6jinO1u0JRta0RfQvBa7r78+M+lpSI1AdzpoD58Pmedtkn/Eegg9rbNCyk
         E3V7PjfX181vNX3RgMX85M/D/lA6lpEGJFikooLWOXIIAHYLWtH+k2ZH+vBeGsORO2VK
         uN70rnNcqMFSn6cdDZu+mXRUyf50T12xcc5G/6xqscDnBy44sHADnLHo6iyK2TR1gnOO
         FCrg==
X-Forwarded-Encrypted: i=1; AKwUvByhsZfsi/etihHFZoIb8DlIk/J+3C9lEqeXRIryjGdrA4vBYcVOeLV3OqN63iqCrZlPbluKcVFNFKymCWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdPXFbEjSKim1r78IjJpVp1lZsUvr+5OH+mrQmJ5Zbw44qXu2Y
	z643QmctATrksFo/MGfvLZZDeW4kpzJq2Y94Bqrb/1VWHQU/Pfh0VYMi0TbGduyowFN+NvuK2oS
	5t7QuZGg8zoyVQD4YLLEWZIjkwBpIebU5JcfDG1xuPVUOLR1nDqkT2k6ajGO+9lUw7tc=
X-Gm-Gg: AYBFou2ljxgGss22VwvkNKY8cojOzZxA7EBECEVrOlsYEWTvOuxmfa7nAPciMP1kySZ
	aY1qs/CIOFl/9ts/+kLL6CPp+O1ZbwaVGo95IDtS4Y8T2ipSGwB+SJGya+NjMPKqz/9LvWnCIAO
	B3YOyIb4BZYVZs8B7f98VdBPKNFSD83viTg/lA3iq9rw2CdGUP+PDz0E2q2Sk5aOhpP1sAaUQZc
	jpGAp57+on8ORLKOtVUEGHr4TtKPsNgM8iuN+oASQSO7T30SWPs1xtG7cTIcTZOp3oD5R5Sdete
	e30xZZtGCfygg+OmkAESvkffC2XBY7/HhDSHbQ56c1Yare5x0Zqk9Iu1/Q4aZHwVSfnKHXI666r
	Cd7ql5tXjXRR+lvk1iu38jOUqi8ypHoID7UwKyNWa4l12crOdRxMVPInFg1k8ZgctQBxfF6JXIC
	ainQ==
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr959215885a.5.1793290963642;
        Thu, 29 Oct 2026 09:22:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr959210385a.5.1793290962934;
        Thu, 29 Oct 2026 09:22:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:33 +0100
Subject: [PATCH v8 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-2-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uuM5n1/ji5JC6EPQ7kRmGdBjzEkAbSpadsEf1ipKIMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMNInes7WMSDlOJdEiBIgbf9BfhO89VLpUH
 Z9Gf504vgOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w5SOD/9loXv0NoNHt0bHBzStSOKV3aAUAiP4R4gPpWvZzkwV/mLQlx27Q9iFE4hDyE439mstcos
 GfEPmYGI1Z9XPv4MlLSxnPWcro/jURv6B6llYzK78lKADEvtobbsDTSGckx926VwJaZ2ioYV8Jd
 6jDOlqfdfvmy7P14M4aSsaWcclsRhDnlj14u1Ep9yD3+fvvujdd2twAO1Tb920ruoYDFXY1gvQ9
 rE4SU6ezlsE0WkOtXgCC3fb9uoQq9seedaTn07FA3rgpRETWaloUo0E6+ss4Gyz44nRIAp4bGGE
 yh64WabWMtfxk7s3SdH18qoahePSBJnNIUUisAGjgZv8EIM5CLFrCRkG2cYwBD3B6pSGBb2vIUJ
 S3D3ZW0qMo7uETwZh2l8RLyeevy89ScYA74K+E/rZqxDw6WuMjy5buRSGRoan6MSJq7o0/RgZ8F
 WrJadL0Beh0XsPDZwce6AUhx9CsPwJD6ZtG6g0sOoQ+jsEI8+ti8kPj7KlWdX2WAYGtQBDF5xzG
 mymveFrIaOfwXV3sd8E2xnRy1QVKzLkza8T7tn3NiGXeFPxQz1IYy0s9hJxayJUo65uNnFI3OKL
 4F8QgeB0uz6mYY1Ub2HRlISaGK2c9a844vEoF8F8M7Hf+StuaIcrI2Wqmoghi10zb8xhxlNuKwu
 GAeb5DAnV9EisQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xvsb4lXV7lYW_sN4lEJaXt9VEEm-t93w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX4/hfjMLF3kfs
 gsz7NSQ6uFOCbrtKVhxnSm+ykGfwXgGPV33HyivIXzrFE/rx4xZPmT4U1I5caFfjIxAV3yGApTW
 QHP4di+n7EG8gzima6h/VVjwBZ24gZtGhiRSa23oP8aetfa/MoEzPVifmH+nBNHGH6G52anDkA7
 tGasz8u4B09m1ghH50+fTE90N30w72TzNbZDjlBNxJSsft4bLQg/6xwLhfoMGMMjeMoLS5ai9VD
 IiQ/TP4Ep/zJezJFR3m2oB9fSG0f2d3oWjRM0obbTby/xzQqsZIIxRqaeP1yqXaWUW5KP1ELv5H
 7rjuD8ktmHrSjOMBT7u2KbGoM/uKqUKfVuIL1VGDduTBWxVyyZVsc5Ejy/+feH23NKGGz14xHvc
 LZttNWVD7XbdUbAj9qYrsP6Ef768eDwSSZN/SgL1MUwjKkUCUuV8ElCbauAR308mBH9mtmBaM4a
 ikrlQM0wZl+5uLz3f4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX8+f0sPhvs7fU
 UwRmOs3Wl5aVsnb2ANIRJ+c5XacPiBkvau2GMg+QM6QuAlyHiuTNkGjSuInw1IYzV+NrTwpRfG2
 whFBv7tMy5pRKco7FL8MnPmCZICPEVU=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae372d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xvsb4lXV7lYW_sN4lEJaXt9VEEm-t93w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064

Move the per-entry part of gpiochip_setup_shared() into
gpio_shared_setup_entry(). This is a preparation for making the setup
all-or-nothing, which requires handling the failure of a single entry
in isolation. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 112 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 64bb450f0a8461d214a45aa97e2474ff0d1857ce..47b434db72f1ebd35ec36ebdb35f30809f4522f2 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -538,12 +538,71 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	}
 }
 
+static int gpio_shared_setup_entry(struct gpio_chip *gc,
+				   struct gpio_shared_entry *entry)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	struct gpio_shared_ref *ref;
+	struct gpio_desc *desc;
+	int ret;
+
+	scoped_guard(mutex, &entry->lock) {
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can tranlate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
+		desc = &gdev->descs[entry->offset];
+
+		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		ret = gpiod_request_commit(desc, "shared");
+		if (ret)
+			return ret;
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+	}
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
+			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
+			 ref->con_id ?: "(none)");
+
+		ret = gpio_shared_make_adev(gdev, entry, ref);
+		if (ret) {
+			gpiod_free_commit(desc);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	struct gpio_desc *desc;
 	int ret;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
@@ -571,54 +630,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
-		scoped_guard(mutex, &entry->lock) {
-#if IS_ENABLED(CONFIG_OF)
-			if (is_of_node(entry->fwnode) && gc->of_xlate) {
-				/*
-				 * This is the earliest that we can tranlate the
-				 * devicetree offset to the chip offset.
-				 */
-				struct of_phandle_args gpiospec = { };
-
-				gpiospec.np = to_of_node(entry->fwnode);
-				gpiospec.args_count = 2;
-				gpiospec.args[0] = entry->offset;
-
-				ret = gc->of_xlate(gc, &gpiospec, NULL);
-				if (ret < 0)
-					return ret;
-
-				entry->offset = ret;
-			}
-#endif /* CONFIG_OF */
-
-			desc = &gdev->descs[entry->offset];
-
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
-			/*
-			 * Shared GPIOs are not requested via the normal path. Make
-			 * them inaccessible to anyone even before we register the
-			 * chip.
-			 */
-			ret = gpiod_request_commit(desc, "shared");
-			if (ret)
-				return ret;
-
-			pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
-				 entry->offset, gpio_device_get_label(gdev));
-		}
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
-				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
-				 ref->con_id ?: "(none)");
-
-			ret = gpio_shared_make_adev(gdev, entry, ref);
-			if (ret) {
-				gpiod_free_commit(desc);
-				return ret;
-			}
-		}
+		ret = gpio_shared_setup_entry(gc, entry);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.47.3

