Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105B63644A4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788688979; cv=none; b=Cn5wUrF32W8agId38AcUK66EY5R/hbfH0q8n/VJONqdBWqyK3mJFFzCrCInIkQIIKUgas0ucL86984fBeTy56FS3lixjzJJeHGxA6wAwMnJ/wL2z7+7opriws6diJeDUbY0mGUsx9WActBG/8fouiiQV4p06tjSvHB/0fnNqRRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788688979; c=relaxed/simple;
	bh=IC1uCXmtgjcrdcBjucQzryI874h8wBozNrYWy3lJKGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmBp+rHoYitZXOoqCeyfx/Levljj+YDDRVX+r7ayGm8FTuymY2Cv8BCamRakU7igAS8ULoylDaX/Dm6dS8GL7TgaTvq5pZHPx5YIpTw3DdrjXFPekK0dGZ9r80ELpy0R1YYHDAp3i9HyDkCJQEV/Ty3XgtGpUlY80gBqs3uRLsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ha71Tm7b; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha71Tm7b"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b01910b499so2251857e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788688976; x=1789293776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiR9dFdTiyluo58cBb+DtMhNZ/Aaatk8gf6hWN59PoI=;
        b=Ha71Tm7bjnwpIzeUJZEVlTdekh4E41/dKZDdyapR1wtad1OOl4747RePRQJRQaly8z
         0rn8Ja/2tVoaxRmG3TEY4yjM/2Pon2GBAWG/GYky26k2pDEfyDdlmtW2Obz9zNxG3JDn
         /TL2fXFE2rCBNXEqW70HsHchHTcmm7HpOrOWAWp0X1yyXwYtdLIWStPl70NmBigKxPOG
         DV0a0Dn34ivkpZb6CNog/zSUq11IX/tzy88aSqRyNx6vrG2vyicMFNTXvyvFZlNeD5D/
         wRblDpEdWfvtcO5TMx8ag00bmogKMy1PeZNUxPsHwoiBykaxetln10ixL5D4YFsrGprh
         tvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788688976; x=1789293776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiR9dFdTiyluo58cBb+DtMhNZ/Aaatk8gf6hWN59PoI=;
        b=ilcDGmgUMICGm+RAUK0gsIwpi/x8wyPEf5m48BuY4XLI0Cm1Q0NTmgOtzndEFAK1Em
         TFO5Z1gd35mVAW7IzjqY1yI7zfA9cJNPg8dAyy+lG9O6Ws/6iECFk2plw4ALpXSm38db
         wa6NA6HgGjSg6s5QZQvuW1yvg3w0NsAmiL9yjUDp1F5ZpAAiKFpaxLrBD+obcnYqmu1O
         op2o3Dg9Mv2J03dK23tcEkX0zvJKM5qRTtQlZTTDEMtDN8DdkDIjyUhu6PxnB/h2/rld
         lAv5yJ9lep2Ce/f0H97yOC4bFBkXJMwHaUIfER4KsEd2sAVeE0Kx8Ho8qhMWvQXvj031
         rb9A==
X-Forwarded-Encrypted: i=1; AKwUvByTa9wKnoMpn2yt9OFJmTLDxin5loHwHG5x8zRewxin1JV6aft+KB1LDNS78iRYez8kGXJXLKaY2LwOee8=@vger.kernel.org
X-Gm-Message-State: AFuF++m9Lf8PoOzX70e3e9tCk6/R2h9U5LpVYNMikw2jrlvm0WqxgGfm
	2vQnrMaXOg1leYLtI8AaiY8e827z3K75+m42jjf7Y6uQv0hzL5iyU3sW
X-Gm-Gg: AYBFou2MRCSYo3aOhxjxzc/1DWk82+MSGtWGnH66ebQZ1GagqmvgzNkkw2dSEMkoIMn
	ldKbztyTSt8N3gbuEZ+FEuRvJ1dvmmDODi8QRJXv3GXrk1xPC+BoAXOCfSJyAbNxMtrJhjm7huI
	QdQfCcDQNynG/uwaPfLMWJqp8thVPaod9WbX4I55UEUprLX149y6Td6b92NTPCDBiueJGhsLOUC
	NAJzFGQns9+8tC8+bqe1Gau202qP/X33DaRVUJlvfF91cQe9LenfumVhiCXQGYa9EyaBHDwdgOI
	b/r2qJtRmnMDlYlu325bOl1AFhOWW9x5HeXdflhhPyBe2Z6YOAIoS23CKy3AVor82OHT0Ex7/Au
	YD8MFznePKH0Lbg48kZZsTY1oSxPlSk03eD+r/VgvbtNYrpiI4nbNeblfRZ2Rq2L7sgPJLge+Cw
	BwqQIFeZ79F0933L64dGXwvzOeD6rSpMPezKvjY7OpbRfaI5U/TteURMlA70ogk69guDJ7lu46Z
	EYwzAS8FKL+iyAXlmmK0pcMrR2FELMIXZaa0c0htkGm6hHwy/25+5ANtUI=
X-Received: by 2002:a05:6512:104f:b0:5b4:a798:2630 with SMTP id 2adb3069b0e04-5b60e6a536bmr3218881e87.3.1788688975659;
        Sun, 06 Sep 2026 03:02:55 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b616700006sm1548665e87.57.2026.09.06.03.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:02:54 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/6] iio: pressure: dps310: add hardware FIFO support
Date: Sun,  6 Sep 2026 12:45:04 +0300
Message-ID: <20260906094622.433243-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178813888151.2788519.16547013180884814648.b4-review@b4>
References: <20260824201203.396651-6-zoone.rupert@gmail.com> <178813888151.2788519.16547013180884814648.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 02:14:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Dropping data rather defeats the point of the fifo.  Can we avoid it
> by holding them locally until we will definitely have seen a useable
> temperature?

The temperature is dropped too. dps310_fifo_drain() sets fifo_temp_valid
only in its second pass but returns at "if (!scans)" first, and FIFO reads
are destructive, so a batch that pushes nothing loses the temperature it
read. With pressure enabled, only a batch holding one ahead of a pressure
entry gets through.

DPS310 on a BeagleBone Black, pressure only, 32 Hz and 1 Hz, 3 s per trial:

  watermark 1  (31 ms drain):   4 of 6 enables produced nothing
  watermark 32 (484 ms drain):  0 of 6

Other runs gave 3 of 8 and 3 of 6. Silent, nothing in dmesg.

Seeding instead of holding, one temperature read in postenable, fixes it:
0 of 16. But TMP_RDY is cleared on read, so after a sysfs read the seed
waits for the next conversion. Buffer enable took:

  temp 1 Hz:   661, 781, 802 ms
  temp 32 Hz:  148, 151, 151 ms   (period is 31 ms, so this is the floor)

Timeout is 1000000/rate, and on timeout dps310_ready() reinits, putting
PRS_CFG and TMP_CFG back to defaults. Not something I want in a buffer
enable.

Hold across batches as you suggested, since a 31 ms batch usually has no
temperature in it at all, or a non-blocking dps310_refresh_temp_locked()
seed plus a validity flag?

> For initial patch just reject starting the buffer if timestamps are
> set to be captured.

No sanctioned way that I can find. buffer->scan_timestamp is private and
kept out of the scan mask: active_scan_mask reads 2 with in_timestamp_en
set, and validate_scan_mask() sees the same. indio_dev->scan_timestamp is
reachable and iio_enable_buffers() sets it before postenable:

	if (ACCESS_PRIVATE(iio, scan_timestamp))
		return -EINVAL;

but it is __private, used only there and in
iio_push_to_buffers_with_timestamp(). That, a helper, or drop the soft
timestamp channel for now? Triggered-path timestamps are real, so I would
rather keep those.

Rupesh
