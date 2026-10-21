Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792605217;
	b=bXVbUcxdnhBRnyzJFjb/u27IiOyDtZaM7/Hm4dssaB9p9L9CUWv5DX677Gd19bKlw/8v
	 UHf1PvT5civwuiQCRAlzV6q4Gg2scHIq5u4OLr1q3BBqWQGC9eSp0m5eNx6lEr9M8/J/p
	 eyFy6nAX91s1hpsVCb/3vdiMUrQiPClMJcyLbO/rgAsXF+HuQjthiW3qt75p/qLnIRlLp
	 1+LNc+z7U5Dc1lIg8eS+XVZi8czWv2zRU9LIoE4O2plcV4XYq8DIM1pERYmiZ1lAiZu5K
	 oLNvcdTylsQ/F1p9ZEyRdsS4MyrnbZIeDCahNZn2KqCUD+Mnfo9dMdwMUvGdh9d1iMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HRzIKbKLO9ua2/xR6UHeXwPGuH+fej2x2QAgvQV43mY=;
	b=V6veCD1amBpgEbcTVivZGdPZccfjttmiydRL79y5PA3rJdHwgsl7KfXvaH5wGQJreMir
	 4vF+beITexDVyJ37GBoLHVOyacykX73W3ybIx7/2t1C8Vx8zHZO14jUxf4sM8uShtt6Kd
	 mWjWbWca5kMHKFfH20e7VPoMar4SERWsVHFWaU5gL1Sb9S/zVLLpE0lk0tzDLJBHncAnx
	 bmyIksWJU3tLai1x8rITsCszrDom7LmooHo3P+i2XrmPncXAQdkb8ibFH2qdS/MtSb7rs
	 4m3dZL0mncrQkL4nmNAdNdG4oCcRcBHqbT6vZNGAgMzf74JYYIZh+dZDDJmLToURY4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bbx+Yu4t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4876A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bbx+Yu4t
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso417364a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792605216; cv=none;
        d=google.com; s=arc-20260327;
        b=qbt7JlFQUw91FTsMKI8IGqHvNyZauPfx4eL/TCpjKLEC61dEG+LxleREqy5A1o0SYz
         7fZV1DbjT1VMlpJiTuWh1d3a4MMHwwXmlvgnUHl1ZQMYuP1bvMBwVBB4qV8qKNEzl06l
         2pcq9g/34h9d826epQ6bNmQ08p9GIqpyWn9Tvccb5ezMQ9TViYREtFh/LlUd3S81dYuT
         PAmRgbeauR8qpKPhgicuoBkmOTlw4Ai2Z5SG4AR4UYY22wKx6edWPGb0I5fwgPWisnXE
         xrMCJgQHW6kmpLmrvMy7FGtIP52W5CfiZnn67ts8JsmLzrGFHYsw+SyJKo2QbfyyUhrZ
         F1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRzIKbKLO9ua2/xR6UHeXwPGuH+fej2x2QAgvQV43mY=;
        fh=DoVKVOjeaKt/3zlgwlENUKAeS48kTWAoPhhQz7QXzyM=;
        b=Xm3HYLDMkp2hF5o01egGubux+P85SZQbMkh575rdefsUvfyIcF5iJiXUdjgf4V+b9O
         gKs7A97sg2zka7ztgMUztV32m5/Wv7u41/cJ6LwkFQDpq+8anhBib2I/k7033RAQtyus
         XgwUxuhhYatpiSwX6pTNOyP/BKvTScnkPpFNoZcd9W9oKgUOPWv+/zyzxg9dspoUeA+n
         XMwtXuEolz8pPRb9t28onBvOXwemghBhu9RxjcD+qOdRo+SaYRCApadK2ducXXVAdGIF
         yPqdKwFDp2DCoc198gs+iTIWGeMbqpYjaTudcfNGKLS9AYk/eFntIyWh7nGzS5Id5G5D
         /ZNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605216; x=1793210016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRzIKbKLO9ua2/xR6UHeXwPGuH+fej2x2QAgvQV43mY=;
        b=bbx+Yu4tyXLlbw4MnlGLTvddW1yf7vyK8FTcqgruyy9PZUNHGwqV6UtNX8F5po3in9
         wLR6thuruF+xn5xbrbi4KJtXndc46ra1yeI2RRCvABOrzb1qbuj0V2eyRLPapvaEg9HW
         8/4Pw3rVD/HRGHLXrjgBoc6MXDKiqBzBCeDchiNen2q5Z2aGwfzoPtdYW9fAoa3RuMq9
         AVm3AA8ZB80Jixd7Yxbzl6uqA9QARcfd64L/0KppQEZMbjIV1LTBqwoTo79Q8o2wgurA
         HDJTKkOcWyCXcB+0jd3gnzpn/iu5m4sX+gw+rLwcnUFYB+yyh+O7uZ3wfplsV9eKat6+
         ceaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605216; x=1793210016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRzIKbKLO9ua2/xR6UHeXwPGuH+fej2x2QAgvQV43mY=;
        b=vJAsHZJBPu/YQ4mR7+UhdiFVUjrMlXF1T7WjmOX3I4Wrc5pSWed7TkUQHj3AEvHmRW
         7eE5NfVDjT1jH4YLu9dIEP1LL5dCD+Umvr6BsgyxzUVcZMJHJC81UdunOH843cazCiG2
         0clpGDNupyXJRB/3F3XcA0mgLE0GXOucLpemqGCeCy5gnYAN0+tm4Div9PlonGD8t/6d
         hmE78nXXCCmzWy/37Fh6LUAiY7Hve4axL1gLaWyHIs8y2cwsfkiND/AS4UD0b5psuYq7
         ushRuttGGj4Mm9vUTILfoWciGXzAXWBDFMAkj6PaHKkbf3Gs59dR0owm7kFZowOJ6FUR
         OytQ==
X-Forwarded-Encrypted: i=1; AKwUvByb+CTSIJyiciPZp/8KDnMdO3zUOYuMIl8b/bA8aX6RTDdrFF4LUwg1xgDjIs6GOFjOFJsNfXIDlm+7Oa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUzsrJbbdcQK/b4jhTAIqkIFFExO7AwPa7lDYEZflf1sBEQkN+
	EcQXQW6ipEaWB+B8A65cOzy2SS4AEpt53VSvm5Uuu47mvyVaxrw6ZiTN+0fkx262N4IYAcxjGDI
	oGYWmFq3cu6g9aaityDLJC4Y9ObaC51E=
X-Gm-Gg: AYBFou1fgvvGFgVJgtaM6UiQ2xUG8iqzND3NLCYfmCsVcSU5WiZoEVXxrup5PqbeWcM
	CwDeooYAdymVHRkp6FVkbtS2aU6Pk+yS8IX2Fm7bSx5ig+C0AGzZgQQIa3oPF53MxwFGLfYK1kc
	qKSVa8kC5kbk/xEIGQcmtWvdtVMbCqBPwv3mREUwJs12daySDSc0Cg5brV3DXiXbCDq+VT+qWPL
	KnGOonhSE2WqEQ2mC9hlh/e93fnd0h6aHoMxfBMCAUqXiqYNtpGU4Raln7BkW74sjLVFU6hTvFn
	wIXze9rBUn5rAz/jHwGPVC1VKFm2oy295D6VDYxWZUNQUfV2slmnxZ6hPA5iUNEOagDW4UjNFwP
	1IHBFmi/7zfegnZ5cY4iYKXdH2jsQBQdmJDwNmZetcPQlqWMQLJffWZQMEeq3DvLTnAWlurYOqh
	0wGbZCMMt8YqvTPVXzZQ0DuT17azpDGV0I7yG+SvyFEmWFMVwI9MA=
X-Received: by 2002:a05:6a20:7486:b0:3dd:85aa:4524 with SMTP id
 adf61e73a8af0-3e287dc99abmr2330743637.31.1792605216458; Wed, 21 Oct 2026
 10:53:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021152455.71524-1-leon.hwang@linux.dev> <DMAO0T9BL4YQ.2B3YU3ON26N6L@gmail.com>
In-Reply-To: <DMAO0T9BL4YQ.2B3YU3ON26N6L@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 21 Oct 2026 10:53:24 -0700
X-Gm-Features: AclHuK8_cFMGa7PixGohqfLm4WTItvsVIneWtEgSW9zyjr0DgVTz99PynKBUK2Y
Message-ID: <CAADnVQJLcDW5HyZO0GEYY0yWtERkULZxYEQs8hEzG19_WogGvw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: Pass extack to bpf_xdp_link_attach
To: Leon Hwang <leon.hwang@linux.dev>, bpf <bpf@vger.kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:43=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
>
> CI is right. This looks odd,
> but instead of CI's suggestion:
>         case BPF_PROG_TYPE_XDP: {
>                 struct netlink_ext_ack extack =3D {};
>
> do something like below:
>
> sock_map, netkit and nf links will probably need the same when you
> get to them. They can take &extack too.

We don't have time to do this back and forth.
So I dropped the series from bpf-next.
Pls repost the whole set.
