Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922660;
	b=JOTr2fM9eDi9eU+SQIwoe6dtPFwvsVgLG7OjSRXoDGI853VpXJ+cfI/HTGHzdAXaXiL2
	 Beszsflkd9NjxewYQ03yYZPHvMqxPeND9o4ZNnb2x2oNyxf/Wnb1LEW1Q/6i1rsrvYVte
	 0aV1dJu2w1ns2UeBW7kZxIgN4YDmfJvd8rbQyAKrDM3Ei7YhORvbbAOafPTxkjVw7iqDV
	 ZTj4pugxZ3sUjNVunvOSK6zNont4yRFIk8bOFzXA/FE3HRskSh8buKGskbjZAoRlDWNMi
	 n7JmGK1vXf1l9+OHmmvYPWNr+rqSNoE2BRL9I2U006aWDdSvxJ+EbyBFdb/xBRBGrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922660;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kgJsbkSFQTg78psnMvY+98h+QUISiT6jPS3j4plTkYc=;
	b=fyn58pp3crcQazHv1SAKU4T8zdxYA/Foow0IMrlkwSCebAnbO3AH5dWOKj4T0H8LM3me
	 lc6O4bGr/Imzdq4dwL3v3p0Xrh1ATsXv/ltOk1wqrhXgolc4WuBqFoUmhxLON/ZZweDzD
	 zFZnjUi4KWpo7SycYi6eUjCnqiwMcvVjQI9l9HHYZpZF2UYQFxldr//tqloqiY/pDsyIT
	 FGMlBBr8kP9C0PcBSdBvSRp7T3kRD+4tB45naIgr9reKZknJcCnU296cac7UsvZqQfkW+
	 NeWh6FB7AmJqoTLOJg1/KKJqMBoN4X6ajgdY3lmSICEE53VYsSDOmZ1TlttHw2n9eqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=giVPhq7d;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59375606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59375606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=giVPhq7d
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 039324E41578;
	Tue, 17 Nov 2026 13:37:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C39125FC81;
	Tue, 17 Nov 2026 13:37:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF44B11BC0035;
	Tue, 17 Nov 2026 14:37:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kgJsbkSFQTg78psnMvY+98h+QUISiT6jPS3j4plTkYc=;
	b=giVPhq7dRdRoR06f4TC8RWqFklXoez/76s9uytQrMgIti7gQzK+1OGpYprp7nG50WekpZa
	DMTMNw6uui4vy6Zlw49VDko3K9MkeEHexxRxqUGa75DaN7Vr59+KeCvBN8wc4y3qgfANXy
	vf3+xYpftUopPOUNo9S77rJSh6KnCvmm6S35gk3w9c8PJGVe54Ors4jXAtxUJfOMQK1WdT
	VDwoX56wXNRd2IBbo2tswuOwpkP5RPeIG49xWCR44IGWb3S1ZX9gO6oSg9WMTcSgxpZ99D
	adIrhXGMwWcgLgdvNwEbxUrkjsaCGmwJYDbhSOTf8mIEI11TGdStSNWuzlvtJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111-e5624093d6-mtd-inftl@mail.sdu.edu.cn>
References: <20261111-e5624093d6-mtd-inftl@mail.sdu.edu.cn>
Subject: Re: [PATCH] mtd: inftl: Fix potential table leaks on mount failure
Message-Id: <179492265670.2237190.17140350339838790545.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:36 +0100
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

On Wed, 11 Nov 2026 20:23:12 +0800, Guangshuo Li wrote:
> If the temporary ANAC table allocation fails, the unit tables allocated
> by find_boot_record() are left behind when the caller frees the INFTL
> record. Free both tables before returning the error.
> 
> This issue was found by our static analysis tool under development.
> 
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: inftl: Fix potential table leaks on mount failure
      commit: dd4e68b5061efb56eea093b6a9b7a6da49efda07

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

