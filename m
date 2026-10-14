Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8339D3D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954215; cv=none; b=gH3S6U5oBWqjMN8XNGdtUgDgMX6A7vQQAdI0OP9vMRkbvyhsNR+vzRgJ0bBj6+kTjhohncYnTQINGYTpG1PgKjForYO5aSuW4UDc1BQ2apY6G7NoxyCSAfrJ8RpavC0YrueK9cySRvymFPz7pJqxfPI7VyD/BNX2sYjZNWR4rH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954215; c=relaxed/simple;
	bh=ubKoPgXQXHc3GSIxqcIQKnq/O/V4JDb7y8HEE+B3tyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su+fb4GsA9NrwUPEXcO2m7QViasrb/8moZWCXaW7tqrFDMAAYGm/3/W1iJvDsOAa8xjFQmwloGKLMwanGN4lkCgOL38F8XvKvzOVCkr4AY/R1/u0mjGnex1HtabD5iz0k90LtxUo1Za7PNeA286a3+F3rbWT/pr9EoKECFNpyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNcbzuvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9TF3+JL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNcbzuvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9TF3+JL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1odfT2333169
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1habXBoGNYXdPzU08zG+15Pf
	ctcDvaHUapAr9Iz9pzg=; b=oNcbzuvYciqX4x+PQnk8vhSnLik434800wZwzpxX
	DIi0oFu+vlyp+pGIhoIUDrF3XLXpifWO61MIQjOjlFUGzB4gX0V0Uwj/LrOJlJdy
	slpWgE+QdgfnwvyUmm5Kl6fIvljkHjzNnKe3sU4PGSHVj/oxh/9WznT+4anoIJEM
	cqXAv4+HiRdzt15HKvkQEMBbGM+pyFpRkpEcOKWEpe7y/rFTNXqvXpD4yRzTPYJV
	vyb5otPaUewzh3t5D3VmLcMv+V+oU8IONgK99n+eGsqGx2sDluNLJVzGCi2IqXIL
	JVqUxSDnV0z3g9OHJIUQDRZY7myuYPSuhTrR4fLvnrV4JA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s0hje02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:03:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2629070eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791954212; x=1792559012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1habXBoGNYXdPzU08zG+15PfctcDvaHUapAr9Iz9pzg=;
        b=Z9TF3+JLBNot+f11vIHn/whUrgC6WeP965g4i44DQ6YD+bpGYE2GUQFwt3DN9OQSEe
         mUpiXZ2YY/kSzKh6BCvX7uAmzYruAx4ViDEw6cuSmN15kAXUV5y4ckoPfNW9jMp4YI2e
         AA8tUUJULXIQHYpwOGT9cUAUChRknYnv0Ef+371NXevPk27s+y8ytsDfn5HMQYs8ORbh
         OAdS58cjnEhlkv/nC5RdkvU0c2bmt1gaAaPKBq+I0pfIiasAI7L2BZarohbwZ1xZ1iQ3
         aa/pTh71ONmN8rTsmo5dk+9cwdBueEFn7uQDdd3721njI38kdm6b5agJsuGUBAbTIyig
         3qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791954212; x=1792559012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1habXBoGNYXdPzU08zG+15PfctcDvaHUapAr9Iz9pzg=;
        b=ZNvu7RuQFiG7o7N7m65Yo05NY8f7YZKGHX0sgzMlEppac+PT5Sq/eWZ5g39KjrjxfZ
         zYEJqD3ruUbTSBflW/Pq1AWEKXN9rwpjXFR+P+aBiVZSc0VCwvm+P/JN7G8j+SJ8I1ss
         OK4l/Bj9FK+G/AphYOFey/ar8WqePZJHv9IVsgtVpcMRKQiwA1vYDsBVnTKBbVl5aoq1
         x1klYaY3LkOHl9VlyX8/KmuqACXUCBXDrISpxGqkLqqYOfkPkEuuwR9nfi/gluWbbutZ
         ys1sE34nzGwGo+uCu+rdAODhA7LpOLGaJLJKSSgYiv9Xz9YMUDgu8G+P7yOhLbhLqh1r
         OsxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1M0dTAOuAbjXJkW59A+3NMhbpz3MzaWF376mVZx10kvetZme4X89IEelQbVpn/yPHkUUqXpNyKKIHyl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF3A+fIzLVJhU9uHIsDV+isIx9p9vOFfd561a3QGBtGdYz1M2Q
	ufvQoHZcBT2iTBEpKTdT7qMeQhcURhi4hVyCJqKfMWPzND7sxb9GhMoWzTR4+QMFGxt5jtMYw4q
	TjO/DDrEW2xVxuw/QUvxqdn8bikAUlzTmPuFQuEVh8ZPlnKXecDLbxOMJO4NTZ3+tQ8g=
X-Gm-Gg: AYBFou2Ffo1Bu7fT03h5U6QV/peOVZbuuuXP/b+LnYS6ziHbMzfSMA9ZOCFiRgtUXCa
	U6NKsh2BD1gVY9P787M1e4LEzrDejxj5vOorJy2CrtR/gwGhjuulBeYZghLpqajBo3MnS9g6q6c
	la/4HkHzkZVP4vaJvYXycYgKSL2+fOnfEDm0duH+DTJbBNvErBv89bnGUdxJaQyR3CgMQcdNnmw
	xKIh5zauNgFrdJaO2Kx34+1/f+k9ZoGsDtkc3gGXpFpK7rL9mertEKCCCtKSRzxR7wiYw1TWwcI
	yHK/eBtGI3XWQR1K1DQwmwagSwuUJp1E3k3V/HWGxjlOrkaCjQRzFwEw0GHsqwpEMDeS1zS2/C/
	QOTNqfvnfzS8crEbf6DLFCCkE6ZgqenpV7ANv22w+9Z7wIFInsEAQKO+QTeF/2p/OiwH54U4aYt
	0UruT3HRuL8IQ1AO7xm2+McVGQsbdI
X-Received: by 2002:a05:693c:8215:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-35c85fa5c4fmr6092255eec.31.1791954211933;
        Tue, 13 Oct 2026 22:03:31 -0700 (PDT)
X-Received: by 2002:a05:693c:8215:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-35c85fa5c4fmr6092224eec.31.1791954211451;
        Tue, 13 Oct 2026 22:03:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm54827471eec.18.2026.10.13.22.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:03:30 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:33:24 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Message-ID: <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
 <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GL+dgeNK c=1 sm=1 tr=0 ts=6acf0d25 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q92GnTf-AHtPrQ-LojcA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 8y-s75_h8OQomz9uy7g8f1qEs6i3fVrW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOSBTYWx0ZWRfXxveUDY9uB7Rc
 dHcSTOfxBX13bwvF7FN8Gj7zH0yzOg5NPfHvzat1K0cLpw9oorgFNHTOQwPBcGRF/I4CUNlj2jW
 OvzFoIeR5WSfPXo4uVPRjUAzTHx9T+U=
X-Proofpoint-GUID: 8y-s75_h8OQomz9uy7g8f1qEs6i3fVrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOSBTYWx0ZWRfXw5W+CCvoNE/d
 c9tXexOlL9apnsaW0mkmLZMzRLXFyODJFGijHIhiqJAgjvbBabMlwYjUgNQxrhcaP3winw2U0AA
 JwzLLHk9+sfWC+5764elbJRJ8hwQZXJ87/jXc/YHixPjPsh0lFNwAoszknwq7m3jZEK0eRDWogJ
 XRVIkxY26JYwVp6hG4tYWIOFF+aHAa/Yj6tP17IZJxYIi7p3Z2vpufYDGM862PQ14QwuHMJs9Wo
 2BOX0QN+58NbsjBUpat/fdQxn8qgnKKciGo2UEdTS/PqcU8YFLZvSOOOWc+nkbnLEzkdCK08YTz
 57CZCimcvRuYsYrz9Up8t5tvXBohv3FR6FTznKSg28hFmjdWUR2Uqo41U3SL8KmVXv3Qivd5yJv
 xeI9xHk6JAEH04OlEzINZVPiOXi9bIS5pO62fhFU8qw1nDFsVQXgpJ4NQiZpnQ1SF4J3DqwtAjn
 Ve9P5paPjSFWtlktUPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140019

On Tue, Oct 13, 2026 at 04:43:36PM +0200, Konrad Dybcio wrote:
> On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> > Describe the SDHCI ICE register region and clock, and enable CQE support
> > for the IPQ5210 SDHCI controller.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > index d28d68a10958..c14b42c22616 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> > @@ -416,9 +416,11 @@ uart1: serial@1a84000 {
> >  		sdhc: mmc@7804000 {
> >  			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
> >  			reg = <0x0 0x07804000 0x0 0x1000>,
> > -			      <0x0 0x07805000 0x0 0x1000>;
> > +			      <0x0 0x07805000 0x0 0x1000>,
> > +			      <0x0 0x07808000 0x0 0x2000>;
> >  			reg-names = "hc",
> > -				    "cqhci";
> > +				    "cqhci",
> > +				    "ice";
>
> This should be a separate node, like on other SoCs to allow things
> like frequency scaling

Not sure I understand the comment correctly. I checked agatti, sdm630,
sdm670, sm6350, talos DT files and they have added the ICE region similar
to this.

Can you please suggest an example, will follow that.

Thanks
Varada
