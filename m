Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886193D47A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872267; cv=none; b=ij39vrA/noZi2+a29JF3S5eVWi8QvT6JfiJWBPxiUhF/elQLqsKQ/ILlqLqZByjH34dQlJy/AihM5EJ9J3hw3fU72b/Cj4Di5UeNmdWtx0R7y4Qz3MX/aiE3MUKm/EHwMFzj1S3KZ92JBmZbcrJVO/FCeU2aLBXz5el2imEE/zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872267; c=relaxed/simple;
	bh=kYWx5RpivyoZBMxCN5MZurIlKNZ0UC6vnLrCOyUUef0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hGCo204Vby6h/USe1mAcuw4v3+1QtDhLjWSiMB3GM3/9Cq/oyzXSKP8GeQjSFW5c0EjUYk6qR+JikYb+ZAHJOAF2EdRV/ysXO6BaoHIzmXn5q5jOS+i0pxNMekj1PtonRuJCw3k6qKGsyk8Pq/dAe91vydXGWEkAeEwYchF3Ym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pM0hHJsw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pM0hHJsw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A8D161A138F;
	Thu,  1 Oct 2026 16:31:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AEB260343;
	Thu,  1 Oct 2026 16:31:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D2A9103282E5;
	Thu,  1 Oct 2026 18:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790872258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kYWx5RpivyoZBMxCN5MZurIlKNZ0UC6vnLrCOyUUef0=;
	b=pM0hHJswliRx31sgRkdLbtvJKvRmXuVd78Ui4BoqxLc06jY73JtJ8nCgEbjMspt2Gwf/g/
	vMJEDep25cZCjtSsiWkxPOyVsGBdhLjVr4xZpQ/wxrTGClbTZYCiDILpFrJxYzu7F0+CO+
	LePh6Qd2rP627rlriaUJCotUoy+44jtNvrVApBApRvwkncMPUtZcr0aK6VVPvBEzL5SNVk
	VINtr7tSMZkcZ9WAFqThTh75KEpQ7oZrlMl0so/WRb9BszunI543FoDbri3Yue9YFmNVvW
	7AucLc5wl3DTyAKO7c/UGp275MD/dtDTN04X+ED1gNqI+/3V5gc1wxE2b9JxtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?B?xaB0xJtww6FuIERhbGVja8O9?= <daleckystepan@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>,
  linux-phy@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: marvell: a3700-comphy: Guard missing polarity
 argument
In-Reply-To: <20261001151939.23658-1-daleckystepan@gmail.com>
 (=?utf-8?B?IsWgdMSbcMOhbglEYWxlY2vDvSIncw==?= message of "Thu, 1 Oct 2026
 17:19:38 +0200")
References: <20261001151939.23658-1-daleckystepan@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 01 Oct 2026 18:30:55 +0200
Message-ID: <87ik3lmlhc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 01/10/2026 at 17:19:38 +02, =C5=A0t=C4=9Bp=C3=A1n Daleck=C3=BD <daleckys=
tepan@gmail.com> wrote:

> The Armada 3700 COMPHY binding specifies #phy-cells =3D <1>, so PHY
> references supply only the port argument. However,
> mvebu_a3700_comphy_xlate() unconditionally reads args[1] to select TX
> and RX polarity inversion. The PHY core does not initialize its
> of_phandle_args structure, and the phandle parser fills only the
> supplied cells, leaving args[1] uninitialized.
>
> Using the unused cell can program unintended SerDes polarity. On a
> Turris MOX with a Peridot switch running OpenWrt with Linux 6.18.54,
> the CPU link reports RX CRC errors and fails to pass traffic. The
> switch PCS does not record a partner advertisement despite link-up.
>
> Check args_count before reading args[1], leaving polarity inversion
> disabled when the second argument was not supplied. This does not
> change the binding or introduce a supported two-cell interface.
>
> The same change restores 2500BASE-X communication on the affected
> MOX with no CRC errors. Cold boots, reboots and interface down/up
> cycles were also tested successfully on Linux 6.18.54.
>
> Fixes: 934337080c6c ("phy: marvell: phy-mvebu-a3700-comphy: Add native ke=
rnel implementation")
> Cc: stable@vger.kernel.org
> Closes: https://github.com/openwrt/openwrt/issues/24069
> Assisted-by: LLM
> Signed-off-by: =C5=A0t=C4=9Bp=C3=A1n Daleck=C3=BD <daleckystepan@gmail.co=
m>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
