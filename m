Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848C4F55C0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871041; cv=pass; b=Kp3N0ByfHLG168V8XwggERonYlGCiaE5Z8Qt8PqcmKrv6nOCH+mKjx27EK6jZeTBF5BRks/jUREuAbwhvqBQv2yOWCJxtBi56Ngr7/q/4Agjaqt2L0aSmtoohaA/mStHRNnJkRl0e1uWWsZEYHiZaFpUzZVf92iLLC54RNYoR9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871041; c=relaxed/simple;
	bh=RAvK+QlZpVZ6hzzt9JA68rH8p3fcTiFrApuxSgWpNy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0Xa9tgRokA9nn8g4EBwoPZgikZUehnziCFClnQrqoqP7R6S2owHOwkEW71evrgOwT6htGtDlf0OPvDW2aLJOeULXXHLRPASkbVE53WdknxIkLBF1UDdUzj9aFDgTe0KfkFzGXNjkPJ2IxNniiwlgrJuNbdDTOW73h11alAnM/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHkKcAQd; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHkKcAQd"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90e92b99ab9so30596326d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788871039; cv=none;
        d=google.com; s=arc-20260327;
        b=DzbCRbNaQf0OUaCA5Xf1NgZc06qkiKhrNe6dGcZc0W0b1Bye7rsvEzvIzVEzCG+O5P
         BIz+hxhKIkombcbZJ2gIfMMb25RfStalZbzM/P1FWFgk0v4WveSBm2HXwZGjHbt2g64D
         8sP1sO9ifQ/chDhyGFfevjx1hwgMAChEIygNYjuNaYUyCWcSB4bFZIWgLgmc7lJVhKnn
         wqjb+VZUKOcrW3VOqZZwlI5PeJpkFBitzi6Lyeg0SNYRfiJ3tg8B3Jf1xbQKvH8tCtPB
         qxXRyf2yJgMBDRqFU1tnhx8/ZiIzIZa9YTgFBElsZoINOGtRIu/pklofvYB6Ttv3zvQr
         eKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+oK2FpmTBiOTT3eOfoPFZBA9GuXPfUx5dYKLcub9lvI=;
        fh=xb3bn5VwifWFLuat+YtqutlZc9qbWJT2UmqYFr4VZOg=;
        b=k0jtT8/B8FQMBU5Al86E3pLqfbetRVTovpG0CKvAsAyXXYfSxA/qz0AJbjz+AuBolz
         GtWXI8NwydHLUHTMje5J3uTnTlHtAWU9duOLV/MJoeLar9McKlkhKudVk6FCizCW2owW
         l9HODeMElYuCSUwDVgHAAGksCvi1zGWYljF78q4yZUmHUGKupvaxF2cE2illQvakvzaB
         9PNpGJ4zq9Fz97Fe4HuIDzMjBolLCakt3B670q+yHjfqDGXYp/ZtFpDTUB51l3CqaJIW
         QvJ4X2B6xDfTVv5Rk6d9MdYgC/dbKo0cs8JbAI+fcm2v5Jnipn/sjkkfSl5vF9wlRJm+
         0yzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788871039; x=1789475839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+oK2FpmTBiOTT3eOfoPFZBA9GuXPfUx5dYKLcub9lvI=;
        b=UHkKcAQdsPmX1AyeE+NYXqf8xbR2IMxFkScly6T34SfWT8kzrhPW0fhJDTtiCcFbuI
         RADUEIuRrh2n4E9vIvKHec/qRpQpYUiE2ERic1YaXJ8vfY+GEB0GcVkUwOOWpVCIGoPb
         VuqGipH3c3gfXgKqstQg0rAllddIIy3dt8Fo/H+9MTGfLsMvLiGbWjzYcSRFPIA9WxaR
         KF0qDkWxFE8Cu/FP3DU/DNZ+wBYXF60mKPKFEmRb4ZpgUA5GgWxsq3bO/MMWv4Woajav
         8SxvOu3KUiNZ6L7G/QMtDtjJhgbrgtOkda2jmmM7UzajBjAkDA8E2sntB1cYX0OTE4df
         Ydag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871039; x=1789475839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+oK2FpmTBiOTT3eOfoPFZBA9GuXPfUx5dYKLcub9lvI=;
        b=fz8IkKeNgj37yMdX0FklQ7tzW8CJqO90o+hERCkJElUInK3lzmvQNRSuEB/fz2q0Lw
         fB5zAxu8hwOPfrJ7eqU34AcYFUycTVePCl4TbquwYb+xKdg/kHaLM3xlHgFsgx9RlHCj
         Ds/uLFgJqVqkqyQfvFHZRzQX/GlULnx4Wa8TRIzOkLH7d7kUYtqz6lOZqGdU6+/U+AZ0
         Va4XpZ3wRyaLRaq1VMkHVnWU38/e61botf6gbNRb5yhuD0MW8V//YrpSB9TDQZ1jSL0M
         6XQV6tNzRxDZmoTtQgBjtCUsgUm1CL0XUUq8uhpYoMsEAJdvaV0fjqe4+Dnfa2+WnlFS
         9IZw==
X-Forwarded-Encrypted: i=1; AKwUvBz2/xA5I84fwcenlq19ac4ZCNcMOSGqnW/84z05xZqIKXW0bPoK4sZzfI698XYIKFBml+wrXOvL7m/ha7c=@vger.kernel.org
X-Gm-Message-State: AFuF++kk3sWN4bsfUFHx2mfDqx13KlyJ39AuNKST9asB2vdsX/CrmUQL
	sOdQCecngviLX5yUk6SlsUc6BPb7owXMPUgoCxsmt0b9LSH1AEXeM4ps/LOM/4Om6HQPfGCZHag
	zF6jj461sMMvjlMu3VLuZh9R6t/C8Lv8=
X-Gm-Gg: AYBFou1sNJ04K0IICvq8bx4Av8EWcHSu2metpQLS3jjqZCZ1ZtUtoD9ych00co6Wt9Q
	Hxis/e/UTUnmBaK1IN7jkBhOsDOW/dBoc4LpL2BCnaGpRPsigV4Hct+wUmBXY1LZfEUISYZ9yP4
	CTO1VBvx40mkl1uEhhgfXSZfcj4sBTV/MbO4i0j0wumU7Q5BvvLpfmK4/mVdT8JI/k8bhZi8ojp
	Oj31311bcMLlWJqraKePqGjuAFdFOGocg07/FUtKeyh0qRVSynmZGgJ0YnOrsLDOysqfdNcKCeO
	wA1ksPL4Sj6t6PJseJzgEhs96E/hvTrergrpSp41wv5vAsqyh064FC1S
X-Received: by 2002:ad4:4eac:0:b0:90c:4ddb:e298 with SMTP id
 6a1803df08f44-9103eefcf6bmr338643226d6.6.1788871038641; Tue, 08 Sep 2026
 05:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-ncsi-over-usb-v1-0-6b74d2f1196c@gmail.com> <1db2f8a7-6a17-410e-be1a-e9ac0b91e6d3@lunn.ch>
In-Reply-To: <1db2f8a7-6a17-410e-be1a-e9ac0b91e6d3@lunn.ch>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 8 Sep 2026 20:33:55 +0800
X-Gm-Features: AcwNN1WtVvXOykEE_hxcTq7GGNs3AgLO90Qs8ToeolRNdm2gAaEwR31to-VY1MM
Message-ID: <CAGfYmwVUg-Tm42WeEAaG8bKrKp1Tv+08vvJVnmwk8+BeQ1j0Ww@mail.gmail.com>
Subject: Re: [PATCH 0/2] net: add USB CDC Ethernet NCSI support and fix
 unregister UAF
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Oliver Neukum <oliver@neukum.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
	Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
	Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:23=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Sep 07, 2026 at 08:15:54PM +0800, Potin Lai wrote:
> > This series introduces NCSI (Network Controller Sideband Interface)
> > passthrough support for USB CDC Ethernet devices and fixes a
> > use-after-free race condition in the NCSI core unregistration path.
> >
> > In DPU (Data Processing Unit) platforms such as the NVIDIA BlueField
> > series, the Baseboard Management Controller (BMC) communicates with the
> > host or DPU via a dedicated USB CDC Ethernet connection for out-of-band
> > management traffic.
>
> I'm confused with the architecture here. What normally happens is the
> BMC has a standard Ethernet interface which outputs RGMII. That goes
> into what is in effect a little 3 port switch in the host
> interface. That switch allows packets to flow to the host, to the BMC,
> or out the PHY to the medium.
>
> Because the PHY is in effect being shared by two interfaces,
> management of that PHY becomes "Interesting". You don't want either of
> the interfaces setting the PHY down because it would cut the other off
> from the medium.
>
> What is the architecture then USB is used?
>
>      Andrew

Hi Andrew,

Thanks for the review. To clarify the architecture, it looks like this:

[ BMC ] <--(USB)--> [ SMA Controller ] <--(Internal)--> [ Shared NIC (CX9) =
]

1. The USB Interface: Between the BMC and the shared NIC, there is an
   SMA controller. This controller emulates a standard USB CDC Ethernet
   device facing the BMC.

2. Passthrough (Bypass): The SMA controller acts as a transparent bridge.
   It simply passes through both standard network packets and NCSI
   control packets between the BMC's USB interface and the actual
   shared NIC.

3. PHY Management: Because of this architecture, the actual 3-port switch
   logic and the physical PHY management are handled entirely by the
   NIC/SMA hardware firmware on the DPU side.

From the BMC's perspective, it only sees a point-to-point USB CDC Ethernet
device. The BMC driver does not have direct access to manage the shared
PHY's link state.

Best regards,
Potin
