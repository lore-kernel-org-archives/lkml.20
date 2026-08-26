Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE71472F62
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767931; cv=none; b=Qa/gY8RQRa+KEVFSPU3ESBhCkPXbO8GJ9/bg7jvpQa9T1e7a1VIIpPuyfzQI33Tr532vrIeFyQjV1s4DnN4SP2nKCTtjux6h8etEUE5QdaPSCE4CO/+4oDGdNSPGcqG586bQ6QyrVa2cBoCfPnqeeQBxHV0NTeNkcZCYcYXvPkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767931; c=relaxed/simple;
	bh=U6eDUay/b/Eqbeo4HNFmdbbykpl4I5CvzBRP52g7Cg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/DeuFBPZ1gEInaYeBWJ0B3aS9NEHj3LATrZpS8X5V0+DJpZnudhZirASHtUbTU6PD5klCpOjMHTVqAGAmY3P1jJfN3k/xSIOV3vrV+TyT5zgNcYKFWvE8nIGx09l0LUXxVLD1yA8W2sP3lJz5xVyZmMQkp3vQ7idShIxNhbEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mut5g1fb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dr7jKvA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mut5g1fb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dr7jKvA9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuh4O1408709
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSVenvfxBw53qjjuZWr9MSvP
	Nm3bVPnT5i/8UJYBkTc=; b=Mut5g1fbLlR37Uq+cSyRhoeRHz9YiuCYrHbS7Ver
	mY82Pd4jblSlKnVzgw8WAYn4YcsNFC92IWSF06xmRaNjlgphDGRNS/5muiYg+Hn6
	ZxqLkzlTf4Az3pFztC2svtbwN3u6PXyiixH6zztdbTUuN6ZLy+kf04SLUCasCiLd
	BldZeHABcIzlAeBhT5wW7Bw/BXrHRLc6Q7mJFSjMAoho1xADoWBYMep2kBV8Eqcp
	LY5haTUWvPWZ4+Sko9AAkeQ0UWeoqRN87mdqmi0h7bHes0dLGFhYyPeZQlkxUcOb
	4c/m1Iylf+MVHBobVVsKtrDdDk+dHSEgLJPR6g345OnUVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n1wdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:12:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ee59064d2so2354951cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787767921; x=1788372721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSVenvfxBw53qjjuZWr9MSvPNm3bVPnT5i/8UJYBkTc=;
        b=Dr7jKvA9X01g7cPjiZvbOJD2+0GXfMAzWGQX9166oozYpvcBUoMcou/7dZkkOU+8uE
         lpFahIIZQ7XjdqhTZK2I7nRqbNbrEN/pqsc3zAzxgkJVOcsYL7FeJ3QY85tGFBoqEyP+
         qrK23h07qY2VkjUcIDsTPJdPpGpvSE/I0VpKaUP36e/P5WQWsuKo+p8mJRA3ro1tMk02
         CWVfdg3WN9lH9EFDG/+9XyGQ6qryME/owXn+/tpnuT5QHTszdzMYPN1MZOeT5tWfEX5y
         O0SXdrfj3L2GbgbNYJoTNBS2q37u2T0WGbQM6GiTpImUE+SqkVmpCyzp7dq3xA4apolu
         s+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767921; x=1788372721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSVenvfxBw53qjjuZWr9MSvPNm3bVPnT5i/8UJYBkTc=;
        b=frtzevpzw/SwxIQzobvauTlcF66sTJSUSkFGxTblrPtYv2LW/tHlyaqv+H91ael7+M
         u+CKw6TjsZSZgTsbeg3DAm936ty4XTqLy/019+nKjRaq/xAEf4NF6e77er9sgKwvS/Yp
         VHhmfCv+XcqnzHeXV54Lt4BcLw7uXlTPvxcI1bIBYZyOT49fqc3yMg2FI6WXOm+rlP5B
         PjwzfnqIibiG0roETW9fDSp3za9hYmVlMA6ujXT1bJbmKQCPzGFPdYYNmDpziDzO/6HU
         ZbtZ5Amy83Z/mxYFpL2DvcKyxPu1Vc41BoOcllvz4AUO7khPTdBzTR0Cs1rbWLNhMlmL
         tz5g==
X-Forwarded-Encrypted: i=1; AHgh+RoK0JZU4W6cIpTCFl2sCfvripvpN+x6lV0HxKehPJqKVcP2YQrDavRKWINF0R0sLgmW7wMYgnUph7lgilQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mCLMntl8lsa9EPIGqMMSkD6h5mMrmMUsriOzVTjrw1w6jKYFI7
	HPXWqdpu7wKIhX+ssxiFXziWxme/M+6RCzSgDfvdMFsYVEYg0sfjCTLhTjv7icPyZ6NiUV84kn5
	Ulu2r1S8BvAIHnMu4nbGCwORLJqmDod+nrUzEHOi0VXkMMO5XDg8tfKqtRxQp3D9RUEE=
X-Gm-Gg: AR+sD106/rsBemKoPeQKhtXuCmKsJRoiWauvLBqrsRk8kL+cy4S2D65SfRIrvu0ZyBC
	IRue2d52VFtTc0pppZXrzAXM4NKJPcUmesruMnAaR4nzaXFev4TUrFGBGBPvL7WFxmBYgmZRslN
	9hpquMWyJNXfWMDKmGsz32IgQXFYjsW4aDZ2r12JprpWHwvIEYkJy1aK7kNs/EaeVhM3wy6JZsp
	6qBq/BMI3s0nJ/x62TTXvUX4dW2kEAI2v3DAVRiYZBpDgBRUL7vHwdTkpy2SfrXZPL5JDal851z
	3vIQUynrJF7QiI0TRlFHM8gyDbsRRTYKcWd41cWXIWBUfgY3b4O3/TCxcGY2O84VHiostWTEdhN
	DSEVBJM8p
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr11665601cf.9.1787767920744;
        Wed, 26 Aug 2026 11:12:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr11664871cf.9.1787767920295;
        Wed, 26 Aug 2026 11:12:00 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499fa55f458sm12784615e9.0.2026.08.26.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:11:59 -0700 (PDT)
Date: Wed, 26 Aug 2026 20:11:58 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <l3xyzbhqfremod6swwiks54znvoqy57hmqpsdlpcji5czjja4w@4qgiuwhwlie3>
References: <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
 <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
 <20260825175901.GE3325090@nvidia.com>
 <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
 <20260826163234.GN3325090@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826163234.GN3325090@nvidia.com>
X-Proofpoint-ORIG-GUID: yX4ObqXPfWvLnJgYNqeuXlQgVu-IGxGz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX+ixlD/Y96p9J
 rOzMGSTAn4H9a4y8U9XQp84TSymsZi153wz99+z8wh3kSHX4GX1WV+ohTAJ6xg+Ct1cN9zfraWN
 PE7mfFq7IS1XB14N+pIlfDDltdBpWOk=
X-Proofpoint-GUID: yX4ObqXPfWvLnJgYNqeuXlQgVu-IGxGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfXyOuqfcHDDMY9
 uRyHJLzRIsAhW3i3wCn7vy2K1U3TsNlyvN8qZ9fOGzZQ3s4mf6svaSuLQWdb7N8xhwjTrKwd6nu
 UJdPFUxbYuCotdlOzd/Ve5AN7NFm/kIPHv2O8HIoSxyfRvEf9FO1e5X4fRx/l/TAtUUgGoyTE7U
 J0kPJkn6f8gKMhryJunW5lZuuGIz7ACBuKg/vAk4eYtJc2jgPu1WemT+RAyBGHfJdw27CBxllRo
 TNIwrK0cCnzQZWF1opkSTwhVLLUKaYSCdY7ugnPBa/kl5Ar5gQLD84R1BrS/wgjJojhzucqlPSF
 fDmvfhlbgEjWuhpzM7ntJqPTZuAxOfRexkCHF3rYxxCRK3bJqfdfFjV8RJcZ2Ko3fcrzy/aGr2u
 4dIdzr48egnArJ2zkSx43s3tG+huGAebhXqZDhFy98hd5s9BzLSSvDsPFV6Ipcvf1xtuRO5cgYx
 I9rKtcqmJMz2RPakMXA==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8f2c71 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=b5O_Hy56fsZqd-xyW_cA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260152

On Wed, Aug 26, 2026 at 01:32:34PM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 26, 2026 at 10:23:20AM +0200, Andrew Jones wrote:
> > RISC-V uses the same basic model as x86 (an IOMMU-owned interrupt
> > remapping IRQ domain). x86 makes that domain per-IOMMU because its IRTE
> > resources belong to the IOMMU instance. RISC-V makes it per-device because
> > its callbacks operate on the device's attached IOMMU domain and preserve
> > that device's existing MSI parent. The IRQ callbacks provide the lifecycle
> > hooks, even though the mappings, MSI table, and device context all remain
> > IOMMU state.
> 
> The irq domain isn't per device, it is per msi table, many devices can
> share the same table, and the VM should have a single shared table
> across all devices. That's the core uniquely RISCV wrinkle I think.
> 
> IDK how Thomas would like to model this, but you will get a better
> result if it is very clearly explained and asked.
> 
> I would like to keep the iommu out of it, so I prefer if IRQ code
> patches in its MSI table pointer broadly the same way AMD does.
> Though AMD doesn't have the restriction that remapping only works with
> a S2 domain :(
>

The per-device irqdomain model allows multiple devices to share the same
S2 IOMMU domain and MSI table. Unlike AMD, however, the RISC-V remapping
state belongs to a replaceable S2 domain rather than the physical IOMMU.
The IRQ hierarchy must remain stable across domain changes, so a stable
per-device irqdomain which operates on the currently attached S2 domain
may be the closest practical equivalent. I'll explore this further while
reworking the irqbypass series.

Thanks,
drew
