Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED547607C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153593; cv=none; b=CY4Z7ApnM9oXsgH7BFeuH6+GoDf+1dvdNlG7y00wuO23HPqEdP+2FOX7ZV3NhgZVGXMqNeCPILLoeKNBFG+69XVQA37yPOCj6VQ8Zu+iOQuOzmqFaLcYoRxa5IWtbarUiBy/WFyJioVF2gPfpUXcz+dQIrqBunlpRyOtYeUxhaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153593; c=relaxed/simple;
	bh=+Cl6oGedBJJ+fMGdxql2VP3tbVmZikvWHze9Qm20rQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4odsXMHPZUUqqgiB07yz0Ih33JjbNpVdEOuel8u+dmX1kb6STTmw1SsG6aZYHKN/QOuU+tidUngUzjkuaMXbVVqC0x1yHTILSc/qrszLfoRFksvas1BEY0ArRBnVaMXGfZtw4AYXWCI2/biKhNjF1H82lWRy7XrLL+KOX6h0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K/+ptcov; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K/+ptcov"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso26905e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790153574; x=1790758374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aefF/PiYK1b4Z/D8ikpDUgUaGPgIxFbZ+BKtTsI/MQI=;
        b=K/+ptcovu+W0rlbpiWLoz177Z0BcviD9CCD6SgimTp78gnn1vKXZldtnZDzeVOhUA+
         W4gAuDIcNPNrh+n/CYsf1PydK9nwcJp6owMuhKgNWpQVJ2NnW9TBQN/zP76cMXq0up+e
         jMH/6xxKPjHd4/SBfR/y1IPVeEFBnMfA7ww9o422iwa9b8YwSJu7JUok1r0+8xW/glvP
         XWKvloWCJB3JXlVuSf6CAWQ8+5+8YsoIaGa6b8KAXOJVEqe+bIqvEzSKeR1nUIWqhbJ+
         qGFKi0W0uH7YlO7vMtH3d1ERdQVBfaNS0mJwbZqFSHAK+a+XKEKyi6wK3a3S1VhX645T
         XFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153574; x=1790758374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aefF/PiYK1b4Z/D8ikpDUgUaGPgIxFbZ+BKtTsI/MQI=;
        b=WZExBizMVc8rkCQ7oDPBTiN3eBtxzu/ORm54uQ5nQ7r/0kCcyeMHDADzWUFxPST14m
         0NEgYcgm26uXWQsFhP8GyE2yjSNomBfGkksMFAVYVuZ1PdZwecUs3OT4UFVgTH1vbXmb
         IstcKCOEXjv7QVbPog7YoWltFJO5NnxjVZjZqjNIwsoxuY9JTASvAJf6QcgCytN9NBnJ
         45Y6Kw60/cmD4GKmli2EFrIhNmZT0wqAXk/QVIxnL8gIUiiniMgJod0D9J5oUPVVU0Rr
         7iT+MfLlNYUweXLXRrO3BM5ofeKmkI4XnubwNOcrZNK+Q7EoJITMvpDe89Y3jOrilRQB
         1nlg==
X-Forwarded-Encrypted: i=1; AKwUvBzVNUzcHDp0oxAm8jGAoH7xvoUM1VB/M5c162eAtSogzpUKvm+FIt0Ky1lfBnqQtULeYrSnG4INOPNJ/sE=@vger.kernel.org
X-Gm-Message-State: AFuF++mEsLHhuctRxXUr0SzANl2O3QnRcT2Z1iE3Wp8Lv9T3t1Unxr81
	dD74G7fsr3oqmFIC1H+H2HEybyTKGLHGZS9yIJ/T+akkLp3JGfObjMbkWi/7OpvJpw==
X-Gm-Gg: AYBFou0MyRSJ84OII1RQx2H+yE4lr1paTvbbhX9XUcb8oIDr8AnXo7IJMtryNgdX7Lr
	JKW75G+n/nTQEQkZmiQBzwoZcHXb/l4re4dpfdmWOb7P6JjqUfEM/363wadqS9M41XpSnGrNomT
	MdwtM+HkeKVnF6vUeX0t2SA2mOrVSljSYEVHjMP7j/85dYAVS9nlV9tFRfxj5QGM17xw3HZNgMl
	OVNjsddI8f+Ibpg/9yoIcFNKCRbrBmHiRmJxb/8auLT6swoDlUy4lMAYBHBgt3bEs342FgJmLFo
	GhL8KcBrWF/BEEA5b1W1u70bl/f3Q3CV0uDBGzG6njNJ6gjZxlv0LO5jaiYIzepCiaRwvInIzwk
	e1TIy+L9qvelJckdhioJw7AfaTOO3SO1mlh2m8cTg/D9FajlLHlk3PePYd3K9879ZT13t7MGwi+
	aguPsTcQXTWD61hYISUbl5uLBvlX8ip2zoBYYtVudisO+OO19O81JXjPeLAijNRc0CrhM8y25IT
	QhyesFCTJ2JaxtlAcaODraP2kBGoVwMjbM7pIB6yg==
X-Received: by 2002:a05:600c:35c3:b0:49d:24e2:5454 with SMTP id 5b1f17b1804b1-49fe0c4a230mr735295e9.13.1790153574217;
        Wed, 23 Sep 2026 01:52:54 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm60265885e9.5.2026.09.23.01.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:52:53 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:52:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 00/25] KVM: arm64: SMMUv3 driver for pKVM (trap and
 emulate)
Message-ID: <arOTYREAT_JEyp9U@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <arLD1qj8E+tE2MYw@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLD1qj8E+tE2MYw@nvidia.com>

On Tue, Sep 22, 2026 at 11:07:18AM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:33PM +0000, Mostafa Saleh wrote:
> > Notes about Sashiko
> > ===================
> > I ran Sashiko locally and it was helpful in discovering problems in
> > the series. However, it still shows large number of critical and high
> > severity issues, I went through them and I believe they are false
> > positives, mainly because (in the order of frequently reported):
> > - It doesn't understand WARNs are fatal in the hypervisor.
> > - It doesn't understand that a malicious host can DoS the system and
> >   pKVM doesn't guarantee availability
> > - It doesn't understand the SMMUv3 spec and makes stuff up (eg. about
> >   CMD_SYC CS field it makes up an non-existent encoding or wrong
> >   semantics for the gbpa register)
> 
> Just my two cents here:
> 
> From my experience, making commit messages or inline notes slightly
> clearer against the findings that Sashiko reported could simply help
> it understand things better and mute most of the false positives.
> 

I try to do that also, it helps to a certain level, then the code
becomes too verbose and the comments will be trivial :/


> Otherwise, the number of the findings is a bit scaring; reviewers
> would have to go through the long list of findings to check whether
> each of them fits into one of the false-positive categories :-/
> 

My strategy is to reply to Sashiko on the list to save reviewers time.
But my main concern was the large number of false positives might
discourage reviewers thinking there will be a newer version with
fixes.

> > - It seems to look at one patch at a time and not the whole series, and
> >   as the series is written in a way to be bisectable that confuses it.
> 
> Yea, that happens too. Usually I would add a line at the end of the
> commit message "a subsequent change will do X", which could clarify.

There were a lot of those when I ran locally. However the one on
sashiko.dev does better.

Thanks,
Mostafa

> 
> Nicolin
