Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336100;
	b=crWo35l9cElGwx5xkNKpeEuQAne1bvi0AmgC54ah0A0CHysi+cveiuidr8cU4RuLwYVO
	 lswdcCWzDC/oNfGk9j6pF8ris72Tm9INBHDgT+PQ/icoOCGKG6ZC8Gsqm9rWYGkdAviTe
	 FUTsl5KnDUZDsPbQR8Yvf67NmR3R82PhNLxyw44OGWRwMxAI8KU/muP46Wa7GlJI05WkB
	 XtW/8U4OFyd3QEOxkZYZeBNtHS8/GC4V0fQNvpQCSS0esvkb9qdZQAmbh8ouevyOAeKxk
	 cGCqADFffep57BqswOzyi5uihepQETawzpUySRibI7ax3u7m6UKAfvGH7UMAjYOIOIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
	b=JaMftZgocHEAqMRHKeTC8+cg1s8oDuLpHpPB4nUXTqBiHSngbJbc2ZUOz8G+gCQlpJ9C
	 GUn99eYFIl1nMU+dtaXjmN4ZCOirowbYIwn1+5M4HegZNFQKfXUUQvo1tOY8cWvE8nJqU
	 cfbC7QjPowitIOPfyKtxzWEXY4dWl0Dcz922DqCAzbYg8IRBoo3j0WtfrZKWX0RYXY2YE
	 9FR6wjTLii58P9Rlsonn+sBOqktr5aTrcdM45WoqWlzV5cSKTWaVMhJKh/J6QxgLLBeRP
	 5Hnqg5klP7jTPEpWegHUhx44kysns5wj26er3ayTNz2ehKekERdY6u1gJOiRVjA2iPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+oRdJKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EFF606C6C0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EFF606C6C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+oRdJKn
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14a204305so1987758e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336099; cv=none;
        d=google.com; s=arc-20260327;
        b=dO6u7oeYvgcHbR7fREyJBlAe6k/Hbt87/95O0qgUNLTeE7uEa58ck87xcpn2ErLZTG
         6e1nOF8ZQo1F6hUuZpMFsVDQBmjBWCf9I9jui2hkqzoet8gDp6ulGgR/7ytwpYyYxEX1
         nmguGf9TOAgARlVEHt5GylCRnpNrOtjLsFYRSpqPHUHjPCksdcB/Df6SXoYefgjcN25J
         +Fn4ZL1eO91EL3jR6dXUeqcg/7YE6WYBPLIpd8d/sUoGTVUQaK5H1aAziZTEvI2qIF8+
         GFlK0SGwdcWrElm/my8FzrrOGrdLYojaZmafWC9xPpsyrDqFxmEjfhAS/MHp3xQD/ZaZ
         +z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        fh=8lQ2TheNLnctCltvFMdZvosMHN8FvMy2eN15mG90szU=;
        b=WT8lSIpZ4HZjuhLzejHsmRBd5YTVctCbzdG6X331g2pen8fHtIh9WBhxWxbb0odY4K
         vcDqSE/D6N5Eg/zFnuDr+tNVzky5b73S5PAa9CAeUR8OnxE/WSN8HwuWbeFzZ3GQ+RlD
         fvG5ZlrumDx7RW+qNSI+iJaZ7r2p1/DnWEYfQLDhfoTUs5N70C2+Ml3xa4+uwfZh0o0S
         Qb1NBRjib+IiM6rPlFF7iR2kqkTx4x18dOUULzlLlApGiAu2CgqADHPUXIqq1rcl2qcP
         IJoYfwN27Ed/PtFWDh22qS94epK4tOtcubCM6tpkHIkwgQozdRykbOr88XkldiOnp2sI
         SFwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336099; x=1794940899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=W+oRdJKnzbnhAx23a797Cs166q8KUYecssliDZThq98kl1vc+IUDIXLauH9mazRliL
         abW/QptM9Zg9AyZOLB29dX32hVHoRQ0BLoeIgdiZzEOGxupAkZo6CmYu5naphLS+2HyW
         6FBo0tus+fFHBkQgrrlOi+RUWXyCO8yiTxEICP3VKlOWvHa57/Fpjb4H7r6FT+aNuyOw
         gpCzIWd9KXnkYJ+lZc+3YlxNyQTsQKh2f3Je73aG4X17XOYKvBOdSGyWnY3hmdPV+Bnu
         nI2qzsecjRQdrAVH/jAQEFUauzgkPNN5Dw5qKaQp8HrfCeAuJNWwUHHOJ4CStk7SE5Nk
         Af6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336099; x=1794940899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=UNNkSfEBWuXAhMuYMIPgt5jwMVJRj1hsxItniTH6Lr+P4Cw5QhKeF6FQNN2Fxd3zNo
         TzFuBTLlzANPDWhLhsRL0PcIuvnGeXswXBunSVgy1GM4QfEtAYygGbJE9EEUHXDPW+7w
         LH+4TTLyH5pHFvX6oXnGLAsGcfRIKddN2VCcWo2wISu+H4Eedta2Nf5qAgESXTQH04Tx
         R4nrhLnFvqZnbN2hUCBefcmOB2dPZ+sWfAoVgws5qxEqFjGodLEFqqhfHLtBX956mwO0
         AhP2PBoT/p4Ya/awM8NiO5yiT1eDn2CylVjyZwztVOROiAE1psDfyts7baNVjFuTDBBL
         qgCw==
X-Forwarded-Encrypted: i=1; AL+hErGLlNhD0+o2Dz8aLCPJMnuPgERgqxt/PEhzV6njerH4feuAdER87S9CHxSniz0H7EwO/T7JBUNodjjE6kw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+etZdD/BN/MxEfKs46f+SUQjVyolstFEAul/7NlldfJQIlXi4m
	GvYxhP/eZv9v76HcN9zEP9O8mlYwsmDrmnZ99H68dR5QbbO43Z8xF6niA+DPv+ML22dzMrMOdKF
	YsmM5YchQmffjBatONN2qIvISe06+rXhkB2Qh
X-Gm-Gg: AYBFou3AIlZDXvRXA/u1axyq8TqPXSJwwJg/rz+nR0HmT0hD3gBC+NFRwKtqZL2LL6v
	Vv+GmettEjoC/ErffdPv7ignB86Q5mOxEUAkkv+ixc6jvVphm1tzFkJWF/gi01fzNQUVM/cnLoK
	XN2XkZS79qJ2uMOfeoOTBlPY0azWNvyOrZ3es+NX1Bkt1YGGrikIj1YXdeC68Lq48gOyvTvFflQ
	G+ncG+GcKpV7YzizAOjhm29PQh+u6t6S9C7JyKp5xgKgQxrbDWxK2H9pFUEXj8U43TbJ95PTyhO
	tCFV1LWiOC4qVu++0+4H221xOGRT5O/M6WEbj/wBIk0WNZSR8kKf7eC6DkYzm0IZ5m2qlRMCPl/
	zupENc2J3ipfxqqJ461oa7i05MzvOIbADKN+LPMQmjUXp3BrNlP6ndOZjQBuOm1flfyqePDuc2J
	GyU0N8VXJCbk2t8ERJ5CrtQGhJqg==
X-Received: by 2002:a05:6512:2506:b0:5c1:5b62:8bc8 with SMTP id
 2adb3069b0e04-5c15b628e54mr429046e87.35.1794336098639; Tue, 10 Nov 2026
 10:41:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110150546.1535950-1-lukma@nabladev.com>
In-Reply-To: <20261110150546.1535950-1-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:41:27 -0300
X-Gm-Features: AclHuK-B10Ha5eqEFsmLjifrfjCOeHNDcssKsSt9aMG-Ic6xnxgK7qKCRscUdio
Message-ID: <CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Tue, Nov 10, 2026 at 12:06=E2=80=AFPM Lukasz Majewski <lukma@nabladev.co=
m> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.
>
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
>  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 577 ++++++++++++++++++

You also need to document the board in
Documentation/devicetree/bindings/arm/fsl.yaml

Make sure you run 'make dtbs_check' and that your patch does not
introduce any warnings.
