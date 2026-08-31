Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFBC33B6F4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176406; cv=none; b=NIDCZRgQ89tZwKQbPNRjrfFrsv15p1SoCPxqHSplc3APTTbf/6+cT0BP0WeLUShbcfmE9GkojRp3w8/QN2uYGb9Xiq7vTxL7fZWPuUz4HpunPFM1ZtCKsG43KX5WSVtfmTn/Tj04M/x7bRA8fR7LdipVTBN06kYooY3EQ/E5RrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176406; c=relaxed/simple;
	bh=nJC3AC7cDhd2NDGw7j31xCBSsHw5QjNiOrz3sSWpOIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3kGcCAa11+HE6X6Ctzk8wdMw68J9JpsTS9XQe16/6fyg86ulgJ0ERXeyritF8wOAZaLq2dlepHh9W5Y/TmsV/LgN9b4qXc+fTko3mA/TVlksCHglEeLIU8nqVTyo0LgYYNCRhixBRdMzbK/TvAZX4rnixYFGyG6RIZzP/jmIhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZZE9YjR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZZE9YjR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1210098f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176402; x=1788781202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJC3AC7cDhd2NDGw7j31xCBSsHw5QjNiOrz3sSWpOIM=;
        b=hZZE9YjRI4KqEXLyUtrskpCpins+Eyi+uN6UnKZBcp5J0rLNi4yjibvIg1lYtKNtZU
         bVbLWJ1OV+oNqLwl4dKwuWupVJU4awJyTURfV2c/d3fdTOMAr8CYVsIaXrsAgUwWfSoZ
         4Bok18aj7hqO8NDGreWMnXLN8V8KFBa40XAHAzT0aNxm1XofM4QR7MI6CrMZBLXX5PGI
         JqK5OvjTFl9TW0z7bVj14/3vRkp0GavSmpmr35YQW7frnjLA+jcPvYBGnFePvI09A61K
         C/1jWEZUA8zn+R/2QbKJRSKlGNXfgbFMz4uoXihlhtjpqr9Z3vFHt8R+HB41GQyJAFld
         xcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176402; x=1788781202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJC3AC7cDhd2NDGw7j31xCBSsHw5QjNiOrz3sSWpOIM=;
        b=ZZBLSI7868tykqKEbGNYUBZsDSGaJHSPAgQByZ6bv8yHh/lGTTzFi3aWwl5nc59nOq
         ANqh+5vieka6umgs3MyDS3PwyFtVmVeur+Ufuj0Kt19xgWR6FBtGTUTfGAklMpr0L2ES
         79CWn65IP5timPHYxPUnwM4C3yHnHuWlPcmyYFbXiNVvWF+tM1eO9g2KFQvq95iAMLT2
         xpuWoJcYXefwcdmL2+5o2eX8xBdlqpwkzDFBFFHO/VmVnniuhI5bsmECfUctPtEsHQqr
         CWQRJNJr1juMc/zfyoRQAZfaQgq2D9VT8yrbw7PUNPhdfSB4Q/xa0aPWSkzo6f9Mg40D
         cM5g==
X-Forwarded-Encrypted: i=1; AKwUvByMptI4MUnQJ7qdITcU/TlFJpGiQtKdEFj5koyuFFLHK6662mACbFucqJUClJbf3tahHtm4Exxp59qbvh8=@vger.kernel.org
X-Gm-Message-State: AFuF++mRB0qyGxGot7KFm1zchjUrOuXROwGhzv8cWGHjDcGpJXeG2R2t
	1DabnzP2sdrthqDwFExPutEyS7IHAYRlB6jZTBzBvuzVo1UhwbrEGwG+
X-Gm-Gg: AYBFou1shImQVxBvdfDS8Q3J8Hm6lmSO4jxJOiVZNBv+aKABoKd5T78SQuP/T86SxJJ
	PRE8CAuMun2EOov1mNmY+rOEoZCxCCyBMR7LxsIcxatIaAY27aVy2LYHLYLvmYQxxvlPC+6E1Zp
	nNuNIsIYgf0z+oT9nRSD+v2gXghTJzBGaMX42/cURiRDgAAIkA+g4KmNul2xhv178uE/v1sqLnO
	FLCqh6PLTw4j9+MOwo9JniZ1eIVrUBFkEHtL9H0LUQWij1t5V36oEHcbX7SfvIuo1HpKxXncC8Q
	gKTGAfwU6+4qx1WDn56Mu5O4fmGliM0KNu3e0D8Wsd5o9lGV7vi1eICETJTA2dICXSH207qbIvs
	nfLwWv2J8oDg+y3PRtUCPWTS/Wo1ooeanbEsreGl785+InuGziDUuUTZNXi3zYOMP6SkVX5Wdii
	815IjJLpymesMrnoivu9mZkahfj7Nrwn3QbcvNQf33AWGGQsYt1ZYUFH3Xn2adVb4qE7E=
X-Received: by 2002:a05:6000:468a:b0:484:36c1:2881 with SMTP id ffacd0b85a97d-48440fcd8f7mr134976f8f.2.1788176402312;
        Mon, 31 Aug 2026 04:40:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm11201044f8f.37.2026.08.31.04.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:40:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Mon, 31 Aug 2026 13:39:58 +0200
Message-ID: <20260831114000.1844796-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87pkyybtmy.fsf@bootlin.com>
References: <20260828085337.3916199-1-mehmet.fide@gmail.com> <87pkyybtmy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miquel,

> Sashiko says:
>
> > New issues:
> > - [High] Kernel heap memory is leaked to userspace during out-of-band
> > (OOB) reads when the NAND chip's OOB size is larger than 64 bytes.
>
> Probably right, to be checked.

Checked, and Sashiko is right. vf610_nfc_read_page() fills only the
first 64 bytes of oob_poi while the core is free to copy the full
mtd->oobsize from it on an MTD_OPS_PLACE_OOB read, so the remaining
bytes expose whatever the buffer held before. The raw paths are fine,
they bypass the engine and transfer the chip's real spare area. v3 will
fill the tail of oob_poi with 0xff after the copy, which also matches
what raw reads see on flash, since the write path only ever programs
the first 64 spare bytes.

> > - [Medium] Integer underflows occur in OOB layout functions when the
> > flash chip's spare size is smaller than the required ECC bytes + 2,
> > leading to an inflated `mtd->oobavail` and potential heap buffer
> > overflow.
>
> Cannot happen.

Agreed: the layout is only installed in the hwecc path, where
attach_chip() rejects chips with less than 64 bytes of OOB, and the
largest ECC mode uses 60 bytes + 2, which still fits.

> > Pre-existing issues:
> > - [High] `vf610_nfc_write_page()` completely ignores the `oob_required`
> > parameter and fails to copy the caller's OOB data into the controller's
> > SRAM, leading to stale data written to the flash.
>
> Probably true.

It is true, and it is exactly what the first patch of the other series
I posted the same day fixes:

https://lore.kernel.org/linux-mtd/20260828085340.3916239-2-mehmet.fide@gmail.com/

One correction to that series' cover letter while we are here: it calls
the two fixes independent of this one, but its first patch uses the
vf610_nfc_spare_size() helper this series introduces, so it only builds
on top of it. Apply order is this series first.

Thanks,
Mehmet
