Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378317;
	b=okCXRcNHxFQNXFyboKNpRlRJ4p2fxGoq8xuQmv34OZZEfEzaM4OsqPuvlwgf0A9uq1Vr
	 Rrja3T/WZHNtIFjF74RtJ8CY7atzrHa3H5O1NRyx3AW9ekfdr1ryROVgg6vl80zPfneYh
	 ZiOduwTUDxdfsAOHDezcgKKsyKzn3WWFiSsJuTjsUolAp+Mb0CnUc55awvqMZuV7oe/z5
	 a2TuGyOiy0Zr/6CEW/+g5Fnj7ne8zH0ebeWRT7AUzNzZ3JVbAtMsLjjSDsdDbM3LG4wtZ
	 PO2Cflvo+LK0W2v4UZqsmhFDjtbmLzgtEsXkxuIubDEC9HAUe1MWmzqo2sJWSduXvhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=UpG4mWaD3IAbNd6Zc+GPW6MdrE6UHLepfWNOwfzGPT0=;
	b=lxHpo1n9p2Dp7inv8UBxFz3ZcKq8tpyfq4MnLl/sjpJ9AYXhMF+MTzj8HRJheMb8QsSg
	 +/iwcxnTppSK65VXh9pg1vYHwrpvCR7J1JXvMDKTm4tAn6b5NZlXIXzD9j0jIL/nvy07f
	 iMNFh/S0PjsQ4cBL3+O5UEvnyGcxwl1WTKwOo1PiHk9R0gcgo0iTQQaaDFxJzkN3Wgekg
	 v5m2y5VBRoy+irFiYHJCyLWwgXEin3vwC1CKa0NDE8gBrD+eDRG5NqweLsAhDPPX0FMUm
	 Hc74k9+uksGg2ipQPxyTyuPqBp8wlvwh8Yv6DF7gOwwqlwmwpXxLUwTSqTLfFsyNxFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="HuF/Iumb";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HuF/Iumb
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1788664a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794378316; x=1794983116; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpG4mWaD3IAbNd6Zc+GPW6MdrE6UHLepfWNOwfzGPT0=;
        b=HuF/IumbWB0KpNcWC8DaOcXzSND8qrtJGOIjhPx/P1Li2rYS5Z14RPDqdtmbzu/PPa
         L1LQejIChf776Y+xvDTp4BRUCWZ/I4gtn/iSzWzdN4onK5KpzVOgP8i27DIspqJFUMKs
         iO7L5c0S9J0WqFdZd2teNeEHsOaqEXKez+gsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378316; x=1794983116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UpG4mWaD3IAbNd6Zc+GPW6MdrE6UHLepfWNOwfzGPT0=;
        b=tPyG/bxx8bVJC4t9PWltemkaLgnAshUUp1Zly3nlIs6AvouCs+Hyqs4R/GBdvBmXq1
         pJvJrkGiS9MJwELyaeCDr6tjHte2ERmU0owKTsjoXVBzlg0sgrOKA9P52nRaTySXh8LN
         /OZWPtHeguqkt+Tz5S5wBOSMS0LdgsM1xikcPsf7xM1AB/sChP3jf4PuZ5s+Rj3yK2c3
         BLttJXMp78YKUYNc0kxzYWA56ahmEHPihwJyl9mwjdEW8xQNeOihmJOuT6r20a0jhDOG
         2z7Ln5mZ41PbGpM00fCZqbcf1ECRpk3ivCNVnx0LvKXu+4hkQL9JwLsFu1go8ZTOAv+x
         jMXw==
X-Forwarded-Encrypted: i=1; AL+hErED8onENzZD5pG3voeV4NLmKXuql7aLeqshLWE+gHmRVJMXh8p0btFjG33Is2ilkEGZuJKNzdlwVeODQ/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RKaBNGmOzZO9bKUaDce/MMRoCNTb6SoRfvPv74Qoux1QtDhC8
	5iafWN1emXofqqHJDj4GBVvSPne/PLXkAJ/aQQWm8ZStNfHpUTGr7mcobKBtrdJG5Q==
X-Gm-Gg: AYBFou0YAkmY+obPloU4sc1tOOcdrXahI3rXvU3WRLf09erpIctpv/AqUTNk8nTuPMt
	z79gQ4FfDJHaF1X7EXP84UMxRjBaVSRBbIvOfefoqH/nncL21tvXgu3zKdQcO6njGC4fLs1aD/+
	P1ZslSuakL4QRA51D+eosM2WNgkgv47v7HDY9h7QsTSv3R03Qd85kae1BU/rlFAFIpLdbyIj8Oa
	zEaWp7H8oj2LRmLFIAi577DjQs3IortnVVaMF+WP0wDKIzK6wUsE+Tt1XHJoWEhejmW39w6v8Ih
	WUb/H/KzTPxcOpsYLKrtpgjCF1FkXrHYHWX0VQ+nJVmV9bigFbj5Q+CjpZWdoV68Lkh+nU5sypl
	MszxI9r93KUFmxqqz7cRIhOE0ai9VEqsiGnP2+82aUPiG70GwCOB3ldBMoBIsx1816yVAEbAL9n
	xz2f6Qink6GoMjz/LDsw0tNLN+00bcyZQGndTC37Br/q8o5+b5E1IBTQFs+QdaBYJkDBv7dpMok
	SfS0EI8xq56wWz4E1gAUgacvlNDwqz7GHK9Tyq5cgC6uIi6Y1DlC0Mseg7H4QVNwXrq6/v+XvJu
	RVMpFp3gUhW8qT2t3GBNm5klaI/Sswc9l+A1fLbGlXUhKKTAo1qsqf88O0/427RBVjbBDpI=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3b182f858f5mr1600801a91.47.1794378316367;
        Tue, 10 Nov 2026 22:25:16 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9ed10sm17185825ad.49.2026.11.10.22.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:25:14 -0800 (PST)
Date: Wed, 11 Nov 2026 15:25:09 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Nhat Pham <nphamcs@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] docs: zsmalloc: describe statistics with
 CONFIG_DEBUG_FS
Message-ID: <avQJ5NG99xSRhAwV@google.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-3-caee41684aba@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261109-zsmalloc_stat-v2-3-caee41684aba@gmail.com>

On (26/11/09 20:59), Xueyuan Chen wrote:
> -通过CONFIG_ZSMALLOC_STAT，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
> +通过CONFIG_DEBUG_FS，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
>  看到zsmalloc内部信息。下面是一个统计输出的例子。::

Just out of curiosity, what does <user name> mean?  The stats are at
/sys/kernel/debug/zsmalloc/zramN/classes, where N is zram device number.
