Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747662;
	b=2s5SNuT1ML/YMToC3jpWz6+9aKCtqU0q5Ss3Q0tywrGaP7j0XvPB47M1Fff82Ppivx4d
	 fk472iZLbvy1ZGE0frjqF5ITFWMjd8NmNJYCINOAWzyUElWihrL3k2NAfwjy1sFK12BxX
	 j6I37tbo5ezqUSKxs8ckwBy+dl10j2ymil6hWucCZcopu49COKEi7TbKUVvPO0w6ljoi2
	 TcPmo71JRlzA6dv5P/5OBKOQ+zEXiuM0bUExffhPB4R164AllRU0l1zfV9uLZuAsoLqBz
	 Gch7G41ChL85cpvDxn7IT/rbHgWWiPdr3kCGIv1lemFeplbJArJ3YA0p3sapi8mxiUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+fUXMnJyYBF3E1oHzRTsHF3mKjU41vSGgO+ygbzsi24=;
	b=WkAFuYuAAbNXj7FKB1ZSEK4lq8tmfJDCxvydgBi4rqveGh+wFgyTdQbUOX8dzxO1oSMS
	 u5oy7att0iifx6H9zo9FUOkJD0QPV5zQ8xi130GtKNQ7U76HA+xT9Z6lTZHh0EeK6xlWN
	 Z/pJ6Hvp66+SUA4sMnj8+0IU90Z9p+ZLCaiU7m2CZPxtceUmcCi3g9kkLWPlUJTbE3HAV
	 8I1ix1UC0pTaVxbpYAjRD445FYa1Q4+wl5xLapezJsJPXM0j9n23iIDA4PNb3sA5UvRC2
	 901YdBJ8k+W0WcS6WnseRgmyAp6zSZqX3WtJ4yLhzod0MKqGIWG7OwmdWgU7rQB2mxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MsT2IhVw;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B02606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B02606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MsT2IhVw
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so521507f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792747660; x=1793352460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fUXMnJyYBF3E1oHzRTsHF3mKjU41vSGgO+ygbzsi24=;
        b=MsT2IhVwHQowCpMD0LHpCzAjxzIE0vuqax39/Bx9Ozl2xIqE3V3WSbD8r/D+05gznk
         +Pb9CEjpPGgi/x5xcXrnBbE8BBK2X7O40J4EErAT6KZhZF3JBSpGldjl/EKXpChyZ4Z6
         LPVo0waKLWkh5cwK5jcIakEdB2nlAilM2eNI3hCgWNHM4KPWCTCW3dPQRVu6mA3zDCph
         GzQUagHl59j87XjOOWdM4LJUjr2H0Zs4QYWcSzp1pJDtiie1y1ud0xAsgLE4FYlWc3IV
         g2MQnC//W6W2LRN3hQXu8WcBdyhqzmvDEhMtHd9sw/pUW0zPatJoAHs53HTOdFmTkanm
         yEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747660; x=1793352460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fUXMnJyYBF3E1oHzRTsHF3mKjU41vSGgO+ygbzsi24=;
        b=hrLbPdNGWmPrvOU+D+p4teWat0JTUjwf0hAJ/1kqm3Ho+1YWBy7iIeqfZXYN3rNMie
         P3RgEoJzULKckaH/p04V7v4pXKOnWVwSBsNy5CwvNhTkg3sYkrhwCBdXBJEqATjaudCG
         KKBpTZODvHHYdVz+kaUuLByXGzLMJgKSdushZ1G2FyMwI/A8jTaf3El5ZZG63g/us9wE
         hCPYqX87eB7yn7dJ2ILzaiOdOrUHqA00xFg7Xd5rGZr4SJuOT7ppaUDspXUAKQjokDWs
         OUitMmd+kRlYZ7T2Dd3XjvpC+dfX4Ot+ebieJL09JXjpl/ovuEF+jxRH/bJ1n0VhZm8C
         kSLw==
X-Forwarded-Encrypted: i=1; AKwUvByZzAUDgg9Oep+C1mCeGlyyAmyLQoJbWFyNZ16WeBx5YNSUCilPIlk7tGby7LnAa5wlFx5hvX548hoiMqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPo+iRBiEMTeFalsHg6XrAWbw/QeZUIo/M4DWvMdhs6mdwe4kO
	/kEgJdXSp7R9hLVJFiOKUq+dDrRP/TW1LreAmT058D6ZvYMw4fCNuKIT
X-Gm-Gg: AYBFou0sO0RWEDEGZ1hUlek+6txCQnnRNVR8IaIhvQkEDSTffPq/6ZhJn4o4vlXjbxJ
	EkqyBfot4FGksouRDybIQBC15GlKlK51HG5ZoNkeC5v5hVyZ/XTOBBP4Vf1qS4ak2LuN2Rvl6Qm
	Ozr4PPMWvv+mh7kltFLPbkoqbPdtRLvu6KgGcoCIpNLE4YGHvlc/mSt4yGubVTTuauXTLbj9IB4
	6A03t+IByvvw6PfBx5zbwmihfjjfZdl0JyEXvXkaUbNhhvzXJ53nj+clss9OMf3x/221S/FAlnz
	qxB+vg2hsasLX1C4grmJTT4dBDQq6fD0vuQXiIo0yQ2wy+5VdxSfKt+fCi/a0U94o5EiqOLjJbj
	ytNdTETuTiPxNhrNUh8kexPVa4VjOPCp3VGhfBBr1HAPXRw2NzXR2GqI9acRI+LSaurMgUSqSbS
	evGLYVLYhz2o9iAS5QFU06wBB+8PvGeHhVoy7EebecrxP1tV3NlTA36ZaF50WqH4nZ2uukMuAtl
	FNe2MIAVOcKV9pGJG+i0ZX1g1EaQ2l9o2SDaYxUPsH8YyFv8myZTJ67qKyGt3vUvki6j1zjTw==
X-Received: by 2002:a5d:4bcb:0:b0:48e:bf0:321 with SMTP id ffacd0b85a97d-48e385a363emr1882446f8f.40.1792747660171;
        Fri, 23 Oct 2026 02:27:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38026a7fsm3576709f8f.15.2026.10.23.02.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:27:39 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:27:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Fix three real issues
Message-ID: <atsoh8iUsUET-zLA@stanley.mountain>
References: <20261022215349.87471-1-breno3011alves@gmail.com>
 <2026102337-headroom-shun-9d45@gregkh>
 <20261023085200.5206-1-breno3011alves@gmail.com>
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
In-Reply-To: <20261023085200.5206-1-breno3011alves@gmail.com>

On Fri, Oct 23, 2026 at 05:52:00AM -0300, Breno Rodrigues Alves wrote:
> Hi Greg,
> 
> You are right, and I apologize for the noise.  No tool told me this -
> it was my own reasoning.  I had the (outdated) impression that passing
> an ERR_PTR parent from debugfs_create_dir() to debugfs_create_file()
> would trigger a WARN in the debugfs core.  That was true years ago, but
> modern debugfs handles ERR_PTR parents gracefully, and I should have
> verified the claim on a CONFIG_DEBUG_FS=n kernel before sending the
> patch.

It's been quite that way for quite a while.  Since Jan 2019.

> 
> The other two changes are independent of that assumption:
> 
>   - the -EINVAL -> -ENOBUFS change in axis_fifo_read(), which changes
>     the errno returned when the user buffer is smaller than the
>     available data;

I would argue that -EINVAL is the most common error code in this
situation.  I would accept other returns as well.  As a reviewer I
would probably leave this up to the author.

> 
>   - the removal of the unused 'struct resource *r_mem' local.

This is fine as a cleanup.

regards,
dan carpenter

