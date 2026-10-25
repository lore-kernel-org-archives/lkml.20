Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792909342;
	b=ec/ghT79bcToAamiqBy5lPxDbHNQBehDV9r+xEPdCvVWE6PKAPmLpSEmsj48MBWJT/sG
	 XsLUGEdks9WL+SB7OrUtumdDuWzK/BEAsLGKL0FZ+loqs7pbB6qZRHp73HKr0B2aGkbHs
	 T/uqVFw050TYsURn9/HpdWayWUUVYjho2rtXZnyBquqNQuKm3GrHxIjeRxrpfW1L4/3op
	 dWvdTN3+iv9KfNr9PrU8zK+lrcSXsq1TXL4snSnxiCsVecqwawLlnTqhTL+8+sZZ+k4zI
	 iuXlyRxQU2XEUOvfDjbp2vunONQD5kpdBHsoqqCKMP058K+QYM9PfYmzPxsOIrQ7puA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792909342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=GG2r8Tl22bjKCflCUtqfigNjXYsUIoAtpX9Mov/rpIc=;
	b=tOU+v1p7C5atENetpsX+tIfDNUtfqZSZIYmZR1HxHw14p4/s7zIJlpbmJNk1nuVqawV6
	 v75B/wy9BBOh08cWB+aPP7T8gUjUJPw1mVVukaadPOp6QSG074igI1hssSujQgzmd9hxz
	 dK7JQRE5dc1OMqj1gRcULmX3ILIp1iHSBVpzUFd9Gz0ylUm8OwrWmzDUscVXqSE7oXKNG
	 7SDA2iw1D+A6RmzgHF+pGJY+Lr8Ciz17MmJ5rjdGlfZEn5VLbux42PjSEouPWwwdJT7sn
	 wPCw5CyKDVNggSoNeiFGpthD9earWs7O3+WyDwbMFwQ0haqxubJwOxzOKb19Nv5gRhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fb.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=DhLWgGyV;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2E606A31A;
	Sun, 25 Oct 2026 06:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D2E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=DhLWgGyV
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4sRAZ2783225;
	Sat, 24 Oct 2026 23:21:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=GG2r8Tl22bjKCflCUtqfigNjXYsUIoAtpX9Mo
	v/rpIc=; b=DhLWgGyVgSN63RFfR8Q+fxtZESFnXLgYONOF8MVPsXABKRDe98kUM
	OtHuSo4VLzP5IFyZRirGARjkRR8kB0+oGg6SpkkY9PTswIgYIx4NLjryMjH5aioZ
	Mvd9vm0Lb/GwI/dhS7X872bRslmYKx+IV4PkVwD/eumzEGEhh9xnV65GZDWpqYtm
	7LaQjO25u4gw6zkFFJce20I1IigQcIAgfiGgHP/q1XwF3FAD9J66vXl9xw2ooHms
	Xf4F4x2ZAkShuCac8Ab7fg9djyrAYC4jBh/0sYJ1nNN389h/Ay4mpNTGAbZpbSBh
	HymF/EX2JI+Ox8FaBkPotUWP86YlODzVA==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgtc0uaef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:21:48 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:21:47 +0000
From: Amir Ayupov <aaupov@fb.com>
To: Leo Yan <leo.yan@arm.com>
CC: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy
 Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] coresight: syscfg: Match feature capabilities separately from device class
Date: Sat, 24 Oct 2026 23:21:38 -0700
Message-ID: <20261025062144.2322034-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261021143958.GH26205@e132581.arm.com>
References:
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
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNCBTYWx0ZWRfX5m9ejhggEp5I
 a6cVaZfyfNhnjqOLvrFNZBbL21ONVYyrk9nYbkY/RitXWGEXfi2Q7aO3iJe+9dz0B+TimTkUW1w
 aIEMFzPv61Kym9VxRQp/1l72664AD8FQtv1T2d8Rw2UVc+ktop/cYbae5nJZKS2mmQ7nE2+DGKr
 y+btj5S/gg4Dkam7Rsbv9aj3lfir8mIWAy27Sbw3dOJSZd/fwJtGek3dSKVzkAymliT0ujx/PZR
 EfTSmrCZVWT2mLrPUeK5Q4xKul8o1R8Zsz96UH89KMPZ8npZvgE3NgoVc/nFU0AqAt4bmXjCje8
 TUiNm9xDARJtrVo1UnQNBIvp6AmlqJktFfNYt9e+qHgClQdAF4YzRHO+o8ehNFcX2oyYjMxVZSh
 N/GYch2wKBaVtj4x/Lwhz7LUgn4eS6LuHL7yqO0/aHd5jEgcljstikeBPCp51l9yvGVhfF5IAP+
 GfF21jWklHyLG5c1oow==
X-Proofpoint-GUID: Z-Df9JaqLY1KMccEAuXJqFB1pvH8atD6
X-Proofpoint-ORIG-GUID: Z-Df9JaqLY1KMccEAuXJqFB1pvH8atD6
X-Authority-Analysis: v=2.4 cv=eIGGH3p1 c=1 sm=1 tr=0 ts=6add9ffc cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=PAz_-FQ8hEVmOPYdF0yf:22 a=NEAV23lmAAAA:8 a=7CQSdrXTAAAA:8
 a=XVXTpROMIXIvPH9SelYA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNCBTYWx0ZWRfX5l/tXf5MvNcj
 +QKgU3MzPfgfhJRvb1NQ4w00zCdbYkMy+ZGWWC5HDQv2dnPMagSejFIRnDO6+xuSEU705s5r0Gt
 8PR3n8DRNkNlgR8Lh4BwxsxIuscPcio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01

On Wed, 21 Oct 2026 15:39:58 +0100 Leo Yan <leo.yan@arm.com> wrote:

> On Mon, Oct 12, 2026 at 04:05:21PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -30,6 +30,12 @@
> >  #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
> >  #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> 
> It is good to introduce a marco:
> 
>   #define CS_CFG_MATCH_CLASS_MASK       GENMASK_U32(7, 0)
> 
> > +/*
> > + * flags defining device capabilities a feature can require. A feature loads on
> > + * a device that matches one of its classes and has all of its capabilities.
> > + */
> > +#define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> 
> To make the mask explicitly 32-bit unsigned:
> 
>   #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
> 
Thanks, will apply in v3.

> > +
> >  /* flags defining device instance matching - used in config match desc data. */
> >  #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> 
> Not an issue with this patch, but CS_CFG_MATCH_INST_ANY appears to be
> unused and could be removed in a separate cleanup patch.
> 
Will drop in a separate patch in v3.

> > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > index a816c22c87bc8..1545d64afec01 100644
> > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > @@ -172,7 +172,21 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
> >  }
> >  
> >  /* load one feature into one coresight device */
> > +/*
> > + * A feature matches a device that shares one of its class flags and has all of
> > + * the capability flags it requires.
> > + */
> > +static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
> > +{
> > +	u32 caps = feat_flags & CS_CFG_MATCH_CAP_MASK;
> > +
> > +	return (feat_flags & csdev_flags & ~CS_CFG_MATCH_CAP_MASK) &&
> > +	       (csdev_flags & caps) == caps;
> 
> For clearer comparison conditions:
> 
>        /* Class type must be matches */
>        if ((feat_flags & CS_CFG_MATCH_CLASS_MASK) !=
>            (csdev_flags & CS_CFG_MATCH_CLASS_MASK)
>            return false;
> 
>        /* No required capabilities miss from the device */
>        if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
>            return false;
> 
>        return true;
> 
> Thanks,
> Leo

Yes, that looks cleaner, thanks!

Sent using hkml (https://github.com/sjp38/hackermail)
