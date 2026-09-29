Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528437CD33
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685138; cv=none; b=iCu9puu5SzWq0GTa32vMtKOyCh+g/AjJ7hINFHJ5M+dP7lqpV3vS7cFUn9izUfNlfxCEEw0drJgeIWwL6UU9jYv1b8cKu+KdNYDagLjvJ8WmPY/ZWXw9h+eoop7TLwO58eROOvMmP/Ie0eWO5R5zBr0KTg5sJ3DQapeZc6tFzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685138; c=relaxed/simple;
	bh=PDMjPWm334ILqkH0j0QtEbKYahNrE9e0Ek8j2ioFSF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d59h9kYUXK3DlN+S3bBCxTOZG93pruBwjknukgUXTbUDrJ01dqCwjrh9wwmBwXaHHRaLJ8wVSFA0N+1QO4+iUu/0k1OiNABjqVXZQKSyd1yB3VbE44XvGIt30KHLRTlnqQTbzZfCiLY8aefb8snsZPPoVXzy2CNUBF4++7Kvz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbDvIdY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFtrFYVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbDvIdY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFtrFYVM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCELBc3206261
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dh0ySh1o/SczIrBHoeAsFT
	7MjCXtjUmy7kNVxoIvt5E=; b=jbDvIdY06qkndVhy/+b7qUqghu+ithgCC76fu4
	HC+OKijtXsOyxSy2+O4Sz9/ZuUwnriflxfPe04WCyd2Xm9BM3VdQngDf1lnVtamU
	1w3Ck3wAPDcExDVVAkYbjjrZVfDeteb9pey0s/SU0Qjoyj0Uevl8YeNaHSxKyYej
	vXNoPP7y5EqHC3LOBfAm68unVF9o0tA/oBw7U4WiZW8OfojO+H3YY/zB+xCNYbGu
	9wYacwc36UzUAIaLk3+MjEr+PJxMuYSEfNlcsUZYEKzt2GaBnyIYi5WtRxTBI0X1
	MZWQ8cf59pEmbwPQiE+wbr1BGIUnAX3eL3JZ9n9Sns0a+R1A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mnanr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:32:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79cdabf7d89so4089840137.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685135; x=1791289935; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dh0ySh1o/SczIrBHoeAsFT7MjCXtjUmy7kNVxoIvt5E=;
        b=aFtrFYVMls2JnOP+PTP0hEddkfLAi++/EtUbhLupcnarAm274H417uNRNsauBYiaGw
         7YchlCbUct7Ho0Idj8SXhA4vajT4oh0mAzr9XPRYU+qZmkAV1meiEVoA5SU9fez0x1H1
         GChRLMqWQ5bje/2We2ByCgqVDatjegwvnBUSztkNdwmVfBRJSFZchCYUuRPwf/Tx+cBp
         LVfoycY3dEhqJeD3ur0XBfYMBb737RPLBPGCwQcys5cWc/XBN9gNLY4lUbSlHYXff7CC
         lPzRkSP+YwFgPqS1YCZu8H/va5Kus5uMRSvgpZteClqk8Y/mmendpCTihLEntZwgIEej
         Gd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685135; x=1791289935;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dh0ySh1o/SczIrBHoeAsFT7MjCXtjUmy7kNVxoIvt5E=;
        b=RU28VQpdWZkpgpt0cOsu5Car6m7YRkfTVzwDVTUD9ed27Tvfn5TL3yjK1CFglcaNhm
         SFP2dgLC6nRBdXTSRE4VXK4ibLuiDewkV+Mn9um0py/ZpFS2Cco8UhH7mBQQghCPyDK7
         nNycIH8WeFaYvE4F/SbXETmumlztbvMQM55J63MeYWk0Cp3ujx4QN521rSoqMK9GkWef
         3+q+3YqKnthw23o54ENF4u8VStcPprkGAYJpY5Zt0OqCCHlH/Q3Ein8OwxnXobAGOlhr
         0IFpX/emvPcRQDfOfZJILkvzQ140F/b5CfjRTa+ohXdhW11umvqH7tddUg9X1Fk1Woxc
         2JFg==
X-Forwarded-Encrypted: i=1; AKwUvBwH9xS6gG4hN8lgO2s2/9KA7vOQvHNjWXEYIWJ+atNrD5YKDaxFPkZ4FjSA7cr51sGF3MbIpSNNw8kIkLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxBphyFORkUnprhY//cv2k4jnonHa35nSzbuRmeOUtJI+agPu3
	VOeYWZgPrVrwW4WCXksQ+UiYdQ84uDDgMNl0yP6c1zxp9Y5EvxMFxKQL/MuYCzjvohOxZoSjPV1
	qoXiPHba9QY4wdKhmvJKAKeuU3OeMsy6UyOxpKogsCyZzwnRCEN4Y/gJZXa80Lcu36KSG0QH9pN
	A=
X-Gm-Gg: AYBFou2rVtvmHh7KThgrjvjaVtT4ydFawpQdQbpoCOrJFx/4eYwqJ9MUWzVCqhC7Gh+
	kMQpQKmPd9z+FIhe5YRZWCW9LoXO0c+SLB86kcDRXuB04b8U58GxrpOCb0KJJOTsNF+InLoJ7Go
	JLVCMskcfrnqdCtuHztL2hwZnqtNBQV92/EJiUJbrIYwJAjvOYhUFWPgmS1DaaP0PM/rE/z6via
	m+VJIVjalWE2mNCgTLF1aN+NdX9bmmVjfAN94rsyrnUhcW5rHLnlQ1WltX2H1HJTJAGDfVYBBPD
	BuVy3Dt66mFWzC292XvVUs+5lUiYggyBuWoLnijRJ9vzE1n2/0Og5G4pWBATEbxvVMkFvmq8Bfa
	qDHiSYd+5+LeARi4pMMYelhqZx41OfA==
X-Received: by 2002:a05:6102:14a4:b0:7b4:7086:876c with SMTP id ada2fe7eead31-7b47086b47fmr2201384137.23.1790685135026;
        Tue, 29 Sep 2026 05:32:15 -0700 (PDT)
X-Received: by 2002:a05:6102:14a4:b0:7b4:7086:876c with SMTP id ada2fe7eead31-7b47086b47fmr2201375137.23.1790685134582;
        Tue, 29 Sep 2026 05:32:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:12a5:a874:db1a:dab9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm79190355e9.11.2026.09.29.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:32:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: shared: fix no-device, fwnode-based lookup
Date: Tue, 29 Sep 2026 14:32:02 +0200
Message-Id: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKvu2oC/x3MQQqDMBBG4avIrDtgA4bqVaSL2PzRQcmEhGpBv
 Luhy2/x3kkFWVBoaE7K2KWIxorno6HP4uIMFl9NpjW27U3PcxLlsrgMz+GI6sGb6vpNjJe1wWH
 qJg+qfcoI8vu/x/d13WuCChxrAAAA
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PDMjPWm334ILqkH0j0QtEbKYahNrE9e0Ek8j2ioFSF4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqu6/Ft8QFZACk3CZ8XbO5PJuonfQpc29La0O2x
 pswTWsKl22JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaruvxQAKCRAFnS7L/zaE
 w5fPD/900UoBzZKniOoHXnli2V+IyYkhpczzH8HHOHLAFE03ANAncMlwRN1fEfre2MVaeyJh412
 K+idPru8sUHy4rYWrsdY377m74hC8I4Jhoxuv2lou95FRwcEu0pIW8xiBnQmvCnOnhWzNC1THbr
 4ZZ1YFjljiCnvSW0s1zidlqj1pnhJgBhxRHzv0/E0fl4EdQp7YD0hp2bgGm+ttxR3gI+gp9zf/e
 Yd3aA+Jx4yq6vkCb5ltB3JzYYNlrIzg2Zrz6Ru34sH9EDkGNxjFQrF2/fJfdUyH+25aDXQ9FJca
 GVuOWOElPBz5pChQOw/T7MCQrw0vWswTS+q3reofo11Fs8ju4X/rBeBFBPfFW79PI3mx8kP88OM
 rn2fayGgdGV0YDWQxh0NRIs13uOux2pNpGA9I1Fi3XZFW2VjqkZsLA2+jSSQLzf1GdvilF+KNwj
 m0fMW+1M/z1dz95v+MZU9HN2WWufea/6CdqB1GP9i2v93uyWlzW81T1yS2Azhqb9buoLaJ6XQhp
 Yfc1DeHqo6aDF/2yPgjnlWDRYoq5L+7lx9DIARujK09enLdmmCfcSEd7TTos0h0gqExceE33qme
 xjhhA660buWAKpDdUitofOm2ImS0aq4BgVV0msSKU+vn8oMrG6S1Rocs/NxsOT1X+UWEPRc+sWi
 3hwEq1IGSSwX2zA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abbafd0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vz7aVV0jI-s6JskwHMIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: GlJ17a6eINxecAK8MNSwnMFrK9m6hdmG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX6ugVqeNogAOT
 Hus5S2bVOL/uWU8JupiW4EUprB5PmiAZF2EtSGQXFVVrK0ReibXaTApEn6yFEhxzWDNb86JDtm2
 Z6duMTeO99+3t2gNLWLovx3y/AoJai0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX3Ce0Be2EqljK
 4Je2vkm285QFNLjWhZmLXna1SVXxwALxO4XvQF03BQX4gOCL2Q2Q243uldRN6cKZH3BEubp5r0m
 0Q/L10FhOK1hydZUAMHChU9dPwZfJSQbK2pm5IS5WC8/McCWxAennXRE29ksjvJFz5IINQesyJm
 LGQhycTs+29xnb+nEIov0JKblgmICd18+FGSkdzFeRyQRx2nstjagwD7c6jKatvoDaoZ/6Pky1X
 Y/n2MEL4NXzpk5/Lu0fLKisXGZwe5q04vaefrB2i0qLTEuviINPKcI9yNZrcRxDHeLI3UbFqL7A
 yRefnW2EaAF1USdzzcdGqKxQEMXWltVhCwW7YJAyYW3qkT68yb3elm/DuXIPwkTpg4Go4ybxtTj
 2+G7LZ+gTyL8j7M6m4HRmK8BgwmdmiiXkVCVFqrVh/6RyLZ+GVDbHAqvJ7I1b1xo2uJxLfXDiDv
 XmtqmjQMVym2CbOpcSA==
X-Proofpoint-ORIG-GUID: GlJ17a6eINxecAK8MNSwnMFrK9m6hdmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. The second patch fixes the issue, the first fixes another
problem the clanker found during review.

Tested that the issue no longer happens and that sharing of GPIOs still
works on Qualcomm Eliza.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: fix no-device, fwnode-based lookup

 drivers/gpio/gpiolib-shared.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

