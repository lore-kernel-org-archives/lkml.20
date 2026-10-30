Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350289;
	b=u1/H8oo0SuK0bNoWMRbYiIoFgCz0XgLehyAkVN3WowJNNfGg0Ym0TuU33lg7D9aAn/Tt
	 J6EGkyyY7+7NTMnCMkSUnEgiPQ0jg7ZUYPv27vMU8if48UEi8Rv6j9lKHB9S0yK2qTPgD
	 3P8sWO2/zYWj49VUwDGNFjE2AmO9KBCCh6LvYVQB2NvdlUdrC4iG2SUbLCuhi2cgr+Lk2
	 wmJQBW1ZQQLe+pB9nT+DCb4YENsWNxP7gjPb/w8Dc2bkiKj8HKrKbOs/MxSJYvZ9y6hsH
	 Y8i85w821lKtXeqzWOAXNcR9bIYkDUaATZjGX7x7mxxc2WnHJIWH6Gj0a/bH2ENVc3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350289;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=wZVbk57gT2iqyu8IKrJI6vssVo5jjwGVzOMOSn3tWns=;
	b=ytbX9+IXIL9jdtusSWOBVnkP0bTMEOar9aGlmE0PUORsnF4LNEqzMqfrO0OdnVLKLE+x
	 rBCTPIz5xncRQ9vcPZzrzhNaObMUaa3lnMZ79UiJN4MrPqzx8MmIWrECyM/QCbmNiYc5p
	 g9P0wkhn3har3duv1Ax1g0OxBt9hIcyFGUjtXewuirnTeo1zjBZ719b/VBRGCAABQo7wn
	 UlZIJcY36eoe6Or3+0wBgLhcB3zg5+uHuNKe/yompW0C2c6bA5umTYS2XzEK84VXn1qOL
	 5cOMEtxcH2HzukzbiibqzES13LQvSySDw7FcMNhutbVnSR8FfN620xRmq/zuax6L4UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HQxupqJW;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D95606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HQxupqJW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C07124E413A0;
	Fri, 30 Oct 2026 08:51:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9319E603C2;
	Fri, 30 Oct 2026 08:51:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F6C6103286AD;
	Fri, 30 Oct 2026 09:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793350284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wZVbk57gT2iqyu8IKrJI6vssVo5jjwGVzOMOSn3tWns=;
	b=HQxupqJW+fseP2wr4JcoiD8kkAgEsL36SqXmMgkKePufVwvdnfTRAhIXjuNsxodj9YUSgR
	rboNip63vFtBCj5OgSL8YA5A+t4jFwHfNV8xJ/bK3CWiQGiOeKJllv8YzDeqmWzUenc5Bv
	teC4ejZ54Wp48XrpXYvuwNM40xFmeomrax3PgMajAyZn0gT8wOm8kADsjwvwH9YuHL2VI+
	AjwQy2hlqYCoAvexOJclGq9525HIcKOW27CaoBb0Nl5U2341pdh7B4m5bv9+gbfNbl2Li9
	MVlzbHo4qF9dfutC3Lhef7spAjR30dJ/be/dNbgXDxzA9kzrZ+MZ7wjZCNSlJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Martin
 Kurbanov <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH RESEND v5 3/3] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <73cc1302-d1fa-4c32-b6ed-4c44cd48ad39@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Fri, 30 Oct 2026 10:37:25 +0300")
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
	<20250917215401.19132-4-mikhail.kshevetskiy@iopsys.eu>
	<87mrrwebxh.fsf@bootlin.com>
	<73cc1302-d1fa-4c32-b6ed-4c44cd48ad39@iopsys.eu>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 30 Oct 2026 09:51:19 +0100
Message-ID: <87h5i3eflk.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 30/10/2026 at 10:37:25 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> Hi Miquel,
> I think spi-mem capability for continuous read support is the best
> solution.

Great, thanks for the feedback!

Miqu=C3=A8l
