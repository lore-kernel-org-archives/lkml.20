Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293342;
	b=oBEmcFMRDd/I6dJle037vuJAgOF9wkpdaUfz7R+7I9SlDQm866k/BBt7vzvx0oOGeb9Z
	 PHo79Rm1Ju78w4ACksR/hHM7p3mnqEjx/qICwQ/Yb8U5QNROqYAdlCD/a/WuV14ooMaLa
	 YrHlgcJraVUVQW0XVvTwjPE7JCt8r+MxPgIw5bzZn+lGwzkiRFveIoX0MisVZnVaKsAVJ
	 S4H8ldgxp/SD9adDyXH6OMTd8MZ/nEY59d+KHiUz6Q3CvBmzHUWFwoq8Z623iBh2/VVvo
	 H26I89KYNUu0U89o0xcb6tm/f0mv1qtv/xHw7jq/a8TMam4sy9oBt4OcdqvMDbyHrhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
	b=rHwxxz9RZxKkbZzc4BqUioMEut8iui707SiizoDjrxnlf3kzCGm0Ka9HIOkmC+1+fahX
	 IfXUd09WC6TFZsa+DOWIdLeUIpIGR26bkoS8ALwkfSli0D1zrV/slStuvthgBR2IHDzQN
	 /fMnbLxnvqWhMBbG+UmI90cNS493zmsfNqmwPvx9aQ7ttejqNrpbG0ncZKlTeUh7fp6Aq
	 LlpnpBhU7ZjN3Eqt2uPM7+EFZp3xl+60ssnsajvkC/NY2uVm89ZR9snzw9Lc4+h9Tcxu/
	 VPZqUiNGP5lt8iEpKxyqSw0SdGJp79R+wCFXblYg3prfd2aPbwKvFbNAWlG1O86yRig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="v/xFnZxD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA32606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA32606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=v/xFnZxD
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40e30c26a4so243280566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293340; cv=none;
        d=google.com; s=arc-20260327;
        b=VttB+Z1GFRvZCf3+w48It2iR81++hGbexzNGAz4qkfVcZM6OmaXsEL9mb8aql5ncAx
         fFOx8WQt9Qyoez6FMzUgqNaqcJef8Fyj/bln2NWZNhdp5pmSG6nHB8a8CIzUnyhFqDPM
         beX34ljm7l5NjjvMP39VP/RBmBWEgpo4jlD1YAjawEGEFz27joKTasrSuaH152VHKsL0
         5exU/Z+OCMQ3ykbBm6B95y5kgxiPeP3hpRqoQDC+dXNRtvM6Xt8D1gqfmHr8Xvf+oVBP
         oC7Q3HBFEPQvkdpTkG7wMzOXbpiCT61447+Fj1ogVsM4FJvvqKRDX6JjqLg65Vr8jkWD
         jNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
        fh=AcH0lFGkYtzIM01S6lE12gaQTB7fLnr+NpKrF3oZwLo=;
        b=C659dQvpJYbDOX4JJVeanADDXLU0kZnH2AJn6mB+o+/exAqiWzkIXi1wX40QOSI2Zm
         h4lURvmvbvvy+5ld6BogUxLH9ba2YvXMGedceK3N9b4YFW3i3qGYae4d5KcYzjrOMIE6
         pbKFbZlFH518RS0Qqrhha2/SGuTTZQdXQC5uTRP2TmwCpRo7rmMv5ogThCkrrtMZmfhj
         QlGbgnf+f1H/geJ4UA/q8AzqkI2tR9/EQBqnkIN0lmuIvK6OiUhSwtgfEtmqpT7emyC8
         mRb142BgpAbPAl0y+EeCw7bzgZ2kc6ZuRVJqrlDxnPqtHqGyBw+qSnF2DKl0FJtzlRKD
         9rTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794293340; x=1794898140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
        b=v/xFnZxDW7Zensqy+66n2ss4c4o2iS+l8sXiArC22O+q0Tt298ZmgkqlFe/4tGCP7e
         cA9qy6Zy5WIy+m8L4XtILmziLwza8O9z0w3128bKOrZrPxsMhh1UtF35TxXjJCHGDA8T
         YBwGZYXXSlkvsyAAb396Rgz61antrvfz35ZE/VpkXfV3inrAI1BKiQnboCPKEB1iJsP/
         eO+l3d14L6sxjHT8LuIb7rUKE5V+38nosJzn6IAYihUiW0AIVwePe1vdseG8v5FGb+Bg
         cyyPPod57JNbG0oyfYPQHf8d+XKRWhhi2tqXEauZ1/vej6/9OikEInuylh9IHrLXoODh
         zLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293340; x=1794898140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
        b=dFzDl5ET3EVNWH/FhCEZl/V8zzDusrDSaX8W/shw/abfpGg3LNQf4VLbew6H3HSCch
         VFpcmey08zTmNjn/Xmf66wnO03eZqaIkV98yG37B0YfntTuJ3ohto50a8xR7xXGBp5B/
         FlM5DtDUkvmcd9XQeTBXVcI62b7RDAtOpHn/HM2GyYxwXZ2sAJJrZh9yChYedcUulKaG
         T4OmvUKkNd09B3kulXygg6JtvY3ndA+RPnBkuPuF2CG377BRzmwTvuwcSBNJOm9lGwpv
         8ShKXkWTBb5mnP/bmcUAv/P2hOgGuO1zf6DdS4Af8t8KCRynljy3bfzvhtJSRA0PU8zY
         VmKg==
X-Forwarded-Encrypted: i=1; AL+hErE6YviKBmubIM5WyBYyCfG1FzmalB486xTtulf0qOWF1tvHoDPWDLvfAbQUc3dbIZ6q/T1wDsyXkyVtsjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K4qhpvXcgqZaLy+aNegXQrDzaFnXXU6HqpTajqQ83Uk2SgJfH
	6mvb/fpKFcSiMwfYj6tbXiEPpp1jWRtP6TB8UJHfFYIH6RvGGIDUx467ONQhw9KQK+GdAJps4yo
	pluxmDB7lvSTjknT2WEGKGDgwMTMxmAiskCHOAZ688Q==
X-Gm-Gg: AYBFou1QC0dfMEr1CDn5xi8iXSqsDL0KIEbHvUcHMm/1M0TDJd2kDQ/GbpSKzscUJ6l
	lurompslGYq3PP95+F3HK3FiffXB4kdkNSUipw49g8ir7ZebZQ1cSyHB0rUSNyGPOUDdMmGeIEp
	h+Y6RHqsD3mp2fe7znDjBbnJYC4F3DfDVepwDV0wRdt2jgrn4mJ4aRGlsRNs69xkMTsttOhQ5sO
	A/ND69GqG++yQyVZPbhu/S7+qQ0hWOxgAYuHDHZW7UwPcvzhEgXGicGWdZppzcfViOKjjn0rY84
	ZK4vFWh6YVW4xQeFYqtyoJ+ofuiEpf6e7z0xfWNO4fn9XylyBhwsvoUsAKoGLBmQUEfOTlY6OfD
	D/TAmTzcvLEjr+SorcKF6qRjU3knlnXw7D2AixlTMlqLHMOtXimR55/486Kyxk1ajLVlQ
X-Received: by 2002:a17:907:608a:b0:c4d:939:526b with SMTP id
 a640c23a62f3a-c5048c7308cmr131939066b.0.1794293340165; Mon, 09 Nov 2026
 22:49:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net> <au3KYk13lFTjhltb@black.igk.intel.com>
In-Reply-To: <au3KYk13lFTjhltb@black.igk.intel.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 10 Nov 2026 10:48:46 +0400
X-Gm-Features: AclHuK8C2BllbiAztLfGIWD27mCMRqMO8z3FrQU5M1iK3j9Y9ry0AtiAIQOgt7A
Message-ID: <CAKTNdwHpSNhtxp3eaUHt8N5ea6cwXPc6pE_HVVOwtGgk-xWxzA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drop unacknowledged Get_Source_Cap_Extended
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:39=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Nov 02, 2026 at 05:09:05PM +0400, Alexey Charkov wrote:
> > The chip mistakes Get_Source_Cap_Extended for a GoodCRC, as it apparent=
ly
> > decodes only the low four bits of the message type. As a result, it sen=
ds
> > no GoodCRC for it, but still queues it in the RX FIFO. The partner neve=
r
> > sees the message as delivered due to no GoodCRC, so it retries and then
> > sends a Soft_Reset. When FUSB302 receives the Soft_Reset, it finally
> > raises its interrupt, at which point TCPM sees Get_Source_Cap_Extended =
in
> > the RX FIFO instead of the Soft_Reset it just received, and answers it
> > Not_Supported, which is not a valid reply to Soft_Reset, so the partner
> > escalates to a hard reset instead of getting a chance to gracefully han=
dle
> > a lost Get_Source_Cap_Extended.
> >
> > Discard Get_Source_Cap_Extended, which FUSB302 can never properly recei=
ve
> > due to its inability to automatically GoodCRC it, and answering it from
> > the host within the protocol specified 250us window without so much as =
an
> > interrupt cannot be made to work.
> >
> > This way the TCPM view of the PD exchange at least matches what the
> > partner saw on the wire. This lets the TCPM complete a PD negotiation o=
ver
> > the FUSB302 with e.g. an Apple Studio Display, which otherwise always e=
nds
> > in hard resets.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks for acking it Heikki, but let's please hold off applying this
patch. My colleagues have done broader testing with Apple hardware.
While this patch prevents hard reset loops and lets TCPM negotiate a
PD contract, it can't yet complete Alt Modes negotiation in PD 3.0.

I've done another attempt locally to send GoodCRC from the driver
instead of discarding Get_Source_Cap_Extended altogether. It lands
wildly out of spec timing wise (close to 2ms vs. the spec-prescribed
250us to start transmitting GoodCRC on the wire). However, it works by
sheer luck because the partner waits up to 1ms for a GoodCRC and
retries the message with the same ID up to 3 times, so the first
GoodCRC lands in the window of the second or third retry and gets
accepted. Everyone is happy, and the negotiation completes just fine.

It's a bit more invasive for the driver, though (as can be expected),
and relies heavily on the bus speed being at least 400 kHz (FUSB302
can do up to 1 MHz) and not a single extra I2C transaction being added
in the timing-critical path before the GoodCRC goes out. I'll send it
for review separately, and if it proves palatable, it will supersede
this patch.

Best regards,
Alexey
