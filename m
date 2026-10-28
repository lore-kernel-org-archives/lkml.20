Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793159130;
	b=Uw8HW3I2rjc1pmP7v4/p3O4CouwM0ihYUjjZFvASa75dAFEo6UJJiNBr3gC7wBMfgBxw
	 wrMZVO218OeuNVWr1VUDcYPYtSePokU+acP8+LdpBDRZnjFxGAwT/nAdrc02VS9eoA+M4
	 l98xeouHvnEKm7YeaiadJENFn2ggKF/zRDkzQvUbr2o+r1NDxlOsc2NghL8iHc72H/9/W
	 qupVe/pp3q3q3XUxhop2C4wLVH+cmJxjacCtl/PYQrYEUVHxat49OJZ+YilUo37wxM6t6
	 Rk0vNrEnPhnh/53b1AsACfGd4ZKeYKL59hcReq/kK12PZhsNm5iJ4Ka0xb7hJvWa5iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
	b=3ndxpWK1s+1Si1q67EAqI0vHQtqzzE1Dd+ezOKSwS/6WttwX96wxivysGGAMIlz3WdEK
	 BXab6VPG0jKl+dB4BkUXM2bj8xL6QvA1PKwL6cVc7MCJRmZFItrH0rBncUM3m6dm4KyAX
	 PUCqIbN1jZmfr0S7Hyj5u/1sm8qN33Lj10ussHaexYdhQKkKEDLzwHrgpm0PbxlYBj3Qg
	 QuKYWkKKrsSx4so5/GetVFXOpDO4z1mBEDWXogxSVag1Y6dndDD8xkQ+7Wp1sLA1VxkbI
	 qpd/Gv0sewK/RbQmET73n6ssOLO4jwg+5AnSxB34t8qObwy7d1VW7NO9eR6OgNNRGhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H5vlzOq8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H5vlzOq8
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0d91601bdso15126397b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793159128; cv=none;
        d=google.com; s=arc-20260327;
        b=K7BMCUEifv5m7uVanTKygROxctnybK0QJddhmB/f51JCqDKsEk5keyoLcq9ud85viz
         cFeT9o8wl6iYZ0sDxYKpiDrwX3SmUPoUN79MS+nn4eS5ReOvoSNECZJ39ASNmJXWXogs
         1qssSy3/jPBAmpJCbYExYDO99PHOYTuEYxaBrhClj9FECD3EDmBfnWUUqchDD6q9ovjd
         ewOTz0p5QLtJwpE27BO9zV0EypKt2K7MpM8BIvh/vdIwlYmiEe9l2t6pyQ98buaQq01U
         Ud7XQ187TxXrwjgi+NkC6TqJmtaf1FURqDQO06TK/98vgMyxfsBw2rggg453itw2QM9q
         xEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        fh=/cwCZPdMp0/u6IJV11Azmqn67JrCBElUlIY0pE9WMOk=;
        b=Z/5vBt4tNK/krSuSS7CnDJxDkacC5gQTWzvHOiRkr/rq2pIDXOoQ0hwQu732sRkagE
         Sl6vDTi2JlQaaCu4L9JO/6mX5ToqtctvKyeKHf+uUWVXcr1qEIGrk3V4Aq7ciEsmyIdD
         FeCQ1ineKSBYQudDU9gz804s7klRgaDpEuauV2Q5vIIRoLpqmYm5/WFMET/W9T7RNB2R
         2SaA+0I6R+j7p84cbmyC0IJa8EkDI+QZdfJRMvDpj5wubU8vj/AJ5oK3J2scSVz8HYsQ
         0efuqCThvGhfkZigQTUdXzDWBwf3QE4eFlngv1zRNKlpF+uxv5damO63iKjyxSFjH3rc
         DWYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793159128; x=1793763928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=H5vlzOq86fPpSki1zWRFOTb4zgk+97w08kNBOW/3IqCdyax/WWeKa2xp/gVT6oLv9/
         Db7KrNBwf+GxM2kv3Fze1Em56xazErYJyXdagscS83wrvmyp3od+t/Ma2zquSH8xEcQ4
         ddZUme6Sni+Bd6/W23Lq595h+TGbVnhmbScmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159128; x=1793763928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=wM6XOnDSAQ550f6hE+BG/3yoRxafbp079yS1Hb70v6CUedIffDjJnwVlu1z+MgNYJ6
         SGWiNKSgARy/jri/UBu8LXDtQK0uvE8uaUvW3adVFKBdliCU9CFSzkc2wEoWyszQPb3r
         i6UZv+13rtS1vJ5aFmOwx5l4rwaybLNruwglA/V2td7JtquO9RgvLWMDvVPyRzK1/sNp
         Ah0WdJRjA3z3PtvgtJDWcWRFUNjLvj7RMtoQ29CZghb9AhlBuDAlaZ1hsc90aNItcEIr
         CSvGw0qohoOi4rfHJIvQnbw0s7jDV6l006m66VdrdTgkfwVPR7ANyYuLZGvbBrH40hzB
         KsIg==
X-Forwarded-Encrypted: i=1; AKwUvBxqE9CgKAkGtTpNALclRLMqpW09ZnP9gV8XVN+l/Mjxvra+YSceA7iPw1jtO2qooYI677ryBalyNDE1sWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL96pePgczpZeRi2Ts1t/a9M1zFyM4TvAiHplvhnBQJ/FHNGc2X
	zWWY7xvhIdOtJ339Sz+H3enA8FkgCyh0XDtcjECjEpmLrr1OqjQNoIEcIGO0RtdhhnRypMrXHlL
	BuV5FC2vwiq7qU8pB5JjyWUQw24oixqaO8IH+58uX
X-Gm-Gg: AYBFou0NnQH+Yemo6qyTZsoxX1VVpnCrI9C9ghGNrCx8aGqwyxFAi+0BbWNr1ztwWs5
	JgCIQk2tGCLzOmqSbYdg1QJpJ51Pfv9GbWTZ1HpC5tXIwvoAOeIxa8YQ2y1yQ70uiyohHq/hdyh
	6juqWSKIQnRx4SxvNXpT1miDpUTDHiIxJO223l7U0SgZbS/scvX/py+QOzlq3bYJQIuXfJX+nRM
	bYfiwmFu+Pfrn2FMGsZCREAGn58p2pB2E9xIiuqkrWqtNanse+8GoPoUDOQAQ90VcRN++eZ6gYW
	q3dEkegDzNwbua9DQPC9kk/tsFoeYs0r15kdmvOHFu7VrujJgcmH7SvVAr5AVPNrrgoYInbiio9
	UjguncnkC6xzR7duhGf8iK58XhqEFdTQlLki/61mSD3rIYltCafdskyhCi/2MOOSvNZI=
X-Received: by 2002:a05:690c:d86:b0:8b0:a5d3:71c1 with SMTP id
 00721157ae682-8b19caaac51mr35421007b3.37.1793159128558; Tue, 27 Oct 2026
 20:45:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-25-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-25-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 11:45:17 +0800
X-Gm-Features: AclHuK_qoKOPS0Bqly0_GwH5QpE5HmWgWi0Q-7IU47_qa8u_hGoz7lpTqegB0HI
Message-ID: <CAGXv+5FWZQ1zM=mZm22qcqU86QO2oXQs0wtnGn1H9TrdFvfW1A@mail.gmail.com>
Subject: Re: [PATCH v2 24/27] mfd: mt6397: Manage IRQ domain lifecycle with devres
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() and mt6358_irq_init() create chip->irq_domain with
> irq_domain_create_linear() before registering the parent interrupt via
> devm_request_threaded_irq().  If devm_mfd_add_devices() fails in
> mt6397_probe(), irq_domain_remove() is called before devres frees the
> threaded IRQ and without disposing child IRQ mappings, allowing an
> in-flight interrupt handler or late IRQ lookup to dereference the
> removed domain.  Conversely, when the driver is unbound, the IRQ
> mappings and domain are never removed at all.
>
> Register a devres action immediately after irq_domain_create_linear() to
> dispose all mapped hardware interrupts and remove chip->irq_domain so
> that the domain is torn down after child MFD devices and the managed IRQ
> handler have been released on both probe failure and unbind.
>
> Fixes: 6df8dd5c185b ("mfd: Add support for the MediaTek MT6397 PMIC")
> Closes: https://sashiko.dev/#/bug/linux-b296fbe4-6e83-40c0-91c7-2c31e8d22=
6d0
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
