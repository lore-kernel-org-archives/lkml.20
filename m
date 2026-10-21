Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558582;
	b=Hye/+df1U1Pv/9m/KiDXHzwf97YBmQJv55lx49aF9YvXVB7bfjH4LxQKLjGz2yhDlfHa
	 xSpgejxnl7lxK1j7xu4iIH8/2K6rP7QObQ9zjLH6qHddOsf03k3jwnIBjhZpczyc52XUI
	 c/J0r82vDJY/yRBshmjYv2F7A6/ZIBbc56Jr9CKLTUtuKFgVT6T1sc/Ypf8kHL2JG7EOt
	 HEjKsoJ07lEdk32IhoB3KGkW5nei8tJDLTGQIbaiVA5p9Bo81UQouQd5+RjCicp6WtAnl
	 Qk5GskDorr7q16lNfafogmxnWa1tGjVXSgxitT7K3xX3v3l3Amd3xpClZJ0Lz1bppHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xiB7CdYcz2CO10I+090KxlJTct06C9BMHn0Ug9FfOXA=;
	b=kE5XmKx/ZIXvBl/CsLjweSoAOaye4+VTlfvB27iBz2Vf6nm6l8HICNtR2oPFkbNj/uZD
	 wivKAlBIMD1J4OwB3iQXoqa+y5f7+ZLW8zZQSbIGAuNntWJ+fIKs+dGzDANBgx84x6l2D
	 O0J7FRP/XH0cUyeFNXhZPbBkhHd2nMZNiwv5vdY0iHarZOYEMk8kunlj2oTw3UfsJm2fx
	 WQT3ywXJfuzJPNhi7oDRRdwsm3NVcd9Om8j1sNZOY5UQ+btGRvNFwlEAHT4w+ph/nKDhJ
	 DMb7a2tCAFhxqmkW3NtvRsP6Wbyfg1HQq1BcrovaR5b9ZS/fCPCD0201VSvMHc0xmRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DYQSDKZN;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20916606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20916606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DYQSDKZN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso572359eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792558581; x=1793163381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiB7CdYcz2CO10I+090KxlJTct06C9BMHn0Ug9FfOXA=;
        b=DYQSDKZN2bRL5F3RSwjiUDkSX1QVueyiGlVs1/IJGcCWCIO31cMEICQhyiIoyABEmR
         qr/YxUMpWx5GE4nCibjT4weDnTpv0cQF7mO5j0msjETr2h8eIMasnydI2JmufLIuQgc3
         HmBPGscfc0w4DaV+etT3N2+nXZ+tba9ykJkqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558581; x=1793163381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiB7CdYcz2CO10I+090KxlJTct06C9BMHn0Ug9FfOXA=;
        b=AY1tihUQOI8/VcF7PZ5OMnj+hnS9biKC8jSDEIwZeGd/yLQCy2OCGLkuTNPnY2SFjq
         3NEe53n+oHIDxu9R4sYnDz68XfjpXCUQq4yrGAd6hcu4m3xJv7QIh1j6E69XU2tW5MiP
         dNxJje/ABXMhZU7wYCCh89Xs10NtPN18KxPe01ugwh+SfJIdtNp9ItPH1EYf3uS6pxhA
         WK7e/o4aeQgf4Mg1ZV8ee9UhztXYW6LUbi0mm5PO2SUVLTOj9gbKexvNg2Z3+zaPmiKO
         evrAQoFezBd9+jQuU0ok71DpNX8/Z9viDhz7ZiFz9Em2czPBeD6SVH2EXtT9ft1+mFGD
         jvag==
X-Forwarded-Encrypted: i=1; AKwUvBxUD8mOjAMlpk/rbPXfNSLWCi2Y5Wfl/DntiK58xcPhXSC5mJl0ur+6o6iLMo8RTaK1nJkUKDzFsKflaKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr9Qx+mg4lw2GBIwsBR/PhJ4WCqMnfKThponJQdaDMzwH08j+j
	ufWpvh8PE/fitqe+faZOczGClNvRsVSOZfIXb9r772eOPc7lEhBGyx6pxOnsyH/q1g==
X-Gm-Gg: AYBFou1k4YS6FApkt3LC0oAsGgVLUuF6lR8Kamx72BMjE6cro3yG+/PgGnUkcxqmddv
	AqlW/XEYUkzTrA1Un4sIhmTRkYWhn0wBRCHmbkFrBbbZexYo0u5QcM+2tQe0qGam0/1as07TwBd
	smM4rvHMsaA0Q6YodnUHcTFVjw6hGBqWSJ1r6MUaJqlqEQ+h/Gu2pYjRMXN9r+eFvCkdF23lrC+
	FLAsz595dt9WoqfaO87TkJmOE/xnZQaGDYjM7uif4DRKuprHs+VwRa8k3byPLINRDuY7a5qyuwU
	Rhs3SQgnKWHFVi9bo8OZ/n+YP3y2jx8eV5/zfjMoyUbZgK/az6oNnctC6G9EtY1O5GP7AzHjIWh
	iJANTJCDDHnXNpm22GOem6DABCV5WqkxpjbwXeSjV42TUSkOeu4e6OXyGc7ed0uR+0YqQ1sE2j4
	/INpW4z6ybsMwG3VBcag491NsfCEbnksLjUz/g4RK0Sjmqc5e13HYjOTKCpwob86NENKXM1whpb
	qKiFIS+LlnS0vbL9A0j3/DodpMjbSBeM3wyg0F8VV/8be6tbwR6+mjqKEWMTtN5C2Cfa5Qiifjh
	wcm3YKnM+flZjoqlezuU
X-Received: by 2002:a05:7300:8246:b0:366:913f:4d18 with SMTP id 5a478bee46e88-3674db4d094mr1602303eec.14.1792558581213;
        Tue, 20 Oct 2026 21:56:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm3617931eec.3.2026.10.20.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:56:20 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:56:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Message-ID: <athFf0kXopUKh2-V@google.com>
References: <20261021024236.1787884-10-senozhatsky@chromium.org>
 <20261021042350.907-1-hdanton@sina.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021042350.907-1-hdanton@sina.com>

On (26/10/21 12:23), Hillf Danton wrote:
> On Wed, 21 Oct 2026 11:42:19 +0900 Sergey Senozhatsky wrote:
> > Split struct zcomp_strm into separate compression (Write zcomp_cstrm)
> > and decompression (Read zcomp_dstrm) streams, and split zcomp_ops
> > context creation/destruction into create_cctx/destroy_cctx and
> > optional create_dctx/destroy_dctx callbacks.
> > 
> > This decouples Read (decompression) and Write (compression) paths so
> > they no longer contend on the same per-CPU stream mutex (Writer vs
> > Reader priority inversion).  Currently, a (low priority) Writer that
> > holds the stream mutex can be preempted by a (higher priority) Reader
> > on the same CPU, which then blocks on that mutex until the Writer gets
> > to run again and releases it, which can take a long time when there
> > are other runnable tasks on that CPU.
> >
> Given lock like mutex, priority inversion happens from Monday to Friday,
> but I wonder if you are inventing some wheels in 2026 if proxy excution
> works for you.

Reader-Writer split is a foundation for further improvements (like
singleton recompression stream and so on).
