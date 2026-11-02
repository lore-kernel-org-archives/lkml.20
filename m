Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663406;
	b=nMIE9/ruIVXALH1jHc7okhz7DB1hiCnKvOF4zLJwIsvJUpMSF7gkVAf7avV2vha/7djL
	 hrkx23XigM25Fi2FZr5hZF0WOV9sjTZVL7uzNR0qD8bf1Nk6GDfWt3CaR+To49Kl33TMK
	 NTirK8TPyqfUoRLyzkBhRMjnzTwUyPNp8waTjauIo2yWHYRazbul1qMx7AOSW6GmkIqE+
	 snm+XqBv63wuaXD9ObcXbJMnFW4a2Scvw26ocKroEx28h5lgwbqgmRDBff1g/aAnFt4/h
	 tKMCNqGWEnvmG2Jf8PcBkryudrJwCoFYXHqPnQTQ2sClA8hpiQSxD8sJfwlIt4aPjkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663406;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=x8AALonpJOO8+rMATsNHAKEXUmen6ctWIIDkyspP570=;
	b=RCFqm4353iNL9HnOr8vDe+f6ESr2xSsPYvF97y+XSWAHpvtbDWjV0TBCcnpa2lZmaR1c
	 g58kmPGAiHCsChto6GRxPxGDJa1lUnCzUqCaIFVdUeLatxtSuP7DGvFfxNnwwig0S77qV
	 KRrqpBX7bs0xem28WD+Zv4wNUMDP2f5oMeNFREXvXoPbnKZv0d4AmYfdE+QaLaaoAkZ6y
	 UL/OtN1S3iq4Xd8rrvnW7ZaDZYQSOV3vUBN3Dna+gQjyb6K7xuO8YehfPOktgcA/85UIw
	 Fb/DPOkSovgB1xpC0QwYT1/Vn+JkZ0gVQpz12qB8alPBUlxFS9O7R9p27vVBHY0c0Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ycstuff.net;
	spf=pass smtp.mailfrom=ycstuff.net;
	dkim=pass header.d=ycstuff.net header.i=@ycstuff.net header.a=rsa-sha256 header.s=protonmail header.b=eo0JbNgh;
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287B606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3287B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ycstuff.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycstuff.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ycstuff.net header.i=@ycstuff.net header.a=rsa-sha256 header.s=protonmail header.b=eo0JbNgh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ycstuff.net;
	s=protonmail; t=1793663403; x=1793922603;
	bh=x8AALonpJOO8+rMATsNHAKEXUmen6ctWIIDkyspP570=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eo0JbNghHZPef34gDihFNsLw+V9HiX4ilI6DxjetMg926l4I2vzUjPQknDqFV+pZA
	 m+C9w7ohY8/Eu+pMX2kJ3IXL8A5S0mtD0FT6+Ib0dTiPlkiTJU6OSX9FfCuKllcZK9
	 Ft0gA/JBV6/HlUBpYn4ZQmWeEQx7kmdNBbNl20Y9CsA/O15wEwWQ26iS+t34cTwVaI
	 mFnr3IwpU6bIUKgvKd177v4ABod6kZJTt40UlQFqksmCj+rgxsOhM3cthpvYAxeWFj
	 UNFLKUDGajzvvosi9rGQZfmPvSDUYzgu7XafeIZrFlGPH9zQ6nnL9jibYfCQG+C1Ku
	 uHOEOm/GOsyMg==
Date: Mon, 02 Nov 2026 23:50:01 +0000
To: jikos@kernel.org, bentiss@kernel.org
From: Yicong Hui <yicong@ycstuff.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, yiconghui@gmail.com, Yicong Hui <yicong@ycstuff.net>
Subject: Re: [PATCH] HID: magicmouse: add pressurepad property to Apple Magic Trackpad 2
Message-ID: <VleBy-95RcfIfBBZyWiOXi2lAJZ0riUCnWLPZWfNqnBJecUSVDGNl0_eiMQwRA1BlJ2mKCB2q2UYMgLAp1YVWXUznLNInUATgpZCLoiLlIc=@ycstuff.net>
In-Reply-To: <20261001000659.21747-1-yicong@ycstuff.net>
References: <20261001000659.21747-1-yicong@ycstuff.net>
Feedback-ID: 215075056:user:proton
X-Pm-Message-ID: a8aaba40ffb00fc1044dfe84191c5ef90a615045
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, 30 September 2026 at 17:07, Yicong Hui <yicong@ycstuff.net> w=
rote:

> Userspace programs like libinput will take the pressure value reported
> by trackpads, and use it as a proxy for contact size unless the
> INPUT_PROP_PRESSUREPAD property is set, causing libinput to freeze the
> touch input when pressing too hard.
>
> Set the INPUT_PROP_PRESSUREPAD property for the Apple Magic Trackpad
> 2 indicating that it is a pressurepad reporting pressure measured
> as a real force, as specified in commit ae8966b7b5bd ("Input: rename
> INPUT_PROP_HAPTIC_TOUCHPAD to INPUT_PROP_PRESSUREPAD"), and set the
> INPUT_MT_TOTAL_FORCE bit to allow reporting of the total force across
> all contacts.
>
> Signed-off-by: Yicong Hui <yicong@ycstuff.net>
> ---
>  drivers/hid/hid-magicmouse.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index d637c0477379..017e3805557f 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -620,10 +620,11 @@ static int magicmouse_setup_input(struct input_dev =
*input, struct hid_device *hd
>  =09=09__clear_bit(BTN_MIDDLE, input->keybit);
>  =09=09__set_bit(BTN_MOUSE, input->keybit);
>  =09=09__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
> +=09=09__set_bit(INPUT_PROP_PRESSUREPAD, input->propbit);
>  =09=09__set_bit(BTN_TOOL_FINGER, input->keybit);
>
>  =09=09mt_flags =3D INPUT_MT_POINTER | INPUT_MT_DROP_UNUSED |
> -=09=09=09=09INPUT_MT_TRACK;
> +=09=09=09=09INPUT_MT_TRACK | INPUT_MT_TOTAL_FORCE;
>  =09} else { /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
>  =09=09/* input->keybit is initialized with incorrect button info
>  =09=09 * for Magic Trackpad. There really is only one physical
> --
> 2.55.0
>
>

Hi! Is there any progress or feedback on this patch?

Thanks!
