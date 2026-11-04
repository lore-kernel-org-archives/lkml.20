Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793763337;
	b=RldJvV9+UWpKHjv7Khe5g7a2WqViuJwCSiYZw0KJcmTj+dlSYgygrPvZdWEqsFDSHSCA
	 9VkyktCQWfx39njET27dPn0uOnnQd6FsEiMijW+SlvJuxSvk89pwpD2d/Nn3kL9xgsOJa
	 ZFY5q9+RE6Rj8WzzlZ7elRK8+PU1r9N76Ymzug6TU7uBAGWnX5UUdXqOWqwn/EArs7yuO
	 Kis0Oz/frqcVSxrwr3HOKz7pboVkQ9tZzTR/XYFLwO6D6FWqFkBdCvT/RmhFqXnRfLSH5
	 xxwyXO8fawtuIWxK4V8FF0PtJe2YL6HVdK1HI0AH3M1jh3h78FHOkuMl9KmdhkXk1Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2FWaVlgG8DlrEVsmGNjQ+m7wefa9FtjIViJ89iIUCc=;
	b=b7ACParg/BAEdU+xwVXBKokQHG+uoUkudOAeZdapJf8mPwtHwxgiwwuSJ4kjxhAm613w
	 909t5PaxPHGKTCOgql5uUurnXMI8aN3T7GO+qqX5b9d+YuhP1bh+K/jD8TWPmW+Bs9zzj
	 aP5dsdU3rXbJqC2GTj2b6T5KOFO2vMF5kC3ylSNEgIfrmYOYilDtN5BByOxIbGMVjUc6a
	 wdI+t4F768EAQtfELh67vAU9lywMHQbSKFw+3dBvA4EtMTg0sbO8+NTmQfQIL5683ey9L
	 6fC7QDjk8JgXpakf8MHwYZZ7zHJlgXVH/YsH+8GFHL37JwmaRujxL2ujMZQ3R6jQSpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZM+Bo/NL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77B9606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77B9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZM+Bo/NL
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso287131a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793763335; cv=none;
        d=google.com; s=arc-20260327;
        b=qQ9vcMvPNa0jDGtqkPGVNJXDaHL5xwH7cfp7S4PrQg3dDQLlRZKJadf0WT+9Z3SmBr
         pcH7UBo1cauGNgiHPFhLpCD4sPB7eMHdv4VULKRVECtslPHpnjOKJ3MuiiuQDnSwZiK8
         CAtj1bs+hyYfbzSc2BLj/D6DRYeJ0mOslZGEyGoq2kb4l4B+iz/sopnBaWzczKVAJ+vw
         EzpEN9qzutR4BYnjQbk7q2RePfB8bEP0BJARA4QxjCKTFPemCQpFhcwKXFee+rc1xUAS
         7js3cBBy74yI0B378GxGfiuwketaPOXjsE4mAtHON2qPXFQqY+dmFd4NihSwMcCRQHp6
         FrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2FWaVlgG8DlrEVsmGNjQ+m7wefa9FtjIViJ89iIUCc=;
        fh=TP9Xsgu6AodgjvupTcAJwto36z7ggH0lPzY408llw4k=;
        b=b8DRQbHP3Ij2vJKaF73UxPvt6S6pbaST2Taj6sq+qkDf+zSA7d8IDpAAFKiMMoftqf
         kQt1bXiUYAYC2Lon9j/NRFkct9pikP8/GFR1JhI5Jp+tcO5Xn7awoTs1TTRNg2bG9cgQ
         V17mlQQQBHPZEiIpZLc2HNY4/Gj0MA/1EE+y6D7WC1v3s3RDsxoSyJtV7cvhgo0dgrJT
         oyx/upVXZH7TUA8594wo/WAd57g3GNoOF9xyU6tvN6SkjVfRJfrKzAhCHoJS4xtm5UMr
         gai7lLLKiDOoNADSgzs/DNhAGeRX26gKgIR710lzUTABRnpt9cKbF4AUo8HFoxah9s1T
         tjOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763335; x=1794368135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2FWaVlgG8DlrEVsmGNjQ+m7wefa9FtjIViJ89iIUCc=;
        b=ZM+Bo/NLHVAIGud/SRt1S82BHSV4Dy3O/1v/XhWAygF4W6LC8LJ4zz5tAHv0DKZISK
         y99m2Vzu9GwsILtdlsp1jaTwouR/2MYaZmRoQEYGjyc1l9qj+unLS29lF5agI8+M5HLG
         0zc9jcPKe0IbDIAMcl9xB1IndX3PyX1CtpGmg1HJxmIsKGflGof4vnHMxAw55W1f/Wcy
         TbkSyTfpug2hmzKDyMDSQkiLuVmmUM8//uoc5GY4fuYPaFwMt86KGBfg6K5Vec6Rgfxj
         N6E6our0/WG7Rd0Xd5gyJ6hair+/K9LSmfSxXKasKFEs4nwWUykQmzxp5ANZSCoa5RCb
         IoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763335; x=1794368135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2FWaVlgG8DlrEVsmGNjQ+m7wefa9FtjIViJ89iIUCc=;
        b=sysdhxSwaXR+QdJKdFAdnlkKfQgNehQdfxy5b4l3yuvvVqJCJgTuKTHlGN9GnGreap
         kN0U+JnjiZa/WC0M/oI5wUjXwhveQYgfYNcDoVp+QY9Ed4rvLyGnqrjxHs5WZttFy2Mr
         3j/91qHxJcNkBZZMUkdOJN0xJEkpE9TaWByXtKXP7U7GTK+C61i9Fh/qj76obyuSfMEf
         5j4NhZwXQA2v/dWQviDUjFMAV1QOCYjWUik/XjDR0E9/8xr4MrNUz2eqRzNS1V8WFtSw
         ovnbHObnKtyIjfP0jZIlq7xyXc9bY1U8SurkEWUyJOeMYff5ycl6MVo3k5qhQrwfSoMA
         c/Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxEm0++ViuGdo8c0nzk3a7hBTjl7nDxvnuDrXrH0jYYgFXe1Bmus67TyqdWsxhuSDuNxQzZgrlSudnrgf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FACfiDLbzmio76ycu6Czwoxd3rUWW5Rm1VXnrO/vvYbraoxQ3
	q1qggMFjSfwxmxkclS9dG0/oVzTnv8w+r3Pbr1ttqs8T3fafobprvSjl/m+U9VK/TRK3w4nQ8ii
	CZ+lLC+5x2n+p1rmng8BAG7aH/0WqlnDtcFhFV5Ml2A==
X-Gm-Gg: AYBFou2EbiLycOlVX3qBvCgPHc3Q4ElifM1scyKTJ5s2rIdgaQb0si+rUFywTwldaJG
	13EKFbu+hKQ7TDG/StU+UNy3RVSvK9BFVErq6l7r0hb8IWh1ZI7f4KX6pJtstNThOJCu90yPVTn
	4P1c7B+LPPuMhgRWrRVgTVOC8KBhjqva2HM2+q3OMlCD9EGwFLAkJozqyuFpqQoDbkzMNlLX2io
	e11EunWrxytD/suxXML4uTZJf6ZL0CR++sz8v+ezSD9YZF1bSrzigAAtjWMdSmUEH5sQ24uZEq7
	VoqK//hEJzhzdZiQ9NDL5LD9N6NxC4h+1IPiXWX7Cz1TOFWqTx1IqTT2W5/G9e10vKyG4R0N3OZ
	H3Lyg07/cDKli5bk4iMJJTUWcfWltgWFi3piFGUg6ZItIjK9nQZ0JiHGSue6rft2tSa/Z8rxblf
	w=
X-Received: by 2002:a17:907:a890:b0:c46:9ca9:f522 with SMTP id
 a640c23a62f3a-c4ca7a69782mr1214812566b.26.1793763334986; Tue, 03 Nov 2026
 19:35:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179374297269.488856.7749172366095110113@kernel.org> <20261103225321.19288-1-federico@rimpianto.com>
In-Reply-To: <20261103225321.19288-1-federico@rimpianto.com>
From: Chris Snook <chris.snook@gmail.com>
Date: Tue, 3 Nov 2026 22:35:40 -0500
X-Gm-Features: AclHuK8pgXDdUe8VVPBSwoSm2Xv7dqRRsi3A56cCZ8EmMNgChDd3Wu0uj8DEEoU
Message-ID: <CAMXMK6uS4-4aq4A3pUMghkt5v3U+NekcCfDa7ytbjLD5ZwG+8g@mail.gmail.com>
Subject: Re: [PATCH net v2] net: atl1c: free the RX buffer when the descriptor
 reports an error
To: Federico Musto <federico@rimpianto.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:53=E2=80=AFPM Federico Musto <federico@rimpianto.c=
om> wrote:
>
> Thank you for the detailed review. The findings on endian decoding,
> multi-RFD error handling, stale RRDs after reset and missing error-path
> work accounting were valid and have been addressed in v3.
>
> The v3 now:
> - decodes rrs->word0 once in CPU byte order and passes the decoded RFD
>   index to both the unmap and cleanup paths;
> - unmaps, frees and recycles every RFD of an errored multi-RFD frame,
>   with ring wrap;
> - counts errored descriptors as work so the RX refill runs;
> - clears the RRD ring on reset, preventing stale error descriptors from
>   freeing newly reposted buffers.
>
> The memory-ordering and link-reset/NAPI issues are pre-existing and are
> left to separate patches rather than expanding this fix.
>
> Validation on netdev/net:
> - scripts/checkpatch.pl: 0 errors, 0 warnings, 0 checks;
> - baseline and patched W=3D1 + Sparse builds both succeeded;
> - no new warnings; three endian-related Sparse warnings removed;
> - git apply --check and git diff --check passed.
>
> The issues were found by code inspection; no hardware test has been
> performed.
>
> pw-bot: cr

I no longer have working test hardware for atl1c, so I'm unable to
test this on real hardware. The same is also true of atl1e. There have
been patches somewhat recently for atl1e that suggested some people
are still doing work on real hardware for that one, but as far as I
can tell no one has made new hardware for atl1, atl2, or atl1c in over
a decade. If anyone is willing to help test patches on this hardware,
please let me know.

- Chris
