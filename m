Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE7338D404
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844732; cv=pass; b=b+32OPxLtFaAy7gjlG1fQ9MJXGvxeK+wtiZST6Y02atDcMKYOz3s4Q5f/0sKHbmLMgz20Y9YjMPiREHSC7rL/1zCbjnFlmA0x1k62zSKmImMwQq3V8P6I9zJu5AmH9b7CQK18OQNLstgmLyJ0dN40EwLeyNreNb7ivgIqIWr8Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844732; c=relaxed/simple;
	bh=OG0N9hfGAjQrVAX3fWQSJUJJsrOM4IzsIrO2Jd3scnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pob9atiiDs/kNsbNEE89PwGaz7q+UhYmnWxWKOCZfxXGft24vqdYjXGEMUWMVxL+09qqaPdsMnzGvBevw2QEZWaa9pIOXkoUp9xbwgPgSgy7L4Uqj2HY5EnO74jQy/omvhB0Kab87vQ+Fqn0b/7ITl8aarma3JGXogrs4doT3Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ix2QlMo2; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ix2QlMo2"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso3802248a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787844729; cv=none;
        d=google.com; s=arc-20260327;
        b=g+IRRmBNXnSkNodFYi80JXVuHU+Ak+licrN7TkPw5U54BSNh2nhMyBM6phinhjaLK9
         Dv9rcbkxYXiRPBYR9XWf/KK40HJc6gEcmRbVDd9nPPoqrL7hdxCbh2Lcth56tK1FG2Cz
         HxvbLH1PYcWRH20l8tzfpuNWvEr95awjQL8DFTz3B7ehWdpNYo/PT1dqDKJM/YR0w19M
         LZLS0l9D5NpO1cDd7e0NCF1Bk/YGcPiUm9gnowikUpOXAlKjJA6G3314o+v07PXks9BX
         QNmPpmEyIwO2/gvFD4Y6cXo56pze1ncr64XhwjadCK9ikOO6oKrraJ2zxOt1pO4Konfs
         i7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UIv7VSR1qWuO/v2ZJpqzpJWi1mJBnpbQ8X8B9JtI4ZE=;
        fh=yNy3T06FhV8t2stzzVNa9Y59/SQKJwIqY9lvOA81d+8=;
        b=mKb8WaC15tHf5o4CxDzS/7Twy+pzKfpW5Bn7mGCZM8PDZ8SQ+/n+BNOD1/hToOTpVB
         LZ3E4HYJ2ySRTwvxcyEDgMBxJnUUIv4F4T68MtKPhF/durOLwsO66oO0V35E4VnHzJa1
         vyej1iZl1vctyfbnhIJ6ElAC4IlAaqWZmzkOJL6HvlHeDMeMxR2SODgk8+HLZYHJ0OZS
         ErlndIo5bVQoRu1OwMx3l97trRUQxuYetleZMIeMn3kTq9DcDM0YAeVLfo8FbduWSmUV
         m46YKjtUlsdKNeNdBMPrLc8hMyHFbacvjHuPEtA6+tK89EKVsh7F+M419hSzaAL8FMOL
         Vzsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844729; x=1788449529; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIv7VSR1qWuO/v2ZJpqzpJWi1mJBnpbQ8X8B9JtI4ZE=;
        b=Ix2QlMo2aCHagueA2Hh1XX1FslIG9xVnD/5WBwwTxM/qR6UlLp8FOkyRvpkmrTeGDJ
         dszpZW2M7O3NOg9bDwo7XPX3/3jNe2OJMX3rn6VXhWKfqAy9HPCR4v4GwnooTksC5Xfc
         +0wVZTsL+PTiGyJOUWoWo5COzAtWmU5X6Jst6Ev7JX8OnOBmAR5HrZ4gZGa7cVw2huQb
         dun/we43BfCXrf5/sygdlE25Kc2f6oa3dQasnnBnH+4K/u3QaNS0wgAJ6khz/8QwT32z
         FKVFyZWMOTebbjRxvpWXbOZUPZEyC9OpyYTXWu4u0+g347ojWN6DiFfySHpEKgvcfrQf
         b0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844729; x=1788449529;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UIv7VSR1qWuO/v2ZJpqzpJWi1mJBnpbQ8X8B9JtI4ZE=;
        b=CLCgxoinT8TTI2hN6Qs4tWIVWOjbh1jX2WtK557Y6vaG8j0UXhUDhzXSaHtRkFoFBP
         52vW9sUhtrbVzKP/7xCiV3dCS+XZjNkxUWecVJe212Wq+M0zATPe+bQbAsteu+wTu/5D
         WJMAS5sUtiEl3Vd9Ex51h1Posrj7nZMJwtA2e6G6cstH6f1XjpsALeajQScn1lMf/6wW
         FYYVkf5FmT7JRFqP5EVnByYcS+dBg6JxntmRmtDyTsOjHOUxoUQ2L5++wHHwxMyegSgf
         W6Vg7OlCT/evMrW5fzkQPEHKOmpcGtX4LOnFIn9/EFuslMdLPOs/K1xSsgNbbscXLIk6
         oVMA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Wt62IJaUIgMwUHgA5h2yJkM6YvhUGaTL12M8rgcvCaOyZ8J+Txwr0xEHutJeKgTMAfa2cjo2OowoIvo=@vger.kernel.org
X-Gm-Message-State: AFuF++mYJQZtakbzThFGTJ/GK94dlqHe/vbN9ew6LrwvM8K2NYEhlLhP
	gRoA5dRcjHcjplzLpNpy3efbwrED+r9W5PmIyeuWpe69g05KIMRH4yEymf0DCpm/zm7LtRIzNXD
	gC9p46DFcRgwUWxppayxvPZ2/gr+2/1aT4h+l0l6I0oAEh9Q/cBW7
X-Gm-Gg: AR+sD10rUbxFYTAB2qWuDfLaXeca7lgxdoJV/yjVmxN5RKhjgptnwKxbKRUqa6iUcOa
	QMTEJ1fhzY7fGbyXbjY3qYEbTJs/JsZC9XDS1zzaJSq/V4woVzwTLI+eMLPsdpuxesvT3ViAYKR
	sUnYdUW8ImDYStk+7lImXfrgr+PSI2Fx1hXEadG7cvasDW5/PoPNnUJtnKSoZciMo+BjnxbR6f/
	KNIdUHGX28AKqQcri9GNICZ3vMqjHiu8+yU63DMtMnNoKbLhF2tMkSVftaf+CUHUaNFs2xdd/7p
	GCzaQF8ssz6r7Ajs4X+nZPaFWnrofGpZWqDTEG2wJr+TBOLsCCF4iCHmi0h/o8kzXtvb5gS6dW0
	PPJNO16B2KdmRwg==
X-Received: by 2002:a05:6402:280d:b0:6a5:def7:b872 with SMTP id
 4fb4d7f45d1cf-6a5df65b507mr15081475a12.9.1787844729501; Thu, 27 Aug 2026
 08:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826173901.2329068-2-tanmay.shah@amd.com>
In-Reply-To: <20260826173901.2329068-2-tanmay.shah@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 27 Aug 2026 09:31:57 -0600
X-Gm-Features: AcwNN1W_es1PGxYSzN0croBntB4Dm44YdKdLDhoQ3lXd14i2sPM4RZQ2S8ZcSo0
Message-ID: <CANLsYkyWg-SQ4o8AiaNeu4ALP=rrxmUd5OY9KDHNC91vPtHnKA@mail.gmail.com>
Subject: Re: [RESEND PATCH] remoteproc: xlnx: do not send new mailbox notification
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 11:39, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
> Only write a new message to the tx mbox queue if slot is available in
> the tx queue. If queue is full, then do not send new mbox notification.
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

We are finally closing the loop on this patchset.  I'll pick this up
when RC1 comes out next week.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index c685bb5fa62c..0e71edf8174c 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -381,7 +381,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>         int ret;
>
>         ipi = r5_core->ipi;
> -       if (!ipi)
> +       if (!ipi || !ipi->tx_chan)
> +               return;
> +
> +       if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
>                 return;
>
>         mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
>
> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> --
> 2.43.0
>
