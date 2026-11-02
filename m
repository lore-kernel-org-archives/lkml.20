Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613507;
	b=m1oF6F79kmYozUAF1GwHbdoLFC43sCdLkasFivz3JiQCwJ/tQbJ9KSbCqdiujbklcpb8
	 7rEC6rWYzzwwGqCB56MQoNP9ASOy1aUTpRYtCVI7g8IZratMnK/YtpOzVmzjFqw1BLlys
	 Gsz/ZpQq1C1VMcqw6ri9jPWffuC0gGD/bZ8vSH6elWGDrcksF4kV9oApTNhOJviT3kL6Q
	 VKLw4RGofVHQiDmNhV1P1yLBU5jCAd3N92aY7+ZR2wCte/RxNCJwnUp0S44suJbNc3MXZ
	 rtXBYV/Zo80WVu+EIXcsB/m/hzZM20T8CwRxCDJ1DaETL9TlqgZymLOAbAH9qjfki/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=;
	b=WkS0kUahjsnQQVH0lKszORq4MMsVDhtoD6pPkOtUcyXucw3xJNdzl5KJH78kDfIRnvsQ
	 SmvfVVZejCow/ECnkNqPVeM0tz8oZ5ykDmJ4lCl3Ewr7YmArbhIoUbzD96Rh4MoMlrQBG
	 meeU77XdjiloGyxyKx9HKdr8W3fD1gpP8QX+zKLfu+jc9632EIS/PdEPp29m/lNwNeYEm
	 c6CZ+aCfTHyrnI+qlDfDCGSzArs2oSvtBXwmwQ3o0glbNF3jQOQNAuFxFwxasue4XtFCj
	 DRw0KtpSxLqxlUDHoFRyQPom0anqfQO8XrSAmmvxXgabNoJIaPPXR+Skca4SFUE4TMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=futowQ+d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C4UKNOu/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A01606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A01606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=futowQ+d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4UKNOu/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASIp3440486
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=; b=futowQ+d0AVA1wU7
	Fe1XnXE/6MhUV0vCnUohaHpa4xmem+tbtDGUqss/w8e9mNFe0pfjfGLIzDjRJv7/
	Qi62eDUiaiggCl1vQ5n14Dm5rg2lkf74M5bZnRbMXdwDJd12WDjugSY3430cu7zU
	hfhEsPR6TaZv9HGFuMHH63Cy0wQ+aslg7XXogVCuYQ47ezT7G3/D8qZB2CkMUm2M
	Z/YhAZ7TW95TPXR/cm9jZfjtvHNkDi7dZfw1NUbuVNqOFhZMWT9eOL/2w9N9i2jW
	vlyY77cH9lHj8aKWug1zLLrcLFp1ltLZtpx/te/g7LFq327mChW+XccuC8QwnAHO
	xVCKxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201sam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:58:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bebff9fcaso56382726d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613505; x=1794218305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=;
        b=C4UKNOu/zTc87Q0PExpU1K8mke0jM5kgMCDClttYxkkrFrOi3JXJe5zLifQ9o3uGUo
         1K8bKsyc8eP/O1epXBNh4RQhvNOtCa3nhDNW4LH07Ng2em9YS8Qr5HDXehZ1pPgeGP8k
         ILB1utfPTTdWJUn1aaREKNBhB1i/RgdQVn7HnAUWpu7qlTD+bMDat9eH45mN4g3eKUqB
         q8iRKANVezuOVhowyp6pGPNaE0Oiy75cNjjhMmHwrPnkSV/dmOc+9uI7E5ex7YiKhtcN
         KMGB7l63Np3mH/d2Ry8M0i5w5Pxnrd/K57/EGbqLXnuZICyIJe1dz2ADp+1Rl9il0L15
         cuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613505; x=1794218305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=;
        b=KZHscV4RH9shjvcgGfkpsm22dSipHooaZhEkp8EPYtlqZVooqJHe802GwcdM+SmxUC
         d7JscRtJzYhuIi52kTmYzpjCkN8xO31ER+CF+yflEdUTYTd6a9mdDdLkpO8/FZRgmaVd
         mN1rgqvjA6oRXxaf6VTwCfkqzUsbHlsIJNuI70oTOK9o9EqbqSoa3X0NvO8KZXSwcNl4
         yBRz4RRcAzGZJx+QhgYVsllGeyHvjnHF0Rob7luGqNmI7iCIuuX7PXXBHSDUad4xqOgY
         1ZQDgJOKa20/Wk5oPufDGGW9bP007rvj5IVrryejfaFRXPJuLe6EMmBUFdRcaZxQ20Z6
         hZtw==
X-Forwarded-Encrypted: i=1; AKwUvByrxsTXiNwywfuuvrbZA4kZLkIasIeNM9+ZMf42Qn2IEIMmHGZpiefxchL2LwnDqmNdOE3QMVmvKqbf2ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z91cqkESrzcg8Rgr/k0viJFLklfv/FS4rYIsE8NMeN2hdiQCogQ
	W1AHA7h4R/+C4P4ZwkzS8l8g8Pd8HsQau4f88L9qlfxpji4g9/DEIhU6qEZ7e9I6pUQfhHwF0Wm
	Yq0mFumIUdfACvfyD9sP+CW/x6xgeX8bEE0QsuSPEBJ+kVIWFgSh1xZgPd1bbLJG36I8=
X-Gm-Gg: AYBFou0EYykwtEwF832IEMWs1N5+rmRUy8EFclaCm2fM4NwirMhEuBAfutCtyAEVaXI
	ro5O7vWwbklR4Kf6RNAaVcpOg0pgdfUsA+UwY7vImYErWyco16pKJ4uhXWReoItl8TGAwm8ykER
	+W8/+2OvqccfK+Li0vKwo+iD9yNNxRhDOzwfh1WZbGZAWR6vE3+EH0QiWB0scIi1Scxww2fzIe4
	wy8BJnSHr1cbAWAZzvFMvWLq89g4QaorT/sr5HO9En2PvssvA5raHHDMWvdPI+u+iWyaOtWk+bn
	Z3WzAKcHWo4Px7a0iE3Lh7L6VVMXRmq4YGWVDiah5s+4we/SoHAOYUu1/CKhLwSeADh7IvRPuQH
	lKQnS53tUDJ5RGrHU69LCuqd//M1RHs71E57arInV1rcRTsQ0ldHlKfaANxOHYxB71FzoA00a9n
	CP6/8vH8SSv3ncH3U+C1jCfmS4HMhuvP1tiksynMY3wzisi94czoLGDNTBPHHS
X-Received: by 2002:a05:6214:3909:b0:91b:5d3b:4aca with SMTP id 6a1803df08f44-91ca4b980d0mr164013246d6.51.1793613505266;
        Mon, 02 Nov 2026 01:58:25 -0800 (PST)
X-Received: by 2002:a05:6214:3909:b0:91b:5d3b:4aca with SMTP id 6a1803df08f44-91ca4b980d0mr164013006d6.51.1793613504569;
        Mon, 02 Nov 2026 01:58:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbedf87dsm19739631fa.17.2026.11.02.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:58:22 -0800 (PST)
Date: Mon, 2 Nov 2026 11:58:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
Message-ID: <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com>
X-Proofpoint-GUID: L9NhuBkVlJ0w53f8tQPSFUlQGnaKR5ol
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae85ec2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wZccLAYvN7ng3IXnx9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: L9NhuBkVlJ0w53f8tQPSFUlQGnaKR5ol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX6r/+znWUdRns
 4m4NUrDDZtwbT7PASRqkoQRmBUoCIyyGznNNVtlE8Bi9gXARxkvIitV+f0uRObjyHO40M2Zq5g3
 259ooPfJ1+K+hxpJcn0P7cOBlbWqtFHVSo7h+C/m44eTvdYah5ucDKd2Y+kqeYNAkV6uMrCk3cG
 /+60i4SXttcFaCO26H3DjbkhL06PNUp+Ai5NqHWv/RhYt0lP/XBfSmpUhNwFYFeqzO6SIGHM7CF
 wUVtsaJl3pWeMSIxISvE/jJR5PbNMTXNHqnoIOl9XwctBZqSMh2fEkTg8ZSy0SgSme+rnEg11Nq
 XhIMpmwAnK13rGQgkkJkm2Mp1XzknfZ6SBeq0DClhNZAULdBjX/rwhOVd69TErzDgjMJFZMe2Sr
 j2uQm4e8t8bBv/j/FwHGFxE2TLKcDem2ylpf3A5nKKUE8HOqG0MUtY8ingjvq1dGVBWtu/I5uOe
 XLklW4zKWgSXiafrUEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX853Ayr2/Gh7q
 gO1XQLXh5ToQDMEwB6WIW3guGkP5d9aZ59T6f9EKZhJRF2+Xp8HXzM9n0cBpJt4Q8giujIRUAAK
 7AdK5b7ud+3p32nIgzxrzR4mfiz/Jus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039

On Sat, Oct 31, 2026 at 08:33:06AM -0700, Rob Clark wrote:
> On Fri, Oct 30, 2026 at 3:05 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Rob's drm/msm series [1] writes the addresses dma_map_sgtable() returns
> > for the DRM device into the GPU and display page tables, so they have to
> > be physical addresses, i.e. the device must not use iommu-dma. On DPU
> > platforms that holds, the DRM device has no iommus of its own. On MDP5
> > platforms it is the MDP5 device, which ends up with iommu-dma: the GPU
> > then fails to start on db410c and sda660 and resets db820c. The last
> > two patches give it an identity default domain in qcom_iommu and
> > arm-smmu-qcom.
> >
> > The first patch fixes qcom_iommu's flush_iotlb_all, which never
> > invalidated the TLB. Nothing relies on it today, but the series above
> > does, hence no Fixes tag.
> >
> > The patches are independent of [1] and a no-op for the current drm/msm,
> > but have to land before it. Tested on top of [1] on db410c, db820c and
> > IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> > control.
> 
> Thanks, this should mostly supersede my untested series[1], but I
> think msm_iommu.c still needs the same treatment?  Hopefully just the
> def_domain_type() part?

The msm_iommu.c needed more fixes. I will refresh my old series and
include fixes necessary for the dmabuf debug to work.

-- 
With best wishes
Dmitry
