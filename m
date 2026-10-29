Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278837;
	b=RPeIEwcMNzcHPtC9LXdkjfvUoOF+lnASuAd9LURCzPFn8+tlcSDRp+DssrfKgBtdk/cJ
	 y6YaQUQLQI/fgvTo2lvsjrTdL9ZaTjud9IAplmv1jz7My/Kx0T5YuTE+V48OPsuHNZu7V
	 RINqGjW88m1Lk5UUUCW2s8eru68Q5IJcTLbgG1xEz47u5tDcXXNSym0sV+HuuURlrJoGz
	 hcCcQuTJd7tILuuit1K1a270T/QKfghrlWnU6FaOr2qRxycYWmhMVIxXQSkX5lNu/IY2S
	 YDXoFtLOE+cjgqwVjzhWd3hf8cb7DnsVdZ57Tk9U2j38AHAxtkg+aFTv3QcrnufaRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278837;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XwD3tkQ64aRCla1mgFI5NO1jCorsIdlneIFywgKjYxI=;
	b=nDw5LevCI7F+VYqDyJgfMVm+JTXJHIw1iBuDYkIWZxAsEW/4G2R26ryWyJqW6ykrev2D
	 Y/MyqKJDVUY8Vt7pATYUQyyVHQAdnoyPkfeAtGyRwWfkgNft1V/alaM3VAVI7ir8yGYtB
	 CXTvsM/4QQMejKtaxje2nv+KRAB4y0bp3b8M2opWbKcQNfdliReRUbPtKbFzyLwBCjXXq
	 vQHlOD5ubpH3+TzjrRhbryU8moozEBCUbBdKxMvcweeXbZS61TWXCs9JH1COep93hDwTQ
	 yaSogauPsqWJ6xz9JbKjkYgLDo6Ts4n+kAMBCLomI9zagmflSlzmihXRD5uHAvzyTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m/CeT8Be";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8452D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m/CeT8Be
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0952C1F031E5
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793278836;
	bh=XwD3tkQ64aRCla1mgFI5NO1jCorsIdlneIFywgKjYxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m/CeT8BextZ+AOu0A4DyEnCBIXB2uclRB8PLGsguu6ixuUnsS0MbiREFuPrWUH5wD
	 Fvb8fCpAHq/5KFuKMcmimhbwUcqB+JGOriRLmUgzd4I8ewdC6YN3qGBcebd0/1QOap
	 bGKiRxYbkCq0aCVnIPRxI+SBRRJkNticYiFKx8ymy5oeD59cQjR14mW30Z8OXgDgTW
	 2J9OHrfCM8O6gS62mTwoHMU92ZIZBwgN9Z6Ux1MaolFkr6EKlEFFCLQssiaobW/0kg
	 yAfwZyOHY9YQ6zTZ4kyLHNBkiP+7ontIyL7mARcnrFVdKI7wUs0sFM9KDYl253mnsC
	 vRldpRLjz/qiw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso273357e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:00:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2EFf05oX5Gbp4r3guJOJ/pblFhSMeORBGmyixsTwxSzXm9izE+TJp4OH3rQ/PAEC2CWzrXkBNLGhRteU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsdm5QJwSZ1bMZg71Xs66D06cfzoVc/PwmebXwIzZqQldSmXur
	Sh705oy+J7XdUkiznhMHVw5q9MUQo28SQWvU/aYBV4xC733Gsn4uqzHaEfI1JgjLbvyIRH5pv1+
	XD3g4Iovs6c8l54S2PffpnbzeqmZyYOQ=
X-Received: by 2002:a05:6512:2159:b0:5bf:d29e:f7eb with SMTP id
 2adb3069b0e04-5bfd29efb06mr357760e87.14.1793278834801; Thu, 29 Oct 2026
 06:00:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com> <20261017052534.115203-7-changhuang.liang@starfivetech.com>
In-Reply-To: <20261017052534.115203-7-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 14:00:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmtOcNMZsXWgH5Q1fHk1A3vAZx3OnX3=RDvOjKpcefCcA@mail.gmail.com>
X-Gm-Features: AclHuK-ur4YmhzooEcJhKo5CJnhDEqWcuLqSNOXf9L0w0FIc9PDWosppkFp5N90
Message-ID: <CAD++jLmtOcNMZsXWgH5Q1fHk1A3vAZx3OnX3=RDvOjKpcefCcA@mail.gmail.com>
Subject: Re: [PATCH v1 6/8] pinctrl: starfive: Add StarFive JHB100 emmc
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 7:26=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Add pinctrl driver for StarFive JHB100 SoC eMMC(emmc) pinctrl
> controller.
>
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Overall LGTM
Will you resend the patch series after v7.4-rc1?

Yours,
Linus Walleij
