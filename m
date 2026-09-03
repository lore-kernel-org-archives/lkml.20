Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACED4DC550
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452277; cv=pass; b=NUBMRY0v+Fr6L+A77bZmwxcm0JqoDduOdNUjNY+m+OuErKBQ8EPM/t1jF02msq5lFq0/mTNm0HIwtQCvTpBFqS+jJQLEVLVht2Hs15GOxXfDkKSAA9zmaaSrrIfcPmetnnaDzwbbLZH4ODsoD3pp3PIcnwknjuK4Di5B4Vc4oAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452277; c=relaxed/simple;
	bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edEaD2c25mCAaz/9r0Cy220XgcVFzjQfVFlYxDELeN/5XqayE69UgmRUn6WUQT5sBVu2UE16FMV7cAqfr3BuLiYpSoqakxUzwWJOpYQUSUgnxu6gsBVJdFKI1Z6OgSXUAAmr6CWf71r0TQH3+yh2yIjmTpir7eIXTsaq/C/tAqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vjgl+rth; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vjgl+rth"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe89fb333so30585f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788452274; cv=none;
        d=google.com; s=arc-20260327;
        b=C6VLj05itQopmO6u21nfkZBUYm6kGDCcrLdoxILISc56IFm6AXc0fwEcfFpCls0nIp
         EqS0YXh0tq9f/UJ/zMcvMhcNQHJ3dW6EXHDMs/1SwS1FAVFVWBnScLY2hf5FPK5BzBXE
         EJMjwgvO9FXgOMC2dDDR+ojEkzmu5NB7x5OzsVmW/6MNzr0/xxDZENS8hJZUhw+psESQ
         YU86q9jaOpt0v8ZbW6W5HZt6JyWd+UiyW10hwqP7KcvlKNLiupOpTYyW5mt36KX88rmo
         4ywdeihNuDwQyoJ5oJKwHRHPz3xXUN4f/SvXTFxzJS4436zGQRj6fQmvMlglzJ6KRsj1
         LFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
        fh=bjqAOjHzVyscGrlbDdP7Xr+vnIXJPUc1Y3aNnRLzLYY=;
        b=a4Ge+/iVs/jI2h+4VHS3CX2Jqa59xUh+908TP/UOxIMRaOFQfv/OxUCnv+RIJBWRXe
         hv1KehP/tf/jU9/hIbfr+vlpDfYJsNVY4KZXG6XZQhCd/Na0Edoh/MOcZeHqw+vNij4k
         6oe6bRtQ1mVZFZQJQ9vrZcKfg+ABp5owZoFJ3e4MtlnwpHawACAiC1C7eFvtasTgjPVM
         8146g6NwCg2Zig0SVbAh0Llz8UK+Dl1OzGPHzZ+fiLSLBa+F5DmQuxhVgbjDdD+FD2qv
         JcW1X+EBk+MSRZtEl2S63UaEXN+Ntn1xALof36T+jtq+nrS+5vm8Y0Ewa0eG/Tu5Uks7
         uC6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788452274; x=1789057074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
        b=vjgl+rthtCNMfENALqjrxXnweESYzhy0+pKg4BgC8cT8O3HNjA/l0XCrEE1gtVaaq1
         3SsvXCsOO5aKwRtTPX4sM27LWNV7havTPRt/K4VM1YeEfQI4EwANX8sv6Bmwtr3vgblr
         gIKdu06e8j7VU9pk/lBecFIw4WkwLYAGRrgZ7LMPUWE8p8oXZcPeEV0T9lCfsQQ2ZwcQ
         u+6OYxwfTV/6EjHLADts2xiTfeGI8ZBQmMRS3zH+CB/O4GsG4R8ZKVPofoEFL7hfcteZ
         Y+0ta0jC6GY+Zea8mRcaoztvNv5QoQtZCyPCN1eqRbLiQ36Q6fblQ0J75kXKlN6SBkFm
         2pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452274; x=1789057074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Ev0IXa8GGGWJ2nSFpo3xbbr0CICv2DhUn3e/W1AwU=;
        b=LQArlY4MCg29PRF3gYOFvIM+2YQuWMRIuund1HWJ0uD96qJ3bH2usJJVH7zrfD7Rzd
         B2KEOiYwOTEBc7mbAkP3DxCmZhIpkDzM5YivSXfE2Fr+kZgzLx9XhR9alHOWQXH7CW/d
         q93lA6cV5IvP5dBEnwTCbr7AnrCSCO9w7IvsuHhtOR601+99pFIIPs5cGcC5rT028L6N
         mH/LMpXqvGxXwUN7ppa91oA2mNPPEvBv+ppmPvqDhpeORGBQ13CpadRjC+sNQORwTPKG
         1Ji+Y8ju3wVcLun4sfaPrFmwpvo15LxmAoAXDCTGA7PJes42eu6pYsI62WLpVgcEariT
         9NDA==
X-Forwarded-Encrypted: i=1; AKwUvBz2LYiaijgF7gkbWCo5ADiW6CBeItuOD+ec9yEYtXY6GCb2VLMqhCK6MG9ijE4CtvitoqINAU2KimQepL0=@vger.kernel.org
X-Gm-Message-State: AFuF++lJGOnhe/CY5ZwlfuzbWv5TGm4QLYraYMJyYAxtN0bNqeBbmfXX
	fWC4DCZj/mOmX6OUk65FyWj8XGVzKHmEfkPRzFwt8bY1FG8ETYXDmgYN1uvAvtTqYTA28Qb0Wv5
	EDxv1ebcVY9aaI2Bn+rws/6JgXLUGRnFq2vSDr98f
X-Gm-Gg: AYBFou0hV6h0S9jYs39r61dr4qraPKW+ma189KIFCowXD8xs7e3TBCXQojdwoj29+Ac
	zRxGSc7bmLxi7OoCYK144agRlO17InM1MGIocNIMzxBAm9vgknficWqHuzQpjLhtYJbKTzA2BDE
	ig2YDFl9yWhG2TmmJvDS+PldnNaj57oeqTXnwgtxrRbUZv4fLX+zxd8IqhAnFpEkIhbvltY6DpT
	qq2YIINfb6XziKFmOlr0BjqQxEwLqN/hBuEGdvGWvRtb47ooCYXtsCoqRvtSFyTGx8DWOJnyonW
	/cZ94piAXxBZX95BeOZLtliq8HyRigkGqPBMaGtL8ZndpSjCAFpu3qNJUFkIcXxqivOFrl+okAq
	7P6E6iD1ut8JV/Ggs9x+Af1Z4D3mK8ZKHROEhDHR7/YlbrEeaHwK1dJw=
X-Received: by 2002:a05:6000:25e1:b0:482:f270:65c5 with SMTP id
 ffacd0b85a97d-4858708dcdamr364644f8f.9.1788452272960; Thu, 03 Sep 2026
 09:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-checkstack_llvm_objdump-v1-1-edb4eca5f163@google.com> <20260902175154.14870f981733146727c67c20@linux-foundation.org>
In-Reply-To: <20260902175154.14870f981733146727c67c20@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Sep 2026 09:17:41 -0700
X-Gm-Features: AcwNN1X6P51z_SmCYkBPOVdoAklFk1QzWRkytYd-vXw09T7vR9Dr79krTAbesqQ
Message-ID: <CAKwvOdneQYJ+sHj1jFUJfV6oLty55e5p9x-VoAKz_oehschdfA@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkstack.pl: support llvm-objdump disassembly
 for x86
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 5:51=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 02 Sep 2026 14:01:53 -0700 Nick Desaulniers <ndesaulniers@google.=
com> wrote:
>
> > When running `make LLVM=3D1 checkstack`, OBJDUMP is set to llvm-objdump=
.
> > llvm-objdump outputs disassembly with instruction size suffixes (such a=
s
> > subq/addq/subl/addl), tabs/whitespace differences, spaces after commas,
> > and trailing comments (e.g. `# imm =3D 0x...`).
> >
> > Because scripts/checkstack.pl used rigid regular expressions specifical=
ly
> > tuned to GNU objdump format (e.g. requiring exactly four spaces, no
> > suffix, and no space after comma), checkstack.pl failed to match any
> > stack adjustment instructions and yielded no output when using
> > llvm-objdump on x86.
> >
> > Update the regular expressions for x86 to match optional suffixes,
> > variable whitespace, and trailing comments.
>
> OK, so checkstack is broken with LLVM.
>
> Users of checkstack/LLVM in earlier kernels won't like that, so
> should we backport this with cc:stable?
>

/me looks around

yeah, all...one of us!

I'm kidding, thanks for picking up the patch.

--=20
Thanks,
~Nick Desaulniers
