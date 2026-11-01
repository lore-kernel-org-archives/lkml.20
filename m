Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793495332;
	b=YzaaT+7BmlfHCTR0w1hscH4XrN57mQbfMKXhddpwzjfYn2tUZVoF3to56YJrQsoPQxbp
	 YQnKNF4QBL1PggSh3siBL6Gx/yKdd3HQHNViUDLi4nxZ554BumHI5bJHgg+wfbBBcwbtw
	 VfqYq7TITdPeMPDCBmGkK6xCA08vUw4GeYBk7vkVN+p0cm3iEQlrUiDzOglEmoUDIpLZ9
	 SF+yn6aOktNgNHqoBiFPxhmdnM+YhfYl4USYM1kfcZsJZNBlUPj5q3P2d2z+k8Ft+zja2
	 6nBvpJk9/IU6S5mH0ZTSP4NXuo3yepTFIUczsJKQvgwYIA5KMI3GXAAMD2P4j33XUSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793495332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=uv9lU22wY5Li5XWaCJ5Mf/m4BXD9e1KZu/Goj17mV78=;
	b=YBL1bASMchWFqYIbotiYPI8KAaaBkvIDmKrEAScHZgQuHyE//xaTIMVRQxTBwK1OocUm
	 QELv/tqN3uwahfVxIPjDSo1OdjZghz+LTL/qTkmRiCP3FBT9a4ZQgt0FBEc6lC1j9NKah
	 CqZxlanIDaDgKfwR61pPrj5ZBiIWShqwf87vGyUOl1mUQJk28vGN/Wo9UUI6+ocDMRtNy
	 t3DpZzMfu90MCq+LN8A7e7hrICz/pLHpyTK8qtpo1ioMchnOMA/fOz+1NIwM7WQQ0vagv
	 x+Byt/OSzAHCDPrzah6tbceKXcc1EWrUHwA0WYehzJRkcLdQL05q76U2L71WHs/0h5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aSy124s6;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFAF606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFAF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aSy124s6
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso774978a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793495332; x=1794100132; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uv9lU22wY5Li5XWaCJ5Mf/m4BXD9e1KZu/Goj17mV78=;
        b=aSy124s6ewkwhPx5n4VnBBEYmGR2oVcg+ff/bSdlZVi3O4jIuNhZTE1+OUK3mUs/Mm
         tKYmabGfoY+kOkSUsLhGPTWiHGaB+YNtInEZzMQXFkdvynVe+E/C/SvLq/RkajE3ciun
         OUIDrIZVpj5eHH3swWbEI5+3ZxatucCevLvFsfC0j08/JzveIZmWJMWvMHdiC9mq/gdQ
         3KTC21ZcgX4gJwHQPrSergjyipfMzc9R5ZcwbAzbk5b0Z/KK7EcUaGGRuVpGNHxEjwGI
         xEYZw0y/Fuc4zj45ZOp8rpGFhwrSTz5GI8bQIT5bOD86b9mCzPz8M9xoKzXjnTmOw+Sl
         j1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793495332; x=1794100132;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uv9lU22wY5Li5XWaCJ5Mf/m4BXD9e1KZu/Goj17mV78=;
        b=03p8H2Tis7ricGY5n0fk1sHQhHeisMSrXx6tQSQmorqLDs5SzMnMuWLzC9I3XvQE0f
         YNx0+US1aiaNWZcUM1k7lihA5hD8PxxaGJpIxxJVyH6rz2KlbbqNCyxTNJ0GwYSFFJJN
         bdqr/OzbDVciVKTxXD7J4+kI/X8lrcms0vbMkRJOxc2WE+3RG0xlw4XiLwVL0vG5oMTR
         yymxCxvkvkP2Zj0cdpRyGW85cqmA71QA8Gr4vNIyWcA1s4my3vtsdAPKd5dbVVcaii01
         Fz6Uouy93uGGLAYkxd3capZAGbJcz7/BpY9fH0WC8598yyx/nrKD3OZtBNZaW+cHamB4
         qtbw==
X-Forwarded-Encrypted: i=1; AKwUvBxJqhXljegoV9BmH4ElXtP/YJ4kdXgoBKj3Tir2qkUWm5LdtJ9u9lGTKEOyzwzWOK5MTiJwINb8z1AO8MQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Bk+Agm3lM8iEkksdCKysaDi96IC+Ji2jgl2okN3Ghn6qd6mj
	tlo6aEjC+2XCji3VtN1i4Ksp3J/driJizEf8ugz8pZnvpPnTBusYeqZZ
X-Gm-Gg: AYBFou117sU9lQDm7YBxpkQFEdmYeg9VYgMFpYGzaZoGOe4asyrOxSscRwbvYkfK9O9
	6LkEWyLe3Ky29CmfgZFYYAGzrjNK7B4ryY6qqf4qpbOspFBWleAv9B2EYMDqLCgzojcCTDES1oZ
	L3Jrd1a5NH/j85JwGtDsC+oaM/wY6hyrHhCQks5xQRcElmsJKcPyQdIf+FN/DnS6m+fizRWzlJj
	L7FkUV9SjhaGX/XnQM2lTf65pjXgKOzQVlj1b/6MaOgG1G2mct5gjm9oY7wTSyOVpz2YYJ4RqHr
	h6iprDcnSSmb5JuogxNZ07vKkhGLuMXzUVweT2tT2ffdKX5/MTuhfd3j9356pFYaezL9OcjOr8E
	jEoFP7sY+ei1gjY4/ax4W1lcJPwPoOAr5ufgzKuUgZ4zvKlsOBBxoeIGp0usjR/ENyvyuOn0y+v
	DRY8MIHFUIqvQQpy377oh+u8rMBd8obzP23taSLb++mHsOHzugz9ICuLhHCo5F+3XX2VxGvzvQz
	n7xCXtaQMKMVZ88XoCcsCjxCgyZOqs8EZvWMAlA2n1d3hCxyZIQxKIPHibzamr28THxdBk8Fj/2
	oLrqe/XQ096qoZkSkQ49gbLKP+fvZna8Uk0kpcCkEwhzAhhgJmds/GUyg3AhurdgO2dFam9oPpx
	x9Hht7He4/GoB0FOtvQNQihYUskJShyNbrA==
X-Received: by 2002:a17:90b:3b51:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3ae897c7d22mr5481949a91.19.1793495331839;
        Sat, 31 Oct 2026 18:08:51 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fba61sm13130591a91.6.2026.10.31.18.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 18:08:51 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 01:08:50 +0000
Message-Id: <DMJH18O0LW66.2X5ZLK1R332QH@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Henry Martin" <bsdhenrymartin@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] bpf: fix out-of-bounds frame access for async
 callback stack args
In-Reply-To: <20261027154553.1043567-1-bsdhenrymartin@gmail.com>
References: <20261027154553.1043567-1-bsdhenrymartin@gmail.com>
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

On Tue, Oct 27, 2026 at 08:45 AM Henry Martin <bsdhenrymartin@gmail.com> wrote:
> Kernel helpers pass at most five callback arguments, all in
> registers, so an incoming stack argument load can never be valid in
> a callback frame.  Reject such loads when the current frame has no
> caller (curframe == 0) or is a callback frame (state->in_callback_fn).

It's fixed already.
commit 90aedf8854c0 ("bpf: Validate stack arg reads against caller state")

pw-bot: cr
