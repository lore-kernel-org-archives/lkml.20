Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DB949B1EA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295292; cv=none; b=n2zlYwp8j5hO98qHnvLgzouNzrtbsHrcPlveHwww3i/c2pZRPPFzpGi/oinymnRHYbgGqI/bOlZdd598CuE6gchUgX/nXjtf+5EwvFmoCMdNM4innLHN5H1FKd5h4dBIYJo8x6zzEHgMDuqJOl1EM0rlKuR7lyywQ3b5ZHuwYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295292; c=relaxed/simple;
	bh=L1clhJLb0Z1py4aVO0RGg0VLEL/TGU1QbzBA/KXzSo8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXV3HM4PHv4ffO3Sa6/SmAeepeuHm/0aUhCamVJB/LhzbWlDR5HpAR8TQHWb+dVSVY8vBDSZ6X1GY5S922qDGSKcvrmZ/Iq67inpYpEy3oid4NeCbkuSTKlQhuuQHQGeuZMpviO00xLqJctwGwLc2Hb3etUvJ+g9TznyCuVAlvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mZt94Xju; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mZt94Xju"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cede6375caso38795ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295291; x=1788900091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BT/aKLiVls/4NUTqHPDSEB+g/WJ9uVVjYhpkM7/ogCM=;
        b=mZt94Xju8NsP0gGXoDW4oEHcSdQL+HN7wgQTfbLePbiyrpAKtTxzvkvCgAm/b+67GO
         bSTLnZFbHTsrz1Ak7XSAcSLJZgFCfKfdUcpLffsdmGqvhCBK8YZdZxSJ3nFkYuXpBnXb
         tZExhYolsbBwbvT262MC3c2z0hMunzsA4pM4bbWLmBccA072pSRUuQiEKyTX4MzouqW4
         gPRHlSsJ7VAa/MJxv82pUdJzPMuun2QKQXrZG9E9R/Ql8TDLKrZgNZVrYSbZhaBgnbLj
         HjuTYAXx2PlZG4JXYTDb7D+dS0aY1rWjwxYegyhKD94hVtfYkZSv5I5/0ZIqNCRgKQRa
         MWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295291; x=1788900091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BT/aKLiVls/4NUTqHPDSEB+g/WJ9uVVjYhpkM7/ogCM=;
        b=iSdIuMePHaWjauSYsvBfwEdanwn35jFQWtN//aYdXsXXT+tz/7NwcWvgciD/0OPvme
         qr8dqD/Sa9DQYnrYvQt9fSfAYMvMzvFFLJ3/KspfusBDJ+az4vwkPJ6bKE6se5VaXFUQ
         GJDBYZCZx50EYlzoG5XJFXGIbUwdkasTmTQp0cW7PE6mhwuMQAWyLECLaTTNdg8MFaOl
         fCv+/SkaHsBKlZIYrCFHZk2wSIsFJ+51EGRq814Il3aLImyUnh2zIXTTu2pjuDMuH4F9
         688huG+bQw8xDTJbkkRKiOX5UouWSyGV7OrRTX6o5Aed/UInNWOjZlNJkcEdiN91y4iO
         E5vw==
X-Forwarded-Encrypted: i=1; AKwUvBwC6H35q3TFkurqF+jQCWNwEDitNbX157CH4EeIPzk7u7qLQ46BdTvSLi9MEXJyTDsns/W0+jw4gJb4Cyo=@vger.kernel.org
X-Gm-Message-State: AFuF++nMrStoNOuo9GX4RKEdtzIPFOeYuWcV/Poi4eUK2367/BKLD2v7
	QrmGVwAYyPAeP1ZOHDyPHrimCjZ8j3iamdiA7goGiD8y1zSJpvsqZLikXS/Ng6SBZqgid1+Ko5I
	8XYHzQQ==
X-Gm-Gg: AYBFou2hI2Jcfcda06YGVjgz/RsA0XbGDpR0V5Y6beFzNFSyAmovJdgrhcg4kYOpMGV
	MVeRJV0hOu7DvVA6MfznyJvVDDBFBQWtf4aaFIqeUUElSBTIyTZaydlLBAUr9cIJlW9yKeJBohd
	ChI6PPJWIoAX7FP8n4FQC0+8q1Pf3fy8T/Cz9sZeJI0M1vqMkey9CoL+CoEPi9dmLJWqsSNXwxv
	qxi+0PRhRdevf24tb1Gx1x+rkfdibr6mVqAPk2JwmEeKO2oXGEuIY60jIUKNibNbERvso3jX22g
	UknjqblSRzBWduNhqt1WYBf+/ceLCHFLqLNzF2w07nBhVP3nsussXQ53PKcku2w1nQryl9Cg1ad
	kO1FaqpnqpHOjaYA5Fuo0trQdlhiDtyUc+N58HS2l6Nzx/IHYU/c3VFyfgFjMJfESfFtWNBj3/A
	s4mGSDtFu11i/eVUNbDQ26YGpjedaD739+fUI+Kf3pDosrfUXeyij+7tWaJ44z7f08tIEgpmyQ7
	wGtV9w/l+nE0EPAbmxmOZwsTQyTatIrO4aW7AHAvfMd3ntFUqdRa+bR9mbdGEWud7fPEF2M0ncm
	7XPDRjE=
X-Received: by 2002:a17:902:e74a:b0:2c9:bd54:cf with SMTP id d9443c01a7336-2dae576fa94mr2405765ad.4.1788295290419;
        Tue, 01 Sep 2026 13:41:30 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d80433dsm7138275a91.17.2026.09.01.13.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:41:29 -0700 (PDT)
Date: Tue, 1 Sep 2026 20:41:26 +0000
From: Carlos Llamas <cmllamas@google.com>
To: kernel-team@android.com, linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 0/5] binder: fix issues with mremap()
Message-ID: <apc4dvbNtPftAFvm@google.com>
References: <20260901163521.1355535-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901163521.1355535-1-cmllamas@google.com>

On Tue, Sep 01, 2026 at 04:35:13PM +0000, Carlos Llamas wrote:
> This is a follow up series fixing some pre-existing issues found by
> sashiko during a review of an unrelated patchset here:
> https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@google.com
> 
> The goal is to safely reject mremap() requests on binder's vma to
> prevent pages from temporary leaking and accidental IPC tear-down.
> 
> --

Dang! Sashiko keeps finding pre-existing issues. AFAICT, all these are
real issues. It's seems we also, need to reject partial range munmap().
This should be easy though via ->may_split().

I'll send out a v4 with this addition.
--
Carlos Llamas
