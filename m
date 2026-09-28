Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2091447729B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591094; cv=none; b=A67XPsGQWhoKSqOeI9L6cia93ahGKq45NurODMno3Jy7RpoYkFFBV8RdcVe+kumxYCRyOAEvvfVmKPqBN6mUaXXoidA2UDbe5vkyWgWSDMSXV6XfIJCbUkUL73rjg4jeqlZjHYwDlnh0n0kGpUobfO/d3a/GbL5CRsqbxMfNQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591094; c=relaxed/simple;
	bh=JunxL7oqClUJ+DsAanyRKj4rdJd/Q7BGxwsr424FObM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2wMdt3NYH7gTm6dQui2GckPoakUxe/WQOaVLsuFPwqnAEzlLAliKInA1zBgB4lv0YjjSf/hcgHa2mpz51ogNWSnG8k2LJiOPYU+F4hmP8LtqW4XpkWTR6xkgOMCV1C96UaAfVxrPijSkA1gn0h8bEEoecPVQp9v0hBQT2ezcqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UX5AkMlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWQzQF9I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UX5AkMlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWQzQF9I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M6gi1603482
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JunxL7oqClUJ+DsAanyRKj4r
	dJd/Q7BGxwsr424FObM=; b=UX5AkMlZvPxLTlrKpBAg9qNfrwOwRYyTkcw5q+4j
	RPzg+7cBq5CmGHUhsfctEzZWyH5vSGsEphMCrLYeAHLbvOmTYCQ7swMf1Io/qIvx
	qrPW0tJTGV+EfNbt4SBXOV/wQ3qB/VLUwGn9352uvrTOnGK8Wjr6CTPBPHnNR7M0
	DwouI9sbwgrQXn9FMxFsUdb3ayAHPcNxrGtl++eWmBy7FoVttCnKJmHhzCRMk4uC
	QPJL2aCQsTLtQP4OXfTjyiAT5okBXpeQ6s9OtQeST/V5Qe42t/57HMgeNviHfi2G
	UHcVHi/4DYPyAo1MHBpnvjYHNmSzpkaSNgYRfX31b9Xt8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6g9fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:24:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so853946085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591091; x=1791195891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JunxL7oqClUJ+DsAanyRKj4rdJd/Q7BGxwsr424FObM=;
        b=fWQzQF9IEzKavC/j5h9q0PVAnBQ107mzo2NYRpz08O3e1UXZlLd5FCRiC1QHHd0mAZ
         8TB7zJQzPN/lypsLNF8bgXdRPmdpCMPQuiwVyj5J2UU6VZV1DUKNF0IDv+zw3e/P3YKA
         /Bvj5KZHWQPOkwE2lgFvlVpaNEIpBJj1vAslsh3zLyXshibXM9A0PdYIIWDitmHlqP1z
         nFxzg+iBCvwu//u4QTAIM/HXDsjfiV3V3RH+CyaLPkEYqEo6Kmrm1FUggilvY/yOYo8s
         aFbtVvyCksaiDkJb/Q7NDEjqW/8r5y8uiassQ5OT5bhUWVcs9E5eiP06zlAs/TnojTyB
         jaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591091; x=1791195891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JunxL7oqClUJ+DsAanyRKj4rdJd/Q7BGxwsr424FObM=;
        b=LjCRUrjgxyhOIef6xGOEvjBiyS6PGsxkwy+DFiRtiJlZiwZKmdri+rx2t1+OiKe8Ga
         WSaL1EamBn4mG2OZzJv0AE9ovtcv53aINBeoe64mbLIzU1y3dqQ97BbbV9EfEjh+dxci
         BRO/9MQ4G9+nex3OMatzY7f0o9m2xMp0hNnnGArtJCwG1QkKpo9KD2Q0uG0WT0hyq35d
         1mP4TwNon2chlL7yCivAqB1QkdVOEyjq+u2kO2PgPcApzor5Wyt9YjU/F5YvN5dxgTBH
         Deh1CVxFvqbWSrNLfIsrO1J+Ylm6SDXdJKHAI6xsRWkoNvyXnOipgN8Cs4wq7Gtu6NzE
         rn+A==
X-Gm-Message-State: AFuF++kDk/Y7Nk+2rsHIlVy7gm5nkIzbwbbMfEDOClJJKYrhUIOISUec
	JrF79nzlJLz1j75p2oxFol5ArubeUDkRQdc5O75kAfFBfB2mSfhiA3AM0icMTPDOHcJnAnzYirz
	Bb0Z1QSBOSjfygpCI89SK/8tutjH5W5gT+nXTs4VX3fV+KpplNmo05W7XpLQPO2jQZiY=
X-Gm-Gg: AYBFou1pjABJ2egimZKbVVFl1HtzNPht1X73JbmcXKigvVZbJ30aXuqabANiTr0DP/+
	dZiXLCKEEvd82I5JZ05MH6SFpAXG3YItHGUa1uHthjVOrCUtpSgnox33YV2NvowjimJtBSpIlE6
	97AUSXAVQKXwuNXCVrT/5N7H3q0YaE3MBNpNC8ziQ9Yz/o1UBou7etWKvyAxXslS++c5SXftNXn
	hp4j0H7Dixw3GxwW4SnFrA8oASGc5PqeWT3RR0JrTCgy6fnYs1VS0ddJTIceSpbZ8t9Aid8KLEa
	9Ai0sicaPZWhnt2+u3h4EplwIxid5qE4O2cGgWaaaSzCkI5OpPdj4rU8f6qpNgch/3euTlKHdrS
	jtCVDiAYh8solOAAqsz5H2e1t+gdLAHfnoF1tfQ==
X-Received: by 2002:a05:620a:27c4:b0:939:6de8:43d8 with SMTP id af79cd13be357-93c474e3f96mr1838772785a.44.1790591091065;
        Mon, 28 Sep 2026 03:24:51 -0700 (PDT)
X-Received: by 2002:a05:620a:27c4:b0:939:6de8:43d8 with SMTP id af79cd13be357-93c474e3f96mr1838770285a.44.1790591090707;
        Mon, 28 Sep 2026 03:24:50 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcac3sm248301666b.73.2026.09.28.03.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:24:49 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:24:49 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 00/16] iommu/riscv: Enable MSI remapping, IOMMU_DMA
 and VFIO
Message-ID: <k3crwedsmlusfc4goakdviqufyrsy43s2t2cksp3vbyva2u37t@ttyx32r5f3yd>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX/w7/MQmpE6XB
 6MdpxxPkT+5d0Nb1dZepHYDcpTfwi2NqBcCz+CtJ5lUXnEDFB0Eb6flNoYqmpMo1jFy9FuGFOY5
 fF1KGjdjaQ0F9DIv5VeJ059soM8J7NaLUjR5G2r4HbuwNv6NaPvmtB4X3lABKsfJIwM3upJyXpH
 i7Qn7zr4t5DS8XtfY7iBpb67PWtp3sNTdEVmu+tCzz2xaM2gap4Iw1m2G+0aTKnNTAxAsgLsVcX
 IOtBJ9UaijVsl+RwbIa9iwT8NxTOKWWgH4e/d+Zq+xTgPLuAE6g+BhdCq9kL2jTA/NhaxbH1Lf1
 mWqL/YGpP4yI1ydSuwOVD4v1S29F5Z3UV9oDlVMSdLndGmlexOWJsxPUDP9oXIRhSYjJeHb3+W8
 872Pr8wCbHOvxMvscC6/OYvaty53nwUYpSZzaEZqjqh5Pi9OguPWIfHd6lw82qP5W7rZwDsphyv
 wPv3wYfIeWXYeyHU4OQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba4073 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=rbBGQWOvsAlMenIskvQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX15Izw4cGfpxQ
 5hbuk1+oSC++8DlA2nVjq6MyN4l0qXk7cVO5pz6NU1/JD2bBMx/JprWUjp+dY3n2jlEPEcbYeTb
 W3B5///sf/I/G4PfooQLqQW+PDImyVU=
X-Proofpoint-ORIG-GUID: E8t0HJLji5k0-NTgeAc6cQB7WwRtuKPg
X-Proofpoint-GUID: E8t0HJLji5k0-NTgeAc6cQB7WwRtuKPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280041

On Fri, Sep 25, 2026 at 05:16:43PM +0200, Andrew Jones wrote:
> This series adds MSI remapping for IMSIC so a device's MSI target gets
> translated the same way its DMA does, allowing RISC-V to enable IOMMU_DMA
> and paging domains by default.
>

Sashiko only had findings on two patches, and I've replied them. IMHO,
neither warrant a v7.

Thanks,
drew
