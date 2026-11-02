Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793592582;
	b=3KAttBmYpMoSVPUbDMrRuoI1mjcWz/ObxZAgGr6KI1H+XjGA3zKI9HotKQ2pOAUEE6kb
	 Vyi7hWe+zsBJnR98g2UJFELfqDm/Ob//f4ZSCoMqIjSaGmuHmsHkN6Tku/L1rG+YmADUg
	 QilN3BcHnALXMT09x8rg4C3JENStmwlsTDl3dmibtGHt45VZGRuJkjYSjtYJzfmVeIhy/
	 vcocr1hytXv+bclMAPxDY8aGpMFr0rXOgmqr9VrgzYGUZSqXjM9SPyc6RXXaPu/geDtC8
	 EnTuiWGcaPCZLVrMgGlIP//HCnOYYYTrftG7Sh+Kz3VWQ4/MM+MvPoWPtfWlbDBUl/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oMe8V0wAAjhpcg5k07EFvoLZjdMDN1vdGTa6u17C93k=;
	b=wMKvjz39+PnHhXI6UYaFI7Lb0FfEiFCL7hXSCheVfz99QFV+jLKdr7lEEaEaoaCdTxMU
	 gi7j5didwo1P8C6Zrlrz/M2e3ewo06hSO18HJC472nYiZQIptZyndA739si+IUZ4BkvOV
	 RfLgX2h3JncDjBFfFl7YAubm5nwNz44mKtrwJX2xbZNd18SqNzd2pez++6eFpQyZJMayo
	 KXpCTGT2n/fHgQxsrOtu9TJTWoas0Go4JquWiWJXoijPq4wcydWYdqsu2JUZIFBakXPDS
	 gBXTjbcxyciwyt32lEYlOJhOjOnTINGOEgL5gw39KIKNDWQbXMUi/TFxgyVPwAV2VZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=manxnVUc;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B02606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B02606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=manxnVUc
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso3744995a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793592580; cv=none;
        d=google.com; s=arc-20260327;
        b=PR6lwSGRflhOjgfo0DJ/ewQ/Km11eio+BpZdvc6uGuE6gELz23S3CnC39+YZ6FKwc2
         u/16ZK8UsJiUeVtgGEijOegvaVy76Eqz2rOTAcvHFTgo70tJf1fUd1ujFaI3hYoaoE9u
         QGqU03soZRWZYUFct5mF0oYJfyo278LuHYmXhicnmK8YbciEIaDyhpJwcVvAJe+eNhit
         2X/usEORfwdb0SZEHbhB1dF8q0hso6I45aIUbfW6EP4TuTY6Y1IIf10Z6GfN0mxZFr/o
         0coT/QbJ2oc8takqpauvJkDCsUbei8KHqo/blSmS69oT0ZeY6ab2ZlwOXVUvmX535KUX
         Wfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMe8V0wAAjhpcg5k07EFvoLZjdMDN1vdGTa6u17C93k=;
        fh=YVjqc612uBWyspLraRPRTIGA26VddnHW+moVgH1KQv0=;
        b=oaCJ9va3h2sycG7zzJEtzlTNv4uyCZZIvGaotkd5U+xDxw0hZBMQQ08KaFOFraTqRH
         8M7IJqrE7eIaFlVtYT2RnlGRGlqWAhiNkoq2sDcRFQr2amGSFogSSyoB9UcbbLSb/9iX
         ViqBiR9nVEYqJWnue4yVXifJ8n1VEtr1PEVQKDLzawrDS1Ud5ILOJeTOuaoAC22z+hfX
         QSoFdSATecqtfWzjzDcusktERe9VRyxdhBe/BKIcjZngIf+PkA+y8Wbts745GX0XExAy
         gA3okAUoUahEE8h+V6/xl2WGZ4qEkb02GE4ih4VI1Hm38PJl296SDI3hsa0YLoYLSekK
         dyig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592580; x=1794197380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oMe8V0wAAjhpcg5k07EFvoLZjdMDN1vdGTa6u17C93k=;
        b=manxnVUc8KeOoDen8Ui6END2+YERSoJVq3Iu6IkWI581JWz/iG7UkSSZD/Z11+xV4z
         skTE3gD2spnzTn/ql/WBXrS6Rsz5IqpGrMa4D335RmY8dopgEAtTiwfXId5gLmH1rE6c
         brhLorooVt+jQbp9osxORq8jtUE8tquoGm9zzRsJNP8RuQe0iNq/me4PbdrxyUmkQYm8
         eP/1UKQOh2UIdqT/XwB3NLl90HBLPkSUl8tROxgzLBK5flM7wqvdRgY2vKay+bzHWBsi
         sBuHfRPkRX4SNdQAeQkgPs74qHuTNMsD1tE8iXQAXEvC/RkS/apYCBa7XwuoyWtkuHT5
         bXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592580; x=1794197380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMe8V0wAAjhpcg5k07EFvoLZjdMDN1vdGTa6u17C93k=;
        b=NHceTZITUPtvAgEHFs3wYEGYf/ue+IpDqjiDaL7Bt1f8tRXjgXG2zAymUQ6GjcwxGi
         nVX1FTMk5cHF+WCexiD9N0gzjpxHocD/EQ9wM4CeiU2lkUYy1j28ry6U8g1vwMoeu3aO
         S7BcRjgjCnk3PWTjrLKXaImPG88g+xgKV5J92KuuI78wklBfvHoqoAYVNbWu+lxtPTDq
         lB3DLngredDAOPCCgHhYkIL6yLijadDYo8WSFjsqv0znkOS3/292U29Xkgmcc77YoWkH
         FxZzangxCn1aECj9eeuOMT/b8mzNicmndT3UE4tgi9bdKnasiyj9Y0GCKS15aXZGLoOj
         N2dA==
X-Forwarded-Encrypted: i=1; AKwUvBysGrCQaH1gxkeMl90ba733RLSHN1OVpMvDtk1ASiR/FZxsDx5WMvB7VrWHwc/Tpdq1JfA7NcjALf9jKE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/alVnNjOW5llHhJhACWZfux/p9ll2UOlrXapIQxeJLjeRBtOks
	g/bPbUo9zOueyL6hg0JR7CKtfCQFej0ZK0INBpvkcIX5H4iYHpHYTl5xqXcdblb4+XK9Rru/K8Z
	F4mh4prSUZev02w1O9t6yArm0r1JHXz6jsw==
X-Gm-Gg: AYBFou0cKkgFQ/h4MoI+8SLklDxfyia2ckIzl/Jv1hO4anvo6OUN5YRIH3U7g0rZLW/
	jijh8l1CM5xMPJiMd48Zv7WObWv+GmhJ3EiNyxItK1H4nELt8kLtylqIJn/D5smZSfJXJj5HkC1
	9mobxhIFkhV782DOpp0/dds0m/4C8WcJ0PKPr8uIjip5w6sodAovtZGFg39+NOBN1uPeotHenam
	mFOl3jMlYwfgrCDKl+9HKPOlMCI+zVO/0Ct4QFsgOKH/KmAOWfFrVWVKdv5/l8OuhrLT54QsILW
	87ZrcwGHVx/iXSnkaimwqSdxnCsx47UanGZRwTQDQa4NC9qmsatSsWX2OrY4NhT6eEoAerHswyU
	envKbfnJrXMaGW9wAjlG4zt1zdR5l6wXVFcFf+j2FX7xvsKOlE5fRR0HCt/Ab9iEqmyujLRKpl6
	yviRaA2RJNvAYCYfiAU7i5m3HxzT6QGksXANc26RqvQxLmFhRAOF/yV/5ycuoWbrkjhMeBoTXnc
	bva0dPDyI8WgYpSNYos8K669LRBrVI7rQVtxZ9Dr1LoEJKiEQ==
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4387808a12.9.1793592579961; Sun, 01 Nov 2026
 20:09:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101222535.34573-1-rosenp@gmail.com> <ebd3c83183464c3e9c218337a568b59a@realtek.com>
In-Reply-To: <ebd3c83183464c3e9c218337a568b59a@realtek.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 1 Nov 2026 20:09:28 -0800
X-Gm-Features: AclHuK_jKe0Xxth3Cx5LMzpWC9m2Moacl_LQ9teKHl9xzgIDEwojGOVkQTWAUuk
Message-ID: <CAKxU2N9Bk71yaZY239w4kT3+o_p594xA5-jkNQ_BdWU8hPW+Yg@mail.gmail.com>
Subject: Re: [PATCH rtw-next] wifi: rtw89: acpi: check for _DSM function
 support before evaluating it
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Zong-Zhe Yang <kevin_yang@realtek.com>, 
	Kalle Valo <kvalo@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 7:28=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Rosen Penev <rosenp@gmail.com> wrote:
> > When the WiFi device has no ACPI companion, or the firmware does not
> > implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
> > acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:
> >
> >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7=
 rev:0 func:10 (0x1001)
> >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7=
 rev:0 func:6 (0x1001)
> >
> > Here the handle is NULL, and acpi_evaluate_object() returns
> > AE_BAD_PARAMETER. All callers already treat failure as "no policy
> > provided by the platform", so this is only noise.
> >
> > Use acpi_check_dsm() first. It returns false for a NULL handle and for
> > functions that are not advertised, so absent functions fail quietly at
> > debug level, as rtw89_acpi_evaluate_method() already does.
>
> The acpi_check_dsm() is to evaluate func 0 before actually accessing func=
.
> I'm not sure if all platforms will implement func 0. Do you know that?
yes this was only a partial fix. Will rework.
>
> >
> > Seen on an RTL8852BE in a desktop PCIe slot.
> >
> > Fixes: e897b0bef38a ("wifi: rtw89: introduce realtek ACPI DSM method")
>
> Does it need a Fixes? As I see, this is not a bug.
WIll drop.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
>
