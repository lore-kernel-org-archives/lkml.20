Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012358;
	b=3YVxsr7mJch9XmFQVkFYtvWYLdy3RwM3jWiZ2mm0hMQNr8wW68zEi9rciL9XYf0kOCGX
	 bhoFiRXylFSUw4TDS9C3Q3xVCC6bDvBAcCvs7agwnVLb8jr24Gs1bUwj0kAfiv5UAHy2n
	 Vjv6KcpN4k4EIiS6CM5ccHfDK7qho4d7YmzV2o2Yn2YAbJKJedPnpBkAKHSD1wr3VzrcP
	 sJN05gEBZ8t5TEAG8+foy0UU3IO6ahjiRem6DAOLSEWiELxiCb4MEvGocfoADKz0ynU6M
	 kvjvnBXJ/xbp2nUbR5GmqXSHt5x6XCKEzTrxBM+9RHFZt+pAbcr1+ghgeuyJmX+GDRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012358;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=TFMunBZpF+eoRnMN2Oji4st5E8hKoW6Ck2v2RBxXx1M=;
	b=U66uUtdU0JNKxRtLpoZFyFfijt/FtGNqE7IjimsVjXEnk7dzIazyq0CKl0dqgcIA9ZQ+
	 sjBo0Z8/hpJI3M9g118tdC3zNruFQXGSM/Ao8fhCFnbHOB+cb7cELdFaSjtMvUyZ7/sDp
	 mLTGJPqUgjnQoxvgNwcfWw00jaaYsGJyQRVmBI+DUldtYJV3mS7P740328akCxmXUkRaa
	 JuemxKos18hNY5vfcV5s4HEWB8JppJBVHds37B+9dEPSu11DgWKMf423fG9xAMkId8/aI
	 GTH1ABBUSp9P8TP6Da9rnKPUrzvxL58NI4CtL1XL0avXpVF3O7uTdsKz1AudF0WibYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="igEbSm/6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EEB606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igEbSm/6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE851F01828
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012357;
	bh=TFMunBZpF+eoRnMN2Oji4st5E8hKoW6Ck2v2RBxXx1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=igEbSm/65FUH52mY2qyOmGyiDXOGGNZDXzSdAlXg4UNmdkEilO5HsyB64AIRtWVdO
	 QDHxoXowYKgwr47NNGFW9dARtitAFSe57k3yh9u8O7ZWfV6lpYz5ho3N+QkmBQFPKI
	 953DHPqt4kteV8/uExAuJsJzGwCuzBhJU5f8xkVItlfAAyAyWMV1ubWCeYr/8eymxL
	 8Q8cp9N7lJMw9omcD+yb14t2dpP4avzhPpvJxXJB7AA9XyNlyxJi/Z0c0rKX09FaSV
	 cFeo2IOrl60QtVWiwjucTTi8V8PJ2hzOig+UYZJIM6Y+jwDmunkC13FmX3ErHBneIt
	 Jboy/wgZkGg4A==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c34bff61551so400589366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:17 -0700 (PDT)
X-Gm-Message-State: AFq9FYIIr5U9LuEDLUdP8Xkdb6vKjz6KxyewJXe8neKnM6lp2ebBgCTj
	0W6NEXK0te60kRVdVep9NQiu7iyrA/lF2rrIkTXtFfZzi8t7ORTmH0lkXqrN1DX8MPL8CoX2YE5
	J2PrQP9NnkaCW5aZT4m6U/u6P9TmCynE=
X-Received: by 2002:a17:906:9fca:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c46bddf6528mr746059266b.12.1793012356106; Mon, 26 Oct 2026
 03:59:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026091542.1031813-1-chizhiling@163.com>
In-Reply-To: <20261026091542.1031813-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 26 Oct 2026 19:59:03 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8YmzQJuT=afcCSEYLbAqEwC1A9B1phuKibtODdJqqEFQ@mail.gmail.com>
X-Gm-Features: AclHuK8tuPZwDJxdUHrNbLyiATR7J6HD3lgcYKaTYr9FmOKWbdHy2p84BehIlJw
Message-ID: <CAKYAXd8YmzQJuT=afcCSEYLbAqEwC1A9B1phuKibtODdJqqEFQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: drain dirty pages after forced shutdown
To: Chi Zhiling <chizhiling@163.com>
Cc: linux-kernel@vger.kernel.org, exfat@lists.linux.dev, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -283,9 +283,6 @@ static int exfat_writepages(struct address_space *mapping,
>                 .ops            = &exfat_writeback_ops,
>         };
>
> -       if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
> -               return -EIO;
Please move this check to exfat_writeback_range(). Returning -EIO
there lets iomap clear dirty state without writing data after
shutdown.

> -
>         return iomap_writepages(&wpc);
>  }
>
> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
> index e50ecbfbfbe0..6383739f5700 100644
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -165,6 +165,9 @@ static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, loff_t le
>         loff_t end;
>         int err;
>
> +       if (exfat_forced_shutdown(inode->i_sb))
> +               return -EIO;
This check is not needed for this hang fix. exfat_file_write_iter()
already checks new writes after shutdown.
It also misses existing mmap writes, which use exfat_iomap_ops. We
need to add a shutdown check to exfat_page_mkwrite() also.
Thanks.
