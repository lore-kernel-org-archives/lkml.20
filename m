Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922647;
	b=dnuKvaabapMYNIoZn3mWdvg1fI1uYvIW7zStD5z7WY4nGKZHPwCqigyRs6HmiSdVrbpX
	 TZcrR8uPR3WaO0mnyaoWDHhFAGhjScOUtFAqNDHp3lrM7te0SDqkGloey99c6L/o4Rrw6
	 KhJg6ZSS4At5YPGmMxUcc3LWlFHR/fq8+EaiAUCqdVSzcr+dotz6ksdrldIsF/SjLCgyZ
	 UTOxRCCzpuzZXVdzBdiTg1J6idfzHEdNy4yROsWhywG815hpYc36n1QeNQMXEbVZPDtdB
	 2m+2fs0XICTmHmr7n0APF2SPz3bBY5noWwqZLTq+foDh/7b06x2IrjBKWJYGGdzUgDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922647;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RN9Nut3oeGkfRqkfSsbCi6HaJI9uch7KNx799Tac2bE=;
	b=CBDjM0Tj+JHqDDOWJYvS48s9AZ0VjPEm+cmLS9jzD6X3iJMeVrd+tUuWrnv+2ZOwNadh
	 jcISwJ/apxo654onoQLyefRajqgFRWbo5HBTVLLOxZxS+0bpWHjDmPnasJK6M+lmCnxTS
	 oaTQreSg0tFaY9anotTyNExoWUX17zAFB0Hf7xZ1qs1tA3zdTiI56s33w8LeQTr7q6MN2
	 m8/xaiyei4tt97N6Q/IZmaXqCtSiFUUe3Mmvcg1sGLTH6dUKWfjbkWQsdwjSiqTjj0cy6
	 VqDlFDsdxY/keBVcQz4xpRd2p++P2OJJuq9REjdWzmOUSWwl6vjYYi+196KpW+5beUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LwBBUZfE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF866606A323;
	Tue, 17 Nov 2026 13:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF866606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LwBBUZfE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FFD61A162D;
	Tue, 17 Nov 2026 13:37:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 646315FC81;
	Tue, 17 Nov 2026 13:37:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E7C211BC0039;
	Tue, 17 Nov 2026 14:37:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RN9Nut3oeGkfRqkfSsbCi6HaJI9uch7KNx799Tac2bE=;
	b=LwBBUZfEoEZQCBaqs8oLy67jOSixfjAtXssP3v0YMB4pzooGwgLr5iBYaT1xXrt3hJbEdW
	43mdRtr6Et1/T+OdT6LV+Tvnd7PTUKub7C0iMtLYeCWh0MxHubApkP/MKPlary3WpjRez/
	Sf9V32oF5j9qgFTgou+1bzcXy/TVyLpQL44b7xfT5GK+7K89qy7t/lIwIvR0sdNfGYlCYv
	/ocvKwMnLJCJZI8utIa49s5PNzw7hPVnc18s+SLccrPD3uRrSoHbT3R8yAPOgpJtGrbinB
	m+mTCuYkbQiaMEwDki3dyHKT4+N9jzROPqFB+wPSgJiOnMJtKqEekLkewOq9Yw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Yige Jiang <yigejiang86@gmail.com>
Cc: vigneshr@ti.com, tudor.ambarus@linaro.org, richard@nod.at, 
 linux-kernel@vger.kernel.org, geert+renesas@glider.be, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20261029181114.78137-1-yigejiang86@gmail.com>
References: <20261029181114.78137-1-yigejiang86@gmail.com>
Subject: Re: [PATCH v2] mtd: hyperbus: rpc-if: fix an OF node reference
 leak
Message-Id: <179492263910.2237190.12695793607348858612.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:19 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 30 Oct 2026 02:11:13 +0800, Yige Jiang wrote:
> rpcif_hb_probe() gets a child-node reference with of_get_next_child().
> The HyperBus core does not consume it, so the driver leaks the
> reference on registration failure and remove.
> 
> Put the node on registration failure and after unregistering the
> HyperBus device on remove. Leave hardware initialization failures on
> out_disable_rpm, since no node reference has been acquired there.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: hyperbus: rpc-if: fix an OF node reference leak
      commit: c16be34e0c713ddb8824c5f2ce9e3c4a3577dfac

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

