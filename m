Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792946876;
	b=SFNWjN5LT2h+iqLzz+ctfzkhsvi/2uHz0vC95Ep6WrwqkpzXKyGCR0B/+JWkZ2cmiKfK
	 +a+UfBX24UFprl4DqLSQmbjVjxZm0vheBVYhdwC6nQe2L0nU/TDiKrJRGa8gj78F6GO24
	 emh6jpBYmHeh62uWL0GdZ5YMrQYCJvd0wV+gsfSzN2TEk+EQxQCTjqF6AR18ZJsWo2DeR
	 sujljs84ACcNNfQMxwftFTlYSDCjq2X0XGh8J6PQV5jCQTd+U7aBsA4LoHR9wSthsw5ff
	 aPKrdR0X6HuzoqDJUGu7vyl/WQdcxhifQ2uSp1368KORlNLNZXTiYc6nPcfHUzkGZOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HpJEthOBIwEPu1gSMqf8HHsHXBUHMgNP2E4z7So/mi0=;
	b=dCPPBbzSbcUZyXUSrmNX79sMFjHZ26lIz+QmIvnd2c/0GTEkeKrA2kzO5AYzN57pDbqw
	 njtiorwC0WW0YiK5KMJkH4jqW76AjYo1ZA3hxFCUrQLDFTnmVTX2p56sBHzrmXRAswXsc
	 3ZxrCbrA8c6Sf5iTK2S/x4Ha05v/SBd2vLivNlJkp7an3tijluiWQId/JQ51fY/bxCi6t
	 JC6jCCBBvNk0HtJlXjewpLhsDEGysBY5mUz4R9UcEbadNb4NxTtV7gGNl9lSU636RjuqG
	 8NYAbnSu2faLnvPwcxs7JQUN+04t6wOw0Mqqwc4a2iTiMM2CeC1iFUAR0qT0POYK94A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=okTQbRJQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B92606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B92606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=okTQbRJQ
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0f59a5fdeso17505587b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792946874; cv=none;
        d=google.com; s=arc-20260327;
        b=nemth06eI2cqVi3oPUAZ88Q1ETOjpc8N4bq6iLwtEAh2h/fA6YJ/Ct+cnj35bF9Uhx
         tjvCbolNoqPsf6zkmXuq6QsXJ7x80vbPs6JdIuZQz2oQ2E6YYu6I5Ejc6WgQiSRvuaEG
         i8k0F/RmILqFm/2Fnd3a1djRydIugJxfKMksaCgDrRVc9SBLBYXo9wLWUFPCWB97FKXk
         iJJMSeEKphLPlOjXfBrAUzFLl1z0WXd6wj4rAJ/hQl/l7Z2G7hGirX5ZKRKQ/XUnQEPa
         AFRq1LodXRLQ7no31hV3RfrtwVxqG8COO9Kx9HIkTLWn+9UCVYPmbCaUdG0pdxJoIoBi
         nJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HpJEthOBIwEPu1gSMqf8HHsHXBUHMgNP2E4z7So/mi0=;
        fh=BqR6kq573SiwMAa5q9X1c69knhE+Iyxeb4aCq7H7ku0=;
        b=DDKcdiGSWElevQSZR6y0tqoJX2CWNhm2S3ZGVLf/nDIRB/s/qLLGbvkVRxPmSlMj4H
         Hj5TNNuzMQFm0n/XWQVK3feC4kfRasoRvC/3L0O6PqafyLtwPobMFv4rPLf/AclAgEmU
         toZGidxzTbnrv5BWAQDsgbP1HLQy+Qi00V7NdIjydQYLrHpFUX1uv8ZZK/xiSaIUXNir
         ED4riAyEIMVsnMBzdmKkRntbWwPgMDPCGg3kjUKyEQCMqwpwj8cpNMCnP3DbILm+MKJj
         JU2M4xeR98G45+zKGM622LOmsTPDpOltfu2Bk9S+M/xvt62rOxW9yTij5Kf7G5Haot09
         XBlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792946874; x=1793551674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HpJEthOBIwEPu1gSMqf8HHsHXBUHMgNP2E4z7So/mi0=;
        b=okTQbRJQbLezmfJN3ccNFuzoLXEmr2ojkRHNPcf3DyPe8ey22UiUcMAsVq9vZDtSXy
         5Q9OTKIr+H5OJiWBn/auTjTG3NrHtQkEJ9BVDzMMVsjKLSe9u8VEDpmaFxXOYq2JMWfK
         zJCpwwVeudy9lvM64L/wqp3YIeUQpN7AyST0KhjUIVAUOxFwOQq9oh8T4DWTpFrkK8ED
         wGI4ZSmf3/5sMSU2mhJawHCxIovnS7f/7TBMxLXDwJgJKqqp5WUnVaJR6gM41ajUsSoU
         bpgtSwE4eOs0EBXvYOWbb8gzjrzfkd/YjotWBEPa+ICUR74UanyVp2rOHJWs2DuNZ/v5
         jOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946874; x=1793551674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpJEthOBIwEPu1gSMqf8HHsHXBUHMgNP2E4z7So/mi0=;
        b=s/+x6nEsxWzbTnkMJhVSZtE/EWz3xYzuCzgdFR/k7skG9aK1KOYgRZY1wXE9B6NcwC
         sPFABmdI8MkPMxSPNwV+QTK5w5un1+LwsBFAxXKScA1eWNO1GZCUIvGBqOUlZcYnrL9z
         drxg43yjILGAT0Pxpxp49ARsbiVZ9i4FWXZErgJBbNPsutduX9CDBwvuXwy3kMnfm/Jn
         aRwFvT0QGAacndnAp8OyS3KNxw5qZsEqTQbtYC1c/I55MCbYZ/bM4CNun8VdRLdaJHfZ
         2fkKSdfPq7htImoXtRfN6PlOBpo0N5XLgQwrscM6qDoRV7Wdolb1IwGBdOyhzEm3amvc
         kHhA==
X-Forwarded-Encrypted: i=1; AKwUvBzdVNbcvJGs7FulsZ8qQTkfbtXr3zKNhSLTsY1QtUcue+4RA1JEbr2J6xCNOk4NMeNS8rwCUFfJYlyVKLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp6ccKbAm9tR1UafJbmv5N4bEOU/v0ib1bf6oTrnld8GbkVGnJ
	QCwCBEQTEY09AC/6BSibuf9qZlbMJpADOVT8cb7gJfy5cMzTy8q72wyOp4JvN/LP3jilw2NotCw
	fZ5QV1quMcaMd77izW0VoTUNhQ1HaRL1YTGLY
X-Gm-Gg: AYBFou2FrVlgDU5m76IMBYtYt557l3pfpjnKntiM7Y1bIypVVw/9km5oxSk/slV5uS3
	WDwyjy6nmM82+FF1/FkKMRoz9BjDaAXFNM+A5Fxay7/s3nkRnDZiM9GZRpx3ueCIES8f6NcRN3k
	ZJ/tzKFzW8pJR6Q+nmCOlm6fTNZ1TlZwbhp+C+7K1Xdl1qgLuPk1EP24of8XH45y5PjMLb57SW3
	w4T4uwpOmy/rA5tv2l6X1coYIngmfSx6pdpCKzFwzvoVtTDJsYM2BUkXDxYSCnLL1C0qJjtEZRV
	KFmtTShJq5qZYrvFx8+TkVS8JG7H862D2kYgsSUPppw9DK7t5E9rFAQOmftz2DceVIwL4YV3HMc
	TPBIZeX9mTv12w4NtDJNJDLVBoN1BgSu6BY0CIP57MMPioGKbWIXWUefBu1rMVFCkm718QAqCS+
	OKP2O0q6c/BwsgtCF0/R5JyQ==
X-Received: by 2002:a05:690c:d8f:b0:8a8:7fda:15ee with SMTP id
 00721157ae682-8b166c614e3mr33096377b3.50.1792946874322; Sun, 25 Oct 2026
 09:47:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024112435.247650-1-turbine.bmw@gmail.com> <20261024112435.247650-3-turbine.bmw@gmail.com>
In-Reply-To: <20261024112435.247650-3-turbine.bmw@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Sun, 25 Oct 2026 12:47:43 -0400
X-Gm-Features: AclHuK_TqzE8mkoJOPsB4246SAmXP0WMWait7YWx2jD9DnZw3qYk-XWvevJj1Xs
Message-ID: <CABBYNZKc1C=q_p3=f+jAVPUZd90=p4o=y2n22e6GoVX6YUq2nA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: SMP: distribute the identity address when bonding
To: Brandon Williams <turbine.bmw@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brandon,

On Sat, Oct 24, 2026 at 7:25=E2=80=AFAM Brandon Williams <turbine.bmw@gmail=
.com> wrote:
>
> build_pairing_cmd() only offers our Identity Information and Identity
> Address Information when privacy is enabled. Without privacy the peer
> never learns our identity address, and bonds without it.
>
> Some peripherals need it. The Microsoft Surface Slim Pen 2 only
> advertises to reconnect, after a button press, if the host it bonded
> with distributed its identity, as Windows does. Paired by Linux, the pen
> stays silent. Enabling privacy is no workaround: the host then scans and
> connects from a resolvable private address, while the pen directs its
> advertisements at the host's public address.
>
> Offer the identity key whenever we bond over LE. Without privacy,
> hdev->irk is all zeros, which "indicates that a device does not have a
> valid resolvable private address" (Core Specification, Vol 3, Part H,
> 3.6.4), so the peer receives our public or static identity address and
> no usable IRK; the previous patch makes Linux ignore such an IRK. The
> peer still decides: the Pairing Response masks the distribution down to
> what it accepts. Cross-transport key derivation over BR/EDR is
> unchanged.

Well, can't this then create a regression with devices that don't
interpret the all-zeros IRK properly? And to be honest I think the
device in question is just plain broken; distributing the identity
address isn't mandatory, and it never has been without privacy.

Regarding privacy, I think that would be a more acceptable approach
since it brings better security. That said, we must ensure adapters
work properly with privacy so we can start default to it in main.conf.
This difference is likely where Windows diverges from Linux, which
probably explains why the Pen never even considered connecting without
an identity address field. Actually, it's not that it doesn't know the
identity address; it just doesn't interpret a public address as the
identity address as it should so it expects another address to be
distributed alongside, which makes no sense when privacy is not
enabled.

> Tested on a Microsoft Surface Pro 11 (X1E80100, WCN7850): the Slim Pen 2
> now accepts our identity key, and reconnects on a single click, double
> click and press-and-hold after it has dropped the link. The Surface Pro
> Flex Keyboard also accepts our identity key over its out-of-band pairing
> and still reconnects.
>
> Assisted-by: LLM
> Signed-off-by: Brandon Williams <turbine.bmw@gmail.com>
> ---
>  net/bluetooth/smp.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
> index fc75cf568471..8ce5f92d7ee5 100644
> --- a/net/bluetooth/smp.c
> +++ b/net/bluetooth/smp.c
> @@ -636,7 +636,13 @@ static void build_pairing_cmd(struct l2cap_conn *con=
n,
>         u8 local_dist =3D 0, remote_dist =3D 0, oob_flag =3D SMP_OOB_NOT_=
PRESENT;
>
>         if (hci_dev_test_flag(hdev, HCI_BONDABLE)) {
> -               local_dist =3D SMP_DIST_ENC_KEY | SMP_DIST_SIGN;
> +               /* Always distribute our identity address when bonding, s=
o the
> +                * peer can tell who it is bonded with. Without privacy t=
he IRK
> +                * sent along with it is all zeros, which the specificati=
on
> +                * defines as having no resolvable private address. Some
> +                * peripherals only reconnect to hosts that did this.
> +                */
> +               local_dist =3D SMP_DIST_ENC_KEY | SMP_DIST_SIGN | SMP_DIS=
T_ID_KEY;
>                 remote_dist =3D SMP_DIST_ENC_KEY | SMP_DIST_SIGN;
>                 authreq |=3D SMP_AUTH_BONDING;
>         } else {
> --
> 2.56.0
>


--=20
Luiz Augusto von Dentz
