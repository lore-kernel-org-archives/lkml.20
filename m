Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223813;
	b=VJC3J3AOxk75OWoPd7OfM7UG1zMLFfB60IIKAcesSJiF1x1BXRIz0fqdYyJWblTyR5FK
	 hRe0FI+Mg4JSJjMpX2ukJxf6pb/wrc2ThfgR/jfDp9QAEb3ob6lDmsQ2EKMjFZ8jiKatO
	 hGcuq7/WCDEkVmaK4Bv7DGp4APOL8VRIGrgTW/Wi5takU80qySBhPvIJEyHgvm/iFzpwp
	 rGwWONjyo5rKBeipYOcivhWQ0BCwSlAFje4SroxqyLWKGNHzaTLRWkEI5a3h/QIvIm4SL
	 HxfBYhI5vZGTlq01/un985qKHLJ+Ao5UEWpXhao1zvI6z9TuCegFnVkDM0UKJGvxNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OCgYpXH58qINyNwsYRskFASB4t/CiniG84M2T/tv7W8=;
	b=AC+xvD0buPqxN7iyiEr/QyDaJNeKPeW6/QQd2uJIQnRDoV3F3RSMNDBT28Og8UICxJqg
	 nFgawNVWqqkW9M+n7ZZLTJu1+t/MQ+jFOJHGihYOvIG6ahPZiX079yfjp4Q5YlTl+zL4m
	 2OPjSizUSFYT6uWoNqCzFIE0j3iHqEbyWIRLwmyOcsK1Yo3JFrMJsg52Bi9WN/k0k8uww
	 wWetnzM3FqQJ83SQrviRQ+3W3HAcbqwcg5FCNFU3TDWr7hWzwnIHqM1AM+iLiRnt9Tf7p
	 DtTPviNoTJ/GsIvKJrK6s79r790zdCwGMqgD7WInlmrSZWuC5cKDKBh7Ez8YdvPXgjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KQDXYgUu;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2017D606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2017D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KQDXYgUu
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so24505e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794223811; x=1794828611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCgYpXH58qINyNwsYRskFASB4t/CiniG84M2T/tv7W8=;
        b=KQDXYgUu/LqwOvXjvTnvyZr+3C/pVg0cZw1zTU3bD7p8AHCvEvn/aEBwZ9y0gt4Ae/
         MDZ5dagEYNbkjTkRjG+Rr9A0pultnikcLn29klghYIeNapvJ31enmw/Sj+opX26wmvN0
         g86fm0mmt86WTVcQocghrKsVP7DueDa258RcmWkl32+K3KiGo4afLrqN0XsRIrME0PiH
         Vtk4EJT1hKDBj82chJMWLm+biiNCsSWhw0jcrzJ+GdCvgOy5jr1puBrDEQOfIoIjQ7G4
         GKdt+vVL4yADp58SjRUV4/jH4M7cr288q39fAVB0cIA35bdajpI46Ht3Lusn9Pxm9ZPq
         2HKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223811; x=1794828611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCgYpXH58qINyNwsYRskFASB4t/CiniG84M2T/tv7W8=;
        b=il7ulQiOWVOv772ADQzhm2hwJPTkiW3zphiSQHXpcYzO5dT42WFq4e2Oc1YpuASMAV
         BXUh/LgAwnfoycvhgfAAVBBJapWGGgmaTRgPbChvHI0hAGQXIwOzoCG9BHmmHVv+RwvI
         343g5lw54dSMZDtsQXVxyZhzvgXN31Af18FVKzNHHc0lP1Vze/5FxyYnTzfUOV0zT80G
         7e0wGJhvsT/K6ayaqzOyvRBSnwnvYQW5S16KlXSEkqcIIAanD/goaEACh8zqHVIXKH+q
         o4gOwn1LxEw4sX9qxXh/tqx87adfI3J2gO+pMlrcjXSYJ4AEunpfO0smyQNJ9pJ26WzG
         4y0Q==
X-Forwarded-Encrypted: i=1; AL+hErGz2zw+Rs8irXHcExYsEX+x1cd5sPGcIGJp7H1l25GVFxLXepDAhKz8aNVmEdrVYquHs/mQIIpixKD5VA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yNJOZq7QqnPrE5BagYPMGWhPR634OR2uB3VCjYWiIZel0ZVDM
	QK/ilnev4pvOilaJBqAO/U7Vf+3WHLIPpXmxQqRX2r4RVNOjTNB7oJz00FOcrlaHog==
X-Gm-Gg: AYBFou2aAfweydLoYMnh1+79iiNMeiCuiMSht1Ujr7bmjcyGrUXbitNRGqLeB0hvObg
	E2W2Gx8VrnEsOydFTYZiQSHh0kBrQ6jxS+BAi61oUOYRNUu920SMoETGCH7pYvlzPlezTS93Z5x
	FHOJUHFIQUzvhUrrOuLCKmpp4f6Z2KtOeW+XcaXJSjm2+jF6F1f01JTMLjv8J31HCjEpqxEof4R
	u8KNn+Ulj/lQi/pfibBhz0972j2p3LTaDwnFXaQcs33iVyNUiPliKUmsCncjGaz+90Lq2zyFSMh
	bTCePGKxadH/XMgUD8z03zBmSqFsjb0u2hZuN/V1QafRinJtFdAvYHAl4YwUpdrNx6V9QK9SSGZ
	O0titehELRYLEGOVlDC2HF8d8trwhJUMhbiCnFvp+Lr/3qju6+2YIT+irW3gPa7NvugwESgfcRj
	6WQn0Fji7h/ljUn/qFRnWHetaBjpXne2vxURl+//fjfcKzWYW4DYX33JBn5i5qjJO2ktiAuDdsg
	yH8dgQW6jddQQzRCxPso9GxadBJxXdfM2ecc+dNLFptv9FTaCOPIsbxFuTe4RXbHymIv+VFCJDQ
	0Syqu2Mua/IhnUYD3mn5DCvwgy17Mzk1pz2HYWP5nvRbgPDfGkIpzNI=
X-Received: by 2002:a05:600c:a599:b0:4a1:9c54:1853 with SMTP id 5b1f17b1804b1-4b8190fb89fmr1464795e9.5.1794223811041;
        Mon, 09 Nov 2026 03:30:11 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660bdsm8966088f8f.37.2026.11.09.03.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:30:10 -0800 (PST)
Date: Mon, 9 Nov 2026 11:30:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <avGuvQ8uiYRGitkj@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-15-smostafa@google.com>
 <au0XJPD81XkBgpyF@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au0XJPD81XkBgpyF@nvidia.com>

On Thu, Nov 05, 2026 at 03:54:12PM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:45PM +0000, Mostafa Saleh wrote:
> > At boot, allocate a command queue per SMMU which is used as a shadow
> > by the hypervisor.
> > 
> > The command queue size is 64K which is more than enough, as the
> > hypervisor would consume all the entries per a command queue prod
> > write, which means it can handle up to 4096 at a time.
> > 
> > Then, the host command queue needs to be pinned in a shared state, so
> > it can't be donated to VMs, and avoid tricking the hypervisor into
> > accessing them. This is done each time the command queue is enabled,
> > and undone each time the command queue is disabled.
> > The hypervisor won't access the host command queue when it is disabled
> > from the host.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> With some nits:
> 
> > @@ -23,6 +25,15 @@ static size_t kvm_arm_smmu_cur;
> >  static void __init kvm_arm_smmu_array_free(void)
> >  {
> >  	int order;
> > +	int i;
> > +
> > +	for (i = 0 ; i < kvm_arm_smmu_cur ; ++i) {
> 
> s/ ;/;/g

Will do.

> 
> > @@ -158,6 +268,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		break;
> >  	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_CMDQ_BASE:
> > +		if (is_write) {
> > +			/* Not allowed by the architecture */
> > +			if (is_cmdq_enabled(smmu))
> > +				break;
> 
> Sashiko reported the same WARN_ON issue. You might want to confirm.
> 

I replied to sashiko about that, this is by design as I also mentioned
in patch #13.

> > @@ -170,9 +288,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  			break;
> >  
> >  		if (is_write) {
> > +			bool last_cmdq_en = is_cmdq_enabled(smmu);
> 
> Maybe cmdq_was_enabled (local) and cmdq_is_enabled (helper)

Sure.

Thanks,
Mostafa


> > 
> Nicolin
