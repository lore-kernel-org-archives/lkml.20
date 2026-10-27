Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113359;
	b=sT2wQXwO6ctZlxxF6ya3tt+bFQBN1Z6sAuO0gH00MTan/4a7MtD+zImQAIQqPcZhTmNZ
	 qB5N8ZqDkeaQZNV4GBsDuC9pvMhVgxga/WpdeA5TV4Ge2KjhGg2A5eQPQHfbxCqut/+Fl
	 iwdInuaxwInugPvHmFcG0H22wqCtvPEtJ/8fIqeW9Q9sjove1FHMayov6TK+qrw28w59p
	 Z95eRt/LVQ/d4bPLGLZSsgy1E105SRfxEGlhuEIFqc97wFKfYQSNcQ27gzxR13i4kXY/1
	 iueO0DT2O+1jsnr6ILgb5t9bloI+F/kTxZb1QlTmlCqiSQQbfm0FxMbgWHBwmZvFkTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wC9+SUTbqjBcPF5x4E75ylCk2pVufVoV467xGTuG9O8=;
	b=dWT9Ye7aixAV09PSf5JwKQS8RKUXLaaskdPMiXYA7U4Yq7VFSaeJnkHLbqjC7puOPE/D
	 RN1EMMm14+TCa8ls5Adnc6a5etIwOo0sJkQYeCIR+lWVB5r7J7HBv1D+LSievIeoFV5Wm
	 agjAJ0GClXkGArXJjGaC6QkYVvBFDre8EUVkod6SXvnY4SjGY+dDPRXLVJGHlefwM68MC
	 Qdsl5m0uudGcDutVgHiLLAAwdPrC8VczWKKag3scAlAhaNbjxm9VBJNDOUs+3f0Ehm7ny
	 kOXeuqIRA3MG1u96iVKhBalKu8JIBO7z942KxEmjaAv1zAFwW7yJgNO4Ts2AWsHVS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eWuf3oZw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9593E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eWuf3oZw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so48730865e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793113357; x=1793718157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wC9+SUTbqjBcPF5x4E75ylCk2pVufVoV467xGTuG9O8=;
        b=eWuf3oZwER1Rd/tSJnsoNZQNPBjzUT3PPw2zbzHqPnVUvT+V+8x9IFHQW6x+RE9zeq
         4QYBviHlCQrVbtB47GZ/iEkH4M6ex2kNJksVefwjW61Va44/jbfNRmxf4YafIN6zRPIO
         Sa09QwHPkDvXFWUfmuhPykugVjS62RYGDM/PMXPGESXj7XUG7fDJzy4y2Z5yjb23/I09
         osMMFC/uM1kRBo4oKBw6ND6aCvOGKlduvLkYYwDbS5Kx1SOdJeXuLxHjvKvDbGUCXtCD
         C9pXOczCg0hB9BegMedhYyqKNbMg/chtO+E5+AHl294ui1Wg1+FMzz6qH7HHCgjDKp2D
         tC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113357; x=1793718157;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wC9+SUTbqjBcPF5x4E75ylCk2pVufVoV467xGTuG9O8=;
        b=dfTAmoYe+B3oFpcA6MiNyfxvK3AgCqHVgp2hc4vb6HtoDvuS9jxoyLl/ze9tc5Qypi
         RZWhMaEwP/naAbi6MdLoDv0DzDGjOS6aojni7t88HIh7+Y6pjAkxPOx09wM1d3bzfJu+
         Em3cvtX9eSuhLJUdNr7uhmGAhH5jKoFTvsN+JJ53FvXVdArVPZ1pR8sVzE8g5Y0zOex5
         pZIyKKeCxJBhX7PS94T4yag+VYGj/q6hX6Yuwll5fTjKY49/X5zQMoZjGCmgt60ftJQn
         Cf/dsqDs1bC65tvlu7JPQGQgw3W36YuzOQwFHgDOJCLge5YDH+yupmzVqwOMJFki13pc
         mk/A==
X-Forwarded-Encrypted: i=1; AKwUvBynwL7ifH/x+y6BgtN0zUu+u1irOh+dIDwqoeRiuLs8RRJXjk1/DhRn/CxZ2dFbq9B+zRsBuozUZK7LPMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPy9U8+wnWCP71g5KXIvwbCzgEwoqnyFTk1eGPm/f6y8MBHUop
	LlZR9RokCihHTVDYRiL6AHXdU7cid3JMQVUaewH8FlAmtIQNGkr0F9flLoIWP2AGGdU=
X-Gm-Gg: AYBFou0T0KTgIWoWutVZLdQEOMdTm6SIDBBKMOr/FTQa0Y0ANc2vawqNRilrcaFBRbS
	3H4tMqtdGFapCBgzuIaBirk/zvATit3tH5h3JsvJWjHcHmXaNpJhnML43aRirSS1aOx5t9UlS8S
	tKjeiuGR191BNcSlCt8c3+4ccttiqqmV9jpbK95BIblRR6fRX/7o0EI79Sk03DxqP+jumEqukYf
	tNZGIC2VQnai0Mg+/pjjcsVD0zoFImx194M3oQ+JyUX7Fq32NChIvvbx5rFbK/gaEgw8Xb9b3vf
	taVIhtCC1DKKwlnM4DjLozBRG1taqriG0W1GhdH8Jw1F3YRy+5INxn7ewwcpp1+3L4Be28MvUNz
	t6GhAfGcUGVbNHfqCfrR9H1G+1fF2whL2dsh03inVRQZJ39y48qRXFQYBolH1cAJLjjjkT7vdv1
	dc2nfi+uu5+7Ksi+6b8dwrAALrhiy13H7FOd7wH8JkWOnu7hILDVVVs1g8yprZAhXKH52gn9zOh
	2idJRYltzCL8f+H1gxmJtLeDkNL8Ion6QghIZshwAekuxyWVirQAisqqg==
X-Received: by 2002:a05:600c:4fc8:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4a8cb23f9b4mr22250925e9.18.1793113356892;
        Tue, 27 Oct 2026 08:02:36 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm269405355e9.8.2026.10.27.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:02:36 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:02:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Wang Wensheng <wsw9603@163.com>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, d-tatianin@yandex-team.ru,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk_ringbuffer: Fix space_used() when blk_lpos->next
 overflows
Message-ID: <auC9CsSPmO5TS38s@pathway.suse.cz>
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

JFYI, the patch has been committed into printk/linux.git,
branch for-7.4-fixups.

Best Regards,
Petr
