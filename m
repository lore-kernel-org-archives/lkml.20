Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C033911DD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251074; cv=none; b=gjzWLv09T6VpEHrK7H/pmY06bdX1y3Et2zqdn77pZZ+L2+eXe4/4+581GqXmNeg7M51Glold6yRudsYLevaTQcoYK6Z3e3L2JxAehTFpb+ZQi7AMkcXAiKlKlOOYpEutX5Swjcrg9XZdHgRtwE7VU8kV+/zEoTd/VEEW9qQamtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251074; c=relaxed/simple;
	bh=Ohz1MiGQMqXYtY5X+4I18NWrJT+Ny2le9fOyWl6akos=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/vXZ9lxRc8toYJPuKyCTkglkb9dBJTGOXSHMn8bedQOmT2GEau3eJnmW94yLXQtZ/XX1RoxN8z0QbAQV9OzCxxYt4pN6ogLuTZ1RjKE0lyAbrWBt2sOJLlrgyzdwwTfqDg3Ld3KS5lckaZETGJQ3S3syftTfHvJtt1w3OdAPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnS1QSiG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnS1QSiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCA71F00ACA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788251073;
	bh=j5dsjKG5yR+eKgT+W8CTLhfKthkR3FkGo7yvnH+WgEE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MnS1QSiG0WIt624n1+rqWaTfP6Rb1CI1qH2g0PGW5O3dKpg6f5cLbVDGBO6WXnPyU
	 bDE262Vm4e7bQKnaBs+D051LYYDZ4LQ89a61V87+UDNwsIbGgeNAr0ZS4A53Ir0dUT
	 ggpTDsjxs9sCmQRfFu/sDvyIJfJ/OKRZ7xaIZEiq/BOlbxMTY/CeJnqrCA6W/WL99Y
	 NKG9CYPiQsLc4NZjuOmiOlU2sBt5IOqBqDy3wJLKRrzb2LtUEJUEguORNOyY7dyJZ6
	 yPQztEZz0oGkKzn0KoxeRhC6uyDhLwdWPLULPhJvCVv3CoMqmhPDrM+odZWUSY3iem
	 KC/VuvaW1w1AA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4b037a2c1so3878026e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:24:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVOePrkHmAwEpp8/5FSklamvqRA9reIkYZmnNQLjx96ZtHu+QlInKI4dD1Z7EpKTY/jBMIkTc5zKCNvYg=@vger.kernel.org
X-Gm-Message-State: AFuF++lV0jXXMuuMCuo1WqYh4vjGNm/cS17SouhT6Y1kBR7RXiSXGFhQ
	z2It03ySYOUqcyUa3tg8EaysGwBHJP66L5Q6mZuVUiiEm/CARGs2GMDpPeX7f0E+MiolHG2eJQY
	5EgHbUgLKkAHjgHm90OLed66pIrxysCuTW7kky26Stw==
X-Received: by 2002:a05:6512:3e0f:b0:5b0:eda:de1f with SMTP id
 2adb3069b0e04-5b5e68ba39amr8429471e87.6.1788251072144; Tue, 01 Sep 2026
 01:24:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:24:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:24:31 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260831143125.151360-4-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831143125.151360-1-ivanrwcm25@gmail.com> <20260831143125.151360-4-ivanrwcm25@gmail.com>
Date: Tue, 1 Sep 2026 01:24:31 -0700
X-Gmail-Original-Message-ID: <CAMRc=McKksaZxMw79fZFKjX-KKXknbf9Neskxd=Cp7KMjjjcaQ@mail.gmail.com>
X-Gm-Features: AcwNN1VWubRSqTinjkp71kgQjPlurXsO1mhtBRgf2oGnblcK_4TOiFCZgTnDBSQ
Message-ID: <CAMRc=McKksaZxMw79fZFKjX-KKXknbf9Neskxd=Cp7KMjjjcaQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] docs: gpio: note lineinfo padding must be zero filled
To: =?UTF-8?Q?Iv=C3=A1n_Ezequiel_Rodriguez?= <ivanrwcm25@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Jason Wang <jasowangio@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Aug 2026 16:31:21 +0200, "Iv=C3=A1n Ezequiel Rodriguez"
<ivanrwcm25@gmail.com> said:
> GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL reject
> non-zero lineinfo.padding with -EINVAL; align the uapi comment with
> gpio_v2_line_request.padding.
>
> Signed-off-by: Iv=C3=A1n Ezequiel Rodriguez <ivanrwcm25@gmail.com>
> ---
>  include/uapi/linux/gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index f7cb8ae87df7..5515b718886e 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -218,7 +218,7 @@ struct gpio_v2_line_request {
>   * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
>   * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together
>   * @attrs: the configuration attributes associated with the line
> - * @padding: reserved for future use
> + * @padding: reserved for future use, must be zero filled
>   */
>  struct gpio_v2_line_info {
>  	char name[GPIO_MAX_NAME_SIZE];
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
