Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220035;
	b=dULZcfRzWwmKKH9fvCkcBHwPTS7qQaEDlzukpxhx3CAqtO+ePgMoL2q57a5BgI6uQGYc
	 Cci3cTksOaaSrSuPpSl7ijZIERAkTivxlixyKGkk0LS6zMUHCjApOITcWaqZ5ZUkvFZNX
	 j2QW3pWNFnbF2QsVQlmFqr1ZB7Rkzywz8TZrsD3jcZe+DWGod2oK4+N/x1OzZo+K6WYf1
	 gGK8w6vK9XRNHT8CqPQ2kSbJabu5ri6fcVxBe6Ei4FJ/5LywmQoe3313ZYerSXw6lr86d
	 6DIOlh4FlsjaDz+mHvum/bABSCmsBSbyJFVL/TMJRP6m5DKq3fcmWzNx0BYWayubZOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
	b=ZzCwtC09aYtMTp3gRvnaoURrRSosJ+qByWyafeL6TaMsh16+armTQIGQgI/NwUfcf7co
	 3qQrGntGsfafkQf0s5UXW6qhkGq1gJ9j8fvEX12NZFMAqfVog3/8TI6OYOt/ta/pQTBwX
	 KO3F8OOpqqWApFaQtrybtKmxCCnF7QHk0soUO+XiNDqH/8JonIMIdx9L0yxbpGXgnTPII
	 lrZzbTL8GgnnNHRhxLdsX085sVICfpLfox74BaiXPQD5SfPjuG795Pr2b89Y6637xCMod
	 tXm/i8JS6hmeP5oOgcedKV/slERpeH+vMB9ARY23JgJ7B0y3gJCZBMAlcx/ZURsoZyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddJ+Jhib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hh0jLnjp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00509606D816
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00509606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddJ+Jhib;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hh0jLnjp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vGDA4108047
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=; b=ddJ+JhibEptYfH2w
	tO93LiAUU9lC6xorTfIoNE0OzlX+4RiYzUwYeEpI3dyhx+wmt36jwV8RBo6Yu+QC
	cQPCvR0rg/MC7hYjHZ46gVG+SgByMUKO/9wYPx/hiZ5rDQNG1FZ+Hm853utRdq98
	r9MPSP/c0CvUSFoN2qxv6PuhcilxumIWq0V4OtxXV5IEdPMl7DsYP/Mo8oHXA6lJ
	LR7QeoEqxQFHZrBk94XvvZn8oLH7DIS5/ROUS6oLOcZYO0pYdbPVzsuiV+CrISWx
	4JQ/QjL8cFPPzkJCMESY2IncrDMUpdUqH3ySm15cf0C2UQgbwNNVlHDlEFDrxE2d
	C8NSZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnxa4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:27:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so139667285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220033; x=1794824833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
        b=Hh0jLnjpx9ou7olmCscQpn6ssfkhxC2ZK64KTcF/Md5BZEVEZ2/MHTKEB/wTfcM/VI
         5RCuHSo5rNPiQIH3Ji0BrIwt1/R7YqSm3VWnb22IVofYVvZk8efXltjIIeb7DeeJZUCT
         JgGQi+flOZArQR4F7/NxEFIFQMmUZ8+QDq+3ScHgXyRqz6wiblhv18/577Obhczvig5B
         VyuTHk097HDTBBcX4KJdvFeeunGNvSj4qqO8v6norqvCJr6mkuE5gywsuo3bEYhl3woF
         91zg+t6M95FkY93GX8ydjcxKHlf2NcVtWbWPhDJK6F1pv+zio7TxdU8qeiKlFhG5kIdJ
         9LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220033; x=1794824833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VkGul/A8qLYHFVGluV9qcJV3TfbgVqP3JtUTvoLxT0=;
        b=RWHhK/RUfYtI/rIaPIQHHCFj8Km4DpeLbaaSfLAjj/ixzfrZOij+IyykJB5bUu8S5w
         4E+Y3mg50zayKqmZ0EEO6jaEF+49AxzqV8pRVbk4zyjMZgrvi8K2qeLlrvfVSjWkdv0Y
         zqZF8baP5PzP+MkUTDGF/L/M6KzHWOpmWis8Ye6a/zEyr7pAQEyE4Up0tYdp7kgaajpf
         H6AOoIfMFIA2/wyqCwYA2mkqOfStrs9RHW/2VGkAOOmV4YhL7NN7S5cv77kMhWN0zfsZ
         XHvIecFaNSOHjYoKGAYuJxfM+c7l2kISbQA64RA6qIimrJQvaXHpCDipRbRwZ3vmTWEZ
         D/ew==
X-Forwarded-Encrypted: i=1; AL+hErF6QNyfkKxsRUC3d6SrMcNPknrmF4OMAMKQxfg97VNv364RhTR7huhjsOJpvSKQap2AM+AUBZQcxSxxvA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l9UlVPe0fCxLEb/46BIyFd2srRshnALzjCvQdKVHELuKZif7Z
	P84A23BEwWyEAfzWpz3Jqkiu0H3h5gQ0Tm1+HMoxgz/9qCGFr11N9GNQ+0L1Val7znq7kuSkjTm
	Nt0Xy7zKIYasuFUawDziJVT9BtA7fX4Wfe7lWMkEDAgeESTpNUwiuzWHtwvR+ay43OK9j6mxCim
	M=
X-Gm-Gg: AYBFou3zBMqfcCEkVc7SB6d3UP7H7K82OKDq9NXq0Gwd72QUIZH/oJNzSC/Lq7nq/Uq
	dYxUP8cunQ5L+GHnITWYCv120QFvAuKIU2Vdkcp6SA+LDSDiLRNwSn9HUX9RaJFO5dsEhr0Vjld
	7NagxPFd44OFHasKiXYoqiSePE1Zi/6C4o/yg1mHnGWxchvLNcFFoI/We9JjFMSxAZqYY8V46+m
	PVYqgOXDZ3HlbRqko7ic2yXGwCDSECkdhxLcm4IPhML+lMsBtXVNleT+KbNYGV2CnWKlGrs/OJa
	Sa4mTkJpA5JGHPMMT9gl+OCU85DSpoleLfh174eC0YdRIPr2W4fPfWIzNpZvNnLanDgvvO4g6Be
	qOQis3swgM3Zhcg+PtoF7/bqvjLKzNm+3stsCqj15ugS1K6J+Wc1hFMI6G3KDsH+h8fH6CNeWPe
	MEGXHQjJUEuSoPucP4woV3ogDcUbJVC3Ekwcl/2o0WSw6r8seJlCFZtCUtLfdbEbw=
X-Received: by 2002:a05:620a:2a08:b0:93f:565f:e40 with SMTP id af79cd13be357-9478476e63dmr532069385a.65.1794220033337;
        Mon, 09 Nov 2026 02:27:13 -0800 (PST)
X-Received: by 2002:a05:620a:2a08:b0:93f:565f:e40 with SMTP id af79cd13be357-9478476e63dmr532066885a.65.1794220032851;
        Mon, 09 Nov 2026 02:27:12 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:27:06 +0100
Subject: [PATCH v2 2/5] gpio: shared: use atomic set_bit() for descriptor
 flags
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
Message-Id: <20261109-gpio-desc-flags-atomic-v2-2-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMmWnya14YIAq0vwSErMArXF2T6bT5ovzCJ95r5ENFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/79EFmR9l5XZlP3sbhJA42a4N7m/4Mg2WYT
 uXgHckUkUqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 wxfQEACg7P01dxIa3BoYJBiBN2CoMxns5UKycoYlNaX3cIvU1a6MvDTs/mafnFvHGm5XLdfsCjY
 o/uuqyaC3WeXDgjV7mxCH0wJfm6TyiK45GPjdXp3pi96WyIPlqEKb/Z8Ivmtrfmwlc3HsHub43p
 lND6r7vQkWV1yrZj1xD8aU65RTWB9utcTm5aTXFl3lw1mM9gQL7EX2a2YEtZWu6lCv96Zp0sGum
 ANqHWNiAtMIFi5b/QQUKNSke1WMlzmU81vswqUSRiG1pm0Vw19x0eoqCIEE07VWXl9LHzuZZFqr
 pWArCoK1ws9As+SLEFOGimmGYL8x5Oz9kyop8aGKTHqh7DkqZawzeesH77lxsxHr9oc8zV1XIVP
 iqJs6pHDBS+DjLQ0AVkpPPbALxMPdZvKf4dW9WQtBz3IpOKVgDc/R7RgSWa7E3UJ2umSabbgugW
 gLfO4vOj4tfr38M27DnIUaTCdpd2UEHlKZJmM3AseqDBOLFcm1CagxGkvF6b6iEI2s9axJ0GQcR
 sTYJYqU+y3HPqgbPdMvEPqMMQblcPxjCLrzCgFdYlhg4AEhDC7En3gy59aETUwoxDvXldfzPHEO
 8f48pgNYWSRi+nHf2Glncp4Up4UlbFsyzGFoKaAiCBr7tH11as8b2r7SZbr6bekSCblQqanmi4i
 K/JiI0P201tFvZw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: COz55HvfWVAELzbieY8AbsK6NjWRd86r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfXyUOL61irL+N+
 RKlq0yo4xskOWp9l+ou+1KKLVB6CUuyFlmy+MrSoQWfOA5mF6Vk5nsOT38XwFqIq1e80T7tPbaI
 NdeIyuUIt23oPpnOxnKBiBVSdWlV/yYo4NdJpQ3YMEg/AMuFXXnT7MVn8OVQHfsMq/KK1LBDd1A
 ygTUz6alHq8Bsg2PIay0IR/JDmhNUE7iuvLHWzlrhiqRf42RDhkHdaKJ2QAF1chyDSl83DPk5a+
 060eiI1hqbl74bvzpchlUOHRMNJMLel8UONCO6Ki9LdjhyhPg6dqqsdyZPAr1AhVX6BBXUTy6mV
 0rnfdHcn6L+KSj1vQpt0BWsK5LsveFmD2qLCmiHkSHiIVPB+LoPGcNI1OMmfwmdxn3U4Ln8K3NR
 zBZq9KWr7UgTiO8QG7QZJ98XzDDRcHN8x7gPMugBXxGu2UKVD1Bk/HCJoDoAm1ATjzG5gOIBWTC
 N6iD9Ia6W4Q17j0NRYg==
X-Proofpoint-ORIG-GUID: COz55HvfWVAELzbieY8AbsK6NjWRd86r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX2HSkH3kA8qNE
 HjtrMANCunTpSixkOmaC7S55ty43UJrtVrYpqeG/XKxIhFMQXxPrSHXszwXSytJNYdqqb8C/fil
 opkjkPENNWMDIWGRFL9R+bkUQa0oQEw=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1a001 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H6RLajfuJ0QrpAsTGAkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

Use the atomic set_bit() instead of __set_bit() on desc->flags so that
every modification of the field uses atomic bitops. No functional change
as these run before any line of the chip can be requested.

Cc: stable@vger.kernel.org
Fixes: eb374f764a70 ("gpio: provide gpiod_is_shared()")
Fixes: 310a4a9cbb17 ("gpio: shared: shorten the critical section in gpiochip_setup_shared()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..d94fb94f31c2f487d2e45924e11c33570466a0f1 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -532,8 +532,8 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
 				 */
-				__set_bit(GPIOD_FLAG_SHARED_PROXY,
-					  &gdev->descs[0].flags);
+				set_bit(GPIOD_FLAG_SHARED_PROXY,
+					&gdev->descs[0].flags);
 				return 0;
 			}
 		}
@@ -573,7 +573,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 			desc = &gdev->descs[entry->offset];
 
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+			set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 			/*
 			 * Shared GPIOs are not requested via the normal path. Make
 			 * them inaccessible to anyone even before we register the

-- 
2.47.3

