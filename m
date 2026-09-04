Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9FE48F83B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526159; cv=none; b=fmqkymP3CmqSIj0z+6evHAhjPfOT5mTtpGDBFiHPUR/MpqNnY2gMm/FdtPq8Rq1eGbslCjC2s3X8bCsvDTo4qcCv/eUFICYVLE4bljrpkwE8fDSFZtpsJ10xGz58AiAwX2zDbNY0Z74hbQleaM8ekD8rcj9cqU2WLkMwrA5UTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526159; c=relaxed/simple;
	bh=4uCD3FkDz9bxjcYN/3/lDqGUMS+biPLxmZeBLmbH+4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAd7Bn8w7ahbM6Qi8yOWqH7MgY+KdQOb1xtuIj2DOrHaHsLx8+rSBnQpa2d9Vb7rDl4Ff3qB/nKzXcuk2NxQ3Yfp2hfrKh3ZUZ1LLOn/q7sRfHMFsprhURF7utQ/TwFpoKsrEAOA1QzoSufOqS691eodpbMgPzHWCStaJyPvaWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZGf1kz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiGfavfh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZGf1kz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiGfavfh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AJHhZ2096800
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fjf9Eo3K1S5f5JYH1uUJ/g1
	AeGfbugPlbVkWxhv/j4=; b=NZGf1kz25U5vQm0g+IJstunRFvBBgR7BO+veqj7z
	OOKGIIkZT1WHFkumvsp+NqoUD5o292spTomk6KFO00l66BPoMKUAcXM2ux/NL2p0
	ClNRL/EF4ju3LH3PMYKTxdi6t8IQd5AObSIxK3bP8iN861cPQhuQaGuGLwt3hfhj
	0uP6S6v2CNdDm4pGtjggx4TB+yGjaLMAI70lcG0DHJvVC34d//QmmST2xZajFHeA
	0JCbelh4Ey82KnRhcVd0VRA+DBxUKdJBjbG1SnXzowbK7G4uGSlWzTcW27n++eFv
	Fb/N16jZG84r6wBLkrc2OVxU5W+WsZi2VvKb7cq9OPxmnQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqsm31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:49:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737d2f02d2fso736800137.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788526155; x=1789130955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=iiGfavfhxfz2eR31uRaYU40S+XkVD75Mb/fAWC19TauDBWnUKAW2r6jG25wENi7c1Q
         VIFDHHzvGKB3Mv/BEaKNZAcpJB9DygioxKqUSqthZZHtOKs7MOStoOF5dLIK9Gi+GCEb
         HSnoVT013oTbyriI62druSiNdzWSQGqL2I2W10kbjtf0LYtKoKwsM8rcA/GnnWtyHsM/
         S+fz4ykREw2d+4MsxNAQceVLkyotxPsjQOAub1Hsa9tkndtdkBHU5GBv0x/2IKErozVI
         sPmtGnrrAlBdafOp1Ysaegq8zP3tuagqabQ8itsn1kUMQKyFgXzq72sR/MWG5KfvZTto
         OTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526155; x=1789130955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=dT3Crix2WUFe8E7o/9/iVOH2H9IxRdzag6oKv/BH5e3iT4h+/oKZPGNxoO2vFu39P+
         Z0vIwFrJkFSsPsEPjrvBjEw9PZ+efnh33AOMWfHvTe2H1JPihdNdhjOKfaxh3GbwsSi/
         lHrU8l/0PtLdsektZck1J6tjWq4imkVF/DDRM2ry5fS3pVCa96smZfV5sYLSXb0H2q7F
         qwh4dSU4fmDfkXqPFD9nJPa0bYnNHP8W0zioMc/OwkUOeVaRCm5lcneRoCj56CuI3ld8
         O1lNgsP/X3G7i5GiUGD5rKiLc3oap2j05gyL/RkcepW1QTfy71aq+rCHALOMbpfVv1bl
         sB1w==
X-Gm-Message-State: AFuF++ky3KYw8tsWryTN3IZGFld1K/2cRMbj5yNadA/nfiN4ceTQe6B1
	7gufxN5erlNlsLj6OgqAVTFkWnXmTjiTaGy3xmuF7MdCo2W9MQLKyzmQAc2U8/onoPiRGdtdTrN
	dhJvFGNiqlxwtxGASd4M0B7KpkjZtbYHClu9ep1c/os2MksAc14R1i3SxS6EF/xl9fdU=
X-Gm-Gg: AYBFou27LkW0WVhElGfX7lqQ94kZC+3Yw33BuWAwp9t/X/tNYJMnAPVL17Ln7YzNgk2
	Y9GA7SJab3n057CAu48fMCCeBv8Qk7XEjcoNV1soE818hwV6Rhz0d4UihImyZuhYWz9zaCWRjpi
	kVGqgC326Wi1Wt0nc84nIvxdyxIriCWMoyTNEdjQkKUDl1JXjb9f4HdppCfcEykqK4frKY7/iAf
	W39fqUUgJkjvstdbocOk2yX96xrf4QTOZrviQvrsquuJzk9RRBRT8a64/MQC057OI1lbMhA+A+W
	A5G/xDNozevSvy8C8/Ew/VkV91732pNA5G+ycbFsr4kKieMRlu0MORSGg1yq4XxJK5Ny9eQmA63
	kbQ3oereeHD6s
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2019988137.12.1788526155166;
        Fri, 04 Sep 2026 05:49:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2019969137.12.1788526154671;
        Fri, 04 Sep 2026 05:49:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm135742595e9.0.2026.09.04.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:12 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:49:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        linux-amarula@amarulasolutions.com, Peng Fan <peng.fan@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <f33mv4dqb3gcapmh4e4kg6zcgbtmb5zjyh27q6v7cnuq3ajvai@vn5pkiyhkicp>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfX3Ac8BvBfEF6Q
 zO9liKVmCx3zgTxDrrG+vswe7ZXnuoT2UubcYgklcVuj7JMhULtUCK2n/wLxt8WyS64czhFQhob
 fADX7ajFFesbmw6Ycd+sGnyERINdEKs=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9abe4c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8AirrxEcAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=HkkWczMphfeU9HmRj9wA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=ST-jHhOKWsTCqRlWije3:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfX+dtMGvHrnITE
 bbu1UljBUtvWslh1tqkWoi7D5sZIxWtMrhW2hPj/0FiomUtyxqgiF8Ugox736M8Kje79tYxrzob
 sfSmdCLUbszCLOzF0PHWfS7F94lUA0wCzCBtwcZHgE9RJqg8AqAGSSGowyVtVa3rQ4J2NgtlfTV
 Me5hviQMx2yEVRAu0zy3B+WRk6spxSv9Ip8NBWpm+A9/NLa9CcC2UTTEKIDEpyW1htFiS/DCzFD
 tGh79esV7gfRjA+fw+e94dQLQ+i1hcFcDTsmS90oh5VctT3wfIZj04CNXZsLW2NQrDYU5Gs3e8y
 PEaZX3/N5ywGI2r3JiZf1nzHwztar14XZJTlh9guG1w6XNRIBaF6HPcUEe2kFyvhiA9hNbHtQ+C
 bEfwDbQ+BYltGHUVpNrGLylsnt5gFn4QRgxc9QVdBpGgPBmO3PrHv3atyo/s31dsdsRh+EusRW4
 dRDKX+JPzNj4BS16R3g==
X-Proofpoint-ORIG-GUID: V5S4zpDOFCqBiSqx64uWpm3SsumGeJ7e
X-Proofpoint-GUID: V5S4zpDOFCqBiSqx64uWpm3SsumGeJ7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040116

On 26-09-04 12:06:33, Dario Binacchi wrote:
> Add support for spread spectrum clock (SSC) generation to the pll14xx
> driver.
> 
> Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
