Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793820926;
	b=I4JNX6urYX0TKBN49ds7n5s98cpJLGCJ3lBtPw2jpmxui7Kz3NqLjtKf8FO4ZczY1POb
	 vY+Nuef9IALA9rASYz6FeecxufelVgMpn4RoAMcuz1+QTg9V3gzkiwrXmxjn5u6Ts8nP1
	 5jlwcfFJMszRECTI6nmq0HscRpR7sQ59oEZmOt7YRW7NF9KyGihSPE/VW7JQd5g1U2DUL
	 xPlxuTVEv1vZrNRwJKXhrpkarfbS8Z8WnvEXr3bSNiLJx9MeJTkmU7dkbrgcuO+ksBrKY
	 NX1aSpNm/MS81gRzlmhJJ7EgFl78lWa0Ar9HCtpK6YXUFWqoQuDkelmIMZqGsbjbdIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
	b=y4LXT3uHrovwvX5unZY6Xj4+w7/hWAWjZNU8Yrnu2rlElcHvyF7QBqAxII3XwbN6rRTw
	 Xj9W/uylnN05GZRO63faYbFSp4RuRSuf4SPv1qqRjnFq3k4149QS2xOoOhfRbpdJbNczy
	 NJLUDZoDZOF+xsbbpCAcmKBNxK0A/XhH8cqCpn1PMxRBAjSZYEhrcJV4QVaUJO+27bs65
	 2hMMYz3x8UH+cSxPD2iKwj5WMg/pkKDRhKd+8j8fl3wkOoRPvgdqYT8Tn+z4AwlZPixBP
	 On5F0qi5VTTaZUItYLCOfSoU5gC2+pTDLxlWFT3mLK17n+rfDjf8Pb+sldARo0s0PoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTJpx8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A6607B557
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D26A6607B557
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTJpx8
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c67992ce5so9211176d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793820925; cv=none;
        d=google.com; s=arc-20260327;
        b=PVO6dvJL0iayaq+s1rqVPkvy86LdEpRxSOihRLXiS/brUVxNrtUO0aRqm7KDjoA2Ax
         jL8ObV0Zau2MrBK2EbKorYfuJ49URYMz0nW6Lkch+tqU96dpRDLl42yiR7u7TWFPOfp9
         PnKfpVlXWyqVESVTNHYIg0q4C8A7w5VAOkqm1S02AWIQbMQ/hZSKWCrv+bpI3nlFAjF2
         cyh3Euu/Mr73sTckfUXgKupaVGlSc9qpsvdQUdVTABvLrom/RDH2xYXx08ok35ik7HbK
         fwG600DgC9QNcIH0yKec5oj7Yd02NbJz8aePJbV/MkJy5gXHMy8N8brMrVWTCNdV0ujL
         l30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
        fh=1AecAdoAaFsH0BDAaFDgmQz2gqRsDTaRR5axMFNW1OI=;
        b=Pn5doAKybqbdac7+KDhem/eyyPBJZEasHxcSIoveaMAOMuG5ua4atzucb1IO+Xw6G0
         cL3t5X+URFK3jQ/UFgwkFRgAhd5eeqNo12aHf85g6YdYK4kTMKL1M0oDdNwXOLj02ux/
         C5HdyYU5qKQwWgXyt63GEutStJuoF0NExIfu6xIWhaBSiRHjVfQvYMp6WVlVi0j0Jqw3
         zOobG72WrKyiTqNcVU2aKdap9bLcNjRwWJ2L+8emu627k0sEnFIHY8zydWtuvEK+dgFs
         xqCq1co1jBJVlH59A77qSNtjN3VYEkmY8a7xvZemjGMs5nGeMUVGWy3eltVf3iQeYi+s
         KAPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820925; x=1794425725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
        b=WKvTJpx8poNzgxl3uDkcvc0rL8iUYBn3U30inguq0YhUdLyRyQF7YfDWkosvThwb22
         wxFIvpLQPo4Iu8S7vB/VACSt1oIZM8AEN1dHhadz1hm8YYLQPDi48dV3VY27T0DHXzq4
         rFvX4Dj7a8nltOVkXqD46MRuYET4RiUR1d4LSGE5QfJBf1o14CFwTgFODp9r1Kk0nAub
         iLHblA00KuwRNFeKl7o0cEHTfGBOyxwbcriULiQTmN5uYYzVYavaKf+na97iG0PvI9Z/
         OLiDgaincIrJvxe8ZdQVxLMOqAsl+YKWe7bkoslVZjPuiKQsVWAXqBMTPYZ2ioeMhem5
         8cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820925; x=1794425725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEqbpUp+lNFQJykxGv+r+fj99eI3Ju/YPVh/28lMDl0=;
        b=PiL7HIy1QQVxM1ykV6rVpvNbSHsfPiVbw48pGmOrxtIBhLumbMRn56WnB2/MuPGEbM
         oKwQ6X9QA1GgPlK5FSAXwesAnwDnW6sAN99DkPWcgs1MDX3hOTyYuuzxAIkf0xcGCYzc
         2xLL7KflRs5F2c+hn5PQweP8vQQrStLszlTz/clSjms48pCR7I1bXgyUTwQNSqDJ9O31
         RqffhQo+h+qbKr8ZJ0Dt3B1PBmQzHNngP2hNcmk/rrrEgRW6+lsn9xg/FA8ocO8GeVwe
         4iJfmGP0eDUkTVbbGENZY+zFWGXYxcm0FToD4ApjUdvg9FtAqYmXkTl6jQnjIkOevkF7
         Fg4w==
X-Forwarded-Encrypted: i=1; AKwUvBzwAN1L5ln1X5ADv7dfrz17WzY8tNv96vR/cr4Lw3o4tX59T4fbUDttJLM7G8BCLpHiWsBSzKqZzMOwxNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R+xZIu3ItmINDWzTlJLR/HdkvX038QvV6ibnqvriRdak9dO/s
	Ch1CDd3QOt1R5jqzl5EUpvnE482y8Cpxy+bLaz/NCkXxJd83OHWNhOS/1xiD0rvvKKDb929yopE
	j0mouotTQHyFSgtlu6ReRHTPXjNVvZ4Y=
X-Gm-Gg: AYBFou0RWdVNwxJCjSC/+DcUnIwL7j42uU2Z5v302WwpR4Fqz6rf6wJL2HEMKc2a9Kl
	cP8aXuSA567s5XetkecGVn9FXhGBf2GVcldhdZ0mDoBf/G5LcWmwLwaokfjRNRjcj+IGNU++RM6
	ATWcPaBec2da8Lb0ywSXuAuD5l0edMOEkjPH8gAxDnKKFppQdSizbHMgOMFWJsQAvb2nNGKAJn/
	8ncujOwPQdj4dhufEcl5WtyJI1dSEJEiNwTq3VxnQ+mzwwweZaN/RIkMWkO7BSzip0tBASFMfx4
	hxRQCREwxfv2QN7wcrdq/jTwseDG4G9oDZtSMqgHnClyGiKTEtP9qbvrxoVGC1Ey64uTn1+DQO8
	J4xgkCr8Uxx9o4J+51e84hjO6NMOOEuPEyx1KnRGZxqI6RpFuuR7E2mHTHssDrDkSBSfEdSDwWa
	/zVoDqoKoKb82b5bDK8xTXPnq54iMuAKGvNqzPBAhpgZcn0XHFe1cXag==
X-Received: by 2002:ad4:5de6:0:b0:91c:73fc:a5a8 with SMTP id
 6a1803df08f44-91ca4b02679mr279668136d6.9.1793820924547; Wed, 04 Nov 2026
 11:35:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103214120.1099893-1-linmag7@gmail.com>
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 4 Nov 2026 14:35:10 -0500
X-Gm-Features: AclHuK8KYTUTOKm35fu7c8yL7Ef6TtUTjlBUJHXfgRJ9Y5XR8YSD4d0UlaU10G8
Message-ID: <CAEdQ38EHu74R-AouOXAwD2LJEUZgx5S3CurNGE9x4zJsTxp5OA@mail.gmail.com>
Subject: Re: [PATCH 00/14] alpha: fix entry bugs and consolidate generic helpers
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 4:43=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> With GENERIC_ENTRY upstream for Alpha, this series moves syscall dispatch
> and ordinary interrupt/exception entry and exit into C using generic
> helpers, and removes redundant fork, core-dump, audit and ptrace code.

Each patch builds, and the whole series boots and runs fine on my ES47
(EV7) with both CPUs enabled and lockdep on. seccomp_bpf passes 142/142
as both a normal user and root, and the ptrace syscall_info and
peeksiginfo selftests pass. No lockdep reports or warnings in dmesg.

I also wrote a small test that reads 512 bytes from /dev/zero in a loop
while a 1ms itimer fires SIGALRM. Without the series, 188 of 200000 reads
came back wrong; with it, none did. So patch 4 fixes a real problem.

Two small things, neither worth a respin on its own:

Patch 2: the comment in regs_return_value() says a3 is an error flag
only at syscall exit, but the code negates r0 for any user-mode regs
with r19 set. That's the same as MIPS, and nothing on alpha calls it
outside syscall exit today (we have no uprobes), so the code is fine.
The comment just reads as though there's a check that isn't there.

Patches 3/5/6: the ALPHA_SYSCALL_META_* bits come in as 0x10, 0x20,
then 0x8, and the RESULT define has an extra tab. Cosmetic.

For the series:

Tested-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
