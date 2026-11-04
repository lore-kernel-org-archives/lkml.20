Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798081;
	b=LxWvjqWK1ZnKC5B8hisoR86hSMNRjfgBGPTyrtzkDGQcYN5Ah5cWdR7B6zuFgbY5Rs0r
	 GBVswOwI4Si3GzNu0KDxgJVUwlfP6hFMT+Eve0FgByUDTAt/4aMOxg5o9nNvpVVio3cBL
	 5Wnq7CymQtuvlBPAndY060OR2kamzj+1QYNcNDleQ+/LVxsGUj8tsu97urpVMIol7070K
	 N+9Le+DMVKcNi7DDv+rlByob1NGgrLFL433Ow9ApjGn/CfHhbwFcszmIczs4X9PlVz/H8
	 7nf9qUpS/NXx6x/1yrgEKiqLGmEczqEOmJEGFWh42//OwzgaZfvQ1mFimu0uNHufCiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798081;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/p5+Pyk6coILlORdcQBpVHNHSFgdC438Pn8Lrp7EWZ4=;
	b=Iim1pznxbHn3yvq0jKgch1rpmibQflyfjkOoZ02lZrK0S/QBF1KVv1LapIPl6Mz1pj/q
	 C/yXvjSCsiArg5xwcN3fOwecSi+4Y4aSQkZKeWwtnwmHELLlSzFMr7oiQaVW5D001qAlZ
	 QLKXSwe+eKgS7c3iGjt9Ak4n3z5QgzkrMYl0J7likl9GWDfGe5vHWRrIvtNXBisAz+ko9
	 9Hx80xNTjX3if9GvCckGmdbyAKp8on4sz3L/9oIgkOANR8o8iwkIzSwqLi+CbhK5aIhhQ
	 gCkP2qWxQK3hCpi1R5uFY7C3kbGTzggqKsNn8H87y6W4VDsRWhnRvQgIihZIuSrK48A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSwVh+0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A9E606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSwVh+0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F291F00A1E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798080;
	bh=/p5+Pyk6coILlORdcQBpVHNHSFgdC438Pn8Lrp7EWZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PSwVh+0eCTT+b5fCxey1CsR0b6m5BP0NC9rEWv/qGoVAp7z7b/X1baMHbpDnRhHw0
	 1IlSHrcLAlVsg55IpOJF5Nkvf2vaGC/fHZEyKH+Don9up9zSqgKV37V5nainUewRr1
	 tAyK+1WI3fZ/i42mU5cbzo+HvC/82f7rkN3yxsVGBPX5SeP8DXJpSKARcrEvAMNSv1
	 RLgoTtiG3rPcDWuwk0+yNZkdNee1OkZ9GCZo58XY+OQNfYVWhHMw4oNuRfTNNgiFs7
	 4AkeoxFWz8uacgEWDIjPHFeVRqn52p+Yr5AhY/9vo5pidgnseQ+ftRBNMagtn2p8xU
	 Pbq1Di/rgQkDA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1619633e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBygoaKpexvIzGYtK1pRwfSP0g94GaEydQevkoqiM0Z+KEfSxo/C0T51wnhf8LblO0bDvkymA7tN34VoT54=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xITXDAqlp5SlNXe+cXNVGTLPvxxrpH4hJJIjf29MjN3eWr1Tz
	CaVmoB5B4UbqjrJ0JPCvlxoQFWH5fIKqbOsLTRXfTMTjWeYmZc0XJvpz+Q+YNxBxhSkRpoTttBO
	3nU8tLpCmu3fO8eF7uU7mG4DBEMs3tBA=
X-Received: by 2002:a05:6512:3d93:b0:5bf:ac46:c5d6 with SMTP id
 2adb3069b0e04-5bfd956d81cmr4929046e87.12.1793798079384; Wed, 04 Nov 2026
 05:14:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn> <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-6-ee6b31580808@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:14:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
X-Gm-Features: AclHuK-6MXT5O-NfPKrU9YAGzhqKyzaaZr6RTIvrirwYp92eUVqCIspXmcEerPc
Message-ID: <CAD++jL=5SypKyjwb71hT2pzTZ3s9qi62JG_EevyjTjGgTZiE8w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 06/17] dt-bindings: pinctrl: add Zhihe A210 pin controller
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:45=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>
> Add a binding for the AON, PERI1 and PERI2 pad controllers of the Zhihe
> A210. Every pad is muxed and configured on its own. Functions of the same
> kind share one name unless a pad can select more than one instance of
> them, as with the UARTs.
>
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

This LGTM, just waiting for a non-RFC version and DT bindings review.

Yours,
Linus Walleij
