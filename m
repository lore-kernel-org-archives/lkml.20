Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910663;
	b=pSr99457A+vDkW6RI0VWzymfr7ZinQi6JbsDzLSWDf5esConqyiF1AbX28ATdy28y7p+
	 UPEWHoY4f0jb6SSizsFBLEOuPaceZTqpcIccYDAUjLFx7hjB1q7wV1oZoc3XPlAAXs5sr
	 pHDVlSMuBofdYtOMkBn+v1qL0LlHz7SJhcvdZScVU01GFNArawacZyi3cb62UXm6gQTkd
	 SzW9gH2clY3qd7netAiszoZXv8kW8dgunIHrQ6Ilcp+l0EiRMtPV1aj5jUOGqV4PiPsAq
	 V5nx76yGNFGHHCqtPOgUAtjf2oPeEOWpuuu2gC+QUJBZDz/U+RVN07B/a1UDdFpbwKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910663;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=Fq85iTWFfbMs/DK60Cpbgjse8R+dFtJQtKRypS89pjg=;
	b=qqJtfdeYZtZkai62xkd7I7zDd4RUUqhKOU+rzNpKrSo0YM5kyd2CQJY6K1F8imEPspsH
	 T1INoFNQj4RgdbSrEHLdJ3tgSSzdOmr98Srvobp6eR4XJvNv9ian3fZ7oIrQRBTN9YWN+
	 /+E8bn++7uPn9g6snNO39BZXkiq3s28/99L/LOt9a9zyNdx24/LP/ovT0lHdKzV72uULd
	 Tf1f65pMwvvpJDn5nTvtrq953hRpOkBlSRkVqLvX47sP4bPyl7dfQ4tS3hLj/b+8PXiiK
	 LHQpakD/691PJnOGUaIl64jEkPf1gyM8PxNa5sl8i5puxjikKk3e00eV1j555XZRNmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Nibjfu/B";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABDA606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ABDA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Nibjfu/B
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B50A64E41471;
	Tue, 17 Nov 2026 10:17:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 892C45FC81;
	Tue, 17 Nov 2026 10:17:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E536D11BC0493;
	Tue, 17 Nov 2026 11:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794910660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fq85iTWFfbMs/DK60Cpbgjse8R+dFtJQtKRypS89pjg=;
	b=Nibjfu/BFR0rUZvUSF0Qk1wo79A9T8WheSo7UXfG6Pr0SA04cg97+NKYMwjOlmJIjipK7F
	LLvvjRGlGZuCQQLfRjARYRbK/rieXnEaAy5sL7pgZYalBgdw15XaYt1emRJL5fYV/9oXps
	1RuVGUii4zZZ5fQP6pZPABax+RbchrEFXMGtwZ6jOuTJAppv2RSMkPUrZV3esGA/uszTdO
	l1xB38BYFpB8M1KR+QWqFW+VHKQ4Ogh2Icwhe/UnOvtDhO4zpdfVUHywHlgSqjmF2AZttC
	XOz8Kr+jS/sCbp1W1ZG5FKcId2ZlG7RLa7vut4vysAo1C9re5A/5LkwXFsXJjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: Alexander Aring <alex.aring@gmail.com>,  Stefan Schmidt
 <stefan@datenfreihafen.org>,  linux-wpan@vger.kernel.org,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  Zhan Jun
 <zhanjun@uniontech.com>,
  syzbot+8a8482d4c33cc58babb4@syzkaller.appspotmail.com,
  stable@vger.kernel.org
Subject: Re: [PATCH net] ieee802154: hwsim: free PIB after hardware unregister
In-Reply-To: <0D7C088B45E7283A+20261113134141.2626113-1-chenyichong@uniontech.com>
	(Yichong Chen's message of "Fri, 13 Nov 2026 21:41:41 +0800")
References: <0D7C088B45E7283A+20261113134141.2626113-1-chenyichong@uniontech.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:17:36 +0100
Message-ID: <87ld6rn4n3.fsf@bootlin.com>
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

On 13/11/2026 at 21:41:41 +08, Yichong Chen <chenyichong@uniontech.com> wro=
te:

> From: Zhan Jun <zhanjun@uniontech.com>
>
> hwsim_del() queued the current PIB for RCU freeing before calling
> ieee802154_unregister_hw(). Unregistering the hardware closes its
> interfaces and aborts an in-progress scan; scan cleanup calls
> set_channel(), which replaces the same phy->pib and queues the old object
> for RCU freeing again. KASAN then reports an invalid free in
> hwsim_update_pib().
>
> Unregister the hardware first, then atomically detach the final PIB under
> pib_lock and queue only that current object for RCU freeing. This lets all
> driver callbacks finish before the PIB is reclaimed and avoids freeing a
> PIB that was already replaced during teardown.
>
> Reported-by: syzbot+8a8482d4c33cc58babb4@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6af5f575.b350cda4.2b6a63.0000.GAE@goo=
gle.com/T/
> Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Jun <zhanjun@uniontech.com>
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>

This is a duplicate of:
https://lore.kernel.org/all/20260627235805.17310-1-alhouseenyousef@gmail.co=
m/
https://lore.kernel.org/all/20260709221858.158063-1-devnexen@gmail.com/
https://lore.kernel.org/all/20260919223434.3882824-1-benquike@gmail.com/

Miqu=C3=A8l
