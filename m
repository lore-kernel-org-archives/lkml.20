Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9C42AF86
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353914; cv=none; b=EMR0DWy/V4Uox/SVQUhusKpZag2HOPxyn0OymAcQMiMgHpFpJ6aYPstXlMLr2Kd6h5g1KAt2n+Yhsl3K2m1XUgsSdWAfNcUw2YeJT8og5vC4cAEoX4vZIrXPtG4Zd7QLm2E+D5KLYp1KEmxmTK6asJPC6jLi0Z+1w2gIJg3GgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353914; c=relaxed/simple;
	bh=umVqKIohmkT4iOGNo/tKDzgfluTd945fREkvHl4zJnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enDv8yQccL+KX9i+UKxc3l7gmv58tspUaPoTpfijo6Y6WMbpnrJM8iM9zH89zSKqhp0btAJv3t2bTW378yHE5Oopcq8DCGx7XlqHmgj3El4h+L10lCfA0MECtiG83T1EL/YQL5Ct0viarSSoruZTYb1mMSV5xDeVCNzTnd9VS48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAvxDkqU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAvxDkqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8AD1F00ADE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788353911;
	bh=Wlml6ZbJTx2/0zF5rhvA3HzrKGIPZmpTno210GiX85k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mAvxDkqUROIthEftdJ9QkLt2PDX9PYliG+1ivbgsDCRZTgzVdE2hOuwvRfmttzifv
	 NKCMXQ8blBXMBz+VXKnM8wS36rQ6qbHBt/wuSGGtdegpl5680Cs8Eu3vbHw5QEJLOV
	 tIQFQOU1qp1t+/IyMMqivfUg6SautXeJ+fvK++Y6+iCVq7WU1yOKakNgwd3IMGdRUX
	 knWKEtMRMsfJ6geWCfjHOZRWeSdjed54k2rXEbNfLsThcGzfmGbZY49qoAZpD98ZAO
	 +tpAyIgqjNYVTVNKIbuIATlF5vm3OulJr2SJDY4a9oYBZ6N589WT541yva9lArLdQo
	 MUjn0xgbOwa9A==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1313960e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxULOiOW2zaQO4uIAvc26goJIrR/CWvn6qR9yeQ+xTUkFKzRt1MaeDPWXfAlS2vkU06RFQCI9kLJJbzjbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ko+jakzof96dLx3uOHr2XBlEo2wETZqsWFFU+/yRVLNuee1G66
	+x+svExsnk0BCuPvhjO3JFRUfnlmVSMSN/rnFIAzoRymIP1mNI1ugag6g6/nHvU/X1YrLGrU3ZK
	oUFjsRGTFbQJQtTtEZOwCDIy59v5qXuw=
X-Received: by 2002:a05:6512:ac6:b0:5b2:c068:3530 with SMTP id
 2adb3069b0e04-5b60c30a181mr881695e87.13.1788353910042; Wed, 02 Sep 2026
 05:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com> <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 2 Sep 2026 14:58:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
X-Gm-Features: AcwNN1UCFhm1aHVlm-BJzhSf8J2NeZK15MsuFS_3j_uqyeamxc-SEKtsEnY_q0U
Message-ID: <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

thanks for your patch!

On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.com> wr=
ote:

> The list of allowed pinconf properties already includes input-enable,
> but has omitted input-disable.
>
> Both refer to the same hardware property, setting and clearing input-enab=
le.
>
> Add input-disable to the list.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
(...)
> +        input-disable: true

The Subject of this patch is  "Allow input-enable pinconf".

But what you are doing is allowing input-disable.

With the subject fixed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
