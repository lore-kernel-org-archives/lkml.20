Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F5B50B432
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059548; cv=none; b=bljFhjg/wVm+1XP5fXucA38h7j/z3Ud33MW1X5YIK/G+0l5CMN9B+1KcOo7r5PtrOUDCtmly6fOr7uHDMyy8dkAEoS9DrOhRrXTMM6E2v/9pF+eAcVPXdzg1FsgxzCXoDkpdc+jo7RNF/sr9aXP9UeYzsqPa732vlUI4CUfN2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059548; c=relaxed/simple;
	bh=obdjFi+DflTCXCJ4HEjroz7TuWbaqLtU7AT1ZuvIE9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kbLx4xvk4aRuIRvZu9X1HuDjbT1y5BhDHRZYq4b+NguqWdj0wAE3YsnxBI7KNDPN3djQeRj6enRq7JGOFTttGUIw5YTxwAv2mgaSBPuSO+iAEbQpWvM0PChMld/KvGn8GnBZl8Jf1IltbK0rUzNGFrYjCbRZvOk0W1hI/GvwNvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=arsA4alg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="arsA4alg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e73611928so44440615e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792059543; x=1792664343; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA8n8+ZwxN0dqwBSyImmmXrtU+HU1AvHwOdHA7+VJNU=;
        b=arsA4algxrbrYAbK3kb3VETgYlANl1fMZvpu5yaVUvL+ZGKh2Rg8yumyUKaalS1/en
         O/JmXIVuu+7SKMMQch+m2wC9MaB62GAjqtJhPts2iYP8tepUcPfPes6UJcdYnvUEP9mq
         vGLo0JXzqNa2z58LcJSTNdkrud8DU3DF9XF6iQwGEnceDLOPbpG2Od4i6aFVCt6DTZ5v
         k8xwVZ7oM/e6FDD0cKg7VdFMAKB6KJikTiid2rhoWZ18wylTZnhj+WmfY1o+bGU8B2TU
         yy3pvm0TxiL3wYVkLTw3qdfQ4KTkeLLQfI36flvHksSzfFPmeyWvemxTPiPQBu3aF5b+
         W9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059543; x=1792664343;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WA8n8+ZwxN0dqwBSyImmmXrtU+HU1AvHwOdHA7+VJNU=;
        b=oZlFeemXjzd/T7zjXU1kqCIBoZaN86E9v4IctDRs1bK5kVStsboixkJ4YlUGg9JIHM
         jDUJ+QBXj2py90KIH+o5jyiqsCIIFCAcb3nvx1Es8pafokEYTieAwoXNzjSY7JfataW4
         nAaRItz8lqc9R1vKiTFx25wUHK18q3UWWcqC//bm9RzFA+h+MFHAmA6EE78BxOaDpfTJ
         pJPzam4NEfdfbK5o7VSpPSLS8fGUnhVHlFP20YdvDAXXFP4zB4m87eEMMw8uyg2Xpvxe
         tO/kaTkmXvHS5krK6GhsDgc2MWa8HZqE1iOQ49Ql6EE7d0hk/7S8YxkbvtYHE1XNoEHi
         F9Dw==
X-Forwarded-Encrypted: i=1; AKwUvBw+41kAz6edacmbcUjc4+kTLv2A7snMKL1QAVZjDJuzauBon4NnB7HlhphoClz9qck3kNIpGD+9V4aG0gQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt8Q1Malx9N1P5Ku1bI6yhkXSL9z7U9p6M8bRDgbhdm0KxVBkJ
	Cree0Pya8EUzkJrStrWnEJp2Zs+4VeYRWy0X+U1Zc6pmnDw1xVxou1Z6yKeRysKijNs=
X-Gm-Gg: AYBFou2lyXbqM2X1i7VZjymsgSkp6hRLE6vNAVlGIKza5B5qz5XZ6LP/PdxhhCouhwb
	08UmA1Ot4IWs9XtYRX6lpV0Wsm9JA/M5cts9DvnLyYQeoSQ85eG4YEDLtkMOySGx6a0ACSQhj6o
	f7kI/A/cXWsKhajEsGnkAv+JQe/Vad+DHF1WySqhec3Kyu7Mw8I6s7Ft1OqYpSReAsFzPy3PQZF
	vtLgvxJtjZHgSjwpi8u7yDGhcnW0SzDFViRgW/hJVw7SOR2YdpxXUPksSAFifGuSa7F0XRoWe9S
	0QPmZ/lSHxRhwKTFT/9ZG6R9DE8EpNcDmEi1MAvW7lKRxSyfklkdRuGbYogNn97ck8tBMZyd8Fo
	bffBBntWl8t3QENGIrvQyYGqYFiK1FvAp7lCVAfC3FiZ5HKVBZXsDr+qY3902LP6BLvB7Em7aCa
	9FSaJpgYM7+8VE15qRcsIq7m6bgdA2n9cNinAClemz5nl6Ut2FGLehPKmU5XOTMNmoygInXCPYc
	sdqEicEjNjE3xOQhA==
X-Received: by 2002:a05:600c:64c6:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a1c27de583mr23492775e9.10.1792059543225;
        Thu, 15 Oct 2026 03:19:03 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd96fed4sm60950835e9.2.2026.10.15.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:19:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Michael Turquette <mturquette@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: cdce925: Size the PLL child name buffer for any int
In-Reply-To: <a61f0060-c43c-4c0f-afcd-1db262cf62ae@topic.nl>
References: <20261014-cdce925-truncate-child-name-v1-1-00136be00c49@baylibre.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1dd36950-a9a7-41bb-847b-d859a91bcfad@emailsignatures365.codetwo.com>
 <a61f0060-c43c-4c0f-afcd-1db262cf62ae@topic.nl>
Date: Thu, 15 Oct 2026 12:19:01 +0200
Message-ID: <1j7bjjfeqy.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 15 oct. 2026 at 11:18, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
> [cid:topic_3fa16e61-8444-4c42-bbdd-4da663de69ef.png]
> TOPIC Embedded Products B.V.
> Materiaalweg 4
> 5681 RJ Best    T:      +31 (0) 499 33 69 69
> The Netherlands E:      mike.looijmans@topic.nl<mailto:mike.looijmans@topic.nl>
>         W:      www.topic.nl<http://www.topic.nl>
>         L:      LinkedIn<https://www.linkedin.com/company/topic-embedded-systems>
>
> Please consider the environment before printing this e-mail
>
> On 10/14/26 18:11, Jerome Brunet wrote:
>
> The PLL child node name is built from "PLL%d" in a 6 byte stack buffer.
> The PLL index is bounded by the chip's num_plls, at most 4, but GCC
> cannot see that bound and, with W=1, warns that the formatted string
> may not fit.
>
> Make the buffer large enough to hold any int and use snprintf() with
> sizeof() so the size stays tied to the declaration.
>
> Fixes: 19fbbbbcd3a3 ("Add TI CDCE925 I2C controlled clock synthesizer driver")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com><mailto:jbrunet@baylibre.com>
> ---
>  drivers/clk/clk-cdce925.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
> index 4d49cc1659c0..56b69d4fe4c2 100644
> --- a/drivers/clk/clk-cdce925.c
> +++ b/drivers/clk/clk-cdce925.c
> @@ -625,7 +625,12 @@ static int cdce925_probe(struct i2c_client *client)
>         int i;
>         int err;
>         struct device_node *np_output;
> -       char child_name[6];
> +       /*
> +        * The PLL number isn't a compile time constant so GCC can't infer
> +        * the number. Make the stack buffer large enough to hold any int
> +        * so Wformat-truncation does not complain.
> +        */
> +       char child_name[15];
>         struct regmap_config config = {
>                 .name = "configuration0",
>                 .reg_bits = 8,
> @@ -697,7 +702,7 @@ static int cdce925_probe(struct i2c_client *client)
>                         dev_err(&client->dev, "Failed register PLL %d\n", i);
>                         goto error;
>                 }
> -               sprintf(child_name, "PLL%d", i+1);
> +               snprintf(child_name, sizeof(child_name), "PLL%d", i + 1);
>
> This would also avoid the warning, without using a larger stack:
>
> sprintf(child_name, "PLL%c", i + '1');
>

If you keep snprintf and properly cast i, possibly.
Feel free to send a follow-up change.

NOTE: please reply to PATCHes using plain text emails.

>
>
>
>                 np_output = of_get_child_by_name(node, child_name);
>                 if (!np_output)
>                         continue;
>
> ---
> base-commit: a5929cbf1406eb3da217d4a182ff6c5b73f3ed91
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> change-id: 20261014-cdce925-truncate-child-name-a4d9db9cf003
>
> Best regards,
> --
> Jerome
>
>
>

-- 
Jerome
