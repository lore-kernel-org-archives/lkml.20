Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.241.220.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258586;
	b=GM47okd56D3eMvBy0KzA49VuEF1OX2eUhRwOrHVr5fypGbr8Qxd3xOxT9H4ZuuZ3jkGD
	 Oq6vZXImWjIAkqflhTFKVKWxnkdVe1kPwgY7JGHltLBSxfX+oEwOYmLNpg/pdD7mKQd0u
	 HeAbRK6ZNUL+rbW8IzgetZoI0RSBthWGGkK9B0yC8ktn8MnZmORCX87c2K6fYkw4ekTfu
	 nPJnjSB/S5cjiUDzFSTx4ZEm3Hy1bFLxoSlMuF2lKLG5EyZyDnwoqG2kd+TzGdjJUrfdP
	 KidRz7d9BYp5jBcDgAl8xI2AiiuL4kdgjTOcQeYfuon/4jZRBIqlbXtd2+AB7PCW+bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258586;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:To:
	 X-Maileroo-Ref-Id:DKIM-Signature:Content-Type:From:Subject:Message-ID:
	 References:Content-Transfer-Encoding:Feedback-ID:X-CSA-Complaints:Cc:
	 In-Reply-To:Date:MIME-Version:X-Tenant-Id;
	bh=0xeYOXy87vRk1HG34LnslJREtedPrEqOahPX4I7WggQ=;
	b=Cc3VOppgJwgY5jPb2Che6ulc98S6FdPJcVV0R1R4NEW5w3lalt29C9zerSnjJQ7HNnKN
	 mT/I7qv9g3h60dhf5WhWC/VmSL3QDgbKEGGGrj9e3l7fMpkZYpfR8Rpd/wwWR31dGo5zk
	 wmEumuX6xtOc0z4dxWZ489rB5ZpJxEXN8x2LJuK+JbdsAnpWVlODNWjK8O9pq4lU1jnsp
	 AVsDHHf77qpYJjqiwGpE40nmAwgAB/Kxs4DNenSKVsulC1+qWpDRU2Fas01FNF0vgXG6h
	 X9EZ/mzkTeJNlHZQwazmaiEpnnNHznWHX0xWJyjT9KSOxHCKXazVznx9GTVEDtC9P2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b="F/bEvkKc";
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=aaF7EQEg;
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b="AyxSA4/w";
	arc=none smtp.remote-ip=188.241.220.25
Received: from mta203.maileroo.com (mta203.maileroo.com [188.241.220.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0E8606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=F/bEvkKc;
	dkim=pass (2048-bit key, unprotected) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=aaF7EQEg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=AyxSA4/w
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoibGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=0xeYOXy87vRk1HG34LnslJREtedPrEqOahPX4I7WggQ=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794258578;
	b=F/bEvkKcVLZfMUgG8iD8nNyDp3CLUmhjQoNITz/GKSkenB7iw2G5XamLSBmipzgxjPe4wvH8e
	jVloMiT380oDRYCXZF+oTS/8JrN2A60U+I0U0PromBkqJ9C1f7RIknGryJz7ZeSKQwYKxLX1j8E
	as1sk+JSE/lnlwKp7rnQUcAuHzJFzH6A3WyMUMd91x4QUymO6JtSbhoBVAooh7ow9RBkDYS4Upo
	ZrV/HQoai7b6pPYrbwS/JUIpd8XsSoOcFI1/L3emMNIeXXjpYANin6y2BiY3gkO/WgVfLXt67f3
	5jKqL8a3MT5Kn/taIYvKKdHTqi+mMcLkq+sL6G/WUjLA==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=0xeYOXy87vRk1HG34LnslJREtedPrEqOahPX4I7WggQ=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794258578;
	b=aaF7EQEg5PzRmwcjQH9lpYqPPVQ73ptvDzhKKOdPwd1X9WSLeIrCqlOiCKyI28UqC53CjZtqh
	NM4d6jAic39NOlPvPDMwDL52bW90YY9xKRlzCVxUxA0uo0uD8hU0WJkgVOfRvZ9q4r+liz3iUYO
	PojlJFYfUr3vb2aQVAPcByUS+5DqUmX8TqxwfB6TxW737JF+jrZwtpdzvqPtrMymHcgJJIF3r5G
	ff5p5hDM1gb5qpWYYN21r5B2zp24wlsoCzeA0mKKNM78dUv/okb9IObw8Kld17XhORRGvWUj5f9
	304gesW4KRy27YrUyxNxhluPCUtKCRKI6KITGkAZSSnw==;
Received: from localhost (127.0.0.1)
  by mta3 (KumoMTA 127.0.0.1) 
  with ESMTP id df455bdedc8111f1a91f92000677b433 for <linux-kernel@vger.kernel.org>;
  Mon, 9 Nov 2026 21:09:37 +0000
To: <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
X-Maileroo-Ref-Id: 3016bfdc9dd670d9eb0ab4c4
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794258575; bh=0xeYOXy87vRk1HG34LnslJR EtedPrEqOahPX4I7WggQ=; b=AyxSA4/wfkPTIZ+eB4B7aN2uzxfg+ZVMPO7XoNwObNYLmlvlF7 QMJFW6/I9B9f+sUANWuIE0+O2mkiz6M75hcoDMQUUv7Px7TUyegj6ZuZpf5XvJ5dea+cvFDOkXz ecqxbllVZHrZnTbTP/pH15s/AyjXl0OrRtZybOrQhys0zas26NkZ/gFCEwugQjVyVCVu1ztduC8 sVoZ7viG3bZU5BGOCHsS0f8j+tdMXrBvv3/ogDQ6UbYVSvr1g6E3bN+SOdWLl3FsBCWGsqbO6Yv OtUDduh+z1sJ5hFXp782D9No2qusVxT1vSBm5xP6nibgA1JUA/OVKyyg+xY2Tk61EpA==;
Content-Type: text/plain; charset="utf-8"
From: "Dario Ackermann" <dario@darioackermann.ch>
Subject: =?us-ascii?Q?AW:_[REGRESSION]_x86/microcode:_boot_hangs_bringing_?= =?us-ascii?Q?up_first_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode?= =?us-ascii?Q?=5Fldr?=
Message-ID: <573088061427271854315322.9091.202611921937@darioackermann.ch>
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch>
Content-Transfer-Encoding: quoted-printable
Feedback-ID: u56201:maileroo
X-CSA-Complaints: csa-complaints@eco.de
Cc: <x86@kernel.org>, <bp@alien8.de>, <tglx@kernel.org>
In-Reply-To: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch>
Date: Mon, 9 Nov 2026 21:09:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Tenant-Id: u56201

I found two similar reports on ASUS N552V-series laptops with an Intel i7-6=
700HQ:

Ubuntu N552VW: the reporter tested upstream 6.4.0 as working and 6.5.0 as f=
ailing. Boot stopped at "smpboot: x86: Booting SMP configuration:", and dis=
_ucode_ldr allowed booting.
https://askubuntu.com/questions/1512327/ubuntu-freezes-during-boot-when-usi=
ng-linux-kernel-6-5-0

openSUSE N552V: the reporter says 6.1 works, newer kernels hang when Intel =
microcode is present, and dis_ucode_ldr allows booting.
https://forums.opensuse.org/t/opensuse-tw-wont-boot-without-the-dis_ucode_l=
dr-parameter/175229

Commit 0c7ffa32dbd6 ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_br=
ingup() and enable it"), merged for 6.5, moved AP microcode loading from af=
ter the AP startup handshake to before it. This is a candidate cause, not y=
et confirmed by a bisect or patched-kernel boot test on my N552VX.
https://git.kernel.org/linus/0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6

I am preparing two upstream 6.18.55 boot images, one unmodified and one wit=
h the AP microcode call moved after the handshake, for a direct comparison =
and to work on a potential fix
