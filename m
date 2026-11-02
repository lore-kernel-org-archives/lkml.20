Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793656526;
	b=ijDs4ePC36kfvRrQvhzX6ArlMt9rOwVbMUuGcI+dm1pvDiRCtNH0vG0cuQ3O/eLvin4J
	 spRPZlRwRfXOb5TNqUp08QxaolFldgac4d0zDWa+/HEJvTEmg+Prh/zcg5+ZXPSxAi8fz
	 13SIVcPlLjK8olSc5xHxnxEqS4cCC/zdJ6RgHavE+PrbHYdVyDxS6d2nlye4FjaITHXCJ
	 J/PP/bRyREI8/xigQbJi1A7QvJVTIJCpTSNuKoPhF242mLINiw70IBeQsa83fewBJYB+w
	 3URl71RTXiYe441kvrsdmPk55QdywfutNdHDqIbx4Ke6zcqoSjomliYEZ6BQBU2Oq+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
	b=jHFgFQf6m7WW+4iIgd+OdqZ3ghzdg4UeR1fY5WVwUtelp0hyX5hsZZI2EQBCY66jooTZ
	 aiCinABjmstcKp3fRU7VwUoIGanIzOpHuYS4hYP41AuTHysLUvszp2ejuUQQOPQ1gcL5m
	 Bn8gHC3buqM09raiY654pTFaRmx8RFg+5zHKfIptvGUqCwygBwTqg6UXSAjt2R2uZHqTP
	 SIn/+17a4rWwquUPYcLUGOc0hzm/Slo60V+rRzdaXiepDEzS1Fpwf9NAUqLKfndD55aUu
	 51qAx9YqXBDcQnFQ9M4XOAejb04N2/4ZbbgUdRVmaBKSKxxeruJKoixWlMGiBAmHmyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iFG/gbXs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNDp5vmo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD2606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECD2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFG/gbXs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNDp5vmo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K61fU1696465
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 21:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=; b=iF
	G/gbXs4vywdlb2op5UKUfoQVuQsH8yMcM9nEoSU6ycicr6Tah6+SmKgoKWHlbd5c
	oTe3KdUw4yG0ztUBVCgrAngbcIGFF6dazGHGsIcZLU2Ur/6b2wydddoe3UU6DPnt
	nse1dREVyXhQNTDl5/f347gV472rkITi5/j5XHCFKsQgnRb/4vQmBxmaxxgAc7rH
	9EOE4ryF2jMbmKYvd4RlT9xN1HlwEv3aYWTUUnaFe5B0ow+dL+P/+TasTU8y5ZHM
	O9pC6IsO4/ehOz90Mx9k3mdCbu4GLgZg+xHD7RqLlWfL4Yrezi677hHnTjqI2F30
	UjmuutvQTnPWekcwOxJA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1ux3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:55:24 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4943ed99826so3211037fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793656524; cv=none;
        d=google.com; s=arc-20260327;
        b=QJeybQTlGdovxZNUSIcIGDV64tX94mq67GkScRgCdDX1Ao08Rb5n5FErdOG4Tc5qxe
         79Nlcv3Od2NRr3PAPfjsBbxxFhWJuKQNqSQ0Ue+m90Upcym39L87b4EI9Dj3fKMTtdqB
         FmJH7+L45Md/KQI8u/Xcwb8BBxcrhW7uwuYy7bb4Kn8P8s4BuXef4WDGqgAWKSj499+b
         JXi+ugcULl4GvydlofqwbbUTOxU9GQmOHWbJRDYxMLvy8qh6AqTwNVxgGfMsj3E0iGeV
         jWFQd6SiqlQmGnFAlCXlGgTxcrST7ZVAVtnHq1IlJj51iTV48NmQvmjyU1KMTA081VsB
         EBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        fh=6+XPJJRKEF7EZVwzhdZnzt3k3d7HhQlCNdZiIA668t8=;
        b=ko6ZjOXRZAH9ZD/qOsy3CrbIZ5BttjTmIcIeFkPJNTZA87/lO2up6Zbh25viSvd0mm
         Fx8pyvf6SiUUQ+cFS2V++7EwVGRiMmNN4k5col1GfTLWuP/+Io6Kuq/Q+E6tMAsCi1BF
         SGk7C12YhGJGdZCcIAYqihQ8KyGFbEsJZO+c3by58x3+dqObFSyPIGSO4HUYIE5MKm/T
         cmhm4v+hJIfKTv1zw0qayslwyNxm5sv9+jl83lmS6q5mQy9O7Dm8djLcLI/WHvDcFSwc
         zys8Z0sANf+GN2QQJpb53T0A70QeWqjR5GxqHNAzQ4rDawbnLMXIAeuaZy9X1Q3hmMQu
         ST9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793656524; x=1794261324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        b=WNDp5vmoQ8djL6Jd4UwrQjH9On/Vidh2rGh+SQLa8xmCRoraWUkEfucmZ+J2s4aZp7
         +sHMYtkX5L3aEU8Lnr8+VMvE28HlXEYbXcko8Hex9OpSPjv4WcyvsMDjPfPbt01qWNAH
         ivx+CecKTU5sBTEsc1pIHYRZRbqWM5fV7lz9pJzZ0uy7WrsuWr2RLkcrMMfemBNAwa6n
         PRApICOnevpTXfyuxgfAK7URo4LpAPH6HF7wqx46CKu7EjVSbKmZiB8uBgKWAIqc90mu
         TLWIbS4Ekg1bBept24bSKzJTTfqMe1IXubmKjLG5d8SdxCMyMBqNOo5FdmqQuyC1Nm+Z
         6vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656524; x=1794261324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        b=fuWPMRkZXnmUA7Grt4CXhMpuN/Avp7iRZA2EIQyPZmITxUAnDpW/Q1YgHTemzgtq6x
         zLjdtS3kkrB6SAthaZz0qCy+tQLUt/LAfMNWxJ2yNPVU1c1Lc+UFvIZED9f6DJS9/wJY
         rp/01sUTli9DbipLSF9NnkDk2Vf1nmZV8LDiFcMYxjaX9zYxEMhXwo/Ocs+qYt7oZpkE
         uJ+eDQyvDk7Bxt5T838eLU4vVhDPFVCGB3Cds1x2FHB8h2QX1CIdXpg3WJ/fv+U2k438
         rGllZwd42f95IYuFTvPnO5wYVRbMnfzOGguRz9jl4i4nEQLrO5kv4AWgzx+JznEBppJ+
         bb1w==
X-Forwarded-Encrypted: i=1; AKwUvBzvmBeBhJsjJt9Oho7a8ld7AmupjYLnwRoSoeh8UmxXWeeLMqO6CcWb8KvK860Em0QqEPVmJfibLwVGLNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cqWUk4hQVMZgnXh9WbVrfZoPUCrKfFPxnUBifUvL6hPxI6mZ1
	FNfX7HOMTAdhlJzJDQENgHnZ5gU9fGEXUg2INIV55cKxV9hCXY0Vw/nEHP3tVoLgDc95pFBEVRb
	rGlbeG1SCyaaaqyjsGx4LmL5NzGdbwgaRY1d7Gqa2lRm1AWKxEst2VE8UY+3+ZfrQ8lbgjMWQJm
	9q7jTUczDTTosBgJuyBqsqZlTnZ6qcuWdzJ/ittekxsg==
X-Gm-Gg: AYBFou38G7lazmze1PhFqYTlV44glKW4mcr1mfc5B4CTWCaPxjp2Ytz/mX4MZYPopQt
	heg00FMkx2ntrxbxC2zW2nq8Sa4K8lcYI31U+HDJAs/M7i+OMYmVsgCJ0k1f33aJ5zFfnZJ8E6K
	frZMLTHi7ZT/sLV3jqfUXpvc8bDKG+hL+HLTMmAGT0yPDRJXCkmV2JXdlNkA==
X-Received: by 2002:a05:6871:3285:b0:48f:e107:317b with SMTP id 586e51a60fabf-4a9077d5bbfmr7236432fac.46.1793656521135;
        Mon, 02 Nov 2026 13:55:21 -0800 (PST)
X-Received: by 2002:a05:6871:3285:b0:48f:e107:317b with SMTP id
 586e51a60fabf-4a9077d5bbfmr7236414fac.46.1793656520482; Mon, 02 Nov 2026
 13:55:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com> <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
In-Reply-To: <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:55:07 -0800
X-Gm-Features: AclHuK8vUilw2z840EWu19Aj2IsPjbqVTCvonIaFNq6IovHlRAiOrSo_eV_NVk4
Message-ID: <CACSVV03=CiMQX4sPp8EkL-p0+nyU6JGc8G0HXhyMK29Cw99CXA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: e2QYRhFZyo0s3b5t4M2XiXflXsm2HVVF
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae906cc cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=HdZ-pd3ExLc5KhsI-vcA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX5V1qMd1KABSm
 c0o5QgVGwH4YrjgtmpGFwfw6HQiyzYQ/xDjPi74BWOnX4o31mjFBh0HT8nHgmJwT5/WmtTRG3tT
 wMleXeMsCQ1vMYB4cBmUO3y7Bp9Nb+av1MXcEE67TKCaKrIFHYW+Q+GqrXaL09XTecXIa0VuGAF
 g2OoyueIYZd4tc/+qmsviLQqgvJlz+QmYElLru04YGli90zdryeH7lBP5WUYUdz7dmAqFFaKQqI
 X8bu3089sxvUDMhMf4mzyTSecFuZijUeD1AP6SIxqNV7RaiIFpXeD06vCHswXxeNXA0egRLxYkG
 BjG76rxaahgXxtN5irRuZf+eiEADWO4r6HvJhuMplnn7k4OMEY8iZ4bHb30wIEPx1LYXpM81siZ
 LIp04sw7pd3b6yciVs4fI5vTW2gVnxX4T0nEUjVStnH5VKrgbnrxs2YWodywBlZuDlQk1mRKW4c
 CB0yRh8wjHwnJKjrSkQ==
X-Proofpoint-GUID: e2QYRhFZyo0s3b5t4M2XiXflXsm2HVVF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX7baOV0ZjPjh/
 ZEJSkI5zzsgInj95wQ0PudqA3r/paldLgbHyz/46ZXTYMGvlN/BRcP7QolDaPf5WOA6hVr6IOPu
 lxRHdGLHEguDsdyvrf2vycUBkjHKWn8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

On Mon, Nov 2, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Oct 31, 2026 at 08:33:06AM -0700, Rob Clark wrote:
> > On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Rob's drm/msm series [1] writes the addresses dma_map_sgtable() retur=
ns
> > > for the DRM device into the GPU and display page tables, so they have=
 to
> > > be physical addresses, i.e. the device must not use iommu-dma. On DPU
> > > platforms that holds, the DRM device has no iommus of its own. On MDP=
5
> > > platforms it is the MDP5 device, which ends up with iommu-dma: the GP=
U
> > > then fails to start on db410c and sda660 and resets db820c. The last
> > > two patches give it an identity default domain in qcom_iommu and
> > > arm-smmu-qcom.
> > >
> > > The first patch fixes qcom_iommu's flush_iotlb_all, which never
> > > invalidated the TLB. Nothing relies on it today, but the series above
> > > does, hence no Fixes tag.
> > >
> > > The patches are independent of [1] and a no-op for the current drm/ms=
m,
> > > but have to land before it. Tested on top of [1] on db410c, db820c an=
d
> > > IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> > > control.
> >
> > Thanks, this should mostly supersede my untested series[1], but I
> > think msm_iommu.c still needs the same treatment?  Hopefully just the
> > def_domain_type() part?
>
> The msm_iommu.c needed more fixes. I will refresh my old series and
> include fixes necessary for the dmabuf debug to work.

I guess if iommu/msm needs other fixes in the first place, that
shouldn't hold up the dmabuf-debug series

BR,
-R
