Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F939D6DD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915035; cv=none; b=gqwtZJ6vz40zZ0Xf5C628ndgLpsRV4J+q+5mtBCmIcyLmdWzarszE8udQnS9oHllp7odMYYZP/4rJYa58j1I2frXWhTYc7VobS3lS+4c4HuzdQQf5Kn2loGlRwXQNlbh1w7CEVCRUGKi2tIBXaU5QNg/7/tbKGhgiAJmNKIn6ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915035; c=relaxed/simple;
	bh=iiSzUn/aeSQKWahRmmKZGhlAE3S8IuXG+BBv6HR+40Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=blXrjvSe9BaLs0CTV46KVCVVFRgNv30lQDikAP/XIlroD3+lfTcZHDSqHUCMG/m2eQzoXM0SJQdE6y152XbpjtzH/JnYa+/B3s4pMPmiz8L77907w6KvRdQJxs735Sg3gn3o54Rk9mv4C4yWsetLRNDY3dALhEk8ElHkxNCpV3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTRLgRz+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+dJARKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTRLgRz+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+dJARKc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnwfJ974693
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xDn7I1zCrzFS1D5ndiQFLn
	1k6kZDyod8HfJniJbO2Zg=; b=JTRLgRz+4K8NKoPdS1qu/EEa/yCOsrV3zkSVDb
	wD3NYZeZNfpIIpu7rlNS68Kr4s7nM+7G1yLb3yr8fpFJs+rLFVjWq/zLmLqFZ0gd
	SGlXKcaB0ykiASfeEWgFrIj015P/54xdfRfAR5A5XYPQ3eDK76X6fib9EkvnqCA9
	vojVngNi2kZ7Ll1nPI1qm6OZbhbSz5nyEzlnjuzYGYMwILXBk8NapDXgv0OZ6Wgt
	4UbeZypmoHLR9xFjeIcvFR1uuVWJ24FW87Bt7ykPG7s7Am4Je6JlmTvBl79Tyjnl
	hgE3SAwvoUUgxwygIyG/CT5le4SrvNPehNSaATwAGMGt+GYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk32a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:37:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5328cdb38bcso49142371cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915029; x=1790519829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xDn7I1zCrzFS1D5ndiQFLn1k6kZDyod8HfJniJbO2Zg=;
        b=b+dJARKc6sxgU7FCwK7tKoullE2Q97BBC87akz9FIaF+WlrghZwt4WXU2xpGukdD0X
         1s7u+kz0688GWHIviWWvGjq1Xt8UImH15T49Z1qnpK3ZrQN4DBNeb4rANi0GEue3s6nc
         08xAhQrirao3nisiSwiq6SUd7CsNhBdzn3n5hTyZ5RrWjwfMx+Ms9YED5tGpAqRZxpxb
         sPqz9MtiNnEbuc57RRWt4aJcZP65u7RaSNzufZi0nG5SKk61tRnBuk57kAE+tQvLdG/b
         r2F538Xj39b2fDXSn1ZN1xI2BjDR2lNbMn2vT8PZgr8IGFv5c1+e48qgnSIBbhQhQl7e
         7JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915029; x=1790519829;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xDn7I1zCrzFS1D5ndiQFLn1k6kZDyod8HfJniJbO2Zg=;
        b=HzWePIgeoeR+7uDGgjLlDleoR4RE6CU3iCv8vf5ub/TOJgM31OcoLN+MvzRkOfF47Q
         Z7WVz1hgpqS8zw0V+ZS2vzEZsez1D+GTIH/B4DEjCbHRCYQPgnhA9SWwuVfhGzffCl78
         jTWc2KC79j3MuPcxEMqMldtsjOhayhZmZI26EiF/aPaVg8L7+O/jm2to7YEa2jCsOSH4
         0ktYSp+3d8VTRFgmyRXIPQzZIbfK99gs3Ozhh3FA4O2S04Z66GmIlW3oZEQWY2M46tMb
         V/ewvDizpSTxL8mZ1wb+FzGd/bhWn6fkJx/u/3ajNL/+85NUZen4ikWi9ImM9Ph30IHD
         dYNg==
X-Forwarded-Encrypted: i=1; AKwUvByvJFRMY1JiJlxOYShnLlH0MbH6dVnZ6RgMUNJFnQrCCzVWTZARJolsg64PvoHhM82kPayM/Fpbuey/KSU=@vger.kernel.org
X-Gm-Message-State: AFuF++lg6mxHUV5GA3U2HFdN5KR/T5yhWr6HOFEXt1Ww3wlBYHnPBx+Q
	jdxyByCfhCBo6bTSkFKH39O82oisPbcFQUCqg9V0175UrXlMnQL+if6xibY1YYTMnv8h+vf8xqx
	stIO5ocYt/qt3Ybf4k3Er8Ds6a4sg4Xu/qlcA/3U11Pz+/O5jVQZhWwKC47SYu+634u0=
X-Gm-Gg: AYBFou2h5jfAK6Hmt/pC1/SocKo/ABGBL3Emwc+Sj7Ci1XuPBoyPM77/TWbVKS91xOk
	PqYl9nLZhWYMKc/ETdd6hemf8Bi+pGyQpIGo+f/kJHHuYksZ8hoFFVgNap1T65tkBKTcC8NHQeM
	VRmvUK+iMKk9w+dMOlhf0RoMgBHmOlZ2YnnvQbgWoQxiCRCQF0kD01pQJDal1H46AhByglu/RbA
	bhJPk3oAul49hHVYQeeQ5NtFs2p7kwWg+x+2YgGFqxLQhQmVH9apB/v5OJ/Ey1P9kXv1RIBClCo
	7lEdg1+2R0L/dYUDGRAzrdBcuPcYYy0rnhHbyjrD7r2fbCTTVvsZbtJyWs/h7F5EmThjgs5CK7z
	f6kDivjgzelYTKnoWg1jEo5AAcHmpuVlI8gDFF1c7bqgXTYKIIkqAJMDNXUplpVaVqaRQFxo04h
	q0GHd8z29kxvFE
X-Received: by 2002:a05:622a:1788:b0:52e:fb1b:b50f with SMTP id d75a77b69052e-532b72fea69mr55463421cf.35.1789915028955;
        Sun, 20 Sep 2026 07:37:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1788:b0:52e:fb1b:b50f with SMTP id d75a77b69052e-532b72fea69mr55463031cf.35.1789915028560;
        Sun, 20 Sep 2026 07:37:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm3948151fa.30.2026.09.20.07.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:37:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] EDITME: cover title for fix-tcpm-vbus-bis
Date: Sun, 20 Sep 2026 17:37:05 +0300
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-0-bc9a7c72e5d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHvr2oC/y2N0QrCMBAEf6XcswcxUmv9FemDiVs9wVpzSRFK/
 91T+zgwOzuTIgmUjtVMCZOoPAeD7aaieDsPV7BcjMk7v3etd9zLm3McHzyFohxEGYddjybWTd0
 6st2YYNKveer+rCXcEfM3tBoJr2JnedWW5QMJnpGAigAAAA==
X-Change-ID: 20260920-fix-tcpm-vbus-bis-e83fe7c57590
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iiSzUn/aeSQKWahRmmKZGhlAE3S8IuXG+BBv6HR+40Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr++SjidsnLRQfWe+ZaABAxajEvB8LEPrWKn1n
 hRnrcAlaAWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/vkgAKCRCLPIo+Aiko
 1b70B/9Q5KAPI7SVBkRxLExtcI4NmjyR1GOdq7cXDYtaHJrr25vrH/ux1FLGNYPI2IiNr9U6m38
 RrEQ1As8lqhXv3OvvFO/uguJeeak2GPnywp0xRmrH3KJemM/Wy8qCqHAMmdKZrIE8sW0iS2ne4V
 n+PXf8LG1kf88UOx0dtWmlvSsGM/8csPu3W3mKcYuMcYzgOGoXTNCX7tzRJsCmcFJcITTkJlDLM
 vNHihGz8LwON2z2cPH1+0mY6vWVpa3T7hk8net1WA4A6l4h8YoXIxTG85S0XxUAifEVp18MFgJF
 NjfmD0uwR5MiXjbSzgbLfGdbHD8vJdard4+qwItmahptZXuO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aafef96 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nSv7VxSjxcQYhaeNqXUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfXw9VMK93+ZFhW
 Hdrf/IDLYfZhf3T7sCjHIzub6m+0PwfGBC/LArYWwtLRZoRE8nXfgPNgDDgh0tQ8/v5RigUuQRP
 6izGOD1aKOny6pgPbto4GcwRCT1T75YNrrMfEolzw2hhy2r2qdDQxW0S53DGkC3UCCtfEHSHWw9
 m6wdwi0k6ELACXbzNClmH68j3jXNWttmIHtpDxXN75Lv3iAutUNNDMq3L8PHZKYilC+A116ZPiM
 SjQIt6U1fv+3eIwkCTxIuXSPeRFLcu7OvHzD6EbBy7jr2opwSqYkms7C7+IzmSLJ8Y61JS2rMun
 dfe3BPxeaj32FWr4Ha4O+2Fsz5b4P9cf6RZcnRpmA/bB3Wpf3knydFh3GhtZzZRR3L3QfOh5FKE
 F/xll4MDyH70yW9OsdpjuDsZ2r+RYxYh4Qr5im6bsiwrtuH5qnsg6xM2Tf0iljDskShKRhIyoDJ
 LpgMcauJw4qIot3L9lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX0xkOeLmPpvPX
 rb9ylyGc1S67BSy8OduUOr8R9M9lEdNt9lon8EZ1HCpYXcQUtZO2YnZddyp69HDQv/23ajwYkJE
 ZorRueFAf7VfSq7k7VcabjwO/J2JTsw=
X-Proofpoint-ORIG-GUID: 74yvMuxPpJRGed6PvxZVSep2c5Lc0F6B
X-Proofpoint-GUID: 74yvMuxPpJRGed6PvxZVSep2c5Lc0F6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: usb: qcom,pmic-types: require one of the VBUS sources
      dt-bindings: usb: qcom,pmic-types: make example use generic VBUS property

 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260920-fix-tcpm-vbus-bis-e83fe7c57590

Best regards,
--  
With best wishes
Dmitry

