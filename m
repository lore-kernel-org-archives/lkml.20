Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454485;
	b=y2wqGiUkjuUaaNWt5O9acQX//xkHbGv2IeYLpWyFchBhSOUH4nF2JHMJe4UdNLfaJ5Ps
	 LR6o4dxLrOLunji3Rnlvz8XTifl/Vy7quERGGy+xKUEnCHYrc90t7QqNmxFHQj5zbHPoR
	 FMsXf4NDtR+CJiMAxhqNpFD8PPlJw0GgqlcOLJG2ZWBWS2NbKPE2qtc67arEF1ZuBHIXw
	 b5QpD3O9Z8Mj1epySCT+5p9EC8nIkpbXHfHq20beFltvmL5QYjS8rjV9VyCqhNXJi1VC7
	 disIgbE3whSWLwIDY0VcrMyqMpWe+dcjUO2s3ARpVv1eeXLK0RAkLbIsIdIMP52oDVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
	b=E2WvUE6F73eb6dH98XF4/G7LxNQDCSY6r8vYiVTCwkM/uotZm3XwNejsJqu2EaG3NquN
	 9ztfCE6nhyxjYpXmb5gmLd1Ql3wzZzMHXlW/I+1lhVGc0QXnngBMa0Az8PJvtWqF6SCPj
	 SaRfcdMhTeGMv0LmzWQiqAKkl7rOyvv3lcP/JG7Obu4H0yn4TjLlau/xd8z9LDT4+b6OD
	 z9xsV88AR7L4ztKrHql6Nn+gpcd8XhCjW+zVeSvHvzqjUTh2R8G7UdWCgQfZHoUTZjykX
	 iWUsEOxRlzR5PidI8l7aJDI4H5aSTV4wIl6LF//OgQKdFSrQ+trlvN+llqKK6qqMY0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbmweJSo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29084606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29084606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbmweJSo
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4395d31228so508518266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794454482; cv=none;
        d=google.com; s=arc-20260327;
        b=IE48vmyKEfVEouF6+WvV7M2JSmHvfEfrbHV7s7iyBUiACKmYc2mQEHnwaheUdkTOok
         6NH61O51or6tvXplhC/JX+VBu0ADURxCAd0XgOEBkgBRceJzazd502/8+ceS9aeopjon
         +l1Yto7nueR7R/tO+ZZWW+tRrAiCPS68YrZ2RYYahEE2yKxBNLNRhJihmkrGhQMTHyMi
         uwTwDlerSwEawdTsdeI98zteYqK6rRX/PWaQniHEHOG+/7XIY2SQw3PiqqyIpUeaLv4R
         QVwD0Bo/pm1vKwNdAFdQKKFwTOCKxS9FcB6FIVhw/IRHfgk8bTG3XuX0+i2jGd72ghA9
         wiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
        fh=m+nXjjMqQ+qPQhLx55tiqtKY6G6J/QQvNZP77It2TBs=;
        b=i/a6hVY9JSba7HnJ6804vrQ9NWT9qDFla+tQyu+D8o8jlKD5RDAKMchggiGLKqZDqX
         XLOFs1/ab7ihBlMmAY22riF38ZcPvjBnnAerz0dpu94797fqIaw5B82dMqnVK5MRhbRU
         90msOU4aiw2kNNT4TRloiVzrb648bos9LbHvc5k5CxW7fNBkNzqfsqJ5TkF4Zer+ATrU
         A159p+UDUdRKvv4/poB/t6Z9DSeQr3hIA+PF7Jpf9OACC1PoHi45gXbwM248QYWqcBL4
         nGfuwm3dzNIdDTSLat7JCWXkbIbbFGOtilF2j+HHNYD4Q2s8xYSJ1j+lJ8giMtMs6+n+
         bolg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794454482; x=1795059282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
        b=XbmweJSoOw/Ubg9edSib6n+niyNCV83nNz3+Xt0bWSDoO4QvL4eQ5CmKqpD6grupp8
         UHeFHjZs1J6gJ+3DTvVT5o5DGWKYvTMeSnISFZfsYv7w4vjtxVqSVDQNY3Q52P/0rAth
         tCOjvjKRyNIHKjYgfu4DPgmuyxoLJG9HDsKgC06+cRaypbOC2P1HdbIJwXBb9OKBgK3G
         /4cDfTF7LMQy2anMsZxyXiDXyvkXi3FkcZ9ilyey0n48zXD7PNwLVtKjHRYNa/KV9e2x
         NjauKzaUyuDQmkxvWfazajRR4/PWEiX4s27U1O+dfZg8QS4OxJhU+nveuKfEhVgzQ18O
         ZvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794454482; x=1795059282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
        b=hj1no25cbMPrKu9IZNp24X3dGrp4aAGElSo8GCQVM7qkALIwxixPqGvjIcLXfHRRJ8
         Cvmd9Y2zO2zP6CPFFpqHsg5p74kPXTkBVeb8DzY5Ka2pLW2vSvEd9mRr1O/vhnmpMMU0
         ZuZXBPXvMgtAI+aWMFld52bnG8nuBs29+ZOlpivEGgeqh+qUdPXgJXSSCP9Ul+9fAF9W
         Qk7M0FqJy4lBLV3akLfv69tp1GzDL70qHk3xuiwUYDdiYPKDQ8fhjSuefTNI8sVQWCnE
         CdfUpQmrhBnKCQ2E9YmFr5mvCkam5/MLzYTWNm+71LexiOI/gxOLQ5uJA70oEd/Umx+R
         fQmw==
X-Forwarded-Encrypted: i=1; AL+hErFrCeyWdm+PHuJ+4e/wvn8ZagIzFEKpFB6lWcyFrLQ0KeH+HmWzgkxUhm5c9wUTC8CwwGoMZfkH+tfJC/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9temkV4eyzGfDpEPlxViAsXfALKZzkgGGHhEEnz4wjtj7ptg2c
	PTRqxnYMjqpEN+3wS+fNbbxDqH5OhXQ07iEQv3WdNj5eiXLQUCdCwhhz/jteiq7ufYAyygJkjkY
	CQwnJ5NJTeG62KC8axp9ZbithhQn+isk=
X-Gm-Gg: AYBFou3y3knPysdwkSuBMtvUOJKgu7ajdLbo1gwYmsJjCh117bubkJNca4YdFB8EhA0
	wyrhFl+uGqe+1kBqsvtorfw5dVdGnl5CdhGiRS9Chj8+3XCoczpJLJcm4toH/2fMKnGbYhXNRGL
	vL2Levd0gHCXn0XsedXTtZLlXz0HLKBKetmsjcx2hB3yq12z27W6HyYYxgGQUscikNnFx+0WP6W
	3yDcZoDSguj4e/q9xwFvGMbsdS9GVx49Jjdir3x3NlEpAsaJB1PxqBQYngv0QUkjTFOIkSuYBD2
	5tayN179i8IIE/tpVLaa19pz2uM4IkC4Dz9M9RpzP1C2UIKR/LmV0CYMdnVI1XAvAnxXEugHs6X
	c6WyTr2MrJKZ18CMIDXmMtD9I7V3h9V14F2aiowJfN/9LtTetVg==
X-Received: by 2002:a17:907:6d18:b0:c50:5545:b67c with SMTP id
 a640c23a62f3a-c5066b44dd9mr369952566b.18.1794454482354; Wed, 11 Nov 2026
 19:34:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
In-Reply-To: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Wed, 11 Nov 2026 21:34:30 -0600
X-Gm-Features: AclHuK9AV_1Y2d0UxZ-1Hr4sJSdXijhOdrfjQAveTFrzhQ1dDz2Bh1ByTpqCY6s
Message-ID: <CAHDi9tqk3rHYJZ2Abu5Gn-=xVhA_AawCX9VRK_Nu0sHmNkeM7w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] staging: octeon: fix probe error path and
 pow_send_list matching
To: aleszlucero@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this series, I sent it by mistake. I will send a
corrected version shortly.

El mi=C3=A9, 11 nov 2026 a la(s) 9:30=E2=80=AFp.m., Oscar Alejandro S=C3=A1=
nchez Lucero
via B4 Relay (devnull+aleszlucero.gmail.com@kernel.org) escribi=C3=B3:
>
> Fixed two bugs in drivers/staging/octeon/ethernet.c:
>
> 1. Call cvmx_pko_disable() in the cvm_oct_probe() error path to match the
>    teardown sequence in cvm_oct_remove().
> 2. Split pow_send_list on commas using strsep() instead of matching
>    substrings with strstr().
>
> Oscar Alejandro S=C3=A1nchez Lucero (2):
>   staging: octeon: disable PKO before device removal in probe error path
>   staging: octeon: match exact interface names in pow_send_list
>
> Signed-off-by: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com=
>
> ---
> Changes in v3:
> - Drop the ndo_get_stats64 conversion patch
> - Change commit description.
>
> ---
> Oscar Alejandro S=C3=A1nchez Lucero (2):
>       staging: octeon: disable PKO before device removal in probe error p=
ath
>       staging: octeon: match exact interface names in pow_send_list
>
>  drivers/staging/octeon/ethernet.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261108-octeon-init-pipeline-v1-e25ec64f49e3
>
> Best regards,
> --
> Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com>
>
>
