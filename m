Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB7353EC0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769971; cv=none; b=ZPz5jpbHpufscknV7eYHXq1C4xL3/YV5WmJtKiBOHHeP+FP/lxVxQ380I0GDO2eCblVEiCWyAVl4DBRnJhBuWQDOGk3o4+hz9vxxnC6gwYz3tGFDKqYGS0m2yle/AIFtCbHbRPeXJtxnNh/m78FixA80z6BQ21bptjE91GK4LWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769971; c=relaxed/simple;
	bh=wW+7tSACC8uyq/iXYto+aZGBal6HgWrOxF4/gfOPWsQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEuW6mgLX0E9JJZM3xivhNwMUEtDN44cL86bvgTPUEVB6lMPMOmgeplZstvqArQIoSiWUyuBeAzI4oFGs+C/8hyDD2bCix5PRg0rjpVYstNsYN85jDEzMn4M3Q7OumiKlq+oyZxAOedQ4rTu2meinFDs5rm/yY1EVUWplm4wYsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9DQEKA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9DQEKA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5147D1F00A3A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788769969;
	bh=rdlf4oXBeh9+2y3oA90hd5dvIpomIvQLvpLL3rgI6xQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=l9DQEKA6a5VL2VKeJYF78GIawB4MVDndwitiSjF/ZNA+dzKAlkaD0EgBGw8BU+30O
	 RFDuhTREVQiOgy/K9g6EQ82+YE7nvpMn1Npw91ylB476uVdlQgayzB539vd0JCSEpJ
	 AB9F699nsuecz6A6PcZ2lDCvJEJJtZCeFgjPdllRoQ/ShfuVm3tk2YyLP9lUGz3fPl
	 ZUnHZGm34rhZP3yrSfArPBgsRlT4Fiao75Tg3iV/uWUHFtf14OQ5dBYZUr7eOm2Aeo
	 6z6BlT6q6vHi2e/N6KKJ8v8GtsHiH7KXJEmw92o1RjxXvEithrDENzrFZixjU3kEme
	 TraYRiO++bjrg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a0faa764beso21742101fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:32:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0lQPtlkMkMkq3G5ZFNpjEbbwDkSYGHgBEebYKv9EocneXujQLM7uPFjS8lm6jIH3YaiuDBleolB/2oNs=@vger.kernel.org
X-Gm-Message-State: AFuF++nuyHgY4bwseTDz4Q4NC+EnZFcK5pnySqzUZZ/P10FeFeZumXQU
	Axe7cisWZwdIB3dNLtPd9c+Thw8dLlvDlDk1t1YIboJL4G45AYe7nOOlnNEafVJEj7kzJo5EkP3
	+wRl4qKbeu7pstV4jv501Ous825NW1cfozlTwxIbwRQ==
X-Received: by 2002:a05:651c:a0a:b0:3a3:74b7:fc04 with SMTP id
 38308e7fff4ca-3a374b827c4mr22038651fa.16.1788769967991; Mon, 07 Sep 2026
 01:32:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 01:32:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 01:32:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260905030450.34800-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905030450.34800-1-daniel@quora.org>
Date: Mon, 7 Sep 2026 01:32:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeJRXDViv5+L6nJxNwrwabM6XLnDx_-z5PwcAjJgRw9Eg@mail.gmail.com>
X-Gm-Features: AcwNN1UGyWrWZWXqtcdjrZhREhtI6-HZlMYNAFkct33Kon7iOiaoirBGZkMBM5E
Message-ID: <CAMRc=MeJRXDViv5+L6nJxNwrwabM6XLnDx_-z5PwcAjJgRw9Eg@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: use sleepable variant of DO_ONCE()
To: Daniel J Blueman <daniel@quora.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Sep 2026 05:04:41 +0200, Daniel J Blueman <daniel@quora.org> said:
> qcom_tzmem_enable() runs qcom_tzmem_init() using DO_ONCE(), taking
> the once_lock spinlock. qcom_tzmem_init() subsequently takes the
> qcom_scm_lock mutex, potentially sleeping holding the spinlock,
> triggering:
>
>   BUG: sleeping function called from invalid context at drivers/firmware/qcom/qcom_scm.c:334
>   in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 112, name: kworker/u49:4
>   Call trace:
>    __might_resched+0x378/0x698
>    __might_sleep+0x9c/0x220
>    qcom_scm_call+0x3c/0xf0
>    __qcom_scm_is_call_available+0xec/0x198
>    qcom_scm_shm_bridge_enable+0xc4/0x158
>    qcom_tzmem_enable+0x178/0x218
>    qcom_scm_probe+0x4d4/0xcb8
>
> Fix this by using DO_ONCE_SLEEPABLE().
>
> Fixes: 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe retry")
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 0fd9581275f1..ebcdee3c5975 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -518,7 +518,7 @@ int qcom_tzmem_enable(struct device *dev)
>  	static int result;
>
>  	qcom_tzmem_dev = dev;
> -	DO_ONCE(qcom_tzmem_do_init, &result);
> +	DO_ONCE_SLEEPABLE(qcom_tzmem_do_init, &result);
>  	return result;
>  }
>  EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
> --
> 2.53.0
>
>

Mukesh already sent the same change[1].

Bart

[1] https://lore.kernel.org/all/20260806112709.4018596-1-mukesh.ojha@oss.qualcomm.com/
