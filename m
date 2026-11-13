Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596284;
	b=1DraxVu/WPyheHwS1jO1agzY7xXZlGPgJlgAfJnl6fEpskW6w+RThoxL4zajd5rV7Qbh
	 LSb6MSyeo7YiZsSFpxH2svrw1iKj5pCEzcw7hD/SLltAv4DEq9sLVqqDX1loUXDKMZsH1
	 lNjh8lCcw8ctsIEDA9lymilcKm9PBtGtdC72cmFQVI2SFqtvxExioND0r/5usjYkaawo7
	 +EBo2W00dEs6/Cx1dfB2w3ccpAIdqOihEW4N+uoYvnZqDM+xDr9Xy4c7amneTIWdEZSnG
	 2n1wAJkN6qIXA94vPnUI/JVfeRuSLBojgJVdaDFJPKqhbKe9jZlTTOhpF/gcJ80cx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
	b=lhdvkkyzkKudGmjJBWhN6g0y33m1/GY2txX256uznkgLRr7GzsA5U0LHGXdGItDpiGvH
	 FDrZvI40ZJqcJ7WWlk8Aa1kaFJGopUFsGXDX+IK9NmlhI/LULoEmSViDqx/yXpL7VHvnU
	 QnWOSHusGganNFT0yiSVl8LK+KwJntRFkZ+7NCLMSoW8LNEGrmuC5/WrY30MR3oT+dMm7
	 nPfTxLnZ4oRxEBG0yjGVRKSz1xH2j3Rx31OgpJOvcbTRsuxwnZBT0sjYFKDmsK3REREYZ
	 kFt/fthT8bdZXFbz5lr9+zuLCIevaBQH9YLyCiX5ofdJtvxHdOv8QTYWwt/7YRaLzCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kH3lOc2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UC7XfJxZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B547606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B547606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH3lOc2/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UC7XfJxZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR0jE1011372
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkPg5/GgZz/
	9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=; b=kH3lOc2/yjDZLOgjOBq1LJrx/uc
	BfQYSDeU2aQnW4rMH1CNs0uAvLb2uAHJxTgwHFXviP3xSLTuHedKmRex5+sJEUwk
	KWWRbBnsPOD8lHRrty8uXSYX4ByM8ho6zL4byOafDMPqAm4hzToTVFRFTdb30By9
	8ovLMRlCqkoFWMhFTOAG7zx6RmIUa2I5sSIcWEyZ62F3Exa13GrqLYp0WQXdI7sg
	BYRr0+ofVPhKE1vK+gzFVKO9bQFWloVxuqtNjRBaziwcatt5AcVkdPuBBuTO4Wpg
	hNWwHZuJ4fxTXZmVgZcZkKXiZBDZgkk7IUVRsBfrNkomupeQnU4bcVjvrbA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdmj87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:58:02 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-49e379ab077so1365104fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596282; x=1795201082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=UC7XfJxZYIdTeKnZzI7DpK2T3NicmJud6FURd6BHunvcGdgYYYmixxTNXaiwwIZNvM
         xYPsjSKlFyGzmlDwjrYlYdXoQmrTqt7v8uXPJlhY7uhIf92mcqBYEGJWpsRJsk1Mrfqf
         53MeEoHdwoemNU3aOU4cpc2tAIK8fnIidKtUVH8l6gleRF1Prv/Vnksrz56xnOqJ1mnS
         c7Af8M158yF80k7obIPXAYJdC/yXWV1I+hoIylkP6h4e8LvXGevKNhg8YbouVXJS7Hvj
         mTtsAAtF7ZfcGk99jo8H7IkKo+m9mQoj6k0jDM8Ae0iNxihTrnxE6xsfQdSefePJF0J0
         PHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596282; x=1795201082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=k6B6wXUQB+cKMNwVs6nLO/a+oib1bKmINBrcA8sz7HD1Yit4BhbKnvxJzqsLPYEYRs
         nMW8ei0pK3pEbsR61D4c5bO1g9tS0FjKijq2y31tzn5muYPga9bBCt/bWm/NATT6pyIh
         aoDibXomGSwtw8TqSJacKzz+daIe2VIXwhDLZswyOsHgtxGLYowe29u/PAA2/PC6yWci
         BmAcQhKsmlekJL05fL/B0mEpdloMphmNvqb7bLUUfIy5SPRXfzsV4q0fr+Lep9xg9s+9
         mQl1qM+4jrOPMAr+HwOFduMkC61RtGo3LKlQytNVeH3hFI9ua1tupHnWvvhkrZ1ag0nb
         +EAQ==
X-Forwarded-Encrypted: i=1; AL+hErF1RpS5wpDVfuXN+OKHLPJ8Lwk/Z5cR9Udqi9I7NVO24PIcTy0Dcu6myW6bukUeb7i39SE7HynK67VN/UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FExqCkIcS7Vm3GMqZXQgpfZNIZBpRG9aexH2N3yNS9iEXHaPF
	WNLlNU9cr7RjCrq9Q/NiA41C2QIuNTaY0OO8JRZ0o62pLQspKdEzUONP10HJOpKc15BcoEyCs6O
	6qJyCafGAFkxwKWsojIaIESq+3g/h3aauXXmvHDHKJqxDpmz77fmgXX5UkRU+xh9gGAA=
X-Gm-Gg: AYBFou1HKg+uVAM2jppb9KsAruF6bU3BXbJ9DK12KJdehPc3/6q5WaU/nwLnMDkcyen
	SbYYYn8c8Ck+M7XIpi8vYkzGHi1KY5DltpwstDuh4wlseFcNx+zNRRUrOREWBO/F8TMZ5m/VIEP
	AizKVFTn28nnQYRMO7vOrFyYTopfRovJI9LszO1R/qqRYk8dpCqQLP6yEfL3wXlowHrnlGDG+uD
	QcxF4lBBl+6Zm1Hf65CFSrIoibORaL6iwVXEXM4XcMa49+KuY0xA6SSik48XEACrRqqLDsIfL0R
	Y4Ugbwl4EXDpM4RUwA44TJOlKvkPCgcmaA7uTY5tPyuB6PCPY0cHcHTCfJqFBH81q+bzv0FuvdO
	lS4SGXhmF83DL7c8QojgFEBQz8E8uIfDNjER5bEV2/8v86+/4QwBvTp4aH3s3CA==
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549346085a.17.1794595947674;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549343185a.17.1794595947195;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Date: Fri, 13 Nov 2026 19:52:16 +0100
Message-ID: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=704; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ydlWfHv8KMdXhcil2lvko+LTGW6saAZRv+JES4jy7+c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xf5vzRttUphxuP6s8niqvoRGePP05uJmg+y
 NWC57ZpAcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXwAKCRDBN2bmhouD
 1wFuD/9Xs/3OZFXRUKqYiOXZBAwBmVbvbBExEfwlLHe6jS6qAFeHhQhGL93Ylpvv0Td7tCZDuUX
 WDn78xTjPkwg9CrrdNAjva2vQbdhcof5jz/fKvdgVSfBVsTHp10jzmaM6LdWVJJIOOliC/Z+PYN
 YGxIYLaDhMTfHVGqnrFFeCcexaPbUdcgyc9Mkwwpg2aCzzZQmXnyD2S3dLS7tuzcg3XzzQB7HFP
 RSDduEsrSiEydijcnyi4DYc6bM2e1wnkHgATFGNu5bdwsbiceQifIa+3I9Ouoy7V1tNL4/zd3s3
 DM+H5aTQlvR2Ak68bKMHkGIStfFwm6EHTvMvUzHkP3+x/V/SYlptDg11lii/WF+D8Kji7Svt0B+
 JZEB2ki616RlV0IsXSM+Ot3bDpXr1tWObZC6RVSn+YmUx+VYAkzI+p2NhDr/JtwhUq3gWfJlmHz
 273J6ggcHKGw1epcLbx/agjKjxjb6DWAnNqxkps4A4r91f8nd3y8KKKbUNrN0/nB/gOUj3OvNS6
 94r7g0EOWYWYE39vbF8mMkRkzKYFAnLhz1/wDT2ja7rilDldE8bzRt14CcWBjwXSFBf+2JtdnS6
 iJmiRJOrRF27jLm2zwfqc5pCnLb6Ss9KTp9ncmYQrbEEVn87GS/1mUuHUqHPQYFb2YeOiGoSWlF riL0FHR4e2KJsQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyXVLl6rg/W5w
 li6sqqrWW1R4cmkWqxy6YxdBC7QxIwqD97e7yyz+6EvLhEtnoa/XvmbvOtwiUSF74M+xJDZCxxS
 xsbLmykogjnmyeCE/snhD0E+DGXXjls=
X-Proofpoint-ORIG-GUID: BM2B3UhQZ-Aaj-wdfG3mOe57bcJ-mtJJ
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af75dba cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=85fTqwSHmoAmm6HRS_YA:9 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX6TOMeKrbWYon
 w10ItYNidQHkSNd08rsW6PwFbU9q849y7meaAjGdYiu+Fx1XTvGiP32SrWxev9SBTttpX1nQeiR
 1jpzOtiUcCEaBbYsbGxEDVEQDSa9sLftjTpUw8/QZbWv3QMdbXUUqkAiWr/hEGOlKwMQXQx383t
 Gu5o7m8pmzTvjc2mhkrc3jaCqPiE4WqyWIFykupEvb6H9c0xpDKHrot/Z9wmvyS/f6r8elIMg2z
 jbgCE9b1dCgurPTuIr3D76MFJMlx83iVcaYHK9TxO9i2kJPwZeGFByJ3jDii6w47Tm5Ep3/gkRe
 9ADW7QY5WKQNV/BE9KCj2i2jK5/bLQ7Je6j/oMRqbhY2LTGWXqr8Bs/8SG2Ne+xrfLdpSle2JiV
 /6vowDC/wET73DigFGDvklc63AsCAtAVL4j6RCYq+qvcnRFRfjMGtWg2DrKbNeCf05hbj/psPlF
 UJiujCkWqfO/3G45vLg==
X-Proofpoint-GUID: BM2B3UhQZ-Aaj-wdfG3mOe57bcJ-mtJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..5d5f7f8a393d 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
 				resets = <&syscon_apmu RESET_DMA>;
 				interrupts = <72>;
 				dma-channels = <16>;
-				#dma-cells= <1>;
+				#dma-cells = <1>;
 				status = "disabled";
 			};
 
-- 
2.53.0

