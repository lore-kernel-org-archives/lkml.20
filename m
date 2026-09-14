Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386173AB26D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374761; cv=none; b=LBPrnZkOWgS3B8ESHVHR3jXqifeqHX9AvRkFgUKWKdHbye6iln7PMzFFzeNuZxpN7rq2Mf8KIr++7wOVc0Jpx+fJkYucF3f7wxqDv9bevuaUEc11rWsqQFQCzE7Vo1W+1jTqIDxBoiMk2FQYV7w5Mi4jIQMd5G1MLzY71iltXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374761; c=relaxed/simple;
	bh=qXsN6ASTioxpMOZwh3003sB5uFTydTMnSnfRabI5eIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTVdV/O2XRSDJ9wUJQ7GfNENjnfkubT3Xn2tNP5X2FTN4mlWSZe6ootTaDooIV36xQP449+1Uj1cX/MX8RpcQJTm4Sw3BvWOZPtsjuDvIZWfYaJgjFM778814FkLRwdNgIluemurM5NcRJ1wJDP2rZc8MCOdD9Bsm6yRkG3f7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjsxIW8G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjsxIW8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FCD1F0089A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374758;
	bh=qXsN6ASTioxpMOZwh3003sB5uFTydTMnSnfRabI5eIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KjsxIW8GTNnyJD6Jtbz0bi8HZXCAMA3Wy8l1GFFg91hSNAUgZ9Bu7emAa7Xuid/po
	 AMcj8qxHYPUz3LnYorjVsqFwzbL5zOXrS78PJJuEXCqO0fdNr6GLX0+LhvZDHx5+d4
	 rs6DS8KnJgoMyziu0d8XLrY27PP4CsUgxlKsccEASATupdy8nF4Hhfe4WpJgYeEvQC
	 ajZYh4oA7tLgUGba2bmnyRVF50l3TCjYbGPnPqkHDF3dU7Bwj1XvbvIdWn0M90ubQM
	 A2FxGL4PKwoREVmlrSfJ58VnQRhx9Mih52TP63f3jSAyUDF56yMGDWS8E7NFFjrDQq
	 9Y5NhcwKj/CMA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so1409252e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjCMeZeCQjX7pg1mdHbq/PMpf3QYuI8iHfY2CmPjstcWPzl1AyVLH3BJtY4SClnA3+gVPYW0lNR7Fc+fM=@vger.kernel.org
X-Gm-Message-State: AFuF++mUSvp02ycf0Qr/IG878wZyXu+j+t6gBqwGlWEbD1XBMnXlkdYg
	xA/bTVefhTF6niGecbHiXOE+0LtC4Q1PYMr4O0u/VcowTtfXQ77aaD1LiMjzCW8gYtyomURJ8A3
	U2MxNhtQ70Zq9RZykiRaMvkSuhjiL0P0=
X-Received: by 2002:a05:6512:1594:b0:5b6:183c:5c9c with SMTP id
 2adb3069b0e04-5b8ae69fa48mr341028e87.58.1789374757643; Mon, 14 Sep 2026
 01:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825030428.1685182-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260825030428.1685182-1-gonglinkai@kylinos.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:32:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ehn-6KQhsr20_ZHUAoK-VMJRdCj0r3+BNDdWcMvrV4g@mail.gmail.com>
X-Gm-Features: AcwNN1VZWvbdY_RjRUs6KUzckceiwGii86ZoGg2mdr4PY9dss79U6PSTzN-HcxE
Message-ID: <CAD++jL=ehn-6KQhsr20_ZHUAoK-VMJRdCj0r3+BNDdWcMvrV4g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: add timeout to irq-enable readback
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Daniel Kurtz <djkurtz@chromium.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 5:04=E2=80=AFAM Linkai Gong <gonglinkai@kylinos.cn>=
 wrote:

> amd_gpio_irq_set_type() polls INTERRUPT_ENABLE with IRQs off
> and no timeout. Use readl_poll_timeout_atomic() and return
> -ETIMEDOUT.
>
> Fixes: b85bfa246efd ("pinctrl/amd: poll InterruptEnable bits in amd_gpio_=
irq_set_type")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>

Looks sane, patch applied.

Yours,
Linus Walleij
