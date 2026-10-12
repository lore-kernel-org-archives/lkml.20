Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4F137205F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769055; cv=pass; b=hMj8GkW7t6B2XCxj9vzA01rnZ9Qw8UwCMKjpd0/rI0RtAfeBcVGdSUUZc2+kCeezJSIMqtEKDXkWRZXvSk+0605+lCtB4epdGUIiFAyvJIGROan5RkkTVPPxWGLCoszagTktxoe616B3QlWjaj7H4EdOnBuINfluEyol3QsZnNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769055; c=relaxed/simple;
	bh=8eamA2vofHWVcfykSPfOgSMCX6h4wsr3MsQE4r2LhZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmEYwsWtJY+ByFQDDz34CWHCFu1p6SQFbLIJoc4gT0ZSwYFW+2BctiLaZy/PUjlVIx8L9sk7N+U2Tiz9cdj5HTtCABncnoAZ89l/0bjt4tGe0VIsszXHzC7YbJN6DIkU3YLg6zAKg5azgK/5Hj58+uRsses+8NwqJxRV+ZPirXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ly9qfU7s; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ly9qfU7s"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ddef424972so1076411eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791769053; cv=none;
        d=google.com; s=arc-20260327;
        b=AULl5BrpVjHlJZFYZaYjqDxqLjK+4n+3ImnO9sQrWR8X2k2/rL0fL03B8ccwtaQx99
         dubq36C6qeEkWaWWguHN9pdkLPUbj9a9j/+c4a4XinNAUnrHX7tGnuz2qv6X7fI4uX4B
         PRuWN6cLNlyxOuh8n6UUbMY1p1oX7jyoUWWx6Yg495ejKjpbrQh9QdVLhAh6Z1rvZSj1
         Yi0oC8ID2eIayk4Sm0JXLk3Q1B1PTsJzczw1l2Nq1YMElRQkXRuIxr4lYw1nlIolFyq3
         nAGuapnwBbDQ4V8DPnYGfcriWgT2tofBuX7hV0ZIjt5BZL5OMDkbDD2IJzPy+qWQA0E6
         xS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fub5Jcy6LRmb/gHzIvFjGYqxVr2QVdb2MxvdUeJjFqI=;
        fh=fJO+1x50ZGuyqJHBj6Fr+yl8AHfkgCu4IH2ynJAmSA8=;
        b=e1atVQMbV8PwQkgCaw9IViLbWhyekyeMpPQoAKe4DN3XJa/NoYg9SUL76Vukr3xbEh
         hNfnL5+8AdrivBtbAJVDECh5zmiwJH1o0kAzSTMJcgCgrRw+HUwNRtOOXT6kImaZciSC
         GfxoZvd9ieLG9nk+/BGmS0xebVI9U8zL6pe5z7epNttLWnCl3bQdDlsZxtLuBMwu49Mt
         YM8F9Zu1caL0l9V0ixjxuRm0b2M4DcE/wCJ9xOEOaGR0oxKZ+R167Qe+0LQ3a6virVUE
         79AfL7vlEysZ5jVsLo6NUvXDDN3kwILK/rQgh7We5JdXGKmcQOuVNChLjFHhubCHhAA9
         01mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791769053; x=1792373853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fub5Jcy6LRmb/gHzIvFjGYqxVr2QVdb2MxvdUeJjFqI=;
        b=Ly9qfU7sUoRvavm66y22mWnyEAFmt7SU7nPQief05UrSedP+KiZI5k8f8CNqYo0PyS
         EwF/JCUEBToZb83T7utc6sVZNWE4pFgxBywW+oOOKUIYkVygCJDfMhaSHe0Un3CmU9Js
         zwwLdIKzE11r60wiPgKoc/GdAxC6swIi3VD5hPt0Fc/PvS2wWjzi+FkQksYbIcB14mDV
         UsbztjFjgpMOqatUOCulO0Wwj8WSgh0wQ46vkKvu11Db0M307cAVOyUAbX/eW5Rc6Ruc
         e6UBZuQbYY8H6EEozNy7zDyZE8BJwIjvnd8G6xhFFHh4LNW1uZO9DwxI1DCHsDOPa1wy
         pQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791769053; x=1792373853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fub5Jcy6LRmb/gHzIvFjGYqxVr2QVdb2MxvdUeJjFqI=;
        b=fJUDS89i1xKHccTr3zl2oJuV9vOCAYxopyg6wc4pJoWtUF11cyBYNMMX5oXFIPCIPx
         nPMhfa6XpqQxMPyjqYZvP3LtRWJkhYi5PYCItBA3VbCug17cRdEjnEsrUZKx2pFjV0/B
         Az/fJPrnBZp4UEmg1fR3+B4bc86QLDr28b89gzDNRh67txHnZtZBtEKit3Mb00yhgoxZ
         mt2uZd4dW2aRordHlTSUG9W/m1N9kseCPABysJ0sfZJQnu/OkKf1NDpiO7YVVXdewOwy
         SAaKjZJiEJXW9XCQXmDAx4U99nQU8s9vhIcsdXaFP1Wim/bi1Fx7qZJuM2xNHRJfVOy5
         nllg==
X-Forwarded-Encrypted: i=1; AKwUvBxq3IryU72oVuyCzyTCX29+YFvU5ZlAa+foYBEd4OABG7bw0rvFYWy0bk2uTW+Bbnp166+33KJuWIF3WBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3rpmvlzuaFAOabANDgIr7hndh05TDXO9ZqhjsaKkollV4XIPp
	dIyMuzxuBglm+s20+LPMxbDe2kpFUJRDghgD03uawOMYcDOgnzMNtnADtyiY1s5q9TsFdeycNDJ
	Bu1zXDwe1INgjUCbxV3Y1B8fG1JP0TsA=
X-Gm-Gg: AYBFou29V9mBcibYMAIfOUSK6Fku3DEFpYVwANBSDVwhlHkX72adrJm9BKiHYVWditq
	yAkHn74+S0jAZ6IG2NWg1YarSdrSyBh07kmomeTCVzDFeKQjPG2+ufkO0Sop8FQtxnihUoCHV+1
	5cUR0UjjH5pR/ZfpgFwOA0jHtwKAlzyZlDul/gni2EvSdbECQpz3kZnEjLjV0KRkP+bSz24X5g8
	wKs6gaH1I8Jye2sfLRES2QGFe6a37VZT76IAb/0SCocfjqe4ZRd3rlQxZVTP8M0VAUQqfMeaCZC
	fAcCT2hPLf+Mm44aS8q+2JRrj05qAeAjY+xEgV6ZW+GcnJ948XfSWHU=
X-Received: by 2002:a05:6820:f007:b0:6c3:2d16:34a4 with SMTP id
 006d021491bc7-6ef08c786c1mr5975765eaf.6.1791769053431; Sun, 11 Oct 2026
 18:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
In-Reply-To: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:37:21 -0500
X-Gm-Features: AclHuK87oJ93OBvwpS0PpodKPWCyuarfSIg_g9uznpYXDgKKFP6Fg0H6hEIxn_E
Message-ID: <CABb+yY27XKXgMo8k7J0=tPX+LnCxpJSwos_h=rCkk43KV5fqxA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: remove stray disable_irq_wake() call
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Huang Yiwei <quic_hyiwei@quicinc.com>, 
	Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:31=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> Commit afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up
> from suspend") replaced enable_irq_wake() with IRQF_NO_SUSPEND on the
> IRQ request, but left the paired disable_irq_wake() in remove()
> behind.
>
> disable_irq_wake() decrements the IRQ's wake_depth. With no matching
> enable_irq_wake() left to increment it, wake_depth stays at 0 and
> irq_set_irq_wake() reports:
>
>   WARN(1, "Unbalanced IRQ %d wake disable\n", irq)
>
> on every unbind. Since there is no enable_irq_wake() to pair it with,
> remove the stray disable_irq_wake() call; IRQF_NO_SUSPEND already
> provides the intended wake behaviour.
>
> Fixes: afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up from =
suspend")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 185b63f724d4..759577055671 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -348,7 +348,6 @@ static void qcom_ipcc_remove(struct platform_device *=
pdev)
>  {
>         struct qcom_ipcc *ipcc =3D platform_get_drvdata(pdev);
>
> -       disable_irq_wake(ipcc->irq);
>         irq_domain_remove(ipcc->irq_domain);
>  }
>
>
> ---
> base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> change-id: 20260916-b4-ipcc_wake_disable_upstream-28bcbd84cef4
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
