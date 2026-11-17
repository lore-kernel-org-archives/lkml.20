Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906276;
	b=W4EkEn0ZsYaASPlmzvhHyslnIe/T12e89yKF5litFMOMnON9sql4mlAKab3dUCOvaF+F
	 C+zRRqJT1jRZtrUpkQbbyY2eVZsfcs5JF2L0rZ8C424oyJwrDej8sjzB2JQqfdMb/9c8e
	 Xi9XZXoTsbp3APvxi/PQO7Xswm5QAsZTcEOyBnxyPGpNe1Mj69Rb8/+MtHPJv0DiMMVdl
	 +c6cogeo1ieBrD3ch8VVUZVeabcWb5uW63NevREU9nI30KjAfOPNbb3wzacRvWoE3QM4M
	 ETVizlLI/F0YGJO4k1A8kgJXEF9GgEJAXv1872ZEbdWBZdExZ0548fy9YFW/yFMp5zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=Yafz3sEgHSbB0dihgrPP4811kZo9wiNYZxbrPM44ojs=;
	b=0x4Zjp1ylHk8FtzwLZoOPsLpVs31aYdb5yMxCUy5mlQUdcPMNWBEbunx/DmTU7MTKiyf
	 jS8iRrj8QFjh72xtytO0JY+pWv+rpknSn4gpNzRNIkupeoi5U+Qoabb9OQv/EUUyzsJxJ
	 cRwC7AqQrWn5gqzK5FnjbsjbHdHizwib8Nwwj0fxIK6Qmxn2zo12a3fiFbtY1lJOvMVmV
	 oXoqRXjE4B7q6whSexu8nku7VcuvfvDKFMpSK1Iy8wiim0wYO7sWv7R1P2+jYgDE4QR0+
	 dnAIJj+g5i2errGdM5oBynPH7hNfagte1Qb9kFe9rgFjNlOsGdeUc0xxQkAZ9/PILMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Df6fFrOr;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B3606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647B3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Df6fFrOr
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1481180a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794906276; x=1795511076; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yafz3sEgHSbB0dihgrPP4811kZo9wiNYZxbrPM44ojs=;
        b=Df6fFrOrS33woqipjuxMbtgP7Mb38cga8ynzt4dnwXgr3NWyVSrac4XRUinfbr3fLw
         ZVQFQHOVaZhwzqO9wK3QHesW8cBGX1Yir2qudEdLZW+BOY852fUftVTZY4lKH1Gctl09
         OJTywxiLvJaQfloOQmtSK384TfG4wao7WnxHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906276; x=1795511076;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yafz3sEgHSbB0dihgrPP4811kZo9wiNYZxbrPM44ojs=;
        b=QVkCOY7NNFTN/9MY5DcIU/L3rctBixRJVJkj2xwQ1S1e5PkB/QidkvaHHUfsaeJR5T
         O6mL6w9WlZi9zTRjWobjj7WjodkR/hHLe78xirm80fvYqkLJywIrT2GGtzN7ZKpsl0Z1
         4pAFcdzDN/Weh9/WfrXzq8xy0kyfp/BsNriEthGCSq1tZWuboAO+zUCAIlHUDmjNPYY+
         5uwf4/WCgptH6muF4+N4WQ157+2gXh86qIROJNAFkM5Pi0LvGqvZsHopliZW7FVbJ/FE
         svP6wnT0qRjJ4fAATXDXhP1yLN/x3q824gWukIgC2JqhLOPVKYglE6zWqprQcTKwKUJn
         hp3g==
X-Forwarded-Encrypted: i=1; AL+hErH1A6D7F+XoSot0Zer7W8mSbESTc8mlVxQG3ExYZhZJ3/bhdIUfSVW7pPYhBYtdcSwAzemOtt8ny2/mzT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LiFP2AJNZ2VHqqfkcFisbzJv0lPLxpgpEOf+R3s+10rG+rXr7
	H1IbdHWxYfvZr27nu4TMRx/BFBoSHddWdW5d8i186jDTY2b0yBYPfGqASrlT8QvR0Vg=
X-Gm-Gg: AZFdTZfc8kg7ON6dElTXNfDjLg+N3av3CUa52ARXPvpUBbbZ+9I/Pn8xihYYAqbXtig
	fGEdnNo09O75lxFC6qrC2QdiCuIhslA/JC5+GlHOwC/OKpopxJ4kkjp/QVtvQalZMUvo90aw/ur
	1zmx5x3+niVdnI5eI5zPpgtCr7+AsNwBFJqKvX4f3/pGxKrNWpTIF4Nl7Gu2gmncUhj6GeWYM8K
	ZkNwruwxzmjWSIXExnTCiilx4MViHMQH8T8m6mUiS37RS5nY9lF3U/iKDx6aZcTJgUl0Pbh/HH/
	osJqWk6oLAv+DEUVOQJCUq1niw6Qe1D8KiiJshlfoZRvtqDdKu1XoLUxqv9SH7LCAhB5h3sJTzT
	MfCI8SGqyoF3K0RGc4JIX+PJAhBeTa8DdOA/HAY0NwsjAKbG8BYkzKLb08Mwna9mL4A+s/F/3H2
	s/Y0U0ss1me3ExfQYT2/pD3CXGsG0XNtP38O9/c4ZwQVRHEly3q5WcpOfRU6MnffTmH2DnGzJVY
	hNKlhtY2UtfNy6h1R2CcS6w9KtaNaC+x62vLVpHBqOjDSC7KmRsCsDveKRx3TeXHnmY2q8R3ybK
	OItIgHAIHUBzAOZa5S3WgEKi9QgAJPCW5FwtQ64qorPhcTkimxYAjOwWX0SzycGo6oqjSr9gxS5
	g86R6EFd6Zs+u/8DcQbTarKAwbk6TFdEm6qcgXcMuORmWACBSUU/fSlc0KTha0CjMYiD16jTV7M
	ELaPrcEHLxhaJ7E9LdgGn5VMgq52A/fMx0dIiRXHry62jli6N3OteW8lnu+zItOLnfjKfnJDms1
	ybutGuBJPbq6xo=
X-Received: by 2002:a17:90b:17c7:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b1b0ba4fd8mr13948715a91.55.1794906275627;
        Tue, 17 Nov 2026 01:04:35 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abd068e2sm3204091a91.6.2026.11.17.01.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:04:34 -0800 (PST)
Date: Tue, 17 Nov 2026 01:04:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Breno Leitao <leitao@debian.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	kernel-team@meta.com, Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH RFC 3/3] fs/pipe: copy a run of anonymous buffers in one
	user access section
In-Reply-To: <20261113-pipe-pool-regression-smap-v1-3-b0dc69558ab3@debian.org>
References: <20261113-pipe-pool-regression-smap-v1-0-b0dc69558ab3@debian.org>
	<20261113-pipe-pool-regression-smap-v1-3-b0dc69558ab3@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avwYn2KugKhjYxNh@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Breno,

Breno Leitao writes:
>The numbers below come from an earlier version of this patch, which did
>the copies in fs/pipe.c and left runs of a single buffer to the old
>loop. Throughput change, median of 2 boots x 5 runs, SMAP on:

I timed a single read() from a pipe that was already full of anonymous
buffers, on an i9-14900HX in a 2 CPU KVM guest:

     read size  base     this     base, nosmap  this, nosmap
     4 KiB      175ns    181ns    152ns         155ns
     64 KiB     2123ns   2061ns   1971ns        2070ns
     1 MiB      49.6us   49.0us   46.4us        48.3us

(nosmap here being clearcpuid=smap.)

So on this CPU the 16 STAC/CLAC pairs in a 64 KiB read cost about 150ns,
and this patch gets back about 60ns of that. But with SMAP off this patch
is about 100ns slower for the same read. So the batched path seems to
cost more than the old loop, and only comes out ahead where STAC/CLAC
are expensive. I haven't looked into where that comes from.
On CPUs where they're cheap, like the later Zen parts Linus mentioned in
[1], this may well be a loss.

It would be good for the changelog to have numbers with some
clearcpuid=smap runs to compare with, and preferably on a few machine
types.

[1] https://lore.kernel.org/all/CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com/

Thanks!

Chris
