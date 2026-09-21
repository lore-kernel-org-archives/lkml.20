Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E6B3ACA41
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026645; cv=none; b=JdYxifLkhCNVjuizsHMBLn9ehlIUu0+7YV4qik5DzrTcoKjObSoRYQNQe9r/5Xp40xUWD63ZPFXem3l73IObk8nyOrG+eBVcglshlG9b5yID2T2bb6bqshUBy57+IM6OAEA0JPkA/pxigkioCbdKsCJpmmr6fSOn0WNNC4Jun24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026645; c=relaxed/simple;
	bh=5Ts24efOpui+13n7/Xsa/KfOpnWj+hW11Ewp1k0kAwI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E41N9QLjr1Xl1JtyxdllSfX3CnXTORf9TUU5AF4uC9gEtz5lK1cevnWwpgAtEdIGZLwdvbvu9QqTkLw9feByhzobwbbiVCOwTDrlnSU+ejgPjJVpC2vEKYZMyn0R7xjtHsTuYdFAkMIcfgDY9hE4FK0LG1ooM8S1NfKAuAZeLUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crwk3eZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrDjQqqk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crwk3eZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrDjQqqk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKfiQ01751662
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=; b=crwk3eZFEJnuHuwA
	BxX1kqi8xITwzyLEXrOfDs9Hftiy1udNkfXh1s9EoS9FDMi9SYYra2hr/LwQMuPH
	kMlwgDt70V9cANFNiAuf4sNIShxrP2xTz7dV0eAMRZIBCBHgh5tKnigxbVhBm4iv
	W4t9IZd3gJA551FAz5yi2qOckuGgI9N3N8h5rUFAgWenLb8pVjTLmbX8XBA8qRSS
	xpy2rNyF96OUBBEDD9WZwHg9nbH/k4P0xWLhfXzD/R/hQsoN135rLUS111W5+VpF
	RkOszKlROCP7sxheX72VT4GUcGfsSaHovQBWU5lbEoVK1R1uUT6LNq+Ulg9qLZ73
	sZCHpg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xerwyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:37:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so60503855ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790026643; x=1790631443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=;
        b=DrDjQqqkxgYXsA6vp9Ue9NidTHIMMSrGK/pGejpAniSOhN3jC1qmXScCMegqUCbY31
         TPSa3VwhkoMyzWvkzqyUrZcEGIsEwRCKvcn9Um2eTVat3i+B1Tu1z6wilrUrorDmjCPO
         Bf4JJrd5bbmdv/uu3x/Uc5+Z9k10BWD7OBPXSDINRz/ZUjyivJe/EmqfzRZIT1XaAOY6
         S8ggOkh/wBRhAS1wlT7G/RKVCYI0V6c2SSdAgbtw6HCS25NXw32mhd+DefZoAuogeHWn
         Hos7fw3Wz2OoX8UCIMJJ9c45mNYcqqx7hDcP//yFhP04w4KjfYfqq6s/qFWaIYdm//Wp
         DzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026643; x=1790631443;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Swt0YNhB50FD81oDu+eeGBpzGMZ5gYqJP471jCzHYIk=;
        b=zmHxrrBJvh2zMsa0Ql8n9ZLv9IIiABCtnpG/8VALXvugbNOTqCaQsbzsLz3j5FhnkL
         D2LDyG2DaMj5kgkw6V+litzy7FHAfS9lf6gTVA4MrFUbKT/KKtkvPCGjg1xRPjJBILMt
         nIiCf3XVudnaJTn4O9a6N3nRRP5a3CLkNKfFPcqHjvJON8GEFqWq3fyfaRhp1UlmELEV
         NtWIXdQRFNPfrMlBYO4fSc4WbTe0vi0L//rPV5W2pAt0RFdjbCPQvhS14QX8Epdoblok
         GBM/hjUIVbQHPGcd/H5QPjyMmA7I1FnhrI29wtHye86ABkkWL8k50/BqSjn8zZ7gUSrW
         P81w==
X-Forwarded-Encrypted: i=1; AKwUvBxAN3HKXEp/7KO/NKcx6CMERLzEBp2VfuIfuwfsrs3oKNBu6sLGrmuGwdPkZeIkHDTmSE5byzjUHfwe+os=@vger.kernel.org
X-Gm-Message-State: AFuF++lahO18DfLuD5nc2uxQiI9ChSlaLogbK2MhfsUgK+/vmWdZw64r
	pLuZnpO86qKOHrajceLDKSYrMCFin062BQOeruzSl1wkAyCfI8943FmO2hk3yT2KLZfcZTigVL1
	qc2Sj684zGWiv8ASnLV/n5rW5umW8p+/VzA2lgLi4ilt3xrQKVt2Ij3yuUxinnssGTSUj9O5pIt
	o=
X-Gm-Gg: AYBFou3QLOgKdN5F1OP9A83g4rOvyQtvQJzd+27UG3zF5UfdkaJf/2HPtiypJCVxoO8
	mFq8oVXeAgqwaswjd3HQk1DDiy3v8bWj+Kn7aYTgP3jIS+i1d8C/geKYTbTtoO/5KqvKUtuA2Ad
	Ew7roQHEw3f6LNTsF6ucIps46fv8SXruq9elaD1rJ9ZNVIPypwkIkMtqG6do5itkViNzKq1ZHW/
	ONYwRhTDoDIZh8RqR/tZIdFURHWkFiyscMS1WDxC0Wgrn4XP8eW3qFLs3UXLK4PceS6gNReF/nn
	8FIfWl8QQ4yxZof9OSfrr5oOOL/BAMQ+RcRqozafabwGHC8Mnrl4zrh757aAUxOM3WsQWhfLA6P
	i4eQsD7JrIOHP/RdZlZKrCeStEA==
X-Received: by 2002:a17:902:ebc6:b0:2dd:c053:9c6e with SMTP id d9443c01a7336-2ddc0539da7mr117471895ad.36.1790026643047;
        Mon, 21 Sep 2026 14:37:23 -0700 (PDT)
X-Received: by 2002:a17:902:ebc6:b0:2dd:c053:9c6e with SMTP id d9443c01a7336-2ddc0539da7mr117471595ad.36.1790026642576;
        Mon, 21 Sep 2026 14:37:22 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec0d55esm650212eec.20.2026.09.21.14.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:37:22 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:37:18 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 2/7] firmware: arm_rmm: Check for RMI support at
 init
Message-ID: <20260921143718.00001e55@oss.qualcomm.com>
In-Reply-To: <f0a4672d-c7f2-42d4-9fc7-b5a1d0ad3b83@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-3-suzuki.poulose@arm.com>
	<178978126541.2352296.3637463397103730192.b4-review@b4>
	<f0a4672d-c7f2-42d4-9fc7-b5a1d0ad3b83@arm.com>
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
X-Proofpoint-ORIG-GUID: wbq8mMvhZmPr3sFVSnLFslXsAKtHwSgW
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab1a393 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=dENJxcbTWoohif9XLWkA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: wbq8mMvhZmPr3sFVSnLFslXsAKtHwSgW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX26H54RQoBKSs
 q/TSK5P+9zAusIHwWMBWOS+7gWOaoxHXkkijshrSUMS24iE9DZKtmOGbD6oyx4XedCbQQzTZ+HC
 5PSk3aOFI92M3S3tJrxgVd7dokHIOXckYIJ5QxQgUe9W5sUbzXjW4KgQ3f9TXH2RBfBin83im9J
 xhjyKhWuspojRDUNV9+N5gSJrFavYHciMjzr0AN1i+AET0zf0DsXq6/r1M2l9itvHidmBUxeQFl
 37c3oOtFYzdUOytZpk2Im27Q+idNC66YMNjzLFIQXjkZcgrbNgeZQD4Um99YHXxLvKh9peRgFv3
 xzfpesAdFKpi+y6P4rsP+MHKPTIooXJgF1vLb/+B9VHg56MRyPnxrwRZ6M9xiNiSCyBQfDG60it
 Hzc2zYHmBLZ7lHaPwuAMzk5wRIZ4CAL7H9NdPtgGd3CKnNHuPvrDlpqsU0JFOmVxI1nAtDxOc4G
 NLf3GuR8JldEFBj0PiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX2X4gdaapMZNS
 UItcx/uDDqYbFBaM1t4x4GY0/CJA819gypDG355lPd6C76hb63KkoVU8g8HqQVcBO4vR//4Xp1E
 0BcO+x+BHnCdmnvlslic9pk/p5oZ4ek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210315

On Mon, 21 Sep 2026 10:00:20 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 19/09/2026 02:27, Jonathan Cameron wrote:
> >> Query the RMI version number and check if it is a compatible version.
> >> The first two feature registers are read and exposed for future code to
> >> use.
> >>
> >> We only support this for Little Endian kernels, the Big Endian kernel
> >> support is anyway marked BROKEN and is being removed.  
> > 
> > Can we have a small comment here on why the default is y
> > 
> > It's a big thing to opt into by default.  Feels like defconfig
> > material maybe but not in the Kconfig defaults unless I'm missing
> > something.  
> 
> We need this for KVM arm64. I could drop the default here and
> KVM selects this anyways. But, how far do we go on this ?
> Do we need to be able to disable this completely even for KVM ?

Not sure. Question for the KVM folk to decide.  Lot of pre CCA systems
out there and domains in which CCA may not be useful,
so definitely makes sense that people will build kernels
without it.  

I think dropping this default though makes sense if KVM
can select it. 

Jonathan

> 
> As such it is a relatively smaller blob:
> 
> $ size drivers/firmware/arm_rmm/rmi.o
>     text    data     bss     dec     hex filename
>     7477     572       1    8050    1f72 drivers/firmware/arm_rmm/rmi.o
> 
> Cheers
> Suzuki
> 
