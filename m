Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EA4483B4
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720361; cv=none; b=mJnkXWSSMYg3OaVYQIJZzM07btXe/eHwfxKR0oDm+36pisrW9Nj3Kt4OcpNTG79BZZq5eAcOtURfhqp+p+eQlp1kSWd7wGGs8FNwHFGTbtKiQaOFnYld8e09bNU8njNPB78DOloS5jBPrxOAyFyCXnmVW8YDYoevgGrrsCZVYxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720361; c=relaxed/simple;
	bh=3BC6jIOaIQqqdd4zi/kwV6pG+iJbjE2TSDSIAteE0co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qX6YvymDOU0/Ak0jbsj3WDVXV/2ZrVGL9NW1AwrYSz/p0xbn9B/wcD7fkX5LYZjIrRL5N/JvPaWDQ09N16PvTCIMJ/8I1VSMw+ba6HKF3EUcuEo+g8a9GUEXttevSc/9WEVwFfACBlO9Ydp5Wv2F/fUYM/aDw6nUmiJddVv0G1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c03a445cb8so847967137.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791720350; x=1792325150;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MYYLB6b8ldp68NYO/Uak5yoQKizi4SG6z+b0YMUosW4=;
        b=wyd0d9rN9dbaM7d/N/kdy2il3wluiHjwdhxugTKLq7ZPL610xOFkmndzplWjdxV20q
         DnhHcXJbqNahLm9DwWXrSglmPRZzR2ut1wJ+42RRn5mwpNddZWqf6mN3oFG4CxlBMxwh
         biwuI30xhOzRs3Z4mr0DvmGWUbhgNCCPXdGlhtQ/Y/cEA+9fhUetYck0einHxwNn9xsf
         43Hl1zUMpBA7IAinEaJoDK2MUbTZjt5adXCdhS0A+dqEyC7JBzRLRmrDdt5LbmTIp3gq
         A9blt6hZ4h7uVlqXNHd0JoLWS9xNJ431zt0d6n/L4TQi8UdNBqq/6Sja/tGDRhjQYcBN
         Dkww==
X-Forwarded-Encrypted: i=1; AKwUvBxSxj3f7rBdQYu5LHcDBg5Aic98c8VD1iejslO/v5AhMXWgd95GLIFTSVt/LNZGpOZIvdWcabAf0tVJHj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI22J7/fZQojG4Aw3KVDgDIZciZjJJVjd3VxLrwBZomcFN+XDTP
	QT1VUfYkWGxw2e6YSe4ZVNeITKDhWOuR/6m3bjzjn6hkK/b/1X9B8vE3FhlZp9YV
X-Gm-Gg: AYBFou3Cwsu+1UphB5EkiM3E3RyA6rX8uz2IZT10wrpw8YtW1H57uXT173Frnn6I4jk
	bo9NGKdnuEVsWLVrOQSjR/RSiXDmbwEluJpoZ80WKvPmPwO93cr3sRymg9PsZt1eJVbzjTaZ3gA
	kwGgKW+aXDc3zjpPbYHxl8FmoowC0eJNiDUi0PDTfwlf5sSt2AsOC4cm+rpJodkwX0BKG2nwPst
	1SF2Tq8HSjZVmXSiLUHdXpqgzI36HIjtbNyJwIbEvP34FmCoGGWdbofh47j+lEkB3OP+NiJ13In
	mA3QReBIpHi6Xabc+2LF7JsDCiKDMBY5Tn/ToM/cBvVPVqER5izhiMVjvkjGF/ksFCi2tod3Jqb
	oD1e6ZlKuAMrJPjfP2HaUcjt1QisyTZpdbgyThO94Ivb83moYq8sHMcsLu/u1AGzYINKZ68WLbi
	TXCnyLSZBzBcb8p7Uj0BetfavO4POlGsZUQ1fGx7sWp1OIIXAbr5EF7LKs6nMT/PspMBHS9rSUr
	t3ObO7q32S4ZFTfy+3RvYW0mlg9hr06JPYg
X-Received: by 2002:a05:6102:3708:b0:7c3:2b19:6267 with SMTP id ada2fe7eead31-7cb373e9806mr2315947137.32.1791720350444;
        Sun, 11 Oct 2026 05:05:50 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb354a9565sm5118706137.12.2026.10.11.05.05.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 05:05:49 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7bec5112765so697626137.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:05:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwXzZl7JjaFiFaS3EtIfx9LNtkezL8HZ+cfvVnHgQXlSFkRPR2ka+PLjnG/4SAA/iihrfG9BgAZ8/AbnI=@vger.kernel.org
X-Received: by 2002:a05:6102:441f:b0:7c2:ea3:418a with SMTP id
 ada2fe7eead31-7cb37afb854mr2227341137.36.1791720349137; Sun, 11 Oct 2026
 05:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-ee797bb64a30cf907f583aca@squawk> <8d0fd503-4f4f-4cd1-9ae8-08ecd478b8cb@kernel.org>
In-Reply-To: <8d0fd503-4f4f-4cd1-9ae8-08ecd478b8cb@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 11 Oct 2026 14:05:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUR6S6Qqg8T_scvuwsBUW68T4chtafqT2xGV3r0dHV5A@mail.gmail.com>
X-Gm-Features: AclHuK_3ph9_N-gFM3EdCHEuQ4CbPPEvdL1VONmUE_XR8yHShDG2ifHd2IIhZDU
Message-ID: <CAMuHMdXUR6S6Qqg8T_scvuwsBUW68T4chtafqT2xGV3r0dHV5A@mail.gmail.com>
Subject: Re: RISCV: canaan: Deprecated (oficially) the K210
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 11:32, Damien Le Moal <dlemoal@kernel.org> wrote:
> On 2026/10/09 11:29, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Two years ago, at LPC, the only known user of the k210, Damien, gave his

FTR, I still test each renesas-drivers release on SiPEED MAiX BiT...

> > okay to delete the platform from the kernel but this never actually took
> > place. Deprecate the platform now, marking it as broken so that users
> > will have to explicitly re-enable it on updating their kernels.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> Sad... But yeah, this platform never was really super useful in itself, beside
> the code cleanups it generated.
>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

Sad to see it go, but it's indeed been a while since the kernel was small
enough to actually get to a shell prompt...

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
