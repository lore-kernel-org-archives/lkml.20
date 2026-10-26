Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993735;
	b=AL1S67Jugzex+U8R2mkIKNQvNd7IQs7nL0gpfsN41FaI3F5vZxv+O/lelh/Kl5R0Erl7
	 oP9t6aE9zyJh8a1Mtmelf4RwkbI8RqdH1P8H6LEyC/b3P3Os4Llm4vKPWdKcIR+iPRAag
	 b8+s7mXhKMq3eNtofsw/2Rh9kuMuI7JK/J2Cc+JDQJ8RZjitvr7Aj17nNBxarFDd3AcDn
	 lEciJ0+FzNuXtvo/UFyd7Bak6bLtsHZeQ6l3CWaM4GHrwvqeaXsyeRLLyMUezMteU1YEG
	 808SlFeKklqG4ml51SfbDurnNnHNviB5Q6G9CeS2hZyrGiAm8Lt/HB7OXeLB8JvxsvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RYAYmmDh2YKbl8OgItUgUWB8sbjY7eRAlNwNblYFtjE=;
	b=zLuXwCAd9YrO89/seUTMllyBCypByNKnI7RY9ySJW4BpNkh/yAWrmdVNKt8J5N5wdcGp
	 eSnCsOEIM28avECjhYJ9+Jl7UZawUU/Cs7Vzsjwd7sRaQma6e5ejtpC5PqECZMx/N2YWa
	 +9idqTtC2hJyKM4/BQ22KQBmuEEyoiTYZQN9VJ83LuzN3t4+rsAxHoTPfZPhYrikpDV/G
	 7nEBBH3/6nzHVuLb3VzwjbywmxBm3clHr/fLFqrdm83QTQxfLS3dueCkyjBCXvcg4qzg6
	 G9dqxC6IgAxCKK2csGF46OC45OKp2zKX0d78hRt/SZT4EqknE4ttxz+q6KGdyKCWjig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XWLsYV4u;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE307606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE307606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XWLsYV4u
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2418418f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993728; x=1793598528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYAYmmDh2YKbl8OgItUgUWB8sbjY7eRAlNwNblYFtjE=;
        b=XWLsYV4uiHkUfWr4Q/biUnve12vHb3l187f8nBcPpVIcfi6tUCwW/CadSRqpyeRfiA
         dH9iWalQFr7XHBQnkLQ+d2/dZrCYkkUKtvcaQiPRQzSvLmS63AUzt5AfaFOeSd9eqWNu
         AheBWJKc6d+CkJ0UJS94rN+tS2wDqy7R9ZAEYia15ERZrecUcXjq2zP5/dU56/7Qjm3E
         kibvOTNqbm18DDAOVYWyl2bctFVfn8XG/hQLIiXZryxLf1MT5S2pA1/stzMngM/aIL4U
         KM3Gf53CMGo1rPkcJjJoxdfSV5aFeP6K8HJq9pduAOkpr4V+S+wIx3iqfTtWFvmtIsWy
         V2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993728; x=1793598528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYAYmmDh2YKbl8OgItUgUWB8sbjY7eRAlNwNblYFtjE=;
        b=dwaGrkhaG63QCu7uX0d8naetPbTcQ1cJfzJEJZ/OfQ4BPWo17iw0+ks/dcmDpDbYeJ
         umY4k0Zk+S41BhbcP7xoVX1tLlgJRKPETjV5w4kuwn+wmtZNuxTP6gIbGZTa8dpoGkAA
         LKFGzKDfKlZySkzKvGLTVIgVU3LyuJpqqdI+07nzJxlXFsuZLHn2lQ0iUbKCJwacrLC3
         JEk2XqFbA58x5Z6ZdldLzsZl8jxA9zGa3hFsG27LMzW2TIfVrTMlKEBNL+JMH5H034AH
         Sm+aGgbI0fwRXl1SZxTl/pabSJTyu5lmy1KnRM0Hl74hrERS6LysKdlQkijmwS+qPjJF
         FmwA==
X-Forwarded-Encrypted: i=1; AKwUvBwVi8B+RDMv575sPdEYYBTjIKApq/diU94XtN+1ycd/lWhO3XRMyZAMPw1Ur+zF6kIH3gbkPw8I/opWuvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ1wfPSXNUkgtIO2yDWM34oosRtlY0r/Dw57ExkCRw3Q0c0q9P
	5fJr8cdCr3SATx/zj6QgX+jvWo/K+QdNlgIcBKl/c6hgA+u5Qvti5/VOqZO4t6o9/EF5evhb
X-Gm-Gg: AYBFou3XLuKkVvZ7IP6dKSD54fSzQcIGRCULid0V0vQoFs9ECIa4+JA5Y4ag5vD1NJr
	OOCrhUooxbVaKnTNOSqwTugnuhmKVBizov4/At8AaZGInRmQ+clOlKfJYoLtAkNXKnTX/9uv2Ak
	K8eNV3eY0ucN1NmGA7RHg9sAv5HAeEUUMFqTRVinAuj3OZOP/3frmR+I0teO9pC8+MrGQ2iYKxK
	Wiz3iWtVaA0RtWZ6wObDzlK+4UZGxNaLLLobiG1rtH77RSgKTzAZJlTQ623y5zJnqnmgVMV3d6W
	yjCkgn5JbDk7L0OWEQINCAuQZy3NuSNIqvv2a4wCpcmg187n0QCG+VyOepm2iSCIgxlVPrV3gBD
	PW56AWS2uiz7yImPdlRG3X0tNFmDftqT6H/n3zyABZrgVIUXqzZXuMdySo9QdFU/xJWBXXA9hTg
	ml14Pni9t+SapfaVc5mKNlIU7hyE5/EP5XXbkRkkX9qgvr2SWlNCdgIcc4SgZ6F6xqW6iowBnK3
	UTEHkBKXfRBBO6zhcEvJI1nElEFv9MBz7cMAGKE0qVy9msjaPA0A1HbAfdVRhMko81DvF6fjw==
X-Received: by 2002:a5d:6184:0:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-48e3eb93665mr8333616f8f.28.1792993728187;
        Sun, 25 Oct 2026 22:48:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm14713554f8f.27.2026.10.25.22.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:48:47 -0700 (PDT)
Date: Mon, 26 Oct 2026 08:48:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
Message-ID: <at7pu4hldDTgZtXy@stanley.mountain>
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>

On Sun, Oct 25, 2026 at 10:10:03PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> Hi Andy,
> 

We don't need this in a commit message.

Also I would prefer to delete these weirdo debug messages.  The
normal dev_dbg() messages are good enough.  Plus, is this even
used?

regards,
dan carpenter

