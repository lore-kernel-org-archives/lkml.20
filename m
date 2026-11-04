Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781763;
	b=JF7CqVfzxoBwDJkOL9ShAN7w9Om/u2EXpUrfeKM7qwEnimpcx3WVrkXHv2b0BJSkMa/T
	 /kYsnk/P5Wpda4DSlDfJRNRs29/S+iJT87TrDHgwhWCnfE5PDjUH+uj/7uFtZaFmzbR+T
	 plYwca3dStegZA65m7Gr2RyImvkNTGwRz+Z/G/uI+2tBGiwL/efe1FfsWWueZGroWkQjj
	 TNfgNzdek2X/4649Ew2xC/Nngu8AYR61j+w1RiiLR5YjBDImFthqKDjIVjXtwXLGDMQJw
	 mzn1LaB4B+JRStf9Ye7al7SvBZ3EDQcTIRcTpWtpcHzedLcW37h+usSTxiLzejbjrGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
	b=aoBX1NE4njEsjXuvjyXWNFAqGSVHZNGie5uCYLam3pTwnAG01fQMZN/4k7r3iEIidwKr
	 Atr/zTUvYlwDO+BTXJ+6qWXKPVP2olBw9LEzVwfY8hl5Xjo9XN+L5h/ni01Jp/EApgqwB
	 68VV9pTpYFdnOHp0ptza0c8JsuFyfabNw1AxPAR29NF8sPjbaUlnvg/UTttLYc/mcl5mV
	 t8TQlaDc+nBN96ag+3ScuYemEIAAS4lyebZfhAjVzxg0ZL0Ojdf2C9bh6SgOMk9qtQeSL
	 X1NQc24bChUd3AAyKkyYTM/RXSGC3Mvx32dnhgPgZVt66k8WwBww/QXEeDynU9Bxemg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQWXj3vO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er7oO4ag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD39606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD39606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQWXj3vO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er7oO4ag
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kfsn175208
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lw46wr8RFUM11VZcrvo7hsTL
	HohV5xgIubBnDb9dNrg=; b=SQWXj3vOGaHUs3E1t1LtdfjT+Y+Vht8IOWIFNZro
	jIpCRcWR8St+vS2G37ggadoOdAHaTjjRNmG8Yp0A5xXmtV2UGGAGSlQK/uPLJDJx
	jrbpNgKwG6MecFYB78dPvarClx9SRaE56QTarE/i2zsaV+ZIOed5Ctedc6V+5A3W
	Bsewwh0mQ0DAOkuptIhAPA+7YxpGKpM3qm32gTJytzNyLE93w9NVqXt+3uppsCmw
	grq2hm982V0Bjimen7U4QjogHUx6q5BsN+JekISDQx7mnl/IZhsEZP7rlHLOuhRm
	VwQVzaN6or/UwGVgKFNKFN7fQeFHgsHtpBXGhCnVS4h0Qg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbu39k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:42:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea381ce04fso6235275ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781761; x=1794386561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
        b=Er7oO4ag+ib81plkmsMXyJwxF76TMTKCmGDg1761CBbWdds4jxmNZKdzvy8czEaJzg
         hdPP/CPA0X5bBpkmtFfKWbrcoUV+PQBBuACnO+O2R4SnYWKQENWeOuG54fEIOc20oMPU
         e5ktAQfLVL7m9LohxI0aEGoefTnVfxxJBzvlN1qN4LIbyz1Z8Shuta15Fd2IUUb/HRtY
         kfQt8qT/Q0Io/J6kv3ICYG7YT0WRIng0RqyihkwbBXpeo6IXmBEIGN7E+Uet5ncVkG38
         9NgfIJk12NLo7U7nrLaAqA/CXExUPNucBdjumTcl8VtfPKHCcVrtqIzS23PYzWpVz04B
         SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781761; x=1794386561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
        b=tfqz/mFf/SGcnsqOZTLVfgZR0IXOSW2KJxBkBeMFPbTtco/p6euK6Tji3YrfaMLrB8
         R1BPGFe9BCh4wks38R6JwZXsA+mXzgm1E6l8HiYLumyxajAnrM8pJ50uaK2bx1S32xuz
         DfX53ktUz3zYWSXZ7aWV6KmEBiuKiA26f9ve3yLyl7S0KFQgG7viRmr6p0R1YOWZ7Pua
         uQGyIDsSYhfGMxz4XuexPhAYiSdXDj1arAGeEzvEsPrv7SciGGJjkMNl32zmg7UMu+Je
         IOILrudrY8MbqsBGvywgvjsOWmMlDCLBOkUDCdc+g/j5DeGvyw6PNLlfAGcdJsuPzyIe
         WBbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe9IS/qLQjJuTI0BR1Eph/a/Ahqn8g9RexYWSRLi+M5D9UAkS5hAO+8UjJUDhPtIe7d5y3IumJLWaSzQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vbkMJnm+GBVlHapsKemu8rjZy0h9/tjrU2zxyok6d5WGSpPOT
	csL6v8rq8Kc46vD595gnl/Tkf5PiuzzqcklHKFJJUNOF9sL8OpM89/mM3Tvu+5ufHhz3WuvVAEf
	0aTKQFVjA7qI2djTUv2+TArJPiUQ0F9eiJEu4IHmeFdwY6DfzSotOl8eLYhMtNlwrUjg=
X-Gm-Gg: AYBFou3YV0sU65t6MaJAM3OkK9drhdu5dC3RdtTI9bfHi30yMy8ayRrw3hy5q7uSx51
	iHeITT3DfQOvEwyV1zpz/sQ8upJahvz8eb8Mq8/4UjuRqZ3SE0xsTyRCorOU7trnsw0olcSWGkA
	SRLVIrW6V2FQCYfdZnviFKUpWa5g05GBCa+zbisWvjXoW9tKxfETZvm+8LDA0qGe65E7aUT0f7I
	iHF4B06eUg8bMU4zuyx/4VWPrfCZUPJXz9mEVPXUieTtqUKtHerdPvhVdExRJujvK/SDZzXWn5H
	NK70Y943vT6NueSLL8pXhLEJO5lPCCHZCr25Jxcr/at+7zZkodRKWkLDEjb02QeZZOzkKXYko4s
	CflSdLqCET99LSSBic2yOYmrPswIJ/vQRLQzYd6HKK5IW08Ii5zAF6zh36ryq2zcDcNYW10lNch
	xEL/9+HY9Bj7M6CQ==
X-Received: by 2002:a17:903:124a:b0:2ea:238c:4d04 with SMTP id d9443c01a7336-2eb364953c5mr105805685ad.12.1793781760767;
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
X-Received: by 2002:a17:903:124a:b0:2ea:238c:4d04 with SMTP id d9443c01a7336-2eb364953c5mr105805465ad.12.1793781760280;
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed183dcf6csm126245ad.38.2026.11.04.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
Date: Wed, 4 Nov 2026 16:42:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
X-Proofpoint-GUID: GVlAx78IHCDy57Fm7XTa2f6QfSVy6gA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXxEdPEONtm+tg
 3REatlCRTWYb6HHJBEaSPJT3JrOa25rhahtRmoShSI3TBp6x6o/nJ5iHQ+EjkVJtHCndKrKwGnD
 bkI5S/Hefn8y6oAcy4lXEdO1Uz0z+m1bodLas+RZGWy6CwcVjtZ/PJd7I0VI2bjcszWBcNHiE1H
 ys9itd/Nt9oKa4BcTSJ/APHjYnsp0TarIyn/oeD0RqimG9IhV4YXFllPrDuL1F3o7LAVf36P0eP
 qJpcFdGpcxApFv6tU65vJeS2+6G2DfyY9fJM7rOTvVbLBCS6VHd7it6OGc8mPqI1x6CyUAC0Fom
 x1mda8PkxbvAX8fYbYroktZ4mQoHRFltsPd2Q9vq/h4dkGqTOkcs7JOlFV2NeS9DJ4/ZLs7sEqc
 sxKZLS8sN/Bee6UpJxzTT4JCOLL2d4vx0mwloiVvCWdJMDZ5AjOUdtI9Mwv4h9M3po5ifKWOs4h
 rV2H6v8EiWa4MzDTAzw==
X-Proofpoint-ORIG-GUID: GVlAx78IHCDy57Fm7XTa2f6QfSVy6gA_
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaf001 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KAsKvIRJHMjLmqjOIagA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXxiSX7f6EmW+I
 csB33NaVYQv5yor5IkzOz/84F4+RmYZWQf/bl3/qzjDLBvCvJPDMAmANiH+g+8O4o62CH+cdQd9
 1UfSzYoWOvrBhZfo/F/kyl61aP+ggrc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034

On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
> On 11/4/26 8:59 AM, Shawn Guo wrote:
> > On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> >> On 11/1/26 9:04 AM, Shawn Guo wrote:
> >>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>
> >>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> >>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> >>> and DMA queues.
> >>>
> >>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +	phys = <&serdes0>;
> >>> +	phy-names = "serdes";
> >>
> >> I believe this holds for both GearVM and embedded, so you can move
> >> it to the common DTSI
> > 
> > No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> > server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> > PLL/RX/TX programming driven by an SCMI perf domain whose level is
> > the link speed.
> 
> Right, but I meant the assignment to the EMACs specifically

The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
variants. But the serdes nodes only exist in nord-embedded.dtsi, since
GearVM doesn't expose the PHY to Linux. Or am I missing your point
completely?

Shawn
