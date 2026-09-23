Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A570C3A75B8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181806; cv=none; b=tZFzWYF6l/KNoJWHxcEhXnCVzpflkK3iy2yFiaKk3ccfPiwsiy/bQIfCM4xHEdnlRTrVxkdyilm4ecniE6kkTDGzBmht6vH0TFAcVENVhnp6pEiimJ3JCGOz6dMieqBOeW/qlG2/1KOUUlbdjHH+CL3nQ+PXyfAN7EStnAvEJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181806; c=relaxed/simple;
	bh=D+5gp0eInBkAIcw/P4QhEFD3OcUSw+rc5EmHyXQaC4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=himCeUHLLBePeQ/ap1glYjyDh5K+gDe2xxGy0tuN+21rUKsz+ZyEzEJMVi0CzqRTF+IH7JsX6rG+IhqNalaCXQKJgDX7eaS+xZCv4MOIP5hWo5XMUHTkCEh1SgtYnuMAZuE6tlLFDfekKSGoowrkKHU7OwujFVBl6yp3eFHYcOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hA3I+ydr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQDULikY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hA3I+ydr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQDULikY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTkrn217802
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=; b=hA3I+ydrYlOFql4X
	JxWFom9ApvGFxIhW4iJAVmHcOlr4cRb3xmzkr+vaEQCjobOzbQgcXZIJw5QXx6mA
	HRgAb8OtcT9QYxPnXB/uSwR5OYu+A90dBDS4mxKJe5utoT0RLlSQK+2zTV2NPzKH
	7yhsmARmBg8enrgp25pv444D9bfSod249/l04RP7LOyFpv5leqIqnDign7vVxOIH
	GBPFdJ4bCbOnKPh9FTNSFNHNUQb6cbePrxD+69dggHrzrKIxMH/5voHOvWOcJlYF
	uO9EbOPPdi8bwl/t/Tqz9m13OePvNio0dtFsXosSlWU/0JfzW8kurZFj+jXCuggC
	ue/a6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb61g8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:43:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so1069594a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181795; x=1790786595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=;
        b=TQDULikYyJoyHmlJI+tqeHSJplHOR8rOf986+VSSMHXylp9vldBHkkjLazjs1Ps8mU
         6H2V5frgQIFMz7vSsKTIkaPpHKVUn0WuDk9WuJGjgGv0cCVmUs3CYc8gVI8Zx+fbGOp3
         bD0UIwTjISQzGSDXwMzUXTY+IaAcYkGEcAOuntyLknIrb6B0uryArwX0gQ6Qx9PQJ67A
         5VReq5tJ2noXHy9/KjO6tSw3V+vC7KcrAoCtuN7hCWGWxXtSFl/6EJ8ZgaIf51ojdj+H
         UiZXKoIJSE0EEc1mLrSSG2+wv+Wdcbo0e0LM6jYtlkv8jwVaLvzQBSADk2xDWG9fCCxM
         4Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181795; x=1790786595;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoU2sou/2NEY59DVI3hWXvNKjx2hz4p0U4PpxsOoZ3U=;
        b=ZtHD6eK6Kqt2w7/gwWzJuJ8VR3xxwgOA0UScc1Sg8PuNDhg6uWSvAMW50QbYcKTG/G
         krgS1+Ww751kRKKixNSUxfZCzkRuI6cj2hRKAU6WQrFUWc9thD7Mly13xWJN6tSs0IZ1
         Ml6bfWIWUpvycic3Ca1slFn7JmFq6oe2aqV/bIe/zkoUmrC8fHfVCZ52OhaFsmGaiFTB
         k9i4WdvuPm8ibYTla/llIKqNghvOlApaKk5JqyUfcliId7wSsYAqBbaJscOGL2CsoOPJ
         XGqVkP87gtehdPOFa+H9/ImF58CEAFRPXpT4OFAADNG+Fj03ysmIX6mqDErXikjBaq4J
         43Kw==
X-Forwarded-Encrypted: i=1; AKwUvBy+kQjH0qkAkbvKEdAtHINTmCv+0iXbjjm39UZMjOdTB8+t939LLrBkczp2ZKAFFr0lzUXH63DGXt3STPw=@vger.kernel.org
X-Gm-Message-State: AFuF++l4Rsu8tSek5AH1ftTDFdk+VB4JH3WgEMuZjvGXB0hz9KnRgixL
	EEM16Dx9uXNJcKZQnUqem3qs78yCaOU6Nuw17BuRjNbliWBgV4/PbDsUWe4UVWf9scuBCxwiq5S
	nirRvm4qsulPAuEaZ4qA8L9FqVEpwvQwOSj26FyVCGcAkT1mDTI9XQZOlb/T/zblZBaA=
X-Gm-Gg: AYBFou1mF1kYAHiBeMSbCIrKSPw8pHPmRAO4kmLh/O6Oh2ZzPh02HiQeXGx2j7BvzMY
	MPRSdW1+XTt6m3u+ZNVFyGt4npapeia/suVtXNhsyjI0j5kZVc6gdhQSeNEWJdgKk1askAa6Pme
	82354RWasgtgoFDJ8ayiYbQBT/zCuiO+MYN6uHUTy3imGNSndIuq0noRPv2i1I4A3D70xHKiNwn
	AwyNjb2/Zqk4RUm54j/5e3ay3L6b13Es6jOWPbu3U2NXLEj9S0Q7pY1MvxkrZx/z2tk5I66ArKx
	UoKWSjOjYSfeeJ4ny5oeFbNsGwWfKz1xl4WA1atHuJAEYxM4jMfj6ufeLpRkUKdLK6lc3KszCj3
	oJ2MFM/TETum9krKIy32KgV6EOAsyph+cqf3QptYd5RN0PcEtyDmoiw==
X-Received: by 2002:a17:90b:3c11:b0:3a0:7d5b:8d55 with SMTP id 98e67ed59e1d1-3a07e4e41acmr2957148a91.8.1790181794885;
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c11:b0:3a0:7d5b:8d55 with SMTP id 98e67ed59e1d1-3a07e4e41acmr2957115a91.8.1790181794393;
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a082a0edaesm2135555a91.1.2026.09.23.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:43:14 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:43:10 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton
 <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo
 Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
        Steven
 Price <steven.price@arm.com>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Sudeep Holla
 <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260923094310.00001d5a@oss.qualcomm.com>
In-Reply-To: <20260915114601.GQ3968357@nvidia.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-2-aneesh.kumar@kernel.org>
	<20260914133249.00007d35@oss.qualcomm.com>
	<20260914222836.GO3968357@nvidia.com>
	<yq5ao6dy27jt.fsf@kernel.org>
	<20260915114601.GQ3968357@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8CdfQr3lV9kuv1BI05mh3_4_o1l-uuhN
X-Proofpoint-ORIG-GUID: 8CdfQr3lV9kuv1BI05mh3_4_o1l-uuhN
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab401a3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=xhGKRIyCQN_Pw0lyfhkA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX4p7pCB9bX4/F
 dcwNDKeyD/AmTMbReKG/7OcX0ZttFMCWUJr85Z6LvD/lI8X0p+33qxBdD+7uJFMyBM/wgAXSNL9
 3gteoFszLsRfD3pF+3nw5PK8Qq2R3T0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX1fxJ4dXTWCAP
 IgkRXWKUB/uh9Y+rWQ8DwnTQAjM6uRoERhWRz1wfjZGP0ifdiBqYxKupoxkeYInkXVcuIHFV60F
 /m/834/wavuKWf2yTpBSjYEgX2zI1OIIpmM0Q2Kx/hZ0FpLwKpiOsEoHDODIBcIRq0IGnUytZvC
 Ne4Ah/zEOjkYL38FL/S8tz6km/XS9BkpcfADXMg3/MIrW72gb7BkbZulTTEEb/r+8vEEjJgjkAl
 5ANzEH1oZ8G8b3q9xa99c2fNsQqimhcoaAL1gQOU9KlJPYISWAnLURIS6OXTeoJksiUgVt5my78
 60gTANAjKUav8X3VJXRz7QR/ILk/BC1KhdKlIBM3TYwqA8ziBZh7ZDVaIVW435hHD7HBY7YEdkY
 i0i89NgTX60te82j9bQT6EJqXsPxh7ZtUDOI7gDazZ10ghwBrlDPLBK7DlkGIdpKWUutNGR/70c
 r9SJVaUR3HtGzjsi45Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On Tue, 15 Sep 2026 08:46:01 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 15, 2026 at 02:52:14PM +0530, Aneesh Kumar K.V wrote:
> 
> > > Yes, but as written it is OK, and this is a common pattern in the
> > > kernel. I agree it is fragile tricky..
> > >
> > > Still it isn't an urgent reason to change it around, but the best
> > > pattern is to put the allocate, dev.release=, and device_initialize()
> > > in one 'alloc' function. Then the other function calls it and always
> > > unwinds with put_device. Use device_add().
> > >
> > > This avoids mixing the different kfree/put_device error unwind regimes
> > > into the same function..
> > >  
> > 
> > Something like  
> 
> Yeah, this is the safest way I know to use these interfaces
> 
Agreed.

> Jason

