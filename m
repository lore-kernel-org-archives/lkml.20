Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184CE34E777
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668506; cv=none; b=AN0uvbzKTW3/dwaRo9mYt6kQPqsG61YDmnlbylP3zLNXY1BJM1Vvl1k4v/AnVjzVGVUZB5cai09p+aA6brBzLUu3emSurk/dj4lFL251pQD8Yww2bOKxWQwgvCNDhESUmy/BjVAiBhr8hkofcw+e5zK4Che8zE0D4EVnEh67GTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668506; c=relaxed/simple;
	bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nU+GIatedz217StZor02/fNXnKCq1RE6Yc41Qf0zH88lVrvneUCzRmYanYaHRnT9yy1yJzO1WRdQ2DzUfizbXQG3bsy+GEegdh9nnfEg1MAwDuMsDWxD9trM6FBKAewmeS4fK80HkCEcoTzlnlIvZJsu5ZtkasfsYeKPpzBU4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0ZoR3lA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0ZoR3lA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4207ac26so761316f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791668503; x=1792273303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
        b=l0ZoR3lAs9sTroAh39FTweGNBStBrBM74qELjEfizz+t2MCjZh0aqEzQtr7Lkjgu5F
         +PeejTSFMu9AAcGTRxKJfigHhfHVw3D0ZTC7RaW+hCv4VMZvxdbV0Ntgoog1nSjkJ4x7
         4C6shV8CjZen49CR837nKlyaLuGzcYohIH3W/KcDaKMS6e/9TRsdN8hlyRS91CXw5nrf
         QhTv1ZFAGk8wNeacRgwq/jzlus2WEI+PrWHzJ1KQrWcLP0HzhjAywbC62yjkegzr14Ax
         knad6X77UNr8phJ8xb9T7BPOVOShESRYwhqdOawMXYhbCK/TkSeYnsQK6sWBBkWtjEXC
         dwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668503; x=1792273303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
        b=g75HhQCYgbAfTR3vs3Kd+dMviecbJmgrOe3FcUHIMltLa9KRLrJAqx06bGaVIPc4OT
         aTnaxACIc2yfNOASE1M7hKU+cLWYXeBQUYV8RL4tE88eJIai+DEgbsTH+xHE1dkza/PE
         pRWKDvNvJYZlS6TzTu817DUHLtiXBh1rQHK7iOyRqUh4zn8+RJYzHXNrr6nIMUvPuwz6
         Gv4HmpdwZgxsFAIyEoETeV6LTIIISjPt9I/9vHJEWEbeOVcV5tjWkSx1SzoQ4JAlHd4e
         Z0I6F5aHHxtemVVcGwJW50zIvE81kY02mKqUF+y/PrHxqPwcSNuPObH91Zn5cM90FzbL
         rIFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNr52sXkncrXg+y0cw70bXXwYaAnmoJaVZvYlZ5GSWJKYjWLPtz6cS/tD3fKcEeJGwgDHzu/z10o1leus=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwvau4UkwIY6zNB5tsqT2f6ki+UsTVu5odouvZzc7gV64q0xLk
	Zj2CEqki1a9G2eCA7yCxFEEiLFRsKPwQVyj/tigxWblNZMAY7TLyvCZO
X-Gm-Gg: AYBFou0VIRR3VWFX/945zV4DaOrxo5spZ2WnYZP8VP0/ZRiM1weOT/uwZ6oClixmJQX
	yGdCNraXKtCkxxLT/BfVRtP814siuWyXbqMwrbFwakp5SNN+BKVHZdNPB6Q+Nh3u+/FDBYumMAD
	DAh6pM6rI0FTDzOIBFRqT+ILBH0qP5weXPaBa1MWiZhUFHW5ov1T51QOtzoxHOwu26f+ehcNWuc
	lB7B5xuWuI+Sgv6tpOwQqk1nv3d24ahIOMaQTJiN7Ice86tw6zTASU4EX97cWn8VwtTl08k4xRV
	aJ+0xnXyRK306+kuMhc58/dt+fZYXZrRmEHXN1YMd9BggR5t8qvW3N3I0bkRTISGr9HK6o+GTSU
	R4JWeNOQ1anFskAyneoqYsHTblklNCEu4dmBe8LFXEST6F9LYa/cOAbB+AtUUQc0d0trcrMHLSp
	c5zmStdIeobS+ShhkNthWhBHYvHQZ4vlHnNPuDZ+m9Uq7fX5uqdvOXO2wxY9+Z+HVMD7tjRzZI+
	9jSovVY4mGVNy5jrQdmxFSxN8XJe2s6c2gR+7dA5ZJG0l1v1DSJoQ2byUVpLsXLgr7SpC+43Gxx
	QAoauZ6WMW3Tk7+8U7BXPMpFO843XMuaHtZzaLL8Mg6XVvl2hrfvU21aBa2zUQ==
X-Received: by 2002:adf:e7c5:0:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48dbaceedd2mr7689291f8f.52.1791668503133;
        Sat, 10 Oct 2026 14:41:43 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm10627330f8f.56.2026.10.10.14.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:41:41 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefandoesinger@gmail.com,
	linux@armlinux.org.uk,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sat, 10 Oct 2026 22:41:34 +0100
Message-ID: <20261010214134.1706304-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
References: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd,

Thank you very much for reviewing this and pointing out arm,outer-sync-disable.

To answer your questions honestly:

1. Origin: This was developed purely through trial and error debugging on the physical ZTE ZXHN H3600 hardware. During initial bring up with the MT7915 Wifi 6 card, heavy DMA traffic caused MCU firmware timeouts and froze the PCIe bus when register reads collided with L2 maintenance. My early tests without the lock froze every time, which led me to devise this custom locking mechanism.
2. arm,outer-sync-disable: I was honestly not aware of this existing mechanism. This is my first upstream Linux SoC submission (and returning to C systems programming after many years), so I am still getting up to speed with modern kernel architecture conventions. Thank you for pointing me in the right direction and bearing with me!
3. Testing: I will test arm,outer-sync-disable on the physical router shortly and verify whether disabling outer-sync avoids the interconnect deadlock under heavy WiFi traffic. If it works, I will gladly drop patches 01, 02, and 03 completely in favor of the standard DT property.

I will report back with the hardware test results soon.

Best regards,
Navid
