Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463A46C829
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841340; cv=none; b=WjBsu36oZXdOk/menZQ5DWMnag267hmL/A2q9FzNjOIrCjsbcCHr95JeNOvYwLg1BKadAZBIKqgZRCA5a98FdlSUrXomxvgc2WDhwGMXDz3I9fRA3k19lFQ7gzNrPSOZvaSCagKms/auUxW8KmpBeNNS+jYjmUkIs3QJhjaKgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841340; c=relaxed/simple;
	bh=YVogohUxhXYW+qro4eW5iR1NlUCYy5vSLjvkomWHDaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieFAAv2UvfqbB/mi9T9CEYxsrE73MJx6XZYbb86+7WZQSXdfXjORMgmtAHzJ/EUbpmXClot23UJUwqyU/Hkh2UlT4c+mojGI8w5ZO7DN8vaZ0uv/xPFO83NIdqBj4wg+1EfwkusgSDy0F/Wpx52y/6pbp7kHw/Ym8KZfsuOdBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SykoalYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bC4O7o+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SykoalYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bC4O7o+4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RE7R063630657
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cfkQPAK61rdM9CVGwbTeSOvH
	+QMdclpOh9TVNimhDYY=; b=SykoalYuWSS+3VTkMeSCeJe2+7W2Q0+HK+T5gi2k
	L8j0XebgvrJ6Zd8Umjq8EcPQHPmCDDKIAHdBEEcJHHEg5KmHyfaLbBs9EXl4bH6F
	AQ09EFxbhgvu6irrED5gFxYH8Gq1suXAIQ3GtIuSRhiNpGOHF4YKOr7+1nhT4sb8
	orXEfJ3i3d3PE0qbpSm55V1Nf/fnS2isx0+sYrnA79H/Bw+TClofPmzfThW5zDFf
	moYiRW/N0sehO/U201HY6Jii7rhYxgmqCgs0qR7tHt7sY13pQDnXoRCdHtylVH+c
	t75MWuzrWnoXNliPSA0tW0QOt0+ecv2pYXuxQFZU1SfUoA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7rqmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:35:35 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d7ffab1so2081352b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787841334; x=1788446134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cfkQPAK61rdM9CVGwbTeSOvH+QMdclpOh9TVNimhDYY=;
        b=bC4O7o+4byy+ZU5TB5pehHCKFvqq16GlGiglWzuhAGLS5VnbkzQqp96c+3SZR8pL0a
         pYxqCltF7Mm3iL5z7SfX76rCR9oxnRld7eikd4/ljMaNLbdU3a5jF1NrrsEVkFNRnRNI
         1G//ZgwAj/SzKihEZQ5GmflaiZNCvKuoppOPrlo483zaz+R3vFvcDMrk4L/9grf8B+eF
         YVxtcEfVIN58sl6OPWSU3YcUW8Ym828x7JJoKYhSmDljKd25OFgOAKJCoLrYKcUGwtEu
         B8XTh6WmnNR9j8KqcmJtMGwtK3ozcIAcN/frpJqsoCDvKQGEtwp3qc7cAcHhLpR8pNDI
         ae+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787841334; x=1788446134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfkQPAK61rdM9CVGwbTeSOvH+QMdclpOh9TVNimhDYY=;
        b=IMHBMyHiP5C7bG5b4uxFqdw83EbutbOBT+tR/3i2Sks/6xUivoy1j0KnFXPTpQFsOC
         HfsGE2G4a0G7JHasw7rti0/vjgwT4h0uSMN6Onitw6bq90xdt5j8z70C75LX/ZvRfYVo
         z5bLM+4+UjXcoOH6m4Nt7BnZk9eiXai2jUYnnWCODmz5LCJb3EWaiY3f1Ez2egaz26MI
         jZOrXsdl5rosAYCYPTnP0IgMVbXRnWhhlvemOki98LVYOU5iRtfjtl7gdsqdKfk2pQsH
         +2BeFG8Jb7NlA766FDlkacmaytuaY8nskgk5w19Qqhr8Tupud2UNnGV4svCQjOUQogDk
         T0yg==
X-Forwarded-Encrypted: i=1; AHgh+RrHmI3itQGvdb8O/ufCvW6oZqYyPuDg9PSxMGTzHZvZeZJU//ia1bwDEVGT4F169FRMBWFpjDYe3vsfuPo=@vger.kernel.org
X-Gm-Message-State: AFuF++naKB5BqcGeKfC88r0I/K3C1TynuMEydk+0h3XEFz7+idGLkhG9
	ahTUY10U4vJFOADaEhUY2TGggwAUwRt+j5VskMxxTL/3curpBo2b1B0HYuJiDdVngRc1qHJoO1H
	AtacoUr69WS/l4HKbAdw5um1sGAeRL3WD2275F3f3iLtsVuRnTZy9cUNRwceR3QCOHsE=
X-Gm-Gg: AR+sD11BKJLeEBaZUFhnFj8c6GRFo6aMryLBtrDpoGLBSLaK4okGB2/5YMecBs3roB1
	JpQuNMDuwokwXWk1lbP/tSQVqaOa0muMGTENTgRfLv2Jue8lUacaSz1dasaLWME00Fj2Qrn+YIj
	Wjtqbam2/4mDppkL7xyrYeKWR1DIICxJkObk+rTc+tXglTTram/H8pHp/68kwtjCPN3Q+ia5tuS
	CDiKmPkDb3G7y8FbwHKH8loSC0iUBp7obYg0wSqmDRaaHXjJkCW1mngXmUja060VTV/4YiJ+OJF
	nxvimgmHtNxdqaTfWXcZ66HLtU4y5/GGHEAQkSluWLcZrxcw0G9K6Pzky47gfGlFqzs2zY2s4Tu
	s6zT1DSAPqHjEhVHoceH5XJKLvyOVI1YUYYdr3pKJMVc=
X-Received: by 2002:a05:6808:c173:b0:492:c9a4:2104 with SMTP id 5614622812f47-4b37c999474mr5860671b6e.10.1787841334629;
        Thu, 27 Aug 2026 07:35:34 -0700 (PDT)
X-Received: by 2002:a05:6808:c173:b0:492:c9a4:2104 with SMTP id 5614622812f47-4b37c999474mr5860621b6e.10.1787841334243;
        Thu, 27 Aug 2026 07:35:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38cc3e4fcsm786416b6e.15.2026.08.27.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:35:33 -0700 (PDT)
Date: Thu, 27 Aug 2026 22:35:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Vinod Koul <vkoul@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/qcom/spmi-mbg-tm: Import IIO_CONSUMER
 namespace
Message-ID: <apBLL4x0h2kUaz-n@QCOM-aGQu4IUr3Y>
References: <20260827103555.883018-1-shengchao.guo@oss.qualcomm.com>
 <apAzGkXpnMYHcnqJ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apAzGkXpnMYHcnqJ@ashevche-desk.local>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEyMiBTYWx0ZWRfX9PrpTiXWjuyT
 rq1DcV+Lczie6Ui97E6tdUnn832C97jYka1Xrqqgi0r3bYLQqu+N8eQtqc2ecTyPCgAMmcHrETN
 FLsozFaWubV1r8bnTgpJ5RQVZr3RYtf41dLb8ESSDBjzEVpYOLM+bBj2KTpAc3DsEXulW7L+Twr
 Q2bWIFbn2or2VefREz5XvqluJ0eETCy+IwRfJUcQcwCIamUgdo/EwgRQ5PoZ8sMNRDhyThil7PH
 PePvoKO1h/Mdan0P8e3q32GFw3cS3h9fH36oEYUaS66y34ukpdsv/gxDYrfaxhCtmBbXtePrJIb
 8S3SGcfkGhrT8duwvv3p/6WsWnpyORdQX1GWpOLKQPXYFIlulLkWfRre7oNoF0xTvL5YkXHK/YB
 5j5ne4GHvn5NhwkzOuYPhzPdhOctN6L6m+ThV7sVQYPWtn1rTQe+mK46xDk+q0dpFApbrGBrQ7z
 tdSPPiUgComme+pzLCw==
X-Proofpoint-GUID: Wli_5lbQDEgqomf6IdlU-jZA6JjN5z3Y
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a904b37 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EsJU3W8_Wz0UbiPOGlkA:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: Wli_5lbQDEgqomf6IdlU-jZA6JjN5z3Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEyMiBTYWx0ZWRfX39cPV9nVQoko
 snqCl9xQkOQw7WQOYnRwCAi67+HMBpUDrTBptE6Z4wYKuMkSN3aGP035lkrrgrdZzgSW7XWm5jg
 stVxkyrt7UjkVp85LbaLuh5fhtToqgU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270122

On Thu, Aug 27, 2026 at 03:52:42PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 27, 2026 at 06:35:55PM +0800, Shawn Guo wrote:
> > The IIO consumer interface symbols moved into the IIO_CONSUMER namespace,
> > so consumers must import it explicitly.  Without it modpost fails on
> 
> > 'iio_read_channel_processed' and 'devm_iio_channel_get':
> 
> iio_read_channel_processed()
> devm_iio_channel_get()

Sure, will update.

> 
> >   ERROR: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses
> >   symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but
> >   does not import it.
> 
> > Fixes: ebf1d03dab96 ("iio: inkern: Use namespaced exports")
> 
> Shouldn't this be backported to stable kernels?

The offending commit just landed on mainline during this merge window.
So there is no stable kernels concerned by this.

> 
> ...
> 
> Code wise looks good.

Thank you for the review!

Shawn
