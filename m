Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905590;
	b=ljI7kyhGR2rZcKNnKPU3ngH+t5m73Q7+0uj0qLvSquu0WJQPHl40bUWXQHvscV+nhg01
	 hKasIMplHljPEETQLbTHEqJ+NP73KcZ0ptLeQs1u0AX3AMzbzZNhHu3mGwQs1MtiUjQk3
	 4+iJXFUYrrup+juEZAocZamNTbGJaTi59onU3MOVP3Lnoqi0SxFocp862DmHE7v9NfQux
	 vG6pYh3SD1ZVzJgw8iexqS0ObU1HawyBw+eFhDhnZOi62kdO7A8Vgful2fvY5WmMKpheN
	 SSUhBzWYROEHFPMW/8T25yWacLjMWXua1Ub6Uds6MnHvVMFGyY2KZ4qUCV5yyVkt1Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905590;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7s8O1PgAP+b8IZIA0/RBQkSPXt9t+NWHKJ4hOPavqXQ=;
	b=OkrlpPr52ybOABTQVn6gPiaBJvpuZPDWE69rFlEzojaBCaV2Pd90xcRzcD1DSuvcADhI
	 Ko2wlamUtO4OPcfuxIVTnrgFoOzelVFwkSKkGYvJ0DELnJk/AfKDzWlcHjycy99PVqSRG
	 S2zOVe4sWuclD700BJprjPnKwBlMY9Xfg8exJAOCSLmKhoaGvqupBTmybqIyUCYYO2QEt
	 YFlfiIdC8ltdR52vgCzwtAYCQySfykzeB4+1xUKrlZ2SSaZi9gPBRDcjuM3fJpTu/vo3O
	 HG0p6YrTV8bc44rRqaFhrhHKlDwQu1vNdFsyjCf2vciV36d87dHSh5MQBQOcmh3DQKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QYIvphZX;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FAE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FAE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QYIvphZX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794905587; x=1795164787;
	bh=7s8O1PgAP+b8IZIA0/RBQkSPXt9t+NWHKJ4hOPavqXQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QYIvphZXdkt/j89IPTrsW6VQHru/pE02FrkfKEKqDcl95oAe8QoTY6wGezgu7uZH+
	 z4Z27TxQiGRJ5Teo7LuWnS26HSugSJ95eMYoTAkKHkVS7ilvEcvqMF4elEKMRvaFPv
	 rTWdJpD5BA83j6uOby3uo8/8GLuhRJZevbiEp4wv8dTV731uHR8c7glHlq/ZxZufL9
	 IfXQStzzGVBDBuz7AnaeqCgrMvfSOPKoJGDl7Qodh1vP2xDIlj/uwv8+42cuyvproK
	 pmmxW9/S+KlTDvkROooYX2qS9fqnh0C5HCjSQgDMAeT6sESYKBprc8epdug7CTx9qq
	 3oqE9BfJJtpjA==
Date: Tue, 17 Nov 2026 08:53:00 +0000
To: DelaySystem <DelaySystem@tubot.lat>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] media: ipu6: declare firmware files with MODULE_FIRMWARE
Message-ID: <20261117085254.61925-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: f42b6c0e18de01e4462161f00b836a991c2cde99
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

Hi,

This fixes a boot failure I hit on a Surface Pro 11 (Lunar Lake, IPU7
driven by intel-ipu6, v7.4-rc1). dracut put intel-ipu6 into the initramfs
without any firmware, and the probe failed there:

  intel-ipu6 0000:00:05.0: error -ENOENT: Requesting signed firmware intel/=
ipu/ipu7_fw.bin failed
  intel-ipu6 0000:00:05.0: probe with driver intel-ipu6 failed with error -=
2

With this patch modinfo lists the eight files, dracut packs the seven
present here (there is no ipu8_fw.bin), and the probe in the initramfs
succeeds: CSE authentication done, three sensors found.

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11, IPU7

Sergey

