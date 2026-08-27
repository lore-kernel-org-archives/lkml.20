Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB93F9F26
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820475; cv=none; b=YQ3WdcDTfqVAJuJlU3GfkekO1JrtiV0p18ICN+2ehC0K1/eZcOVlvJeujR/u8Jb/do8al8GJZUyFPUVsMtyxY86IA07gLFvw0Lb1423J+jv+qsonROe+sEwTMy0CupMR9YvIvmuuNyapuojlXt5golfdOsLtIbcjU66+Mg87sSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820475; c=relaxed/simple;
	bh=mA30AduXyStobxtBMt7yxuIZHtu4wfbxWYCgCHvxRKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL31W9QGNGTuWgzANucWLbAkGS7lzO4f2SL3Qba3DI/arMjZ1cUSmg9NqKtwCk+wPtTesc4VR6GhigkqH5znk17Fkr21rya14iDUGGLTamt7cWpm/xKFnSENYrQOThUuYtryGZt1PCke49b6w76UrunTfIQO6OMzKxoqUGYB/fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbGNhjXm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUYvsL4q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbGNhjXm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUYvsL4q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R5gs2143793
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L6SX71fzzR7itcx4t/pTijxV
	Fm3CAO7RKTuuqSh0i70=; b=MbGNhjXmN1zqZeS/hPrCbCFJzkgAjdFDjFnDS99R
	f7IOPISYwKyUVhzbXudIN4/qCIMOTaNmezSJYoNDiLo24hYUELj7xP0Ibjlr4Wv9
	Hc7kQ2JN4Ocx7Lb4LLN/NPSWLRJe2oy7q537rNdQuEdyN5bmVU9McbSJzd+b/33i
	FMgRGWxeqFs6Kr4YHwbggNyTqq1fLK/l/0azLWqrfxOOotXSk2I8J+0j7jF6P9v4
	8DXfNZHhRmCKDRrulhC7nvjAeGSkXC6wrFuCE85CaHKUB5E963M/YFccNb6y2HV9
	ABThaIHjQxukZnWFfGUhbnrreQc/o0tX9YsxpDshUfGQww==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t1hby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:47:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso33800296d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787820471; x=1788425271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6SX71fzzR7itcx4t/pTijxVFm3CAO7RKTuuqSh0i70=;
        b=NUYvsL4qLXAP0HMirRjhRDM02/5WDHshr7yx9XbEX682NBtMxuFCEjq7vmkZd2smL2
         bfyAX/o7V6KzpmcHufyxgPitRc0OleisrDV6ouBSHND0L2IpzQOELqERFuUn2LzucgLu
         fjN9/cYSudOqGwzke9xEgviZttLFdXeLS1oVyw5PS+EeNnNFj0Iki6UTIRyiyL7D7mG1
         0P8H+TRe+1Z5oPBDEJeg5nAU2FMNCmFmaxJMzbyte6typ496ViX6SHkK7ZB/gnLMdejb
         K0/r/umGjFgw/gwtnrYjUHIELJ0/c7xnCNfT4ha2CPOLS7GWJ6u9Q8s1hgLu+GJ6ML2Z
         WLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820471; x=1788425271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6SX71fzzR7itcx4t/pTijxVFm3CAO7RKTuuqSh0i70=;
        b=PhP2TvG+iRT9GL/wQpZbSy5lxMIW9RMsQzC2ZWqWNc6B5U2g56ZDCabWrswX8Vbx2e
         Hqk1Fvce6bJWXRKHy+sabhLQdcBNdKqYqg6j9MWys7eRGXFX3egn7sf1lqyPkk05xy39
         SD0FY18OtGFdr1lTl0xV3TvS32UZpYXCe240zi7MUagoUVCj7hGxMXPsV9Ensy7MclJc
         fN+7+9kscnE5JUUAd8V8oaB9kgUUiiU8muncIrxzRfwc9FN79PT1vuJGwrDlpxmHvSp2
         ZJbBfFnSFxCqn85q4oB42WRoiG45nMlbJs+IpROsjS159R5Y6nluRc2n2ug3y0cs6sEo
         gQLg==
X-Forwarded-Encrypted: i=1; AHgh+RpgG/bAWr5aLoIncYInDlVMrRM1dUZHq07zUZ7RNo8E73zqKFE59csfPnJoUnCfT6m0ijWbAjVKmXKgBVg=@vger.kernel.org
X-Gm-Message-State: AFuF++lKeU9FhGSlUx7r8Ydihx6Jb2giY3GMuC3utQrzAXLqdZKD5cIC
	BOl1cs8dNlose1WcdLwQ9+l8i7rt/jG/iIH/wG+sFZXJeVjOubKg+9yAVpfX1rvEWCzNwq2ZnLi
	T9ECFSubA5N+PRvzY6KuUmAvvdv1WmE6ldY9pjQ7nKS7JcDcq/7wAIkKpPa+TT3IeoFI=
X-Gm-Gg: AR+sD10aU+pUmzJp3a+KOpWdjHDiimRQm2jTjigm+w/gWhuqO47KOgbCX55lWiZFaJ3
	/LNMZQymz+VPkoWnZjCnP2d+gzEh7NecCGDe7EHHDRBk/r8w+hr+MHnTra2OeFMJnop3OSlfBv+
	kJHXERrgCbQhcCtQ2EzgEMGXzicBrxzy8wCX9Qr4FGEcgox1ieXVzAGVW2M1/r+A/5oZwV9Wglv
	hhc9oHaxy1qxP1vZPNMws3C1szb1DA8a0IDTGV9azDTOHfHb/V32Kqs0AB2tSz7oouO5wefcut2
	ntyuRVXjjHPxYm/sZM+rClqNgMZaOoL7oVkYN8sftgZW6lcJFKa+F5MqBDGwT0mNj27A8iPAKQg
	oVheuGAC7bX43uOLSdxy93Aa9G5gVfunhWNY=
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-52e423e01d9mr134394871cf.27.1787820471032;
        Thu, 27 Aug 2026 01:47:51 -0700 (PDT)
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-52e423e01d9mr134394501cf.27.1787820470600;
        Thu, 27 Aug 2026 01:47:50 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56dfb8sm50721065e9.3.2026.08.27.01.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:47:48 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:47:47 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <lxrej2bonrvt5ew7e6wjupcaptj7nxpesnzwvktjusawg3od2u@v3zb2bdjdilo>
References: <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
 <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
 <20260825175901.GE3325090@nvidia.com>
 <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
 <20260826163234.GN3325090@nvidia.com>
 <l3xyzbhqfremod6swwiks54znvoqy57hmqpsdlpcji5czjja4w@4qgiuwhwlie3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l3xyzbhqfremod6swwiks54znvoqy57hmqpsdlpcji5czjja4w@4qgiuwhwlie3>
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a8ff9b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=iiT1TCLmThQewConTdcA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: HjGgaYSQ3qIDFq7aEPIZDIc2h8Wg3goJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MiBTYWx0ZWRfX6nJQfSuGrm2R
 Q1tV9vaUxty1DRJaRLvmCsZDJNROXY2zgiEnzn1C+aNWjxUZpocTLKE/+adjNvR/XDlHhPV8fXS
 uePlYKqDck8IWKShkcpFcPixu7acBXQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MiBTYWx0ZWRfXzgaKFsFCCv4X
 uFpJhblobTXRthiSrT5LJiEkxQDjBd3DeriabA/DQAhJrMnYMIm397xf9Lfxv3AqMwMjtDDzjqQ
 TpirVxKe60+Z428Zz8QX7L8/hFuVHk0u2uyFwy4Rsxi4ndYOzmn1us/c/+vOXWdXuuyN7POXi0c
 atida2SpFoTIsqpwSkClriBRgZdDGLbiBMs5QbyCTZ0a0qZxYDOXFnTOeWjQiVXMMm21H6I1RA8
 mGeqskfFUWScA6DwQBHRpFFlJBiwFOtGhzSLyPKUXiJ7MC2kXb6VZ9IjHNPOWqbTTVq4DEOt4q/
 li8DQjQWDtdRqbEVSlqRighc3Q3LpIVArrYAT0OjEgdx3xBPBcZmTkmEjRa9Io6kKc4rdOuZSFV
 /c8vfj70UDmRTc7c8HOCAfLOnAkzz9G2u/+ryYc25rM/5x/gy8rbUsnxhqESluh/lQ3t81zUaQb
 +wBTOSon8SveQnzxg7Q==
X-Proofpoint-GUID: HjGgaYSQ3qIDFq7aEPIZDIc2h8Wg3goJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270072

On Wed, Aug 26, 2026 at 08:11:58PM +0200, Andrew Jones wrote:
> On Wed, Aug 26, 2026 at 01:32:34PM -0300, Jason Gunthorpe wrote:
> > On Wed, Aug 26, 2026 at 10:23:20AM +0200, Andrew Jones wrote:
> > > RISC-V uses the same basic model as x86 (an IOMMU-owned interrupt
> > > remapping IRQ domain). x86 makes that domain per-IOMMU because its IRTE
> > > resources belong to the IOMMU instance. RISC-V makes it per-device because
> > > its callbacks operate on the device's attached IOMMU domain and preserve
> > > that device's existing MSI parent. The IRQ callbacks provide the lifecycle
> > > hooks, even though the mappings, MSI table, and device context all remain
> > > IOMMU state.
> > 
> > The irq domain isn't per device, it is per msi table, many devices can
> > share the same table, and the VM should have a single shared table
> > across all devices. That's the core uniquely RISCV wrinkle I think.
> > 
> > IDK how Thomas would like to model this, but you will get a better
> > result if it is very clearly explained and asked.
> > 
> > I would like to keep the iommu out of it, so I prefer if IRQ code
> > patches in its MSI table pointer broadly the same way AMD does.
> > Though AMD doesn't have the restriction that remapping only works with
> > a S2 domain :(
> >
> 
> The per-device irqdomain model allows multiple devices to share the same
> S2 IOMMU domain and MSI table. Unlike AMD, however, the RISC-V remapping
> state belongs to a replaceable S2 domain rather than the physical IOMMU.
> The IRQ hierarchy must remain stable across domain changes, so a stable
> per-device irqdomain which operates on the currently attached S2 domain
> may be the closest practical equivalent. I'll explore this further while
> reworking the irqbypass series.
>

I think it should be possible to follow AMD's model more closely. I'll
create one IOMMU-owned irqdomain and install it as each device's MSI
parent at probe time, provided the device currently uses the expected
IMSIC MSI domain, which will be the IOMMU irqdomain's parent. The
irqdomain will contain no per-device or MSI-table state and its callbacks
can recover the device and operate on its currently attached S2 domain.
This is better than the per-device irqdomain since sharing it avoids
redundant domains.

I'll give that a go for the next posting of the irqbypass series, based on
v5 of this host-remapping series. v5 itself will not introduce an IOMMU
irqdomain.

Thanks,
drew
