Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853DA3D903C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168879; cv=pass; b=fgQoHWrD2NluuUQBiabYu5QiuXbvQDkVRitCn+Ns839u6D6qJp1ZOvNBMwgvOrsNLYfVe+ZR9bKRF4atD9CC1/c+I5haNFGU/0egNpqaZNNOkaFSRi/Nhj8GXB/4r1eVNTl03uOl7tA/X7+NPnN5CylVZroOrg6xHrbJuZSxEZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168879; c=relaxed/simple;
	bh=q10VzBkB2pq4QNp2zfHKGr6Ca+oT+tEYjX/lb793kOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+Q7GF1r9aAJ6ULyoMFsJrpjW+imAUruGaOWASRlslMuXIR2jZMCyrCJ3SXwj0UrdNRMUEGRiA3Dh1XtXBZswljqJs6Qdz5uAzKjkF+F3j180GC9h4TO4aoOQfP/b0upVHIqtxQc1qXP995G9iWrhBkNgmmPuTAODe42pJjFRsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jJitIXpz; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jJitIXpz"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c25344a8c6cso423239066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788168875; cv=none;
        d=google.com; s=arc-20260327;
        b=GarvqfIXRobYe2Njv83U4YiZfMaD/cqmvE+/6lr26X+fOr6xOZpyUtrktALT+3VU82
         LLrUGzWsivL58ivqrVsZki4uv1P7lGF0c3fig2zAUinlvSiNkpcO+fHJNfEWBmODLkzJ
         6PnHKimMsrIMfXhboA08KBoOWVe4UAf9lnL3i7ZQN7RyPGpFH1tp8Xuvxg1Z2+rsM9sQ
         7bPmny9AGpXbUPHRW8rW8wXYfxJSST+pHzxZ/40F83S1/dwJMnvwH8fjHAQsVuws8ubO
         80CLAs5t3JjAyCzSeMR8Pz6ZZvnzgHwxvS5lZpsipV5POcPT9/SIjK6Hv+hAQzR8KCB6
         zEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsNW+bOUezawPMhJi0LdgKQenUPI6J7374ic34WfjWw=;
        fh=tSnPVO1qeusPuPXp7hgtSOi1h7vbt1dPu0IDQYJC2C0=;
        b=GyOxMsJVp+nAZ5jLr99lQRrQ+ikKC1gE2mMFMt3l4rUQ+O+bdOJEMq/FljNiD32eGL
         Yu871+sgpZkJarbjO0p5DeFqX78AZAO+l4vigqE8Gcirs2N7gD1hCCiTnmV6K/5JqcnW
         JzeEkvYw2J1sD1Zy8xN80LKGp9014CyeBB6/jm9zsFChGqa0k2F1Kl6UYiKd6c9pZal8
         5EAsUgSVcFTjBuxh0dVKDUqe7RAy/zuvOV11d/2o8qgVi9qGC1MhVPtWIQPEv9Nf1vyp
         aqyrh2rNCQzazEUF/cZd+kRd90ocLdHZ+oGw+jXvF5vw7xhjBKbQCiMPM6RgbXf4tvrs
         aXZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788168875; x=1788773675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsNW+bOUezawPMhJi0LdgKQenUPI6J7374ic34WfjWw=;
        b=jJitIXpzL0asfeBrCuen2QTrVbcX0buEncJyF+In6HPREGiHMoXMH32ftopXuAiNhD
         3IACRB3ITc11yaTFIxRp3f3dGOlyfd8VGxh2pblq0a5g3hhp0HMnmnCESF5hXMkmHyy9
         mfI3P1hLcgfxnnyXRdYyCsLRSCNeotd4fuJIcv2A9QHmaJM1coiNNjBJhwPYbEmAQzjU
         6OiwHfdfa/vDtcD0rf2Me7J6FyNoAuLcJbKo0WdRVjCC5E7x185ZAlqQVKoSD78yWro1
         nRXRorv/Z2lEbz0OMuEwW4EhQi/kukq2yCMdTp8xeFhujOBJD1etYJyQR5Zj6btbagOq
         GyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168875; x=1788773675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsNW+bOUezawPMhJi0LdgKQenUPI6J7374ic34WfjWw=;
        b=HoZFD86oCnygcAyvF6qOaqibKblu5ags4XBOrhIy3wWJQx4mOlDnIFZbvz+sKqU8Ef
         MILVFkesT2C6+o9DXB91mMTdL45IKN8LUeS3LEJcw7gWKoc8k/mBYfRZbFLRLJ6OKQDS
         D9OboKGU2VQE1GsrpW4ShuPq4Z7ZSNDAXPH3dFL2YePUQsd9HAUQ9BV7Vj84Gn8naXNk
         NVCebzQnxqqfn6s1w7jpBNh29ovc1yTgjkIbStIoJLLaA6EGgb7SFZ6mXdPGexDeBFdq
         Qt8rHJTyw4WTmoD6qDR7bszQFzi24PEpOHN6ujugF7T4mPXk/JDMStM5kKRjDkvRp+Ah
         h4rQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl5yA3pRgUjqeziDWXv5ZvMBXH7qucyBCaid3QxYX9KHtjguX/bLiBaWSuqG/dKl33UEBfI1HMQnbO++Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nFC2UG3GAuKAplJ7UIL4fLgKGI+oerlE8vwX2blVUZDKDA/j9u
	2MkR7wShLdeS4kWtq1b9p9Qli7LsM2foohAmPP6MKokr7mVzwPqklqoKWCnGD0XZE9jboRxyZRG
	h3IypIFNpVwoLWyig9N3P+rSUSTxtMh2tQuPgxPMCdw==
X-Gm-Gg: AR+sD13afcXXAS2Ozi06O3vkxtLheLh2bBGFRcN+SA8xESwHSr5X/sgl0EzASVCsUNh
	gVTkgyDwZ64bWxD5CWbeyNpgLssZoOjW1XM7q33RuM/+O9QpETo1I04962pZrRC/IHp4E1a8i+V
	abYVLP2OnLHwx0/8s1ba/4lgakmdkHCV+IuF9G3sIwBxhqspdX5tcHdDdiTBUmwM0CcCWkgiJHX
	jkOHdBCeNg/efLxzKnaanvdxfSvgNpBRxjIcYrh8xkVrx879rHFsy6fjG+LXhxVLiKcowfyk9P8
	W1vRz6+Dtqfm3uNrWW+9Ajn/DTh0+CvmjEbSRsSreIHX
X-Received: by 2002:a17:906:7947:b0:c25:4ba1:5953 with SMTP id
 a640c23a62f3a-c255702dfb5mr1639734466b.11.1788168874731; Mon, 31 Aug 2026
 02:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
 <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com> <20260827-uncolored-onlooker-d62c44a3323b@spud>
In-Reply-To: <20260827-uncolored-onlooker-d62c44a3323b@spud>
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Date: Mon, 31 Aug 2026 17:34:23 +0800
X-Gm-Features: AcwNN1VP0Yfh6sec6kZE6kJacWoF9mvzSerldBb-9Msqti5cyfrQxgnjl9Rv4AY
Message-ID: <CAF8VQdEA7=LRpHaVOVZxRi73kRf=0pK_etJOJ5oeULtgw4k5Bg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
To: Conor Dooley <conor@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:38=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Aug 27, 2026 at 07:02:41PM +0800, Andy Chang wrote:
> > Add the brcm,bcm4384-bt compatible string to support the
> > Synaptics BCM4384 Bluetooth controller.
>
> Please explain why a fallback compatible is not suitable here, or
> alternatively if it is, use one.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
Hi Conor,
A fallback compatible is not suitable here because the BCM4384
controller requires a dedicated firmware patch file (.hcd) matching
its specific hardware ID and revision.
Falling back to an existing compatible would cause the driver to
request the wrong firmware binary and fail the controller
initialization.
Therefore, it requires a distinct compatible string.

>
> >
> > Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com=
>
> > ---
> >  .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluet=
ooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.=
yaml
> > index 95501e858e6f..612d21123aaa 100644
> > --- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.ya=
ml
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.ya=
ml
> > @@ -31,6 +31,7 @@ properties:
> >            - brcm,bcm43540-bt
> >            - brcm,bcm4335a0
> >            - brcm,bcm4349-bt
> > +          - brcm,bcm4384-bt
> >            - cypress,cyw4373a0-bt
> >            - infineon,cyw55572-bt
> >
> > --
> > 2.25.1
> >
