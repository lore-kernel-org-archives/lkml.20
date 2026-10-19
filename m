Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426530;
	b=YAiQl/CATEZj9E7Cx2wl+OZ9l149jq0s4wu8lSrgUMEh4F6pbXeNAsa3WTLtC5KdivVN
	 1jSQs1LwAwoBRXjaTp7IBwWnjZDsR8+SwRJps2vw62Snbl7IYbJXBHJpcrKMleIPLY7Bm
	 cnbQ/wA44+vz+IjdyeOAkxsNf0bySrzYcPNeToJnyVUcyOPUhgWNBon4+JNw4vcs90VkH
	 KKOx6ia57m+qQFogECxH7ge+S5qOOgNkoUjI4imf4mFxgJRqBMPRYygtEAhqgZfxie2KM
	 fqKafAj3jakFiBrXMNoVXr11u0VWz8MGtVFh4pkR/m1AfXTlddJHIZK7X4EQCd+EMhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
	b=Z5MM8r26tKQYTzGYLNJ6yv5NPhZWnNIEZsRzxa069vLbKGw3X2dOeQFGNXTeq/ItwdU2
	 LgbXgIsypX8craZfukbSUNuGnRJZh3zX5kamI3nLYfF0JCfwNP115emJh5YP3HpXSbgRs
	 7yVzaRWfgALySBV7qVLRDKnKf/3o3M1z43ehUO1OlpZMK12aL5/4s+oz676sBJUsU7/rI
	 gjO+o/qhaDLeGdpxIr3bDlhVWSrGxy3Da5jdrlNT1zlA0ET7y5M32hKREe9Cu8zRlksek
	 EyVkOjhW4M1iESZQz4vWjb76+UmRITw525Ol2ztFJahvVmdTuekkqGCAa7c222YZgJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TOeFQ6/Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDAC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDAC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TOeFQ6/Q
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so30275001fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426528; cv=none;
        d=google.com; s=arc-20260327;
        b=ADmBp9IT1MWcDGTETEzFAz111AU9MU3M5fy7u9+52n8v8m8xNQG6YQ3VDgIvuBgy0+
         CVkqEHW4kJDAh0tOzidNkBPnLAOcxRNyi71aOyclApZbLTska/BlU9tdX0aJlgMhIPDU
         eoQOyDr7alik8/ijI76UkcFjYuVKZlOPxCbrl+NaSTo8VkaoBg9bHM12q//38XM2V8UG
         wLGJ4uVCnvLnkr5WPps+3hymA2MLKkzUZxDXOVTN3K3S6B9kIN4xXWs+6NxEMuVQwgEM
         cPjdeIYFzZQcQ9bXvJcQ9NCHXgqpwnEHXy2JqoK+8Dpq8IM0Psk/K6q3A+rem3Y7apIj
         +aIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
        fh=8sN1q2K3f2TTxAw4cjJxV1MEr0flaTA5uVdgV39/PIU=;
        b=OVeafROXjA86s1QP8DCKflQe3R7DtOQ37EahTOsSZ1wplfApQSvASpdwA0CL8fmhqy
         BdXxAkuG2m0TML5wdGmhGgUFOkyt9BepBJWSSOLLVhd9RLMIyeUGgtTHEa1j4OK3o18q
         m3DxCpmU7EGDQn0CE5CW1TTALvgNnENFBkZt670jrm4A3pijI3TeV+b5Qa3/5WTZvMIF
         RjQRBZYWyny5I30kXRScyPGMG38XsrxdEeIslJAccwIgk6nIjL12f0ub70U1e5cukXJt
         nHEa+qLJL7pGX+X069vHKzTq2AfiwdTiuct2gMOXArukjqZiqtImxJF9I5WexAB6Lp9y
         su+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426528; x=1793031328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
        b=TOeFQ6/QJpeBWUEPZkRvr+E9VSWcCyKCgCzjIrhc/wilmdHJzIX0lQYKxsDx5aUpEB
         IIKnAnIxxyD5WpzNgM+P5aQO69OEbk/QlYdScieuEgbARzUeAxNY9D87HP8doYoFMIcj
         WZ7GCdAaXOVTnpUv5yJX87AWWXTmNPo2So8avzr3TZRMgby6gWutUKfM9essXp96YDzp
         DQdJDECXXVw9uSArAEEK5SdyEEl9x+Xy4RZpL2LF0nAYcmU39j2KjkMcYU2SvYrfoVeL
         CeCutMLAEGdwk8UFJOMpT3UiXrZpvnB/f5rjaDK0eGUJAPjvEvlP0i/dhnx2R2Pnv0hf
         gUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426528; x=1793031328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
        b=oTMQluwPD22dfxkJ+y9gL8WRHBCCGCTRUIGG7Ks6WHsnPdWgIZgJYwgZmsLN7c2Ahv
         ROFmdcivmpXtfz2/gBFYz3ohZ1oy20GcFI7wK4Ka58nvXm09TCLDMjYepy6NN5NygdYD
         osHhF2ERFZkq/FSYD6UNrqpk1iMUVcjo+LUrQbzQNw1F7nP3qBDxBMLB20zk9eCLFP9Q
         +dNaTLhZ8TtYWmmwAd9NKIkbWNO331CHRFx4MzdKw8+nm2QkAZ8xaa4XLrnQtbH4gHmp
         O929AY0/SCJSej/1koBGKmNQ9LAuc6npK8X+WNZf1qY9Zn7BvIkGUoXQAuRuKDniYxmU
         oj1A==
X-Forwarded-Encrypted: i=1; AKwUvByZV//2CtqtIhcep9pcSq6tD/GqHH2GVYMeE2taYr3zze0vpAk41ZowcksDo/06TvhQKsDonb5cu5vB1sk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH6Yx7f7sSybZ3JNuBzp5modQp8Z+7seQ/s5J4adjCcW6gaqJX
	0GnyE7GD2tJjHOH6t0DBekxmvbo45BeX+qzNywBiwD0BajuHPjybalRKMcDNzQGBmBqxiyOzCDk
	XZ8uXYj/c8QDzalTmQEm7hJzx5eu9060=
X-Gm-Gg: AYBFou08vHFYegevbPEJuKBTK4FtZBiA7xXlyK99q+ZVRQzJwkEYrmbzNb9i/MjuMFj
	0DBsTSyxtVvl85w26VrsZ2CzA/4EbCDySqDJLWisuqqhhmrTp1J7cB7wS03YUpby/n9HA7Zfb0B
	EIpvqbl51Ur4eiUSeIdpKhXUWnJtmbm6KlIb5/UGBggmIr2+5tmvM+hFq3cyXrGrklVmaCQA8Zs
	nOzm7FsltRdXZWnSNS3YMpv990XRXajNtfhejabdIoH+cw5T3FWmqvfxVdNqmnYXW5QxFwdFCPq
	ENH4B2vcnCEpvUgwxteU1sbKZ1pGn8w2qFsRX7rmm2Oy7XGm9gZbBgc=
X-Received: by 2002:a05:651c:893:b0:3a9:a197:c0c5 with SMTP id
 38308e7fff4ca-3ab147a7077mr23817611fa.11.1792426527597; Mon, 19 Oct 2026
 09:15:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Date: Mon, 19 Oct 2026 19:45:15 +0330
X-Gm-Features: AclHuK8NnwqmOakfIFnKy2pOOIHSjjLi5HhfMn_ExQtdiOinQoY-F4nrBSahe6k
Message-ID: <CAB_t1-ACDiUrXneHbqVy6GWcuCJqnQNdM0poRyrdv_y7G6TKzg@mail.gmail.com>
Subject: Re: [PATCH v4] usb: ohci-omap: implement overcurrent handling for
 GPIO-based power control
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[resending to the full list as requested]

Dear Mr. Kroah-Hartman,

You are right, I apologize. I should have replied to your v3 review
before sending v4. I was not familiar with the mailing list workflow
and will make sure to reply to review comments before sending new
versions in the future.

To address your v3 review points:

1. Lock: You were right that the spinlock was unnecessary. It was
   actually harmful =E2=80=94 gpiod_set_value_cansleep() sleeps during the
   I2C transfer to the TPS65010, so calling it under
   spin_lock_irqsave() was a bug. v4 removes the lock entirely and
   uses READ_ONCE/WRITE_ONCE instead.

2. Naming: Renamed overcurrent_status to overcurrent_active and
   overcurrent_changed to overcurrent_change_pending.

3. Include order: Fixed to be alphabetical.

4. Regarding the code origin: I did use an AI assistant to help me
   understand some of the kernel APIs (especially the OHCI hub status
   register layout and the gpiod subsystem) and to review my earlier
   versions for bugs. The code is mine, but I want to be transparent
   about the assistance.

I do not have the hardware to test this patch, so I cannot verify it
at runtime. Given that this is a legacy driver, I am happy to drop
this patch and work on something else if you think that would be
better. Otherwise, I can send a v5 addressing the Sashiko bot findings
(the IRQ handler ordering and the probe falling-edge race).

Please let me know how you would like to proceed.

Best regards,
Muhammad Mahdi Amirpour
