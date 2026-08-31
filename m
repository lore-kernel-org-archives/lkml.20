Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752D7418A43
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186896; cv=pass; b=Av2Q8fisHTxdw4jDhd5OK3DuAJZUDUd+QK5a7PsDJfSh6R0GUXdXyzM1pxvl8yMiCmH958QJK71mND297dunZyc7/s8lak1YnFJM6S09X05E0DuM/PJSwmJfXdcXgLK/9yM9LA8rSppwQEaPsrNDIgwNwyNuCJnAuzNYR8eJS9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186896; c=relaxed/simple;
	bh=Vg6qa/oWCykbJ7SodXP9U7iBmt3nJIPr4+ems69bI8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORhSQuzKacqxp1Mh0fnrwR42Z3ikcGah/bzHo9/mID020UIbJCqc7DlzVux847gDDt9MZhRI89ZNl6kPH2pDVSGrouY5URqzksZ9Ql/6LxN3GqNMYc4FZ8ooXrz63JJZ4JWd7TvbpWOjN0PgS6Iv0rjGeGdQM1mWotThz8VZTOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUVaIfII; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUVaIfII"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66c70f69d3fso3573681d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788186892; cv=none;
        d=google.com; s=arc-20260327;
        b=XPuE/oRoPMsfaaU3Vp+ik7l5o7q5rQTbB0xkVszxGc2+Da418DfkG0kv15MaXhH6cJ
         qJlv7yJmikrK1RPDssB2ZXOqMTolkeCiOHVqdx4fLKKPQ1w02lTiuijiwsO1ajBDXbYi
         zqFQjDjD1QLaDtZ2OtgxANM+0iD8TtQiUpkte1aiubXqXeQX67SX5iRa/hN4QZ91noEs
         EjpYxkrSGnWN70zoHDP1CSbaQVlALSMOYqjI/OyaOEmywQxPK0YZTWaPqvPcEw2Wr6fb
         xLs60ODRlN1+Pgy4f3swUdbsV2dPy6VJnfkDsB6rBsCi9uoywTwKdrxHJwxhpKmSud6M
         kFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XY6f+IczaGd3eHuBAFGxtvbUpgrl4v2MVITJxiyqmjQ=;
        fh=spCoVXQgF5VqWibWHlMhqxiKPAuRvuTNzMGZS1L5xC4=;
        b=aDU7rcCmDKx9PXN0Pkt5LCv6cG0+NXNJkEoUBJzPjkTJE5HNUOGJuAUojHocpzSbSH
         5u23p8cjyroiqjOnRy0UoHkhylgeN/ammtrhP3SBueMRrJOuc/qdSfRgdFjWsPhG5Y8I
         oRqdSXs8hQg9uxo552pYgofKZCuIq6GuhlMtYenDoGK0kh3ks27hpfEz0otz8lXUNyFs
         4sEP9zWzlag3SRTmXfTZKFWVTcWEjqtp3/eRMrkK1hv1p63zIg+YZWMCSCDZsTybG/Ve
         Mg4h5p/IxLQmP7EmAIY+y8whKTDfi77H1+wROBTzbK/sspyOeU+Y/icJpII87H/W6VlF
         LXRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186892; x=1788791692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XY6f+IczaGd3eHuBAFGxtvbUpgrl4v2MVITJxiyqmjQ=;
        b=VUVaIfII1A2EPaIKOk6AxCi3PVdc2+NpP2UBTlp6I8mpnBMCa4dEZ/VxdHVGXSi+mq
         3YxcsvDaqrFwszt2ypYX9J92YRY1HG5Lk50sj7/tao9xhQifDST67UVxJ32kJMiQ4tog
         tHvDfqlVbZ+X3tmugfBAkpzTTB53cypULimtJMQGQp2zcPVMeAlAs4cVV69n3pPMycqa
         NUebNs8BFVfDozb+H97/bCWEHpnXqv0qcKL5BdyCnaZwkBonTtBlEqu8qDQVSCiAd22s
         ba6XjY0BMQaQ9GuJbJlzGP7zh+7ivBvFoBcpQ7t3DtzMQRQvXs5O8+/kZkEfAGfibDJr
         PAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186892; x=1788791692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XY6f+IczaGd3eHuBAFGxtvbUpgrl4v2MVITJxiyqmjQ=;
        b=KosUBqFD3xqHKtryCXESCXyPr82kDRcpEGOHY3F9Hj9KS3uDrGWjR7ysTVELFa28je
         pZAZ2H5fZp3bODwAL2A97jl6b0xtrCawqVTLOF+yw3DJBPzzpdneTPBZCwKawcOdvniG
         NVO3zvJB8g80peVyngeUrOvLfuK4ZiW5XJvfKdwm8E9gV9Uj4KD22cvUNI8uGkeolVkP
         6NdBeWnIGy4xyA8w4RKkdz2cFZSlkEKBQAdTTe+C1Y8Mq+SzxlLHzPLNjXNOb5x5HlXh
         S6enu/U+LWaTKvwGhkugY26l0Z9XEj6u8ih7lNwguH22IkwBboAbPVn8hHrmcGjJYhpD
         1bIw==
X-Forwarded-Encrypted: i=1; AKwUvBz60/sTyXPSK1l/c9kR9pPcIBQXpd5U1EheVBffl1pRj9bnFKp8aHZy1SM6g9G0ncBsyUA3gkvXSqJPcZI=@vger.kernel.org
X-Gm-Message-State: AFuF++kAdLnFR3kWeEUWzm/jssayhf5lQPDaFQ0sTdMInc2+cAKwgdbq
	hMhhJZbHTMzDSppW/KpkI5WKP6ovIpPrlvlncVLRgnN18iExx/51caUE/6GU1R9fQhFec8tS6zD
	/R7v7jxp8VJYqA6CA7wmYfqI/ByinXmA=
X-Gm-Gg: AR+sD10vMVSkGfTddaijoGaTosFVfaiDbzUR1ruXgFuEME89mE59oe00mw2f8yP2zbC
	nt4NcHAGQpw/KlAHaBXlnbAlBviZbZjaL0pEYWWokxJagUuL9nYqm00h91ilT/ammA3aNeuFwbz
	7zZUEOAWf7kx3bCA63p/K9IWD8mItLlwt+CsxcgGgZV+9vZD1d4yBlGojkftQsxM50Udywa6Ubn
	cSzkWImOptAeDG63/ejUxabUmK3By7ATH/XHP6wc1zZlTqc4MAxwp45qQSH8QQTL8I5g0Kfb7NK
	Wy4/xK3vz1z3X2RgExz4KolezVYqLx42YLTsnl64ivtCXiPwjlqxPsf+kZkKDEsFGcAFx127mDW
	scjsidaOlWAlnR4vKf5yrRyC2M1mK
X-Received: by 2002:a05:690e:2513:20b0:66e:6554:af0e with SMTP id
 956f58d0204a3-66f87f572fdmr307746d50.40.1788186892292; Mon, 31 Aug 2026
 07:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
In-Reply-To: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 31 Aug 2026 10:34:39 -0400
X-Gm-Features: AcwNN1Vj_rechvkr1r3wCtvAgnmugKU5yVnftGuW_e-pNh31_EPDAcuGWAXykD8
Message-ID: <CABBYNZLvrc9=bfjEuj_tXbzZ3V+SQqXPxY_2sS9bs0Fc8xiyZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem QCC2072
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Mon, Aug 31, 2026 at 1:04=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.com=
> wrote:
>
> Hi Luiz,
>
> This revision addresses issues below you raised in our previous discussio=
n.
> Could you take a look at this new revision when you get a chance, and let
> me know if you have any further comments?
>
> - Pre-process the PERI frame
> - Don't hci_send_to_monitor() for PERI frame
> - Don't use the safer skb_pull_data() helper
>
> A malformed PERI frame, once identified for what it is, is sometimes stil=
l
> valuable, so don't drop it early via a min_len/max_len check.
> For example, a malformed memdump frame needs to reach its final handler t=
o
> abort an in-progress memdump procedure.
>
> This patch series is to support Qualcomm multi-subsystem QCC2072, the
> first 3 commits are simple dependencies of the last one, previously
> sent separately but now combined into this series, each commit includes
> its own changelog below the commit message.
>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
> Zijun Hu (4):
>       Bluetooth: btusb: Add recv_intr() hook to btusb_data
>       Bluetooth: Add generic support for vendor HCI packets
>       Bluetooth: btusb: Build the driver from multiple source files
>       Bluetooth: btusb: Add support for Qualcomm multi-subsystem QCC2072
>
>  drivers/bluetooth/Kconfig                   |   14 +
>  drivers/bluetooth/Makefile                  |    3 +
>  drivers/bluetooth/{btusb.c =3D> btusb_main.c} |   77 +-
>  drivers/bluetooth/btusb_qcom.c              | 4513 +++++++++++++++++++++=
++++++
>  drivers/bluetooth/btusb_qcom.h              |   91 +
>  include/net/bluetooth/bluetooth.h           |    6 +
>  include/net/bluetooth/hci.h                 |    1 +
>  include/net/bluetooth/hci_core.h            |    5 +
>  include/net/bluetooth/hci_mon.h             |    2 +
>  net/bluetooth/hci_core.c                    |   44 +
>  net/bluetooth/hci_sock.c                    |   53 +-
>  11 files changed, 4802 insertions(+), 7 deletions(-)
> ---
> base-commit: bcb621272aa04a116a74ab5fcc9324231ffa3acb
> change-id: 20260824-btusb_qcc2072-abb918ab4220
>
> Best regards,
> --
> Zijun Hu <zijun.hu@oss.qualcomm.com>

Sashiko found several issues with this series:

https://sashiko.dev/#/patchset/20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b%40o=
ss.qualcomm.com

--=20
Luiz Augusto von Dentz
