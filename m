Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109004;
	b=KK0SF2MXa5Axq1uNN8kQtni1sflzjw3nEeviPOs0EBeGnT7n5vluggsB02e5Mtl6lgIk
	 AQqfCfaUTA4d5HXdVuqp5tg/7mkLxAAlBjXvfTsBn2cpnuTP5edPltSx4zfbgkLho8/S3
	 qKFPlBl7C4Ag+UOD+/02jMp7mo7t7kIoFDFvd37vwjTeOQm21tmX8pGIRS3CfX6gZeUAi
	 eEXVdlFkeeJmK0lEQHsIDRGfuJuZEanLg5jITAmF+6Nbpa9AsMyk21bYgEuKYxTWolWBv
	 WLOD/9mZ7CfcpE363vUCh1BYMKG8+n9eWDJ3A8Qh3hjZLpKFlo7+BELNewhV8lGKJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UE+HFwEBbhDv32NluhVIPMlJ26BlYGK//kc8ol/wf4k=;
	b=vrzV84mnjQRlWFUCFvu4LL+hkkjp/NXsnYwoyVptLLeX9b7gNNk5L5kzF29mbTI7hjul
	 n3RcoC32szW1JcJ/+/Dh6D4dIGypmrrE1ou69NnP1KouIjj1+eYniNJgtQeVdxe0zcCfD
	 djNGck/ZZ9600mvcG7xMDp+lbQhfDJ6RVuno4+blJCPKm+Dp2aSsQUj82bmzNmAwWIk+N
	 Ip15g/SjR61pSCa1dt+VP/xlTa9OlSYRLCaH5Hsk5AXh66GeEMcYg9FL9ED8pQdTQpgSZ
	 RRhN5Q85Tl0AtKyqzSU92oOoSy45nA4wY0rsuuZA01+vbb4PLjPjSIKcvYrvs4fOgIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GMovIf2R;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C9606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A2C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GMovIf2R
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2949418f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793109002; x=1793713802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE+HFwEBbhDv32NluhVIPMlJ26BlYGK//kc8ol/wf4k=;
        b=GMovIf2RlV1VU8qVWF9Qh32xz0ZzK4MlkuTjPwULpY8mO+6f20rEr1zLbyR3oMjB77
         LXHC+rAzt6PaatLNuyWuuVtmBOdps2OdfJU8hP5DC+PFbIh1uojLgl6OAu3McNZXHzw0
         G3cihtaZrunCAHiHiV8czxM4HWQMNJs7RWTcfg63RRtI/jVTn6FyCANlJodUCPa2U+pj
         VN7XvoZMFQlShRCDE1uQY9c0/4mP55flVAyofbCb7T1PCicb1qUBo4egT+iRjm78zxUL
         Tu4ERaUmr7o8mrPB058dgmLYJjzB1PBcjZ7swkgXilRctWYogN+gwWUZwsHZyvosrW5h
         64KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109002; x=1793713802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE+HFwEBbhDv32NluhVIPMlJ26BlYGK//kc8ol/wf4k=;
        b=BpQckOJJmJEWZVwmBGtxwvibSYI6oREIs1gVUhZGE+Gb+aINm6ug8XO2BqvKAmn0SF
         Kl+FVFzftcmIXQ0J9z0t76xGYwd9M8Fi6XYgbj+iDaSGO9fhaZ0xOXP4nVV5iEby5FpZ
         tSE2a+WT6KIZcCH5pDtOzjO8HpVmnupq5pf6P2EjkaI2g67kJHuJItsx4sNRlZvMV3al
         /HyzNRDct68KbXFGpaq6MQoyK8sM0/3oZu7UWk42wEVy8cwgRw7a0tl9JoIVVKZaRrkm
         H9wHCL4lHS4zODPFspZ+E+ZhkH7TtPnfIYr7aO3A8Zk5Fe0XAAnla9RsC2Elgdzyshqc
         7yVg==
X-Forwarded-Encrypted: i=1; AKwUvBxKqxq6PAroUFOPGiaflLVzkO6j+JAtbtJvQTPSxKbppUm1zLBoqfN0v4OWyzyIcFm2DTrWTJWdWLm8yLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYUvITuZ0lTOWppYz8DK16xqQXG+TUlfGp296jj2QrkLAqQVww
	/8sjcak9/rKJQ54Eil9Kx5dhxToC8obknWNgAetKBsdgiIz8lhZKgApC3SKq71CGLb8=
X-Gm-Gg: AYBFou2ym5+S58+8nlAwztZWxLE5ITrP8fhWwIiETMJMYcPUKaSP0lT3t3v7QeOhWX9
	RDEiiRFLC/WivW7pzBCDfGL0/uJwcXE9rm0/Egy+Ft1IuHz5CnMxUwKnpbrkSJ2FnK+wCm+l80E
	9qoOBqANw7LmQI9bA6KFwvaPiqCJkTrSHH4Xjt0YJJZtxkniMN5TpQFkOJReTTT8lOfNbH/yFVC
	cpVv72BPtTO0F/6cUXgoTtiv1CJlUctytpToBaLw3tIZhr0EbxcryMYaO4YKeYhqP7JD+6I0nlE
	/lV2p2Nahn9E5mfdLuTd9hslc7Cy/1OxanLZ8JBx+5uz6rJ6B/ywUhw2LdsFXtVnihzwZccMCY0
	CPO0zRfIWYqjqxyEQ2UgjOzysA6cIeVGK1ZisKreuqFhGuASNhLgtBA5yzhPjZeDUwbj2NYmbNl
	NbIx3ywpHkXwIJbuzxmVI9Lk4vJ0vyjJKESd8kXmZq8hsSMRD40/K5zkbIGilK1oYsHqbTLgLSR
	wt/c5gx3946k4iRPHtDveXYySm+EnElrlFuMUtAX9VGIv/KgAt8lHK+nw==
X-Received: by 2002:a05:6000:2884:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e3ebb18bamr17466265f8f.44.1793109002312;
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm24068407f8f.27.2026.10.27.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:50:01 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:50:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Wang Wensheng <wsw9603@163.com>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, d-tatianin@yandex-team.ru,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk_ringbuffer: Fix space_used() when blk_lpos->next
 overflows
Message-ID: <auCsCAXZuYy1gXeO@pathway.suse.cz>
References: <20261004075755.363989-1-wsw9603@163.com>
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
In-Reply-To: <20261004075755.363989-1-wsw9603@163.com>

On Sun 2026-10-04 15:57:55, Wang Wensheng wrote:
> Since commit 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data
> blocks around") blk_lpos is treated as not wrapped when blk_lpos->next
> overflows to the start of data_ring. We use the indices of blk_lpos->next
> and blk_lpos->start to calculate the size of the data_block. This computes
> zero minus a small positive value, resulting in underflow and an
> unexpectedly large value. Simply using the original lpos with wrap-counts
> solves the problem.
> 
> Fixes: 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data blocks around")
> Signed-off-by: Wang Wensheng <wsw9603@163.com>

Great catch! The fix looks good.

Reviewed-by: Petr Mladek <pmladek@suse.com>

As John explained, fortunately it is not critical because the space
is used only to count the free size when copying messages from
the initial static ring buffer to a bigger one. And the bug
will happen only when there is no free space anyway.

Well, I will still queue it for 7.4 because I am going to create
another pull request anyway.

Best Regards,
Petr
