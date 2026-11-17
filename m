Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905254;
	b=xv1nkln/ngj30Bh09/H7D/N/sHMWBgCnvutdgSpQkZjyCD1V+zVDDQGznZ/edr3NxaWI
	 fL6jiILq3kLD1YCp3PO1FLJB8WL4rLTfryiNZLddHjkGdU1rf1W7D8fJWW/gkMwsB3v3F
	 ac5HBSYY36uylvfd4wztRbiY1LBBe/LrC1DiYOUG+ltyKchs0at71mXiPta9a+Fll0bce
	 tIxzio46bYZNZd+wExllLBjCENAn718+kwDipTAt0oV2VVNr8aZRh8ZIttkK3qdj0OZ05
	 lZ6fekyqmGq3B6iYlzGn973Bc3yYuoi8lYjng5jcFn6kQBGSm4+jd4oXrG80NjYBiEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=s3M1bSOBYt5gL2unmdOFOAn92UpRxf2onmyD1mml+iQ=;
	b=xkIRxU4KCNbgnhOUgEXHlJOAiME7cZ1OV9BneORdFo5k2nmiEB3j54YcWeimh1v5CKgt
	 QciR5oRu85IdGvSUNftdeu3denOiMuA0slC9JThYX1RH2DMR42DzoY3R6c7+qfMjMboO1
	 wqcuI+3+rbXHDAfDuxAPFpwMkBcNk917pWGnBE78a4F+65kbplnsxYYQckwh9iYQ6WNqY
	 gFz4nj2lV3suGizl2JLL0T48mczOC+t/k8pp5nJ0y/I9/4rn79cYquB+zkBr/MUgTgnrL
	 baPsZXlircu6L4LQG8qrphSjQdvP0U5Ny3puKp6Ht1QPIIxavNZ+0YqobUxymbuZrSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=paG2evd6;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F34606A8A5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F34606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=paG2evd6
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4528872f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905253; x=1795510053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3M1bSOBYt5gL2unmdOFOAn92UpRxf2onmyD1mml+iQ=;
        b=paG2evd6MD9xh5NrI3KFfHIvZHv4F2/vrRCU9ssrPWN5wCLSTZBF23eoz4I8dCC+/c
         2ugnJY5Wxct2xzBsFpiEAthtgG0dlSHV91NMwhNci0H6Mzz+l8+LsJnw2bh89kHjn4Jt
         50/dLxzD5nqtaxJXY6wlIkg+FT0Ibf7E2dBQJdcgLlc9mykk8YCLZrbJePv45Cu+t340
         klDoQtgwpY1C81Wm1chUo9HmWscyCgQ4aOMSr3RQXcrRlou+8WjbuKgAItgYH7F819dN
         6BhWO11IagfyEvdROrCQHJv3QvWsqAuNjHVu68TEumbWmFXtNmbSKzmEeaBfWM+/+zeJ
         ooWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905253; x=1795510053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3M1bSOBYt5gL2unmdOFOAn92UpRxf2onmyD1mml+iQ=;
        b=bFWYPKZ1a2GzkxKTj0cP+mpxEo6xMeemsp190uqaIfO7h4RvwIskLFqF6WSHHlIVb8
         5wUKqhBNUBOSBKfR3CFtAKTiRHkYkdPx9WO/VVtV2ypULFTAYMKmzK3J8vSmE3BslP3U
         8GFtgB9uA8FydUvFnXJk+XCwym/vMSjOr5TxJYSVE1K6713Eh1slbeQpDeWLWavtUAfg
         r18RlyNh2l3Ja769sq06Z+lWm8jdqUuiKsXIIaBOboHY4nos3HZnASvX9tLW5gRvvWwA
         9CxJxF7Ey6rTrJkgOim1q9p0e6EJ2BsYAHXiS9KTcFFYrTiIckoDdMQsdgVOwp+g1A0Y
         nzqg==
X-Forwarded-Encrypted: i=1; AL+hErGvm7CarZto/okLlBDsCOhfSmB7UKpCv1m+5D+blUXKA1bmmgNLHVKVnoJevmbFSC1Y4b/xCfJ8hYXWsiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p28jpSUMWWetHPCYybSMkp9NqiOkF0RCcn2AJ7a10lWrX9mZq
	7wYgSzChC1lSK3g4ZiQuHHMY7hfGkJ8FtWncaVioyyby8iy7ULsUElO4
X-Gm-Gg: AZFdTZcKhVDwDrTGxu3wbuiO8pUqR4/PTUArDpgaHx7G7O5c3IOmW+i3L54KosftnKn
	ROqIGN0pJs04qezc+m+ZTRhTwWPGSIQ2J1osANGZbCJf8ipex/NxlgxoebFj2G/cN8m9RBwDKuQ
	TmnpIrHufzsvTXhSHtKDzpcLq21k6a3y/N9IFnYdsN5vtgcOz20KEuD0CXPy13c+GwjD+QKNFQF
	ljNYTH4ng1JQQ6qIn2KZomggQEpg0xinB/sOSArs1lbXiV+MfnaoQCoNqzXI5PJ1o3o/FUbR7Sm
	t8L8uTrWC54Uyi98cp1UuAnMrqkOQesrtTuwBdqULRlkaeWTU6fyN6YTYwC3jz0cGhjejqHGlWW
	FwV9wJfgcPQAwRdYZxK+l2dAf3l9UIlBZEqivbVC5YCowPmXe/jdfePAZzHOCpdJMBV639bgAlx
	VQ1/AowDHFgtOT31b9nsavN91XyBw//KWokA9WltlAP1FHg0x6tWF2TyqBYomctChZp/Yy/r3US
	b8BN3VuRGCuVSXhwhixR8V0SJTnGWDa2wBoGxY3GMUtfRSxbzEWuPlERKR8dYxxWN2YcBMPJAAI
	3XfX035s4Rxle3gZjfs0yC9jt8u0wNy8WfUAsAvYCLeUYvYuQ5Cxs2FsyZEun1ywiw==
X-Received: by 2002:a05:6000:46c2:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-49c729bb31fmr19089884f8f.38.1794905252525;
        Tue, 17 Nov 2026 00:47:32 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a43775f9b9sm2739633f8f.26.2026.11.17.00.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:32 -0800 (PST)
Date: Tue, 17 Nov 2026 08:47:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Theodore Tso" <tytso@mit.edu>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, Sarthak Kukreti
 <sarthakkukreti@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu
 <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Gabriel Krisman Bertazi
 <krisman@collabora.co.uk>, Eric Biggers <ebiggers@google.com>, Dmitry
 Torokhov <dtor@google.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] libfs: reject casefolded names that fold to ".",
 "..", or empty
Message-ID: <20261117084727.0cfa196a@pumpkin>
In-Reply-To: <avu0X5E298dHRBHY@mit.edu>
References: <20261113065332.929085-1-sarthakkukreti@google.com>
	<20261113065332.929085-2-sarthakkukreti@google.com>
	<878q2swoxp.fsf@cartola>
	<avu0X5E298dHRBHY@mit.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 21:00:06 -0500
"Theodore Tso" <tytso@mit.edu> wrote:

> On Mon, Nov 16, 2026 at 02:34:26PM -0500, Gabriel Krisman Bertazi wrote:
> > Either way, this issue is another example of why treating ignorable code
> > points as 0-length strings was a bad idea.  I'd very much rather
> > utf8_casefold would treat all ignorable code points as foldable to
> > themselves, (i.e. commit 5c26d2f1d3f5 ("unicode: Don't special case
> > ignorable code points")), but that was tried and broke applications
> > that relied on variant selectors code-points being ignored.  
> 
> Sigh... I really think these characters are *evil*.  I wonder if we
> should simply drop those code points unconditionally when they are fed
> to the kernel --- not only folding to themselves, but *not* preserving
> them when a misguided application tries to create a file with one of
> these misbegotten Unicode charactesr.

Doesn't that assume that filenames are UTF8 rather than just sequences
of bytes with everything except '\0' and '/' being valid.
Casefolding is itself so evil/impossible it shouldn't have been allowed.

David

> 
> I'd prefer to simply reject creating them with an EINVAL, but it's
> likely that will break those stupid applications....
> 
> Eventually we can have e2fsck offer to fix directories with those
> characters, and eventually we can make these characters become a bad
> memory.
> 
> The other question is what *other* evil misdesigns are in the unicode
> spec that we should be preactively trying to addressw hile we're at it?
> 
>      	     	       		   	     - Ted
> 

