Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB2D3537FF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796412; cv=none; b=Lpm4KgJnnCJpNFTVTiFW6W3EMVNM9EMwtnnnBQzQqXyAwZSURb47PN7bntviMAoPgYVMdlEN8aKG2DV7/Ylak5EgLyERpDbzfLerEvY7bI0OTXl3/M2ejGqswt66KDQ4S2iIrXPbbzLHtVN0QSyP0FTIBSZ7HOqSQtEqYY9YQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796412; c=relaxed/simple;
	bh=4H+dWSvxr8+UjpRwRI0SHZ16MiF829cfsZgcOenFqDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzz2F23VzdGeb14zb5+TVcTniK4bKaCFf93vmeoLqn9AN0e+j5prewa26RRYJLoBna/yPPqf2Eite7PPlJhCSrplTqbG02gCMjfAK+G8pMZVziftoGBQoI0ZyT+55XeJ2cvHjaq64OBtpG6oCZ+9w+yLzk+UcdxR3JdVpBwhrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7bec5112765so1021256137.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796410; x=1792401210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jPEqW4IX1dV2O20vPEsTLBe6R8QJVWdW6CAGC3CFIBA=;
        b=mgXo+9kgSnGVaDG5bDnRYdIqbS0SCPLrdRT70h+KxRaeOAS45PQcIX0Zlwoo6Havaw
         zFrWJF4Bm4vdexugC3VP8anUmpjMx06w+KgJ0wc4iNYwpKLGhyM6Ev9GJhw90/seIsXq
         MGkfnKYOpSM5cyq6E3p7OA0dcmtHdjCPYp6HYsE39C1nwhU/ADvwQqLhB9zrzBWanuIP
         PfEdVXb1P8B1LevLBm66HNP//sxqN+hVm5ecoB3sYBQF0ggkqchlyRTIC9atvbdQwKG5
         nW85Mjb5q5LPGEZ8SdJAdyzFXbm9KLHneOJloQHTOsIPKW7ogf6pI8DxbTr9kWv/faAH
         moRA==
X-Forwarded-Encrypted: i=1; AKwUvBxlOK+l/S2ImuOm6jJJsWH7X+g+9XFtdymD6vEVTR6wR4nSNB0aMSkGQDJiI16nqGtOvBYT/CB7LfkAxDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfANhPgKwfSAsdbgRf3I5HoaFvx6IVFQheFTPO8cRSUApY7Xlx
	vZM8h6Jg/aQEEDqFjM+lKcC1M5PSjq5LR1v7/RkpLRt9qIbWyNaAXRPZFMp6RuVZ
X-Gm-Gg: AYBFou3h2lAVb6QKfQr6Nhik8akSSxvH1CaEPLdt6NlYRD904llZs/T4TolZSZWAxwc
	JOe3fUUmPYEVM7MOMigp0GQaTVdxD/7Q43A9RKcMNk7CQzRTvLmfO4xogmGa5a+XAdtld8TCbyc
	YZFWDOJrmpdJloDPxhAVLjYXj8J3CTwIEjLs7HleH6LvBMYTf/SJxxJUMAh4MNViArvMUZYhSGK
	e2IwX1ZmpLHJ5iS0MpaD9KG1JivdcAXoWi2tNGwwHtVqn7gCjPZFEzndc19GDh9mWNa1C+aDPk7
	je6ktxqe8OlA2pRRApdiuv9q7WH7OgCaYDeGrEyatILdFR219N8HA2Ueksvq8KaQ9mxnO0i52KR
	aKR/ro9KYOP/UCfrn+H1bobpVfIHCkavWVq5RJF6oieEawi3HVpGUwLqLjgDPBzIS+vAHkqG8Qe
	2/BNt9LCS2VSi0xG6vGV8ltgcCDAU8r19u9o4Ekb4FsxEq7WizNnS31AYplSjUg9UgeTInEtNcK
	5vjL+tOc0/ToCOpKp66nFFsmvHNU5NHoeKNyQ==
X-Received: by 2002:a67:e713:0:b0:7c3:c0b9:8d50 with SMTP id ada2fe7eead31-7cb37311326mr2397937137.21.1791796409907;
        Mon, 12 Oct 2026 02:13:29 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb35471536sm6273685137.11.2026.10.12.02.13.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:13:29 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98c786605e7so816398241.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxeiebUXVR5RD3Ay6DkUClJhbP2ziqF3icJQOGnTnwNcpKeW4CZsbF3Acu/y3UsIuPgLg4MbAHA3hoJeAY=@vger.kernel.org
X-Received: by 2002:a05:6102:4490:b0:7a8:10eb:96ce with SMTP id
 ada2fe7eead31-7cb3668a4c7mr2485869137.4.1791796407802; Mon, 12 Oct 2026
 02:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002212058.25117-1-kmehltretter@gmail.com>
In-Reply-To: <20261002212058.25117-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 11:13:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPMSyHy4tU5Sq4y=ssFZy8Ktd_OZoFr9L2sj-m-=wFkg@mail.gmail.com>
X-Gm-Features: AclHuK_y85x8cMEVOZECVsvp7GHPU25gGQ7oBbJZUrQ3T9LAbD0GI07OmtaZn9U
Message-ID: <CAMuHMdXPMSyHy4tU5Sq4y=ssFZy8Ktd_OZoFr9L2sj-m-=wFkg@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: mctp: Make flow KUnit coverage an
 explicit opt-in
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Fri, 2 Oct 2026 at 23:21, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> MCTP_TEST selects MCTP_FLOWS, so KUNIT_ALL_TESTS builds flow support and
> SKB_EXTENSIONS even when no transport needs them. KUnit's style guide
> says tests should not select otherwise unused functionality. The CRC
> and crypto library tests use explicit ENABLE_ALL_FOR_KUNIT options for
> full coverage.
>
> Remove the selection from MCTP_TEST. The core suite remains available
> without flows; its two flow cases use their existing skip paths. Add
> MCTP_ENABLE_ALL_FOR_KUNIT to opt into full coverage, and enable it in
> all_tests.config and a dedicated net/mctp/.kunitconfig. Both profiles
> run the flow cases without a hardware transport.
>
> A plain MCTP_TEST=y configuration without the opt-in now skips those
> two cases. This is the coverage cost of leaving otherwise unused flow
> support disabled.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v3:
> - Keep the core suite available without MCTP_FLOWS; a plain MCTP_TEST=y
>   configuration now skips only the two flow cases.
> - Add MCTP_ENABLE_ALL_FOR_KUNIT to retain full coverage in
>   all_tests.config and a focused net/mctp/.kunitconfig.
> - Drop the Fixes tag because this changes test configuration rather
>   than fixing a runtime MCTP bug.

Thanks for the update!

> --- a/net/mctp/Kconfig
> +++ b/net/mctp/Kconfig
> @@ -12,9 +12,23 @@ menuconfig MCTP
>           devices, you'll want to enable a driver for a specific hardware
>           channel.
>
> +config MCTP_ENABLE_ALL_FOR_KUNIT
> +       bool "Enable all optional MCTP features for KUnit tests"
> +       depends on MCTP=y && KUNIT=y
> +       select MCTP_FLOWS
> +       help
> +         Enable all optional MCTP features covered by KUnit tests, even
> +         when no transport needs them. Currently this selects MCTP_FLOWS
> +         so the two flow cases can run.
> +
> +         Without this option, the core suite remains available; the flow
> +         cases skip unless a transport enables flow support.
> +
> +         You still need to enable MCTP_TEST, either individually or through
> +         KUNIT_ALL_TESTS.

IMHO adding yet another symbol overcomplicates things.
Why not make MCTP_FLOWS visible if KUNIT is enabled instead, like is
already done for several other symbols ('git grep " if KUNIT"')?

> +
>  config MCTP_TEST
>          bool "MCTP core tests" if !KUNIT_ALL_TESTS
> -        select MCTP_FLOWS
>          depends on MCTP=y && KUNIT=y
>          default KUNIT_ALL_TESTS
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
