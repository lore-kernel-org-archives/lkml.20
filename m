Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D5492E4A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045310; cv=none; b=j8+6jQX/o2vFmBXSqdDSeFPpUJtNB5VjyNr/p7gClwDG/PxvDUMkrekWUoY/Llxficx0tGqZQyB3Kd2NmZTvL40e4Ny4x3Q8c7QZ0iElC/kiSu6mbJtPp5hjIqgfCIUNk6acnN3kleI8pD67xqkHfSDV9/Fn4Y/wY3MGpJfOMr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045310; c=relaxed/simple;
	bh=XytiMa5fLcLcaPGL3M1duTpYUfhHG3JelygOKP6fjNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0JPsnxRYNKikEz7MI2Z+ZN5K8bRMgXSBaRiuAE0M4WGmEvkwsizvcEcE/N1ERyikGzmsO7AyDPyYJai2i5Y19LYhTMLOy89oZ8Xf9t8IsvbpN+u9CmoMtLbc4Mtzp8Eu6gh8PagHsqRVIMeouLgjm2XS0mlbJEx4UXRm5l/tzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRR5mWrk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWxfqUnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRR5mWrk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWxfqUnd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hVm869072
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9y+j0WrhcaTeosIVoQO4AEPtqrqZ1qq4THTfq6/CiPI=; b=MRR5mWrkw7sp8mrb
	+st2fTWlOsLe8lbB9suYJkmM+1KixoDyRS9GRUgWRKcFJmLZbi7zIxyxM7/ob7Y7
	qzhr/dzvcDBwNWNNusGWVTv5uC/NV29LDNxqDnf0O84tTobDYCFIxFyffL7VM/cJ
	QvF5t6qtA/BVh5hSQS2tmRhbkUrfgTVyTBknzDS1O6UPggTc0BbBDzHWRJC+87oQ
	aZTEYOTCRXFRk6cjObUtEFYKQv1D921HO1acxRGOlc/+CZbIda2yMsjqut4sbDmi
	aqjlj26YIQWnaERXcJ3r54sJGbqiextkb2g1ndRqTvMmAvmWheKhrT3xi9MhkjD4
	D41pEA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd3vp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-790e3ca4c85so217659137.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045307; x=1789650107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y+j0WrhcaTeosIVoQO4AEPtqrqZ1qq4THTfq6/CiPI=;
        b=GWxfqUnds3KR+FqMPD4jH3GDb6FjBlscfr84EiNXphKcaLWjINQSSC6zYzRpp4MOvA
         aEAZjo+3ubCO1QYOX5ZvEEJTzacFd8jKdiz3AXsDmbuZqQHVxYQhQN+PGKmzDFm9oGl+
         KoW0/GWpsQ+dsJo8un31CcI0l3FfVYHhvIKBp2mg/DVaGW/m5LAjMAUy+n0VtQuyfz7p
         hycWQqMo60vXhvpW7AIh01yOsDVeleGGuOe0U5GSrYrOLPzKlCupbSLwFzeMFLB7aVBI
         m5DXs5cYKZMmk+GQWbcWwarTFOIynjU3hFC57aeHxTz7LGbRL24Pp+J5ozadscHWvrI7
         Rf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045307; x=1789650107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9y+j0WrhcaTeosIVoQO4AEPtqrqZ1qq4THTfq6/CiPI=;
        b=NlpFjY9W3p13g/tqpj122K0XgTQ5yYrOoInAruMfy3SYy5zTq9yQeWOt/ocnchqrsS
         JkwHbChOb92M58lAM2g/lF02s47X3bhh8QUh+Bc7NvOu+tuLKtqTcZJ3UKxo1XDg9Jj5
         ICu0c2jYVFC89j3Acp6GGV5X4UeYyCUdlqva9rE/+4XrTODSy9mGVLE2zyyB0hX+UOn9
         Wx3Fx9sbr0JyP1KV2Ni51lEDmtsrHfvx0Qntmx6Pp6E03uCiALjFx8/jyR8FI9OGXcJg
         XcQTYICOJ48EA+wqqaBE1nTvC0qcd4RVXdH7roOym4CPtmcDDamm0CMuqTBUp1YyxxeH
         fFPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzEULPE45LYbX1HB7wM4fLvfX9kF5XThZO8vCGm0aDOjUCUTtY2ZXiUKhLgj6+951YqTZKRTG1bmBggOA=@vger.kernel.org
X-Gm-Message-State: AFuF++nYAVtJTbkJYnW8yCI+PI8xWeW+fZbaQipa1V1G3ugBp2Hol7Ig
	7bstacsgHBRc8JFc1bAPpVxaoMlQ9e4Tfod5pGbA1x8Yj4BzjDsL/vOfE+myWaqu2BvOd9D9dOX
	PW4KvQQeL0brI6/leaT2l1vwrDIou7ZfJRBRidXo/EyGQ4ZN8pJnhHZXUHpruiyo9iuE=
X-Gm-Gg: AYBFou0Urrft8MuNIVWex8gCEVwNikplHB1GuO9K/7Owa4G7D85SJRFDEfcodExXc/H
	wIy/CnpPTITadGA7ot3fgtS/SYp45g7ut4oFVY+zXOFagT0lOeKmp7YOLDe31N+r+UY+MgGf7yk
	d8bMyILdOrFCpeIvqZ4t4pLcNvv4mNhPxJ3mejAf/fFrZUHN7Rw0MQ8zWzPleXzCESYeZjdeR0q
	W2QblcV4rHF1/q6+1sem2voaK6ff8VZpt8xaitc3406dU9mjb4Jr8vtlws6ESCW+rjAufIzQ8+l
	aQwyJwRnFzEyfJV2pNOqB8p9y+RFxj3yW/Dp7qPpwEy8xoW/OACWfNQ+W5MAPVKGmNuvLieADXL
	VGLYd/653nJTa0mTYJnXmZSBzU5sa
X-Received: by 2002:a05:6102:3f87:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-78f7380daa6mr4474225137.1.1789045307038;
        Thu, 10 Sep 2026 06:01:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3f87:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-78f7380daa6mr4474097137.1.1789045305373;
        Thu, 10 Sep 2026 06:01:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:53 +0200
Subject: [PATCH v7 12/12] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-12-cdbd2718af14@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
In-Reply-To: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XytiMa5fLcLcaPGL3M1duTpYUfhHG3JelygOKP6fjNU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoUrCFfw/iAqEZLzK2v3C4rvF8NfOJ9iaf7c
 3KA62RFrlWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqFAAKCRAFnS7L/zaE
 wz0nEACPCIp3sLsj4aRZlzCbLYit9IwxonmbBkqcEq760f8h60L9eE9t0yHHjUfOil4qhUE8p15
 Bw5i1QId33cfrfJZbIbp9zS3xgC7x6nxUuYyjsFbWeRncWyDLrQZ//NLPYwhi73zfj/RySl1Dlk
 cLMFeRghi+VmOSQNX/goJ0vuvxK8XXoITqDH0rJ84eiuUT6uBvnBqxd7/3B+Q9+qtX+0lCYaDjA
 GlkvgwPl3tC7MqM73SPNI2vMgfg1BXRi1WwDQxBdxx8V1MiFTri6SwOXty2dmgqFCeiohT3jAul
 +bzh1leY9oWFv3zBvW3Q6RJkQY5m+s442XUYWpfI+skPkZA0N/J6d/VdjvBjqSCVAf03XvjnHWo
 gqQSBPzqUVUfv2r25ZSC/XMjgbkZbUSAqbQj/3tpPZBQPUb7OxLGnwf0qlaOpjNuFxM3L8hhz7A
 utibAbZQd0vQcrdwlsNAVNO+xGjm/01UJCuEP0Nipk1/VOyQjaBpKvy6eX19lAq14mO6r+Ryona
 JG1IkXWLcarVeFY5unAZr2YeRU1SZLwXoh1bUiOU8tjWw/+J7UCyr6QH1rs08osvlowFfkb3Ym4
 bsAEDli70AhlR4FUw77XGUDrWrRGxJkW9wMabWVOCAPv0DA0s0SFLNoTSiA5nqeaK4ChyBzl12a
 nd/sknNMqkdANkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6GXx_esfwzT-6RxzDk07YCgITZRSyCYS
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2aa3b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=talSHFZyAPOHLlyXONgA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 6GXx_esfwzT-6RxzDk07YCgITZRSyCYS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX8o2vyB6zxB7N
 /hSt3xEUP3tvyiGk+MhuN9iY4GDlv+yEPCWXBQd1cXxHLoS8z5DzKR0Dl0misCaFBgMkb93bLAL
 jRjrKsU0KJ5Cs7U9Zn5lfg9aH0MezIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX3ASgcP8UaKQm
 pQglYVtwP7mX6SG58EGrRtV+o6LEFS/FOMBGSdwxI68TiicJ6s8YKndOe+gGdRri8h80MgfX4zZ
 Q5xeXaVkJgUm2sc65fmQf6iZx8wg3godkTxCBGrvT7uHndAnc9ejsfehPRL3ksoeNoy424FUWM+
 XcVOD4IOQ3YyTZw2nh/a1uypJCYdkjCx+h9MVhlbMNebhbuYoyuPL5WJwF62yRRXE+h7fPNm+iS
 c2FtsLjW/E0/L+D1wWI1Fq8C97uW/LsgmX1QGAZzsxFMUOv/FRKAPXPghp0f2uYSkCZX6dvIgMx
 T4S9YFkTt7PjlA8VeCz8KHFtlgVlnjq+HjF+63OQVNuayc+eBqMZ4Lt8UxRtrOqnHJEwYCxd4WU
 DBq6wVk6lT2QqcC1JffrCHkTPNSHR7kTyHhhYmi+60XjaH/IJI9S+0ahHoIairM2CPAt656KS/a
 uPCtLQ4DCxzKEUOj/8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100156

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f0947c8176a16b2f0c80b17ce8820e4820c77b3b..ba9450d3bf024475a92d13ecb8e21d3faf4f63fb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1666,6 +1666,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m

-- 
2.47.3

