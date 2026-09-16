Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B601A4A4857
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550693; cv=none; b=aMkDCK7c5oU6nSVxV1zxAFNQXoegTEBIEErZXYVT6S3GxX9FZt0YnFPQeiWiLUDalNCx1fhdVR3ycYALVBa1UHfAeBFacj9vU886sSqz7/OgRM4Kbc8Bg8wK/UHI9GTo1AxgB/voLCCOljNtTuhRJmRo3a6CLK2Hz418Z9RECm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550693; c=relaxed/simple;
	bh=FeFvzq7Kx56CNKQki6AGfU6fzYM5RSOtJ7yk/3jrk6A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qg6eQNirnEQIffivqT0vq7Vkrq9m3cGGo7yIL7DohZGQsk/pHMtPveMwWGdmoVQxmVvh8ZapGLmVlOsU6e+7wsKivW4tnFk4Vqb6Nv4B9wJxriubjULOjQhXQD3vY9SwzoedWodj8JCfuUu40vGQXL6MTA6Se7YYFu+UWDa53/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrtyE5SZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrtyE5SZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so4212855e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550674; x=1790155474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8l1CcK75qX4HLNwsQKQ3Pw8ostGQp0lUBk8UMhzLJfk=;
        b=BrtyE5SZG/zQmlGwCIZ1JokcBHHJPszoqAmwnAWpLs5dYhUyWTcfaGAuagt9xGK7aJ
         HPV4OBSpEAujH840wQd3IxToxjIprU2ks+LiXoTjb2QXMGBHjxf7gwc4Gwvsdd63kd8Y
         7oNlFw7wmMWa/XRrVxkZ6pj7gFoLvYF/Xl29EXZ3AMmRrwtxTvqAqRUDJueHW3odg2zx
         810ux5ckxpR3L/R6i7eSyy9rX80VQVpufksmxf91JUSO2QpGuBCOyDBjdQH0ddef8fXV
         3RmBS80H7CjwpSMuTldbo8HA55sf6+QLz45I6XrH7pSlqlryJsgdOWJS16IOaKP2Z/CK
         GVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550674; x=1790155474;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8l1CcK75qX4HLNwsQKQ3Pw8ostGQp0lUBk8UMhzLJfk=;
        b=StxDafoi07MFF2iVIElauKhrV1Jbi1DPM/+qxzLlQ8wDyMCYooKXxSmrkEMXJ88BAo
         dLp415skYbRd1nzGDWvq3xL9aPpCnrGKxaZq6v38+c6mEEpRzguROuvvPALsoIYe6/1T
         +OezCoP3Xz+c61EO4bdJGTrZKSzy7aw3R/N2u4kr2FddBGW+6VqxP1rJYSwHcoQJl65Q
         v/bjEXuwoXsWYq0yx+wVCrsp2pqvTyOIotVlCzTdnskAVcDwYb4POB6Sm9xug3rjTmQ9
         TFzmqHX0nWUY+bSHt6hRc8pxsqCEtJZKOeluDG0OpoEuzxhlhGKADA3CZ7XrAfZr/L1w
         K13g==
X-Forwarded-Encrypted: i=1; AKwUvBw/M97FubXT2UbXOBp/rZK1GxR9OkdgCJ5fVbiCvtpfnEHhJUb8BMU7zi3Pf5dn6T4ePzBfcBKvjytbNW0=@vger.kernel.org
X-Gm-Message-State: AFuF++lH9VFG9/QNilJ3anlf8PpGvKCzJ7wQPX6Sd4JYBNh/APAoQJcj
	sxk6RpmpAP3o9zNZRjV0GxMbAYmQcCmd3U9CvvseWAkKsOJ6zH4DjC8R
X-Gm-Gg: AYBFou3Wo0fmSPbFRoXkABAJ/qf69nWqvlfkm+mgn973DeTrAqWw903ELvjgoFT/ybH
	zGQ+EL1ee9k1cjt7VbxOt2ScEzFZgD30d3wiZDQOg6Q+P3x7Ye/sHuvBz4scDrImylf+SNLaQPV
	kEtBUAwq6MmWi936jR7UJaBLpNmIobwSjqoC9xvEe6VCPKfKApl1c8UvKgDekhv+VJtxr3Nzvg7
	IJsq4IvSd+G8XcDZdFdtVoJVPmTJgB0Zy1wpnKNbLYg72SLEjbCZh8maTY145YnW+Bk9Pl5P2WU
	6egbcCVPC8WnAwgorGGxJ9CoPrhiSbeHC1sMKUhMqhM1hk2p6X7EL+5hHcQfQBfNgIOVeD/TXQH
	F1bEEZOREmJL1cRakKYCcHx8CfQObyY00fYnRaNPOkzT6TlCizwUiftW3axKyr+hNifPxOIF7a3
	K2/6qQ5QHVmm+CloaOhZTxBs58VfKhG7laEZKZb6hAHoYOhOLVF6m+DohFGCdkN7uiDtbxS3mPl
	SB3Fz3r0yBbE0gB8DWJ4ZVm/EyIdF1EAB3tlf3uzFOKHLplB0YrDRzAgBsntpFfEtdmvOXZiwDY
	ANqHJMErqUH/S1fOSPNV3Owgt4fy0YkTOxUBXK/mqMu2kbLOpPELrffqyNGqTSk6A/XGoP7lKsB
	kgeuVhXo01L2VBFSsQ9varYlGRRm6hGosOyZx7m8XqxQv7RJkzKjL0wTz2lF3/5Tu66D5q4g8Vh
	OWRMRutwtrtWGsKY7g
X-Received: by 2002:a05:600c:3b97:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49ebcc010d5mr41139825e9.15.1789550673785;
        Wed, 16 Sep 2026 02:24:33 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84202028sm48192515e9.0.2026.09.16.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:24:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:24:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@inria.fr
Subject: Re: [PATCH v2] coccinelle: api: add a checker for
 pm_runtime_use_autosuspend() usage
Message-ID: <20260916112433.00006c8c@gmail.com>
In-Reply-To: <aqpflCAorrufh1i0@hovoldconsulting.com>
References: <20260915064327.1377-1-joshua.crofts1@gmail.com>
	<aqpflCAorrufh1i0@hovoldconsulting.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 11:21:24 +0200
Johan Hovold <johan@kernel.org> wrote:

> On Tue, Sep 15, 2026 at 06:43:27AM +0000, Joshua Crofts wrote:
> > Add a checker for ensuring that pm_runtime_dont_use_autosuspend() is
> > called in a file if pm_runtime_use_autosuspend() is called and its
> > devm_* counterpart isn't present.
> > 
> > Without _dont_use_autosuspend(), removing devices causes resource leaks.  
> 
> No, as I've explained repeatedly elsewhere, it does not cause any
> resource leaks. [1][2]
> 
> The autosuspend setting leaks if you will, but that only matters in the
> theoretical corner case of someone rebinding a different driver (which
> will soon also taint the kernel).
> 
> So don't exaggerate the impact, this is essentially just a cleanup,
> which is fine in itself.

Yes, I got your point the first time. I'll edit the commit message for
this patch and all subsequent patches based on this script.

-- 
Kind regards,
Joshua Crofts
