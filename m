Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242529;
	b=fjBQXvnY61blb4tCtIVtcgsIXZ1SZwz535/dLh6vIrCt88OMdMiu3H6B3IkdyIXivXE1
	 +nCK4YRY+YT4vRJRPBzsYXWQWjBbpBgYCTL/zVG/K3/M+kFeIW527gI9SVAqbxQ2rA7pL
	 Jnhwhf3KXmbZEHK3Yo5fn78JnVrgFTfuRT/gLEJqEPiBmWuZCsZdmQGHgjNt2lSQ+lObJ
	 X2ltSGqHwHSVbZx2hUxjDlppDiuS85wQpO6dstYdx7okIwy6i3YuRkN4SM44XFgEt8X4k
	 WP12B2Wx6qse2X4iFp9lOOpDocJMP49/tNZOdiGkFfro2yazo6vYN+maas4h+iSgn8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
	b=E624JGWejkzzlBislGQhTZsIUNligI1/YSgI79Qh4I0TjMvYb2wMwDiz7rLAmSQoNiMq
	 wnPUndC1R9oEpgW661Vfa18FNDxRURS8SXez2aH0NxScEbfo1VInk7/sKom507MbVIOeW
	 bsJ21hlicFZ5hrq+zVOurj7UbbhVTj09j80HWS80pVzxPI10UNZdkXXDaGdAtSmiuRIvi
	 25ts0dL3SjonZT+RC1HZf9FQpkQB7kQCRJYfTpyvCTEg3iYXAg7CGnekQH0Heau0JYmJy
	 bvu8kvZKSQ8Q1n+q45n+F4MCzPKsDb3MVX/t9nfGcD9fmNOfHR9n3423Ks4rB6BHiUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fk/Wy5WQ";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9F6606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fk/Wy5WQ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8427375e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242527; x=1794847327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
        b=fk/Wy5WQCkWdrah+qLMkXKaos3bTrw3VzUEGV9pSdILWJp2hlmbRjEzGBmV1bKwBJy
         XxBdw6jsIznlDUqJUlEUo3FwW0YnH7+a3nfRimB4b4WzowxYh803gXzalSJFwzfkMXYl
         1rzi9QoOuS1UTNcE7mQHA6tESqziqaEBvmpsckEZ4PwtXmuwFS84r2vvpl6M50bORGdq
         IFlGwM4zwaZmLsM3IvPqQ8nPz5tB1tcfuUQvLinXbWruDJFjdNxmUczmwB0r6DF4Ko1Q
         Jd13Tq9tesDAqI7DZAR8EXNCbZr0F4/K8Z69mU9CiXtpZoOLHmFPUdwq2RMB+GhZ+B1C
         SH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242527; x=1794847327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
        b=kxm4oxjDOG1SzXKJD5QGxCDiUHsKJPScYCwbdOUClE7EPT7gUpLYma1sbA+7HKK3Kd
         UsUD3V8ZoB/vQtEkpvPbg/vi0avqPoC8lK6KF6IsNzQMKzz0y7QDsBV0HUGWVx8bePk4
         HdgTa2jHqyCiI3iyJqjYlVQqozbf0ene9Qh80nD7fASw3Xg9ncuxTMxVOxGyQcesLYPt
         4wtd+ciUxiQ16VQqdYJ/o6krZ72RWWjmu9T9yWQyEb7zlNO4NepZnOrsRZr94BLewqRT
         rhtfcFS5ACeB1pgF2Y0aITnI5tJqpMtUXjWE5FRVa1HdPywYjv5a486XmZYZWE41bZWR
         Ak+Q==
X-Forwarded-Encrypted: i=1; AL+hErEVLQDm02bOEm6TJMIhRIYD979oXGbhHGa1wVrcywgO7Gc8sgzkQvIceINOycqpQ2nyZRXFZDNFYCh65ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TqmoqvBF0XT8ufe7gxpQbwOc1AYEnPnCQ6ybug6fMuue3lAkP
	Iuhf25TU7ka2vEzslnnLoyWHx+MztknePUskIXQVxUdhAEkxb9yejJzExr38EkTiuQ==
X-Gm-Gg: AYBFou2j5cO/aeP65UFvGtVF+OVQf1RVJ6+ybkamG0SwSCiis48uOGN73ZzIss4iebO
	wj/PNh8c2g5UHchjWkIJi1OIwu57kmlSsTVNXro9ZHTYl7lA8f5lb2loJD+grjAGg5N0pf6XhTU
	ebJCN0xklK2qTUipyXZ5xXYQOQrveLrMA5Cf4pFpKJGMWFsKLCB5hCVDlbU+bdmdEP4igguncZu
	0MZNYCQa29y+jfyDMWunzRJNmG7JoY2JCp4+cOTLJ3KksoObm0gtX/fWNN+2wOriyo+KGEhWmln
	EbMAnRv5WgH58Ai6p3//Lvt5/rZdxldH/ONWAIXZZ0g0uSHa1xev0mRLzq16Vj6taR13+piBoJd
	alkzfoEL381edNbFFH9x45QRI7oeC+GbqCqg13+Hc0gYB1/ylXjiFDPfqE1VT7ZT8tu4vN5Wx4G
	jaV3RzhvXrM7SUyIo6W+Pu82FQlB80eW9lJZYDq21Q+R4MRX8DCv5nt4z3mlWSy3YIkSYOsh62b
	97Lrqc7vNinfPzXowNBsvxbpoh0uugcTosREmJJ6Z1NkSF9dFmYQdkBJmtl853FsWLyxrFJ/Q7j
	kQotuI32vy5JxknqKw8ifZuIN5X1981AQcqmg88Z90w45y2YHP6tfgnTmX8Q9Pt8Ojms8oIMpxC
	2pgF9gNe//CcKriRxYCuWcE3uPzk65/FZnHXy32u36DbI36L909n3lUmFL0MkXCgkH0JO73nYKg
	==
X-Received: by 2002:a05:600c:8b24:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4b960d9b66fmr79533325e9.10.1794242527085;
        Mon, 09 Nov 2026 08:42:07 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm10639482f8f.36.2026.11.09.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:42:06 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Arpith Alexander <arpith99@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] media: ivsc: csi: Add sensor node in bound callback
Date: Mon,  9 Nov 2026 16:41:59 +0000
Message-ID: <ivsc-csi-tested.20261109163952.eaa256f0cc02@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200226.100989-1-arpith99@gmail.com>
References: <20261103200226.100989-1-arpith99@gmail.com>
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

Hi Arpith,

Same regression on a Dell XPS 16 9640 (BIOS 1.4.1, OV02C10 behind the
IVSC, HIMX1092:00 in ACPI). I reported it before finding your patch:
https://lore.kernel.org/r/20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com/

I tested the same change (identical apart from the declaration of ret)
on CachyOS 7.2.8, with modules built from kernel.org v7.2.8 sources:
- 7.2.8 plus only the HM1092 entry from 4fdb0342f05e: no sub-device
  node for the OV02C10, libcamera skips the sensor.
- Same plus this change: the node is created, libcamera and PipeWire
  find the camera, and "cam -c1 --capture=10" streams at 30 fps.
- This change without the HM1092 entry, so .complete() runs after the
  node already exists: still one node for the sensor, streams fine.
No kernel warnings in any of these.

Tested-by: Sergey Zagursky <gvozdoder@gmail.com>

Sakari, if you pick this up, could you also add
Closes: https://lore.kernel.org/r/20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com/

I used an AI assistant (Claude) to analyse the problem; the tests
above ran on my machine.

Thanks,
Sergey
