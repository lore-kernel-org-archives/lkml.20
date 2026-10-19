Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429128;
	b=EJocG8l6xTxLmMHeLcwpsxGXlO+fn/faYb0EJayUniy4NsjxXbG67UsyjBtkbrzFQumV
	 NT4YnAHX4B/WofB1uGuSzV+IkVtRrOEUvkj3Yu3ApZzUZdjzcC4HBzTb8Nj/agWcRmg12
	 1mj36JNgM3OIJcIXEHZX7kTkgwe7i8vbGjOlUQOoiX1wdQNku07b17MrEhKSZiqwrNlj3
	 qjtT4Vwne5lCYfXsQmn+DKZ0BTG1T6aFak1ndOZfhM51BP8KbPMMM228P33+y6j6ZAEUH
	 IF7HT7Ym1nYmubkRS8QSH69kMYKUOEEKRhuRfcMR8NbM4R6+R9FoBRdwLHAWapOWtVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=KkMdWlrPdSNNduqxUUOw/TuQSGBXGO9cH3ilJ+obI3E=;
	b=2+sk2QgWxnJlFuFFsKQjD0rqu7fPIfMYVdw4tw11mRbSno7m2/7oT7Z+fZX9xvlCELJc
	 14Vp+lhxfB0k9f7UIGd58EgbzwNdiuZ8Bx82itLabaMIbYw+6mGWRAIeHeAqOm73FnNCp
	 8unCZ37A3VrTjVPTdFVHPvUGTmFzYpNTnlGnVZnP9zkUUbjxWg+F/MBiSFvslB2KHDxL9
	 WJ/i1n7cDLx2l0TkQFqhtlowHd8nrxam2RjbBQAms6kvEUuYWyMjDEZIo7oBskYxiLPGc
	 j2gwky7cqKBwNBypoVHDmeeUy5shCYNbB4gPiVVHmrOc/BWenHuqP036y1PFQvgUDIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g4MaDUX2;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E066A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g4MaDUX2
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7121165ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429127; x=1793033927; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KkMdWlrPdSNNduqxUUOw/TuQSGBXGO9cH3ilJ+obI3E=;
        b=g4MaDUX28LQh6dEGXiyEcLOoXECScCKHQHOS02TSMQ4RJBsO+uWD5pVHNxxFeeKNex
         HzWdXWT89sanXVLsc0E7jADPCeouWDQfAf/5b0Dsn+UQuUqdp7gZDMSVj+jJdM0C/5Tg
         xWQpDZdTdX9KwyEVxyVSfMaCpKglGkDw3LM2BiL3/8O7AIXVDl0CxLglNrpMcimbjBTq
         ItJyoOEFkmPQc5NkjyDXV27xdT87ngyP95XEYmjw7jZiR7yI795FbWx6l+Op6y6iee1H
         WTWFceyt0Wi8EOqk/mRTc5sTXBSE2PdlPtjJQz4sARhLqvNEduFZO01UJmpgcXcwZnYn
         XmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429127; x=1793033927;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkMdWlrPdSNNduqxUUOw/TuQSGBXGO9cH3ilJ+obI3E=;
        b=lRlrTWJI76ljuQ8YIvzHqBAmy/OGhvfQa8nP927MiX6r5/S1/dBbQoSJsYtbZ7o1sP
         2HqePKNlOoiWY56hS78L34bx8sDBw0wYgM7YgaQsHVcuPWELbqV6IRqrqB4eaU9NQO2v
         x7DbRhkmW0HJ4+qnq6Syc4CeC46LDU92UzM3IBqv1lsPBJBhMPd5TPWU3ncGgflww+Bn
         IH1HVsghIqI9m2zaukI3DQJwmmF2G2PgunuprfjJTj9gAXn6KlK59mTOv6u5ON7TMkux
         adjmdjyQvnizQdt3gTZkt+h/rH3tLI1TGpS8FOozJUYnZbBNPlSShxkQXwIb9je36Cow
         zSsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8EBbCsRRD2IbWc9HXdiu1bHlVgw+7lGCTYzL1WSARKq1Lh/Q+enpXErFkdC1oOEpbZEEu/nNAgxH+eKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYILu+n+2BP/fVDtraM7DTRuTTqkJuQJngM5KTUk2KqmU2GNzec5
	54E/cZfLAtmQYZ+O871mK3Y6qlZ45j6s0UwVJD370UtHsQus4FGsj/P5
X-Gm-Gg: AYBFou30IgBeZCxa3tu4QmJTHhCAJ8AU5po+vkpCXlCnMgp7m3W0KEznPoQKw3xFOtq
	xgR7wuadrhwSPZ128eQnEoRphzXblY4FLmHZl3CuEbIDfaZ+I1zQxcwnQoE4OiR5l8P9u+Y7v8E
	v58yeRvQ90NOQM3WH5s/zexl9lszNVW05aDE6YODHhi4ZaCGmpFNoO9EReKS9KJwC2RVHaM8ScB
	PLmLD/nVrD5d/HhH2u6U+fmJKPIwvPoft0iRfe0ETTB/XFWjj/FQgVO0Xak/a4WAdX22hfk+y2N
	LXc+m0tkVby1fYoiefZf27DieaxZNECdgrTAQCpjPWlYlWJ2gB5BQck4ccBV5XJq98TXrdePbIs
	+xSZZFGhk+7EmYV6S+J+iAvPObvP2Fb7Zzs+2ppVpkYA+oJI0CFBBRlIjhIwpq0KWoy+freD2Ie
	+cRLhTBILtmuyLAQhg4DkojMm9AQ4G2wRNmCb9/hGV/BomT56ScoSc6l3gfoDlOzj1/bUH0EsHZ
	iQO6lSln5WOIaqdHnBbH+xB04/X5fZakCmKzo8QFMbnUHiWobKlli3gRGZafQaBdPZnqIf8FBip
	Inz/XzPin7GI4wzCfyvlDJu0w9/5kt5zqwSh8ZcFv8EdGirAXp+Zqqw1QQ9P
X-Received: by 2002:a17:903:3503:b0:2dd:ad73:c989 with SMTP id d9443c01a7336-2e9a69e9d24mr66985745ad.33.1792429127112;
        Mon, 19 Oct 2026 09:58:47 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501f4a7sm3688635ad.43.2026.10.19.09.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:58:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:58:45 +0000
Message-Id: <DM8Z3GGUEUFH.2WBEEIG5RKMRL@gmail.com>
Subject: Re: [PATCH bpf-next 0/5] bpf: Expose pinned arenas as sized bpffs
 files
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andrii Nakryiko" <andrii.nakryiko@gmail.com>
Cc: "Andrea Righi" <arighi@nvidia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Josh Don" <joshdon@google.com>, "Vineeth
 Pillai" <vineethrp@google.com>, "Balbir Singh" <balbirs@nvidia.com>,
 "Shameer Kolothum" <skolothumtho@nvidia.com>, "Himadri Chhaya-Shailesh"
 <himadrics@protonmail.com>, "NchangRoy" <royfru44@gmail.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261010224902.1232178-1-arighi@nvidia.com>
 <DM6HVNSP3USV.AJSWS289Z3I9@gmail.com>
 <CAEf4BzZZRrD86ZswsB2r-swqNi7D1p52Vs=fQ9MXSgGATN31Jg@mail.gmail.com>
 <DM7JXB4PREVH.1BHG31CCNRXF1@gmail.com>
 <CAEf4BzaeXxoPqtcV6E1x8zh-Uv_C1cfNjzUYLKDWwod=k2ttLQ@mail.gmail.com>
In-Reply-To: <CAEf4BzaeXxoPqtcV6E1x8zh-Uv_C1cfNjzUYLKDWwod=k2ttLQ@mail.gmail.com>

On Mon Oct 19, 2026 at 4:19 PM UTC, Andrii Nakryiko wrote:
>
> Yeah, there are just so many cases where we have some memory that is
> special in some way (e.g., huge page-backed memory, or some IOMMU,
> e.g., that doorbell stuff, which, if I understand correctly, is done
> though writes to specially set up memory ranges), and we can't shove
> all this into BPF_MAP_CREATE interface if we want to have BPF program
> accessing that memory. So having a generic way to just bolt ARRAY on
> top of already created memory seems like a useful primitive.

I see. In such light the use case makes sense to me.

