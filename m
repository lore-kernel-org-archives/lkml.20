Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E4D3911AF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182107; cv=none; b=GuLb58y3ukkoHwp9amsJ3DyD2a6jpARYhE6OPjc5MaSiL3RTmdEksyhvBVE6XUgooLczyhd1Nd75gLZ4PmJKv3uoeK4WIxhNvFzrm7yzO3luoaMGS0Okb/Eq+D0d5RcrohF1SamZUVplM5ZSliYx+mCZ8GJibDI99x6VogQBi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182107; c=relaxed/simple;
	bh=CGiWjTmGXAl6+wWuNY52mdjGBRHixUk9gnSMpBDzaVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QO7857FNvm5obyyLq52lmDyUNqrlXg9WN37ZQeiKOGXc6sFnjIjaBeBeiUEqO2pioAx1QWR+7MYlHeUk7L7MEI8yloVbdjYN1F4ra99rAKhUpE0mJJV9ijbM2sTLdLPbGJI+fppsm9FY6Et2R1r4WfzNuJf7mCA58RZ/DO4Xtz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwURI9u8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9cqnxOO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwURI9u8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9cqnxOO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTkmh3665789
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GGpD9bCLKwKljw9siihHkGdhbEHAKmKaI5FQZgKfS0=; b=HwURI9u8gOqsxzop
	D+O0P9O7uAoodVx8vvTnFSrFFdCFGgLgCpPcV8vhfjlglXwwOTzGnkKFaxkC/ZBE
	KzXKfya286vL+1P9N8JySDE3wy6BG/elusP9Fgzp2Cw60YVKuxkWrkOedA1JBIiH
	4MnTe3LupfJ5deFFxg2KXb528bKGtmwd3T3Q1YvyHb2T/DQceHMfTevWrE0DhQ+w
	wWdGCRmLV+pIlJ7nEdfZ5XCYUCjXDDzqeBrWD3zhxcQcyRNajCmY3qyEyaEgcAyA
	pyuKK0MX4yCYcvIuF+liPrfF9DrP7C9sn5MGqHusXYj5hCZr4UKG0Cm5Rv6IJhnx
	oo5Wdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwasx5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:48:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1587701a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790182103; x=1790786903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4GGpD9bCLKwKljw9siihHkGdhbEHAKmKaI5FQZgKfS0=;
        b=L9cqnxOOhqsgDxZvuZA4BcWxa16QFCgKjIyCT6QMuLQo1Odo6QSDxb0b8R4Y1hV3cb
         I1JkVEeDPxH0u9KFGxQNWlHHg1KfIDerzxK/tPfxYs7E2/zXZazunAWJYFFcCTaa5d8E
         Ansc61zaub6a1LsIWWsMNdE3BinkRO+0N6WTkuJ98fhysHRWXUqD2AGVkyTj5IAsNl5m
         Zi8RYK8lAedK5OwNynpfSwwtIYKKigS98LpygE1cEqGljz/Vn6bAOzbtHeru30Kd73cF
         QDnCt5qEKgTpKkk/jiHoIwmvogTeJU79qRxRWzyxxRVBhA09k6bUPbejRZwQ0uEMNeGq
         /PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182103; x=1790786903;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GGpD9bCLKwKljw9siihHkGdhbEHAKmKaI5FQZgKfS0=;
        b=jGTh8mcIQWesi2hO1fOS7C9j3CIKEjOYp6JIFMbNWj4YbP7qLU8OL/S6+P34OYccLN
         UvVa+csMGKjlRsB23tFsiFtKh1hwXFz9UqOmPr2bfDla4uy0y0uHLFwYobjCbjQWdV7E
         CeBk7WB/uw8X8RwHBd4JoUEAuQy4V88YTYnhoM8ZC+lxldYaaD6xXqXhbdrzDm76B6rz
         gOeYvTEFuIRsPyqiXpjHQdjsds9pn3xXR5QSoJT+LwiLY9JqA8THr2Z3RxkK0dRIaDym
         YlXNp+pb8s27L1Wb6wjUHALHdrwrcBl4qT1V3KEXpqV/myIKbrCRZy+oLzohfPvMc4xX
         en8Q==
X-Forwarded-Encrypted: i=1; AKwUvByvtCZwtANCMEPeuGcXiL6wlDgvFXK0MmapWXuYqS6D8V1EYRy4jhSSA6YsW+y+QN6ZpZD2gUGHebdFqd0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHwxjDN/3GvZxhsPauOk1ydYese/mwBTf7+LlJmQDPAAntkuHe
	X9sml4MmIrT50ngz0GzURzk9LHKEG77nePt/nx6NQsuqwYYzT6OrfIN12lfmRTw0NTMBmYnV9GU
	FASLTm37mudCz54kkabqUQWCuVH6iKdxZdVG1E6rnCr3cZX1Sys5O1Z51gsWZf3ctrPs=
X-Gm-Gg: AYBFou0AnKVjfWwJ7aU1gXwiKRlMaKukivdPpI+fP1S4JM8arsSlz2CtZBPPayROgMs
	gT5XFP+8yghE0BMSzfO4RWxw8utan4sQK9Qt8mNP16Q1mCTjOwME/NkSGbhTneUbz6Ch4SOnW7S
	lx9kFUjAL9+cYMrj1dDVqYJWpYg9rzTed0i8b//qiAWzMF9kBqfcairRL3Xio44ZSTL2VOEMTRW
	2xWXNc1NzWSSbGHpoyrNkpxTaAtZs1KHjNvu/hpuUQhJ5CRrvFethwIgA4ffUvscS1R1PIFhuXT
	LF7Txitlyf48SN8O8nLk1MR9V3oel1u7Nelt/Pcd9OUZUPiWHfTm5RVanIL3ghKxz5ZGuk0bS8A
	o/eA9blDCVqQmHnxF80qe/S90wzlBZrsiHp6q52qxun+92x37DesHmA==
X-Received: by 2002:a17:90b:390d:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a07e54a8e2mr3129860a91.19.1790182102981;
        Wed, 23 Sep 2026 09:48:22 -0700 (PDT)
X-Received: by 2002:a17:90b:390d:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a07e54a8e2mr3129824a91.19.1790182102520;
        Wed, 23 Sep 2026 09:48:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm10943a91.0.2026.09.23.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:48:21 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:48:15 -0700
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
Subject: Re: [PATCH v19 01/20] KVM: arm64: protected VM: Handle user writes
 to CNTVCT_EL0/CNTPCT_EL0
Message-ID: <20260923094815.000026eb@oss.qualcomm.com>
In-Reply-To: <528f3c4a-723f-47ad-a387-6e6a4179c96a@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-2-suzuki.poulose@arm.com>
	<20260922122542.00006868@oss.qualcomm.com>
	<528f3c4a-723f-47ad-a387-6e6a4179c96a@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX3RiSYju62YGd
 HOrRqqd5bGWk2AUbUFq1dxrNpZaGGhTkBeR48UqZmC+MdgRTq/bfbodYZWb0hqhM3q/ZGjzsRCq
 qCd6OjDU4Rbc0SkbBmqWaQqInyuG3hGdMEZb7k3mJBpmh+PXzUbuJ9m5AsvOJ2Ln9jaZDX0kQeK
 QDGVKXMoj9UD15L+VvBMYnGY/b5GgIKhKRFXAfuJz2GNR6S3kgL2n8hzLOwt9hBEIJsisb0cddj
 yHikDzbqi0bh9ngDFssLwtc2SThmcnV89X5d478/luAE1AKyIwl3DVLsIGRl9RDNqpzFDocr+22
 7FZkDKjC05yVN86NF/1iCVjf6ZyQuHiKkIdUnQsXlWr2FOhuFtU5upjHIi2JFPUdDg4IWbpr8d5
 4TiIELrO3wFgu7C6tlMdAXewPTakYwSbbq3l/8RP5SAWjrLKiK7JbS9zJOA0WnpWXxPlIhYZ6qp
 WNyPsEayeIeyAz+z06A==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab402d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=iHHI45kYt6FPp7tEAR8A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: OsaFpcryV0bW35LkftLycEZ3_uaYsJMh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfXygSFfqvqnTeW
 ViT6150z0pkRqfyVEljFes4FsbrqIHOxdvDD8cKLRzbMgg6cmmKqOJmBMRA3UMmz3kHtfloF1mC
 cXfTXPtqL8VLkaH3Sl5y9oV8cpkcXRo=
X-Proofpoint-ORIG-GUID: OsaFpcryV0bW35LkftLycEZ3_uaYsJMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On Tue, 22 Sep 2026 22:53:48 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 22/09/2026 20:25, Jonathan Cameron wrote:
> > On Sun, 20 Sep 2026 22:28:26 +0100
> > Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> > 
> > Hi Suzuki,
> >   
> >> Protected VMs doesn't allow setting offsets for virtual and phyiscal  
> > 
> > physical
> >   
> >> counters, as the offset is always fixed to 0. The VM ioclt is filtered  
> > 
> > ioctl
> >   
> >> out based on the cap. However we don't prevent the userspace from trying
> >> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> >> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
> >>
> >> Fix this by always "fixing" the timer offsets to 0 and marking that the
> >> timer offset is set in the kvm->arch.flags at KVM init time for protected
> >> VMs. A userspace writing to the CNT*CT_EL0 would observe success, without
> >> any real effect. This was chosen over preventing the writes to these
> >> registers and returning -EPERM.  
> > 
> > Why?  I don't mind the decision but telling us what was chosen is something
> > we can see in the code - patch description should give us the stuff we
> > can't see.  
> 
> I have modified the paragraph to :
> 
> "Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for
> protected VMs. This prevents the access to the VM specific vm_offset at
> low cost. A userspace writing to the CNT*CT_EL0 would observe success,
> without any real effect. This is cleaner over spilling *_is_protected()"
cleaner than spilling.

Snag is over spill is a whole different thing and got me wondering what
was over spilling!  

Otherwise that works nicely. Thanks!


