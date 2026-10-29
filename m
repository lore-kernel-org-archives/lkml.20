Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257794;
	b=iHI+H+DaGUPdMv8p1VNAE/PNE64q1huS17ZcZPk50aczPOKF+pmKO09rMdJURc+0qxEP
	 8LgORtTQHzaNNk1FRoDPmHlIHVZu471ijlxvP3ZXcMU5li+A6boKi+u6KN5s3T3skYM7v
	 jfsasoJX1yTdMWMnSQQdwPQxwicIBKeyxy/qEbnhNk+Og6J8oiSSxP87kvChNyxguUbM9
	 wraG/ut1WAIe+vCm0DLDFvfN3La5tRZa2AfPdQceZcG/73hjvLyjJtB96StZsEMBcGfk2
	 D7wyGOzNplEHHm0jM3+Ld0mm8ux3tFiLTcpRyd9sRZI63N35s79DoQGPqXnSQzwyxJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257794;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JNNV788xpo7WgIiTAmutGEMDPMzL76pTp2ULVwQN6Ks=;
	b=1/DYDO48yL/1R9xZ2TZRdn49whseWZSqcqg1aexLf37/NQ1nXmYTSvQC2OUYzXOXvl3w
	 zZpKyMxt/fGl14bL00Rj/KXL0qlYjhYwL7Xdg1j/XdDmMiq1WRUJaKuoKUY98H/FVGPrr
	 ZhLMqmLsl6AHyM2zvbMWNAZNziBcrEkQApt0wBrx8Ewzm6o2I8RsjJ5LuNCHb+XZH4xCe
	 Ls3RjJghPJBkt9MxMa98bPVTGD6NUISd/vcZAgqFwP0wnR9kfDl4RPZk2qqT/ptJlHTnr
	 RzjgIDlSF3B2OGzydNvpybWNxoKZhTrs9NqqDsA7LeDgVUvg2FOYaH8+hS8cwLu0RxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=NkiYk3Ms;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E55606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=NkiYk3Ms
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793257788;
	bh=JNNV788xpo7WgIiTAmutGEMDPMzL76pTp2ULVwQN6Ks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NkiYk3MshO9ilazqOGwBYobhQf0+hD4h7bgMU0j5d5SnnuRWZdDuX8x4ZG7uU6o6T
	 l2yp8RCvXAaNrMBP+RDtw0EHy694jlEznG1DschGchSYJKm881dV1lJo+1eA26ZBxJ
	 5a4tuo3gomJBVbZXIUBXlGv5NeJChzzAts3O/iXw=
Received: from HAPYCAO-MC1.tencent.com ([61.151.228.145])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 26D9EAA6; Thu, 29 Oct 2026 15:09:45 +0800
X-QQ-mid: xmsmtpt1793257785tqfw5o7kv
Message-ID: <tencent_4EEFD45526C7EA904A92EBD59731E1362D07@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoefcWCFGYWk1ixO7KUdSk472SRPFHO4J5adNW8bCY/A34rt+p7Fy
	 bjHtZIKadn+/bIfIw02M8KziBTRXfswB6Eog7UWgBVkOq/Mnv06gBQVyGr6wbOZdtwsl7olHzrU0
	 351/St/RyQJclOkPVaSlFJD+oNIxIQkpOQ1HKp5sXvuNftFFyjIx3mYt4g1WFvGdz2balqXgQFYb
	 xJ5fR7D7ED278ZhRs3G+Atjzaed/kIDaolRpFYUcMdhp+SdUsd1rH8cTBl8w0WJd3sbIus2c5eGu
	 VfhDz/B/eddNNVMsM2x4Ihe8kOOiXnrkKoMnS0hUwIGaFbF3H+udmbWKZjGx7+Aee4B28bcdpuQA
	 ttK9Fgf2bpDdYHImFDNrpPnnLdAEaHaCapF7XJbo5aKZIlpKLfVyWt1f4dm2WUpACCWaokiSRRm0
	 HNR6qxXiwENDcjP/mGt5asyNTlXWbq0fE+d9Pu7CM16oyRvglkZwozKlIfblqUDL9K1qcxhDY4WU
	 E7+EPuptoEtcAZ8hX+waVeB9gW3bRo4+22/xhFsvVVTJ5vVq/mY0T40BxoDKNUQE9Ai5iszso48G
	 npSOm79DLWrwvn8PIDPlOJ7UME3L6rebLcWE+pHzpbZfGZ8jChAz0X6yQPiunrEuDqVPCUldmLiY
	 lOJirRQiQxRVY28L96rDvO0zCsYm838d5VuaWjxhAcIftuFKPFXdZyNINmxKoFIRbvBlnxTcF0KF
	 VdDtOd66h/JtGAkbPtg0jV7kuqw7tdph8SBrex14Wmi3/ZpE3qvQG+AuKfWLrfHEDrtMXH+u30fg
	 H52jabsRsRbI+RR+dkmUCBNTAAr36dylpZQ33yQyJ7w7LMXl2QEeKuqXu3sdGVVJ6rhgSip3emS3
	 z1jyWRXOmnD2LujNyVFNfIqpFuWHSmUA3z9GxYhAW3UZDF5071LN8CMa+e/iqzurSs4aL69ZiUVb
	 R9dHGzn/7HtAJ1XkKmIxFKf41IXoJfSNTDg0AYNjZo6ki6tgf0yfh0F75FiiT6k14mBsL/XbGYMZ
	 mbtvy+om4XoPadAh7ZcTLEqbofwBK6t6t2y9t/VWFcOfc2QtY/9e9sdxVlzhc0bNC3F0ap7puxIl
	 gRbADEeqNDhN8E4Tunh3R4AODs0BUkGPTSnltg
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: bo cao <treebacker@foxmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	treebacker@foxmail.com
Subject: Re: [PATCH] char: uv_mmtimer: prevent read-only mapping from becoming writable
Date: Thu, 29 Oct 2026 15:09:45 +0800
X-OQ-MSGID: <20261029070945.64492-1-treebacker@foxmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2026102935-corridor-surreal-ef51@gregkh>
References: <2026102935-corridor-surreal-ef51@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Understood -- please consider this version withdrawn; your patch
covers it.

For what it is worth: my duplicate check is automated, and
lore.kernel.org is behind an anti-scraping challenge (Anubis), so the
list archive was not machine-searchable from my tooling -- that is
how the duplicate slipped through.  Before posting future patches I
will manually search the archive for the relevant keywords (file
names, subsystem, subject lines) to confirm no existing patch already
covers the same ground.

Apologies for the noise,

bo cao

