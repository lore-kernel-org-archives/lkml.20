Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C7550DAA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081909; cv=none; b=lKls9RIAwIXaPQqftpl2v1e/U5/ZR5u+TBzLfTYNmy2U6UvLT2v67Z4IA9ZZbtGxn6hQkKncAwqUdhw0NnrC1ZCV5/rQpj0UjCD4anbG8IM5kqF8DegOtjx0S0Qoy3reCSke4/+p76AOhgWh9NQqGmAoj1SAdbF/HdWc8qr+GHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081909; c=relaxed/simple;
	bh=QSpKCyM8sZRrkH8iCybVhH+lwRqWiSeaHHG1sXtFQNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PN7TploM7NN2OwcdfoXC/SJ9OZAX6+1SbBeYIyIJWuNHKokTXodtWhUNgsgLJFvjPVJDRnBY3uiyBypSmgR+R6THseV+Nmo5t3RBSm5X8V7qx8kJAb60gakOHhHwTe3sjBuegtzUeLNNd5/vk6Gmvlj0J0ZE7wJIBTjvhM9I3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIWB2lfD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fj8c8h+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIWB2lfD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fj8c8h+j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPkvF134559
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=; b=KIWB2lfDb+0cFwdu
	x2xxBtU35JfmUKYkSo6olWVg0R+d+5/DTQt0irGA/hS1cvi0fyAoZeeHgnhnOPSv
	SP6S5nhJSYU7LK8bhc9GRhsom7SB9F+PcLxEfhLCI37++HsnZkrOeMLGPkZ4pV2G
	nofTzSuG8KJJmVY50aiSLiLQBIqNg+kjc9lQq9XB5sgYRpMQkSkMUNleBGyUbDGP
	UfO15gved1vD87/R8mwApX2d2YwE8WRefjln1UVeiS/awmC+KXTmc1j5AyY2mzgB
	pwQsf6/SPZdIiRH+5HBOrslCcLNRJ3YsoYPDy1vYILmzMi6WL/a3UVwaeswdbx5o
	EUD6Jw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkja0g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso1100362e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081905; x=1790686705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=fj8c8h+j2uK24xgB27rhdHwLKo9gqXygSeqS1uHL+AjDQEG93W6NGZcXBh6a9RlyZn
         o6kAT/GkVnYYCv53grbiqbwS4WV+rOulodHgacWI+46bONBSq6lz8JR4ElROorLq29ZZ
         EiZfFliGUal5WFvGrNsY3gVOLOpvzLLijPi0r+Eoa4K5szLH6/983SD/FGXG7CaqksO2
         zcslLAHIfM6TrGtE6diVpASnQk2jnpMhGGYlz7ztuKL4pJqzeIbo4EE6hjZ4YlNhZcKa
         u5KZbAz1Zu9XWjINWYYa2Gnozs9YNGXzKJ2NPiAdMwcDsva9PeByPTWZCKMPQzH1N/dP
         kSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081905; x=1790686705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=rn//s08hLoPObXqRTkmqA1p22k/bJ7i6RvyYhHcriJevlPW9Hrm3A3g85+36foc01T
         233xWNZgdpIe9auBOAw7NExNfjbZRnqDU8LJRykfGnjaJpXrLBZCL+BQV85Nx4lJmGMh
         eBBrSCq3asXZ8kQKRqd3br4JdITQFLbR+UT7oNo9JdddWWln3QbEp99k5x76eOVGkjXD
         U34mnpAC6Bs++owlP25h7tUw/PggJg53MfO+CrYkJKqO83IHI7lX3SSzB5rNK779RW8x
         GTsPeadKaUXb/Nab09rLV8QBOT4vTq6vv0GJKOcjVl8PXEO2PM+6Vn+2IP4T6LSv5V2L
         kY1w==
X-Forwarded-Encrypted: i=1; AKwUvBwF1ByGCGwqm3WfKiZa6DBpNIZBXIYnrXzEzkSBred5/RgUWZe/Py9LdXOTRowu6UskT78BiFe/e4FbDaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJEyr73yyRLB5iAEp+Jf03+JOuqIDJHtSxnOgkhVV9SF6NfP5S
	HEJbjyRPZ23T4CMGVEyJY7BJTgPscDRxptbwfClMlwc7n70+ZFk3qjQgxt4CsIKRkCIUg5p5DXQ
	uzYrK+JoRSJfMmXcl8wn4GVDmcgjCr1h/q/OyIGYLosobsuqCybkv4sF0oKD/FMMNlDM=
X-Gm-Gg: AYBFou39itmieBk3SEA4MFUE7N7mKOrI/K9Zr46V2D8M0qpliUq16tWuLdmrB2bWeiL
	8joXXz8rO/iRAIXKGImDMnia/zqjs29W8023fAcXw/UyB+jKl+v7a3BlubPTmvtWfpFnojSOb0S
	gCdSwfw8XmnYA7YOv+EIa13u9JR0Me67rrcJdloVQZHxOo/JDZuYPOuRiT+vLQmjuma9a15LWJa
	ZjJ458nvGB8GGFzE8wKr7M8U07mc5kczq/NGubBx/obORtVhYrwa7SJaLFMN1mBKwkmxu9at1aa
	DB9NNe/GmTSeQ8sN2Z+NpFZZJDigGxw1Z+c3HYB2qTr+4umzMrFF9xZWjLBeAqP6R7npcu21abV
	WNz71E+mk/AbRE/Uyw8S7f19roA0=
X-Received: by 2002:a05:6122:3488:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c9b5885d0dmr8002431e0c.1.1790081905248;
        Tue, 22 Sep 2026 05:58:25 -0700 (PDT)
X-Received: by 2002:a05:6122:3488:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c9b5885d0dmr8002398e0c.1.1790081904775;
        Tue, 22 Sep 2026 05:58:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:29 +0200
Subject: [PATCH v9 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-14-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QSpKCyM8sZRrkH8iCybVhH+lwRqWiSeaHHG1sXtFQNM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsntBDvWlAS5COUQ03+xkA7ZHypS6umrEDCSLI
 dauC7+6RV+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7QQAKCRAFnS7L/zaE
 w5M7D/9iAIzuA1TTTvPNYfwed+K8b9oNDY7AYeVjsaB8CFqotIsA6/0mHPhKJK+5Hfw1vJsDUuG
 +T/6tJ6s0VeQwHtm4tvaA3IclmetEszg194gkPMmwQuB3vZZg08vCzYGHdhdPoEgiCMlZMZZtwU
 N9FMutmW0TYuyNQnnRr1Y9Uu851x6CXd7mtCtWnbYig0l9vy51bxeAlvnf9oP+zLNG2lnZrrFsb
 KjYVdKKwcJkStEndXYI3xs+A5Vy7IrC6uNl8/mCvEhG2nDU78MdQQJHyl/bXQTBfe0hlcnj5P4a
 haLNPfj8ZFriRf5nyJMyQp+9tUzgb46QC3N2OA8nfWEPY5pAS4NSsNfbt9WL+K8Zi01x6MGb5n2
 A51heqkbr/eaWBWe8t4adoh0HzAI8bJ7K58F/r5cenefTp5oQZXvPYJMhjQKB4vCw8sWQWeaGCo
 vWlU2e2dZtIVO+DiliLM49lh4bTjYb2GTYehD6UYeY6B5oZF3bTrYe3NloKVeP9/w7rDeFn29TL
 tsDl5CjBs1Rl7TmZT6smB1ilKmrOdYhE+XbhXagelH449cu4AsP5Jvbxbt5zvVttUe8y+c09wau
 KrIVtBgd25rJ4al+Wjq76Q48nRBrLX3reAbqKAnobFarQzUwhbo63tx0gDXBxVDq5fL6SIAo6pE
 autPbDIl3pPryvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: cyNfqgZUb2tIuVeHAY-0py-VmzUctpFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfXxb/RDSEdYH40
 NQuAhbronUiuM8R2HYGxO1YpOE/NR8uoMKofRBsHP9U6TgcaOmdouztWbB/RiL+i4OENsehye9a
 Y5nnVvwOD6tV7AHHIRsPmIj0bonB7xahhw/fcPIfH4hk+9cF7qTSddvA/txxfUIfa8qovQa2j9q
 3gDgPXj+gLyUroS2VmOkm/uBsGihPGp8+hGIuJIHHyAzCHw6TfCNjBBSbufDYDGF7hTQZWTC4md
 U2DHIo6YvIJiSRfK9dfoYgLdF0+tdu/iVqS+sG8tUncUgqMpY6B/sDsyT4T+iShwBycmvQzGPtC
 aVM+Pg+CsaXNPxLGunKRoVPr+iPAnYVdrWO19ZypfrvCJ3vndAV5XNyZAknhAaMk/iVzpCYjza0
 YsHX2IQo/PfTpt5jJXiNavx9AeBArv+P2i6uaWp2KQF5e4b4x5eGhyiQiZ7z+T/YTQ9eMV2LiM7
 wCXMtM8lhKIrRmQ/DBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfXxhqOqYa1v5iH
 Uxx4t7BoTp78lKeAVUZlQBjlfEbX64oGu/TbYV3utPBhns55pHAqsPjkl9luggxsuIrzPc+s5Qo
 5qeG9YWQ2oJ4HVtK5ZtnMUiybIjBjGQ=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab27b72 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: cyNfqgZUb2tIuVeHAY-0py-VmzUctpFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the multi_v7_defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2d6292f8cab39596b540084fbd8b30f4c25cd4ff..7750b11f80312bf6a6f0fb276315f32f8714b4dd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1150,6 +1150,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
@@ -1323,7 +1324,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3

