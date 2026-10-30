Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364617;
	b=dMA9VceFkLNffCI1lZ7elKGSFiu0EduQyZkU/JNi2AYTYpzypnCBzp/Y/k8XlRa9vH2I
	 zon09N0PSGaIK057m1ZyXwUfDjK0X2DkYH0DB8UPr/dsw1WO4oGXy745nmZHaf6EQokG7
	 MZDCcTT16KwFNqxCtfuYvZ1rBTa0t0egc/cuPIJh1nnVK8dBdjM4/eUYxi0q3LFWUM3VJ
	 G93KR8+5AjL0a8X3mTP7+2KuqLGZZ1rEAWcpkfBOaBpPrbWAfxlt6opfyWdg5fUD1HDDh
	 ZCt3z4VDXV6NJgdSD6BIN7CGqrFn7R4xmVOdyRNIzqLP4CU3pswEzAKSKle6g0Zxv+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
	b=ciaKgVkMxPpYTAfy1fjcvqI+EZr4/0ZPh8BgNLhPJggSbv1nRxxQKgJ6hF4bdX3dzeEV
	 Od888GeAlvChbFQm2Cmk01DvJEPaV7gvupRaMhjGkP8TJ4ZniHJNgkD1FUAjm607OTYyn
	 f3tu2S78bCB5XfaCbIFtRD83U3jCAXbOHZuZyjj+x+NePpOkJwYZncclQrj27/tFh+VHT
	 8n4BlfateOzy0bfAWd54yOb2/y2YwvBWuIHWSbkt7ArOsnxwhcx3WX70GCI6zvpKG+vTN
	 HQNh3s2pu/nY/QdtxAqATkEcT4uFxR9SMRsAkVH17WSiFy6aOTQtFOSIMS7CYPiD41Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TzCiSuTo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF5606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CF5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TzCiSuTo
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1002933a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364615; cv=none;
        d=google.com; s=arc-20260327;
        b=LAqwrVMy9T89d5grq/Db9gXEHhgcToYnXF4vbb7Cws3lGrilMbo9HDuKTO1fGrPFZs
         Q392eqHHkaF8hBIuGOA2gpipJ4jI+ksNBVkhKoS4l3r24KLQ0TXkJIghFQ8ggz8lgemw
         7a1PpxMrVsKNcOLNUIjv/jcKx9M1CA6HUKfI2VQYkPe5R7HGOmFtmhnV4y3UF+aTdqii
         RV++mvItvJhs0efhkxfSv1US1xGT80Ey7hzTeJODnfOlUVtCq8EgEpTpBSNjyp5Rbvf3
         JeHL2d73RViD0hbtKFpFWTUjkrZr+lc6SYVI6xduep2g2pUZ6FgH3yPNuQXOU3n5z/8B
         Ryng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        fh=I1RXG1m/NDFyROmnnN4Hk5nv/pLYy4/mtK2m+CjERAs=;
        b=dk39kfKH9qZRluRP9gM+q7H5iQo1BPMBQUiRgX/yki3zW6KBGwPJjFcMQCNtsEpDGD
         8WewWZ5c/rNlqCTww3iW5UbAdReRJMg6NmmU+/H6lYLmpcCPJCn0uZtj/+UbhLZTaTQx
         i66TJfcroM3b+5fizlam+24Mx9LBG6KaztM1Y4tAbAz61i++BFCKey9Fd8KT9zBm3B0U
         y1i2hoPUTgZ+RLEkLMST5hyey/PGa9lc+8r/ygKfB+JQbPhYWZ9JsLSuLeBIddC8cRzR
         QpB2ezUvnpvBLkdfRldJcSTwAHrQG3RqUMz72NWLT+P5M4tOOtjCsJvMbCojG22iT9/V
         4OJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364615; x=1793969415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        b=TzCiSuToJkR7BCFedxtyLeiDz71h+eYNxYR7HpKJ0TmSc/1+iX8nAVnXW13Bu5xBaV
         pgR+LGdFa63l1pAbtG/WsZoHQKmZTw95ahfWxE1wOa2Rxsdc4cnFWbhBRZxUFHxJ74xK
         D1Tr2CGY6l/uuFpN+YFijxZv6Vfhr+f/7Gj3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364615; x=1793969415;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gNYOrR5qdv0o/uUnKlELAosZIQN5bxvKJl1b8/vDtfc=;
        b=fMGJRuKgtZro/kBE31W1saOWVucsHTSWIRleZo4bFdK4SWypWq674uuyzE7zAwLwvN
         ttdXcKvjZ5Oxjje5dpS7s5sxniKvZQ7zdQA3pp5lzCyIyOE/AYry0TFvaQRCiaimE41A
         PgSBF64earNWi7pboVQrJkGhOq6nAIhBtToxzSOTvXuEPRBu1xlIuKoQPvWXoE2Bagxp
         m3kp0KkufaAvvs78D9uVD7mBsTK9Yb8GCaGxuKbKC2QFXer9iPJo2XTg0k+1gp+COqDs
         V6/kJPPbAEyo5Ofw4aYrY2V2YQi9zNtrg71nGuCJQ7aH//QKs+sI0Lhscb0IN1hHtrVz
         X0CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcDFaqn7IKpPqtc9PsYSk1Q6ZHLdGI6cYBeCRoepUAIcuHAdCfa0YQmeLWrZRQpG+2Pyw01f+4bfb/9Sk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0fPrxGyDKCkfWf/ly6jovLBTIJK0NszTN9WaEqA7+Ym68Jm/J
	bDsSRmT9FkHi6E7FSzP6tsPMFsY1BxnBAlO7Dr+8+M2/obgwGq3jQWxUk12YdnHhoom11O9OFQZ
	J8+/Zb1ZZsDPSBnBej1nZWgqROSn3WI3nLKteMB2a
X-Gm-Gg: AYBFou20PrQZ4hcTOeZ6a+2qTbowNFLUnMGKcew0x4vruqSRWggwN0Zjeq0DD/V2VKX
	xtKxj7ffVDf6bpMGzHtmIYav4YxMbVmZd1+dhKudftNrsDR0evG5podhGDRYlfEVRtHgqA9g5ut
	JCdz6z2n1A/lBNzL+kO2fILULekSXU/vSEuX/NVN6MyJrtFy0peO4Pakmbv6Ry5WhdHHiYNC3pP
	4d74Yyl9qS7YFd51s6Dy9MgXHkq0XA3q5A9/85F7GLStmT9lDkSJU4m58XVphDqJlH4Go5jCka9
	5we1r0whPCnbzGLTDctW8bR5HmEqmbUwiNbuL/ocA7qCQSQvSis0+DHzWBzUwFtX2uxar7KwKtQ
	8pY5+kqiWMh2Y3rZVj2JNWekUktJlYI3GEyRTdmovjjc/IG9p7nG1eSJoQaS8sK1tESfhSdwy
X-Received: by 2002:a05:6402:44c8:b0:6b1:e87d:5b60 with SMTP id
 4fb4d7f45d1cf-6b4d4686cc2mr1282015a12.15.1793364615011; Fri, 30 Oct 2026
 05:50:15 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:13 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:35 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-2-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-2-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:13 -0500
X-Gm-Features: AclHuK_ccuMwNBYpkeGQ2k0lCJMfFrklKr-EXRp2KSyxEboedXPDgWFhQQBhEOc
Message-ID: <CAFLszTg9hB_YiBAjFKv-oKw-c3iNB+sANwqf-eZhot=JrQBupw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] pylibfdt: Fix FdtSw.as_fdt() when buffer is
 nearly full
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
>
> `FdtSw.as_fdt()` calls `fdt_finish()` on a copy of `self._fdt` without
> using `self.check_space()`. Because `fdt_finish()` appends the 4-byte
> `FDT_END` token, `as_fdt()` raises `FdtException(FDT_ERR_NOSPACE)` if
> fewer than 4 bytes of free space remain in `self._fdt` after the final
> `end_node()`.
>
> Wrap `fdt_finish()` in a `while self.check_space(fdt_finish(fdtsw)):`
> loop so `FdtSw.as_fdt()` automatically resizes the buffer when needed,
> matching the rest of `FdtSw`'s methods.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libfdt.i       | 3 ++-
>  tests/pylibfdt_tests.py | 8 ++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
