Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C213AA1A7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889060; cv=none; b=LS9BD7YkBSokTJS70D8w4YDjwkBBTsQieX3SLcCuty3JrV9na0o01veWUjcXXqNuEaDCcQ3hIrrg47jjXpBSSfBo8YZeob7ZGHBDsSLH189mpfG1o/t5Hke/MmcwLZ5lN3evj5d88sZMAk1fGft4pELbdsMgkI2S2MSiLUcm3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889060; c=relaxed/simple;
	bh=kq43sLBz2ZHXLrl07cvrQHErCwpMzQX0LD1VRAlDuTU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Jx3f61kTAbPtZC82h18GMMv+RnPz4bODb/1CnJK6tj7hV/dVss78xs52KyZQCsmg3s6aJpA48+PP6Ld1eCNi/XpvsvTh+80EaC5rdCr4LN0DPQbCRUxd9/JZySqiUc/zBvQAeg33FUEPaX7L+qFnODXgpz3qMbZEKP9VlBwzyI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7U4HWhw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7U4HWhw"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so652076a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787889054; x=1788493854; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3KcPIBnQ86fi9vMxouOV7SSnCq2u1kcpTpfhzejq3Hs=;
        b=R7U4HWhwLrwKMC+FupEIzsfEhLvkgpLRjCuG3fdRGIljVMKbcUWbOmNIafc+8KVkyX
         qzTfcd3PB3t3/jaQD8N50cEdW4hbc410bFTwUxI7LwATn8I+Lpqa/mFKJyComo2SusIV
         xJwGDdklVmGtT46XLy5JByHJf983m3WagzUdyOFq0XRQZqjc0zx4C+jsFzpMH8TE4x3U
         Sno4HDcLKkj3+2hW/v0XuOwqDjeTHBou3395tlXX2tr2KKxqXZ5cvFzfFP5485jbhwJz
         zsvaC0BLJA/2+GdpRn71zBgS2LJuhOEGC6szDvEEJ4bDnO5p9b8cX1QskMBPH/onhBU1
         jrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889054; x=1788493854;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KcPIBnQ86fi9vMxouOV7SSnCq2u1kcpTpfhzejq3Hs=;
        b=MfOZMb/PPzouvMUif3FPhep5g2BwjqA1GSwvHMwgLopL/ew6nYn9YaMrs8+m48mzkw
         waOp646J7nL/h7Lq9gMPaM1LZoNuYXgPJDWmQ1yUeddqDZXzeQUNMfVfDeTfhXL12aM7
         GG7KkRH3eSPPCjt7w34pLss1xJAwT3jqoWi2RFDm2/SnEq7+I5/MYVNrZqjL2oWSSQET
         BXP6WcbkHhJ+vQ5zxM063tbjOmgZyQWF/AfusMf9H1GO18tz1UWESeru/1cyw/96EIeg
         LWWla0tr7ClBvx56l7ZlCE4MxqSHdlQR4PQ6ufPSJSaFNWTLwFPO4nJCpZxzCNQYrtvi
         5mHw==
X-Forwarded-Encrypted: i=1; AHgh+RqdJ1z8MUB8vDkUdBzCitcX1vHIgXj0QS0+zuXsfwWF3iFh/6QywrV0OGzndBtURLX9pJH2ScNiHj/oB78=@vger.kernel.org
X-Gm-Message-State: AFuF++mwHgG6gF1G98t1jUKgNdkW30lFf6QcnfP82NTDXjLa5J6C73xU
	gUQ4MQ1GpvGUL9AKbVjqJFnjAQ9ELahL1DYR0dZfFgU1VHuX1t4/WQI2
X-Gm-Gg: AR+sD13RhW3Ow2SClr/uxk++Mh42410HtNeXagpcUVit6ke5uzYIKF1tli33hjlHLWw
	0tKLxv8gpB5ORfDhfAEP7MF3/35RKRi1D+KOnNAAOmrTgf/0FCdrvs050E+fe/uGuPOXZZU4Sbb
	9zhgaiNZI8CNFdHmhiDU4CPB7AQPnNYuKafAlgr10lskAmBYXpuW0TFwl6/cPoCeTKGpYikChNr
	gLQ6Qng+pqyTDsTnbYcJdeUV4bzL4tvmSnRtFgyTUU/OhWlc2AKmMeEtt4sxc8KvM6QqrIZmYIb
	LNkAH0hbbFygT7yvCiWei3MikMEAz6pxfulSsmQaXymV5MHb9+OvkH/PMnmoC7sZK5gGv2yawGX
	1gB8v0OIJJL8XclgRXhUOu042yvJ6S2+MOAV7kGgYtd2QK4W4J9gPTFXFC21KMwaw9RmVNDd177
	17XmJTB3bBe2uQy5tR0ucXGcbqJATGm7uqE6TVnhVTusoXfpR9F4esVm+ure9z6ZHx7w==
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr8174751a91.10.1787889054288;
        Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm1659184c88.15.2026.08.27.20.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] binfmt_misc: only let punctuation delimit a
 register string
From: Farid Zakaria <farid.m.zakaria@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, Farid Zakaria <farid.m.zakaria@gmail.com>
In-Reply-To: <20260826-work-binfmt_misc-delim-v1-1-43618adf8599@kernel.org>
References: <20260826-work-binfmt_misc-delim-v1-0-43618adf8599@kernel.org>
 <20260826-work-binfmt_misc-delim-v1-1-43618adf8599@kernel.org>
Date: Thu, 27 Aug 2026 20:50:28 -0700
Message-Id: <178788902860.3236768.6730484936359324341.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 26 Aug 2026 17:55:46 +0200, Christian Brauner <brauner@kernel.org> wrote:
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index ddfd3aa57ac8..809c91d21b39 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -100,6 +100,13 @@ static const struct binfmt_misc_flag *misc_flag_by_char(const char c)
>  	return NULL;
>  }
>  
> +static bool misc_valid_delim(const char c)
> +{
> +	if (!isascii(c) || !ispunct(c))
> +		return false;
> +	return c != '\\';
> +}
> +

Is there a ready you did not make it a single && ?
Feels a bit weird to check the negative;

i.e. return isascii(c) && ispunct(c) && c != '\\';
(DeMorgan's law)

Reviewed-by: Farid Zakaria <farid.m.zakaria@gmail.com>

-- 
Farid Zakaria <farid.m.zakaria@gmail.com>
