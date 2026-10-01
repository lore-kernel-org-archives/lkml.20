Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD084A5EDA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842918; cv=none; b=ORGG4L5baMr8Inm1N9/viS6HoOSWojjtmlcbygGfAAZKakNDODvsO8g5axpv0QC10+uAocGBUqUFFvC9+9U3/ooRmxUb7L1Q9sWPrf1s8HqRiFkmjhcyMvS3qQ8L1xCzYGkqBnbS/a6/y2whYVuwEEexJNe4+I2F6Lf82iSiSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842918; c=relaxed/simple;
	bh=SFWYPhaEGj3UnxBHEe2gf32Y8aVtv6hsGGY2LkfRXaM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=No5nkT2v5kNAmrYq26Kw/V+h8zWMcgO+MunE2ZW3j9si+zn405rvCDcOFGmKOst6Cuz7rz3yQ50/ijCnt5h3uN5hNJLyvDGDFyu8RxjFRSVbSeLQogtfSpFWCmE0oDavCCUgeJnA6/sMw9gcwqRHRKsCagvckt6QQY5u5icEXMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQw6RjaV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQw6RjaV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso64265895e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790842911; x=1791447711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVIqIlAeBaodz/jKHUPLRi2NF2+TX33O2kKv6cYqX/g=;
        b=DQw6RjaVQHBZD01xAfg/34C4S9kUsnymCITopTWkK9FRLcMGXcipdx63ivh514e586
         eNWWjdYaP2szyyTiOMqYPDSXoPMBGByEKLhflxEyPrips8OdDqjubb5pjv8UCuRHY75N
         nwo8TCbXUQTYuzCAqnjs9dTR02O4jxlKoxlEw5BA6iKH8w6nhl3hkzsHJyJLVtcU7fNw
         aqFgzqx5/cS+IYMbYENy0/fUVb1m1p68cY07E98HnL6YdPHr4AE4dJSvjabpVQ5qNLJ2
         0ThM9fzOzPhwsDeqVV9txmNF7teeK6nfpBdt6pZS3cO8KCg/+NZbfxWpgq59j1EYZKM3
         +0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842911; x=1791447711;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVIqIlAeBaodz/jKHUPLRi2NF2+TX33O2kKv6cYqX/g=;
        b=zT25phRFoH0W1cup8ZucvZeKhDydbfwt5QKXAl9x8PAoHBkvCR6S/o7gIzS+GDkvyv
         xN6JwI3G7GDmT2RC8dzj46JBIFFRhkBnhuo8YHCOQbC6LpKbQuqXRgcSKoVDSy5XQp76
         iCH7Z9/QWGEN8yUVRvmjwCLEYsvRSr4KSvd0ZSAikDROUur56U7VdskmErWvlwDrYtro
         ydZHEsme22XLj7YE4UB9/xaFSQFWJg7NbNebNH2dm9dm808teEFsx1ddrXfu05egXXCW
         BwYxIMSkxRIvl5DctEQlhrGgiTGxf81u1pTrgnIcIW5FFQOOfci3Q5i4DpgqKSG/9g8n
         qVbA==
X-Forwarded-Encrypted: i=1; AKwUvByGSVgYQ4o0Ovs1yoXYe7ICQkPHU3vZIyubY6PaOOyuYAC6l1mvTDRyOCiUfiwRtZfkqUs35MIIh8KTOj0=@vger.kernel.org
X-Gm-Message-State: AFuF++mnU2wTZ1WQiwteJu6knZKDoWWjtowI8WY0wwOFT4kw6qKlebQB
	Y+yeHg0oXbAxkS/93kvjyYnZUkh4mrbe4rARBI4AnUEFFVTv765iydpG
X-Gm-Gg: AYBFou3MJvgGmRQgMZaBoeXj3xJjzYmeiSNqj1MI5FwF5yJG0Gpl2/nbKbfJtkWEU+9
	OCmEXdIApQjMuLGGj8wtJuwHfIHqdWZSeb2lghCp3rLrVORF+pO86XA98kOsrZM+7ixAEK1ayyn
	aQID9S6pk1kOW+Uv197wHOt7OkKGvD4GIU9XKnU9sXeJ8IiBln6FaqWmMHq4dM6uoxm9hYYCEMi
	P826u/Sgu3gn0Oi2aPc13OPgqeQbUFgs75Po4tkKggYhSNAT6dwvMWoyt+/NnyEs9drPiNPUgkk
	f16weKp7uAH7Osth7CczvZ3XhQAnlWVn3+zAar/QEwNcrf7TO9K6Y8Y2g08B8UxOKrqvJzS0Cz4
	MWbnzWs/ROzUA0raEJFQLV+0QDJJ4uzbjx+dnV8VoVqDiVdHALiFxxmaRjQuYCyE9dtkHgDGJWL
	5lnCOUGt1GtAqlNfyOVs/EaDjrvEgo4ADoqhHebMreo4LM1iG3EBRdFvVMBVoyiJUMu9LT6Ey33
	JB13MhPLiD8ILvO4qJmNnO+wAkKfr8Yqdk=
X-Received: by 2002:a05:600c:4e56:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-4a01b00ef27mr71316935e9.33.1790842910996;
        Thu, 01 Oct 2026 01:21:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6ef459sm36030645e9.1.2026.10.01.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:21:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:21:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: akpm@linux-foundation.org, pmladek@suse.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, jim.cromie@gmail.com, ljs@kernel.org,
 thunder.leizhen@huawei.com, mcgrof@kernel.org,
 andrey.grodzovsky@crowdstrike.com, rostedt@goodmis.org, ast@kernel.org,
 andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org,
 eddyz87@gmail.com, yonghong.song@linux.dev, mason@kernel.org,
 ihor.solodrai@linux.dev
Subject: Re: [PATCH 2/2] kallsyms: Optimise symbol name search
Message-ID: <20261001092149.22e07e90@pumpkin>
In-Reply-To: <c26e2afbfa2cd71b2cf8bb0e963bb1d67dc5519bb5c4307c96b826ae5fdce269@mail.kernel.org>
References: <20260930132109.260597-3-david.laight.linux@gmail.com>
	<c26e2afbfa2cd71b2cf8bb0e963bb1d67dc5519bb5c4307c96b826ae5fdce269@mail.kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Oct 2026 00:45:19 +0000 (UTC)
bot+bpf-ci@kernel.org wrote:

> > kallsyms: Optimise symbol name search  
> 
> TL;DR:
> - kallsyms 24-bit table struct may be padded to 4 bytes on ARM OABI, giving
>   wrong offsets and a possible out-of-bounds read

I hate ARM OABI :-)
I think it is the only architecture Linus still supports that aligns
structures on 32bit boundaries.

> - weak table symbols may not read as NULL on relocatable x86-32, so the wrong
>   table may be chosen

I'm not entirely happy with that bit of the code.
There is a conditional in every table index.
It is crying out for either a static branch or just compiling the file
(or selecting between two object files) once the symbol table size is known.
Either removes the need for weak symbols.

Anyone know if there is 'prior art' for a late compilation?

David
