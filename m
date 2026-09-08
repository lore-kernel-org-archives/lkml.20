Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB73909A6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852229; cv=none; b=SSAFedAEtVAp+r/zUcD3yqefCt3KtLRUJBZNUo1g9oxdeu/YesCCsVqZXStryha+9TI04AI53LVgu3JApTEFeOLhS4MA7cit2d/thpqINDRsIqcjT1X0XNMy8wEeoaGxXRcFiNdiEItivrN1gCwZOtaer7oBc0nTRrWuntRp1Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852229; c=relaxed/simple;
	bh=0Hn3nwFflocQDE1Vnf/oZsgxF4q4ZrlzvFiOG4Em9aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbHh05YiBn4QTuiQqR38E09P5Abrx744POyj7EZdSt0WPB+Pxio4LY3GMdemTXitQWjB8Uz8EzaPjHilO8sredq53gyQ+dq67dUgta76FAuhjU1o+N/Ifa0X9LHUjGJwXvy9dhRJHlXz8Zn8R+vypnu/Mgeacu7g9EVT+8zaA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAt3yW2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE9n50bc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAt3yW2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE9n50bc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M0Kj2979113
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=repPIlp7EV4oN5ph2gAva5Wf
	gIj/jHE07iTHvT9P2zQ=; b=gAt3yW2A0/zE7b8Wn5f82T+fA4l7lq4kudwqWMvC
	adw2vDQmfLzguOQnOKVRgc+CptAbjA4k3bbFiPYItE+pZhV3tS94rzo1j7VNqxGe
	nKuTI1hKNJHvvEJorFf+juJgYSsKNCg2esVmi85pvdYMESKGSnFFvyNAXAehz6Io
	pKPWCOG568TXw5QQVeg0hphYQiIa+cT+WkThGj2+0iWDQl4OmuDaLxJJ7Xn7AcNl
	SnThu0XD8uwvFpG9EhxkVHsnc8NlMOL0/Ce5f9PVcRbXx3AesZU9Whyh3flUAf2s
	h8sEJhvc65j1KhiURLf7A6luPK45cFDWb8MdKeXEy+0tHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbn4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:23:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso3752952a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852226; x=1789457026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=repPIlp7EV4oN5ph2gAva5WfgIj/jHE07iTHvT9P2zQ=;
        b=EE9n50bcw6o9gzcOVgt7yyHkY9bq6skq50Zobpd+BwqD9I3pGaO+Mp7fMRolx8GM4h
         OdQYlZS6TI2Wk1zo+JSHOn0uylTJTEFXG175stMRste4mLvkMOMHyySTL8lQKaszTaXe
         7qTlrLgNCVxZ9h2B2BHszoiNh3F+d9BI36c95spKZpBliCbQF6BoMulTEXZ+4gmJnIXl
         OOUvti0sz1DYR9eiIh8OsKjSHOI8oBNrar00mAzZuP823RTY/2ycBYG88cUBjO9KRfCG
         XOj8XBEjWtsDH8IhlOd0eg4XnlYMIqYr2qAeJVym4BbTnSokbq50DrRo7hqt5dg385cE
         +5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852226; x=1789457026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=repPIlp7EV4oN5ph2gAva5WfgIj/jHE07iTHvT9P2zQ=;
        b=N4iUm9TgDN4jxJb23evGh7Ing8z1zdcJVmsBBMT6rrD7H/KOpfbaEjcSLcygZEWIz2
         NwAadu4OslbbRGxCMGjn4AtdkhnmjQrm5djkshUuiqF4zAOql5jm38mG1llOC0QHYfWC
         vb1A4TXVSN5k7zbD658qCY+Rtv9c78Vz1eoqsdtaavKkGzIbziZOLxIQ2X2hBQ/+niX0
         NiGs1gBfkScsdTP9dnrjYUJFy88aml7c1oV6tMvUyF1tOjCdaerEcZyT2ZriFRCL1cbZ
         uq5g+g7ewKw7uvFyQaS11CxzJC0vvEO5y8FurJF4jZvFCI3qQXyXhZ2MOZJirjyI5ARi
         iXTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAW/iZ10tsK8ljYrsJS6HzKKr90TVuLcZ/kRCT2MX4NPZn83YBzMcmJVQO7fYURz6gfnbTwJMRLb8JZ1s=@vger.kernel.org
X-Gm-Message-State: AFuF++kB3Ev6CIsTYHxDJXkDYSxxc0iq8t4QgKmX1ukkwmvDmDpR4Mxe
	b+VwWW7Z1m6W83BLk44kXE+WvoCj2dxcHAY2kFDup93ASvb6H+NbJH1e5YEcjFw3lxZu7r5+wNg
	lCRu9E4nn4Ol3559RsfWXHXJ82zOz+OcO0KsPjZw1mVOj8Y1n2Ssu1e411Xv5vW7pu2M=
X-Gm-Gg: AYBFou3pBB9V1kKKJRqbecHgMUJ4n+V8rCspX7WIz7AyS9v5zUWN46UIDcw28NgGbPS
	Dev6Smys84B1kbS6wPZrt63qmRj5wwwmg/tYEYyyoVyOs6CGG17Q/C5aGJ5IbLbNS1mvGhI1EQR
	bPiC1iNH86el8oE4edimgGtxKZJnjYGqCRCMf+4XhOWXDR7K6YszYdYvIaSrcKdHqTpCCR9keBQ
	1TgbNk8wDgfFfYG2sgP6qYJKcgUcb68jYbfLqwZOK0u/tqRzvSGTP+TB1d/7O00yaDxWHyqgO8K
	I3Kv+VEsNMtIKNfA6jwUT1wHHaXPOZTmKuVlzX/DildZxrqdUnrftlEoW5dwdEhTzfldD4v3Af0
	Xx32yf+Spdy6nbQ==
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr38887932637.14.1788852226253;
        Tue, 08 Sep 2026 00:23:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr38887881637.14.1788852225783;
        Tue, 08 Sep 2026 00:23:45 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm35845902eec.24.2026.09.08.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:23:45 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:53:37 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX8M1gVni1lr7j
 dia3pR86vjWCQe0a082PRZ8qMG42O6x+iU60tSIicmxuFP0T3lh56CJe+gYcER5Mfn62H18qhFh
 fPedX6vXVoWU2B4Wcy+0c0IzwzX0s9g=
X-Proofpoint-GUID: vRRnMhZ5Lejwanso8-q_HakiIOfEUSki
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fb802 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=enzuNw960j4ePshAGDsA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: vRRnMhZ5Lejwanso8-q_HakiIOfEUSki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXyUuyuz698NeQ
 hGI33usTDbv+7YQFMxl81pyxluGnZkTe77Z0jE1FRaNrywp0kWjq/Ag7eL70Hkgku46CkIsMX8p
 jvncqodYyCz5OLHtmtYGaF/QO1g7PImtZlwBjOxQSseury1cCI0F0sBrtfBsN4yHk2Q8SWz66Bu
 ONKLE1OxNwx4lXuU4wiw4di9PXm52stP5jgMW9G5RnVgRIg7oM6HAm6b0iLGp+yzD6Q1aRUszZE
 pv+DeUI0DPvsg0I5s3UyoRFRimja0w2kfsu2I7eC9CfiX2Vt9xqey9t3EeAt2TZv7NsQCc0vHNh
 gBPuYlzK/BndC4UFYqw6iZYe7Du2Psk4a4DprIGBhWerEAUnsoRpGiAqMBTAGeRiYsTacPcUJef
 PCNSJSWDTfk5cOH2i1trs1xnWJX6aN8FDM6x7BvxKa2mIcdHmenk6afrJEybeswNP2A3o0COMBs
 Ae8edUrXGnrB+Wl02Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> > On Tue, Sep 08, 2026 at 08:56:39AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> >>> Hi,
> >>>
> >>> This preliminary series adds the DTS changes required to enable
> >>> Ethernet on the Qualcomm Shikra CQM, CQS, and IQS EVKs.
> >>
> >> What is "PRELIMINARY" patch in upstream? Where is this process
> >> documented or expressed?
> >>
> > 
> > My apologies. The code is ready, and I was hoping that sharing the DTS
> > changes would make reviewing the driver and dt-bindings a bit easier.
> > The original RFC had them together, and I split it out for net-next
> > and linux-next.
> 
> Yeah, but why calling it completely different than every other patchset?
> Why coming with different style? Why this cannot be RFC?

Agreed. In hindsight, this should probably have been an RFC v2. I saw
some recent series using a PRELIMINARY tag, but I see that its
ultimately just an RFC.

> 
> > 
> > The only reason I added a PRELIMINARY tag was because these DTS changes
> > should go in after the driver changes and dt-bindings.
> > 
> 
> DTS cannot go after the driver changes. If that is your requirement,
> then original work is broken and needs to be fixed.
> 

I should have worded it better. I am only worried about the dt-bindings
going in before this DTS. The driver changes just add support for
whatever we are desribing in this series, they can go in after
dt-bindings and DTS without any issues.

	Ayaan
