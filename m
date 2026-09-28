Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C8501F3B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633269; cv=pass; b=eVUh2Zi39kyZLB20Q+a9FJyoEln+lW5laCr8Hjl4uFTSphp7XbiKWNW3rOo+QtYfaIYE3lSH+edlF9gkEBGosdC3cQmbAWrAe7eiNaHzdicXUKLoHETul5vK3nxFMMdg3iTk8TCWIokFhSLc7iPHOckeyUkMGPfadsG4gZOIP54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633269; c=relaxed/simple;
	bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQn89jvXt3R84GCTMQ6ilLHMbw10WbTlPVXBO1ytKQvzWeFqlfrQUKwxdS3bl8VhWOp6rcro/bJFG1u1tJm9WoETRtqPzmDEUYvutLZq7bTzGFxCnNGp8jGIjefFQ0qIFwLVcDcKCEWEF8CcUh68blGIezVnFtOEDPiNx0AxLr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5Skv06P; arc=pass smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5Skv06P"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3a6aa10c2so811800137.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790633266; cv=none;
        d=google.com; s=arc-20260327;
        b=IjtEAe7t2xm7OXiC8t7ueA5HCRL2lyd4KWRjNe90PZ0vLBDkPRdDA6SWJ/DryXIEy2
         XxhvyuGlId2O3mspZp4Gm0ki0JWEbHM//all2GjP5U3XOH7KQEd67lm5XvrB5C9kvyyr
         MApHTwH2S5QrO/rViNKaQKFHalJZTrCc2IE6Nh6dhgCFXnyY/h4k4laUz4Bgs7S/66zh
         BI+Y8kHbBfhfuma/lHg2djVcZmzOyIa35gwfu8Eb9+145b4MSumPpp6/wSyO2YyA/udF
         Fl1gJBdsWGwuXQdxTMBnZKxFBtRr1aq2bSEdlSbCSNPmOiWRQa8aIJaqwI060uQW3N1e
         ne1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        fh=TiWarEE5+buyBdjzRNW6KtLVjgqjHVr1GZyUBFfluDs=;
        b=nwz8bhuNxzNFdXdLnOG5GIyFkRoF0Q/QiEtK10Ph6DrrSY6CBvPTNSl7LJuRsgE/Nv
         SYL9mASMgk8dPjNLevMV6XAkAuybGXjEsR8e9dZKmssdIU2q3gnn9qbO9CalM3Rl3lF0
         MOQq0DPfE4cY6+Z8ubjHbzJS6RLeZdw/ErCrlUgWnbpI87xfXLKs2axeBtiujxSMxtM0
         3E/UoQkJ/ymLcwVd8+0c7tO+db7rEu47AA5IHg6jsrlP3PkJ8fWlXW/DV/rvNtImc0+7
         EmWtTP8AvyMXU4+kM6ir0st/cKDmBONU3xP5iILCnZr0HgNjIN1mRz2SkuTt0U4nvwR2
         Ar5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790633266; x=1791238066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=I5Skv06PdP80elAdgEOkV7u7P5IFmWePOSv8be9nurQoyTIkpv8H94neikY8rZnjfQ
         4tqVeM3HgJi6ymwkm46Up929kx0IfhfD7GXz14YOnlTl71KbU+jbi6p7UNwgoiL5dzki
         agiJ8kgWocCor3z31dPAAeS7DiTk4FPj4P5GQv0Nm8pD7jCtrUWmy1jxo4dqkJsteJLJ
         tP5zcWdJYFjnus+viEBajEGX5GHO8mFanZKdnWONKEMpmneGcAx2BVfpdQiUeNmU+FjU
         QavbkDL670yrFJBBSMnDDTy9nDoJvrn457jJQsoUZHW04B7BXerbwwpHgOYdBnT/JM8d
         h8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633266; x=1791238066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=2Iv/j0RydE1UaEj0unBhAiyPQhzH2zjVLSp+kbtRHFpSfLz7lLNVX0muukyVR0U1vY
         uLiCUte1Qge/khA5mZofuF2NdUHsAOEvL9A4dNYRdRC6kooyKu6Qfq/2yHzAbGDkBJLD
         6J05e0UMUi0JmNyMLVOXwci99cQxbmZ6VsZHFmxf31/8CVtJm5BmZOh52pphRLgUVpH6
         ld0Djk4JW8NZz2yqqhkTvH0JVBYNLDeNfp6uPMUyLCUZ8B/zF/JdOFQIu7NOjkmS0TZn
         s6tYXxB6Jd8gpi+6raw9aqGROotbJmmLrt1k3qkXSnY/NL6rJhL+F115vwxLx68GRH+t
         L92Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAjdUJc9DPjBFIsHIkxIB7HRJhpoCacPnSvfKQb44/BzG/Bn0GJIHMoIMYuS9P0f5gofXQ9JftOYE6oqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDPrZ8F9Ks2T9dXELxDnZaivBeeaEeBnta3Mi/Euc6jKQGFiTR
	Nl8kEvN5KBv7HAiZ1D2FawnDk4ru7nhe1YoUXZOwefUv2cT7gInH8jP8ZwP+W98/8rjbxzkiUEQ
	Pcpj+YDrV7Uk5TgIlpPAUfxkZbRJ7Oquh9UYrt1QS
X-Gm-Gg: AYBFou0tVduTW8TY7iBmG+7NpEGqL58Bs4iBL0wscihxEd4BMD50wM3EUx2TaTLCrs5
	Cm25LioEkIA7yfLFMORrAanm1PiSaZkXi0Rb9+plrXaZpzKhdYKMDvgpoTUkb2Ib5t79HrSYqFl
	zJNAkQzF65UsQzeL8f+ldCgwpqEDOIncVnh9LVjP721yfnKIuCtzslqw/ozn+hSRKKD3m1QC9ik
	zt3hIq7kQ8pK7/Nwv1Rr1OkCyR7CQQv81hSEJvawbq8myg88g3ezk57npBYh17mvVohVRY0iwfN
	DUJJsby9V8e4viU+jAwzeKBjxEOhumepEhJ1euf+zP6IpiL6Z+cWacEpRVubxgOWtCiY6QFM1EW
	WodRbRbm/tg==
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2de0 with SMTP id
 ada2fe7eead31-7b341994431mr2105212137.4.1790633265847; Mon, 28 Sep 2026
 15:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
 <arrfZ5CYyLt0vwu5@google.com> <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
In-Reply-To: <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 28 Sep 2026 15:07:34 -0700
X-Gm-Features: AclHuK8nlJeFMJ-63_0sQ49qEkZQmIZd_Mx0rQvc5qKTUPlWeM5glCx-vJub4Og
Message-ID: <CAFhGd8r_JfpaBvjod+AA6G3BE5S-L8Gs-nc9xMXrxp6_tLOgVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
To: Bill Wendling <morbo@google.com>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	peter.griffin@linaro.org, linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 28, 2026 at 3:01=E2=80=AFPM Bill Wendling <morbo@google.com> wr=
ote:
> She's been marsheling some of the strlcat patches I sent to the
> mailing list. It's possible I sent a "v2" of all patches, whether
> there were changes in them or not.
>
> The patch series needs to be separated a bit because of Kees's
> 'seq_buf' changes, which will make some of the patches I sent
> obsolete.

ACK

>
> -bw
>

Thanks
Justin
