Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17034346E70
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393163; cv=none; b=j8O+IlqTonI4z3AMtBNPZwsEmE++k9f4ET3faQnMVGopFCKgv1IuDf2K28l/+3y/0m0uPETbgd7+EhIIJZTQP7Y5Z9PzIWt6jiLWoxuEGJFeoq+8j2OS5ru0XP93ivRbKpjGwGDPhsV/AWdW5kiiz9hHSyFZ8VT15HyZ55IPB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393163; c=relaxed/simple;
	bh=GBcORWffZ7qQhvpMu408WBMZ3ZAf50Ak4kkEpdiYuG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6XfCbqiFoEUJFVdEkHMByFTYx9iC4AS/Ilu5noV/OGCea/kj/eLrbln8zgs94LO3vJwtYKpG1b6ILHZhVKJEdVVymJDqsYTh7TCjn3r7hssuQQK8YfxA3Ob4qghCyaJYR+NI8C2Cndel+6+kdfiTC9s+vzHxjwpZaoC31SGJXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhcYV0cB; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhcYV0cB"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc79223bcfbso708935a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393161; x=1790997961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1vjySsVVmbKiFInGwDGm2D0Hk00yL7CXO9MMmjGNncI=;
        b=fhcYV0cBVsA3XvzbwVPS5O7Pe506FeW/DEi/zIlEmVw7Ukc4wLpMu+ZgwaxJN6jFJZ
         mlPepZNb35+XDALbJj2cCP58g0ngbIybaOsiJuMmCzxdi8ebb5uYarJfMWYny+b+NkIZ
         dSBuqRkxjpZSZOuxGfYcapD0IHiajhzwSs3F6vMzgZthOUTTb8CJKMpoi/I6Fo+GZBNk
         G5Aa0nAQVCligdcblaejw7x3Q35wx5cFKFQNut9SJROkyB7mKgtYhMjpz+2xJbS50Acm
         mvOobv5tvKuD3KqEH2WW13mLBhNMzbww++7UbpuGBxVY8v0zzZfspr+6gjBuaU/6CvEK
         Cc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393161; x=1790997961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vjySsVVmbKiFInGwDGm2D0Hk00yL7CXO9MMmjGNncI=;
        b=RcVVmVPZFiENBrEZ7hLBuXDS/gy8CZZUUyLBTi835Z9w+yafZEKRe2jBGGAkJde461
         ScNqfdH9pMaO6knh+eAB7uj+TOu3Rd1Ek/3AzF4ksSa/3JT2QezhmiON2b6qYgnTuUSs
         /T+dGF4XjcRqb2cEYww2VYyNEhvdJNlPi+iPL+6aAhoDtcVwUhNH2UtUI+b1H0J7cAVu
         HbfC7/fBzdthSadq5M4NG1T78hCQqUPzZZr7Vl6RW4g9/GMQYCP9dkMTTyOsvq1MDn1g
         y7fbq/dWr3y+Ru/L5wY9sWPTD8S67rEiv6BccN+2S5Kn8rFq0OAkXCdz6MadhVRC5V/B
         lKIw==
X-Forwarded-Encrypted: i=1; AKwUvByPJ098MMmH5DZCQxHxRIB8FonIKYak8X6Mi2VJTEkOCjIxhyvJGKZsSITfLhAlYao6YVfr0HtEBVy3y9o=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ0bDV2UMR9M79p022oU5PNY4GYSx+OquSy0fFicAcZhu6DkWJ
	UElCYgghy/J43+j1X5RtvrTpL3UIlLe+YtIM245oJ5bb04E0kpIo4oKN
X-Gm-Gg: AYBFou0+ngF8JtK0edPEr0xBP+ruw0YyNbdfnbdAZqF8rD7QF73X/NSTv1nHxhmwCPE
	L1zFE3zdvlWH4yhbYAGLGLwv97NeEa2r99Q/f2JZ0+mErYl6keyKw/FPNURzcH8EwyEcxUwdNqZ
	S2H968husho1cnZprfUwlWBzqPvv9+uMYHO2B0cAwahb4muUgO3JQfB9Q/U0BAjJZ71hfrKb3ld
	Zj283SPtPC9xwKYPbbdR+iHi221OsY0caAA6YSG7ZTeawBv6Rw6p5DPx+T0VPfzsCaO5xNUJDEk
	T39FbosUuA5lHgoKwNHUJR2etkPnUkTUAAbXJLctNWFYaH4iQ161nhWOKf5BADdy5iXf9nMHrUj
	GQASPYsBQ/j6Gf364ToHu1Ob2DNWs7uGL9MYMf8Re9sfiMXKVxoTzcL8K9+K/AbUO3k8PCx3m2n
	OzRzDPCAdJgn4H65pRzS/Lnx0Rn5iOQSDo7frXmCK1oBtACEV5w/wW08EkLmjnli4VUUa7xDp64
	UUnUxcpYH7h6A==
X-Received: by 2002:a17:90b:2245:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3a098b46f17mr6499116a91.18.1790393161354;
        Fri, 25 Sep 2026 20:26:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c3f74e5bsm5653572a91.5.2026.09.25.20.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:26:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:25:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tom Verdonck <tom.verdonck@inspiral.be>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/3] hwmon: (tmp102) Fix jiffies wraparound in
 conversion-ready check
Message-ID: <7194c93e-9c9c-4b3a-b0de-28fb7a5a00eb@roeck-us.net>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
 <2952f070f82913aea96eec25d28008d3b9058656.1790358356.git.tom.verdonck@inspiral.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2952f070f82913aea96eec25d28008d3b9058656.1790358356.git.tom.verdonck@inspiral.be>

On Fri, Sep 25, 2026 at 08:23:22PM +0200, Tom Verdonck wrote:
> tmp102 records a one-shot deadline in ->ready_time at probe (and resume)
> and, on every temperature read, refuses the read with -EAGAIN while
> time_before(jiffies, ready_time) is true, in order to skip the first
> ~35 ms conversion.
> 
> ->ready_time is an unsigned long compared with time_before(), whose
> signed difference is only meaningful while the two values are within
> LONG_MAX jiffies of each other. Because ->ready_time is set once and
> never refreshed, jiffies keeps advancing away from it, and after 2^31
> jiffies the difference flips sign. On a 32-bit HZ=100 kernel that
> happens ~248.5 days after boot: time_before() then permanently reports
> "not ready" and the driver returns -EAGAIN on every read, without ever
> touching the sensor, until the next reboot.
> 
> Store the deadline as a 64-bit jiffies value and compare it with
> get_jiffies_64()/time_before64(), which does not wrap in any practical
> uptime.
> 
> Fixes: 3d8f7a89a197 ("hwmon: (tmp102) Improve handling of initial read delay")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>

Applied.

Thanks,
Guenter
