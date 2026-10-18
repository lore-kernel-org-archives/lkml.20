Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2085A45C6E4
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338871; cv=none; b=E3Eru6FkTtU4iHGVDCFg5PV32OZXyfxhBdPhHtFKWJpgssQnyrSZeknWnzPTKum8AwOKr2F+f/XODn8LbnUOD79qKBJrY7v7iurgU/y0Aeyl9NRsus9doUYVSg2y1pYXi8v82Qxm42pasnCuxObOagtAW9NjCB4RPhFXD0MC+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338871; c=relaxed/simple;
	bh=iXU5ohTq56jh+XXBAIYFfSCpOkBLubZ8A3StYlMA9NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J7N51FV4hqh2N+Gn5t3wbIRFuTGxZO+BiumEC+E6QmAkNhDkV/PliGXRrlp5fWSB4uXp4jvCnZMI0ygA8xGmaccvPw9Ip7A/qL2vEL9VO8L6tLCdrtY/dYzsQNchLFTCFcixNiq0iqWL51waPxiG0WT0sraV6rNo2+nL0t0fR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk51KDf2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk51KDf2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1df146015so5460435e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338868; x=1792943668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXU5ohTq56jh+XXBAIYFfSCpOkBLubZ8A3StYlMA9NU=;
        b=Pk51KDf21nKscu79Oy9mXWsoQprvqQ+WvAylo7DwcN4iqae/NTfUUPPBuBP202xZRX
         JzrwgOnRttO0127+3Rr79SoIxUZvlPFcb9GAmLZNlyWsJD3QSaoZeFrwIkt5waShJaOM
         7EUcat/YmN4gWtd00pVtbcbGaD1IlPAPwwoWxB3GNKfS4qoXa5Mgn/XsZHKR5V9XMX4/
         NueM4Yh7YRpxHrQsZ2e2BwlMp8ytRBVQqqsl2zBp08w6wVOIwmk36/vG8Ppq34Y3gp72
         +OOKjJ1BlyUpPlMe1S+kDP8KBLtgzRuI0K7Sx8XHAKqC54NPqoms5Pnb25qElq5e0xko
         ublg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338868; x=1792943668;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iXU5ohTq56jh+XXBAIYFfSCpOkBLubZ8A3StYlMA9NU=;
        b=D8dds/pW1WjxKLJnrYHgqKaTjDF0PWeRv3YKWBMxPjtFrLRMGMdWr30XeBwt95sw7c
         1BuTHSypJeKKdFLwW476573KdapFiVW9xSoexICeHKUQT5yhvLeV3s+LPTzOQSyeoeBR
         rT3Asz7xreumcix9KvG4XOc42wFvbmeBNUk/v/foELv1A0ghfbUgfnIUo17h7HOJiuYf
         BFbud9dTTdWbd3DWFTXi/ViiLFGjiPkvVXUGH+lzLla7a5eHpBEmBb7bKNIXMam0Lw+g
         lc+C2coYG01Dusdx5lnfXMn2py7A/3cujyqnATd9vvCeARcFxQxs1+Fa+dQ2k3aQIdcK
         7FGw==
X-Forwarded-Encrypted: i=1; AKwUvBwh6R6aOIXbbR0BpoClGd4qVdE//umvYrP1qCBBAiTN8PpSEl4R84/vvXkRHRQxqM1aSu+O412JwnUzzoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgo51xksPt190Cnx0d9KMkScvdyroAvEMBi3Je7t//Yye/8C4t
	9vMva2lK6FQUDn00+IUa5AOz6YRaivoWXV/in3+AJKW+teZOYktxMZv/VNtZEcc9Vb4=
X-Gm-Gg: AYBFou0YIE8YMS5dpv/xnbv3x7a86JMzlDHOfr0gi0ABO3xtRFKgChStHm45eYnrTLS
	CYHs+/7gMOtQXdMb83KVeY4PHQ/G84z4mkUDHk4JbqBc6cBXi5W/RuVBXwPExo+FpYCbveyGYCR
	sQBYuG/eFjnVIq6cUbDeSGWLkv4+25OyBi8jL1qm1wkaETxH+31dLrA5y1BuMLIKjbltQbkL0kE
	2I8CDdC/EoPS2KN3NI6FrTq1TySu/TVknjyYFuuR3IeApg6+xBudcVOdj/OKThkc19mRhXVqSC9
	Cy9H83zqytKsrkoTPrW29xtwOQw7l3DpRfTfYaJndtWvu1rVKvPtme51kXDCewnxqZ4uhBlbi2h
	oEQtXGmkRNpIpgfUjlQhCqihOUyDnzWBoYBnbHiYdd8n2ni5hJdyGv3H3azooxrBdQLuSAWdzs+
	MXoYosLYTXoc24/EtDjzxz+BXj9cRZ5gCEXViSe+fiT2QQhhIGGZa5XcIRSSkyzvRs6vVBcdeWc
	Zd7KkWwg38qriajE0NnMQnSS2iOJjNj2OoSbR5/hIXZM6zSB9E6iSd8LwlUgxp91fo0dZXytiDT
	z/dU4NwW5/I=
X-Received: by 2002:a05:600c:628e:b0:4a1:df70:b4a5 with SMTP id 5b1f17b1804b1-4a1df70b5c0mr79829815e9.7.1792338868189;
        Sun, 18 Oct 2026 08:54:28 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm335355615e9.10.2026.10.18.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:54:27 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: nvme-pci: nvme.quirks= on the kernel command line hangs early boot when nvme-pci is built in
Date: Sun, 18 Oct 2026 15:54:26 +0000
Message-ID: <20261018155426.1299676-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Passing nvme.quirks=VID:DID:QUIRKS on the kernel command line with
CONFIG_BLK_DEV_NVME=y hangs the kernel immediately, before any console
output, on arm64 (Microsoft Surface Pro 11, X1E80100, 7.2.8).

As far as I can tell, quirks_param_set() runs during parse_args() for
built-in modules, i.e. before memory management is initialised, and it
allocates there. As a module (nvme.quirks= handled at module load) it
works.

Removing the parameter boots normally. I have not checked other
architectures.

Ramón Jesús Miranda
