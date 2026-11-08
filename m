Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171755;
	b=g75T8J+KP8A6AmQmI1hEQ340ylpNdIZ2rB+B1qGOQE2wzb2XayKKpr34MSt6CmG3DIM9
	 uX6OE2avXu4YSe7JWdqYE8caVwLsmvGVSKLlvteeUcMtJMDjsSuR1wSv8JUQI0/MH5eFD
	 /wV8j/2JTx3Cttk4yEZmCHN3tkU6QGEyuneMQxV8nCdbs2oTaLA76YQXpS3hwzh9BnZFf
	 Gml/Cwpl2YgeA9ZfEeyAygAGV2OzwTuH9izNF8m4tXrLF0qNQ7GehgH+dnYQ8HiaDLDL0
	 AdTOnyuYl2BIVJ/44j+PqVC9HhGW2e65XyBjz97N7HTj6cd1f/nLfw8IOAoopUmf6dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cMm3PWlZKSVzTBduDywaKmxs6tEZa4+wbXkdqUMN/Rw=;
	b=4BYS7L7fsF7JDTBOPYGsJ3g09oy4w2zNgMmiO2NXD3JdYTnxBi1KJXElshUkLXitsuPb
	 c8ZlaNvdyd/kenTQga4ykaSFXd66TUrt5lq1UQJsJjZdmRUfQ9+usMrDQ7sVUnTzGfKoZ
	 N2B/KsK610oGjtpptrhcguc4pm2DHLyYNsTsMWZP3vhwPWyoSGbqIChW6ClSc3Lja7Mpb
	 ycpA4ifvdJbD112jv/iwEZSvB27VanCo9egsyy+kZNlbldEP/M9Sh9ODIZXp6ztp3bCsP
	 P2D4RSmITMLUXolX6t9IjgZ2eUaf34svcjn2fQaSPqTND4wYqiaKIxEFrF5segkycVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ef66MZbs;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264F606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8264F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ef66MZbs
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2591565e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171754; x=1794776554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMm3PWlZKSVzTBduDywaKmxs6tEZa4+wbXkdqUMN/Rw=;
        b=ef66MZbs7/9pQUnApmXYY+6HgFy7hXZ3fMbRal1xwVliJp8N2CZPYRn8DmmPTTXF0H
         IwQxUrmtz79jzNHH/Vwpw0dUvTlg5+LyAea6RTZP5rNYZw1H7lJL0LHeab9PN8P5csNO
         Jd8q7ULRZPEoWUtrjDx4YBfh/SzLACJQYUZltewehSpFhOQjUW67VicHRSa0MkT4fr93
         CgzC1XtxB6f7TYQZ6flxH1+U0KFvd3B9GKp/BsDdeznc9td9/HF5CtfocRaJiPCEbh86
         Xzz1SaJ7SbqW6nlXbLaMlzua9+bUwtpAdyX9TYAIUtByIh8yYF1MdYYM8eW7IAlTy/wQ
         /YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171754; x=1794776554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMm3PWlZKSVzTBduDywaKmxs6tEZa4+wbXkdqUMN/Rw=;
        b=wlY/2wiIWIYzhfhAPSF3mkESf8C5WQNBhcHISHuuyVInYeE/mvPdxHdTmtCSQByANg
         Zmc5JuvxwiqEq7CxisHizvQL8G9SdbwsAzWNhb83M/l2mUmz56xEGaTv+G1PMFjZw78u
         qyYHepE5zWZI183rLIooWYM85JcsmZpkqqun9L9n65OgPFmt+TK3VhUnrCpXlaN2s75u
         hQhyN23go6raiteAmvezM0gAqdx/Pcr6oy+wmTS586rmkdGG48kqtnpNa0IdT6eaTGu5
         iVuQXVE1nJ4Qb6RuoupNynS0++bObeD5ZA1EaCXp8TlWQ3TXePo6R9Bt+5hH3CmCuTpG
         VMaA==
X-Forwarded-Encrypted: i=1; AL+hErGEaUxfZLshbSuDhztDPSzAWCboX5hvM+pp9wCVUnIOK4LkoDT/kQqEL8pzqxiSkm5JEhLdKfHW0J0LnQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z//oCl8hsTUDw4vP/BaxqhpUIENjINJi18W6kiKVMVOm/7TS5jY
	fA9zC/tyWa7oFYzMGcwCgitnAeoS/KblrlqPhcq6JlkBfxcp1qAKxjzN
X-Gm-Gg: AYBFou2yr3f3kJ+YWHUQS0GcpseT41GEO6z5uy9yy3RNTsMLqZciZvGQ3v5zG4YnVuk
	XJI8ma+AEbctJOFflw18ON7t5c3ZyS3VhHM12QztB44VucrCBVu6Tt7r9Azf5Mn8/zaw86Y7/mU
	2v5FqLAtKzyWL67Anxvhylv+GgXml4JVnPNv+SVXvQkNL03nFliELdAHBPtGGWBD3YyPyW0mK6Q
	ouBhsz02ORe4V4+M/wLZ/XU+76NTtGfC1GHZZZYw5yyR7vSQX/J7F/QGjjKjCv83AUI/Fw/kqas
	8scYK/A7uOFzEK1cuiAEIceR6B02zRRP7XSYMQMR6bmRlxBDiypnkrGiL4SPbLcs2hmJketFZrX
	c+tAWDofV+Ohp2KymyWkeT6M5gNRHrh3ToFbQj435e3YjN7m1ANlgdC2dIQIon+OQNPqhAtfws+
	NxRTtUYdXHAhvRUCI8084YmZDG+Shf/vi8x1Xb1dTf3yJm5DyiUt7g3z+MTXowrmg9zOGuF0v+4
	kPngrzKXYxUxhLlxYX1M0FxRxWi96+3ouv7/g3MnE3DhfcaRxKnQ+IzZXxHCsORE9qZDLEREx5S
	DvVreEnVarkACB8q4SQDllDn2YVA3IPeaCF+cGDi8mkcQWxGl43Az6Dl21k3ScOI
X-Received: by 2002:a05:600c:46d2:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4b963c6ca8fmr41994175e9.9.1794171753830;
        Sun, 08 Nov 2026 13:02:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm99840785e9.13.2026.11.08.13.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:02:33 -0800 (PST)
Date: Sun, 8 Nov 2026 21:02:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA
 drivers
Message-ID: <20261108210232.13800dd3@pumpkin>
In-Reply-To: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Nov 2026 23:46:39 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:

> In preparation for removing the deprecated strlcat() API[1],
> replace the strscpy() and strlcat() calls used to construct
> V4L2 card names in the TEA5777 and TEA575x radio drivers.
> 
> seq_buf tracks the current write position and remaining capacity
> across appends, avoiding repeated scans of the destination buffer.
> This preserves the resulting strings, including truncation behavior.

seq_buf is just OTT.
Using to replace a single strcat() is just silly.
There is no point doing these patches until there is a sensible alternative.

> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> ---
>  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
>  drivers/media/radio/tea575x.c       | 10 ++++++++--
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
> index fb9de7bbcd19..2b1c7f6ddd60 100644
> --- a/drivers/media/radio/radio-tea5777.c
> +++ b/drivers/media/radio/radio-tea5777.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/sched.h>
> +#include <linux/seq_buf.h>
>  #include <linux/slab.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-dev.h>
> @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  					struct v4l2_capability *v)
>  {
>  	struct radio_tea5777 *tea = video_drvdata(file);
> +	struct seq_buf s;
>  
>  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> -	strscpy(v->card, tea->card, sizeof(v->card));
> -	strlcat(v->card, " TEA5777", sizeof(v->card));

What is wrong with (and almost OTT):
#define TEA5777 " TEA5777"
	BUILD_BUG_ON(sizeof(TEA5777) <= sizeof(v->card))

	len = strscpy(v->card, tea->card, sizeof(v->card) - sizeof(TEA5777) + 1);
	if (len < 0)
		goto fail;
	memcpy(v->card + len, TEA5777, sizeof(TEA5777);

What might be useful is a helper that would let you write:
	len = strscpy(v->card, tea->card);
	len = strscpy_at(v->card, len, " TEA5777" [, implied_length]);
	if (len < 0)
		goto fail;

David

> +
> +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> +	seq_buf_puts(&s, (const char *)tea->card);
> +	seq_buf_puts(&s, " TEA5777");
> +	seq_buf_terminate(&s);
> +
>  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
>  	return 0;
>  }
> diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
> index c37315226c42..e49228eb7c46 100644
> --- a/drivers/media/radio/tea575x.c
> +++ b/drivers/media/radio/tea575x.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
> +#include <linux/seq_buf.h>
>  #include <linux/sched.h>
>  #include <asm/io.h>
>  #include <media/v4l2-device.h>
> @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  					struct v4l2_capability *v)
>  {
>  	struct snd_tea575x *tea = video_drvdata(file);
> +	struct seq_buf s;
>  
>  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> -	strscpy(v->card, tea->card, sizeof(v->card));
> -	strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v->card));
> +
> +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> +	seq_buf_puts(&s, (const char *)tea->card);
> +	seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> +	seq_buf_terminate(&s);
> +
>  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
>  	return 0;
>  }

