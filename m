Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4D26FD97
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755687; cv=none; b=k2X6Jy41yNTWs1WsgDnap9uAFmePeNfBXLHyuSs9vLrg94mLLX4iQ9IvoZzR5JrE4Sl+oN5J45Kv4rLXFFTMn37NrEvZqfqpS9KH8AB1MGYTEHpyb0MCXafeBInLwekTsHeN6bFegpJC/Ag4CF6AcF8e91wc6wXbRELOOawN91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755687; c=relaxed/simple;
	bh=eFKNRs/YM3tVCJQfBBvgS8zARI4a6CJVRm6eUkfUI3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pi7vYT1DKhfLZqQmoRyeXVQHlxroDFn0NUf8m2apBH+zA5sulvZLhPECAo1DRHKiMlabLdZc/FrAv32P6Te6TiX4nCfxZcrWqEOLFpGx1roLxNzzObx+djU04Fm7IcmBmV/5XlYnSBrGBSe4fnc2Apism6fm2KBmGqgpHHiJ93U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtxHhWEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/YOiGAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtxHhWEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/YOiGAh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDvGGb1139117
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eFKNRs/YM3tVCJQfBBvgS8zA
	RI4a6CJVRm6eUkfUI3w=; b=ZtxHhWEBRPELNFtqJMn52UtxPBsL6OaKQWFEgNql
	zyXbfCwCOsgSe3mXpp+FQ0Sfnskm6se+ptPYLR2BmzCEbu3Xmynys+p1Noym8hXf
	ZVnPNB3ip+14qit31xpRLBTWxWGJl5AvQSaVaBvXFL1BfSnku+D2J6s3xsWxOM6l
	ln3maz4Ia3k788dY6RxbWKn3MlDQ1G9Nbd+0SG4IQZS0EVvM65POeoCwTK5Mbbda
	Mp8tDVOuTMPlKQU8C3UGpPpUsvNpSJZzkpizt8+TQ1NtR/8f3EV1171ygjexx1xb
	cwv5tNfqVT6iMOrRv7UucmIEhNrWZgZIyIvqb3uC2NOg4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0758k3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:48:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52e7a49452aso5950321cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787755684; x=1788360484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFKNRs/YM3tVCJQfBBvgS8zARI4a6CJVRm6eUkfUI3w=;
        b=A/YOiGAh4eAbSTAS8nRj8yWlfOcvVxlZz7dwhQg4wFySMMlXnHQVrjw4kTGWXw++Go
         pKog9R0+K/RDNAKU2yPhEYdOP3wsqwtbSXWbaeLnX/iibsMFYaIO+w/bEhGGYKLiug7j
         p89uzFdwqNJugNy2iv/n2w26mjex4I5+lV0/1hvcSm73+IfztBnQA22zOfbNV1nequ6Q
         qJGWyEJGNoE4sL6nDv28ZwMY/u7OjkzqPkSnIYB3hXadOFAklk8ttN3RtSGLRvL6+EDy
         azqTarFpzXToYlodCoTFtOXxyJPGGfCrVzg4T1r9GUOY6Jbk5TqrFfLD2ZhFUOyU3S8x
         7fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755684; x=1788360484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFKNRs/YM3tVCJQfBBvgS8zARI4a6CJVRm6eUkfUI3w=;
        b=Evw7JE3cdxnJeZUvpytAA1rUuB0gt6jPcCnICBOVaI+Uj4T0FPUUXvwU871vOGa8PM
         kU/MPM/8dLyhlBoOYwV5hyBVk0UF8lveG8g5Vtmrf5knRIi8H74+xQrAELNBQmpwUP7h
         RP3DKX35FJMe9aJZmFdVF9khSwC3LZyw5/EQem0WQEBC85BESMJXfIUvL0ohnDUEN166
         jzmwnCfxs0BYXSzfAidk4BOOsJ6Ok8oWOtMhwCryOAT0QCggkTkCD+oh6kIqoc18oS/X
         21FEFW6c6Zj4fGccJZrBn8qaEyBz4dbpGaX4C+CdvYUokYcdwD8vRdkZ7TTuzqNQeo6/
         3tWw==
X-Forwarded-Encrypted: i=1; AHgh+RqbdN6E2qHuyFNnXbtkKrZwF11QvLAC73XtthueUUsZ4an251GvBzoosNitxMoT4MS/12WO/xZ5Dpz7ECA=@vger.kernel.org
X-Gm-Message-State: AFuF++nzGCeicatD7x01FA9wXI9rsTiQ10H8yHgLAu3IWwGcJmRDoYF7
	p2TFSvkQ027dw8reE+6EtkmoJOqg4xfXE33HCecFj0SKvBiwPba4rhGk03JK6NgJJA1yUrsunql
	4jkHWKZmk3Z+kDtWeduRd+Scyw+23W8PTjgR0N7SEAW+Ueikt/RdGpNsk7YZsfYvs/MI=
X-Gm-Gg: AR+sD108qLR3q/bKTP2i5xjpEJo1UrpqG7iIzSq/LXaYlJMgYzXJbTJhD7gp0seHtXH
	Vw+Su+JDhQ9EvpFOPgpqkLudxB1m2ry8+BcqxRv6KnXb7B0Xe1nCsNaXWM6tBL2obgWZrQMgzVo
	7wQLnTHFBm49rVfBCxqDA47rcOLk7YZNc89O+k+Omqsl4S0jGZpX2dfSJf1QA/t9TPrEEvHHn5u
	3A6/QDSfABxHOO+4M5sK5bJ+jUC5yjIILfSMmU82cpu97I40EpeMC4ReVdi4rYLGTN7UF/fgYDk
	Aiu4fBiY2gLozf7L9Mvw3oH9nI2tnRBGQ4zNjt3etMUnYnuAkROuaQX2phAnhEFPZomjBBFqyKV
	K+0VrGaJl
X-Received: by 2002:a05:622b:106:10b0:52e:467e:e9e5 with SMTP id d75a77b69052e-52e467eecfamr31370281cf.40.1787755684341;
        Wed, 26 Aug 2026 07:48:04 -0700 (PDT)
X-Received: by 2002:a05:622b:106:10b0:52e:467e:e9e5 with SMTP id d75a77b69052e-52e467eecfamr31369441cf.40.1787755683714;
        Wed, 26 Aug 2026 07:48:03 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc0d6sm3053781f8f.18.2026.08.26.07.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:48:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:48:01 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <gzgrgpsnku7npueut6zjel2gb6m4g5b5mjdohlyamrq6ogswlm@6mh42uxi4imd>
References: <20260824125204.GP244917@nvidia.com>
 <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
 <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
 <20260825175901.GE3325090@nvidia.com>
 <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
X-Proofpoint-ORIG-GUID: 158pQhXBdoCZXBm1BQhJPce0478uXw2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyMyBTYWx0ZWRfX9G94+NBK7KAS
 hnUI0PmMAP5GMjsVLBDGmCP4T2NGMs4Ustps/nex+3agncp9O7VO0RQ/NLWkMae3ZqUx2POkHFp
 oXQpd9MgqY1CsEgB2a0q0YU6b+DVhxzZxK6XujkQuv18XAYb9jPJOxLAf281YdqmnUe/Bflgj4I
 GV6mieLUzjWz6K0sUTWHylHEgCRso2Zgi1D/ukCArgxgCY8+0AzAjOwCBUeXFGbtu5NcDFNdLE9
 6pM2zFgO8YNRxWrw8kQDk3GPwERhS2TBC21UFHetdBXYH2WucsOBmBLpHY0KIwvga2x8UtBXGr7
 aflodjBY69ew0/KudOWAz4K8wUeMnWAdr9gZ5DEOXTdHul/NnlsP6/2hbpp7f/DvLyEKM3w4SYN
 lfHYNv5Y1hZVDIRsWrYkGEIe5FtxBXLFzli6plHrQTxl1F2MF+JfUyIfsNvnWLDRYn6IDrvgejX
 Qrru+nfaW46O42IZ0Hg==
X-Proofpoint-GUID: 158pQhXBdoCZXBm1BQhJPce0478uXw2Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyMyBTYWx0ZWRfX9vD2obUm4gcQ
 CbSEOFgI7x8DIggbAXAhDzrykm0zAZtcZo0kIxddBiiiiM/9JAHlf9qh0rmEbLG4iLLc5z47vdg
 iRF/1UbBxhH1qxsePMbmhVfJg4XMkn8=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8efca5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=K8_gVM2FpOf_7PldHO8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260123

On Wed, Aug 26, 2026 at 10:23:20AM +0200, Andrew Jones wrote:
> As said, iommu_dma_prepare_msi() handles one fixed MSI target. RISC-V
> has one target PA per IMSIC, so the proposed list API prepares them
> together and guarantees contiguous IOVAs. The interrupt remapping IRQ
> domain's compose callback selects the IOVA corresponding to the IMSIC PA
> selected by its parent. That selection belongs in the IRQ hierarchy.
>

That said, it should be possible to move the host MSI remapping into the
IMSIC irqdomain. I can do that for this series and see what Anup thinks
about putting it there. A per-device IOMMU irqdomain will still be needed
later for guest irqbypass through irq_set_vcpu_affinity(), but that can
wait for the next series.

Thanks,
drew
