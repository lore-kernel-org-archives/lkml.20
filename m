Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BBD282F17
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769026; cv=pass; b=Sh+un6zTA/sloY35G+Xpvg5fUQ0g74OpSjOoXxqD2nAX00ubsU5uk7iJ8+fZKrhngVJrqtZ2K69LzfLdSbRPmyOYad4g3uaIaRcvzyu8xvjlKZ9RMe0nXhKO5w4ez0Da56fglWv/2HErVycgHDu5+Fv2giNRjKG7UCTZedzrgds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769026; c=relaxed/simple;
	bh=23Lw7vM4wP52T5CZZzj5VSVp9TctYmvu/KUZ9CKSfFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnIb+9AUjEoQLyFbLC0+4gKZmbXQE8VN/t2wG/2rMCHstrMyfEFnJzQ5uZ9rNJErXbs5dfQlEoo3QKWE6aSya2ZPC076mEidGwAGQib6kGNVjN9QOhcm5wQ4IjTjh8uFDp+V95zmXi6CLdMEz/48tbPjiBM6DSY1l53nk4yk4gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcNmOjgX; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcNmOjgX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2020495a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791769023; cv=none;
        d=google.com; s=arc-20260327;
        b=O3CgSC8HaUVipsdFZynk+I2nEXYIAXClVOwO2Jn6qF3hwNezZVwBTCYaxsc8tc8o2+
         vHNtnabZdqCYQQ6g0w8BvQ6Io4wLiORzNFZpSk2V9guFZfShRuJTmmJfqdEbvXfspB9M
         kAUBCscynSBUjQi6Z9usqzYM1EnjhJX5uv8gvyf74jS7u1SUGJ2QVq9itHnuwE8Nn8wT
         Jt8vJC2CvwSqoNgM8ncobUuP6rruE7rvK9IYsHrjP9jSMCebeq7EQaiCxRcSdw8GlRI0
         bkJVf6NM54BrADCLkIMx+JVmF2fKUKyZZHj30vMuhCzVkIBJHLhJ5zY1pXhYfeBbefCA
         Gd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kIt1CS5cV077Iep8QC6bTj/foPl01OdYIeRJxdNPDpM=;
        fh=pGCcZxQLqrLU8qIMm3IkP2H7CmX0d18avICNOgIWsSg=;
        b=NClO4Ok0O4g2cBMzzWVzzDAyjkixjwSofyKmMCvvjhyZAk8jvz0lSc+2U0b00hKSjy
         dBSG+cAX7gK0SPDyFt3kTswwlYH9HUS7+0tHPgjlarL4N9EeZ9rHBY7PmBAu28EpgaSs
         NiL0c8WdBhK3b5rAkm1UpVHbBSKdeJJKzAQgnKq11SvdWnU7jwbDtfd1k6TWHttjUq3P
         0gHxQeehgrSIF4F5VuzGCCrUOJrGdNU5krBfnsUPWdS1i4/wGOMOLocH+Qye0m8YxnaX
         M/y0lAwACoO2OEwZTkvkp4y8pJX8u47rlIKIVZEenxLP7G4F6v6/+LveCi192jeB9PDB
         iArQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791769023; x=1792373823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIt1CS5cV077Iep8QC6bTj/foPl01OdYIeRJxdNPDpM=;
        b=UcNmOjgXlPQMd1zO0rW4fso00eY7TnU0dd6c1bPHO3qs33uILAgn8qiwjkCIs/CRiK
         QcFqdlFhb+K4R1xgjWj9wAod5CspNT4H49FSTu7fICel2+4jVtzdBITP0YdkX28hAxq0
         CM9wtkn9yDRd11qQlYRSat1iwxVng3HptbE7Cp62kRBF376OGf7WRn42Gsnvy65IsW2F
         k3IzhfvMiLMTR9avLfZOuiBuTWm7y1eooBblrhBCu5am/2U4xAEwH/QluAd66aOoDs/H
         yUGz8xErzfv5eOU8jdzwyEvOkZu3kA2nUVgzB1E+LRZPRs+qCFINnabgKoLbU5GiBsUN
         jdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791769023; x=1792373823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIt1CS5cV077Iep8QC6bTj/foPl01OdYIeRJxdNPDpM=;
        b=WZNrZA9Lf6giKDczsZ0qwwdTjRThEuP/wVEzO2eqVgZL9FChhxgbH4R6dSzDJUEE80
         DLYu5/MSavUxTTbGDjRNfXbwUqAw/jX9glK4vgsN8+WaDET9sE9KXHY+GKRy/wayfgo2
         h1TtyAtw2K+4nlL5/jMnY4yBUvooQ9sLLt+c4Fz57eJxtbCucLosDubWMZmceawd0JkP
         YNSe7bY3Byuid+fdwwQwHcuXO/DB4CtXEqEJupMvxrFyVRbR2MVCOtoQrzkkcH8VDziV
         3zNCQ1V04WLJBSIWoW1LrYGnSkZ0moMZ7+oazT7FVfYxyGyAoIbuv6gT9tcX5n5Hr5bs
         5oWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKavU+AQX0SfXGFyjg9PkXqNmhbOoiYYAGfpu9yIQ+fK9lziVDJVkB81j2Csr6OITPLmZ+18M4YaKcpIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIheLSB7G2Q2nQpr2x9ZHX+gw/RorAfm6Dn4wgtAhivcNtCBNWF
	7up0AtXFYpkXTsa/jViEqSnTo5JfFeY9XXm5fJAWm8kE06eWa18ksgKxlzoUJEM2sfOQkTl0B5l
	iho8FkeErLWtI6dSY0W5v672dT91H9qM=
X-Gm-Gg: AYBFou2mc+yFWdhwQ/+mP0RzM+X3LYvJIimA0gq3p7ZFlR7gPhE8IK2fAKcoFf3LA/L
	fFQhUdKJs53pnfONglokNwEfWeMNknH2G3RvfhwbZ6tnRXpTVQHhzV7VIXqQ6NY5TmFc7dyHCl1
	uYBt2i599DT/4u3cbs1jRxHNzTw490jtG2kEZJw/csgfIRMVS8VNp1tK/9EeQLW11TQo+1pH1Db
	PBr68M7YKFFNCthO76x8fZU3wc/ctY38fKchfheN91bnyCIkdAC9S05HrJegIkXW7zHifFUYvV5
	f2feDvXQIMoH2LQqYp804qEIfLnJk1M0Th3IM5eCBbwqObZl6HDe0iw=
X-Received: by 2002:a05:6402:1ecd:b0:6ac:8ef4:177d with SMTP id
 4fb4d7f45d1cf-6b17c244847mr7817735a12.20.1791769023054; Sun, 11 Oct 2026
 18:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-b4-ipcc_send_data_null_check_upstream-v1-1-bfc61f5056a3@oss.qualcomm.com>
In-Reply-To: <20260916-b4-ipcc_send_data_null_check_upstream-v1-1-bfc61f5056a3@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:36:47 -0500
X-Gm-Features: AclHuK_9kqp9LiaECpF6jdko0DVDOwODce2xY8QZwz01sjZXIAlcS2lK4ydkNvI
Message-ID: <CABb+yY2TGZX37Ketsx33Q93wWLSw1LP9+auTHywmb9-GrBd2-A@mail.gmail.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: Guard against NULL con_priv in send_data()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 4:57=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> qcom_ipcc_mbox_shutdown() clears chan->con_priv with no locking.
> qcom_ipcc_mbox_send_data() dereferences the same field without
> checking for NULL first, so a send racing a concurrent shutdown can
> crash:
>
>   mchan =3D chan->con_priv;
>   ...
>   hwirq =3D qcom_ipcc_get_hwirq(mchan->client_id, mchan->signal_id);
>
> Add the same NULL guard mbox_send_message() already uses for
> chan->cl, and bail out before dereferencing a cleared con_priv.
>
> To close the remaining race where send_data() reads con_priv a moment
> before a concurrent shutdown clears it, acquire the spinlock in
> qcom_ipcc_mbox_shutdown() using the modern guard(spinlock_irqsave)
> primitive before setting con_priv to NULL.
>
> Fixes: d6fbfdbc1274 ("mailbox: qcom-ipcc: Fix IPCC mbox channel exhaustio=
n")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 185b63f724d4..387aa72aeedf 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -10,6 +10,7 @@
>  #include <linux/mailbox_controller.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/spinlock.h>
>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>
> @@ -151,6 +152,9 @@ static int qcom_ipcc_mbox_send_data(struct mbox_chan =
*chan, void *data)
>         struct qcom_ipcc_chan_info *mchan =3D chan->con_priv;
>         u32 hwirq;
>
> +       if (!mchan)
> +               return -EINVAL;
> +
>         hwirq =3D qcom_ipcc_get_hwirq(mchan->client_id, mchan->signal_id)=
;
>         writel(hwirq, ipcc->base + IPCC_REG_SEND_ID);
>
> @@ -159,6 +163,8 @@ static int qcom_ipcc_mbox_send_data(struct mbox_chan =
*chan, void *data)
>
>  static void qcom_ipcc_mbox_shutdown(struct mbox_chan *chan)
>  {
> +       guard(spinlock_irqsave)(&chan->lock);
> +
>         chan->con_priv =3D NULL;
>  }
>
>
> ---
> base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> change-id: 20260916-b4-ipcc_send_data_null_check_upstream-072b8856680f
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
