Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EF12C026C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350653; cv=none; b=eF9/ZBE6S0IIBJPhRT+jf/DUz11RJ0iW11TqH730z3JeReZALgP/kfPc/6Ax+9MldMQ6gpMN6zzdA8l34HFGfvn7sUQf1ozhh4w1xCrTu45S+CnHE6cBd9wOQnsukyEZfbAlTvzr6iwQ7EKCK1aUGQwigEBkQmFufRZL/FEB0Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350653; c=relaxed/simple;
	bh=yBxhH1X8FwRDNynk9/Cf8yfzteLxe/rZbDYYuZW3AA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uyvc84z43BWvOqVujspQjJu9STjLAqC67+ZjrFeYgEcEzksppg2UBULFLwzr3oxVGp3ltQtWwGuKm9Jf0jz1IEqm0YIwvVx2xU+W1vuETZGjjd3ls8dn+ucPCgT3Rvdg8txFWC05+X7o4ccIhLKRj6US9vv3M1F63uG2Lbuy5ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=exrT79PJ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="exrT79PJ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8253bc5a613so2530280a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791350651; x=1791955451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nSsHXzg/zAiuljQrmabDi2S1XxlM4/g5SvdsTjxLDkA=;
        b=exrT79PJafB4ahJeTPpuAHZZPWNNrBccMsjPXvqBmCyjSxT86AQCaxLfnsQ9QJWbcr
         F0RocTo+5uOm9mFaTlMn4SG1VEY4kFPDZrvcd/7x8MsTopkg+rAytffZPvfJUQ7iSXsR
         wC1XRt5EJ5t8qU5q3Vdi2qgSEVbACLGYqYmzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350651; x=1791955451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSsHXzg/zAiuljQrmabDi2S1XxlM4/g5SvdsTjxLDkA=;
        b=DKCQXGZZh6+gz/R0l5p+/NmL1UBKQVyBTieuPyTM6nskcmAzKSCvMCeA5IV3Af9Lbh
         xV17in5cVc30hxMGDvmCgtJFxMARFTh4cZF314I3u8sV+hSCH7IIabkOleV+Jz4/jb8h
         uzCyAnt/M24dkugQKkCPh7jfCoMVQMlT59kbU8IZZPUNICsW/ntR+l9Y3xFcsfGrxF5v
         g3W3QvWsLWQZUOy07YxRjQNTnjSFu/DlW+1dKjg9rPLdgTc3Y39Asv7hCkxqgkD/p4s3
         BOIkAxV4e1Avg9hcgHUmk3sg+dNuQHSkCNI+w6rJ+btGw6z/FQ9aA6dVJISmV+f+kbwp
         m9NA==
X-Forwarded-Encrypted: i=1; AKwUvByZC6UDemtawoel41bmNY2aL0P6/ZH0EABV2vwwStD8cAazSY0be6kiUwBlW61AAG/zwWvh7Jj6qSSgqU8=@vger.kernel.org
X-Gm-Message-State: AFuF++lR+yZiHhbvaT3+ib3YyBEOJ5S8xNz1ewqwHBxeR2Qzi7szAA91
	6zNqOxvlor65ozXnt4MhO5gkbq9NxRMHJ+f8XN/fE412fNpvHWlkM/3/JEQD3I+KfeHcW3XbIc+
	zV4OnDYoEXw==
X-Gm-Gg: AYBFou2HlRlUINOmag1NEJhRz0IchtwI5NfRiIPUV+dIdfjaY37ZwP19P4EsDe1PMwF
	pIPhdnFWRH4+/NJ+qPq3nExFCxtkgf59JAUJ86d+1kwh5oHkbKY9CLb4M/gbtbd5PWw3B0zwR/H
	VWmxhhYnalGhGk6rf+T6dLHbNLVtngx6cnxpw9m26NsuOgjJKNHKCj19t2mJcybAm1UGQDtNlKG
	CV2RD4vG3u3MI1DRaQV/yLQiYUkDvAVti8WQ1Qrr7wNmRmrzWlLoNRIiuIV6C8qQoF3dPO63PCS
	tgdTY9Rc3DlJ1cf1dL+ZrArMnISXpbu1rIxri1y3BPk433zUZ+q9gj1aKbn7B/7SRKiJhEQATz7
	KtJKxyUV1tZGxxKa32e70lJuMKm09thbSO8Dp0lOfpp+tvrFaGh0JpVadnjSn/IcIDPX7zQDfpb
	zlAk2njE/Ra1WV4t+8es/04zq0y4yJ14Br1JFWsp5FgalPLolS4caw8vgR+I7d65aQhpwWbDmlH
	V7E+Ep6PIWggUxbN5zbcLlg4m1bpIZ2dHxJ9DqXTmayMNvjxKlNmC+VkiNOr/3x
X-Received: by 2002:a05:6830:2302:b0:81a:9522:f007 with SMTP id 46e09a7af769-82ace793d07mr2045456a34.5.1791350651470;
        Tue, 06 Oct 2026 22:24:11 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82ad9ef4a8esm1882490a34.1.2026.10.06.22.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:24:11 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:24:07 -0700
From: Kyle Zeng <kylebot@openai.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, outbounddisclosures@openai.com
Subject: Re: [PATCH net] netlink: avoid hashing the network namespace pointer
Message-ID: <asXXd4Xb8yCZFIqy@com-75606>
References: <20261006224149.50498-1-kylebot@openai.com>
 <179132696042.2231598.3001993287250723765@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179132696042.2231598.3001993287250723765@kernel.org>

On Tue, Oct 06, 2026 at 10:49:20PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I have a PoC for this issue and the symptom is that it can lead to
information leak (kernel text pointer).

Best,
Kyle
