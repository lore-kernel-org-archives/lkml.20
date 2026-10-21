Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598447;
	b=dyCvnRC/BE8PpEU0t//m1xWf1hpJOMyoquh0iQyuM//TrvuNb3y0nA+aWMjsLTdrLBCU
	 zglh68sqpbBZR5B5M2YucMdDpXV0XuUk+nBg3G5b4qRri05ct/FgZMDrok7p0kxq8dlDo
	 H14IH72Z1gEBlO4UgYPKqm2lHbJhC6avKZZ6U3Ekr16nLaStwlUYHm1XZfK9X76b6X7Kz
	 2QTMdXxuDp/ylWwt6I3IyMnwaeBXMf7TYoPxLwKZtKv/sLQ7PiQk0rbb+mm8UhhWrh4j4
	 w5SvRIc7uHV89lckdJ2njrkWV+XlHBtGqVQx7/58qjrheViSJogltmwJDuzNTJMAplw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5W0wO5ApY1ruwZkrfuprI8pGOadn8UJEcw8Q72azQTg=;
	b=aC8zaI6xRJyO2N7YpAFPNS8hlf7dPwjZDfYVXvJbqG8o4AYCfP6yjo4/lIGiREYrAuX5
	 KSgZ4KSXt2wokZPZEIBpdICYY/XnhwVVkVIuueFWbIipGydAVptgRQF4T63pD/8Rxfc18
	 9kBe3JwN+VspBAVkkjySwXqedDiSq9VqVBsh5fao8wCDMZX3qG5Uw/GPrnQmIcGCe6iVo
	 72LURyXErHg1TzB7x2dZosZADC+gwgdmO2asQKegV20eZwD+WM4iaof09RS+folTpLQDO
	 HGLw8nYbGP2OPLay5BzfLJnv+v8zkaPz0kczXOhXJwcFCxw88F3/0GFj118/RsSwTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Da1j54ML;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD3C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD3C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Da1j54ML
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1431565a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792598446; x=1793203246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5W0wO5ApY1ruwZkrfuprI8pGOadn8UJEcw8Q72azQTg=;
        b=Da1j54MLWXzMDCGdsiTtXHdyLIMS/sLY0ALdYu5+yEuOj2cF+9wHeDEkFTUPs47ceo
         VUR9DthWpwi++NojMWx4zaZgvG+TOYts2pUHpt+C5S4zMXyV3lxOVyrqA7tezl4TWiNz
         s/eys0/jgJMmQN1wUqMQTZSmzrmvmJiEVv7xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598446; x=1793203246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W0wO5ApY1ruwZkrfuprI8pGOadn8UJEcw8Q72azQTg=;
        b=CsowhwGj+0wDdPoPaTz1ckWfrNu12agQ9VwfFoqz5IRULvDdG77dmsYaXndMvtEX3o
         C3Yr+FF4ge/MWNdw5TELl1PJfXiRQwuFJVvNx0fdfiF69PzUncYigQCDOUfFIKvQfKJ8
         xQTDjaOC51Xe+obgRtUgeb010ru6i1Q32Ojrop1IcjKNd+8yi+5iUwqvlT1ZW/76lreV
         SGJ0COtSAyffd657doR2mBV3CfGXlPDeUVQIMn0H7EWpd9aUfRVcltNhkHdThhdAkeVG
         5uh3hkX6dNL1lrrvcsUX36tsd9s/Ve6zyPfBe4E7xekzR1thi2wbPE+E4vwNC8RfwJHm
         1tyg==
X-Forwarded-Encrypted: i=1; AKwUvBwAgh9tht2+3/nCWZMhN6a1lRn/x6jZwwBrpKd7INKNiMAG+TXfjeXls7PDmti8XRzOChTVQMhNd/GbUH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCfQEuJ6//Y/3RBVuQ6LdlorWyncqM8r/9xmCQy5BihgznGoi/
	xqq7yiq3UeKdK08T9ZyZpQJLROLq++UM7a/Yqmm8q0LchR9hPIFqvUT0jGGb/rt2WKcx6zGXaYM
	seqICluAZ
X-Gm-Gg: AYBFou0U5X0HTAtnOICM2MsNzjXC8MPGiB+vCN4YZXsqvyXbMUYw+aOLaTOLhu86j1T
	noJI/w1gbrRY8xXacW7eW6GGT5BfMEulbw0nbvBaXZEIXsyAB2XXEAengZTgJqJAsG7r9XRF+/Q
	GJHEJTrJz8xSvZES3PBvue3EKJ353OzuyBs5tTplnU7e1uniqLykgDKFhre3Ke6sni7BjKL2N8h
	J7LXer3T/EiTlaByVmEL0EH1Kzr9JUotJyWqgsirTV6mGDxHPHqR9jvKh8saE6zTJHQiHFfM69a
	pYAjYFfP1NjWRIdf+BlECv6oZ5lbnrbGIcp8mhvncmHoOjYyeHZ+YCtJaDo52g4ZiR/dAAO7aoY
	Uimu2vd5MXuSEcxrS9QouOJoQnd6PrbOY5rXeEIQPg7lSfMwJOSzpnFiHZ06yPr7kS4nZD5uhO/
	Vwn01awmWcgMuAnpdYsLIhpRFl3eSt8HieqA2DxLzUbsPMQyWkKBBi0pByc7fzMk5gZYlIuKV/2
	8Ao8I23b7iVH1GiOBhWZGsrBXkfZ6N+PeYLHhy0r2ivhHlCHyjLDMuInoYVfj0butTjsw/ZhCR2
	DNxziOeRFbRDjUA=
X-Received: by 2002:a05:6402:c4e:b0:6b3:f840:59b5 with SMTP id 4fb4d7f45d1cf-6b408ebfce3mr1757802a12.27.1792598444133;
        Wed, 21 Oct 2026 09:00:44 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315506bsm983074a12.29.2026.10.21.09.00.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:00:42 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so11931a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkg2Eh3kTpYSjQxIFuWK9fFwZQwQ45lviN/n9t8sx8sy0XmK8626dBGPn9lSg55Z6DczRqURsD7j3+okc=@vger.kernel.org
X-Received: by 2002:a05:6402:c181:b0:6b4:124b:da30 with SMTP id
 4fb4d7f45d1cf-6b4124bda8emr34019a12.12.1792598437038; Wed, 21 Oct 2026
 09:00:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792392288.git.kmehltretter@gmail.com> <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
In-Reply-To: <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 22 Oct 2026 01:00:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>
X-Gm-Features: AclHuK9e58N_Im_zhkbxzzSKI3JdeU-CBpj5GNDyWEt5aL7nKqE3jFXgtXMdHNo
Message-ID: <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomasz Stanislawski <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Karl,

On Mon, Oct 19, 2026 at 4:14=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> VIDIOC_PREPARE_BUF leaves a buffer DEQUEUED after calling buf_prepare()
> and the prepare() memory operation. VIDIOC_REMOVE_BUFS accepts that state
> but frees the buffer without calling the matching finish operations.
>
> With VIDEO_ADV_DEBUG, vivid reports:
>
>   unbalanced counters for queue 000000009fa716f8, buffer 0:
>        buf_prepare: 1 buf_finish: 0
>        prepare: 1 finish: 0
>
> Finish prepared buffers before freeing them, as queue cancellation does.
>
> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Thanks for the patch. Please take a look at my comments inline.

>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index b0a6084f17573..460eaf4e82f78 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1746,6 +1746,19 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsi=
gned int start, unsigned int c
>                         goto unlock;
>                 }
>         }
> +
> +       /* A buffer can be prepared without being queued. Finish it first=
. */
> +       for (i =3D start; i < start + count; i++) {
> +               struct vb2_buffer *vb =3D vb2_get_buffer(q, i);
> +
> +               if (!vb->prepared)
> +                       continue;
> +
> +               __vb2_buf_mem_finish(vb);
> +               call_void_vb_qop(vb, buf_finish, vb);
> +               vb->prepared =3D 0;
> +       }
> +

__vb2_queue_cancel() does much more than that, especially all the
media request handling. In addition, this open coded handling just
causes code duplication.

Would it make more sense to refactor the relevant part of the buffer
cancelation loop from __vb2_queue_cancel() into a helper function and
call it here instead?

Best,
Tomasz

>         __vb2_queue_free(q, start, count);
>         dprintk(q, 2, "%u buffers removed\n", count);
>
> --
> 2.47.3
>
