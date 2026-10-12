Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2D3BF68D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831447; cv=none; b=qR0l9KOIUtLR7RgqZvQBZ2lopl/BiY9imkQWheTbR/Tz3JwAJwBaJRDYsBFZzC49uTWl6ofO8TMgZctPMu2m9IwifebHMUbyk1oEn822BOUEqiio3ipyp/AMu4xQS/3XcXySupCNKmr6fKBBiizwItUNYyisDyt+LZQQTBL6bcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831447; c=relaxed/simple;
	bh=F8CkSS6IWx1ghWlHdt+L/gsrsDwzuUfdc+7urWYp4M8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=GDorlJEfnkPovQijMMbVVj8qo6LMv+BszTayJ5sc9nyHEsiw4q4Xa+xNky7V3TCNIQpQ+9WocdbPGxKYhkiVp3IgRzkKfqyy6BqaNeLxiaHSi2VBOC9BhNbRT4f1vaG8jKkn/iNhyFT00w8ubouGiN0gd8gtcMzIlEKg0dYLr9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKhGXCnn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKhGXCnn"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e5e090746so195999066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831443; x=1792436243; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aq6FGDCLIMEaFm+sGEB7AUNjwxZkgWT2FW+F+6Aa/HU=;
        b=nKhGXCnnR+SCxJkn/6FnRpU+hNmHiP43PDV5GC5JPClqmpM791+o9Orvl/JfZfDogN
         wh7pZAcfuSwFDhZljDQjlzGOEHCpAs6B/xU6zBpLBcBSV9XxMY4Ern+aiDHmhRjCQpG3
         /MWP8peJmq985Vyg96H+mTiistDfgyF4sZ6YClbTlt08OaGyJblOa7fYpfqcOBwtVFkN
         jFhW8Z3m/zP30o5jztUI9qm6Y8Ix9BW55yHloffa0BY8CABAmdbPXXc5xmLYkw8oCsT6
         PPRqKXibTqZOQDeAaN++VZK+P7qU194wyg+2WbBxm4eLJhZMVwIul5JHQaGHemNpASVc
         P6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831443; x=1792436243;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aq6FGDCLIMEaFm+sGEB7AUNjwxZkgWT2FW+F+6Aa/HU=;
        b=jFIhCUxDiiMLVDhCBq7XhC7Q9XrJE1y9lCy9fy79bpSguNF0AUxvlImNvkKRxvVpkG
         6IiH7+TGhczGzlZjrjYZZ7VS/nKenDS//c9gJhJRa+i73+OGU6GbXUXQ4HdffAz+5Kic
         lpptFtwxV0xvGX8Z/Wz75tL6PP+ySlENKbwAYCf0IlIeAXOPTLFxYGQwvKTNaqE2e8QF
         lKnpbF0V1juXLqiVLm+8nTY8CN7leQGprWECtUg3lmiLqHNLdfCvn/Bs+cf2QChsPE9L
         EvrufJKc9Fk7ZhAbhLYD83VJQRxKErTZw8CI06f82hZHcUbHB1pvwIMWF7wFSUSQPRbb
         P4Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwOoXaLqskO+3m7WNRazljrRKIHnyXm1HzjY3dJ7KcpgU8faEcO397oBCV+7gjklj8Ih+NMKcz5YEZeSPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9J8AAcqmAXJ3uFVHNGtK+Qb87/zQgvG50TB7FXZFOtrxjg5sU
	+sSTU0bYBEx/jf1QGwjWynMaMR5Yi9DPJNazT9MgKWM2FbCY8CbjGcL5
X-Gm-Gg: AYBFou2uha2p5SKIaZkfiNUMHnWi1vqn4IWUyuI+rL457zIaCvVCWp3R4yDY6koez7a
	CFRxNl732xfFZZMaNMfZhnBrGYY15Nc78DodakjerPh8ezwX9VZXuqrozbu+tCYRuCYg8+HUXzc
	u/0IjujO85Oaq22wTA4Y4Qwf3cnrKhaLcb9HbA7XsV1m/1SlgtRXmDTyevPxP9ZRODX7JWQc/Ml
	IvE6KwRjeYmLSAPJmDwsaygGC0v3oMN/aM7PbBNbHPVy+/fxuc7bu7igQRMUoToGCVtoyZDp2rl
	f0q/jMYGExI1Z6wSb3PFj0Ir9AyI8x6pjGHqjG1eu3POoRBXnviN/KlLnpvrMGDcLmlo+x98C6a
	GB7CXHfGxT4kEXZN6l4T+vMbNr5Wt4z9tKmnCdc9+mvWbKmUGoO0w5Hl/udCPJFc7vTZN6M4Mqb
	VTV5TJ5mcGHmty2OtmKOIVXhekCSgUI0NZS3mrSkjUdZ/kZC9g9DRVd1xsl/fgkbz4qg==
X-Received: by 2002:a17:907:6095:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c34c5e82123mr410354566b.20.1791831442493;
        Mon, 12 Oct 2026 11:57:22 -0700 (PDT)
Received: from localhost ([46.205.201.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9af103csm484502566b.87.2026.10.12.11.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 20:57:20 +0200
Message-Id: <DM338G5EE7D2.2WBOX8VFA3076@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] Input: hynitron-cst816x: release gesture keys
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <5312d67200e3251b2be08aef0a726d50d94fadde.1791233147.git.daniel@makrotopia.org>
In-Reply-To: <5312d67200e3251b2be08aef0a726d50d94fadde.1791233147.git.daniel@makrotopia.org>

On Mon Oct 5, 2026 at 11:11 PM CEST, Daniel Golle wrote:
> The gesture key is reported with the value of the touch flag, so it
> stays pressed once the controller stops reporting the gesture code
> while the finger is still down. Report the press on its own and
> release the keys the input core still holds down on the first report
> that carries no gesture code. Report a key only for the gesture codes
> the binding names: the controller also sends codes such as single
> click, and the index fallback aliased those onto the long-press
> keycode. Keycodes above KEY_MAX are rejected, as that release looks
> the key state up in the input core's key bitmap.
>
> Fixes: c87a819bec86 ("Input: add driver for Hynitron CST816x series")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4:
> - map only the documented gesture codes to keys, as single click
>   aliased onto the long-press keycode (Oleh Kuzhylnyi)
> - read each keycode once in the release loop, so the key it tests is
>   the key it releases (Sashiko AI review)
> v2:
> - reject keycodes above KEY_MAX and publish keycodemax only once the
>   whole array validates (Sashiko AI review)
>
>  drivers/input/touchscreen/hynitron-cst816x.c | 87 +++++++++++++-------
>  1 file changed, 55 insertions(+), 32 deletions(-)
>

Tested on Raspberry Pi 4B with CST816S panel.
Reported coordinates and gestures are valid.

Thank you!

Tested-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
