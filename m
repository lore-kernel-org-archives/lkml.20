Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF416404BE9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902650; cv=pass; b=sRy3POI1GBNgbeWJ9Tr7FbS5lZvIGNq+/gdfkwjXQmSG4LWNEk8M9PPsEUGiZyrn7IhLlFwTNJD9TanmK3uiJ+drD3KO6NtDy0jh4Zh/qWttUJg5TD9cEb6Pr7LKQ7OuceESMtTI84rEA5KtG/arS7fbwuHGID8CeglSiQiP/Lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902650; c=relaxed/simple;
	bh=MA6sP6dXRxWesg/4OAgbGsLj9XIL/e42mlrA2trIl3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNWVNGbFf2OfqYb9DxvYjmEjCOltJpYB1j0sXbrkTZ3k49dkOa593KFifG0nHAuyetZKum1j/ESwxUlKr+hcpb+dCO1bwD5olQeY5hZPY7ZzgVqSk4v989AbbTftJCgetVH26bE/Om5MGkRJ6gLFwqoKE1/c5mkHxv1ZRY9o2Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oioxcsSV; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oioxcsSV"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bc4704cbso2667193d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791902648; cv=none;
        d=google.com; s=arc-20260327;
        b=gQw2j8O/krqtNkjbMT5lcGZzN0gHLXwEQB1iqmspOThtxC8gyqoZ4GUf2rcjIE0C8y
         feHzDr/GqBW93sPS5kVK8guQSvJJx3BU3/8Ia4UrIin1zN65QYoIG8B3t66+shS7ilJ4
         RGbAz+2Tt/x+9hCf+yko01qnJ/qE7dEcHs9PIjmi/Q6ANrBCwWqDVlxG5l0aQeg9zVRy
         zxBT82kb2ERJHLvx4znj0ClX5lE7tYK6+BcpWtA+UH/Ttp81eenoN72W1ry+sjyKfNGe
         qhSYWDAE4TuYqZfybeyhNI+GyUhquJn4Ua+zX4U0fA6i4Tr7pOU6DbKtPm3FTo7xFha8
         DqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=atduYo+ztkM6ugcnct8YLiRvmZz5QJJQ9yuNM0yfFDk=;
        fh=CmX8DuFzrJ7BKUwG9Qrd1ydJdsyFpu7k4/Q8/WPrz5A=;
        b=dhD+3H/yJAz2xpCf5iCK9+h6KsMgYUWTbXlVkQ4Dsu6aHvrD+4oywCgGW8inMhQLf+
         QBetMHvBUW++Jg6kYpY5qXEhRj3cf9bgpv0hws2gO2r1/rwt7qUYA3OCYteavVAewl2/
         mr3EtYc/F0l0y2ix39FC2P2VtPM7XBZcjjxsnYva4N7FvTvIO8sF5vVgLVRewfDvZP0i
         UZQlR7tm547QaMQ2fuzmdGtjrByJbNCmixNEMBf90JtaOW8Pr14OzLfCNG7kXxUIKGAT
         wIkFjoYqq2vMYXsEuTPykSK+A0+2PGsIsd/pLzhk1EzWHKAIpLXd0taPG0EEV0cY0pA5
         lLug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902648; x=1792507448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=atduYo+ztkM6ugcnct8YLiRvmZz5QJJQ9yuNM0yfFDk=;
        b=oioxcsSV1jX4G6SkVvKEn08Rh1wVAG78rQv3RdEpdS/4e/XZvcfL4jqTBNT3z7CTTS
         IjuwObMFQ0RlBIU+3NKn3H0p06yspFjapBEF2Bbw+fAaU8RIeos46SAQ1sFQdRJToo8x
         i7RdOu3/ucEwQGkeDHbQpv2P812EfBULHcf/XkJJVvKobqAIqp+zPK8/2YFzRc97im5h
         RUNOluwU/R8DSon4caf6kUZzlhymwHcru40ZzEcTWOfnBNcBmLRCUM+Kq/2lHBRSX+KJ
         NzJvIMb4kSzdAHy/+DxLYPcOEY67xXJSNhhuahAwJntQtvj0PeixUiGAJTDfdHJZH5/A
         oQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902648; x=1792507448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atduYo+ztkM6ugcnct8YLiRvmZz5QJJQ9yuNM0yfFDk=;
        b=eggheoM+y9++z3W98+5rFsC66EKq7y7UIsPaHbwIWHF1heQUlBTdtruei6WTa5IR/q
         Mk1PDQcU42Ypj80OOsMZXnkBWumv4Fda+ZQFRPyJoVn1wPMBq6WayjCGcRxjC1i8dAFj
         xdrven64ytOxOXtO87xGe+r9tkWJTzDddT3JxAi3F9aXGlBD37GPODBnpZpOfeLJ2A3P
         uCGAUhcD68ikNQFTCWFlPb8lrBcm1fxtQL9kMCclrm2fAC+3xLay7WSgbyctRWg/pDys
         faVBwzej1tizG7vVq+upl3C1Jy9V94V1iT9rm/27eeucDS6Mq9/Gy8F5aK3A+NSCsjr7
         9Zgw==
X-Forwarded-Encrypted: i=1; AKwUvByTs5mqaRStfxPtmphqenc0exe31AJcqK3AAw5Se85TaNfPXeXHCoNhZo/x/UG64Ox5f/MmYfnzuqFb+lM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiKiA8qDLGNCEvHcs+HIJNbRfcMbnBhVVSyek2Y/r1qhtpsH2t
	svUsB60L9hcLtTIaWEDjlswjl2FToRKE+QwaL4HnZ4dYPebmrpFD2dPCaGaKMyinRAfwhnBtOHF
	p0VNBN1LNl48jT9ShODZ18wTcbz2GE3U=
X-Gm-Gg: AYBFou0JBavMfGcDDFJZcvw8dHKiJpcQRsBFdIzXlO8mJn0VwcEXYzJ72/4OOgIpcyE
	swvCOUa2SgNWd8tZPpySNpc49v3QiEOhYPz9TFDhkohrSsG0xcBaS7qZKjrUtsg6x6u56bs2LI3
	V0NLsa8z74SIxo7SAjhjB/2OdgVHbiv7QDBNOAqpzkqgn5+h6yXaNBL2MJP0ijRbIZ1YYwi1PdO
	/JFLT2gaiZKL+VB+vLgAdnGm2rs4w7UYftIRA/clMtBSKY1WFAAMH6A6eB8uhU7paRMBccZ5Kg9
	Bekkzt3kZaF81lxI3DljKzX+wWcY3bu+DJ59JSQ1PEOwwUv7Q1IH3fxEqY7wFUYD76upKc//1oc
	iyUucgIjidcc+Ssn+9WjPlFv/ykJvvjQehVRuPc3Ejg==
X-Received: by 2002:a05:690e:43c5:b0:671:3036:42bf with SMTP id
 956f58d0204a3-679362d4543mr1887297d50.91.1791902647582; Tue, 13 Oct 2026
 07:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013031943.489829-1-cochcoder@proton.me>
In-Reply-To: <20261013031943.489829-1-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 13 Oct 2026 10:43:54 -0400
X-Gm-Features: AclHuK_yIlUUXWCuWRRo25-uRMur7Xtx4RX0jWSulcxBiJ6GnOX20DiZb3u9uYo
Message-ID: <CABBYNZJJf3owtAwGs4OuL6+YZz+zuY_kewKFDZPQdfcF-xyFFA@mail.gmail.com>
Subject: Re: [RFC PATCH] Bluetooth: L2CAP: tolerate zero-ident LE credit indications
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Mon, Oct 12, 2026 at 11:20=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> =
wrote:
>
> A nonconforming ASHA peer sends identifier-zero credit indications
> that are discarded, reducing usable transmit credits until audio stalls.
>
> Tolerate only exact-size credit indications for a connected LE CoC.
> Preserve the channel reference, lock and credit-overflow checks and do
> not send a response with identifier zero. Other zero-ID commands and
> BR/EDR signaling remain unchanged.
>
> Core Vol 3 Part A section 4 forbids identifier zero. This is an
> interoperability RFC requiring maintainer agreement, not a conformance
> fix or a claim of automatic stream recovery.
>
> Assisted-by: OpenCode:gpt-6.1-sol
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> Submission review notes (not part of the commit message):
> Core specification forbids identifier zero. This is a narrow opcode
> interoperability exception, not a conformance fix. N8 captures contain
> zero-ID credit indications. Native malformed/overflow/teardown and
> lockdep/KASAN coverage and exception policy remain review gates.
>
>  net/bluetooth/l2cap_core.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 49a998804..1a0868437 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -5328,6 +5328,12 @@ static inline int l2cap_le_credits(struct l2cap_co=
nn *conn,
>
>         l2cap_chan_lock(chan);
>
> +       /* Tolerate identifier-zero credits only for a live LE CoC. */
> +       if (!cmd->ident &&
> +           (!credits || chan->state !=3D BT_CONNECTED ||
> +            chan->mode !=3D L2CAP_MODE_LE_FLOWCTL))
> +               goto unlock;
> +
>         max_credits =3D LE_FLOWCTL_MAX_CREDITS - chan->tx_credits;
>         if (credits > max_credits) {
>                 BT_ERR("LE credits overflow");
> @@ -5923,11 +5929,21 @@ static inline void l2cap_le_sig_channel(struct l2=
cap_conn *conn,
>
>         BT_DBG("code 0x%2.2x len %d id 0x%2.2x", cmd->code, len, cmd->ide=
nt);
>
> -       if (len !=3D skb->len || !cmd->ident) {
> +       if (len !=3D skb->len) {
>                 BT_DBG("corrupted command");
>                 goto drop;
>         }
>
> +       if (!cmd->ident) {
> +               if (cmd->code !=3D L2CAP_LE_CREDITS ||
> +                   len !=3D sizeof(struct l2cap_le_credits))
> +                       goto drop;
> +
> +               /* Credits have no response or identifier-matched transac=
tion. */
> +               l2cap_le_credits(conn, cmd, len, skb->data);
> +               goto drop;
> +       }
> +
>         err =3D l2cap_le_sig_cmd(conn, cmd, len, skb->data);
>         if (err) {
>                 struct l2cap_cmd_rej_unk rej;
>
> base-commit: 964430c038967fd06643e866f68115664e1a1bd1

Sashiko flagged a problem with this:

https://sashiko.dev/#/patchset/20261013031943.489829-1-cochcoder%40proton.m=
e

--=20
Luiz Augusto von Dentz
