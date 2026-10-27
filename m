Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123600;
	b=A8Jzc4VCTWaIndEaxImAFiXvGDwMaVv7rlu9ow/MKEFVlq3T+rM4d207+B6JTdxlVush
	 l2F0htjIXkICdKbnH6dIQ0wBepHR9RJ2/rw+Vl9HoN2LoS8O00hGAwn0RCnPmIX0+pDVX
	 ejXeJT98CHgdGEIfoSJ41Y4zVhBYAvsAMrnwmfhw4guapWAn3xnWcLmCc09XUpSU+nYmU
	 DcjJcyL9YwNqCoDMpw5nH/PjeuV8XA0J2rBgnhNAzCdZPG5cU9vLljjxb/CY+jttitdOO
	 R8nah7lBXk7lue5RuMnuLxeJaQoBaLdy8v+u9b3hI4zmcj0wjCEosQG1XVunypkRiPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
	b=4AzULw92PHUx7dHCRsI2o1DvFeaogz2YMZueopzNQ0PCQR/o/ecWfrLEk+6qaBJ0RJEk
	 8y0MRnFCbyQ9O31ior3Uej3IFkv9ARnaH727vXiYs/GwUNTWjuVhjdHMT0IWNOlF+Cxi6
	 1YsrQaA2RXKXufuz66dv3Bq4dP6AlMgDPxTHFMwGC0nmPcp2YEcFFxtkcpTmYZ2h7HYa1
	 gaenApW0oFmbVjtQpdeC9GHpvf2Uh2GEQMUwjQkF6HWvo1Lo6RJ2bIR093QpS8cPxdp5Q
	 tivX/Q5PrC1SuChy8VyxgYU0+wD+2xXTpf+vYKE6YY1Jx/qlEkVM4LWJq3Hul7ItUyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=inJR6ox6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5D606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A5D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=inJR6ox6
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso13487866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123598; cv=none;
        d=google.com; s=arc-20260327;
        b=a9oDowei3J0KPFU3Tf9WQ26J4VOd121JlA55eRDqImE+KSGf1eVH+55MoznYKzn1N3
         jhZBgCtKhzoliMrHYDl2xP42zGZEZDyfNRQkWdBRx/X8Xgq1cPSghl8WNyc8XLcGiemW
         nUNxL4BCWYnKADXbGdPh02JbAo4l/sMZsL25GzTWXVBr935r4fySOZ6T6K2Sh634MFkW
         USHHcZkzaD8JAld8O/pFYak33KpOFrZvTLNNqf/OU03bzQxBLzMUvzDpf9Ye3jvkIZQI
         6m9R22OXCMgY1d2EJHCCdccbcMt7ChnwUjefITy1Md5o3NhUDHpZQ/EeXYwUdATi1c0s
         O5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
        fh=X1rQMVwtlwQiOAAr7NkgRumm/QAqY04l7MtDhYHuubA=;
        b=aqfEFZ0gPz4mThf3x2xIOZ1/GlG/XDvHXlYYgfbevn2a6UrI4+AVigR5/ltMzTDUYv
         49E94qKKk2Jifl1p+R5PCrPd456oK+cChBGyOpLKd259uOpeoeHj581fFzEoE3Dntc/V
         0YajqGSCkhTdaSuh0dp7APljAOxbyECk1UWD4urwMbAuwk7uOJuUraP9fOyLL/6Of5eL
         7BSwv4PdbpYrZ4fS3qVBlnOsMDCj+GmDrWnYjcL5PfgUyx+4UcJ9bhHVIlzT2Qm2i/wZ
         qyR5PSqsa15bM7hLBSpUBd7CGqR1uxxqV13m0sWawRu/yda/HUOKhU1KgzU1KWpCmqAK
         rkHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793123598; x=1793728398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
        b=inJR6ox6aQPgzkJ0wZYiPBugaLW1/kUDoRUxznaXNPrxE2Wn3DkQl3afONPaEwO9sl
         vnrt6FP9OFfRf9KWlwZNng3ZlaCrfp3bQxPXGc+Gx+AORrKLJ8WZpN9m6kJEM6IAqHPq
         Jk4iMXPxJgkZqxRsoYIxQcD6CPbdcJbwTT1mEJs9Oh6VfooqjmJi5DvsYqRTbZ70S79m
         W2gdT7rvplj4k08tnzQQgxgOTLo5uqZ4a0mScYBLYVaYMXTVeZPwvd3azNIWeu6/sXO8
         zyeS5P1gD5N0vXZJTHB1IRGypOyTZEZWjLyDPXDDqsHxY4MhwV784zCuBQDBJ99Srvxy
         lKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123598; x=1793728398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZ7BfEA5+mgPjgQ08MRW3gJSoX82BS/9Z3gx++ZKTBg=;
        b=UQUnu8ALmKKVQI6IgQ6qV55PFjM2ZUlFzZ2ShCLAgwN5FpIIJGNwHPEwWfN8ZPHDap
         FRZulWVDu9WWdjHpD0obdf69km1ZtiJLkFWOATNOtyfLGJe6OxdrBRX1tO0CnyiVZhe/
         GHffz2F0wxT2Z+zcgojbENx4OuElCoILAo9vXz3aqmHOzl2pHA6YExd2C3n2ixqrl1Z2
         NvaHBJ2KhxsAf8sdO8VJ7HDxJubZXK1kXIuaP/qShBl7Jf5nO2VfkgaaSOOWiL+rkNEb
         2o6fFyvLWBkYl6hHJOjbPkp6ua/GnkFm7dtRMZlrdBV2gzoTV/vbkKof/rH42dmr5DqX
         VYGw==
X-Forwarded-Encrypted: i=1; AKwUvBzCrZpC1NhEVxXBSOUSHk7PzjtZerpngGhGzgEGOSUmuT0RTuyTYJWgFRnVnAtRQ13gMInr+PzgIBMeZ9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKRoy0Jjo/K4LIKL0dGLvEKoRDaJuAMH1ic+aRHXBRCARCudXJ
	MCc6oTG+s0la8KvwbVqoxcmH4V6qNvNbD7ts8Pie6Fo2XG+r9mKvhbQTdNwfIDwej1VcYdrR0Y1
	c3c2hmc5uouiCWEWnKUfIVJT6g7LuDIBL9XYhhhSY
X-Gm-Gg: AYBFou0AJeAVTyWXAy6tWmsCGGyOJrgi9JYjRd5EDiCD1WuvLgmNOe3luaQBu6nrbnx
	yhYsRdtM0b7mpayrdHUMUolNO/6OZvL6BeiNQBQpQx1nAaEQwseYL9LqzEtijRflWX6Jl/yO4cL
	WAyTO3FshWtrSZZu7KTI6fVIWU/IMAOwo/c8KCK+kd4R9OPhjqo36snQl5Fdgm4Qa6rl8LaqVF4
	jGld5GSl2o5lfHN7hy0ptg+dqf5XXG4OeNOyAWXmF3pAYy5KY5pTbJsvFxFgc2yJ7iFV9oFLI8P
	WO87FCSSQZty61kft56mGBxYmAbi5YLU6MtsCCWtrE/pcIror3EVrWQBbdSsPvnLE72pYAT0nN2
	zs+F7wXGxmNs05HqmnT8jDEITZIi3yAeqF2gynz/EqewfUN/l16ylXDgbAJ7UA2sqhiu6c9bWxy
	RdnKQwIQ3QqCZcL/ySn8xtqU8jJPX98VyyTb9Z+c95rCdlYfJvt3GNCGul7jYjM9dmbemiO4h5y
	eozS32mskOGkA==
X-Received: by 2002:a17:906:dc8e:b0:c31:e958:408c with SMTP id
 a640c23a62f3a-c46bde8b464mr1159692166b.38.1793123597614; Tue, 27 Oct 2026
 10:53:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-1-jthoughton@google.com>
 <20261026215226.3713941-2-jthoughton@google.com> <1ee97e9e-3658-41a7-a879-348f51ab547d@kernel.dk>
In-Reply-To: <1ee97e9e-3658-41a7-a879-348f51ab547d@kernel.dk>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 10:52:40 -0700
X-Gm-Features: AclHuK_7gnb7g4GjAy_SA5zcAxXhabVZixR-oCAtO-qS-tkfEqOEG_LlV9pvyY0
Message-ID: <CADrL8HVgOYb1hzWDJzm4sCrEAR7PL1xBv-1zTGebTusPoDsGXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] scsi: bsg: Don't copy sense data to user memory
 when canceled
To: Jens Axboe <axboe@kernel.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 7:41=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> Reviewed-by: Jens Axboe <axboe@kernel.dk>

Thanks, Jens!
