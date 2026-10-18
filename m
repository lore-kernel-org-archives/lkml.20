Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A833F383
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290726; cv=none; b=d7mY/Xv/1ixrbcTqVFdKEL4Q3V38wsW2JAFL7L1RqyyU0x+C/ieGQhM+Sl+4M8D/eUnnoQSW8ZlmXZkZQbHwyF4sLoeP62NQFChwdRzFv+iRXLPdpA2Q2Ts0/OL+hP1oQTaJK+rqRT8tA98JkmGIXO1W+ZiZWTzQIAL4SHKBdnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290726; c=relaxed/simple;
	bh=SonTQqI1E4gmDWfoGEcsRKX7iGhRoCOiAf9Un14E/iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfJJ7khej11DghOn2JdDtGzgmqdjRZJzm/axNAdksyBDid2vsL5njvGPZ5ZOYGWH10T3I2uzfKJouOn3mc0/y7Na+FAUxhxYHaOFxC33jhEAasvUr9ePjwfb2exAr5vLkyoof1lxgYbSaDp2ZWYjBminBJ20SXyCiIgIA5LsepA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=r6DC0X/y; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="r6DC0X/y"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533797e72e8so5624301cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792290724; x=1792895524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SonTQqI1E4gmDWfoGEcsRKX7iGhRoCOiAf9Un14E/iE=;
        b=r6DC0X/y7++3e4i0SySll5DwBR80GzdpSX3Siw/t/ZJpwnhiZm0Ox4tAWVSz0YWNTs
         RIoP4k3Zl7CRhBR+eAOfgJDsoim8xdq8yvVgm+UoxGpgrJuawggf1l1XI3Gj0XeoJli/
         Dihhkt+tVK3Vapr/bryK9lnDg4lWXEGMCOTATOxqJgx1CNXgtiFuL9CohFKvxDKQNeEq
         b4tTE9lNKQoe4U93ya2hzplptV21yoqpx+5geamJ/n7qJiv3/63w1dhKA+HCoR2ge5G3
         snBnIZGFqut1etfqPJS6BX6c5PI78BKm5Vn7k23s17OvNLreEMSeQkv+6Nx9LkCxm5oW
         C1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290724; x=1792895524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SonTQqI1E4gmDWfoGEcsRKX7iGhRoCOiAf9Un14E/iE=;
        b=SkG/ZLcFkvmbxANUjFN/zcKviMWbiCxyUnDDMrBqHNpefIR/CTiFVYOLfC3MSwlEPa
         JTE2kJLu3IivsO2O8NJK++ztSVrtD6VgLNlYnUlQwqdbZUoHkyGIDwEb5PriLUcxulcU
         Mg6p0qIugqHKqn+kP+HpzTQDdRnwOYHgLb2I9HYGdahRnUsSOgUEKV5WxygKiZG/KZId
         OB1tkB6lZkTSEFttKzgH90skvqQUmtsUiFq6dzYx+gBn3djO4XBnqyfwvcGDl2d7EaI2
         0pu6t4+mQvlIa4pQsGcnoMf39FRtbCYmHdwaRl7IXj1W29H3tFuk78EZYzofoTNMLFtW
         +7FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkOxguggq/wRZx3BA8JiDLQpMhq35CynSBV0dyG4vE9km4bdWDTTuGhDmDrStTsWURRFLKlmUs8hVnmLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxbiiC0wemLxSGPAzpq7V1sWrTjFn0F0RuwYo/gRvLRm9iIye5
	4/eSvSvj2tW7ndG7RbiB0ZzwbAU+kxV8B9ablRPrv9sIAsvGFn39axX7DDddikWquQ==
X-Gm-Gg: AYBFou391CYT8o9syWJMM39fDOkMzp/vw2zY1dFZztifsozEZpOW3ecrTjlGYOP+CzX
	plJiNea4JgBcHbYVbeFs5n9XIecUbyi1aVWwvOCy5v8Phd5WGuP5v97onbDStIHcjm1O/66WU+q
	VKNm9SwHzW0C9xdlxPeIrhnWletH850Bd7vfIBLGDFBOOmlDCARbALMWzoryvb37QogWfOLLb0k
	q4x4EdwL6u099vvS1ZpplpYexVgDtfSUfXkSlWzTtRbSiPITCVtGwrEg0uGQbQsFOYjaHq53MHm
	jkfjC3ykl0RMKSbX7nb+E6s0DC56yNYFTEhGCG+hocEAaiI0VWpb4QG4TC7nvQm0zheiDu62JhD
	ma3lGB0z6BFTGy3ZujBBvzZ6DkHrRGztaNTut0pEuPOShKmpmbURVNAvjuRvjgCU7JYRHvzkDKT
	enF3ZKxMcidTDnh8Xsw2NuujzE7V1dtJ3bGD1C/z1nVvYov5QEZ3PbfhucXD7MKQYEmWe6Ur4=
X-Received: by 2002:a05:622a:44e:b0:533:367b:3479 with SMTP id d75a77b69052e-53645faa298mr58825371cf.14.1792290724083;
        Sat, 17 Oct 2026 19:32:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9bbad2sm63812751cf.18.2026.10.17.19.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:32:03 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:32:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: m-amirpour <ampr.mhd@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-omap: handle root hub overcurrent
Message-ID: <e9181871-e1d0-439e-9764-631581690ed4@rowland.harvard.edu>
References: <20261018015747.246611-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018015747.246611-1-ampr.mhd@gmail.com>

On Sun, Oct 18, 2026 at 05:27:47AM +0330, m-amirpour wrote:
> Handle overcurrent GPIO interrupts, disable port power when
> overcurrent is detected, and report the status through the
> root hub port status.

How did you develop and test this?

Alan Stern
