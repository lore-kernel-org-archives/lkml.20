Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924734;
	b=k46GoT3d+MhlL6l20ZOVZRLwMZX0l1Zh4yae5E9k4tqLTOb3TpLl8OVQltYbyZar6M5u
	 cwLENy2Kbih2QHYam4LSGPK3PaDSgFNwgk8vfUWh49W12RA1qCXeeBUhrKi9c60c1K6Hq
	 Idi6NfvShQ4ka+VI5a+BfIq8/ISKanKz8m/w5qYboHEw46qsKwMKC82sBDjRtiLkQkF6j
	 dJALzdiqITmFbWIvej6irK91JU5B38Z/i+iwifln33OjkfDQ9Ks9U44ZH6kKeF3rfjRn5
	 wmniuDVZhlwuCwSmx4H5SRbEAUwHCmooyYqp9oWYO9cfhznJ7iVvXniQWXVqFx/BrfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924734;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pbNZwpO0WLPO2bSO9M9Tgbqe1kctlVysNw7KKHUQxRw=;
	b=2bmcHHeEBUIULObZmbM+fvcfIJP7jtjUla5JwJ0qCGuxDi7GoEA5AlCW6JvQNd+wMI21
	 YPtGrc9dvNSkAXtwPdNubZVt96HeYbIQMHIrbfrnBdE63xlNC7MLygHH/rhEHrtMGFf+O
	 N1HUevpr+qtTJL3WRvHAxViBbybvd+/DKOlCXl3WD2DAOKP29uz6UWyLkg7M5Qvj+vyDj
	 RkiaEWzxtcTiND+rAe0bTDcBI1JLlFE3N7btcO8UPJr1Oj6c7J6KTAc5JDlb/t9HV0lip
	 bxohFAkBdOOb8BYps+Fldx03C6pQ+drpvaaB2Zz6r3P+oKwfNx174DVLeniPOh+9V6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImjEFfLZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFCE606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImjEFfLZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317781F000C9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924734;
	bh=pbNZwpO0WLPO2bSO9M9Tgbqe1kctlVysNw7KKHUQxRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ImjEFfLZ4ReySMJg6pyyhW4kKzRBBH5I3lV4fAvOH2xoPnphth9aE3oCDev/Mk/8o
	 Mdd7BwPAy/wogycRUXV5a05uRTiy++pkJUd2uN4afFORFy0rbWWiLenYwF4vYQvTvn
	 z+SkPAIuPte2ZPVGu1CZW8f3JmpxlmSpAkFej67kIE9GOAvlgNmtPiUCLbeZeSmZdP
	 +kTuRQpOi2chjAnWIxqZmO7Q+Ph89DSjbzCkd8mFZdZKneWjjx/keF2StoFnSbfHTH
	 7OPbjBQcWX7esrUoAR18yiBd9A8Xtl310V1X3xWFDaAMSKeH/q68l6x2/HWKTNdfJ7
	 bVv2YjTzcl+aw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so41369581fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:12:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjoB2eHSXq5YdSyWGqdRjbDzKxuM2i3uX6ROit90+Cl06Mmt9AiX75EAGjuTCMOCJ+CvXTYV3Uvq8jsCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oNm5yi76N5P0QQbK9t3QU4xalEQt82WcMwiJ3sm9TbQ4QT3x5
	5TiGblpJ6cSam0ubYvNJ3ITMqdtwnjDUfruL4C9m8iGcbgCjr1zW8sUpHDvP2XsEaVfyd70UMlx
	V7JUJi/A4IRy+G3rw1Oy/jlnXuff/hos=
X-Received: by 2002:a05:6512:3182:b0:5c1:5a23:ec04 with SMTP id
 2adb3069b0e04-5c1709a86d0mr5207689e87.44.1794924732930; Tue, 17 Nov 2026
 06:12:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-pinconf-widen-v1-1-469726456c84@nxp.com>
In-Reply-To: <20261109-pinconf-widen-v1-1-469726456c84@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:12:01 +0100
X-Gmail-Original-Message-ID: <CAD++jL=eaNy+JxLEbFQ52JPmTAE-_-jHmHzJzgUgUaqwtOOoGg@mail.gmail.com>
X-Gm-Features: Aa3M54oZqHQKMZF59PzOU07B0U5kws7VjBYGwpelj8tlWXe9U6F2b0839kFN2Uk
Message-ID: <CAD++jL=eaNy+JxLEbFQ52JPmTAE-_-jHmHzJzgUgUaqwtOOoGg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: widen the packed config
 argument to unsigned long
To: Peng Fan <peng.fan@linux.dev>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 1:28=E2=80=AFPM Peng Fan <peng.fan@linux.dev> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The packed pin configuration stores the parameter in the lower 8 bits and
> the argument in the remaining bits of an unsigned long. However, the
> argument was limited to 24 bits: pinconf_to_config_argument() masked it
> with 0xffffff, and pinconf_to_config_packed() took a u32 argument, so eve=
n
> on 64-bit systems the left shift in PIN_CONF_PACKED() discarded the upper
> bits. For example, the pad configuration value 0x1080000 used by a new
> i.MX SoC was packed as 0x08000000 and read back as 0x80000.
>
> Allow the argument to use the full width of unsigned long so that such
> values survive the pack/unpack round trip. Cast the argument in
> PIN_CONF_PACKED() to unsigned long to keep direct users of the macro
> consistent with pinconf_to_config_packed(), and print the full argument
> in the debugfs dumps.
>
> The packed argument only has BITS_PER_LONG - 8 bits available, so on
> 32-bit systems values above 0xffffff still cannot be represented. Reject
> such firmware properties instead of silently truncating them.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Allright patch applied for v7.5 let's smoke it out in linux-next
and see if everything survives!

Yours,
Linus Walleij
