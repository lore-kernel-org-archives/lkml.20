Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633705;
	b=tGC6TLNdeaCjHpfgfuP6K0BnPmEBg5EBQ5Qvzu//QO5AMKr5cOe0y9RBPbZ8TRB7BYsL
	 zvAD2CvOjArgnZCppfOM80hORxpN4u6RW6P8IaZxHTM3gq+6dUrOYRB+OjbeYemgL5zon
	 JODAmitVmXkmV/tVu1hndM2148pwmjRbqafGL5cCNotsoSto6QZmYaTJ0EIxPsFPH1kOu
	 WIp5KmLBimjifxaMz37WrKASg0hnkk4SGpNUuyHSsACpQ/pNoZddvUfl2Eo47v8K9fY2i
	 Bl0hEnkSYMkTd8zNY53eRkwiJOzEqPSt6tf+6nbd2rl+7emQQFfIqeoHAKefTo2WErw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
	b=igrQu2kdOuR2Vs4PphlVfv3OnfV/8Bu5bTE/R58+bqhd77aN+4bYHysBWxoqWSD1kJdh
	 3Dynqii05/vdyfqWWbJRbO7RY6g/4dtF7BPQffeHUr4Sj2ZZ+tnbvp3leVG+3swIm7Ou1
	 Dm3bLCFakqH6gerKOGHZqXMZb3bXzZVJiPqmoxyRZJNZ3imAL8zgxj9ICXC+9ZXiMMQjG
	 BrY9qbYFv/r24lRqzJFDt9bdU2JFAzbi8VK1QgtvB5Kj+oz6pRGczrGyGGKUHlJvbyln7
	 7dR1mRjXqdK63WcdwPn3xvXH6UbTLo4CuE05Jgtwr2HJcfMXnA/q+o4iTbOIfOOq8HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhfS2aKU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMD2HDC8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843060DDD69
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5843060DDD69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhfS2aKU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMD2HDC8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpV924062603
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=; b=BhfS2aKUNTCYpxkM
	WpAQunypo0j5+wjNL8cPYdY5uAqXZZfplp5hB6TxUIiOLQ9kZr9j5kn2dYtcLC7p
	9xuJBDj0O2l9MDs3du4Csov7RnhqHKYx+X1QAsfV+larb/JnuOic5f4AxZa7/6U+
	N8m85wkxxraowHlth7+TcMViLV+JafJaGROOK8SB49cEipH3Z0qYSy/UOGGVjccz
	04iJqes5A9WTxTbrF25r3Pm+6QKFWuKE+hQfAjXk9OgNkmqqSrb61xVOz+a2I1mS
	jXeaUbS2TKE+YwI1cOnuf8M2r8PrOWY2QvmhC1rBuYMB+yfVYg3+I4I8HRGnbmvu
	9m8izw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmet188-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:35:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so272781985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633703; x=1794238503; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
        b=VMD2HDC8lPwCsV3Lc2sumfW/xfzpxCnUJzsEns3rO/QIcbPPbZytmFIsnFRlZYIoL7
         Wj2KLm393ZG8MLWYN3OB3lSMLElV20aZFFSALUEnb5Q+gxG6MBxKTGmpeBsotLAFy/Ac
         6XTn24+xRJag/wb9/i7exw9Cg2E6jFV8R9uc8HjUZdqIESgne3SY10+yk6zFfjjFs3iq
         WuQ3Lq5UUWZ7HR2wGPG0R/8WyHrK28+g6+n0wfF4I3EtPipnr+5CTz0TC4T+xv0fohiy
         UpcJQaV4umkdvHVlfeFGSTbP5IQGa1SgIOJ5Otqdkon/KE+g75yLVMjj3QCXgJi784Wg
         iDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633703; x=1794238503;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
        b=lwK3UkJ/I7Fq3enlsWzZ/1Z9Bt11jMjQ/b1CW6UaBCUgkikoLBkp/9Hnu1Lg4E/a8O
         KZyEswi0T1fFkWAZC13Q34qQGnY5Ghepq0DRs3vP/r4YZkT+zE2BEcpimdGZxvyCRDDa
         vDbuUBDeLizikJM+3Al5f/iG5gmiU7Tx/gfv0NeM698rsGWI0HGuOgZGTOV5ihBvZPZl
         wXycSW6LqsaDQAMaAi6wJP7HcxyluV3cbJ5tF9hcIGfeH7l2DlJVmFK79w0pylf1/+/I
         BJ5ctEp62r8m3HJ/lkZ/YD1uM/77EKj6/havR5um4JMTnG7fMuwFJHB7BBPlE7jNWquF
         lvtA==
X-Forwarded-Encrypted: i=1; AKwUvBzxngB2Jxf8IGTaMRP/H2vmuKRGrTJw+rCwbZtbUpkfYfB9v8/ihYGyOiGHtFOuT4/TVkTpyCPSTc1VhKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrexkAEYzQNVXSfpVGE4GzH4Vr/kPnni1VX3FCe/cl80I6Ae+5
	Xp6hSAjg4OD1w5aj0mnrHkx/lk/7BAN5tLmUc0g86bUSnPapIs3mI4QXZovWc1R7DZsHSUbeUvX
	yn6Sop6FjgKxKFcijd1NbuiJQ9D0YvZRlu2idgUKXB6grsiArph3IlTdT9ND6YThL9HU=
X-Gm-Gg: AYBFou0Re+/tgs2/fFYRix2nRE/Tfpec7YeBAeKUKI9MZyollQCGxVCVemMRb4R4wDT
	OooC1XNE0L2QlJrdf/5k42SV/ix5ZoJrwO+TkfxnMTT8MQsbAxNx5SX45eX97LoPFqbJhg+YlY4
	9zkcOTPxP7W7VttLaHRalpNgTIjre4BDLccsPHUEWUIUbuAxnGEc3pi+5JZz4RG4adwZYgGaOL2
	BxRGeRnciemIxMP7Q2fJVcGxxhvXJV314MJgpFyl2C1NV9c5PhWCWBhrqmnqvLTzzqwBdwFPVq2
	R6GsJKCCGxRJWFBjWx/BQUd1qzK1hUiePKLBTPH+69KOYd00BpfdjGrfHLEzsof7SQrWxsDYX1O
	cQRH7TsiyLdskypnDdmRj/a61H97qVCnlB8LmfuMJDtRlMQjqpBBQydA6muRFJA==
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr1793780685a.28.1793633703554;
        Mon, 02 Nov 2026 07:35:03 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr1793774085a.28.1793633702987;
        Mon, 02 Nov 2026 07:35:02 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm525422535e9.15.2026.11.02.07.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:35:02 -0800 (PST)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: =?utf-8?q?Lukas_M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 15:34:51 +0000
Message-Id: <179363369156.2770975.5059354905602709812.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=jj5ynubULAVAu/vUXiY2INwFxg640o1bS1NRlUG6T9s=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBq6K2eQZLbsRd/JAokYaR4x2+9Z9XOiqMr4YVdz
 ovfRMitxWaJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCauitngAKCRBjTcTwaHBG
 +CvTEACbcal7iXqqAofGdmicRl2cJsLK+DwAYyJow3/HSJbdlFA5va1OP8Ytf8bRLS1iUgaA16K
 AV1gWuLCzZjrMgJLrJNZOIyqcQcBx8xzEk/NeDMJMrK2WCbPdqZbvRlsEVJZLXkOivRE670I4wR
 cB72Sui33FEaKL41osPIb6482bCZhcw2RgaueKTgNFrXt9iQpAwyTt+FZ6utm/pkV83hdGQ3jdp
 NxK4UXwGPWFmoYBTmehR1ICIlPquCQ4Vrf6kp2fnqXnkxOaWdgO8X1eXigKat1DdBTxf0klkZJP
 o9DCmF5/qH9o2hN4GDU8eQeTYofKETV5nkD+Nv2XZJhqyddmYQMfRhIIdBMNwVUhQjIqSftiC4A
 vDTTusS/S8yrceGbKn7UeF/9xo9Xtdy2xKihi7CndzcgnGDhn53biVW/XWeHvMiYerEG8tGSZcx
 Tcm/orwCRDWVmy6ZnbQzZ6ah2oejzYc6lTPlG7JveAQUCTT/LQrMv9lnWkj7RpdA+Fl1JfJXumC
 hhSgIqIn0KU1+oZekx1BRdQSXI0lYcH+1a11tJMf4REGPWhB03Bt7RMD1FvZWCwgegz+3sTgyfF
 8uZZDJ+qH/YmTmwgHJR9As7GzYMwpc9+DNNVi2j23Qui5gpQgsSw4V0qOxJSebMRzYIpabpb6Pn
 0Bcg1Rn91uBQR0Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8ada8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HiTqMD5rzcJ12mVflysA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX+gd04rqf7xAa
 SPdnHOmYA3yxlLHWBCpZvQZg2am3dfWkOh2rABZzEbp2NprOjPSpJhphL1Wtp+doh53LDHkqu9E
 g7t3C5Dwl596GnX0+33hM4W5kwpGp1qz4x26Pr5vqh3BLJSm7nuKnB6Tw4slc8GDTvGUw+EmSI6
 r478tiVACjRE1cFwVCx60mxUwTv8qi/fknxJUjWu0YjLk0oNtfarAbbf5JXq04/K/ty/Sd5zULX
 y0RP29GYhE1z3lxvD59pxna65hanx6ygriUGayNN41BCGV+cF6TagJMfuLFP5qT1JrGkLChV/pK
 0jdoVHbpFs7BXTXCH1KLREE7g81xcGEDi8sx1KnV6QpKodrCzzlcxOblYnI1UccUD4uCSxV/9GG
 zut4IBUaqTnoSeIWg2AIwjSc1rP2NJ4w9IrqJTLhCF1V6NrspmQWqe4I5NRBBojHgKtzOhL23O6
 /HjSDDV2z2qpKPSsUvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX3RX+y+b7IloD
 3krynYpNctIvTqhbG9zIKEZqpLzwng7I9ioISo3duTawP2ueLYH3L8VOLNkQbhxKLTWhA+aFqaq
 yzmLSLmDTwETrF62bkBTAx4InPhc2BI=
X-Proofpoint-ORIG-GUID: m7TI2Tbxuk3JaaAg5Jq5JN83qwH8tIV4
X-Proofpoint-GUID: m7TI2Tbxuk3JaaAg5Jq5JN83qwH8tIV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020062

On Mon, 02 Nov 2026 15:28:12 +0100, Lukas Märdian <lukas.maerdian@oss.qualcomm.com> wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

