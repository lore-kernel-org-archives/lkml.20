Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF8B49D5AF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765194; cv=none; b=jurvqxTacxO/k4rt8qfTwv0B5FC3AwxoZDRey0XCMVFBfQr5QFeTEMSfHqrox7GYXTxD6o7nN5avwWxDPMwKKAOexTy20zIjoc/fgN5dd7AC9TfnjuU7ordH+zXOsOp7VWSxK5yWWJ1A+ebXPWzuboRrgjCsF9qy6fjUpht2oPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765194; c=relaxed/simple;
	bh=z3BNd3t5QI0iZuIsQagNY7Y2xxs7h9n+zoA/0fsn5lI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOZjPeY2doanA0Bh6UmgXx4puX2Hb3sGcsCEcd2LXOZilyYy/Yw2bTJ8w2WARQjJnx//Yn63tCAyVE6S7c86xRvhdYfi8vIwC+D0tMckoGXJ3C0RtMDKPf+ZmXZgyGFYj9GAZ1HuFHAiMs7aHr3gstHrCbg8W0nEuiU/5OTQa4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBgP2REI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBgP2REI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB211F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790765179;
	bh=z3BNd3t5QI0iZuIsQagNY7Y2xxs7h9n+zoA/0fsn5lI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IBgP2REIcEx+w+IJM3M7B78p8wLDKNpqHBl3GWaVQWbmSSQgxcx8xWJscOl1vl3Qb
	 KFPzKiBSFaQ9I3s/Yy/jDXHsFVk77iaj7MpA0KK1CiNm5nFZggYhs4KsfWPvw3sp2I
	 uRPFhvrkSziUf3ydJujWOlTDggp/D769/ZQ0EWefwgEUk1oDn41HcsgJI53rhhQT0N
	 W5xk4jYpBjtTtIr3LvhXyi3NVxwXWvCMkjt+gaXcfLW+7ggkwZEaAoNmNxaatb126n
	 nc9OLCdYSYHRYSQ2ufeXychtAuNisu5sWRgWZopwixyjEzkszw+vy+ig6HzOot8lmH
	 JpR8Ujoo92GHA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330a7e46so1402183e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfRXVPhEIQDYMijGU4Lv7btpxGFQqlwAuCmRIbaPkQaCYVRX1uoTa0ZOjpIbC/nciJ6TtR8IS9O2L8PUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIxJ+7MUZBASCsYwRxOJJFfcQAxNLWRr9b4Hk0z4drQGQ1ZeZ7
	tdZhnR7lI8lA/V2SElMU11JJ5uc6W3AzyX+sJeiSbmx7+BGjkc5+rFJYmuWoZ+XUbD6h6mJftDA
	S2dMkaBLsNd+GVXlTaRwEPJ7FWSJXc0A=
X-Received: by 2002:ac2:5962:0:b0:5b6:1a7c:fd8a with SMTP id
 2adb3069b0e04-5ba40609bbfmr334357e87.48.1790765178551; Wed, 30 Sep 2026
 03:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-hibernate-tlb-flush-v1-1-a0143c144c19@amlogic.com>
In-Reply-To: <20260930-hibernate-tlb-flush-v1-1-a0143c144c19@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 12:46:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkB9KE_XEcHDHj576oUzXUyAN3KX2DxjENDwzSNpu1ohQ@mail.gmail.com>
X-Gm-Features: AclHuK-mQu3SqsQZujhGStlMhedJD3jinzee-CBwOj6U-mdqpZr3J1pXDQy3c2o
Message-ID: <CAD++jLkB9KE_XEcHDHj576oUzXUyAN3KX2DxjENDwzSNpu1ohQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: hibernate: flush TLB after switching to idmap
To: Chongchong Ding <chongchong.ding@amlogic.com>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 8:14=E2=80=AFAM Chongchong Ding
<chongchong.ding@amlogic.com> wrote:

> On 32-bit ARM, hibernate switches to the identity mapping to copy pages.
> The idmap keeps an early RW snapshot of kernel mappings, so
> STRICT_KERNEL_RWX text/rodata can be written during restore.
>
> cpu_switch_mm() does not drop the global TLB entries from swapper.
> copy_page() can therefore still hit the old RO translations and fail to
> restore kernel RO sections.
>
> Flush the local BTB and TLB after installing the idmap, matching
> setup_mm_for_reboot() and the cpu_suspend() resume path.
>
> Signed-off-by: Chongchong Ding <chongchong.ding@amlogic.com>

Ooops yes this does look like a real bug, albeit rarely exercised.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this into Russell's patch tracker:
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij
