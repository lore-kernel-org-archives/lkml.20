Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456552;
	b=Xg3VAx6zaR4PZJRjoP/Q4jd4olwlivCYXuKl31Fzq9qmjRA/bTl0JS73OngICF0lfUwQ
	 kBcVjs60gF9VIwELjNH2+y57JXnFQlvox3pLty3b4UrnC+Vb25QKmTuLoZOJpQpShTMes
	 FDE8+NjTZLMWyOXa979z0xnGQyJI3M2n+okXyPPtdz4+NlKpoL2rLOz8Ki0bOpv8bQjqk
	 E/vVH98QWiE0HaiEif+ZArgsZmCBXQ7RhTCrocfSoMMDTgwhjdg4gtqWG8gH3yFg3woj/
	 ightvQZB7AoBm6Wkw/LC1CXkCa+5FbSmqubetGfX0UuPORNQzXYg19vCY8nWSJowGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=oayzeq/ffRRZK2XsT9LR9PLQ/VgPUckLtfFvkcIvl5I=;
	b=V62XTbmDgmkIv5QCJNAoc5+WQ/aSn5PbsXj5S1xyKV+H5gV8ifXo+xNEUeZv5TtWnWMl
	 oLzKZgUXk8Bn3O/W/KFfQ++B8fvbDZMKmSM/cXU/H2i6LAXWC+ww039JTbc+A2K6WEakn
	 cj/99V303r68thvWvANft2X3vVeyudaChAr/v693MSQa/M5OvLPm4Q01YKqEg9ECL921s
	 wdAYklYZrqciSOBoAyj3uKXGvDsvwGK2jFlqoUy3tmNsgS4KA/gHWPMPKWHm8Bxa7YHVi
	 8WdNkaSIOjTmzByxEaC8y6ScjX1G/vVDGAXWG42t+7w4ogWWZg8ACZtArlcUPu+KLvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eAEVRu2V;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2350C606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2350C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eAEVRu2V
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so1490010a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456551; x=1793061351; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oayzeq/ffRRZK2XsT9LR9PLQ/VgPUckLtfFvkcIvl5I=;
        b=eAEVRu2V4UqcP56T4HZZ1IlytaLi5bONS8LprSycjgJbf6TD/KsczqfSf33xwoFgiP
         cO2CNmUYrXJl1hyP73PYfr4VL3zcDyPMQuXqD8A3/m3qg17pDBC+FwZMchuT1GEVYkqk
         Pno/b/ifwhs88auTwgvA4hVBT9I0+QanT3SIWcEM8qinBfPLg2YMUKPorVsKw8OIvSRR
         pfUJN9UZ+YcsaxATxIwIOPMNsc+q0p+0SwvkszAbxKE6vg+XgyxyV/UcvARA+I7QZjXb
         f8O8GAbTEe7rNqCQj2mcN0+QhyQ35IqE1ZGA/SqzpRwP/EUm3ht4nFbFBTSEGZzual/A
         LOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456551; x=1793061351;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oayzeq/ffRRZK2XsT9LR9PLQ/VgPUckLtfFvkcIvl5I=;
        b=LMPtnLoextNsqQcZcnuC3w1RJBCIY8sMmgqyOVWjGzcbVBdEFNXhPgu3AulzFe6y5c
         wk7IjYk7QNQ6WtcS7MK0lMWoHbyYBvkzXwpIrtabGbvzzQ26/p14uC+t3JowM/tUEdZY
         u85sBlH2Xx7A4rj4W5Y0yK+g400UDE/iejFspehMEBD7UZ9lEufgn3UMiThyxi1qv7tl
         ODfoTyD8V7/Y+nebNodzqenfe2r8YDhzZGE8rL//U4sLZz8+Tt7UZS3XQ0/W/eVzcdom
         6/TCNL8mw5AULQl7PhOA5TbFhWEbZbrQxnYY3VYou2xBcOY4mH3cCfoTtKjVBROYGWG8
         RkKg==
X-Forwarded-Encrypted: i=1; AKwUvBwrxwoQ1HZwiB5HwtMf2qctBGQ/gVhJSKljI7yMFj8OjFKOAxvlfF2ts3Ff7lO1kA44Qgng4ElRGtPIMIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkkZMpT9IKUA0svtL/i///U8gbXSxZTu8vKTOD2YAZ4Z7zVvlm
	N7KeGL8ECF+BukMG38JcN6mJhYRG1MyCyLeCFFtFXZpHdjFlam35nLOY
X-Gm-Gg: AYBFou1IbgnJj3GiiYlRAQIBPbcjMMgqXH7oQUiHx4afo09kj++7C/AcRwSb/WX3ckb
	qgRpd+Q4RVqNCV6/HPvcU36qYZ3HsCAPBeTJlCCWZyOiwIvSNbTIJ8fy4T7IRqBUSRDSDvI5XKl
	f4ssGmmudUKBDyzDYZRZmakkMwSzAX542q/rdt3Rqga7zSBGvUhFBOQlL4j5HOd4NWRHNZZHQyH
	LCj41guBuXvKaWDa8GOv7f1C7mc3pBQIr7fW5kQJbKpPQeaRp5sLKWtmVE7cWwACyFhz5tJk9Sy
	mOc76Q/sujRqSHM1i+mkeP9hdYcJq66UKQgTtKOtvFOdrfzqTYhTCZLuK+CYyENyWJiQt2c3HHk
	D6lg/OGS+U1cfAjAxlkwYAyyD60dFzKCGI85x51Rab7paIi6C7OcGE2w6DGmnnyJ9XAHFr8Sntx
	bN8oSINd37O8Pb9dyjqrOKNAJmvvjSu306teY0V6Nmt46p195OoEB/FFactsZQnEgPyPvD9wDqn
	lB/AF18iH37Oips90JcXDZvU2h0XlqBPNfZOKvIRxyGweynTgnpzyE6tyitdgd2Um9ptIyN+GO0
	uG4=
X-Received: by 2002:a17:90b:35cb:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3acef3d9570mr8518570a91.34.1792456551322;
        Mon, 19 Oct 2026 17:35:51 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d56eddbsm1552366a91.9.2026.10.19.17.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 17:35:50 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 00:35:50 +0000
Message-Id: <DM98TFI010XS.5UZ5IEJBS2RQ@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?q?Adri=C3=A1n_Garc=C3=ADa_Casado?=
 <adriangarciacasado42@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Add __printf attribute to
 bpf_diag_source()
In-Reply-To: <20261019195916.186225-1-adriangarciacasado42@gmail.com>
References: <20261019195916.186225-1-adriangarciacasado42@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 19, 2026 at 12:59 PM Adrián García Casado <adriangarciacasado42@gmail.com> wrote:
> @@ -794,6 +794,7 @@ static void diag_print_insn_context(struct bpf_verifier_env *env, u32 insn_idx,
>  	}
>  }
>
> +__printf(4, 5)
>  static void bpf_diag_source(struct bpf_verifier_env *env, u32 insn_idx, const char *label,
>  			    const char *fmt, ...)

1. This doesn't apply to bpf-next. 
2. The warning was fixed a month ago:
commit 7f2b0b57a8d7 ("bpf: Add printf attributes").

pw-bot: cr
