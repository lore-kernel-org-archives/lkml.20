Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B639028F5
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788060036; cv=none; b=i6ImGhG9CMeBS9F8cIGvdziUfObIHRdBPHIbr+ry3M7CYEo/KbciPnuE3vmaJofMPbb86CsSueajkn97iOuSzW82K1wJUDZEcVgYQpJozRyP8TJ7MfRdmAfQ3DibIUiJt6du3AoM4gmbB5ngArKkImQdsINR5Q9qlkAtAFegCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788060036; c=relaxed/simple;
	bh=mUhcbyGhe9VYjTu5yf5V0RK24RSrEpI5mljwXgFiKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+H1ecKbR+LkclU/LCaUv5YG74fbYFLQh4eRSzKrgY71mJYEGcTZ239p6zq6MkoPgrJ+FfTdonH2jf4CfTLDTptR20fRNCqlA/7McBbgP5TCoo34rKVYjetEYUMo2hu3yAS5ndYisdQmosI2R9Fb93od2qqtTGAVOA+3S1lZo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqG39670; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AO+Sdd6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqG39670";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AO+Sdd6Z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2RdwI3349669
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s5ImpFoqGpB7ovqcitI6S6iN
	CeyznJR7Lkheif6E/2g=; b=YqG39670VvvwFxJnztw8YFHW4CKSacsEVaaB94is
	nXBJvtDnN3PsgKUD9doIBfVlqc/YNJCMeyGf/15MLEzJSoRQuO7UATprpDi8LrZg
	v/lRGX/usM7L+j2rgjBGjiq6XXNd3z09FvLDisDqVxteyDWoev8K3Sc0v5TH2Sy+
	Dcrpdizpgj6PVMMG17XaqY5N9Vv9iyqQ0F4HzcZhd2R5ggMiRa6hZU8i8L250/cp
	pXSrcDy5AofLUkkeq0CEibeLJaRGJMXlW7eliAA4MayLE3ENGj12j682uDimQE9P
	g+1/pDVRXsmukCwitpKPAnL+8XQw29nJSntkpScLdlOjFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2a9gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:20:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso31965935ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788060033; x=1788664833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5ImpFoqGpB7ovqcitI6S6iNCeyznJR7Lkheif6E/2g=;
        b=AO+Sdd6Z1/93Nug0PpT7fpd37sI839KBGj/W1Uxy8Fhr3xDtB0Z0Owy4TtTe8iNCDV
         20E0gBjigu9ww47HiM8yzAJUG3kivVc5e1THZHvyTOMnWeb5hVMNJCgqvQw80rRtrUs4
         Q+F1NbLDn5Q4RWNx9S/eMb304JYugy+PnpX76oRwt+ObHtPAlvVN1qVUjHEKFTBxm1WY
         gKEV392xy6hBZ/GSyS7k0TTx7fq/yN4b3GApDWZfeU1Y2Q6BDveOX26NEBTI8joF3wQg
         Xlc3W4hQOhZo37NX7+id0QC9B+eb/dlabrVUkfUNmQffxyRRDuL8moprCcevZE2zQnAv
         G3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788060033; x=1788664833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5ImpFoqGpB7ovqcitI6S6iNCeyznJR7Lkheif6E/2g=;
        b=nwju6zZ/r83Ltc5Q/8A4h0+YV2LMVbkYDkLWR94FxVRWK01NONfvxVANVNo3XDuPod
         EBNU2kjVHnLYHMFkI+iO5iVe4tPYvQMa+U+A+VOAguW07UfBtQpUwGevwW3qlMIAKNgB
         ZYnCXgScg02NkkvivVaXQ9QEEPDYKqx0EqrXeh8NR+Wn/jYjwHxdK0dMbhSqUJcB/ZiW
         k4uodqSflq9zVc2OVJQUcTViutW+XrDr6Daa/yBQS7Qipw26naXwfz/rVc1IC9lpUkVh
         vW2LHw2JtdR9Fjmg8xETdzjZsIfXoqe7S3exzgogwN8hloE6uMiGunGnc/rFEYn8DDn5
         dLzw==
X-Forwarded-Encrypted: i=1; AHgh+RqCIis9fANsSu616v8ip69CcB2gfJ9zOLFVFWxExdkm3ZmVfp3eQvgl5N7AjexHJljhXnaRCzEkIuJC21M=@vger.kernel.org
X-Gm-Message-State: AFuF++k0zKZnzDy3d64ozD8cqarP7KoejvTDajug4tBkvELbOjf+WF9i
	O6ZXIGIVD0ORhNfHNSsjux6c19ckBA1kr+7cQaOCqtvPBbTRq8j+UnrSuopbuDbVDRUsC5qQ3Ug
	5icUwQnpAw8bbsI/wcpVDrRHDZhpMdG+fKb6IVCCOv0XdbfWh87Gcs5w6rQIMzWdSZA8=
X-Gm-Gg: AR+sD13CvKYO4sEqhK24zMRcioFwrG/xNEwH0V7rRwOHtGyxi5GItppvPoIK1IciwNt
	nIdDV7yhXgOIpVvqgfK7ZjVtSobNJ30WwqzxCVcCSwdh73QlwQha/C3dFwuWl1WOjKyZyhYFxBj
	NH843Ox8H/nBErRYcMNkImsn9Snx9V2Zp7+yZGVFqfrKu1Mk903x5Gf8PonatZoO/Wc2Xyjep1R
	IF8+if8bL8zWgGATlwaHLSGEQP9zBIfHEzdKSIixZFzZnpxNXBA3K0OYZdsi6QwZrkk2awZfth/
	5ObZ+mAeG/a2cHeuO4kPPAKXKveRlCRvwJCuSB9zzVXSjoPfFJfHV34HmR4ixPjXbnSn2Jsyepi
	heT+55GFnYojl7KM4ofSgoQ35iUEilndnt4ZYxSAHquM=
X-Received: by 2002:a17:903:1b63:b0:2d9:e83:4de with SMTP id d9443c01a7336-2d90e830846mr19916075ad.7.1788060032659;
        Sat, 29 Aug 2026 20:20:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b63:b0:2d9:e83:4de with SMTP id d9443c01a7336-2d90e830846mr19915465ad.7.1788060032156;
        Sat, 29 Aug 2026 20:20:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f80a0a5sm21627850eec.11.2026.08.29.20.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:20:31 -0700 (PDT)
Date: Sun, 30 Aug 2026 11:20:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs
 to NMXC rail
Message-ID: <apOhed4SxBZbAzjM@QCOM-aGQu4IUr3Y>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
 <20260828-comical-cautious-inchworm-d7d255@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-comical-cautious-inchworm-d7d255@quoll>
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a93a181 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WpazWQ_6EXOS4ck9U2YA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: MMKQstFhu7sv9ZWLkjROlcMzUtoZjQ2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAyNiBTYWx0ZWRfXxxZGC8hsf+Ob
 hZ91ATpbnN5ikaf9WBkXemc+d6NyoYygpwSSC9FYTz+issgnCnWCyKiz9Sn40dw5+GVOva4VVZw
 vXPn7WodcZtsmbQpKIuPLwWYWR5qmlAB0XfcH/c3WutTWbcBtHYNmWqKsiPDjPeKMG/CB6VSvKf
 q/sRL/4EM3Pb4EhEP+1/mYGUeudW5NZ0WZVx1RyeACb4W+oZXtfurtuABFb/+tDeaqjmpNb08Ae
 xkWQCeFEPcFvDRY2M3Gv2NTJ4sGR8tnBwfSTk6wCA/tMyH9JCFJJimGaPIxEpNRdkxHIDsjkbJ/
 a+68F5amV76etIQtXxtoDStSl2ZxSyd/a2ZWqY8VyeKiGLkEVIi/PfU1p7GK0/jbke8nL66O8KI
 thPpnSvqC4d0H8D+4p2SfbfXdm4tuT6w1OMKagKADSpD9aw2AKTtaRpQG4TfIIRNP4wSEm3i79L
 +wtoeb6sjdgp5YvKAvg==
X-Proofpoint-ORIG-GUID: MMKQstFhu7sv9ZWLkjROlcMzUtoZjQ2z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAyNiBTYWx0ZWRfX7bbFLpLDiUQc
 kX6bYDINPs5HjgKsqClU9E7/1HgYPbiX8mAu6EDgT3B5CxyUPJ+amLKW9f0asTCr4A9kV3hwYti
 eH8b4WAROeWKv7D7Gf8XWb4ibt9kkAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300026

On Fri, Aug 28, 2026 at 12:23:42PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 26, 2026 at 06:27:45PM +0800, Shawn Guo wrote:
> >    power-domain-names:
> >      minItems: 2
> > -    items:
> > -      - const: cx
> > -      - const: mx
> > -      - const: nsp
> > +    maxItems: 3
> >  
> >    reg:
> >      maxItems: 1
> > @@ -104,15 +98,25 @@ allOf:
> >      then:
> >        properties:
> >          power-domains:
> > -          maxItems: 2
> > +          items:
> > +            - description: CX power domain
> > +            - description: MX power domain
> >          power-domain-names:
> > -          maxItems: 2
> > +          items:
> > +            - const: cx
> > +            - const: mx
> >      else:
> >        properties:
> >          power-domains:
> > -          minItems: 3
> > +          items:
> > +            - description: CX power domain
> > +            - description: NMXC power domain
> > +            - description: NSP power domain
> >          power-domain-names:
> > -          minItems: 3
> > +          items:
> > +            - const: cx
> > +            - const: nmxc
> 
> That's the same domain from this device point of view, no? The names are
> not representing provider but consumer.

Yes, you are right! The v2[1] was sent to drop the remoteproc changes.

Shawn

[1] https://lore.kernel.org/all/20260826135454.658615-1-shengchao.guo@oss.qualcomm.com/
