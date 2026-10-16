Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD8558206
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177077; cv=none; b=c/ZdfKio7q+W3tSFP/7iyw8DV0oYzjPuB7YGVGNO9zP0cxbKLZna1CHJBxSBsyGfQ0fCbnTgvHHCWDUasri7rxrKuxiHI+W2XXZYcJ6V3rMC4K1D+wnlO9ZN8p0ktsQiRZnfjoxDJb4wYmOE3EeX6S0QMBp2vJlWO+MNO4BaW+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177077; c=relaxed/simple;
	bh=yjGvkbjtlQ8T3eF3lK7dFpTqZrAVoRa/Y8faWedXed0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=latY+JinvDt7TYdNvt2p0loupjbpHevkWdNf0KLz26KUDwFyBV70wG4lXFlUvDA/xP4z5bEfDoz2+kA3lvVeKTFJL0SMxzwMu9ESGtNKa3QTTZI8ODyDgOojW9ufKHeAIxbFnqvu/PkQT2ovBebUK5KzjknL7pRf7wuCT7GLE7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPmk7Gti; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPmk7Gti"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30b6dad2382so645652eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177074; x=1792781874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1gNBlH02GoDpR2nYp3eqisK0Fq8pIiVS9sm1oFPVE4k=;
        b=ZPmk7GtiUu7Xe5ew3KZSPAeotVwjbV4pb3gFM2DqU/wwE1pgrqEtDGEpOCYIYhwYUJ
         ZOLvjNHuj+MPawHn9adML7f8OGFyOW55OPG7vHoPcaibLqCzUFVmIMIH5d81Qr3QKzuM
         LQXU4rERPt/+4vxpaT/ZkD3IZeSVR5j7MFmiPIzu97HrYfL4swZnZiHUHDRUtTVSAj5L
         QGIEKn/Pt5bshaezzowvozHnIMMtef7zD0m70hV3e0ByfReG+62UCmb/V0pz4bAhVzpI
         zdXAmuabmd9Gwbj8LblYwQgJnzhd6P39YGC2gO8PbH4RUzPA9U9oSh/WVtdeCUPRZw27
         /+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177074; x=1792781874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gNBlH02GoDpR2nYp3eqisK0Fq8pIiVS9sm1oFPVE4k=;
        b=yehaR7Ez9UsZkFClSeJgJL8VC+Ui9eINwgrnnhPABTvEU1BtxPWxFLP1o2mmj6lFnj
         DsBTpdiA2/tpcC9FOETT7MvVCiR/Uv3TRUbZxosZz2x9F8xxPPs0Mw96E1UENn0I9Q57
         ei9nj8YAyqUOX5DvwOs8j7NJ5pBLpwpI+oIspftK9WWrWbHPLnPFpnHkov8kWPxV3i63
         z43VZ1cM74aNU3mNy3HRhCl5iFPK9MYtjWjT2ZfKzct0p9dkOAcZsDvkctqrW/vFKcXU
         sbKdkEOyx6Dp2kk6zlpboGEZPTR+9PMbk0aiiaXZ/9MtKf4RB1uE4tKAfvSAzznwN3RF
         TedQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyxutc/dukrOV6q0X0Wa1mc2cVVnfEX+/fdM4pxHMNA4TPyWpKx3mZ+wCCu2Ph4Cy/fUymrWVKMYrx7PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQKd1Vphk+okXzojyN/kjvQ6jyH258ufMa6j+ULwdVDwwzMTbx
	CSVbhe4DltrFltur35GO2dqlYD8vQa4f5/v+niFrmL0wf4768hH4CbDQ
X-Gm-Gg: AYBFou01GcqtSLGlx9hgR2vkRIwdUCQs4DfdzTMePEYTs3pqsgxD0URgwN/u9dXqMEj
	kq8LVyAQfaKHqMjDQfsmSBKSNXg9+lyRlHEFUH6UzSNIE++gkj2kkkNl5EDvXYdttQBr/+tyXZ1
	JIWHhTSGPAZC0fUtEgt8oqVu1SR/+ClzrTsF9kjPs3ZuAFr1SgNwiPfmOsRTrnFf2HmzF0nOAdI
	frxIOzr4nZjBv6GYVLT/MEJcZdNNhIh5XKZV80Ha0lAHG4P3+2YSQ2/vEhuT5TDAu9T0hZl/o5P
	lFVT5y+AU7vtkyCnWeW8Pvk6GIsquzmpRvRDefeWD/82ZPxHzhr2d9JhvPzZRWJi5bOh4uvY+sO
	Z0uMNb0Vl30DpiGIaRcHls7ifNzP/c7pkXsU1B6o3uRtx2nke2yhsRCnAuD6tYqNasnEqGs/rBL
	yYglcNk4gL0cyM+QcBwX1i8w8exFNPgncklO7f7vOHBZT2C32aVZs6f2jfbl4dRRVu31x2ss9hT
	RNgHQXkO/bOA2EETMUYIKQkpq5hVM4HKPp3ns1/
X-Received: by 2002:a05:7300:d404:b0:351:1e72:7470 with SMTP id 5a478bee46e88-361a0b98466mr826776eec.13.1792177073308;
        Fri, 16 Oct 2026 11:57:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e6ab:aea2:fd2a:caf4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm9431144eec.8.2026.10.16.11.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:57:52 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:57:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: patches@opensource.cirrus.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] Input: wm831x-on - free the mapped IRQ on removal
Message-ID: <atJycIEnUZKVdTjW@google.com>
References: <20261016024300.3660850-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016024300.3660850-1-mhun512@gmail.com>

Hi Myeonghun,

On Thu, Oct 15, 2026 at 10:43:00PM -0400, Myeonghun Pak wrote:
> Probe requests the Linux IRQ returned by wm831x_irq(), but remove
> passes the untransformed MFD IRQ resource to free_irq(). The two numbers
> are not guaranteed to match. If they differ, the ON handler remains
> registered and can queue polling work after the input device and driver
> data have been released.
> 
> Store the requested IRQ and free it before cancelling polling work on
> removal. Also cancel already queued work after free_irq() when input
> registration fails; free_irq() waits for the handler but does not cancel
> its work.

Why don't we switch to devm_delayed_work_autocancel() and
devm_request_irq() (or maybe use devm_request_threaded_itq() and get rid
of the delayed work)?

Also we need to get rid of wm831_irq() and make MFD give us already
mapped interrupt.

Thanks.

-- 
Dmitry
