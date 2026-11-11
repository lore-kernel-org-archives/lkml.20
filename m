Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411623;
	b=vqx4XH/tkXQRMjQExDDM5TucB9erXAqXZ6GpK/zxVcIGovp5YaQoNSO7HjcJBTwWnuPF
	 J5B9tEB9NG6qKs19gwpSQONDDJlE2SZEmXou1ssnrYxyLdEwm64cl2pSNMNg/qm7qm517
	 /anNUxqg3DaaxEIIrU0XbrifsPJiLbl7O3GtmRVt+7hWq+gHd1oYFp2+p6KrXzT1FpUkK
	 AIxLSlBNoayCRNje5H36v4HHThQaxxyayAA4wvHmP0EaQ1VLpU+e4e7EfxCRVj3PmLYye
	 TmyvPb2RggKUVCoaswO4b//XiaGUv0NG3Qp1+YDEqi192RVhRPGy+Xxon6Mda0Zhr2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
	b=zzHCEVFo1gCKTKZxLh7HNfat1N4ogA4noyFNVccggwMFT/3GucRdAEKSmrZfWiQ16bsu
	 xs/JsorD6Bjt5UUrhc/JlGAEghFZb2UGRucGziFDLuaJLcb7fnDjp6yuruA2EbtrMDfoe
	 s8oSBN9FjRAMoy1K/7QoZCP34oJUgYuLhKeq6xpevm9MOGKTrZ5qsiv11tGtYcxktFvIm
	 lhn9puucfQJaO93BTGIreclJevw+Rm8nGfQr359mtd3+F070vwbkkkHiHECxAeS84/psP
	 jwidDYiky4ohD6sbVjrQT+7kUQB+F4YnQMKZR9O06z5MmmXvwci8JeiUQ3rHCD+j6Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B260A2603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20B260A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0PPo1565807
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FA1mHnF+XhN
	6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=; b=cmpR6iEgItva8d+V7jBmgK1yi8y
	WvWKre2w6PsPgtBTgaWEfwSO0WB22pAYq2s2wXs3kZvVCkX5vyZPsceblbDezrtC
	Uo1bjE4le6s+Cs6UG2u91KzJlCIpbgksbaaxbI5aXWXljnEuGZK6dEQsNZalwD7x
	rZqqCj6g/0yiNTjNUYGDGBeEnYf9NV6FkQrFjqvgKxQgMbhCK+UoDcbknPyGL6MS
	ZELlk2uFR9s+0h3eXlEdSPpR0yjqQMFKrxyE4n782+dz4jPoPOCCGiLPzCiDWtF8
	S0ztZ9CHejo3GRM7n66kaQoMlStB5k0fSGcUOFal++DF0xbQzuqV4Bs5j3Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m0pna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc48fbca26so208104137.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411621; x=1795016421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=MFenZKQgsGUlx4zDEDXADzZBOjSh+qOulwQvtjrmv4ViEkiAO1p+20RCrlv8ybZywb
         3LpiZNkzvZhXmNPtKQ7b7lhlgbeQ/LAXawMF3keNqKYSVqoCNkhpUsxGUrZoZ7hfPnH3
         /I6smMb4IQkDh92FFNt1Ukvm53ocl9RyWDrCeIB77eB2g6wvt/W+BTrYjZPbMCiZXLWa
         xLvV66huARM+yv2Xa+pt+QXR6v8lZCxhvTh4JySqFDz1lc+qyuct9JMcIP4EwyFyGC7R
         MxyEgbdqzqoLyTxr/bfY9KEQMBb1NPXYN47bf0zIvzp5Qq1gtJPDgqTdAwLjgJo6hRbo
         xWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411621; x=1795016421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=sk17bshmXY+H2T16CeFTG7yBJcNLfq7TgQs4ANS3uXViTNnviClIexFzAWzIqz1fiZ
         Y35fWtJaHIav6N4BWrBk20Bzd26+z8nbRu5NLtdWdqaBOTS+pooNmtgQjfoS+ICNukZo
         GRrnCbCg1H+Tjphj4LykhSDZDi3Nt3oQJOgYsE50by9uVmVSEKTo28FSeB66gNHfwf7T
         PytrgZFUznRdBaNeBU1eW59eU9JMFXarbK+u0CoJsQCcaG5pNsksnLdsmDwVG86185x+
         623EfBHtqG94tWMVJ9Mxnn71+qrbSG1DtlDGkFPlFh5fatFltcE7YCCVDzy5/PPSM/rg
         u0HA==
X-Forwarded-Encrypted: i=1; AL+hErHKjsHO2ThVfH8RebtC7XWFvDtvvNfue6pz1t/j/angcEM7xZeCXlOa+6Z//Grukpwi9pkZ59WSFaGGKgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z97muot7j7kW7Jgrz0znyvE+gINyyDzU5TewlZkbhQp/PvHjkqs
	eTMtaSzflE4C3TfnGY20DyWovz3UZGSX9kNfNj2QYTJCfo93DNRLWXNyHaLMZdSPmxvBju5N5st
	01RF0F3OLAMmkCdTuOogIS06XE/DhpE+ipEviocMVdwo9HimhhW0WPdV6CzJl1ZQGpyo=
X-Gm-Gg: AYBFou39eVs5enXvWuUEgfUib2IWzs+jdIW2nqyJ4oLWvWlH9qc4S1VGezE4TaRaauB
	Bes1Ryc7Jk5oRzKyZCrd7d5/t/NZvc7oWa5BZIJGXP1v9eBEzcE0wv/a38PL/ig51xEyhkUxGHt
	7Daio/RBOfMeQfuicY7PZsGs1BzLYq8+Zwa7aFLI2kdH1wtp1RBUARfMjTsvtGM64bnX/Ug5Dhb
	p61XG8lfwvbv9kYvU+CrfLWITycs6GCQoBTRB/90nsYw9jDOj1vOKK/a40DJ2fKrbnuqEC/UF4/
	rmRmlgYqQfouVRyWXCm6gf4o5RM3GmqGGdagumuqe5F6hV5peTsu5Nd20JtKg2jc+ndTglcMw84
	U1l4qp97F11LK7MSDmlpOMWy93zUNQhVxJxz1F7vNgQjx/Adcprtlxy3srOQ=
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763518137.16.1794411621117;
        Wed, 11 Nov 2026 07:40:21 -0800 (PST)
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763500137.16.1794411620618;
        Wed, 11 Nov 2026 07:40:20 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fe41sm5288525e9.5.2026.11.11.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:19 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:18 +0200
Message-Id: <20261111154018.654669-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com> <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H7bMR4OF1wr7nKbjTzbucecKmkGtRaj6
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af48c65 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=AU935lpaGaaCzQUhO60A:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: H7bMR4OF1wr7nKbjTzbucecKmkGtRaj6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1PMb8ZtlEpJx
 aOxonzxrP0yce8UdkSaA9Ap7ytBlq0/paqKk9I8JN4t8F8Dc6m9VQQ3SVMSuEXtsaL0K0YvGlTb
 aKbXzJhDzlN+JIipRDdlcAYNFAF5PTUXgUO5SVg7nB8rXVGbhQ7ySHGdL3Zx6Ov2gBsnmsG/sZQ
 CECgQD8J1dQeIfbCYSFGK81lePY/5kmMZE75tBTUH0UB2KQGPpGBN+KPmXW1Y18AtJOl5y6hK+j
 gn40fse0IQRVfjqOm41TN27lPGEhdb7gh0EPFePN2oZRXEFu2vrssii71Am7HuXW98wtBJLUND4
 AMYcLkSVIto9/8EKC+jenz8/M6lTvyxyB5b3G6TALFg8CMBiW0DXTjD6OYeY9pFHTnTvCovI0bA
 tsgWbefdHLBts/1H255Gc1Cx3YE2KUDS27JF6rB6uejOGWL0ln4fdx7wC/+Np/lcs63R/5gIwif
 8X5C6DxsXkxeXpQxEeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX7U6s5I4pTV6c
 jW08PxBZ6vwjVnbash55bSsF7lB6CyPnaLcJXJqFt/nCsJVP68xRCFrZJ5gNgThT1zvIquPlyFC
 FQPRsMuq3OS54JfgJM9w6MnGssfNJdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:14:54PM +0200, Dmitry Baryshkov wrote:
> > +		jpeg_enc: jpeg-encoder@ac53000 {
> > +			compatible = "qcom,sm8250-jpeg-enc";
> > +			status = "disabled";
>
> Drop, there is no point in keeping it disabled. (And the status is
> expected to be the last property anyway).

Ok, I will enable it by default in the next version.

> > +			power-domains = <&camcc TITAN_TOP_GDSC>,
>
> TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
> separately. Instead cast the votes on TITAN and they will propagate to
> the MMCX rail.

Ok, I will drop mmcx and vote through TITAN_TOP_GDSC.

> > +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
>
> Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

Ok, I will use QCOM_ICC_TAG_ALWAYS.

--
Best regards,
Atanas
