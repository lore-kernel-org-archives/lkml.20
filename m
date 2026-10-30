Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793374478;
	b=ZzmI4A7gSyAi+j8PuO1oUhLD55ols7fz1Wa52DP9zVjJgxG5Nr/b3IUR4Jcuj5LnoQ35
	 mgjjWBB28lhEr/8ykae9buLNZrJCQsDL5p9RrfD8T+DqV/DVQGyDtVQdkXbNMj5Dlgm4F
	 IhfgGe7dwEDnOsg/0G1vTNT7u3QhuZ+0FM5198ulhEHHdVcggIIi/LwUumb3O66a5+Y48
	 Fep/ozvbLN9T1qhAh06+sJxH1mgu2gsLSo1dlYPM7I9EQGl+lSTkZ97SbUAEFJpgjLo9I
	 mAhjCWqwwANMFJ9UC4ejX70xqW12/jwcQRimGnMAByDVVMbF8+zy10do9pZwAw5hfWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xJSd91MnDZDt49eYO1tZt1W2RFJUYboF/uKyYyF4zTs=;
	b=iawRwcotr8V1WEbuan+g9K5sN0eQB3DpDL9IaYLrzl48fkAwGvBbWjaRRMi/V9iz3T9v
	 iSFDJD5PDojlxm8RPXQ71+FCRf5U3xfjWwH5hzHYu30MiEU0GCbLqn6t2CdhTSRaNzQam
	 4ULNHcxPYmZ9KCJUSDl+g4PzaS1Dthw6+8OmvJSiYxajnKPCljXMAXY32ceJMFchTNSZs
	 6XN/U+iTzSbITyVvIDGDuY/s5Q+bgl16SnsANrYzXoYZEyIsqdmKAhjGd1lkW1eSeCdHU
	 82XgvhHFo8iVTOBebjWMp3+ZHu4RZhLkBGq5ZocFyKs+IqeLNWyEtaAgMl6X1hnSfxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iaE4xThZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86637606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86637606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iaE4xThZ
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-535f598d126so264221cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793374476; cv=none;
        d=google.com; s=arc-20260327;
        b=EdqJffR2XJbcIFY3ErXgmhAtlUpA2NPjSt8xE22KM8haTqJk2pK6hhyVCML/AmVNbs
         KiwpKLp/Y/PYEqi1rrXMEftxDzTmqBeYTF44FtAn4BP/pSYOQZw8dSZ1AEK8p+tni4XU
         dsoI9e1K4rGKdYuulyUimIaO0/0TGhTszxEL/QuXkYBfmM/FxFBWw3KD06+6/xIlAXbG
         aUxZbksUS8T65i1I3K97usadW9K3vxyohs6FCHA+EFH7TVJKmLIcQ70ka1eJX3VhyVcS
         3Ey0BO2uFaKZO4rQKMWdBY4u9EjSaqNJlwBGbHTHmjTL79/y4Ni+p9qbASLrkOI+azpe
         RheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJSd91MnDZDt49eYO1tZt1W2RFJUYboF/uKyYyF4zTs=;
        fh=vIaqhmJcNDIjx4aBNPs7JuKcsYDRwCE8dza/dgNRHoM=;
        b=CO8QTBQk8zVwqRWaFCSLNwM/nip1l7jdtKFWw8/YOyM9erV5FT9vAFmsiJdriMBUG3
         Rp+0RWuNFyMwy+pzxyAN+XrqvI2IQLqrnU+ixmuylBbWUJmioXl3qxsnJa/oFtFSoJof
         rnWklIdPm54sj/M3x2aZPXIeNT36KztEGDYMIq2+GTTUN09FU/3XiuaxFT2O/wif6g0p
         yOn3Ckmc91BFccVuN7clalpurKpr8c1fIGWlw7E/ykkgVOlZGEiQg5bOBHPHn7e7X1yV
         jG0+tZ7qIanzQwlvPujcgiK1x5ezeB74MMt0tSLPDCPdLFBlicjf6/NE0gPCy9F+JXkU
         4AUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793374476; x=1793979276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJSd91MnDZDt49eYO1tZt1W2RFJUYboF/uKyYyF4zTs=;
        b=iaE4xThZprOQ3rkefWKh5605B4nMSEySP7fdCAx3m5sxD43qanLAkAZMo9j7bBwOMm
         6BxHyYAY9iuKudTVQ6qjmbctlm8ES/clfvWv72+bCLPFJQhFWI/ZGb1rRLWbJLQYl2pw
         4hXoEQNWM1QYIiqxJp3lnzAKC3MC1USLpof7VG4s39p2LMQcxHv9YMGPxCC4fc12FJUt
         ML+XYaENa6S3WM8ziKqARxZ7kIlZS+DxMHmpqDMg+judj8Lw5CHtKA4aaaGHmC0fPa2n
         5tIzIIGkUmSn8WPBFkSPQilyS43qoV9Hnct+bpEmNVW9e/qQN0HUyH4ddkedheheDEFM
         x+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374476; x=1793979276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJSd91MnDZDt49eYO1tZt1W2RFJUYboF/uKyYyF4zTs=;
        b=hahHamyvEm34UrYkV20MdzqkWfT03xp9SyMpfFzwly4XgLU+iCOOq6dXNwXmn0xFI7
         NNwJLfC42WRAvO1bcreVNC6ltNVpx58KmqaMEnUW+OY04Esa8daTFwpkQzNzmJVQ2FKw
         ixz42vReLP/nYvUoqxOxRgPh5nJ4i3W/ifPnCf0hZHkKW5OaEKenuOZBhmW1QoGShnFj
         xFzfq9fz9w7W9f+/s5N1afEolF435ZwU8ssEQb7C64p76sKhMCRbwrifTlMfmfCijU0S
         TymMpuPjlO+ZNZy+YCwOqgHdtbDEd3+Nardv7V3PtEBvV5shKoXyodLU7mtDxMJFIw4X
         s9cA==
X-Forwarded-Encrypted: i=1; AKwUvBxhc3TJSjBfGTaZ+qWVu71S9N5o1SmkMYGCb9vuNigrrBkIr26w91PA0epOI1dDxpLrY/bGpVKP+YjREB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0PlGKlUZvq7Qy6gyqEj7R4k4ZaF8d0fWkkaVytSaOGMV4rY1K
	6kQ45voiSfv9+fsLkmJZiB0U5bPUxjTbXGTc+IGWzReVACjIkmrCmOR4dBcG8LV8gf2rSIuuL7V
	PCpbKcqGYOB1TXQzjIJvX7gppp5n4/syYRHHRRtWQ
X-Gm-Gg: AYBFou0fPmleh1FvB9cuwoPYX8PGJdxdh6mJJNxg4UqEww51cUj8TQYtDfhC17eKJ5u
	ZIjfHtIZZKbwXBIHe0SLYuxKkj2XLXFs1jDhOERFT/DrD5h39EFRBf+2M5xZ9wlPIi3ByTjCYqg
	TXrJM0ODNPXe6N3vRe5bUlCK46a5Tw7wgy3DWcSZ1NpMwN1h/jgRkp0zgZx8AOqWsDOU8xjK5MY
	NoaN/+QTN7mTlh8x3gm1hJvDgFdylFc+gJ4HgBIjht18snxuiSgKllomFqrNYvYGBar80zeqG/q
	vwyKHicuLQ/Xe9GLykowmOeNUfxeK6waqn0XG8B8p96McHsXadq+OUhAaW0JWZJpvq7PoGOzNXo
	Xva7lx7l49ovcDowZIXiHd0Y+CCiJD9AciSkXa9zz8Wae00z+Athm/LP993LT726eVbw=
X-Received: by 2002:a05:622a:4c19:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-54129d49b08mr49055431cf.2.1793374475740; Fri, 30 Oct 2026
 08:34:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-perf-symbol-memory-send-v6-0-7e90415f0101@uber.com> <20261028-perf-symbol-memory-send-v6-3-7e90415f0101@uber.com>
In-Reply-To: <20261028-perf-symbol-memory-send-v6-3-7e90415f0101@uber.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 08:34:22 -0700
X-Gm-Features: AclHuK83bdTL8Ehtx5SwKCb_R4c0NHYatp5MnU4GItHIuM_WMqwqQwGoR6dn4FE
Message-ID: <CAP-5=fUejV8+M10Z-CtqnOS1qdkoemJ=3GWWQyfw0TAHQps7Og@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] perf symbols: Point to the symbol name instead of
 embedding it
To: haghdoost@uber.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:42=E2=80=AFPM Alireza Haghdoost via B4 Relay
<devnull+haghdoost.uber.com@kernel.org> wrote:
>
> From: Alireza Haghdoost <haghdoost@uber.com>
>
> This patch changes the type of the name field in struct symbol from a
> flexible array (char name[]) to a pointer (char *name). It is a
> refactoring and does not change behavior, but it adds 8 bytes to each
> symbol allocation on 64-bit hosts.

I think it is a little worse as we'll need 3 bytes of padding. You
could reduce the padding by moving name to before namelen in the
struct.

> The next patch creates symbols whose names are read only when they are
> needed. When perf creates such a symbol, it does not know the length of
> the name, so it cannot allocate space for the name after the symbol.
> Perf also cannot allocate a larger symbol after it reads the name,
> because the rb-tree and the callers keep pointers to the symbol. With a
> pointer, perf can allocate the name separately and set the pointer later.
>
> Signed-off-by: Alireza Haghdoost <haghdoost@uber.com>

This change makes sense to me. I'm wondering if any other things
should be cleaned up with this change? For example, namelen is only
referenced in about 8 places and we may be able to replace it with
`strlen(name)`. Anyway, ordering the variables to pack them is a nit.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/ui/stdio/hist.c | 1 +
>  tools/perf/util/symbol.c   | 1 +
>  tools/perf/util/symbol.h   | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/ui/stdio/hist.c b/tools/perf/ui/stdio/hist.c
> index 8c4c8925df2c..c65e3aa73a13 100644
> --- a/tools/perf/ui/stdio/hist.c
> +++ b/tools/perf/ui/stdio/hist.c
> @@ -106,6 +106,7 @@ static void init_rem_hits(void)
>                 return;
>         }
>
> +       rem_sq_bracket->name =3D (char *)(rem_sq_bracket + 1);
>         strcpy(rem_sq_bracket->name, "[...]");
>         rem_hits.ms.sym =3D rem_sq_bracket;
>  }
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 2d611c05d000..02c077d7e2a6 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -362,6 +362,7 @@ struct symbol *symbol__new(u64 start, u64 len, u8 bin=
ding, u8 type, const char *
>
>         pr_debug4("%s: %s %#" PRIx64 "-%#" PRIx64 "\n",
>                   __func__, name, start, sym->end);
> +       sym->name =3D (char *)(sym + 1);
>         memcpy(sym->name, name, namelen);
>
>         return sym;
> diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
> index d8386c4a7fc5..c231d8e4427c 100644
> --- a/tools/perf/util/symbol.h
> +++ b/tools/perf/util/symbol.h
> @@ -95,7 +95,7 @@ struct symbol {
>         /** Architecture specific. Unused except on PPC where it holds st=
_other. */
>         u8              arch_sym;
>         /** The name of length namelen associated with the symbol. */
> -       char            name[];
> +       char            *name;
>  };
>
>  void symbol__delete(struct symbol *sym);
>
> --
> Git-157)
>
>
