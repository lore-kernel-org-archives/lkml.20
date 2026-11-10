Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317921;
	b=RU24rvM3AE7nsU4OgQ9Lizjn7eH+z4r8unW5YwxF2BEZi/IXNdL0gBQbxlZhI8sngvgH
	 mqSoKUHWNLZHs/WXxRBgWjykbEcQ9327tdIHjZy6h2aUgnku5xauuULI7bjtomzjO1yWG
	 2Rml8dmYK9HdX/bb9ipztEtradfx4FJLTmkgGmxUGOcBM1cJqJ9cL21T1sNLavsCcn5bs
	 WkswbAbHv0EcjJbKzgTQAkfKy4WOn2o0WVI0ArRtN8hd5EGPjAZe+2otXlCkj/KCQXH6v
	 tjCsldQXtQ0N1Pu/Y47ChLtsdR5RWWwBXPjbmxTmgn6mPVqJjVKZbeenHHa+9xiMjjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317921;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=s3xh1OPWMSdcA09iRqpCvbZacGS5qDw/BGqF7ZNYNM8=;
	b=Tt/Vr1K37X6COtfy9FC424CGwX8E/ZlG/uNpgWddVjTcNZSmpibMbsrTrkM1v5RWz8eY
	 BzCz2BlNQI1NsrHTnJI+fpOfWgfAEvBeKWpzyoev0icDFBnv5J7bfjOLgfG0QKOUGua8c
	 slXPSYJQylCUDfpNVOR+gr6g/iSW08m5c6hEx3kjUAYD82163iK74y6Yle3+4eX+0TNk5
	 v2OKpGaeGwItn6zcFSYHTk3L4mq/tfLYTVkDEbdI604o4KK6lFNKb79HZVIle8F+p9kXc
	 rjb90EdDcV/tiD5JF0JhglvAKEObVi0jWgJVL/iYnwZZ68XesI9l+ymaw5QSUDl4lQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAED606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAED606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso20780265e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317919; x=1794922719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3xh1OPWMSdcA09iRqpCvbZacGS5qDw/BGqF7ZNYNM8=;
        b=juG6efdY4Rg1VXNXLV1F9JhSYsCLhUfDpnnEFt5DdzpzovMkbvCXEIrirVkaY3I8xt
         Lo/IkPyxxxPAlObJzZZLxAtyXQtJPnsuxZ94iHg54P2grCfRrhd9Z7hWPqzPtW04DvVU
         9VRtTP8D4dilNTJqqCHk2L90/4p8ZSnWwCgevhoBg0t+b1PkpqBSO8ThmdrktlP0j83W
         I4AsLzLKZ/bbTBkRRGck66K+w8oGTlGe4zWtbJ+2hf9/B8q/hitHhC6qncNHMA3QoTR1
         RkNj8EGWounm+jnUqiPWj6PxQk9w2oLjzB6WDpz/jSxrSzInVa3Ys1kClnNvApsYTYI0
         fwTg==
X-Forwarded-Encrypted: i=1; AL+hErGl0/ZvWkxCv36nn3RfcgjQo7PsxlECeyXY0whM7ELO4xOKYFpJ51CGGNZQ0oLA9R4QTEyfZ/Ct+CShb3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rx7sz39u1ujL/SziX/0QW//oM6fRIZd65iceYVlQu9TJPoptW
	xr31SQN4QCku4cmrWQzcyiPa93dlYuB6Y8NnhNv6PSKeFGSXIJaY5DBT
X-Gm-Gg: AYBFou3j7Mh8VMBseZlMeVlDSHS6FGk92AkuuQR/UF/1WZqxWE5VWfOskTgrr+69y/k
	WrJpE/qA19YteYaHcrlCu0nmqE6eFuE9pnFKdtzKmMnevTV6gZni6IpUTx2+luAdsI7Rc21OkO3
	z/AY/oJhw4HE13c2vf/ooRRrYaHoeSQFdHNk/FXqkra54UNudtiNrdUBUVyzHmYKHSUlwqmpmzI
	W/pQJX5OR++dLV+dmUab0GiqRQD3f7E+6b24clFllIgDfe+4hRutOtv3d+cU/oMmiLFzs3eeRk7
	lb0kxDJVirNElYJAMhuEDmLOtw8ZjrC4cJRhfhiulDWTVqxXN54nh6FvvY7Ng0Qk3KJDka010bY
	/GK0qESvknKStMunWRxw9qWwTdIgcUVxj/QOu3iuGwQpTNnR/FonZX5QCswFMYbIvM3hL89+27h
	Evt8cazoZGs4EZGOKOATouUBbLf4V2B6mpKaNkZyxNo4eSbzaeLUPXOQD23cVU8qtXF8UOTuXW4
	Hdp67oZRK8MsdYAIJptC9TDieHLK+UTZvVWDH/WUySVmDJR8Q99WI1aKtJLl22/8faXuSl6l/Ur
	V2XsYyobZjEP7E1nj5sZM8MKPfyo5w5jySrXST5O5/pskIa+sd8pU8j8tQTaROhn5bK/y4o9+kr
	VnQnyXVpc/djjNTteIS9I5Fal+vwbtvYzMT72t6D5GD0Ug+ePjKc33e3xF0yZ6Hte
X-Received: by 2002:a05:600c:8109:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4ba02349484mr41901935e9.19.1794317918793;
        Tue, 10 Nov 2026 05:38:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm5292609f8f.22.2026.11.10.05.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:38:38 -0800 (PST)
Date: Tue, 10 Nov 2026 16:38:34 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Eric Auger <eric.auger@redhat.com>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jackie Liu <liuyun01@kylinos.cn>,
	Christoffer Dall <cdall@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: vgic-its: Reject ITS_REGS offsets above
 U32_MAX
Message-ID: <avMeWguO2gOTX8Bk@stanley.mountain>
References: <f4b5c3247f88b9c469758f8e14a386364332f9f4.1794251681.git.dan@cryspen.com>
 <86wlql0x5t.wl-maz@kernel.org>
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
In-Reply-To: <86wlql0x5t.wl-maz@kernel.org>

On Tue, Nov 10, 2026 at 10:59:42AM +0000, Marc Zyngier wrote:
> > +	if (offset > U32_MAX)
> > +		return -ENXIO;
> > +
> >  	/*
> >  	 * Although the spec supports upper/lower 32-bit accesses to
> >  	 * 64-bit ITS registers, the userspace ABI requires 64-bit
> 
> I think this is going in the wrong direction. Instead of capping the
> offset at an arbitrary value, the infrastructure should be able to
> deal with arbitrary offsets.
> 
> Could you try the following (untested) hack?
> 
> I also don't think this is worth a Cc stable (the worse case is that
> the VMM accesses an emulated register and sets something nonsensical),
> which it can always do.

Fair enough.  We are in arch/arm64/ so casting a u64 to a pointer and
back works.  Except for these two, the other callers pass values which
fit in a u32 so they aren't affected.

I'm going to remove some of your casts which aren't necessary and add
the uintptr_t cast back.

regards,
dan carpenter

