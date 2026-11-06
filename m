Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793970848;
	b=CKmsGqplxAQhIis/+Ohu5aotFG8nkCSI6Q4zr0Unyup1OaeGoRZlVoIpxQgxjym200xG
	 o9VR7KZOG6E2ERm35+HvBkrQjVBcjGzpBxLdD6I7v+CTQ77yVCQ1c2nGoQqf9J4b0Fvyt
	 TStZ4quEXBL2KZQKkCcsfuf0U90T2nGrDWYuWxvssHJsxzhhcBi3aPUbbvnvAN5ZfT1op
	 nCpZhAVVeUSCvWk00t7CZ+tB61Bc1N5Fs+RVokkeUnR7T8bjvpdtOucH6v+C94NfD46ig
	 fF02mnmDcIb/ODaeZzmpALYQ0N5GUW48AZGqyFfcOPH1RAjzV5jM7eM2KcGpKnGzzzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XDj4Fz5MI5W96I8a8smZZO8uw7M1JDn7fdBwlab3epA=;
	b=HLtaT9JWHwA8WN31gQb3kIbuZXS8s4l5xWkO6T6TfBZ4rWwmF+zVwa9KvdBVQW9qKtiL
	 SB5hFIAor1+FPZTjVP34kYSCK5Xzi85gibncDGWp1mBXIk28QAbmTQ3b0mDZ7xcgr7ZTI
	 kmkiKBkYYeph5UqM8VAEnJ35s+AYpFqLCzML2iN31cBeenqV4weyFg9vof299VrIRrbJp
	 bn/tpa/UgfnBLDF5ONP8LnnEM46skYjtvs1/4ZgF4c72DxQSr5l2vpBlQWBbLvHV+Q460
	 6I0t1NUcFUgn6nwqz+CI/VkKGRxMf15aYoeCzUPhaLcQCPh3J51f1rFqXBTl5Fm3VsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwLt3FRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E26D606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E26D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwLt3FRK
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-47b47de8b4cso316680fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793970847; cv=none;
        d=google.com; s=arc-20260327;
        b=N/lNWJRbMaXguw47XjxdX7VJHKpQkHols43b9jcSr2RANsFcC6v62cYFg9zUofmzGy
         I9kP8t92DtQhEnBmWmHHKeMK+aAGpwQVAUMqbqF5Zv24KFCU75CyeEgcyj6Jk+tbwzxP
         26P+T2w1n9ffWr0AeOjh5bwXsF9AIt7nXFWsFoadIkVD4/yksL7C8Bbc3uUdGAo00qDv
         W31zboLIRtoEbY2aXF66m+2HXcGhKP5KEAgV+ajQq62aHPGh3p/qWmIDFXO+cVr9YgDR
         luoHW8Irq+cO8nAOaVLvRwBx6zc46FjN9M418hSw4giMgPGPZL3ER4pGjHJWjfhhEXA3
         jnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XDj4Fz5MI5W96I8a8smZZO8uw7M1JDn7fdBwlab3epA=;
        fh=H502sxW550pMRwvrzOG5Sz1+Ysfqp3XXi2krdUgKKU0=;
        b=pugc74ur/kr1M35k+lw3Lj6JqTCi3stwQiUpCOwmlmmOa199W3YjjQ64QEtKK5BPHB
         PzlfnXTDG+sgnEKqbPL1rWN+VncRvI+P3NwVr+LhL9DngKyyBU7PsF4+Q9SHixDzXp5l
         HA5QlBTGVlHCzRjShac/TBlRivR0QS9mxSPqsWS34zVhVZgNVU3eSu9Ob0CtcEuogahD
         lMrnGXuLhkS6W++fihAHDjx/4nbnb1VsnyVnuttsuU0W1luTko9D5CTBtMMqn8ShEZSk
         /eJYbqab95yyC9udr4sC7LUaLt7Oujkdiq01vdiaU0CLOtD7Zax+3f7imZN9LsGgv7qE
         DbxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793970847; x=1794575647; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDj4Fz5MI5W96I8a8smZZO8uw7M1JDn7fdBwlab3epA=;
        b=rwLt3FRKaib2TbFpjgr7R2B5jwDhmJgnrUZ42NuQTG2wKLmY+40UGIeF45BD/GISqz
         BVCDKLRZanqeVQh0U2YPak+Nagm4TNbvzx4lNoku/O3YcapsvfHeuqVgZ8lZ9gA7WlBU
         FtThgZOryzszqriE/hmExA2KW5x9QEJNz9St9K9EgNa7C5b2xz8EWZ/HwOJoESAGpWfa
         G0qvPeEMgkiD581SCsW0KtAziRF6vwQLOlO18x/nYsmxifFXTadrIlP6QuDcaf2YDHZc
         j5T8pVmdZ9jMtoWdLD0DU/h0oyH8GLM73WauVLnljRW4l9KCeSuj1/nKXhsG5Njuho6i
         iQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970847; x=1794575647;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XDj4Fz5MI5W96I8a8smZZO8uw7M1JDn7fdBwlab3epA=;
        b=SGdXprJR1621S7YW22+rhPCkrdNEqO4oIod4IKcuzgExXRn+3s6UAmHEw0ODaSU2r7
         jkMWVM3f4zNtw5MEPtG2WT6cJLGMxzNiLe6uBR0dxR4LiH2YPM3RRGPEZcFTnPJRUG48
         riyhH7FS1hv8P6ibmn7wZYXBi1yGbsPT4u1cuVX0oXRNspYmrJc59BJrTmU1CX2ld5Zn
         Nkxgqupr2BxjF0P67ZExfHXtk9Z4TM/uj2RN05x+20WLcGHJEPbpUA/L5R9kUzbNlbIx
         qyPHsjHj8u6nnAdxVTl3QNcvGyQcHpKGkE0GcHM8raMattYnGtVkEjkGyv2gjH+k3CFk
         HqGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7ityjAq++5qM84HRhWLbtBEQ0mwhzKYfhPsigpaiT00EMixDbsuOOvA0llKbTdTRpEDgl/DU2Qv4Uv5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LOyzWy8ntcsfInB02RTt3Hk+4ijG0nyQB4qlig2HE0IXRSur6
	ZSLB54GlY5NR9KH8aJyyPS4Dl6IFxQCyUtUKxsCgQxX1/+sARQgFGOKrPi5rRh27AP80j1C4Bhs
	YXYKeJRHSX+hn/eM6pmpeCWg3Y4re20U=
X-Gm-Gg: AYBFou2eRjW+zZFpLRRO5eaDqSv74FWytXKSzDAXwc/RgwORVKqA1VEKd5Ead1hyOCU
	wBdjPfB2ekCOHeiDEfRY0EoMPs/zwzCiXBNgHEU/WjbLYuGxwCtR71GHWIoWutyJQGKA4NXwlXU
	2L/y2rfKhI3hplgnetUZO+UsTOsJQ69gZoFKrP2WyMWCR49SZzNgSmzgJpDpoVbfr8xptmNlqDY
	9TEPYIaFXtHjKWPvL7ps28hwkvHW6I8c0pt0zRATIjvkvEN3tjyYJH4HJ7qrT2g5ZrbsOOYoff5
	5D93SIMHXd3msDGgjFiV81ccCge3MtIr8UDSmVToB8NKPp8oeEqq+AqlIlvR1qhrZRZgTobAHt3
	Da2esjqhd3aYy7iGAFyYDT2NE9IovkY8BJzuYYw4rPqsSen7yH3BnZcTUWCyWkJ60drwGEb6oxd
	p8xVXLTyNLiz5gsW1JXg==
X-Received: by 2002:a05:6808:4f6a:b0:4f2:ac42:656b with SMTP id
 5614622812f47-567e098b95bmr2036164b6e.7.1793970847328; Fri, 06 Nov 2026
 05:14:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004-ftrace-mod-bsearch-v2-0-c1de73e72e73@gmail.com> <20261004-ftrace-mod-bsearch-v2-2-c1de73e72e73@gmail.com>
In-Reply-To: <20261004-ftrace-mod-bsearch-v2-2-c1de73e72e73@gmail.com>
From: Mitch Hen Chez <mitch9654@gmail.com>
Date: Fri, 6 Nov 2026 14:13:56 +0100
X-Gm-Features: AclHuK-4pAGkIQBSKZ8F_59E3K5aQv6zvde8cyI5-gaZYBULE-9BuBhH3eqMpKo
Message-ID: <CALr3rD93RT_=w8VB6aKfuV5crbwXK4Tffq9bLD=eJBj07Tv1=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ftrace: Drop weak function locations of modules
 when loading them
To: deduce@gmail.com
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	David Laight <david.laight.linux@gmail.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey crew :)

I was also seeing a stall (~2s) on my Fedora 45 machine, and when I
applied this patch, my userspace startup time dropped from ~4.5s to
2.4s.

Hardware: Ryzen 9 5900X CPU, RX 6900 XT GPU
Kernel (base, as well as patched): 7.2.15-300 (fc45)

Would it be possible to have another review pass on this patch? I
don't want it to fall between the cracks :)

Thanks,
Mitch
