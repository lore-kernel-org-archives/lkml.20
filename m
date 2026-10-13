Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BB38E5DF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877813; cv=none; b=cTbtPUAZqs/Vkt+77ezh5sk87DQA/rYkO52sCzTv7DW/b1di9V0ykWjoMY7aELeaQqJJQTYoM9Wg8a+2UYyv2o6W4yluA2Nzc+XN3nxKto9AHZtDHiiDtYgk7gnNEXi4xjQYFS5TsDTno6KDIoJ3WuHwkTmlcJOJTUan73WXY9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877813; c=relaxed/simple;
	bh=tPzArETgTWA5K30DRMtFIey7+0GzDvruUvLN0+7n9J8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGetDqhSB4DWrYByFxtEklFoz1OIbFHOd2ln+umCZrJD/Uu3hJtzx4RhcoefBgYBW9mPhFVCXY2WLnp+T5jBz25vogQnfcigRMd6i1CQWkRr09jfH8j+cCw6hMyyH1louJwDc98Jtlyg1VldLMuzWrulCi1C/DkJi3aAC58VaPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsVJ13Lz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsVJ13Lz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so26471455e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877810; x=1792482610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHsj5QKWGOPbdX3F7/TYXqcv688FhIr45BbI5StNbhA=;
        b=jsVJ13LzQN8CH8w1ioeo8AKBuUtZyNdJLYAvYWZVBypFFI0wh7Q5rCddoX3dqYdGp4
         GsDiKo7cjSso41SgulP8tQn2IdBQaQyD+LylHOcJF3Fybbg00TwM3cfvqyprr8T3yr1o
         3GEchXBsW56KQ/aQH1ZWdF4733VfPz8wpqpdlNPUJaL/RNqCbeHvcdAivWVEsk+AXXDb
         ChStNij2lgo2V8kEB8Zp/dPtuiqeTygxgdi4KyO/vKZEzedxowEpMa/xLpg882WACX93
         fJxn0AmwKSNAbbNTaNXLQCgWoMSkGyhjJnXaxN9Sy0I0CXrPsY3TugsriNIRUo2Glq0h
         yMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877810; x=1792482610;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHsj5QKWGOPbdX3F7/TYXqcv688FhIr45BbI5StNbhA=;
        b=XCwx4Y3BjUUa6jVklFqPV5mnIjtFyNToa7nAsYWufuQh+YtdbIDYRrL32DGf2pC0rb
         EHAHAVByQYo8Ft5nJT84ZtI5oTzqignsmbXC5TAKpGiO4sDXgb9b5s0lRSWXxf3w7z9c
         O7ME7rpsJHcEJ97n76zgc8nCP7ntalyKUWzyTmn9tWcWYZFZsnO985EbSI0UFN/Ks4mU
         yN7HGAkNyula+21RwW4rNRjQyaYavoJfVKlKR65lQ3n+++Xn5oLU+SLmDp10I70MhTWP
         //ukgy7jaIUn7eDZ98RkVwvliHYthTINQGHGcDlVXekgu4vLemFPIaNar/MLYaLzYu5d
         tBeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqdf8x/YtNNzW2K2+SsRRk49jmzXQNNP61zQ7lv8I4DMUZwO/5CdJ0v+HR9zAr0y+6j8LAweMgCajRBNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdlDtxmA/WJzEoXHKQ6z18n6p6w2v9QJdxiaBEwDw6DWTj3xP9
	N/6NhK9DiSSn/y+vXr69BNtgzspcLJGSyF8nhJLnQIZF9+7mKTyN+Ic3
X-Gm-Gg: AYBFou2jkSyAZSGgFqdy7azye8gsRFOsi1wQEFmDTvxSMKlApCW8ddkLFKyPa8yTzlj
	OvKDY1zAz68jGa0R99mjb+jDSgiLWvrjOGeqm8ejvhsQRw4fbjyis1pij8G2K7YeN+dzeTHr2se
	FS2hWFWo1ofAFJ7UCF1FqzUUbTU5KcThvf5RvbPaXW6Bt/8FreEKyaPNRYTWLmNN61/H3YF8OuM
	fEt575pCy+h9/hy3z/vZvgMQPEaPKgmtpT0SoITQyvoQjoz3i5HcTPnqXk10b9wBXp0qXtBfUmr
	ixK4KBAGwVuqRCZQ2ZLz4tbfQJWGnxILNoY2TDMAtlGKW/YledNEIP8V35pvlOPVstM3FSfmtBW
	6z7iFCnbNvdvB1DZtu14KeIRP3VFkwXN3/8HVrvth+k2C4MNHbMKxsuuToTIw0kO1tLPjk2Qe0h
	XyGKw9+cmcUNlA0bvrx3yzRIohO5nD6LbB1wgkrrfZsYfKIEWQ+IOEucMuSfJ6jJlYC5QxhVI4O
	GSvmkazGugyCurCO0sfTl6IG81nnB7eLGDxAblpaJDSDPId6ZzFxG8m58GhlEAjPaxPBsiDsH1t
	mALBMFaBeShfs0NwgRRbnY4/JO/nM0vxnedh3Pt1s1bF+M6C7KeMLVvZx6yjPNpJ3ZYLnMQhLDo
	a7FjMN8GoVJbmZFC6LnQ4MCYJBPOIIRy2N1kNqOexuWG/ZHFqYiIyssYp9AEGJXEURTD7/TU+n2
	wiyI2x
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr244984045e9.35.1791877809809;
        Tue, 13 Oct 2026 00:50:09 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa05sm3203538f8f.13.2026.10.13.00.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:50:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:50:07 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: raffaele.tranfaglia@gmail.com, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux@analog.com, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: addac: adt7316: use dev_err_probe() for
 ldac GPIO
Message-ID: <20261013095007.000052ae@gmail.com>
In-Reply-To: <as1Q-au8dpp9YFeG@ashevche-desk.local>
References: <20261011-adt7316-dev-err-probe-v1-1-27a4a8ac74f3@gmail.com>
	<as1Q-au8dpp9YFeG@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 00:28:25 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sun, Oct 11, 2026 at 07:56:22PM +0100, Raffaele Tranfaglia via B4 Relay wrote:
> 
> > Use dev_err_probe() when requesting the ldac GPIO fails. This
> > avoids logging an error when the GPIO controller is not ready yet
> > and the request returns -EPROBE_DEFER, and records the deferral
> > reason. It also simplifies the error path.  
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> Although not sure if we need a Fixes tag as it might be an annoying (but quite
> rare) case of flooding in the dmesg.

AFAIC this is a cleanup rather than a fix. dev_err_probe() conversions
don't add Fixes tags.

-- 
Kind regards,
Joshua Crofts
