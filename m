Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582629;
	b=SMvk1/RWhpmFfvTkK5+VX3/646QvxrXyQhcNH90OvsIZjkTTENKCu2WpAtgu/ETFVz4Y
	 kIFCJSzM75lNRVpXxbAsZv7TOievMwMt1YueQU4Pld2qdvkjW3G1q0IGGgb9gCTI/hGHN
	 IfpaEksX/EDeSZLYWBJNZmGtbSRO/dhZIdG3j6OksBYIaodClyJNM42p4nE3+S8LCA7Ys
	 4O4JFbRGtCNbC/Li5cEhtxdY/7RsM5IYmxgY3jQe/GHQ8ExbMCKzuTU/JyzX1tWLXlwRx
	 fwEISfEcHY2VFvY7nouhoAAHCrD02KsfJl7iVBpgU5gDMH7wTUevOmS4n6YCijCRx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
	b=vWrNqZFFZsvrlRESpAVAew5eG9g/iP6Srffvak/oP6kVPcmmxpFtU8xehWdvb0YemMaA
	 GduXiAkbPZ7WjKyINHQL/RyGglHdiLNxY4CRBK7V83SUH+09XkEkIJDNqZICvJOxcEfwf
	 xqd08nrIiy7Dgr31jlUNweQ9y5R/lMttv6hFn1VhlyJsM4m0OtGDt1Aq+AO5JVpBjZiIG
	 Y7IYhlSuDJSvPEANiF2odOabf94S5cjl+fLtc7AuNgj7gdKJUeWrtGWfWioWPT87PLqyG
	 tCjpL/RaCJamzi5Jt6vpgtRcspxk74JR8qeiK2jMnFhW6uD/Gtjwoir6Kq9X8Fb5ssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="aI9uD/VL";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1AF606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1AF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aI9uD/VL
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4910b863b84so1295423f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794582627; x=1795187427; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=aI9uD/VL3MFl/YTVFubfpHc2gfhbaGha11xUKjpX78I3nhL8QQ0L33UQ8NLfTFQChN
         /akBeYMMP8N+/hOod74W5o2ZulzkVlbzN6CJZrYgpRqpm5n3Y7kQ6otNETxOr/WI5B5E
         XSIuCLVEY+Q1FevbN8CS6dDtFGysIJiv3tiXK0cvRDnJlM9Cmt7uS99Y6rm34ynNlaNZ
         G+MPdTtTqM6XPsWU/UoVDtkFP6lDXbGCLcN4qXfHh23sEyUei8IJoY3YOfc2jA4uv8AP
         IVGDcfvEUaIookJwPZ3uFWqxuwVnEaRdNZPg+bt3YdWyFIObxT2Wa9L7lVnEpE0Gjs9y
         AQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582627; x=1795187427;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=RN5xGWqGXN90Aat5zZvFdJIpMyBuw177Ttw+kDnK5ppdxIaBBclhgCSOa29gzSmA28
         DUV+nau6UmBk/EgkG0ZaKMvptvq0+7ith7g1UgYc/kr4o4SUAliD+DoXsJvOGpS2lpq3
         5g4FQnxlGk23yOssaVygTaMOUXBSVN3iKbm91aqma0h1o5eezvgFeJrOkqqOsbJaP1Az
         u5u+FQPGP85sy/lx1gMKRWr00HgYladqVWsX2OJeg7YRm7ov86mSA7oUT68M/BlnjplB
         xOXcmUXj4Vg6R3c8S+JcZ2UiA5hdXHhqv/O5ZG6/I4W+ib/ZB77PJA7rt7LWtLIqrtpp
         kydA==
X-Forwarded-Encrypted: i=1; AL+hErEelj2GDP5ngrMvGOJKszOKhEg7QD2XX88q1qcO9o1v0c/f4HuG0AvpnsbMrI1bpbevM9A2FPmdIxmF44o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oIx1VQrJ5RCAth5jr9wkMu1lqnn/DsIViSEvOSziNZFXoaMDk
	7QMgreVffBXGG45k95iW48lhXijj3t1JgmYPJ4CfM0YkrD/O7fBhfR4rDqdm42ceBsc=
X-Gm-Gg: AYBFou3/ddgeJ8ycNbC2DjOD/Am7FeWimlaW8EjeqsMISlTl/+OrtZJKwZM8IJNhIHH
	zTVnk0icmRikfWZUqgl49Ikl/ZtzJewUPz6mLmo5BwRlnYKeETKhV7f1xLPym+xq+AhUO+gLtVx
	QnXylVtAMtGqGRU8HpaRlkd4OZWqWCOq5rOCMirs2TCbfmRHhIebsVXwhrmFIyGH/88WDSVAN9Q
	10WuSKltHZd8zHsG/72QpLDAfr3yEnyIVP8+X7u2Fp2yIQjLvSdb5WoKL1kRY665ggqwyzkP2O1
	5y8piMGgwfiheiCcQ3AYSsuXyD+MoqzaXN+nVsE8kNggf+Ho2mU3OaeOI/LYFC2sFkkz225CtQc
	Dwv82QmaDUyGH+kTXg3ME+W9CeMafTFgiSRoONGkyBArv+WYDfDihSrVgxeEYOug8ocW+T35J5C
	8rU/5n2GJZVtL67GaOjMa6vlYTfTQsCUmCcUAR9P+qfdVcahJBIiCRYACn0+wf/HjJgt7okcUeh
	jjUACEkkhWs2RHsbRxbnCkiscXekBhhRXw1ovGiOo3KT98zLdLqjb0TA0F6qHIc58XwJAqzRxeN
	9pJRYh97zvVohoJgd6Pwd4K1VKPYgpPi5aK45PNP+pPBm0+g
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-49b01cf341fmr9163986f8f.13.1794582627273;
        Fri, 13 Nov 2026 07:10:27 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm5879282f8f.56.2026.11.13.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:10:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Valerio
 Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock
 from mutex to spinlock
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
Date: Fri, 13 Nov 2026 16:10:26 +0100
Message-ID: <1jzevczs0t.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 11 nov. 2026 at 11:12, Valerio Setti <vsetti@baylibre.com> wrote:

> Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
> Sashiko [1] while reviewing the series adding I2S input support for
> Amlogic GX SoCs [2].
> [2] depends on patch 1 to address Sashiko's comment.
>
> Patch 2 adds a hardening check suggested by Martin while reviewing v1.
>
> [1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
> [2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
