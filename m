Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C751E431
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117628; cv=none; b=t0mc/Hj5DDVlGYV3VINLOFr8ZTI8Zj7wg1V7e4WHuW7DZ8iKyIzse8n/wg+EHx/TdFUS1b91wkVllGsNJnZ5EN3Bm4f9xwLYlhreTNkNbSyoEdu7mMvq9w2fJF8cOYXc2u61o0XMGCGY6ik/TTOpJIdvJywM1xXamMP2JZwoero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117628; c=relaxed/simple;
	bh=343dUSnYOysjpy5fyuWntmT3fKeHN580Y5d1wxsBcrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruAj5R9Uj3rpnCELUT0nhPcBpGpl+uYWLLjdidrcY5iHM/ed9pRsWm9rKzbB6gppTdptZP7hMU+ddrUG0kYvhkn6NMN6oYHVx/+F9gCG3PjDiMWGzz8r1qZeqXAJlx94zZ+cZaK8WWHk0saLUiKC/aJQLg1vOI1O20JGF0rXjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0jMB3y0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGGekFcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0jMB3y0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGGekFcI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7CCj368041
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=; b=T0jMB3y0rL8j0v0n
	uLQ9L1ct+DF5ggyvqScz234nKNMbEy/2euOzbMqYlNwebz2EMqzizBoskOik5kaf
	5OJIIYXDaGGMxfc/PbxdMF/xa4eAmIHoSu9t2LwPE/BrNcUHf687+RrvoMq3mckU
	/ss+V85KBbnPpfroU9jjsSPT4EiBw2ScJSrw60JNNHk8Q5KBD3+Z74OtnL05CGbJ
	2BeU8SYiC6J0gBkULd3MqUx1qpkZmxmzDe2RreJezeE8IQmEu82IDQQkZ3jzRuJQ
	Y0efI4/JaTIRCIlDteaRp6xaaXgm7pLAJ+UrhwjYelKZ63sE2RpbOoQaT9CkoG7V
	Rz3sNQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntbbn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:53:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso351495eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117623; x=1790722423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=;
        b=EGGekFcIbY4V2Avt8/gB6+3uN9NB5PQmYno4D0569ZocGM29NqBz4SoWJS3Xmicxgo
         XstAwry+LR2lT3+5XrknJTFMFeeymdPZ8S16KxT0mw8NLzKwOu6cxNRW3LyieiwkM+HR
         BqHYPANpB1a6AxaBHn3MIbRXhoYMqir8CMcaT8LmQB+usVwHyevQDbVvCdXoGDR6Et3i
         vbh+79yoxFzIDC3ihZyH1NvvX93YJR1eoDnl3MibFtUU+JtMVnjgQDHyjnyTUy/y1M7B
         +dwt7nu11yFuP30npeQBEfovz1ek5jFrRGg86DEO7HNyND7Rb9Xz/x3d/eevqflW1gdZ
         4D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117623; x=1790722423;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=;
        b=egyU2FN90m09brzRHU28NgV1D/bZ28/GPCg22cIPJUCXnsJ0hiYRqzGmSJurIHH8V5
         ymWw7rtuxI9Gaq4btCFCaGb9Xs4JmAULENfmNkGL3Pn0jD2BHweaFtLenENxxCxIYgx1
         iQ7Y3o+s8dUIhzqIJg7A+QOqwhL32QvMldCYzgFdnmK5qZ0bmQwldl6+DipPLAY3f/0D
         PZzauK9p5lBsGDcDwtB+66EVxjqtFNoReo5UUWQngPJIlVKLsOzFQjcsIcFeXRhFbj9I
         pDtBL5RtKFYDdpY/BVlG+eOEcgm9vKVUWPSAPtz3xrH2oNsfaHEfCaAfFdg6ehfAOBK2
         tzWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbEYtVGxHRUYgzFMaCR61M63ly10xvkE4ipmyaaaAlp3g7Qguq/E+yJs7WiWMv+s7aCNV743GAQqzUk20=@vger.kernel.org
X-Gm-Message-State: AFuF++mgr04I+tgZMNnokzHikCDacMJ2K0vCqzsGdh0tdE53Nu4STw+y
	SxLj8XI9/v+JP+VmjJS+pxNW/IlMnUQGUCkhUnMkTWez+hEyZ8Jikse6/j1yvTdJy22HoHRuU/l
	R9jrvtd6gonKnH6FpXi0cwyxM2NVScestMQVx/zVuTaoOKHNgAq6WPKtsyNxi8bLKZtY=
X-Gm-Gg: AYBFou1Qi8drRBS/ZxjWESWoMC4fXwA71VSSL7mUJeCTYJTN+E10mGp6408uDMKsJdz
	PXHNNn6ygrOfvlPW5kQFZmx2+O4iVS8gC6NNup+MAIKEN4eTNOkMYwXlPygm7EgPpA0+hfWICLD
	71mq6+xAz9mr2fK0CFcrtDNUVQTjgnPRHcv2FkmnRfswcEVkFAnvuyUXqdSAbOf6Yw6ZmiVKDxx
	isJbEdOa6H6ELQbsn3SJkIBCIjHC0DykaDz9+dJQGcaPafZNf6cKdDveuqQ3d2Ipqx98sjdpizv
	R1GzPIsjx2rpyL2BwpeKw4zoSYdcnjl4TYtM4tZkHPMpOV0JDHWwIKsEubkA0dhmaYnI/fur6f2
	EGmPaz6dhs5voOriGFlDLkvHoxk5KTb3BCPIPDhn/LdJSbhbTFjOaFg==
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr868834eec.15.1790117623111;
        Tue, 22 Sep 2026 15:53:43 -0700 (PDT)
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr868793eec.15.1790117622505;
        Tue, 22 Sep 2026 15:53:42 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96848e18sm1178819eec.17.2026.09.22.15.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:53:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:53:38 -0700
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
Subject: Re: [PATCH v19 16/20] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
Message-ID: <20260922155338.000064e5@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-17-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-17-suzuki.poulose@arm.com>
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
X-Proofpoint-ORIG-GUID: UtpapmwUuL2TnYV5T5c_985hi8cRLVsl
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab306f7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=z_NLTHdx8yjNkCs6FmoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX9w2tcLnYHXzs
 cUXpJFqdWl7Z6d77Pr68B9W+ebPvEHXdSIYCFyIHzEttToYahhOSzrpgyc1DJkv5jya7go+vcuu
 b4CiBfEcXW50oAWbo+zGD3i3q9AwGY09YSSEesXjRQ64MzCdMaifBU7SFYCbQB19o3Dce5znd+Q
 tQu/I4rsVSpYnP5y2GUxr1XzR8Qt0ia8b9VRuhM3pZYT5A6B7iH4GWDLy6N7/RNuWz/vd4/DmPx
 Dh7CP8dYMJPC3G562DW0Tlwz1b4WnmAbBahnXuhrQazRmIeKErIJDCzPHBjiIPBSJg+ZvHtEG9S
 4Yb6r8JyiBHRWIaYWml/GeLjMg9stHEnE7u0+tuJvGpvtcjnfeFJvNCfokztGT/M8a+oYT2g0xF
 bo5dC79x7dx0XfhYdT794u9vvMwhv1DDGKXadpb/vk9aP1bo0bzVAqpTdhDtxhqcsc4rR0sxgq6
 KNZAYgaUnxC1jeMdcFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfXznwGIdW2d2Ie
 e22kL//Y/y1/ITV35BR/VFJ6ZJuV5FqS/Me8QDiowUS1DiMcCnzUjR9VJr2QeTYovrkM9+cGo5y
 ucG6JKpatKlYYwIXO9dIYblWGH2YuQQ=
X-Proofpoint-GUID: UtpapmwUuL2TnYV5T5c_985hi8cRLVsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:41 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Limit the capabilities that are allowed for Realm VMs. Similarly block
> the vm_ioctls backed by the capabilities.
> 
> Repurpose the kvm_pkvm_ioctl_allowed() to support both pKVM and Realm
> ioctls. Rename the helper to kvm_vm_ioctl_allowed() and move it
> into arch/arm64/kvm/arm.c. Also add a generic kvm_vm_ext_allowed()
> to handle pKVM and Realm capability filtering and route them accordingly.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
One trivial - otherwise seems fine to me.

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 86e705330d7bd..eab8543a4194d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +/*
> + * Check whether the KVM VM IOCTL is allowed. For pKVM and Realm VMs, certain
> + * ioctls are not allowed. Further, certain features are allowed only for
> + * non-protected VMs in pKVM.
> + */
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +	long ext;
> +	int r;
> +
> +	/*
> +	 * We are guaranteed to be called with a valid kvm instance, as the
> +	 * only caller is kvm_arch_vm_ioctl(). Catch any deviations, as we
> +	 * rely on the kvm instance below.
> +	 */
> +	if (WARN_ON_ONCE(!kvm))
> +		return false;
> +
> +	/* Cover both pKVM host and Realm VMs */

Comment is a little confusing.  This is the path that covers everything
other than those two.  Maybe 'Rest of function covers both...'

> +	if (!kvm_vm_hyp_is_distrusting(kvm))
> +		return true;
> +
> +	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +	if (WARN_ON_ONCE(r < 0))
> +		return false;
> +
> +	return kvm_vm_ext_allowed(kvm, ext);
> +}
