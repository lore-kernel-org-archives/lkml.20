Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4514B431E47
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276465; cv=pass; b=L/ToHLku2WD2lZ5gIZZKMWB/Yl9Hc5SH6WggHT3YKR5keJsR/U/MKMv1CtoyPFanHxcWEa5n+eZThqtEQr6UeXuq4P96gS3E0PlWPfmuIfkAkb05682pUhVcLjDoPgXp8Q6/6l9K9g35YpviMWSOgP5gcR+Fd7AK8M636B/RPOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276465; c=relaxed/simple;
	bh=4lqu9gWlS0n7RIQuOa0OikwNpJC9qcg8pW3SWLxdotE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4pt0VrIxvsntBIic+yVwo9nMuBAVlMQUu4YNh/koZqkmN1vvyIpXyZzXno/gClXyl5LTnjQyy713mZRKjRG4BFo0tlpuERxEisJGJ1p9FNN7OZt9HRFeFwXlVwyQZ0yW2MMJuotuI3VFHl8QAdzS9M2Dc0SyVZ7+EUlvVNkyFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JBvqoVPt; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JBvqoVPt"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1448164a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276463; cv=none;
        d=google.com; s=arc-20260327;
        b=fevszcTrAOGt/r27jQaR4CSXcWXGaZ4pZDUnabBjYoi1txBk5zv6J4/btxeR19x1ZW
         hf6ch6m4rZyKiu/OuOIp6nJQ5xrW20CjiMvSoORw3YRwjWxdLBUGPJtJLN24N71mkjVX
         LEsj0F4oJh4pM5tgjuW3vWfAOQWmGkgP1XazZLFFOyUyo2sTLya+0Wg3z62YQH2HUIMx
         1PyA0ftTFXcuHXez6HT2Xh2eL1+G5itVLZEqKJ1e1QhcWOmNUdlEVVDU8bHWqTOEfj/9
         KGcAK0JEszr0AA6r1Mju6+CdpBNMyQjM6484GnayrHp55YWxnJBe/+kKM/k8FoZQMp99
         N+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2oOeplF/9Pvz963Pn9pPnOoBzf1I6bdaQ4cw9nB6sQ=;
        fh=WM+94fFarLl2UOel5aXO0bYnjbA1NJap588sBrP46QY=;
        b=kCJiv7gbyoyFXJsDuyMiqbAWfm5KngTqAatmz7HsWM7IuhrPvDVDCvrXsZVSXQdmFK
         BCgtmRDdMzQctsXglaKkXOJdCh2zV+ohXvls7/kT+Z5NuAFIVQlIafI152cnhkSGtw3C
         Kq3Sy3pgYmEB/zFcaV+R6bCwhjyJrp3YBrQf2a1V6KdiCagCbfQ+ND8KDBA+o1KR0pNJ
         essVwDhS7FgVdWjEOptC9HEgwZ5slcDEmBth5wP56csK1s2F5mIYTUrWhf1vqYFoivzR
         IBEvsac0MU3sjvjB09AMNSoR4zjp8di83mOqdqZlaOaSx230butj/DKPU2sMMQr5pVM5
         8Gng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788276463; x=1788881263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2oOeplF/9Pvz963Pn9pPnOoBzf1I6bdaQ4cw9nB6sQ=;
        b=JBvqoVPtP8JZaSLZkPqvggmaVtKs1wDnOMuETZBC1BmqIh1dCLz74GV6AzyiR06ZeU
         MzqFr8CF+7DmWTMmIkvAXwDTwDHpEA32w7Za+n8y4st6GdvAMz6uTpOnjWTK6kVuV+zT
         6heItjDyuBpFv0zSGUIwMQR6VZRkqJiTkz4EMDaxM9U9w036XSJvT3p2rdEF0tBi4x+G
         fyJsGIEx4W6PFUKG1RNg8vQIIu9tSBKD7mgiJ5T0eJwU4zYnm52qsD4G8M1qIN5RLAN6
         skUDu3HHz5iAIGsfdhxk0zhlOkhJtAXGGaGBebhB0QghIk492GaOsmaJOUZTTK0tkLuQ
         skUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276463; x=1788881263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2oOeplF/9Pvz963Pn9pPnOoBzf1I6bdaQ4cw9nB6sQ=;
        b=dLYsNvA6XqqPFzWR3xe08QQ++Aj4xO74kmKy+IyFMw3vf/85eqfPXK3d40H5KZjmk7
         zG9+mNP2kPkWtLK3UQ6JWuOMiiMTpbT25PqcB82BkswQzG4an9GufKCAz0wi3TOnRsX2
         P0BcpvP+f0idu4qpuLJX4U9+rXr502gmp1EF/mAf/zqleGazbrSuJf3oBqIk7JEddzoN
         9F97fW0/9IifuS9ZGwQh31PmMomdLp7iO4o7LiYKPZIi1qZCdI5mwwkOlR8ybU6UMuha
         NOW0PcGsQ3Q+UWxFixyZLAreke0M25N6Dv3QoCY9w0xIqCSS/iHhwXZoogB0VzYpdWgN
         9j6A==
X-Gm-Message-State: AFuF++lrzGOqab7tKHfa1QLqb8hUJnxzlq8dOwUSYf2TgET1ieqV8jYN
	ngXfqSQbzBuAxIPmJdAaE0xFrB9jaf2MKthaZgv+rCjq5mbNwy3zQE0e9O/WYXQEuNRXtwZH/+A
	7PkrDOtgA0zAgpIvKKyuebq/R3ySfOBeC9NLQf0S8/6n/ULYtjnSyXw==
X-Gm-Gg: AYBFou1AoECBKSkpXB50+epNFFVpnHA5btLW3HWUlNkoCA8p7nrkUDYNSiPX0dmCgkK
	J+9stSHDkdJFjWKemcDBP2idwQS8binKQSG2Ubhn8IT1uvawKjzQsDQ7Zkaga4jJb+qwu6ufo/z
	N6lqb6cboi/2RAutY9q8jJ4zuOzxN8uU3STLv/6L7Yg3eRQMXBiHj8EWSmph5eEX41/BKZkqKAo
	RFFvFkbjFEDTpBNYjKwM1I1jxrJJTbBF2/QzypzNz2DyBgsPeagSbWVitoawv2L1gl2v1zB2AYT
	bW2S8uv9gWGJrBoY2J7gcIdcGltFfyaM2u3hUdRUb6/FMA==
X-Received: by 2002:a17:90b:2dcd:b0:398:9bd3:d6d2 with SMTP id
 98e67ed59e1d1-3990f85e07fmr5272363a91.12.1788276463399; Tue, 01 Sep 2026
 08:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apa4DlzuPqZi72gp@sirena.org.uk>
In-Reply-To: <apa4DlzuPqZi72gp@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Sep 2026 11:27:31 -0400
X-Gm-Features: AcwNN1XnoIQhddvDbZmKovnMpLgo1ZPfjGgnaFz791sMCGU_Z8cHC_adkH7DUCc
Message-ID: <CAHC9VhSQYmtS69OuVpA53q7x0PgTACG5YvdQ-mqj821Bjdp-eA@mail.gmail.com>
Subject: Re: Missing signoff in the security tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 7:33=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Commit
>
>   5598cab53f535 ("lsm: don't call security_backing_file_free() multiple t=
imes")
>
> is missing a Signed-off-by from its committer

My apologies, this is now fixed in the LSM tree.  Thanks for the heads up M=
ark.

--=20
paul-moore.com
