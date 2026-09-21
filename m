Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB231A683D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789959206; cv=none; b=cbPZSF+b0nkAb/EFbT1B0SdQ6GtP1fmQJ9HQrKh95kbmEVEUGSQ+kaKfcUQ3l/TjlKpgs2UTiXaHLvIpL2qPxl84oftuAU6qx359nLWyMwyc0JwxKcZ2BR+4miElv/iCokeWWCM7qaPZwXlTT1urBNf/8zTOacP1r2XvL2w2BoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789959206; c=relaxed/simple;
	bh=VHyYEAblzmgSTYDzcQ/rTwb+iNZ/FxfSAGGwjEdaK7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYD0p2+vq+xgs4cq9gbjGiaDFMjCMSAQNSTt8vcJL34UQ+TdA7I+QJ7peZOlIuANhJwdsYvfIpz4l0oV60S3kjDpVLf8sfgZJefg1y441bsferJhtW36wj54sAbTFINjNwJXeJbgx/ErvYD4wAv+2K/uh6ob8wcW0LfG4xMiQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYcJLfmA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYcJLfmA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1047006a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789959205; x=1790564005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Se1G+XHmYZanJdo+24xpc9gmmy2jZ9LFjhb6Fx5cYxc=;
        b=UYcJLfmATlfAb3FOZbA9bzP3BBXBSBL1VsaWvoHMydZ3svQtVebR/G7Havfn52kwDS
         1u9AT6KSzqJC5mQjPWI3vo+J/Qs6GJNqGUny6IJtpdZvae9BcXeLhcrSg8Oq2n9SnezW
         spA8K83dunsCbme03vb4KSSgOIjzg3B1Tj5xvDn/29qEEeLOpmsM7j5ygh5uyQTh1iMa
         Sswhl5zxRm2jejEeK+XKJLCslLeW7M6DjSkPKJmAQGHxvrA/wfG6+j6jJYRRYgN5Aj2R
         EExsOL7BzdrF+YE4UnZJXIG5tjKHonAqB1xgBU6nxiBdNgoxwZw6lNoTiqN0OiyQ4N1A
         yw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789959205; x=1790564005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Se1G+XHmYZanJdo+24xpc9gmmy2jZ9LFjhb6Fx5cYxc=;
        b=lxVCLtveYW7oL5qFaGS3AmCHmhFQpveGm3a/PsUMXbvViNk9Kmb3o45hj8K0s9+3bZ
         H8ccuwKNqHYNQzQwH0HpO9NH1ak/gzjqoR6OUsfrlzHeVkt/7CslXAQv+nqrvuPu0pDI
         sUY7Ko/xfJR3Mj/kxiry5MXoGr6ZhpfiQ+CEgJ/DBNBpKGgCCS59E8Rqok80dLt9thFx
         0TxMruFNQJzbKTt6iAP9e8unSICxFs8K48YIE91c77lDEWvfM0t/T2Uq1NwXoae62QI1
         oewwEl7T5znXO5DJqPXM5b8jVBd3BKPqEmttvjXKyWENPcy8gAEulT6BYqevv2VdzL49
         bs1g==
X-Forwarded-Encrypted: i=1; AKwUvBxwsswH7S0U5wUFCn3swJxDsTlPWanNAPJ3U8L9hYPKU9EiD57DCxj6oL6jkEOYtgQ2UxRZt4nmz7qFSRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ntaG4BJ3WcaRnPFHWMqSK5EC0yi429bf1KdAoKtKAnZ8MUYftw
	XynF9cdyGIHYPbdRNja8DYwvFopxGTtxafkQPFyQjTipNC1ennV6JI8+MW2V9lJl
X-Gm-Gg: AYBFou2G2xPmOk6/XVpqwuZdUqhd75qOxMdr9t9/aT/LnTM8xpC3prCOjI29yxTDbPG
	CjwYXnrpzm4CZzKCHqLJrK6gX08z8Nr5bh6UYgliVuRAMMOu0M+qUQSYvhguxX1Tjw6oEZRmLS5
	95Tp534XmuSeqqLtdjRDxKeqrMHM9GdYaVdQqXsWBBHs/mZ2KQPPv5ZquQUslOUllNWsFAJWB1+
	pUZ2e2v/woFlsMHQhLNG3YDFD+hqaUPx1/EPrXlfLIQJirQFrAzV3R1yXzxtVp2V/jN5/hrpmFF
	xHnX3sfag/NhvHFQTFJnth8oz1h13pstZSn6663M6x0U9cRFEcaST3OJH48PnY5Caqd0RF6JyGj
	MDIIXUmYeeC+i34jaNN1DkaqOl3M+iRPFEAdCgRQLX5TFtfC4WxRkXvlcHUJXhmeRSN2eQuFq2m
	OlWYLZOu9E0vXA+pc6a8f5u9l5cAFOWlRQtVEhU0MWk6uttkhyJm7fMx0UHd/o363uCAKQ6Ax36
	6OFlsECqZ4tq6LTuI/cVJY+BMN52upaVFtwAqwB
X-Received: by 2002:a17:90b:1cd0:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39e36106b85mr17920856a91.21.1789959204603;
        Sun, 20 Sep 2026 19:53:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3844:3355:5928:66ce])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d53968afsm16719079c88.0.2026.09.20.19.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:53:23 -0700 (PDT)
Date: Sun, 20 Sep 2026 19:53:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: rosencutter@gmail.com, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - Add LEN205b entry to smbus_pnp_ids
 for ThinkPad T490
Message-ID: <arCcF3rLAM9AW0OY@google.com>
References: <CAOGuaRh025eKcBf9P8UrvtXNp68vQ0HVF2EbNMp-kpdaC1HNpA@mail.gmail.com>
 <20260920200730.1836756-1-lovekeshsolanki00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920200730.1836756-1-lovekeshsolanki00@gmail.com>

On Mon, Sep 21, 2026 at 01:37:30AM +0530, Lovekesh Solanki wrote:
> Lenovo ThinkPad T490 has a Synaptics Touchpad that supports SMBus/RMI4
> mode, but is not listed in smbus_pnp_ids table.
> 
> Add LEN205b to smbus_pnp_ids[] passlist.
> 
> Reported-by: John Rosencutter <rosencutter@gmail.com>
> Closes: https://lore.kernel.org/all/CAOGuaRh025eKcBf9P8UrvtXNp68vQ0HVF2EbNMp-kpdaC1HNpA@mail.gmail.com/
> Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>

Applied, thank you.

-- 
Dmitry
