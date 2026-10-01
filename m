Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A17F4B1B24
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858473; cv=none; b=q0Da8A83ygZelP085iePl6vUzTLY3WeL3564nnfilkNX/32sh5VbxvsDmf48C5eigOanRrCW3vxse5+Mqrxk9bqNur6RUMnDGYmXtAhDHuRXls/gVhvCxfxq0X+UNVrq7rxZler0g/jcuStfwGTLWPcL7tSOCf/C+5l9k4m2hzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858473; c=relaxed/simple;
	bh=i6CdXMNIsX9AsS85jR1xBRf2i9VEOJL+1YUH8Bqd8iI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uZYZUrAHu69Ml1T9QdEoJ5+i9kgcjypZu1ammLTUBaQWNZwNLBMtvGN28fWqaYi9eBsYItUjQWRPWX9it6SNhY1i3R4iNM9JBKYc6AmrA2rt7uGiBAhoAvIyLcXDi0MyHaOekN5MvtQhX6ODXMGA1qh4LVScIRTLCzGX4wvYV9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuDYYJFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJ/DKmih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuDYYJFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJ/DKmih"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPig1933074
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pn9ZIrIwLLod9PpiKc2jm0
	af3QLi76hVkznb5/Ig6B4=; b=GuDYYJFMdI0+eAvuUOEvWRcpF4lhddJKuq5Vci
	/pppO86AX1NGtRsJPDq72nDZCMSkJnl8eZNcLIqCh9MX+hXbPvxsvX4m0ZTfOyRi
	Q2ESs/EEftjvcqTBaKwAYoeAEv2ihLxmE2fv2YrmMgZsREX3VjZmKo+zlusGRI9Q
	AaqGLsqomCOM5lMKiwV/HO3KcqKVNpcK/yA/ua1CljyxFLFj69haK5UFalK+9lB1
	VbVRW6pVWVUChNOG/YQhliHh65Q/3CubkX7Ku/Ifjp3tgVvrvTwjr5lLvT353mTt
	Kc0lAS8/f3KRJc2BangKXUJYKGtvCBi/LO+sVyrXay+6vDvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfsh9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:41:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso214812485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858469; x=1791463269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pn9ZIrIwLLod9PpiKc2jm0af3QLi76hVkznb5/Ig6B4=;
        b=HJ/DKmihU5t0kusfTC7Vc6IUF3mo4dIXdCm71bXMvkjNebbpcuPq9ViUSocTBi8K2R
         QMMSViQVGAHl0jxsMl/OSit9pqTOFcfj85Bf2UI/KCbuOngLNvAK1eCW4ocBUDatuH28
         q8XUHYJKllLHCWhly9buUAIRzwBRig2B2uZiBWH+b23rxgFhAEcKH/HzUnPG/EqoIp9q
         cS/t1YvLwTg7vnqAPv9dmN3I3teljQKPBRr02k9Kg2R/7DZK/IVm3u5QHEkDRFtZXMYp
         Rs0zvKyoTNnUbL6xJ+w2dxAV15rZyeaxoLhoHqBxdmTfC7znqs+iAekIUzXHeCYo5qob
         Om3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858469; x=1791463269;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pn9ZIrIwLLod9PpiKc2jm0af3QLi76hVkznb5/Ig6B4=;
        b=sbgIGOuYmEgTXGANuAOkiowpukXLSwEa+o6aHkZRX/0ECRmH5S/IxbfiHArybFw7lq
         1XEqmj3o7/cHoa+zu44/4D6NSsrl6V+vcu2AruXpPtUZxYBvqXQikeA5Pxe5EJ3lDZzi
         nHe9cga2QJr+PCNknZaxR78EFf1Oj2ioWweDHuI8IB7zkGelyHj2cjdLcCdw1RtGj+us
         AAyu7Lx0ojaZfVDpjis9dW+wyJ2HHyDOvbarEw6OXqrYTifpzMJz0MBj7Mu0eLtGd0nl
         iHlZouLO7XjH7xDGbVoM8kY+87Zkx5bwIw/D6Nl69LxALgNhYtj1EkuHlYVgffJmSbXe
         DNQw==
X-Forwarded-Encrypted: i=1; AKwUvBxGmnQh9isZ1QU5Dtjy0HBNtv28LHzkCFnfotI7SBNkrCQ2Vw3m3kxwWgfR1qh0N2s3nop+R+Fq8fDcMtA=@vger.kernel.org
X-Gm-Message-State: AFuF++khDO+UZMonqvEOmPrRcQvji3dM4MwRfX9BD5/zVxDfAeuLx9ew
	XFR2u2x8F2CDHNhBpiLhNE6Yz5yqDE9CGrLZns5MobU0SCu7E3tqgDuLV+qa+/QByz1iWCJItd2
	zMhx7A8X0fYswEh9aKejbboFAl7FmdyuY6jjjCCv37N4REJ8KGgJSrPA5rmDqgwSVcli50Urla3
	g=
X-Gm-Gg: AYBFou22lPUyZIQWCQtB2vAeIB7p8VOUG/bIFrmJlhbKd3Mt37zXJIYOmhbjFDPuBN3
	0lfeK42F9rrlarFVvCjHmtUtmiW3sdstqZhjpxZLcX6pQEWbuw+OppAnMCEU7lxgxeDOkYMhb1k
	s0Q31HkxXaQz6/Ysc8+p/eKo6Q1u/w0+JmhWsIgFfgjFTyVfQrFJXIFHjBPtlMfNuKBX6f2Y3dI
	dMU32tiFuO/rY5jl+s1L80PhBjDpyQSMkgELydFfBnsATXsBElAYEZfzvTtXWoF80e/7Y8vAFhi
	SfWP//k97bVMzrWypHu2MUDIhxtsp7xLxoUpSfyFOPU03QlWoM3AMCJ4UjgPClnoSs0c2SGIvkU
	1X0zjTVHeA4D2vVo3jCINs3tzSWGx
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr491931785a.17.1790858468958;
        Thu, 01 Oct 2026 05:41:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr491925585a.17.1790858468263;
        Thu, 01 Oct 2026 05:41:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm6978867f8f.22.2026.10.01.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:41:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/4] gpio: kunit: add test cases for platform lookup tables
Date: Thu, 01 Oct 2026 14:40:52 +0200
Message-Id: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVUvmoC/x3MTQqAIBBA4avErBvQMvu5SrSIGmsoVLQiiO6et
 PwW7z0QKTBF6LIHAl0c2dkEmWcwraNdCHlOhkIUWgohcfHscDstH+j38cDdue30qFWpqrYmrU0
 DKfaBDN//uB/e9wPG4qu8aAAAAA==
X-Change-ID: 20261001-gpio-kunit-plat-lookup-6434597e66f8
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=i6CdXMNIsX9AsS85jR1xBRf2i9VEOJL+1YUH8Bqd8iI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvlTXP7BA/vuHaXHw0Z2IT3wm8rABjCC+myTBH
 DAzh53u6/2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5U1wAKCRAFnS7L/zaE
 w+ixD/9Ebp7qyHEQLv6oofC5tinCSJXDMUIrDr0BBKOenGLUHyn0eNl5Uny9sRjn7ZDdhC3Xnqs
 gC9JMOidDEdvTuvGjNjKP0Nvrr9l8gLXHeE/ko3WpYBmx1UhR2szFIRPzeqZEv9I7FXIM7u2Xqt
 ZmmzZl6iH261U3ajuVO4NLRbXyCrNAVXtIKm5M1Us2/wy8WNsKSkcJK8n5mmLc0xYkefdN92Qov
 O/uXv5uPeeYHOqZa/fA3pG+aT8PwpYCXuwWs2iePcitGdG/UgkTxTTcdYCkpY+bKpkoM0Tvs3XN
 xzKHBsAIWqUyVoxW9MWMMY0bt0QYTEwZkFv1U+9Ah1j5ZvH0/WT1fmubmsO6Fhsi/mUMCooJ0HI
 3m+Elc90zuj+peyCKQPL9oKEmfU8tZtDGl3JEJbGRVQsEO3cmYZXckLivbELD48SPWKc0lhC+I0
 Q8479W9Hyd3tL6Kz6MCQBw/oDOJWZl46BQAtx//++fX5VWPvX/zIX4Y/0V0BIzXAdElrSU6wrgS
 ujjgD7Rr6vpBxMvnlVp10w+qZOqmcdAhC21rHpGQceIH48ei/qPxIwrG2qndFtN0G/49+GlReCf
 9KGNtd8eDEBlrVh66gFel824lLgzEeZz5xj+d1BhYSVPVKDiBbpgcI8CsfImmHUrJkgf3fk3McD
 D3UOqtMrdJqyGDQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX5lsjJ9RU1rIG
 GkRyL/f8sy80UuoaGYo3B04yrxYp7WrPCih4uXBpodZTD2tUv4agUZwYamIZbG0D3AlBFAsKCsp
 PZv9B//p9pi4o41RyISeYIrro/CaIEs=
X-Proofpoint-GUID: 7jkgOSA9FhIm9xZ3UzQmW_M5FoXUwzqY
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe54e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WHK2wXdqtRXZzuKitUcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7jkgOSA9FhIm9xZ3UzQmW_M5FoXUwzqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3SUX0gDIg4X5
 KIvjg8S1YO0lbdbUMQe8iXGutjsbu8pc16qKlWFrsfZMEunClQRHZSOypeLgTDVG3svOv5Pcq8y
 VCE0b2ercWNjLU9q0VPJI7lMiPR1bp0Lfzc20k8dVyJ5G19BqCK1G3xY67mwsEJq6PqUh8FWxZY
 KKrfdK8G79j/k/8DCMFYcIFHS0qTpoayHWnCNPUTphKuTbRYKjERA0/pmPv0kfcF+CazbZbYRMG
 M/8/3yRnCmtvYEV1JCeUiylUj6MUAPMHPxG9xn19FsK3va2D8VZ+lsvH9x6naU6Kyf3h14K/2dw
 KcrPOAPl4ahIbaMDpdhEhgOa1XMb3UHeAQrqam74BiXSlsX0r+lA79dM3CBkmszkkLkOkIYqOxO
 kj42SbzABdSICNZE/7KSbZR4rIqSIPu9Pz9AcKnj4FWTrbR+YXf1RkPaSA7I+2+PLtgxtUlsL1K
 rrOnwZM8NaiSHR8XcHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Add test cases for platform machine lookup for GPIOs along with some
minor refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (4):
      gpio: kunit: fix the label of the dummy GPIO chip
      gpio: kunit: factor out common code for waiting for device probe
      gpio: kunit: rename the swnode consumer to a more generic test consumer
      gpio: kunit: add a test case for platform lookup tables

 drivers/gpio/gpiolib-kunit.c | 221 ++++++++++++++++++++++++++++---------------
 1 file changed, 147 insertions(+), 74 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-gpio-kunit-plat-lookup-6434597e66f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

