Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042397;
	b=g2Us27YT2h5oJTVSl0+m0mXrBYTZzUwtTrdUeMnallin9wEo9J74d5qhy+8uYpJfTVIj
	 u/nSc/xLNFf25LvEv+ZOcpwauJByWwgkOF5zpbA1mROU2NLSeWUaDqyFfHy0V2xugn1cB
	 eht6H3p0ZmspHD3Eip+PYhtWbz7ah6OQzchBWGXMOCa05rM8TvGMBRIfhjqNPlX/jFOe+
	 QG31Ze3XcyioCiNY1kBFo9epkQRZDGhyRxmsjEbtRwfig/Wjg50PeqKvu/IgDjq511hWs
	 cW30Tz4gMOXMiEFQqgFKRUrA5EQQxlru78/TKwGF+BO/TnU++6On8H/uFjlche/ic4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042397;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SsbARq1XztgaSNEWXbQ8p7kVsWpg0u+gh+IWzi9nO+Y=;
	b=03BaqACuuxRgY3XWzaBKI3wv/hGDsHZ+Am2/7CveOE44PfdGqpYDbK7qj0fb2qhx+53U
	 CYP2beHiZ/aadzg8717QjIRljZrMRf/wzLNP5CNGjMCmQKu4Dpgw6ST60DIQv3DbkTamP
	 BO1CbVTpuMJ5YJN+qBFVin7znpCMOvytinYp9AjlWxixDw95P6/Z6qLpI6Es/yMlcrw5z
	 GElrwSQdTm8iP6whoqFY9INQchAzfhCuxgg/QSQlKTxWJitGPWFJ+RFNX8v1I25DpK7uI
	 O3vG11w1H6Ytb2ZbF8/fCwi1ZrNyqEFJVMp/LZUzm2Msk1gZ1m0lmR/savw1oa9wMMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UERXiL1t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F6606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UERXiL1t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59EB1F031E1
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042396;
	bh=SsbARq1XztgaSNEWXbQ8p7kVsWpg0u+gh+IWzi9nO+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UERXiL1tLnB3LcWcWTwc1HEh6YW0J5I+pS+Tk25siIJw0ImsH9mu3zcand1fsSr3S
	 OBfE6ePMvLLnECXaAIX4Xv+UCTsBKJF2bpcMmE6/xKPmh12OnXFhdOspwd9TT3nTXI
	 +cHwzvw3mHPTejXBJr1DRhcHyblmEU7j4k9IVWLS3k0ZxUPFRWtWg2l99ACvPrrO7s
	 ofwKRjLYIb7EHys5ZzEPnzLB73vfBpl19E2DNVLrD+PVQKY1/uxQQdSJOwO+XKIBE6
	 5hN+/qGjRlPieASlgmQvZtweTA20zhHZtomFoPv2FmoUkRZ3W/+kAhgWAlJl6Qt25O
	 CWMV3amID9OnQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso2850293e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJJ8l3dD8mILS89PBux5F4Pc7qQHjfKHFmhGwykCYfltRphGMgivqee2Ofxm676TG7Uw37VWS7A2RXrUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsVXzMb522dQ4eclr/1xOqDTgGMhWnbeL3ZfPk1QqNy96Kr8m6
	5rSS/ABTzdqmjhMvZe/friHGY2Ts0wt8Y2Rbei0OjMd49jWWbCxjcwR8Qo1v6ucJmVXPmj8dJ7c
	IOtve7mqYxNGI4jWqR967lcdLZi0k1N4=
X-Received: by 2002:a05:6512:31d5:b0:5bf:a12b:9ba8 with SMTP id
 2adb3069b0e04-5bfb71f6651mr2166158e87.65.1793042395358; Mon, 26 Oct 2026
 12:19:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005111157.17256-1-ovidiu.panait.rb@renesas.com> <d11e7da8-9202-4b9f-b915-155f9185770f@kernel.org>
In-Reply-To: <d11e7da8-9202-4b9f-b915-155f9185770f@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 26 Oct 2026 20:19:43 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gG_n4ZhKB_omJwCr6oTmOMRhzKvOga2C30642V+VFbiQ@mail.gmail.com>
X-Gm-Features: AclHuK9sMqetImTZUXdcLYTZLw_3JvQOFqqTMwxs-3YQwLm7ZNxrltJEjuCHbGs
Message-ID: <CAJZ5v0gG_n4ZhKB_omJwCr6oTmOMRhzKvOga2C30642V+VFbiQ@mail.gmail.com>
Subject: Re: [PATCH] PM: suspend: Do not call suspend_ops->begin()/end() for s2idle
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, rafael@kernel.org, lenb@kernel.org, 
	pavel@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:42=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
>
>
> On 10/5/26 14:11, Ovidiu Panait wrote:
> > Commit 7602c0ec0bbf ("firmware: psci: Set
> > pm_set_resume/suspend_via_firmware() for SYSTEM_SUSPEND") made
> > psci_system_suspend_begin() call pm_set_suspend_via_firmware(), so that
> > device drivers can prepare for the possible removal of the power before
> > PSCI SYSTEM_SUSPEND.
> >
> > Since then, on platforms where PSCI firmware supports SYSTEM_SUSPEND,
> > pm_suspend_via_firmware() returns true during both s2ram and s2idle.
> > This is inconsistent, since SYSTEM_SUSPEND is only invoked for s2ram.
> >
> > This was observed while investigating PCI-related suspend/resume issues
> > on Renesas platforms (RZ/G3S, RZ/V2H), and was traced to
> > platform_suspend_begin() falling back to suspend_ops->begin() (PSCI in
> > this case) when there is no s2idle_ops->begin() callback:
> >
> >    platform_suspend_begin(PM_SUSPEND_TO_IDLE)
> >      suspend_ops->begin()
> >        psci_system_suspend_begin()
> >          pm_set_suspend_via_firmware()
> >
> > platform_resume_end() falls back to suspend_ops->end() in the same way.
> >
> > Since s2idle has its own set of callbacks in s2idle_ops, make
> > platform_suspend_begin() and platform_resume_end() only invoke those fo=
r
> > s2idle, like the other platform_*() helpers do.
> >
> > Signed-off-by: Ovidiu Panait<ovidiu.panait.rb@renesas.com>
>
> Tested it on top of
> https://lore.kernel.org/all/20261007053645.1391545-1-claudiu.beznea@kerne=
l.org
>
> You can add:
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Should "Fixes:" tag be added as well?

Added and applied the patch as 7.4-rc material, thanks!
