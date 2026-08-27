Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52462DB7B9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815314; cv=none; b=QPdjzuSBORMSZYf2XG7v7BQARHB8dpWjzeXebfzkamYan6XL6Ts+rp8IAQQIOT0QfU2FHwFPNfXnMHHH44ZB5T/Qyp18l+WKeHcfwBJdqRV3XiQrrrS6X9TY00ohCbj/W6anpAaW15ZXdVN4OFTG1NovAt+j9gCEORyWC71qyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815314; c=relaxed/simple;
	bh=QN4LLJKILJcpX1pZV2MhOQxGl4YiamTZyX0WyUCUqng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgK/pV0ZwqPsMQmZn4XvJ7BoQXKQIz5YVKVTnzIwo7o+NOqYmsxs/RUv4jQ0AWtvnUAp5yeJD6KRWWHotSgz6leQrpBVO/rAVBRWASgQcTKRVmi5vYSYB2s+s2ANq3osZ9qcQNUp9WED7JyTXmwMD9BsUgXxHdDTHiLiTGyV8qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97e781bb3e0so10718241.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815311; x=1788420111;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8yjs5lhxn9uGJPZAn9jjZ+Jj2fso4i8f+hR78O5TqU=;
        b=gFdOaWlcwmGOBvDaT+kctIi3LCpfqdawV7YWZCgq+0wRoKi7JwbqKJPdFi/Ewkxgyk
         15y/RoVvM/nhuWJcl+SXc7lqx3pNV0xsCZxqxWQ8vlOlDk1/fwBvsdOFVSAvCpSmuK7v
         v7myqC9DKpIqwqWeNckm1kp80XEAE2QXyA6B9IR/es6MfOoqm08B8Yd2t9o7brfBRGbV
         9f0diOvgToT3LAyA1dUUWfP1jPgSgh8UX1uX4Wxa4GKWKSNgnYCDw/Tbk2lhsuNul3Nr
         Ne26iZTLihKc2hOtbnxhGT7RyKTJSz7XwIcM/DZ5UTx4MN/bq/w0+3mX2JbQCOqV/AWa
         JKhg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt5oa3xh9eGe/6IneDT8WyGzVcUvc2L25YRaejz6NCgq38UV1gOYqwRl4Uk2fvhrdelWi+gS0AGNWeBIA=@vger.kernel.org
X-Gm-Message-State: AFuF++moEKfm7nIDRW1QBUZOnOOwgqGIqQVIKpFl8xm8vU69OSHT/ZIw
	O1HTrwflnl38dNkTvQLyv8VZMkjsvQPXnTwTwTsKjqrpSssjSgJP0X+MCFeKuitZ
X-Gm-Gg: AR+sD10cFNnT+V2CUPgqADxqGgZ8hcJwRPfQgYMmQxDfHgt4D1DPSF5flrdkz+HrlJT
	ZJeLewyZyn4e1Vrmat12Og7FvCy86WzwBWJ8t8CAYXrJcy+NOxPZJvNEd8SkJm7Qd6GtdX6EQbs
	S//G9vSzj32+CMhFq5VNCxqXosm6dLuv9LMFN4MsgDj3K8ac8bOl124vRlVxDZ6/yeqfRhY0JSw
	4v6xQN+bpFLPQlDuW/jVEZ/XeF3mPjRifnqnLl4NhlilvjAtFXOAe7s76TT4hqtjR3Vl86dfAvR
	f8/4bTJ7U4lEjsK/ul5hE8eFDTxqWQEOCUlYrr9RvohoenMl1mbMToQsyhmy3mRz8RwQ/gGuXIR
	2OKdS5A9YRnOFMG/ZpHRURHL6yTBl5AbeZq+2RRf//OQjPw3XeZO4lgvJ10VZ3PmK7Zt9uSpa2/
	DCBUA/S2dBNOhZYtUleG+iXbVzfNnNyOo6u5rVrN550yugboR+J90l4RTRMQj5MQ2Xfhd3ZCMWU
	+y+jYv/kIPH1zA2fIA1akLLZ5seKvFN+jnZ
X-Received: by 2002:a05:6102:5804:b0:780:5605:743f with SMTP id ada2fe7eead31-782bfabcea5mr4155529137.3.1787815311511;
        Thu, 27 Aug 2026 00:21:51 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7830580f5a3sm3818670137.1.2026.08.27.00.21.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:21:51 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ca74bd6e0so600181241.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoMDvV1m5Je9g0BAQ1ynt8MEz+Lh1lvjSOojbEoUHcCytc3WTOQ0HcKo49GCpCZriZiSSZW9M1fXOnQmFk=@vger.kernel.org
X-Received: by 2002:a05:6102:5109:b0:777:ab3c:b88c with SMTP id
 ada2fe7eead31-782c0bff4femr3644287137.8.1787815311094; Thu, 27 Aug 2026
 00:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64c6e0191bd8ccef0074ffbb09bd0584680d710b.1787584360.git.geert@linux-m68k.org>
 <20260826205058.a6ff019d0584f75c7f50430b@linux-foundation.org>
In-Reply-To: <20260826205058.a6ff019d0584f75c7f50430b@linux-foundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:21:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWm5N5tbwy3rhaKJu-n_BDmQwGsjze5LquWPMrhPmUroQ@mail.gmail.com>
X-Gm-Features: AcwNN1URxO1QJnlEtHmK-oLPYjqqMK6cTFFsDtUxL-F8NHfwrH50duGsc6bxHhU
Message-ID: <CAMuHMdWm5N5tbwy3rhaKJu-n_BDmQwGsjze5LquWPMrhPmUroQ@mail.gmail.com>
Subject: Re: [PATCH] raid/kunit: Enable RAID6 PQ and XOR benchmarks if KUNIT_ALL_TESTS=m
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 27 Aug 2026 at 05:51, Andrew Morton <akpm@linux-foundation.org> wrote:
> OK, thanks, but...
>
> hp2:/usr/src/mm> scripts/get_maintainer.pl -f --no-rolestats lib/raid
> [not linux-raid@vger.kernel.org]
>
> Patches enthusiastically accepted ;)

At your service
https://lore.kernel.org/7a2e5de234cc0286e3fe9bc11b810433775f2280.1787815121.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
