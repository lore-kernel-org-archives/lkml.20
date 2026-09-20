Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B93A3D3CEA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909308; cv=none; b=ezdKrTCadpvV2Wq2Vqoff8aXnP78y/Kqe8oKs5A5WQ9Yf9tz5YUBvidL7HOuMUPFUcjd0uMI9V7geie/0mvGZcsMmPLAqrHDwY7p1n42tFIgXT5JVolHXWEAKwrgJa216waA2v4owuiL7/WRh93RzUTmkFRRMS4PKBOKhzWyb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909308; c=relaxed/simple;
	bh=NRPSdmAxs42vuKkUCkWoekBy34b6+JlJs8n7dne7H4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m0iLRWtRwiUO61QIqdw04I0Hi93nD96QWOfCA6JXBg+6kbWgE501qhI3BzCzC3gev+HHyaENi5vhRuRFSfBil5bbhDO52MsgDoLxHld5Iof2ZeRjwCzJxGRBEuY+TC5Mx5GIwZIals85JbIlXM5knR/aiZdE43sbtEApH19Wj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GvceU5c4; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GvceU5c4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F26AC5CD5C;
	Sun, 20 Sep 2026 13:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9330604C9;
	Sun, 20 Sep 2026 13:01:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69EB11032829C;
	Sun, 20 Sep 2026 15:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789909291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=NRPSdmAxs42vuKkUCkWoekBy34b6+JlJs8n7dne7H4I=;
	b=GvceU5c4KTnMX4PzxP+CKRHc2m4KjfXkpI8U+H7cZfuG19pUoq8MrreX+Bmoaeia3ZQUV4
	2L6LsN8zD7+vUD2G2o/+S7nfFpWZKU2wfug6p32I429nOby+EYExokiqj2a9CpIY+HKc5y
	Dc7As2nwf80BFqG/74ZlEhU3kw5cJojnsCsxbonve3lCog1vpw3604j8rfo9WUuncvIiiQ
	XQ70RdNxnOsDmcOdCpejfr2ttwbLo/faHEmRh+5R6oe2jlyJHgr1QPfDhnHY6TQwqM1IVx
	/BfUl9G5cO/mvlQmEtoasxd5+bpHDUZuoVWt7j3QZO6sYVH2/uckzaWH9gu3Ug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui Peng <benquike@gmail.com>
Cc: alex.aring@gmail.com,  stefan@datenfreihafen.org,  davem@davemloft.net,
  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ieee802154: hwsim: fix edge allocation leak and netlink
 attribute validation
In-Reply-To: <20260919223434.3882824-1-benquike@gmail.com> (Hui Peng's message
	of "Sat, 19 Sep 2026 22:34:34 +0000")
References: <20260919223434.3882824-1-benquike@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:01:29 +0200
Message-ID: <87v7809ivq.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 19/09/2026 at 22:34:34 GMT, Hui Peng <benquike@gmail.com> wrote:

> In drivers/net/ieee802154/mac802154_hwsim.c, clean up allocated edges
> and phys on error paths and validate netlink attribute bounds.
>
> Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

