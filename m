Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3B44EB845
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774282; cv=none; b=C3yYO1QoN1T+vzvOoQWJNb+NJGRRsipxlZizNY1xBLO5HBelE+Hx0JMbceVNhaIcl+rAHWSLAJL/Cc2rqMk3Aj5MHwNB9FAYNg5KbVJzA0zXKSukDwU6oXTAwennULuPIMBiiJAuRCpoxfpsk6XjHCT2LYmDvZiTLIk10t/Zxno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774282; c=relaxed/simple;
	bh=RPlStI4T6DBmtlwLNFGXO1a9HGvDVlORY2C4NARYEdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+FZfdqPE4Pf5sgNY+/qVKJxfA103fwnMClr4ono/feEXh46m7VQwYob+8Jnzo6/SShVi/NHPjzJ3MIGtpjhJ4JszYRicWE6Hr5K9ToYGwcbZmgn/sx+HShb8VPzm+ziWrrYQUT79BOkqqOTisGW3A9seTcONjHCKb7y13U82cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAoB5O7n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAoB5O7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75451F00899
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774270;
	bh=FxyrFbIDAO99GJasIdJ7Sp1XctD4pjs7yD0DQzyO4ww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kAoB5O7nXqmxVfQLJGhjc4lDZ04JdoSTf66AgAfZL1KcaapNHLN/jb3VSmvbizHuB
	 /oHRmgxqmXPvTyYXCaWdnX916W2avpGaczyB5B1zRS3aO4DNg21OI9bN7SosdiaRpP
	 MKlF/GXdEVHwv/WhCFV2im6nfjkoGK0FMUeQYuEF2viq/b+3clwpXlq/DyCgVsjSv9
	 h+9zW2tzB3k8wj1FJGTVO7jkxWzPcqOT8Wzn5JYuLH7PimlaDL0+aR28KVX+RK76vx
	 o8iz15HS+hOD+4GkJZzhIU/yrRCXnoKCvRefxGP6HoD2V7rt/VaFDIU6j/m7ZqybYO
	 Eu6PF1hKtnOVg==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d821901872so1798248eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:17:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTN87thc3N/3cwEk5mjDJSmjSm4nLrgqmT9pBEL1cB+Lb5jonq+Aero72lFKCQzMdjZfd+HlGjg/I6zns=@vger.kernel.org
X-Gm-Message-State: AFuF++m9SbUk2CAg2AFRW6CUJg+rbr8TMkEmlxNbH2Ihui7b9lMre4by
	eFx8I0xdMHIAC9ZWpqmMrX3/9ZIvSOvqVfK+57dhdnXkCsuSSEpNUN5vQPTYDiQ7gp3vTeFLIOQ
	KDNntAqnnBVjJCqsUAqQy9VHrN90wXmM=
X-Received: by 2002:a05:6820:4c11:b0:6d3:abd1:9b97 with SMTP id
 006d021491bc7-6dcf6525a6emr1100268eaf.61.1790774270280; Wed, 30 Sep 2026
 06:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917135056.2153959-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917135056.2153959-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:17:33 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6bofu+5U8FG-PPqdjL_VYYh5oNRJtY-ZT3Zp8B282Eg@mail.gmail.com>
X-Gm-Features: AclHuK-roK4N3HZhE9WekVRJ8H5Cio2_Fu_cQePi4YQjQ0SNOogyINHDJvz-3Yg
Message-ID: <CAD++jL=6bofu+5U8FG-PPqdjL_VYYh5oNRJtY-ZT3Zp8B282Eg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Fix clock reference leak in stm32_pctl_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alexandre.torgue@foss.st.com, antonio.borneo@foss.st.com, 
	jiashengjiangcool@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, 
	zmw12306@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:50=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> stm32_pctl_probe() obtains one clock per bank with
> of_clk_get_by_name(), but none of the error paths drop those
> references: the loop returns directly when a later clock lookup fails,
> and both the clk_bulk_prepare_enable() failure and the err_register
> path return without calling clk_bulk_put().  clk_bulk_disable_unprepare()
> only disables the clocks, it does not release them.
>
> Release the references on these paths; the success path keeps them as
> the driver needs them for suspend/resume.
>
> Fixes: 451bc9aea9a1 ("pinctrl: stm32: Add check for clk_enable()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Patch applied w/o stale tag.

Yours,
Linus Walleij
