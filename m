Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF454B1C6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958244; cv=none; b=ZFUVqilE3RXHvs9fvUb6OCSj58XQO+Yggq+WTjNyTMtMXRlN9ag99QQyx3YgZhgzZE6c7bCUsZHP35OmYnNHHnkBQ6tbEXnmdx+5lHth4zMlP5o5Zya05fhcYERBcTyTk1OcmoIQ8okFP3wbUjQe67zvh5CkOD53iY8qV7IrGjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958244; c=relaxed/simple;
	bh=Y7xQ5kj07/NhPItFH9EAGNMwg0Qh5gNSAHX3bpdW4BE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qzl9umKuNHT3c/V37+rnvDWkR0S15tibwxOAjb7zyuCMTVuddR84i8E1ZPLp/BhggfwQluRMbrLnDbl9C+rLnMIkOQvGNi/7mseTYeNjcGioEVRM6qMs8akqQcRdG/wFCn6IFCtnIhSLSVV4tK/p3SnP9pXBtAbb+ZGoU/G7Wo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDmO2d5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDmO2d5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B871F00A3E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788958243;
	bh=Y7xQ5kj07/NhPItFH9EAGNMwg0Qh5gNSAHX3bpdW4BE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HDmO2d5/0DmZVwk3WrmNcsoK/T39YVKjKXASoGwBuC2ynrSGDSVBTib2NNEgHIn9x
	 ER0JBsYzk3nin57dDPPWRH5mvVL/ifJsc18kvsH9aB1vaa/IbbE5VJIg0iZoYUIRFc
	 eJqqVK/ZxOKjfMONfMvRKZkFWPYyUB4lr/l/VgPoCcwa5SW/9pjoLK72POcJG4om4R
	 dphR8sjdY2FAi5re2jHh+giDTSUTGc9wQphohh1PSqemReImdO7dUxEs1hq17Lxz0G
	 HVRJmVHyMN96UyLSYezwlo7qtfhgtc6oCihwc2mRzO+VRNKTRi03bhN7H7EUHsIHcb
	 tsMdlp2eY8f9Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8996d65a3so101069e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwalAFiLpHd/zZPq22aj8ec9Rq79MnJGRElys+mlp5yi0PonhlCLu5r13mcbiJL5zvptKkYJLdeRofVYYg=@vger.kernel.org
X-Gm-Message-State: AFuF++keovu68VeeRmgfWCfSHjjTmTRGk819ys7NaTmKN8tDLedEo48y
	csKBUSi3WA/b5nt4jSlOdDsaZkK4eRYl/I0EcPLw6znqmJ0tKrKKgl3Kzg4K8teTh+JuWpdHHFg
	zu7+X3MHo0Y5oM3h4zYiTeGbae4D+LSM5WtN7Fw1hyQ==
X-Received: by 2002:a05:6512:15a1:b0:5b6:4ae:8c03 with SMTP id
 2adb3069b0e04-5b61706b263mr6165808e87.30.1788958241800; Wed, 09 Sep 2026
 05:50:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 05:50:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 05:50:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
Date: Wed, 9 Sep 2026 05:50:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeytEdKSRK2XZm+PrX8X_X__dWzxqmDDY54D_oigf9_Qg@mail.gmail.com>
X-Gm-Features: AcwNN1Xni9hM30thqVh6rPytkEi2Gw2KWmieTj4_QQuyfVVJ91FjJPZqeoNRyFc
Message-ID: <CAMRc=MeytEdKSRK2XZm+PrX8X_X__dWzxqmDDY54D_oigf9_Qg@mail.gmail.com>
Subject: Re: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct gpio_chip::set_config
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 20:56:58 +0200, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> said:
> Wire up struct gpio_chip::set_config to allow GPIO settings via pinctrl.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
