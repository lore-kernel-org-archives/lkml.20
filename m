Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939852;
	b=Er2T3Vtsv0xEhAAxSl/8s25K2Mm7fSxzbeLkyVXX+D0oOaYjtzbQfIg9pH8LVXAs72eo
	 YZ0JGkaaXdfCs6JMGyQEmaN6yoHGAevvTXIPw7rJyU1zypH8KlCKwMnsdvsWecaJY3avo
	 qF733IH3dt+LkJeb1GSs/wDAN2CunTNXdXaIFVv9UwRc1l1l4M7a02wS3OK+JWfKTB6z6
	 BuHpCGd87rMeAaJqyx7bXc63p37RgoMYI2+CSwyxoFTNL9F6UQtwIMfPUZ/FtNXCF+IyY
	 uzH7LUrrUEARUjf1RtnttPjQn8H9NXP1LG/N7ydku2hY8q0S9fMmzlxTlf/G1fNIueQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PA72TJOn96rTm0l6KrCuswMCgsDDGiF/Lj452tWSU2Q=;
	b=sRUQ2WKICSlxOZAJdZOGNbPnH+EeclURm6RxktYH/D/z7CK5IOxhCBO4LYv57yf7lHjK
	 hjSUsJ7eIY94N1FBnOvG28cvbXZU9BySWyhMyKFs7IJdvg1LKWzTCCIA9vZXZaxuoQBCy
	 FLYqBLpAQteEluu2hsAEsXvJXUkmbiBiOpdCa4TljOft34sdJgTCHLdkNLQCfMg4w/yUJ
	 QHYiIYb34s6KNgb68GhHDPdWcnrN8FuskMNH/mGoHx+00jPaFBVH3fjccwaTvcudjVNTT
	 RrIUbpRI4yPv+zylDb2ZQGjLniKfvRaQOIQ2NUJH2E2JJXW5tBQS5+Xbo3cbiTtKlOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j9T4F5OG;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BB4606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BB4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j9T4F5OG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-355724d032fso281323eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792939851; x=1793544651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PA72TJOn96rTm0l6KrCuswMCgsDDGiF/Lj452tWSU2Q=;
        b=j9T4F5OGt/GvWnCF/LtEZHkEkRFO/GwdoG7tZ9TBRqOSbJ/un2GPh6qS6VV1m4UN0s
         C1PMcbCwLoMXk4IhKyNJU9a1XWYUciYATLE+8wwrXtM5LCfjzl2t8i7edkDP3Qm4L1xE
         RAfQT3tjceo2XHgNziLQDhs9x3868J7jeMdM96byPm75GXmegHVlaKK3A0/s9hJsaQ01
         dnG4wRhk6r5HWPZTAGQmrraByG3Yr4ZdfRDYR5C39izP5KSO6wbIJpb3fwenXZhoKsB9
         8ekTLvlyl5EBwUBXvU2tMYpKG5bpjoYBYHX+C+v4HnGTZ4MC/wYTfXeNNBGv+KCX/W30
         5pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792939851; x=1793544651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PA72TJOn96rTm0l6KrCuswMCgsDDGiF/Lj452tWSU2Q=;
        b=jArTaF9B/R7/cotZBZJfAutwQfv9UPl65h6zk3By/dsEMymvZO5zOilTYDosuy5cSk
         JxfuquqnR1I8zioGTvIVLL6C/iuQGjFCbKIXvG5K9Sjmub2eFZL+F6VLJQk1cvD5HMYU
         aBcSIxQqxvdPFhfbA1xE/qI+IMgJysazalWpXQDudb8cDs3rdJ9Pmqkm2qKUG4uefGOW
         9VMWqjYNw25LeFRqlQYlc78AsFrCjMgowg0EkZezkl2YbHzgyywpsFYArq3JRKq1hpHA
         UuxIWN9/OT09UMQFGmE4j1RXYuGAehJRfZUwM68RNgcqLJKRF0+otPe/HPJsv90VRo1L
         nuKA==
X-Forwarded-Encrypted: i=1; AKwUvBzKC0c0WslPqwlu4Ap2mbEhJx5ZTTEuNL3eZcRcylVmFrsnVyTXFtZrDRrA4UdVpARmAi8HHFU/76M0MVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpEG0ulGJ4ARbLSk+joDvsn3wDSOtlJguM92jJU/OXoRo56H8i
	Vl9qIjO8O+U0Jo/S/L6D9DwqRyEKcT0dNmQDYE8AI3/yB8nvbl9/jKnkKbE4WwGC
X-Gm-Gg: AYBFou1T7H2ZPZ44AugXuTPKwvj8rPq+847T+y5AJpoju8p3H4XKlL3Hss/OlA2sEIo
	HFLnssQ/mYX6ghOh5G6QO7a6S21d0rTmDV/jywU+HDjWqNMP6vdqmXbiY0x2eJSP7ASCWlTUjvu
	9zj/BoRku2E/LuEPL+GpHi6liYTf/uTjPoKph6WXJ4wJdnPKGxpV8IcAKrNWSIjOOhaZgg+SAbh
	+Op1sNDpCNDfIfexGd31f5uo5XAxUiusOSjE4T0HbbKr44QKagrSm0rzRL1KvdWOolXzWf5Br5C
	WWH7Q7jIakvuR2h5i/O/XQefE2WVdF3KlhgI/1YR3i2j6z1a3EytW/XJQalk2U24SA7LgYYT1uc
	bCllr1eDsVRGmfkO46lfqEfCQ0BeF5hEqBVTmrASt2uZx65S1ODKTK4d6L+Gtv+50KcKee5BDHr
	tMuAqx8DwDyUuhQb9t0D0USLbYnd2v7FLhFXxbRSWV7dxJpCyK2BYAkYP1yoetJFdnSOF40Y0Px
	MsBOlfVVOFGli3a3OqyfUXsW5TTLGGNhgI1D6CHCX0Kgo4LrBDpIR3B5euSmuwuUEl4TYOBTy1D
	9Maw5soiQILKkpsYnrx8dNJdg9WiqfHz0JFr4q2kMXK66YbGYdD9g4AP6IsniwK+hUgxEd9r4m7
	+SHdOdyEAgTGlzuQ6ETBf
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id 5a478bee46e88-369e821311amr10255537eec.0.1792939851044;
        Sun, 25 Oct 2026 07:50:51 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm16770605eec.12.2026.10.25.07.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:50:50 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Nika Krasnova <nika@nikableh.moe>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/PCI: Disable D3cold on Intel BE200 Wi-Fi on Lenovo IdeaPad Pro 5 14IAH10
Date: Sun, 25 Oct 2026 20:20:44 +0530
Message-ID: <20261025145044.22228-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260722021321.68902-1-nika@nikableh.moe>
References: <20260722021321.68902-1-nika@nikableh.moe>
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

On Wed, Jul 22, 2026 at 04:13:15AM +0200, Nika Krasnova wrote:
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Pro 5 14IAH10"),

The Yoga Pro 7 14IAH10 (83KF) fails the same way on the same root port
(00:06.0), so this should cover it too. Matching "14IAH10" would catch
both.

Keeping the card out of D3cold costs nothing measurable here: across six
90 s s2idle cycles, S0ix residency was 92-96% either way.

I've withdrawn my iwlwifi recovery series in favour of this.
