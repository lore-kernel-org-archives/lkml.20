Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2E110F1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029123; cv=none; b=Z3Lb7rJu9dV8Yxo9tdrbVFpJmaUHfGeNDMLybTvVkDdTw0CsIXSJD5p7RjQ7VI+GRjGU9+jYmTzuykJuuyzLLa0kdoBUx25cYK0bVit2V1N1HhOBbkcHjjI2ZRnCPBBTgeYzxy60D9AvC87zv0KA87xd+addQoGw56qj/cFKKNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029123; c=relaxed/simple;
	bh=lwX/AcC31+KPFnWCyHth3KD7fowt3namwKNEVOl1Vn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMOvdtDil/ebLbs5/SuPsJJQGaAcvCISSfXM6dfRtU8zcaGjhohC6xmRS109JpXaslBAMncg51gWvXS34ecqZMs1DLutaykin8v/PyOOLKn3RxYkgTGFpofgbDLixE+KIGzoGQh+eNKklsG2vLUhWQVVlo7jqYJiLSOT/QFXqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXn/3+NL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1m35FVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXn/3+NL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1m35FVI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GYg64187819
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=; b=XXn/3+NL+Al54R1T
	xFD93jU67LUEAqJRz6dakfpx32V+YS8ViAuWkg8hPaNoClETO4gTFr4etCk90tsz
	cOVMTGuoUJENtpSCgfGQbP/iDM/Njw/lzziWR4ox/MEBpTAkEBxmZ37Y3zsJwVlH
	yg6y4WPdxWwDGn40Ay4NAxLMdtcbxnDM3+p+JfibZvl7XUODNpSrdTTPSR52b1Mx
	LFiPJB58khxEUzBvZ8STmT/C2ERtuB1YvoF8ozhgNDKktbT/ZakVVKSyvXPGvale
	bbu+px6wgXHcLHDH0JW3cuh0ozcxTGBZefFx0MLy/jcc6yqhYr67FlkoqHY1ZcMe
	J/fFdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygtvpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:32:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so928336a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789029120; x=1789633920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=;
        b=H1m35FVISwwNcB1nQRAMh/1fQ8DqS1VJZXtyrW7/L79P+VwYZQjNXJ0EjDYtB8q82b
         Tycsr/WtjPR9LYzdgL1HdKKmrSErvo79Uh/jbRepjURBV/MUCStMF811Yx+j9kBxcoMb
         9wLbVEvDlmMSrm/3V1GFV8tlu0+q4WgtlvZ0EQEsqBXFoUL4v49u3kgnqVT0FshKVMV8
         fRw6vx3yXhcG+Ng0FDYgtLx8lA0RWRNZOP3ak3bO0SKJZ76M1c4yAS6FRbVGIix3m0l1
         uzzAiWwocg5m1k7IfW60yc/Xv3hj1arQPxe0c4fkgOr1kk5iwa9nE8xZl6RIpqOX07ZK
         Rbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029120; x=1789633920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=;
        b=j1/QkIWRAoj8c+wIsHAiH3/Jd9MIzaF1n7duU830fLILk/mICB10+N6ZehvTuaeS6i
         8do8u3Y6QWT5EGoevra19jjNvyJlm0bEA5fgEjhO+VGr2Rc4iP3uisdzFNNSi0Ygw0gA
         vO4vvdmWRq5FMvfTNpL/VrON9A+ZdZmWJxglP1cBhNs+QV9rolbOzfSD2P3d8a2xZwII
         hL/wAQ7HUHuzINA+xg3JP3oe7TesHX2mzbnUv9v7xPZeIet+0G2xEtl+QtMO2yCrDu5p
         KNjE/f0ijoI/q+jBuqnqUFYHXTdZZHcLF/nT8qvB4LIIDSgS1167kcV4Ea0giCW3QxQN
         NGpA==
X-Forwarded-Encrypted: i=1; AKwUvBy0V2MdDsafB/ihPd+yAePAE1zxBKJKqv+UyMRlTUH5DCxtTLE1sApKSqDhrzRy/EC01s3iZu1qr1GnBxI=@vger.kernel.org
X-Gm-Message-State: AFuF++l7hthz44JxTHgVBH2stCPofY3pYh69aFVADI6pzGak6KgDXX4v
	FSELqfvVE/oqmwTCIJKYxNCNNsKq0L0IUuMZu+WkcY12ln9H5WhVXzEqlw+dRiVdLrt3nGp9kOF
	tcxQ4Na46SPxyM/mG5PsXLO6KGwo67UysBDrF9V24k5Vj11JmFXR1baYwL9VVnaiBcu0=
X-Gm-Gg: AYBFou3Z867Bz9iznkRtRkDPNrMPfdR+NTH4yTsRcENwjJmdEWm4kFT3/7krsPcZkwl
	4AaoSEHgymr5ljdLI6m4SeZCp0L6gcY1/2eNDPcBwjQgpQHGMq7QCyzJ5vjEZFGtnFD9t6yW/Kl
	aotXDF+QMfTqKLMAQaGFIowXWRRkyAi7rskYKNQ44HWnT5mZwnvBKT+kADyeJt8CEKQzNyVMQDD
	xLrxQtdq0jtJKrqnlewpwNBCNUx4o2Vl0cRQT2S3+cdKYanFMecOTXiZ8EUSa2rPPcd7NEQjDgx
	DXRPbxVbKmr5fam8WKv5hL+Tz5cNyt9mKKmdMcABIQAp+/g/X+oSic4Vo50AFODoZaMuAR/CkH/
	zI8+mm4aYE/VW3R2TXp0AN4yOrmo=
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr3714030a91.29.1789029119969;
        Thu, 10 Sep 2026 01:31:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr3713957a91.29.1789029119331;
        Thu, 10 Sep 2026 01:31:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm67133142c88.2.2026.09.10.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:31:58 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:01:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260910083152.k7adkrtodrc4vxz6@hu-mojha-hyd.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
 <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
 <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NSBTYWx0ZWRfX/SQJNEwiqpvZ
 VfqdHUrS22RN8T+vzYjCBCwhceIBHSwNdSu1gOq3AS7FW84gu8iy8K1eGNWEIUBM6n3p8ndKNO3
 KKoM6vMzTHvftIMZN0l73bIfQdgLkaTHfbjC6+ZA1jc+oHs8+LcSErKW/36LumrNdJEb4HQTX5Y
 l6HHSB51JuTjp/W2F5bJbtUtNPENmpyc+bOB5xBX2CMAB5mGlDgymjLFwdKb3OanYHysuNEUa0d
 qvHu5tRw9gpGqv7qzAu3crzQ9DtUVXlivd66iQQ+ug5hbx2obZpLEY8AV9cWUR7fSNhwAmZR0Ae
 Hqk5VxAS/97Eba7DD0ETMGB1EoV4fEftK+4knqtbmbkq4ZZK6aZd2S3pauzsTiVdz2wFuXcwW+O
 HiRB9XXvxkZi35ICK2u6Dr+8yQJN3wMuFBvyO2DnhvRQjL55eoXrl9EREmPaqyGYpEdSOObNM7S
 Bb4Og/iHUE4jnXTx3+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NSBTYWx0ZWRfXw4PI84aneP17
 SKIRPWeTYnMdWccuudxvjyMKrKdgpcj2MB761d/b3WRE2fFLQXa3raDOX6xpW/fP5Xh46KvF/cQ
 nGpqAxtVIO/GIB604zDN6g25RvLaAqo=
X-Proofpoint-ORIG-GUID: Rd3sOqFVeBwzmJ03_BVkYe0cvjVoOc8P
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa26b00 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xJ1-6qcDKzqjCoSX3XEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Rd3sOqFVeBwzmJ03_BVkYe0cvjVoOc8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100095

On Thu, Sep 10, 2026 at 12:41:11PM +0530, Sumit Garg wrote:
> Hey Folks,
> 
> On Mon, Jul 13, 2026 at 9:38 PM Mukesh Ojha
> <mukesh.ojha@oss.qualcomm.com> wrote:
> >
> > All existing Kodiak board variants run the Gunyah hypervisor, which
> > means Linux can only boot at EL1 on those devices. It is possible to
> > boot Linux at EL2 on these devices [1].
> >
> > When running under Gunyah, remote processor firmware IOMMU streams are
> > controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> > Linux running at EL2. Describe the firmware streams for each
> > remote processor in an EL2 overlay.
> >
> > Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
> > devices to produce a -el2.dtb alongside the standard dtb. Modem and
> > media subsystems are not yet supported due to missing dependencies.
> > The GPU zap shader is disabled. In EL2 mode the kernel owns the
> > hardware watchdog, so it is enabled here. The wifi-firmware child
> > node describes the IOMMU stream for the WCN6750 firmware; the &wifi
> > node itself is left untouched so that platforms without WiFi are
> > unaffected by the overlay.
> >
> > [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> >
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
> >  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> >
> 
> Any updates on this patch if this can be picked up for the next merge window?

Latest revision is v11
https://lore.kernel.org/lkml/20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com/


-- 
-Mukesh Ojha
