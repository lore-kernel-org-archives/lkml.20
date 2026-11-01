Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793562110;
	b=SgCORuLjJSFEdq4xqwSPNVkYl1Wp8CbVynJqGJ3de/36rQXdrpHZhDp85vxn/mSnoq/9
	 2et8X6ynXl3+1fT3JUbOggECKzkdmZ+rd+Eo3YieSIiA35rAFqVLJE6Zfef3PB3yJT5oB
	 C3k6K3ia1FYjOKKEhSoMnJTFkdu/WtEF9Sg+TUPfn1Gc3nON4V9oPdr5Z6pgy2Jpi0Qzz
	 UlkzA/qDhu/ZSz49ej5XDAVWOZuZ37vyA3RismXkbvxjIJ/SfM6Bw7J0sjczG2a3UwZ/t
	 IM5z33LJdMWOOVVLcTLHIGN4hwjfO2NOfRIgsbjHAU7EwRPkER4LXOj9FjbBcUslLvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JA3jX3tndrIW4yCSFoQPJFyHa7m1TQaR2efx9QzdHgU=;
	b=Pzzy0ndnn6vab40jshc5TFu3La+OroW5taEKrShpgX18lNV4ihc1lJAy08snWxIZeN4D
	 7wnABUPfmEy8J6sF5hwwKMN1rVZ5swa4xLvEz+kossFKaVZhn7juoW0grFT+Cu4HtWrxc
	 IuV7RSyUdqpXkwGq9aJ2sQfXBThqe0RgQAEOSFx7kblMBzOvP6lh4pm+5C5UwmKjDXTPS
	 361BXrP5Veu6VGUsoyr37JjaBMf6N2/ig1DkdFZvqAZPS90Ps8KVkUUTBY6H5OS76b7nv
	 sk9v7hEam7RN5PosyOWST0YdzCc6DsiGeK0OPzx6wCdtTSmFii8T/bnprHiF6z/gqBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot6Gds7T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70891606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70891606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot6Gds7T
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so16838415ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793562110; cv=none;
        d=google.com; s=arc-20260327;
        b=M9GY3oysy6DXgKESpwD7T/TXHtrHB967lQlN3vhzBNLZ9zzdm3IDKlcFTXXUWZCyop
         wAHgVCY+ZUhvfW6hyMYcE+wgWpjuG9afZeVRkwWKLH6156SLRZh6BEKy54P7FbI331eI
         uK0203O2/3hVCirNMf29Fxiuf73B0fkkkWXCjH9vq/oMhwkh61dUwSqvF9MdG8DgWa2Z
         q98260hwkuhC5GSOGxQMsHYZx2L0+6Bm3qVO2D01r9zuBFrXWsFmN+SyoMe6K2kTh4y7
         /Z/TwD08B/45nFvqLsWmcdlHy9k121bLsCL5BSYNRb2NecMLHRbvrZ42KSjpPOg86I+s
         QoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JA3jX3tndrIW4yCSFoQPJFyHa7m1TQaR2efx9QzdHgU=;
        fh=LGgRPzJUVSSdUMMFrwKFDHrkgPeF1l1uS+ca0wdIRbI=;
        b=Scp0Kn7vvuzuLc+oArVzMkN4mXZkWEsYKh+cFOzkC26Nmnb4apZkWv4HaomuA2hoxd
         buSlXyboVZS07Cl/X2cX0cRpOCVo4PIJt/03nDMabRKTcyzPMiiyjq0nB9qOH4A2QNAp
         zawOE9zJUt+VfEUyq1MoIEnSDYZhckuLNR1Im3qpmjoxbK2DQxPoQcGs4NvpD957vfBs
         xTEes/u60iMn1gb7LtuoEUJCFkYgYQZcDyTBSFqXBGqfuN1L6LbaFTQdEoZ+lZGvZsJj
         TwMPHbv51eY4T9ZwZJtuIaq6+CdbXoFLj2VfabQYOrjeYKnz/iE1SjX78mC1ANQYOQP1
         oK9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562110; x=1794166910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JA3jX3tndrIW4yCSFoQPJFyHa7m1TQaR2efx9QzdHgU=;
        b=Ot6Gds7T+5UmsDwVVpntlzClSyWM0aKqpK4RXwbAj+elqcztjTX1ABwoES4t4j6tsF
         PcG1/jCUFX8ULqCgxwPOFB53mEIr4k3pNMBPt8A5jJUhhznD3mrn/7zk+8BgjJncKDuW
         cEXCVwQb4QyqL9MPsd7ovyb+EzQbUePlM1RD/78aWInie7KEY/310H54plu42QP8Jtme
         mNuUAip/djVFfwy0upN5ObbPCJ4pE1E1ksL5cDXnwcIH2JUnVt7o8HeUY2CZyGAywaoM
         yPeCxohuqbzK81O1LcmigXaqDAvbEcSkm8nTiRJ3b9CVQRg2JX/nWHcnfqtydoz/ai6a
         X75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562110; x=1794166910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JA3jX3tndrIW4yCSFoQPJFyHa7m1TQaR2efx9QzdHgU=;
        b=1JVUea0D9sVHnNwE651MTaybrD30FnIWuxfKzX/YkP0JQJB3MFAlTV18zi4p5sAeJm
         2svtSalsuXu7Ge/Kp83Ah5GTD79OBP2Ow6kxNO93mTTyi3pgf5jxJvRuNh/g5lnc7/mx
         86NYsnT0puGjNwjCy+VZYx9be7BUqlWXl8mSnl2vjf5fiv1uW7YccOzTz59awuHva4Fl
         iBwaOFm5S4P2TJNoIMZSbMmgb0GKmqyxW5GeFZtXi4EaPccrEDzvMiHIbkSHLDUM9ayd
         StuWIwJMIZQ5FTin1EQPzusvxDC3NWKYoD5+Lqa1FEL+jvuXrVxyBv7AJ70jbLJDKfU0
         NMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0kk8QZSxIgPnq1IX5haGbPU5rxZWFznbKPZkjn0zA8lUVAMrLtAO05wDnYPmFmUmBZz9WfDw35YlVYzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FM65wIv8ijgaxEJTrxGxqaijv7WQe43kfEK5pimI7WpqXwpG9
	Y/yhLU+iOE2gnlO24kE7u3QEKr7x/IQrxaTuzowIFDhnyBjd6Y2uBzAhm0dEWpp5hC1Hd5Zjdgn
	9Flv+JCQElaxIhvBUP6A7wvQV4i4acg==
X-Gm-Gg: AYBFou3ZrF3RSQ7Hwez1//NHd7nzgdENMq+iPEdFfWSEAbxWLr+UFUAxIgqkseH/jad
	fIDdzMv5S3h4x/U9RawBgUfJC63zSzH8YMr9HGi4R3LCMhzjNUBtx5HptM/ACS9kHrrdd/8hB0T
	49mMVWf4cHpxZ/cdzFPOoqEr/wtpxgQH5bIkMjR/aFU+YzlsmrXkKIIQA/49hJ89pV4Jbjbe8KN
	y4Q7Mto7bwiNuJPdjsUxoSpgKM2zxO9DGCnm3CTUO2eJVW+4xhG2OE2Bjm/RYI9/8MqwUM6HU8T
	SVRTwqefzuRluPk4Ul8vb32aB3+3hHFCxZi5a+8arETYc6x8ROe0IhF5TwtoUKGNvVFjlUatL6u
	jDmXmX6BY+7r3uM0QtcsuJ1wyzl2qw1vZdRknOe1VEAFQ9+7hZu5HLPfxjY6hnOe9fFa2jg==
X-Received: by 2002:a17:902:ecc3:b0:2e9:814c:dccb with SMTP id
 d9443c01a7336-2eb36520f1amr79989415ad.69.1793562109749; Sun, 01 Nov 2026
 11:41:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031133455.3070233-2-rsalvaterra@gmail.com> <CAL+tcoB6vg+-w1JZdND_cTN_zPeh76_+-W_NU34jkunJUFwrrA@mail.gmail.com>
In-Reply-To: <CAL+tcoB6vg+-w1JZdND_cTN_zPeh76_+-W_NU34jkunJUFwrrA@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Sun, 1 Nov 2026 19:41:38 +0000
X-Gm-Features: AclHuK-312lSJcqm_yH_edcVqM-T-ygyAdVyAurMKANlnKwC0cEWpz-W8iElwLU
Message-ID: <CALjTZvbPacWO+NY62fbFdQEAJemD57zmhdYy+v+BXpxFgntcNw@mail.gmail.com>
Subject: Re: [PATCH] tg3: make depend on ZONE_DMA
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jason,


On Sun, 1 Nov 2026 at 05:48, Jason Xing <kerneljasonxing@gmail.com> wrote:
>
[snipped]
>
> The blamed patch seems correct, so I think you need to root cause it
> instead of adding a global dependency here.

I'm sorry, perhaps I misunderstood, but *I* need to root cause it? I
never claimed to fully understand the implications of the patch I
sent, nor the intricacies of the tg3 driver. What I *do* understand is
that a supposed "fix" from Broadcom has left the Ethernet controller
on my late 2012 Mac Mini inoperable since the 24th November 2024, when
absolutely nothing changed in my kconfig. That is, by definition, a
regression. I'm entirely available for testing any patches people send
my way, if whoever fully understands the driver and the hardware is
unable to reproduce the issue. However, asking the user to fix a
problem created by a patch from the hardware manufacturer is=E2=80=A6 an
interesting approach, at best.


Kind regards,

Rui Salvaterra.
