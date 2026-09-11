Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E3497B63
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164569; cv=none; b=DZ/6mT1+tk75HWLSXVnRHCaHmW3s5uexPdGngDLbstYuSgmiEcYqkHePuuOj2bPhSTnX7wBK+7ppPGwavaWjeRO3EOce/bM4VSTd0CX4iW7vwcK91gvBhv+9RPpW8Cjo85JMBebxspLgC5fn55sN+H83wPPUgIOzvYcMC9ahnpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164569; c=relaxed/simple;
	bh=ZhtceR9Fm3x1PqtxgXKQP5KqcUOG2uEBhA+0sw07vNs=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=fKg63pTKKApxqB5BupqJAbWyGxemSgmA8BKt7CS3E3zHlKogOVVC7hh28bD2hypuaFOW+qoASPEQOvf5Izn4U9kp0euq0GBqhY8IJ9tIlwP6qtl60ZUq+ttZE1tMU+AxnGEg8zsVnOs7I6/WjnW/YTImGPg3HQpq8hk/f3GjKbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VnmBmrqF; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VnmBmrqF"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ad20d4so5030885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789164566; x=1789769366; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LX6vyJd3+fW0hcCFrd1cZ1+qMqiip6Fji47Ec3/FuU=;
        b=VnmBmrqFi/Ky4EaYgXb+5LF0He76SwsE1aEDzuw0ykfftpg/LAxW2KEzCLmMPDnhF9
         1Cga+bQIN5BIarqclsaDYRQJXkZH4tPexBGQtTIbLBUu1U1kzWLPuonSua40v/x8XJ8G
         zybm2yraGgkgfkCWl/11yEGDVANZ+Y7GjlfXG8B766jHmjSzgY0KaLGKT5eS12km51YG
         SqEFx1EoMOP3UxUDhU/agcvYq6gMqwHRRk4B1HTodUm24ZtE/CzECRRhCIhbnCAMytAW
         Uf/guP7ZX8TQn9qmrJCebZPtYBlPkbwRL4BIvMsmgEQuTfez9+j+UaCtUZnJ3cahA9LO
         PJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164566; x=1789769366;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LX6vyJd3+fW0hcCFrd1cZ1+qMqiip6Fji47Ec3/FuU=;
        b=eVc0ISJKcCw+bJduW6KUDp1zC84KGReZiU6AK380EFuhjZ1SazRPPr7+44Y83Ib1d0
         brJsBlp3TlpDxLF/juOgjph2OZMWJx4dof5pkDaWlCtjzrsVj2XT1wLjfyTJAf4S5F+d
         yef5pZpOtkFWNica6r5QSdfdw9q097o8FMZI65BP5QBl452/APOR4wArOD4QDCAj/PWA
         RBeqk0EzbZ/Z7WWwO/pbZ7zpADQi9/X79FsviioicLa9BnDMsBFaLwb2FECv9f9y92Gd
         l5JJyzW3mNpjVjsq41WN6n8XRWOtBUHXSBUNZgVFVr/2WBsXbe49Y17tyvDh7Qp3kcrQ
         OhLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpzvoZIvSi6MF+tOcF6mjNjJaknXaUscPbjSQs/YVBNvrrURyK8k2IXO2JBVxYOeELIaoTOyrgfZW/z2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lVtA3pBv1deGAHkTP9Ifjs0RZOqFoZkNv734EMdIxdOhjquRde
	PDHEIrQnWi1ME7ofia5R6AodlyfwwHgATpjKpBruOWorMJwcJI4fkuBTEXJ8HgJ/dw==
X-Gm-Gg: AYBFou1jQJSAGE4aiQldSH5TRyqY/y1I9ubsfHLon4fBewg04QtNh4RQgFgBm3t+Tz2
	ouUQPtiD1+ZPMtoWrcHiKpHOFgxPWi4OFqbhANyp2Mlf6QoPTyKmkU216y0Qd51HMBanweqoFpk
	ka1/WkuHq3W6S1gcm6KHe05yG0u6wKDVOHMSFzqgfhvCb53/m6zlFcRTgq3bz3lWGD5srtvII76
	hTAkWH9eLit0VNE8NPpgD0DFV8BBudepjQ+ZAZqkswhKfEB2+KLzbpugBD1vT5r4NTZbpg0ythm
	ut0W6GzHcROWl3ddFkOpL6Q0X/sqzaYdlOpNNaudxUo7eoPtcGNAwLcmve5TTdXzmkEiFRNjtk7
	AEeFBKb37lv+iHQReBD6Y1T38Ejs+1oT1+YAOq3wv6Vvr19EFbuZhE0xXFGTsDZhYBHygIpIXlT
	2bMrlCr1pgEcRJn/VDwZnwwB6YE4Q8F/ScPKzQuT9m531sjrsUGZiPZ1/yolnl0ZhlLbTSJzvfY
	GKXcKgBftS1IqqxLoAlMvYOeJD/NG/CHxbmujC0h54Es35IwL6tZIIpRwehm0BJSt2RN3Jqq73k
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr45756085a.37.1789164566557;
        Fri, 11 Sep 2026 15:09:26 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm342667285a.37.2026.09.11.15.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:09:25 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:09:25 -0400
Message-ID: <81cbd4589373304334c7df4c1eba3660@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260911_1254/pstg-lib:20260910_1848/pstg-pwork:20260911_1254
From: Paul Moore <paul@paul-moore.com>
To: Lincoln Wallace <locnnil0@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp, rdunlap@infradead.org, Lincoln Wallace <locnnil0@gmail.com>
Subject: Re: [PATCH 1/2] doc: LSM: describe CONFIG_LSM and lsm= as the  selection mechanism
References: <20260714013832.977443-2-locnnil0@gmail.com>
In-Reply-To: <20260714013832.977443-2-locnnil0@gmail.com>

On Jul 13, 2026 Lincoln Wallace <locnnil0@gmail.com> wrote:
> 
> The LSM usage document states that security modules are selectable at
> build time via CONFIG_DEFAULT_SECURITY and can be overridden at boot
> time via the "security=..." kernel command line argument.
> 
> CONFIG_DEFAULT_SECURITY no longer exists: LSMs are enabled via
> CONFIG_LSM, an ordered list of the LSMs to initialize, which can be
> overridden at boot time with the "lsm=" parameter. The "security="
> parameter remains as a deprecated way to choose a legacy "major"
> security module, and is ignored when "lsm=" is specified; see commit
> 89a9684ea158 ("LSM: Ignore "security=" when "lsm=" is specified").
> 
> A previous attempt replaced "security=" with "lsm=" in place [1],
> which was rejected because the parameters are not equivalent:
> "security=" selects a single major module while the built-in
> CONFIG_LSM list otherwise remains active, whereas "lsm=" must list
> every LSM to enable.
> 
> Update the paragraph to describe CONFIG_LSM and "lsm=" as the current
> selection mechanism, keeping "security=" documented as the deprecated
> legacy option, matching the wording in kernel-parameters.txt.
> 
> Link: https://lore.kernel.org/r/20250114225156.10458-1-rdunlap@infradead.org [1]
> 
> Signed-off-by: Lincoln Wallace <locnnil0@gmail.com>
> ---
>  Documentation/admin-guide/LSM/index.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Merged into lsm/dev, thanks!

--
paul-moore.com
