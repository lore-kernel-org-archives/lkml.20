Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.135.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793985490;
	b=PfkUsyXx5qCN6zFF9YvgFKiV0zVfQOa3BVjpaQxmQFqlg2PI8VHv+9FYXktdY3uj3gme
	 wpBj81fzht+ucqcXm0IXntfzUUguBdEhpal2NjSX77gcXBNOoy+EyYXnD1D/vsHDF/F67
	 vjsAW7psOsPX9pZl+W9U7QkJpw0nM61z7DFwAM9VjjdUubAsmx0HQnS/D4RipxO+4Qkdq
	 EKdPCNvbCuEVcCKfdi4ilpt4d0Bj9PTZfhuWsMXpuTxsJ9+M3Gf5ERQWFA1hOCJPSvD1z
	 3ABNDNCMNTS4zgmPV3NTndBpt9Y17kRUYyqjvLrKoJA7k89htCPl4Sv0gWxVBm8fgKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T59m8WXKnLMZksH0X3OIVWtfvJ0HewjqtyBEFa8ziT4=;
	b=0HKWDtSHCO/8PoTrd0eEBSTT8zN8suyTGjNfcpJCoysWot08SE+YS8Cy+WowtT3A2vU3
	 6yIMZX2tFC+iaFB9H/tdEZ3goxUEKohg6NzedAGOEPbV4Q6AjVjIayCMmKVD15fbdvnap
	 1+JHhgguK0TNrmMS07Qjr/tsr2hO5Kxxlp1ey31cQAQDOb1ZGD+ytE0e+UP98o99OT4l9
	 UmJXPdg2JRBUnC/qzzGFsYWP1hq5sfxUZHFAFSm3XN/i9xqDKdfnbTm2FPxvjj4h1bPte
	 kmbm1LzcHcWpUIMyy8ZVhpSCVFhlsCr4K28rFlXa529u8RKWTs34AKLewthyudBrRYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kHuByDj0;
	arc=fail smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B4606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 454B4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kHuByDj0
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Fh7mH2244676
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 12:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=T59m8WXKnLMZksH0X3OIVWtfvJ0H
	ewjqtyBEFa8ziT4=; b=kHuByDj0/YKHgTsrNhhmedA/FP7mqZGT62dRvXg9HauW
	gMDXV8u3jnw8J/ppSffjbBmhjR9FkIx0Xom/frHFEyHtVSi1goB/BSTlcqSchrXC
	6jMvdcldqNdUbPu4DAvgWToTSzCJIPBYi+yPI8++eJ8IRtKJHiwN1Y6gWUIte5lF
	BfJHkIRFyabKynbxbjYeeY9H/1oBQzjRcLJPSH0t2CufgkrzCB7oIsjcrnSYipOG
	QclCid9TTrSlHujzXSwdlDiU+Lm9V/LvMw49Na9FygTqG/Bx3dvgIbTx6lYXwR7W
	GHipks+eota340S1R1pnBuF0brvaw4Af8cV6C2dwvg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pbn2ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:18:08 -0500 (EST)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b347619fe7so11386837b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985487; cv=none;
        d=google.com; s=arc-20260327;
        b=IqYAPZZRJY2/8ONaATVm22i/1BitNtxmjGjMe8olRizO09noQx39ocp5PQyD9cQam/
         Z2oE5IZ1E0zDmimPuRXXaWy4g8Fc1Bp1M+FQh8v0cwHgQEsZLn/vWkraUBe1txgHtZ9k
         c3GJ3Fe/+Becm4vS4HJvPPZiL/EREZy7s3UeaM/uXcjH6LpF9P+J3N8V7Rr66w7l8Zuc
         dDbJrFdiMPMEU683XmMpcM4w10kRHq8AJBxgeF3hCKVG8O3QHMY+xLTKECnO5F6wfGDi
         y6ysqrTRPLxWhYIlBBB/958k/HogfCRabXgBdKsW+6hIQOM/WnDU21wrOF2aBpNHIiKU
         Du8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=T59m8WXKnLMZksH0X3OIVWtfvJ0HewjqtyBEFa8ziT4=;
        fh=Ivu8iL9VkS5liPFM7EFNWafbYMo6rn/9E4cP4EbWV4I=;
        b=odnDtuh6kUlpmQY2sqy2kZVfNpmxGvJ37C/B/3xHAEvjVOuE5c0NsXMIs/Y4eM/9RN
         dBjX0PJ+pZ/QtmSBbo73WiaKVlbsdzwSAaGtr3VEF6CKLG6vM3wEcGLMRYZTBZWIilrs
         z9TG+XAhNZE1G+8+nM3nzruapeQTgcrrSjgSR/S9U5uSIr2b2VyOUInmOCsXqrEueHoZ
         USZZFYBqlQhIn0d+CI8EB4CiwKt94CDO6DdtsRZxm9TLx8sB/Xp/5RgrLHivnU80X8aI
         jjxJpTj6O2f0VGODC+gs0ysC3M59ZAUA2HzoWhWZshOrpasCuZGnO4kzQnPGodEgHOdz
         zxsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985487; x=1794590287;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T59m8WXKnLMZksH0X3OIVWtfvJ0HewjqtyBEFa8ziT4=;
        b=PZ0Odv4XrOjHE8ZXrQ8orIczzyVX5gKJNvHN4n7oKKCDnh3JPoMjloCsI4Gyn/LTmL
         5PXDe9B7SIxcuRzE/dwSUzROwgJ1vBRqr3R3TLkUU99cZUW3DtfJ1oqFpK+Dg4mL2sw4
         bIxxmOTuQQk9mQfTz+TLYJf1yKTOZMnG6bos2mfOn8euOlZqiS729p5/fPBYzA2RSiWe
         Zwt+Z6cIWaY98pW6d1xXsEHnf6jRa3bD15yn8bnYhRKUJ6aj06Vo/Q5RiCD7s+/pbx/f
         NVbVgcNnyRewmDelXCVLDj2s/cwHaD3tUOEG/LlXGdCB1raUQ3kjANhGubV321DBjeKU
         GHTw==
X-Forwarded-Encrypted: i=1; AL+hErF1nJcFlwLATg2HJyVkGEv31+iqQe9opo38GaUI3pJy/8VrXQeCmNd5fidkh+XZIQysu02f0lxTzlk4qjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MFRmeQwpb61zKHEoWsU37TME1D81H5MWNJ+qsukybeE7u+85q
	ys4bwZvjSRjsTbOmcxBpVoQnq3a/FRpm+rhYDKSKwu/mx519sFrHSd1Mf2Jdcwq9tMkeJIQyl7G
	AyaR4jOqkSNaTi3sXHfSanrzxbeVc2BUi1uRSNP4YvWhNuFOeES4JdhD4E2YPd6+0035Y8Yw0p6
	UzqWvWR16OLTu0X59jn7b5YshSDkSbdTwIclKZ
X-Gm-Gg: AYBFou33kKw1Z5tvTHn/ygeb+gYpoBZWbgp6c9k+MAlFC2uIKYqHZheNQZJIOCRaMF0
	4IGGCSchqv4LvrrT0k2PuJD8ztF1wjGq0Zun3YQM3Y1heNrys1uEh0RC4rwB/YjKZlMNiYfAaDE
	0/4Z4a47VeuLTp/kuI5rR7jIx34JGXIpfLL4/MpNnhotyVlARExiEwpWgukEfkb+DWggnDgwxo0
	MuMAR37la+0xIko0ayyFvTijlc2molh7bE4oAOfLBf18/zf9iT0tCzrjHvA1zywShxjB4c4RWbn
	TVN6TJlKMOGNObJHse15K9v3ZxivUXf3XA==
X-Received: by 2002:a05:690c:38b:b0:8a9:e801:231c with SMTP id 00721157ae682-8b3418de960mr15159307b3.20.1793985487305;
        Fri, 06 Nov 2026 09:18:07 -0800 (PST)
X-Received: by 2002:a05:690c:38b:b0:8a9:e801:231c with SMTP id
 00721157ae682-8b3418de960mr15159067b3.20.1793985486807; Fri, 06 Nov 2026
 09:18:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
 <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com> <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
In-Reply-To: <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 17:17:54 +0000
X-Gm-Features: AclHuK_9svrT6wKNkNHEsIMr6l5W7zWgD8S3IUtPesXe8MFok8Z1sXe3kPtMyT8
Message-ID: <CAPOPQMCQfYWRDRvo4PPFW0RAyqNmns6TqS+QYE3-5SM_NFRMQQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX7fOhIyBacpWA
 ggGDTndq23HuQgu6gM7JXWJABiLpalpAMss64tx8d0y8rZJr4Jn4HedgxnOWb74uVOMyrS63v4V
 1hf0/XLBqjn/0joa62xyEj/GiXjpHdlx++uywdCVoTWh9SsA3DE4
X-Authority-Analysis: v=2.4 cv=C/F8WgP+ c=1 sm=1 tr=0 ts=6aee0bd0 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=uYC8CqauRjbKsmU2jI4A:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: mYuBPejDG_WTc52fPxaYAv3rETlB7qEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX97J+TdCsteUS
 iG2iZ6xhFjf9ORC2xXinz1Xs6gI+wU/5ITuEThC38CIlr3/BlLC4uHoayaf95DRDlTI84Ka9WSG
 WsnNXTYp6dEgk3Qv1gx/5k+lX43PQwLTP+JeUgCmYmTDO14ukAECEPwD6yPxaGoD/t4fO4abZz/
 mhTu6eWNakTstU14bbAVhOemluTqEZFGv+VDhL03GATnktaj5EZbFSDJ2hOEukEd6KKxz+lMq1E
 aWrYM3DZCS0L71FizbmBFF+14SJIck/L5+Eo/8pj4inw/sYd8c1tMasR1KmEc4O3c6z2J1wY3DO
 LN6jJxezQJ3chUbvSR16dKqBUHmoWf6B5bpBHOVaKTaCby8M8DxQSv2DCDtVC6lxgcaljoucIM3
 hAJX9R+AFDuKOuvCf/xBgsl9u+YwXmpg7whLHUlUrnip+BgHvBO2UsKE3owG/ZWCECls4oSJGiD
 pHRYC/M7/EU5LRpS6XQ==
X-Proofpoint-GUID: mYuBPejDG_WTc52fPxaYAv3rETlB7qEC
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11958
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=10 bulkscore=10 adultscore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

Hi Fuad, Vincent,

On Fri, Nov 06, 2026 at 02:34:55PM +0000, Fuad Tabba wrote:
> Actually, like Vincent pointed out, why the WARN_ON(). The caller can
> just handle the error.

Makes sense, I'll drop the WARN_ON() and just return -EEXIST.

One thing I noticed: the kernel-doc of kvm_pgtable_hyp_map() says that
a mapping over an existing one is "rejected with an error and a
WARN()", and the leaf case in hyp_map_walker_try_leaf() still warns.
Without the WARN_ON(), the comment would no longer match this case.
By the same reasoning, should the leaf case's WARN_ON() go too, in a
separate patch, with the comment reduced to "rejected with an error"?

Thanks,
Xuheng
