Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456E389106
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475932; cv=none; b=RrZ9J7kdrvJMuN3HX1oKoeKYHJBo8KnkD2HC6nKTMLfSbDmmSfZ9wkaw+qQgnLjEL5x3pbm6z7hEvx44R36o6S6Yb9dgueJ8ik5ztwLdioeMZn1iMVG4bIunpH8+kQjjRa9HHvU2T8R714OuOCfez2+xPhsQcknkBlc7thYvdu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475932; c=relaxed/simple;
	bh=BI0G7qBpI/7KwQFAhmOUXBzLsg9VZTTr2gCpFXZLAhc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnqNu1a81jgtOz1MV9+GuxeYMfMBjYXWVHiFguFnVp6fHWSYioSDZ3EztENVjVFA2O7rg9+0evGFeCrUTvmuZG0HyrlZbk+ty5MKyE0O0gBEzdm8tOUv1l2g+2LC5GrnYXWHheB9GA/B04racuZCMD8s6loYAfOmMXYJ0IqtaGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBV3HFqz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBV3HFqz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0759so2644022f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475929; x=1792080729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGTDk2M1CVr9/HPRZF14PhrI+tmF1KcbANTHbSO6d8s=;
        b=cBV3HFqzzOWW6/3mIA5IUdq0aM9r9hZqea0qp+sbS+quwYPN03Xl2tEzFF1fM72QhI
         /MZxGKXKbaBRh7XSSAEQfpK/r4I6uy2cIeljH9/LKXLwHoT+AvHZLRE4uvH4TSA70Df1
         xMa4MTwSXFIG6huQ31xlXGdhSIItoM1l9uQ+LTTqybNAURHWE7gP72MfEQXopxrCXrA/
         L9gjISpur6L/aZR2K/SIiuuWCC1YMR/J/aaQ5lkVlLZBUTCBfNJGMCzIZwaoA2MbFHa9
         sAWSyoUQbs1dkFjbDjGrlKLdI8gKE+FCl1emLGi4fG7+MByYp3V8EXvQ1nnU8PsYIcHZ
         6vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475929; x=1792080729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGTDk2M1CVr9/HPRZF14PhrI+tmF1KcbANTHbSO6d8s=;
        b=DDCCXPSEGjFZvA7v2sfJWBxXS8EBBo9+VloUZN9X5LFa1WR75oUXnlYow1X6A8Xu59
         AfjCv4+9Ng+jBVKUW3tpJddaRNRhEn/gry2J00VqxFC1ujyAAw1L+coXMkupgwEtfE+Z
         9tDeKKSmyNNTgBQaBVd70a1W9fnEdvRdAnJhtEMHZ+Z3zT6wGGZcWcM3Le3qtzCx11IW
         Jq3LTJF/+21+CZ54q/FMZkIxPxqtzV6GPoX3ZdmZBVXiNFouKcdiTn5UmDxieSMzYaw6
         5gnAZOyBYQkUp0n437jjR8+sAhBCBo/Nt+lDd3Q/NqaV+a+VHMUGl34rXtbCOHyxF0x6
         VnYA==
X-Forwarded-Encrypted: i=1; AKwUvBzs1vPd5Ru4D6noCmRl0YfRk4/ERK7EzXrurYnUXxiGffIuNqMXEiuITffSzTrfR9WnFwZbGTRmbCkHcB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEW/HWKwg1bX1HHYlcJEwPUrAATo6jUy5dVqtyZPg76ahAMFrQ
	N0p6jGqI9vq0tkl5xhy1XqBedn2wFiUcpfCzpvEUCkJWJO/Mx4KiK4ba
X-Gm-Gg: AYBFou2LDsmhbrq5NItIWw8R4/CaJUf9day+0EXilUw/J2NZflVpG1mSI32HkKHeisa
	vPoz2WIfwFQaW9LjkbV4AB1fyoXSlWjnCmLHAM9L19U/sF7Ma6q3vJMGwKWORlBZnhinH4o73O7
	d+9CuTPiIWr9m5bFIMEpjUVO/txHAp9HFMTglwAqqCaMhCBNXNOflzwjG8nPYWPCtuc2Aa5s05Y
	L3T3zWauRdjV6Yi8npputIQDpQTalnJ7t4Zogr0lkRxtRJt3JdkzCc7CMBxmxvTqIUki/+Q7exa
	L5qb3SFwwCipxaLEFWWUptBCjP2Ym7hTm0njQ7Xu8Ot7zI65jndID/mI5GUtd5izOx9m6EIaOMX
	Cw1nCL4zONhU8BcUjWwCdzIK9S2bibv9N+IBSZDqst3mGboel/JE4aU7xalrBXE1PpZQDA1jX1p
	BD30LXQaVk+41QSqIG6ZyuNCfDEoVq4AJi63n0i4TJ1NSsVmKNBBcHX/I8r/2fdPortX/NEWZGW
	CjDON1A2FL3h7/gQv/YjtM6eocwH33j3WIwabUFITzJCA==
X-Received: by 2002:a05:6000:25fb:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-48c77add59dmr9194549f8f.43.1791475929174;
        Thu, 08 Oct 2026 09:12:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db650fd4bsm478599f8f.11.2026.10.08.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:12:07 -0700 (PDT)
Date: Thu, 8 Oct 2026 17:12:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Gregory Price <gourry@gourry.net>, Sasha Levin <sashal@kernel.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, tools@kernel.org, x86@kernel.org, Thomas
 Gleixner <tglx@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap
 <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook
 <kees@kernel.org>, Jake Edge <jake@lwn.net>, Gabriele Paoloni
 <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Nathan
 Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <20261008171205.7239c463@pumpkin>
In-Reply-To: <asemkQ2v0di0Eea3@hallyn.com>
References: <20261008084956.2911790-1-sashal@kernel.org>
	<20261008084956.2911790-6-sashal@kernel.org>
	<aseRXi7hMWBBc0tB@hallyn.com>
	<aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
	<asemkQ2v0di0Eea3@hallyn.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 Oct 2026 09:20:01 -0500
"Serge E. Hallyn" <serge@hallyn.com> wrote:

...
> 
> Even if there's just a three line comment above a fn, history proves
> that it will not reliably stay in sync as the fn changes.  An automation
> step/check is needed.

The only way it can possibly stay in step is to have the compiler process
the same source text.
Then, if you add/change a function parameter you'd be pretty much forced
to add/change the comment.
Return values would have to be documented at the C return statement and
really as an extra parameter to the return.

But, IMHO, the whole thing adds too much bloat to the source files.
When you 'grep' a source file, you don't really want another match in
a big comment at the top of every function.

David

> 
> > ~Gregory  

