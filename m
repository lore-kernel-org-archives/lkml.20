Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592644;
	b=FXd4fXL7detN7FSgyuIrvyCGDOX0mqZmP9tssZF8cQ0W4BHE4A/qkJhBylTUNjU6TK7Z
	 YL/wC1iDeYRr4NemgdIpEAzgGeWuQT0y0nm2zDJK5FYJ3/N+TAPO088cnumjHk6nK9TfT
	 5U8uHuIX18wCN/Q0S07JITsuX3jUmStTTHit929/OYTeQ+HXqrJ219kUvqFRahmcrop0s
	 lqVWyACzXyQfsH4ZQF+Pwznj/mom3oTUcqBUYGwvFP2pK2HKHQpQjdb2Gkg9hwJUktoII
	 6Mqj3oT4eOA395xQcGpIIllVavyXr7JfLFd9tXzOoU8Jh65htSe/anVoB9vX0lLefbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=;
	b=LIzUJgUc3BFEYHmAWDoJzSlinzpyNc5Qs1cDWNmlMg5xUSgsXww6Q85sNjqWhsLYaV1L
	 dhit33qxG/IV5dPht4R1eJySHtGnwT4CYjE12dS+uNDdjoY6h3H365skxOVxaC7HiHnEk
	 qWo0e9+E7vgkz8bT6yscsxMgebd47iboM3EUVUCmWi0EhawSbPdnLAUxfMCS0OLRRvaxR
	 koO+qTaxK4YP9nUwquO4Y5oJgJG2sslNrElmIJMuxOEh9nF656IXKZFl4o6s7Nz+rf9oR
	 t5/kl81NPVS8uOcfOAU5Na8v9bnHdIutQ6gfHxw7xZ8WUwmWlWOQfbdnrMSwEiqSXFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mVeuAnoF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60369606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60369606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mVeuAnoF
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b06c0794cfso8797477b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792592643; cv=none;
        d=google.com; s=arc-20260327;
        b=SXSykPucQDQ6QnDijhs8W75W0p4rLz4vywyBPxIEk964Sse5hJ7H+PxnzWk1CspKk/
         WHxKgL46czv/6JsUf3uOrtyFRY0qpwAKbt4Qhi1ftMNTi2GP3lwVA+ZaWMBpXp9Hqfz1
         xOlQjbv4SMBRaDCF+pXagGl6nilecxKOT3cs/FyPd9kSnu1VATkhi6BSbIzJ+l2YwoUI
         xtxlyUisHqthMXEj8jIoJd0lpbgB0xI2CvKdFwkC2Uz2H6lXzNqRqIBZWdjGdsM3Jikv
         eB4Q64iSZVKyaFUdnJmojzIxl4S+17cpQimwMaeFgWGR7wCjfI1fCWSGB/8Xc92GlBGU
         YM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=;
        fh=Xf1SEmt8kzhFvQhZiQ+3Sz+wTJqHCH/vYhNKcBH/8Pw=;
        b=WFt4++KAW05wAKll2n0e+jER/vmr0UsNBnQQMwuUVedgM8sFMJBwUWNnEZopxNMsP4
         lV/UF40NO0yBkrz3GmarmnYk2i/gxv3jUdtWJmsuTDwIwRv1+EuRmehazaJ9upIx7t+z
         5lKhitYXqpTiEjVB/S5kkE0OJqYfsX+Udi78+hUudbJmKUHGTC0LMnmWe71rOIQ+ZNSF
         r2apeGRV+siOnPl4G8rI6I/7d/DH93rU02INTNNWTsy/o9OspEGsVJlaBQiqyr09q6eW
         VjtcSfs2nPCvw8lvbLXi4uQVxdHdG7z/FhaCCGgMf8QA+riFP4TuHuj6L+Lbjd1jAiZQ
         jJkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592643; x=1793197443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=;
        b=mVeuAnoFaOFhfQvLiTtQZZmds+N4yQc3zn1YhqdWZun1Ga2c060+QgCj5oa3Vpievy
         W8h5lVHAmxwkk0w0uAndhgGUG1iTbAaNoHea7bm3PH3xe7Ck0crjFjM5EHNcYHzVn/x+
         oqrKnkuYtOGcMXYMJLW5DRotaFfiSySwwMm1eSgHxzMLXGzQmIYEk3lXuYl6YuuK2b4G
         /FESwOM1mLoiV0BgPtBDNktm8XVaDhb8GSNrJpnUWpVymDUzus5YThDdL7k+Fez3bDkA
         LuCVCtCXN09raHfO8/VVqyW9wSGP0iWa+kxocdr265hovuU+Dwa0MVEXTu160uYy6Euf
         XrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592643; x=1793197443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH6oHG3/Qp34ti4yckIWOW65CjO9OEZZdj56Vscx/3g=;
        b=RUgIkG7DvfBM4sgyM+cU4bq9NDrQZqq+yWZp1L9Tsl2R+FiTR82vbkoiwnx3Eq4a0n
         CBRAjUfVZfpkGwT9Nihfr0rrJYotPVLrinSV8xxK3/A9U0T91Aljbr4zE3nmRCiDExAH
         91cNVtLK+pmu76J3BJZx+s2USHn9oXJcKUPI9dE94gz5Z8UZdZwsDn4n/CFAmphbgFgx
         ZaTGdlqfG99YNQ6fHp3MeGr7udd8c189/aCUf2yqNFeeEoRXAmKyOgoE/KZJbvQb1FgY
         LWZ0Moz26vQlxTEDXDXYBLeQL86rfLr3Y1scwotKDsvaSZNdr+QbhHHpyQpokQNwfXgR
         44Ig==
X-Forwarded-Encrypted: i=1; AKwUvByGEeZlVFEd34XY97DvEXK3hE5CgdQfFPpYMPDL6rgYLTXsurPMAhKkl+XgROJbYcy5Csg/eY+HH7IAoqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf2kWPXd0e8ppx59aDIOJ3+QuKIPyqi17oYYvp7Ku2Pu1QXrt2
	PMh/ah/RMupl5ExiTjBht0JsjbXM1hbWYnapcbWFw2yTIj5JlT1BibZ5buXOhw9mitKGcDHnTan
	nPx7MByPsBHCDjsnoZ3UeLkRIYpZ2k68=
X-Gm-Gg: AYBFou3+dBZGZGiZ3XYxDZBpLHPp7Y1JnBo5EoF4vSsmimcKLJIuyVqE/HwzJeyWH24
	uBK9CDRh9qQdZd+suioYKqXLlIgmm8MSSfiShDJqaEy/z6QuLqbvcHoqsYr3BlrIGfm/5TGPj0L
	ZkvSKH4SGD9dn7cnb1OYV+e3D/LPpnqSFMAEquWabUnmaeICW2k2YXUAwWCDUWfwHm1mUx+6x4/
	DGaa1TIZGacaj1bvdIx1fpEpZcx+nWXV8svRFaZyJHc5DA7Wej8wo0ISYUSrNuW5xRDGEHw4Fny
	LQOX+r4iFyPjO314Oh1d6KYZwSKUkKhvRBflMmH6XR0cbtme7dmqtTUY3LjSRIY97VygYjzb5Yg
	JhFgBnpjYzLQxZ9+KOdrkFjXbqrQ26u3awIuniaWAk/QkBBJGRfQMUXJziLkel+QSPuv8AGMnCS
	bbupwO/4CovJGngT7DDi2m
X-Received: by 2002:a05:690c:e146:b0:8b0:aba3:a3e2 with SMTP id
 00721157ae682-8b133d39371mr7017367b3.37.1792592643275; Wed, 21 Oct 2026
 07:24:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021084337.1515468-1-chris.lu@mediatek.com>
In-Reply-To: <20261021084337.1515468-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 21 Oct 2026 10:23:51 -0400
X-Gm-Features: AclHuK8FmV1TdL0_oevKDcXRfpa4yUifRgu3gHeeFUqDijVRdFDfONErTdM1fR0
Message-ID: <CABBYNZKqAa+3V1k3U-NBodfAhYRV3ZqX4V7bp5NFrXY0ndgL7Q@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/3] Bluetooth: btmtk: fix ISO data reception
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Hao Qin <hao.qin@mediatek.com>, Wenlong Tian <ot_wenlong.tian@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>, 
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Wed, Oct 21, 2026 at 4:43=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> Resend due to rebase: the base this series was previously posted against
> no longer exists in bluetooth-next's history, which is why it failed to
> apply. Rebased onto current bluetooth-next; no content changes from v3.
>
> Two fixes for btmtk_recv_isopkt(), found while debugging LE Audio on
> MT7925, plus an update to the ISO data transmission setting. The function
> is shared by every MediaTek USB controller that supports ISO data, so non=
e
> of this is specific to that part.
>
> Patch 1 drops the zero padding that the ISO interrupt IN endpoint appends
> to each transfer instead of parsing it as ISO packets.
>
> Patch 2 bounds Data_Total_Length by hdev->iso_mtu.
>
> Patch 3 updates the mt79xx ISO data transmission setting.
>
> The three hunks do not overlap, so any prefix of the series applies on it=
s
> own.
>
> Changes in v3 RESEND:
> - Resend due to rebase. No content changes.
>
> Changes in v3:
> - Patch 1: instead of dropping a packet solely because Data_Total_Length
>   is zero, also confirm that the rest of the transfer is zero-filled
>   before treating it as padding.
> - Patch 2, 3: unchanged.
>
> Changes in v2:
> - Patch 2 reworked and retitled.
> - Patch 3 added.
>
> Based on bluetooth-next.
>
> Chris Lu (3):
>   Bluetooth: btmtk: drop zero-length ISO packets from endpoint padding
>   Bluetooth: btmtk: bound the ISO payload length by the controller's MTU
>   Bluetooth: btmtk: derive the firmware ISO setting from
>     MTK_ISO_THRESHOLD
>
>  drivers/bluetooth/btmtk.c | 44 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
>
> --
> 2.45.2
>

Sashiko is still flagging a problem:

https://sashiko.dev/#/patchset/20261021084337.1515468-1-chris.lu%40mediatek=
.com

--=20
Luiz Augusto von Dentz
