Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123991;
	b=2uTSbK41R6t9IQqPknRzSmJVVuzsibUwOb/YhtRO8qSm7vLIIS+Asane0mF0kZLxULvP
	 QrRsj4XZkDAg84Yjvyl314O6S/MsbUcXkqHZz/lIjhSyTUUE9HkKR+BMj7niQbEKNBU4U
	 yQbY3IYacFKWPOvO33TM4PyDLwHQHYJw4kPxEd+hIbk6G1K7sRrFmDLm1RdpNCuxqxzTe
	 Owa/ZSq1gwriREX7kMDNT/59FmUWL3EQY3GCC6fkgss4Itm0Ia+UkmDqOjL0CcEz7wzmL
	 XmmoVj44mwrtkBNg0Q+edDaXuTcJ31G6qz3wIiC3lmsvXrPUjfd0NBP/1RwIH356FGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2IxOFILwuauNdEEukQ/LfmXx8V9lpNm5Z2RcO6aczU0=;
	b=c5xVh6SiCCFGB5DasJUVLt8RSYpA8lD48xN9iftdvSy2Tae7c/8YZ8BQVX63w2O/LreU
	 pn3tZrmSTPED9dx/SYCMQb2dC/JcxrtcLC6PoAa/qnYsnTGW6hZhZmUJAAUjkTkcTjhAs
	 PrciXG9YNTh8O8caoE4qg3QdRkOYFT/M8zoYBI2sb+ZeWk5z5G01bZfX+ib5XRqK/ikNW
	 6Fx7viubHFlHIjapf7sriBGcG/JomfEdkGRe8Vk4SBJKOnhvrCuRtXugXVp70rMZdEBRu
	 3I2Y/ESyQ3i2fGdeOgCQoSChCaxtK0CIzNpwN4rmdZO0sixU1OP3aNOEenstfZm+KGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnktLtBr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911EB606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnktLtBr
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ab38a051aaso833797b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123990; cv=none;
        d=google.com; s=arc-20260327;
        b=TZc7iSVOtG26pHKojNlik1xROnIhSF7ZzMbB68XsrcXkaIYiyCD+Ap7RpCu33KmYTh
         IqMd60fx1NWCUMoc3krpBT6IWhNjqAtXZXq5riRWqQ8oHIYFwljeqNcHG9A/vbhfrV1u
         xn8jO7F6Pb1U4opRb2ceuaMcKU3ghV2ykPl3k2e32YLAiITHBuRfJczj0fkSwhQtg6GY
         6j+vr93F0JaXJMfPsKJ1AQgHIeL7yxb2wCuXuJKDBiqMLySoBZTf/icuqkE5aUrT/Gxl
         g3/x/EYVDAOWsdxITfD6YxeZ0n3zpRVUp0oqql+RbOyI2nH/mI4MForapilHlXfzFZx7
         1HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2IxOFILwuauNdEEukQ/LfmXx8V9lpNm5Z2RcO6aczU0=;
        fh=U3B/S6vEmd9fybDf1QLMTaAC04jgce/L1Nyv8SgLxFg=;
        b=eY67ut6aTZ1fWzJ+2/lZMp9MzenZOTtxU5AR793HyXVHNiwyOby4+FCA0MMudYyluv
         Ol5OxnrroadQiHf0lDaUEpD2Sf303tqY6qplxR0xF986VEswdZu5yj9H8GgT5hytpZLv
         r57gfqe6Vpx4um1sEdlQm252fHS3UoHK8/c/IuYBQlm32uWisT4xyMwQgAdA6zFLShB5
         j2Pk/+h2UwRLpHMzi+BCN4KQe3BNoWpNfNF6ZHpGYhavYdm1bxkc/0OqNu1w7lLPx8Nv
         VhaysfPMetA4S+8taFknu2sDXLsoJ6IsOdpkqO7s71oqs7i58bcpQ7tOj6tcS9PjhQZs
         AQYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793123990; x=1793728790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IxOFILwuauNdEEukQ/LfmXx8V9lpNm5Z2RcO6aczU0=;
        b=SnktLtBrnp4+KXkShCo4O628FB7sDZXPhh2wLNzPXbW/WuRMX0wh6RM5VjWxc/8NG6
         5VDxX2lgMz0UOiIoA4JRNxQKmg5wglEqD/n+hbFHHwhBrB38MF20RCZPAtPPCOFN1YIf
         oLu1FgAyaNUGQRTsPqFwC9bDXCejbhhkWc+VcRWsnjtYCHPBAP5LOacQWO3+e3qAiuZO
         LSlN5+cSZebyQ9GHoAiSb7MI0CV4HhaXldL48n2UWIq2/W09S5H7nOIX5sx2zSoia92d
         H29Z4sOxuq9mYSpQt2O4gvxwxlL5nDohaTz+q06tcAO71UIn3CAqiqx9BAyat4V4C00D
         m58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123990; x=1793728790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IxOFILwuauNdEEukQ/LfmXx8V9lpNm5Z2RcO6aczU0=;
        b=iUDt+Je6NgRcmn1rFeAbH9WelzR+3/Tllc+Q7LaiZy8kq7lgmQkUdHmHTRzBwGhm1K
         cJRWMcpYuYb2Rt85JQlQkJL8Req6ljyfBCTHjrfslim4Gg/SSHA7z8nIfBirNf5vXv1C
         6m00VSVLjrbKFi1M77Rg8/KaQ6bPey/27GyrmxidDuZtUKxto/+97qmvuJrX5ieKv0Ir
         AfTXcMmf9tofjH6NDMnJTjnXM6qij00WR8SwClky6OYGvjwiDcHmMDKGnAO+lB74JXb4
         i9T8YK3qgZ6ENrAAP3dYTuVWR6j7qJuOegP7hGuhmG6821wtFkTdinxOyhWdJ4pMp0od
         aWCw==
X-Forwarded-Encrypted: i=1; AKwUvBxDEwRSKmzf0kGddNLbUfXEZRPA5OmCgEfuLuWW2wVhvQpI1CyA1ZZ270p2kmy+nqqUU9Q+1eqV8S0+aQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOh1ipbVDpHrXS8Ly37pYyJaABoiy0dCcTuErv9zpCAHZhWJ9r
	BWpdSP0eY7TTZFlylxID3IFVLuE/AfIGJLXQVa8YjCocaxOTeMFthHAhTw5MpmqOLR0f0Ws49Bb
	ZkdngVRKqmxpeXTxe6CMTEaXozd39O+gBflpn
X-Gm-Gg: AYBFou2wSf/hegRJvL+22unt/tkWYa2CoS5eVUs/CRUmXZOVeTAilkckS3nGWxtHIwK
	WzJpaHSdGzroKqHIOtzT4MXJ9Hlu70tKsYARQJxCoK6/zh1J7ZFV3Dx7t+Fqa2EZ1940CK6OGru
	dTvutc36PybEX1OqPO42F7HxbkZReKxrIM1EERzpVaMHXINV8IYKwRRzhpJZSSu/vroEUDOtVPM
	GLHTMvsDKxn5HnNOV0x1KH7Dz67ankC0jm71RyXVSlNq5aAy1s962sxQvaqXdXIdTgzAVfXlW8Z
	MhPhOkFf7d4AMsIWcn3iC+q7roOyve4nNeJKMtunt8JTFOHOP7QK47wRRlQpqtn7jY0E+AP8Zof
	B/Af3ILJRqv6bKGNZnrMjsgndDlcWBlwuKL3AerVgS/COnuuMTnUjiogsxij5583HpIaqLQNzAE
	fdSMwj7ADdmPW72RuXRHzICw==
X-Received: by 2002:a05:690c:e3c3:b0:865:838f:485b with SMTP id
 00721157ae682-8b1669cb043mr83823977b3.4.1793123990365; Tue, 27 Oct 2026
 10:59:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027172730.86568-1-kevin@simpleble.org>
In-Reply-To: <20261027172730.86568-1-kevin@simpleble.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 27 Oct 2026 13:59:37 -0400
X-Gm-Features: AclHuK-TC4wrsAuuVWed_UFF37S07lH0gzZxu_GrHCIaT30ONdmpqKL6E1OGaZY
Message-ID: <CABBYNZLHcSnD36Y3T=HJD7b56rmmyg+pa=+p_kFpJpVuOvoiPQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: MGMT: Fix discovery stuck after a failed
 Stop Discovery
To: Kevin Dewald <kevin@simpleble.org>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Tue, Oct 27, 2026 at 1:27=E2=80=AFPM Kevin Dewald <kevin@simpleble.org> =
wrote:
>
> Stop Discovery moves the discovery to DISCOVERY_STOPPING, and
> stop_discovery_complete() only moves it on to DISCOVERY_STOPPED when
> stopping succeeded. When it fails, for example because LE Set Scan
> Enable times out, nothing else moves the discovery out of
> DISCOVERY_STOPPING, as the LE scan timeout was cancelled before the
> scan was disabled. Until the controller is powered off, every Start
> Discovery then fails with Busy, and hci_update_passive_scan_sync()
> skips background scanning, so devices set to auto-connect are not
> connected anymore.
>
> Move the discovery to DISCOVERY_STOPPED also when stopping it failed,
> as start_discovery_complete() does when starting fails. This sends
> Discovering (disabled), and the passive scan update disables the scan
> again if it is still enabled.
>
> Fixes: 0e05bba6f6f8 ("Bluetooth: Update stop_discovery to use HCI request=
")
> Assisted-by: Claude:claude-opus-5.5
> Signed-off-by: Kevin Dewald <kevin@simpleble.org>
> ---
> Changes in v2:
> - Add the missing Signed-off-by. v1 went out three times without it,
>   sorry for the noise.
> - v1: https://lore.kernel.org/linux-bluetooth/20261027171913.82628-1-kevi=
n@simpleble.org/
>
> Reproduced in test-runner with a new mgmt-tester case, "Stop Discovery -
> Scan Disable Failed 1", in which the emulator answers LE Set Scan Enable
> (disable) with Unspecified Error: without this patch no Discovering
> (disabled) event is sent, the scan is left enabled and Start Discovery
> fails with Busy one second later (3 of 3 runs); with it the scan is
> disabled again and Start Discovery succeeds (3 of 3). Freezing the
> emulated controller while bluetoothd stops discovering gives the same
> result through the HCI command timeout. The other kernel testers pass as
> before. Only tested with the emulator, not with real controllers. I can
> send the mgmt-tester case to BlueZ if you want it.

Ok, but this is not the expected behavior, I can agree if the error
indicates the scan has already stopped; otherwise, we should probably
fail and restore the discovery state won't be, or starting it again
may fail because the controller state in sync with the discovery
state.

> hci_pause_discovery_sync() has the same pattern on suspend, which I have
> not reproduced.
>
>  net/bluetooth/mgmt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 3cb4f9ece8..06595175d9 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -6322,8 +6322,11 @@ static void stop_discovery_complete(struct hci_dev=
 *hdev, void *data, int err)
>                           cmd->param, 1);
>         mgmt_pending_free(cmd);
>
> -       if (!err)
> -               hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> +       /* Leave DISCOVERY_STOPPING also when stopping failed, since noth=
ing
> +        * else moves the discovery out of it: Start Discovery would keep
> +        * failing with Busy and passive scanning would not be resumed.
> +        */
> +       hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>  }
>
>  static int stop_discovery_sync(struct hci_dev *hdev, void *data)
>
> base-commit: 47d4d9f67e92d56ef3965f2727f9c98a5a611368
> --
> 2.53.0
>


--=20
Luiz Augusto von Dentz
