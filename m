Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499280;
	b=EqtAw+8QwxsjF94GuksDGFAnYHzZZE7WEv0XWRirutLaCuq346LbvsBs6AG2FKqPCRDJ
	 qjrdbRLs9+m1kp7AokA48f7urtYrOmprd57JgB+Ap10TCBddokV9hceapl3NvhsqD5sgf
	 DHkenpk/pKE+FHVrFMKtwxCEqIBaMcH7vM5fQ1LNfK6HL4t1j/BSb9zq7PUGhGbHcUPSM
	 gfMdKRhmIrVSMYt3NQO3SHN27wfLQBUDxVNUD13A4rIrU3fX5+odJIPnuTUh7P0H9k7Qz
	 Hnc7xz04ds9Qs0v5Efux+paj3HK+nleQ4SqXiI0BlvnJtOtFja+YgvK4ohFxlXoroig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
	b=gkWuYusUKzrNEVDehkfoOyb3XU9J+bMqXbXnxWKKU7vszbhG0mveDz6yrOVHBZKRLeFq
	 KAeCPaae4E69YMRcj7cqHINcYccRNCFc+cMfZvbewZdUkfxPzvYFrMmOWf2CoBEdudmE+
	 LpeUAVygUzz7KNT/N1qSALUAEK+5Y0P4KZswlNGmhGP4gDzlxQzMrIGKZ43c5335hTI8+
	 fZugkap9CoXPSlemeurikidpcPJhVRLZk5/eODzkL++SQYMnmAxGyq8sKM3bqhzTaLe8l
	 gygTYzve2ZuPwoLOrODbeTZJh2aghK/+segOp8Axknbf4vc4x9E0svZPDbDvab0M+PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1nMmDHq;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916CA606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 916CA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1nMmDHq
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36661f953e4so770349eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499280; x=1793104080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
        b=q1nMmDHq2C4UkjrZNeo6tN+Zd5a+7kHiLMyrQd5OUTLT06LjSe4LRyhah/BIvNBrJI
         +5nGjTsb1wjU3Q111fpXxDGi0f9Dj9h6Q7hyvudp7ryrlSdatr+UI91fVmiyh0iKRNte
         G4f0cIWPCy2eldzVRkBuNayjxQpkRdhuLa3JDCtao9VHgu+FOcKv21VAkW1ud+VzMmFq
         3z+WCiiOTLq1rLrenEjOA0mHoXqXIBN1sL+hSk6tXejz/HTxuTwnK21K6hJLW5vOQtyu
         vCABdffmvZkOtGiGr7xZYOE2ccHGoE45y2+mIU6Tm6xVpVkJ65hajHFMbiGIYzoACpN0
         O2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499280; x=1793104080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0QwVqIkHLHAsRie0NBb7Fm4JU4R0zkfzukQ7suLbX0=;
        b=FdCKv+iczbfM/vAhIEi4IAqRaAtqJVXg6ALHLMTfd5mJLNMm5TON44JzQR1f64qFOh
         t2Xs5i+0aOBRyhbLvLUN+lHL9zjFP88LdpO/ebK3yjqS7ZganPQGzACF46ATagc9Rns1
         wyUqZFXWkNb1CPOqC3tIRLyrxD9SwPckgCmVW78ZRIjf7pL58YNcXBgm05A1QahjHbS3
         WKLg/AoIHnUHh7OBUoYxZ3l3FQgMTBDyBDciBe+rumNVzNIQgTGpZT+geHNp0XG0nWjj
         rn3Bq16AVHjEGcaMLJ8DgRauzoCbXYmZtwqNQWu1ZvVZYhaWmivgufySNXWqgyDJmd0P
         +vGA==
X-Forwarded-Encrypted: i=1; AKwUvBwWxfFsp1sOoBykS1F52azgtEvC7LIppfbJev0YFQ4slm6IAxSRgAbgg6qlAvgRLUGrl7n6wT1G0GHv7Y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4WURxh69ih5Zite1YtRahDVh3BtTrC42zkjfVQZXLou5OBP5h
	WmWCtbwcjKwMBYdkIi0gOSTjkxlP8iYIyQ0LAN/kZ5upVH1KDPff3Cgw
X-Gm-Gg: AYBFou235EdTj4devqrV2xif0rQ5+fFlTMS8vA8/AaaACwta4JA6ReYVPICIOK01+DM
	A/fk/SW+HKnUiuj3apYMVBVuI2PDc3BCUvJy1KFMTWoniuuqac0RKwe1JQ3b5HO9ul3vOKv4IYh
	1zG4JkFb4Rk2vFPfoqo2no6LD5+ajhcBWWwTG7NxGYnGNVqvgvY0bcSaAhfWKuL+9ebclPz8Pik
	HyygpZMhMiDY3bk6BEuCPl+2Vd7Mru1FqKY093xOdXXkcon/N4IRRThWf/jwEs0mRMDmv2M32he
	qKKXdmhhtLcMP+DJ8PwPwNfOab2V71j5dUet4EQyWVkGdjHcQxmvMW32f01S4a+g9nk2Jcwt//N
	ekBuT9uGNRtIm1+Zx3w+2f90exnH9YuoEALHs+MU7mD8fgQ3Mw0lwoQoBMcgLv6Z+l9rzaouKUP
	JoMP3L8/B8DytQGr0SY6+6XDu8mmD2k4IFH7nROOxVuzr6uZ8BVGS85m14vbbH2yFdXtk5eovTL
	zpHUJv1DhNhyFJOTIY1jbC/SwxdEhzaKtKR00fbjAkajFP91vzCBrBWOUlzbY8v9pSiAHxpndDf
	oypONQ==
X-Received: by 2002:a05:701b:4302:b0:165:1f2c:5c1b with SMTP id a92af1059eb24-1850d37060emr13962847c88.4.1792499279662;
        Tue, 20 Oct 2026 05:27:59 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm36015493c88.15.2026.10.20.05.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:27:59 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	andre.przywara@arm.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	enzo.adriano.code@gmail.com
Subject: Re: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Tue, 20 Oct 2026 09:27:46 -0300
Message-ID: <20261020122746.41699-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <09812a6a-dd0d-9c47-e1ad-5220f1954648@linux.intel.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org> <atcm2zqDs1P_EDr0@ashevche-desk.local> <09812a6a-dd0d-9c47-e1ad-5220f1954648@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On Tue, 20 Oct 2026, Ilpo Järvinen wrote:

> For is_power_of_2(), 0 is not a power of two. And it also wouldn't make
> sense to have zero bits in the bit field as it's same as no bit field so
> using just is_power_of_2() should be enough.

I think the reg != 0 check still needs to stay here, since the test is
is_power_of_2(reg + 1), rather than is_power_of_2(reg).

For reg == 0, reg + 1 is 1, and is_power_of_2(1) is true. So without
the explicit reg check, a zero readback, meaning no DLF, would be
accepted as a valid DLF.

I'll keep it as:

    reg && is_power_of_2(reg + 1)

in v3.

Thanks,
Vinicius
