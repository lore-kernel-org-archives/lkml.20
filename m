Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2DB37205F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768951; cv=pass; b=M2vPhcGDbJv+5W7E58nVw5H6mlKGzxwOetqtHVPcIo5JgbFOcbHHrT0PVNVTNdEARYX6i0Gp/ZtU6DX5aWbCniuhjJq5aZNiC9Bq79ZbLRiZZC/w+itJJEgwUE+kCITbg3Hj1IagQBEdZDxvJOzcAUiefPm6msTvQgM73evXjH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768951; c=relaxed/simple;
	bh=JfaZunMAGesDXlAQR97ItVhMeHGWpdeT5fixAIyjgD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cb97lYWsqpEirPqPHPePxlcveU9HBBz3iRz34LFJqn3yM1ie91coPyDGGCkIOoDrbQ8R+oRbWA1VeDWBnQKK7yGPCKBAUxsVMg4MyBl0uIaHjluaS0Zh2ryrLrFQY3AUTtVrnRBjNsQDec3SqcloVxemIVOY6hKpM04cI1Z3Jnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciGPkrR9; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciGPkrR9"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso950710a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768949; cv=none;
        d=google.com; s=arc-20260327;
        b=PtXalYhkeTwYU7lp0o0gQlfSa7QP7lngJuHsCxnomSHcucMhK1p8hZOPHaUEIEsKOt
         EyL6VcIIw5rbfaMjFG5H5SJyvomLHwCgrCuNlnC9j+OT4A/txkiwKSbQGABpr2xRZiBL
         p9gGoW/whbH58NMK7+hBbsu2SSXRQ63eyPvKgC+p1C+QGuNPXjSv0k1PBBRLENo36GTC
         eAl+Dad27XzYJ52aDipulXYS2YicZKryrpvco1e1J4l3JSIYUAxKxfr+7aKzvl14T0TE
         LRwnPAnlouzk37uV3NURbPAHg0uqGgVUMMT3Zcap5Azvj+acWLdya6ou96jhocZQf1iX
         Zq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6VRgPYh8KzHTJLITlkZ0kqibdjDtY4WnhSrTw9ugLHc=;
        fh=UvguE5qQuqH8xMlZ35qQ37KYd1StFz3BQ1mSAYKuMGw=;
        b=cDJ64dR43slyb6VDgVzUvjCD9eyE1qPAcE6PdGRVgCWUQJrX6L8kKG3IFUYgk+BU9O
         CJRHedlKkKLMJ8o4gqRT79VuGtgXrmrCQQJrGvmV0LkgYHK9aWaFbcGRzAzTKUGt+NMb
         UYIt8mLqXg4H0Y7QQrfvKOwkhoOwNlcBi8Jpz8SaXJLAVPas36Dnkdqby4Tr9gTZxL8T
         9RFfqn3HOvT7iChub5HYPbPAGPWvP1npJ9HLkhL2m1f+JibYtv1//2Gtobg+NzJl848m
         T6EpSMulGc0icbH9gOuKij6lZF5+KV+VvNZkpBkrnAj18VY4k+hdV4F71es5P0rcxFOP
         /E0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768949; x=1792373749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6VRgPYh8KzHTJLITlkZ0kqibdjDtY4WnhSrTw9ugLHc=;
        b=ciGPkrR9JQN+Ovldmk31twwMsF6Su3UDZcF3VSZGqeqvsFof/s7STPvYDSmzsusl+K
         o3bHaMX5pbZLjQ3kFDmw30oHMdXMd2y6DOYVJDg7R3NrkyAxSoXB06FWUXXwhVVfC4b1
         czcG2q78Jjg9HXMPjPb/AAbZ/Fw8dsuKjvYUICzLBD7f4qvDKMpcknsVI7OlFjCASGvl
         NcG2LojaKPDzTOIAzeUyAuSplZ2rZ/LWplCngMf6sjEKkKb4dQdooUZVVMk+iNgSo3uP
         Ui6w78b16V87edDq5p1xGuQzYxWxoVeLo55610Jg7mLIs6Lch4naVq89D+5hER44HfQS
         MaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768949; x=1792373749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VRgPYh8KzHTJLITlkZ0kqibdjDtY4WnhSrTw9ugLHc=;
        b=VteUZ9/OWN9xcXeYTcvGq7mden2HwdTob/pc293GAmWOjW0yPWqcfDWQpUJBjEzFAm
         /bhZIhqIDtsi2ZXt4rP07HLDenToGy4p46DFouTMk1DQKxKUt8cfvZHidRq09GXPfv/s
         +800LNiTO7N70qedb9aJpfjRI/rbywpNlooAsL3ITkjD92n772xEwks2XPbk8Ism6dvz
         E6CHvcT8nujGBJOsrMre/ULgVKfhVN9v/nhSzfURUpM0vxs26vi9AIK3hnoKdHpe0ctg
         eWpbb5j+J3oddNtCJ/JBXNizlAWXEMx5/OB+6Bfsika5e5M0JmuKbWz5yYA2KZcC1svC
         hJQA==
X-Forwarded-Encrypted: i=1; AKwUvBxASwRYEvS57/nHkDCESUpJNyn3yL7V90/N59dkuX26KQ0R0yHvilrH8QKzLAqHm8q785X1cgIZD3Ug7vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIRtO64sZJI5/cZwZCYCZhyRaI68lStaF/ORF/2q/DcNhthH9o
	jewWek063rqkDxae9yuKxxMefpfE/mETLszfxq/q5sssU2fnd0gzA7O+4Rrr5ylPkUEGom76tka
	c8lP2nk1lbB3ElkK74X9N/JRx/bPoCnA=
X-Gm-Gg: AYBFou0uzAPwls/oljlcHzC5v4BXES0N806z3/SJ2HT/OUTUHn9wnU/w8Of1ZV7T8vA
	nNxWMJywTJ1x9kMAQ+bQNtDoNxbee8FWsvstocP5rNzi8jAKqUpP41/qIczhwjJa30qRYTcgDjK
	64pA7U0HGJIp91ii9ccOYQN3eByFRLkNw/vs1DMJuXBbWUM5xGgtxKf1WPkhEG/7XcvSuMmUQv0
	kRgiuq7L4HyiY3t84YRwGNj6AYftRwdc+y18y4R/D+i14yZzxDEC+wrQ8QH+KCoHA+tWWJTAVx8
	6BEZ991olRm84kOdpMyjoeNPUgQHeFao4Jad8ZaaFDUQz7H9QRALulsa
X-Received: by 2002:a05:6402:3217:b0:6ac:765e:def6 with SMTP id
 4fb4d7f45d1cf-6b17c1e0c23mr7390623a12.2.1791768948600; Sun, 11 Oct 2026
 18:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902092545.2542183-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260902092545.2542183-1-gonglinkai@kylinos.cn>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:35:35 -0500
X-Gm-Features: AclHuK-4frNmPmeXD-8EnQyzFi7h4d42JHBY5L468Uub689krlQD4pNfaRnqfoA
Message-ID: <CABb+yY0EV=op1m9PVG7F3RK8eTSzGg5dNzJobmTk8cLuEk7iHg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: arm_mhuv2: time out if the receiver never comes up
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Tushar Khandelwal <Tushar.Khandelwal@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 4:25=E2=80=AFAM Linkai Gong <gonglinkai@kylinos.cn> =
wrote:
>
> mhuv2_tx_init() waits forever for access_ready. Fail probe
> after 1s instead of hanging boot.
>
> Fixes: 5a6338cce9f4 ("mailbox: arm_mhuv2: Add driver")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/mailbox/arm_mhuv2.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
> index f035284944c0..1cf4282e1583 100644
> --- a/drivers/mailbox/arm_mhuv2.c
> +++ b/drivers/mailbox/arm_mhuv2.c
> @@ -27,6 +27,7 @@
>
>  #include <linux/amba/bus.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/mailbox_controller.h>
>  #include <linux/mailbox/arm_mhuv2_message.h>
>  #include <linux/module.h>
> @@ -968,6 +969,7 @@ static int mhuv2_tx_init(struct amba_device *adev, st=
ruct mhuv2 *mhu,
>  {
>         struct device *dev =3D mhu->mbox.dev;
>         int ret, i;
> +       u32 val;
>
>         mhu->frame =3D SENDER_FRAME;
>         mhu->mbox.ops =3D &mhuv2_sender_ops;
> @@ -1011,8 +1013,11 @@ static int mhuv2_tx_init(struct amba_device *adev,=
 struct mhuv2 *mhu,
>  out:
>         /* Wait for receiver to be ready */
>         writel_relaxed(0x1, &mhu->send->access_request);
> -       while (!readl_relaxed(&mhu->send->access_ready))
> -               continue;
> +       if (readl_relaxed_poll_timeout(&mhu->send->access_ready, val, val=
,
> +                                      100, 1000000)) {
> +               dev_err(dev, "receiver not ready\n");
> +               return -ETIMEDOUT;
> +       }
>
>         return 0;
>  }
> --
> 2.25.1
>
Applied to mailbox/for-next

Thanks
Jassi
