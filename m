Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE7843C7A4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635823; cv=none; b=agkOGpQ9GuOdVwBKSSdUv7VkpwVvFs4IKCH5zZE0ibZETtkCfobUtMvaQqMi733xeM6WQhxPPR6nsQ9ezAvYLN8d3iXb8dL7hPB23nJ836AFg/zy3VTU05x/NUmlERPpRK+ttHONSbn1jVHh0y4joVu8dVwdG+1mck8gAHtx4G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635823; c=relaxed/simple;
	bh=QX78sqZ5xmhGJIuBj2Rq7kIXFu/mBo6zRiUzZZgKvXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EXjjeZWl3ySJ6xZFUoRPGU7pgOc2hsobaAs+12iKFQyd5ZXoj6xmNrB+zXrErev7heCf2lHlyjeKC/hRhTx2i3O33miktyGnctKydRRrBO4iYs5PT6NWhi1W/iFMyqk/+gpOCRS8orvF6I1p6+Om+F4mnzwxqPbxnxvMxxxgUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxmYNU5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUPEiwD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxmYNU5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUPEiwD5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60G5c1924331
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lnWx828Xw0QIJzA1273WB5
	+a6GkioOuRnE6SaJfCieQ=; b=YxmYNU5c0R9OCqYU4N3OyvfvL0AmzQkX7ISEXT
	3zbRuOMAGswNGwkS3LSDsxfQ1Pg0Ljq1MV9peBpx780wIy3kSre44DjZRH54rLCA
	L2pFefjK8X9mXSWOW/k2Yww1N8pE92JwNY2f4Vj0Ox+W5Sd9ybyalO2S5FLJW90i
	BaHdveMC5oLTkzCR6KZJ28Hc81LsQU2yCdQeHPjagZ4OoD8GyJU+vRDA+J5RrZEz
	IOR8asYnHzo3kGsjEgZk361ZHhVUHul1sxhzLmToOpIMmZQy83DK4GN1a18HJpBP
	md06goPXCGKcKaqbrt1qGSBGXARHUReVwn0fqm/xusFnLSeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8ujxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:03:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d0caso13967185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789635819; x=1790240619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lnWx828Xw0QIJzA1273WB5+a6GkioOuRnE6SaJfCieQ=;
        b=IUPEiwD5yFbiSAawRt3o/1u8UmSob2M0b9FYehzCP4DN8lFp2vv4I4yBXfSbhxCC4P
         Cb1L/ah908zYfvWpxON8TLmA1Ewu7aabTK5xBXmwwhczXuNmdYL1g4/ZM5uTneDei4AN
         3n3gjEKGzIZlqIilClbShY9q+Z++9y4ADMCSc0vDEmh/ZPn8lHj7rXY4u4obDj9uc3gQ
         Fi/X5/SeuextStIf52wP/BHBGchQ5uaWRfAi1XrraNPR8861zTwE6EYJnunF3dU+nWrg
         NTEGxEC97rYRSdhxm89SxO/ZNHv6QxFndENdR6fWtjzjM4+mj2iPLBH0Ql+CuB8s+OmB
         4OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635819; x=1790240619;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lnWx828Xw0QIJzA1273WB5+a6GkioOuRnE6SaJfCieQ=;
        b=EAmcCNN48c4FdJK3HBE+vL0zSxu7dRN7ecVR7BgInFSH/YB1UMj9nWFRfTk/lghtav
         A9UXjkPSiwe3oZYIazWsj5tEIvLScl8KFLKfo9toMFux1iJ8202cjvZ2FpyjZ7lQIcwb
         /5zZTOoKqnlfC4z/r/PNYa1pMLZ4FArTJt8dg4hHGbpsAlmelV6mNkCHjjt3LXbrbpTX
         01b21SxB3BtSxHjg0DfVCRu/OoFkmOwNDmGLvxIrj3CMWQFRaqZzjLvgUCOGx9KkQXG1
         acg4lp/S4c3PA2Gkpkw/R1X2R8BVvGemxhXVOFTrMvWrP0lm++oG1ZfKWtXcb0zMMnZP
         yJAA==
X-Forwarded-Encrypted: i=1; AKwUvBzfcpDQmtUwDcYYWsk+Rr5yI9GWAM/Utu1/zUuz4eAwZd2wspXTJ1zPkIBUu/kEJRH61kLNppyboQk6iXk=@vger.kernel.org
X-Gm-Message-State: AFuF++noC7N3wTTJO5VdAbZc3EAiirebPOktevagNQS7yH+KKHtsr4J8
	v8nmah4sUXYzx89KZfOfsi/Gx7peoaJ3k0f23f5xASuFTR+SqAJ4QQ93FDGDmeKzNl1LdhIpcPS
	xqodGTOIFU1u/LC/iFkPyhZUa97IFxcg5QfxV7ReJDsdFQ6D4htuc1tUJ4HdOpLk+Cwo=
X-Gm-Gg: AYBFou22nLFkQfQZ8s6D5JCndY9yMDEcYDiezb3iPtOpCHB+3hdzDxZ84xOWnd9WKZ5
	sZV/gNVV/tEIQyZJ/i+sHiw6WECzI+7NAClyZkTl3blF0gI+4ZqAM8s/LrE0VV/Z2EViTnpjmQq
	g4VBWlo+K0ueKpylUVfRtCJQnoHQUiePTGRBs88TMZg0f7Tci2tOlmOrjY8YzPM7AI36lBUj8aV
	hrT+il9+s4xx2Gg2PccMWZ7gm/yB1nWc/flLow7y7KTfBuihx0WulbMbyjOU40nZO+jVWv/Nhzc
	FUqFH1v81TgNRMjujXvm3NlR4ELlS5cwuSX7S+VaL52m80IE2ClzaJzGPtheoSqhXx4m2aLCGeQ
	+vkKIinlpkGb8Tb8IqeMKABD1ihRqMzkZ
X-Received: by 2002:ad4:5c8f:0:b0:8e9:ee1f:6631 with SMTP id 6a1803df08f44-9123d7d27ccmr106702426d6.3.1789635819074;
        Thu, 17 Sep 2026 02:03:39 -0700 (PDT)
X-Received: by 2002:ad4:5c8f:0:b0:8e9:ee1f:6631 with SMTP id 6a1803df08f44-9123d7d27ccmr106701526d6.3.1789635818285;
        Thu, 17 Sep 2026 02:03:38 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:891:4ceb:5214:a4e4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d240669sm2983343a12.13.2026.09.17.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:03:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/3] Fix intr_target_width for modern SoCs
Date: Thu, 17 Sep 2026 11:03:24 +0200
Message-Id: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2sq2oC/x3MQQqAIBBA0avIrBNMKLGrREjplANloVJBdPek5
 ePDfyBhJEzQsQcinpRoDwV1xcD6MSzIyRWDFLIVulY87wdZntdtMxRyNBe57M1MNybuLDazVs0
 klIJyOCL+oQz64X0/BFb/LG0AAAA=
X-Change-ID: 20260917-topic-tlmm_intr_width_fixes-dce5f975b077
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789635815; l=770;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=QX78sqZ5xmhGJIuBj2Rq7kIXFu/mBo6zRiUzZZgKvXQ=;
 b=OL7LW59htbMRMIuYGwBK35Fyg1PFBTfwmVs27vMXuSlRZ7TvC/rxiKvkLkrGCaJY7PZO601X0
 MWlRsUybSSxB6JuKu3K6Eov5uiJAOUhfvhe72P+L7YU4Vo9Z3X1orVt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: G30WsFStbEW3wKvqJXUYd6zfzsWP5RWb
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aabacec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TEHDUKzS1OOrYB3dJloA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX4ItJbC9Z9q9x
 FteMswZkmPtnRHq1Mdo6XLaFd2PLkO4twAFpb+XV4AGAzttZoh31Tw3yI82dk8JBrvD9IpXAQWI
 YuYiVj8t0+ug1I421XS33FewhPkjNdk=
X-Proofpoint-ORIG-GUID: G30WsFStbEW3wKvqJXUYd6zfzsWP5RWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyMiBTYWx0ZWRfX3eBBWm8rfM1o
 EoxCQgZmCmfGQf8w0NrMMON+jVlVKohZ72n76OpyAXmhieqEsUnNDTrKY9zo3l7YKETSc5ZXrHy
 hYuLaQ5pJzYHwWJVrJCpHoAlXRYqmr+6oFx3oNjuW8FKYxCuXdHUhW3zDvPDAn6gd0pXbRIiwor
 bfbtdnu7Y1JUTpbDqNGTmG6SZubvHCim2Js8cl66Mm1vRdMK6OCkPetz7Rdi93qDxunQSjYdjje
 KFcOYPSDsCR4D8trZbs4gdcL/czNZV9jrBpZQ0u92GC7CeSlDSS461Es3kAiB5KCjmlleC+N1OP
 DX5iI+K0epegON3Wgtnjzkpzq+Rjnf4wT03FZcceSTpJvNpHadvspzjkhqV1gUolrxBsU00MOLI
 Xmp8YNb98CjeaOw1kjPaqXhTx46qjg2lfzjjYIkIG4/NDR2caIS4VV7pM1Fi4EwPOMQPM19nycR
 N1xsM+cI7fN6kPIqowg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170122

Following the Nord patch, I asked the robot to ensure the value is
correct on all other SoCs and it found a couple outliers. This series
fixes that up. 

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      pinctrl: qcom: hawi: Fix intr_target_width
      pinctrl: qcom: maili: Fix intr_target_width
      pinctrl: qcom: qcs8300: Fix intr_target_width

 drivers/pinctrl/qcom/pinctrl-hawi.c    | 1 +
 drivers/pinctrl/qcom/pinctrl-maili.c   | 1 +
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260917-topic-tlmm_intr_width_fixes-dce5f975b077

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

