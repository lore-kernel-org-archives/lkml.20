Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34850364052
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836368; cv=none; b=R5F9jb+JsUHeit0M/0m7SSlIqQ4+KevDCQQZUcMk3WDagxJsIsQ+1t6sJCCV76BBwz6PPdwXpNvaN0Orjb5TTIGiO8lZtzttsRqwiPGG+yx1Yd0lOWcNZnC2ywiCYNmxDqeSIFz+75I5pTF8n82OPeKyoNH/dgNPImIlnn7jB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836368; c=relaxed/simple;
	bh=b0Za19fw+eHquh8yAgvDA4W6/FkCDg7o3v27TiWVqLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vaa5Zor6PVwiCgIn+wJDgvQr6hccxZxeSX3OP/IBcGgxWTChHgSyrkiCgaoE2EmDt5kJDCUWz4FbceA4cwv8dvIU1K/Gj2HR46YrwkhgGoP3bhBRcXOVbe4MRZu/iy/ro0afG1ANmBmWxWFpwMh8cLymus28zYzlB9xvMY8WYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ+Tme52; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ+Tme52"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1046246a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836348; x=1788441148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0Za19fw+eHquh8yAgvDA4W6/FkCDg7o3v27TiWVqLA=;
        b=ZZ+Tme52cL8+rgDyh2ivVx5JOatDuDdmOKSqbiwIMC//138eAgfmrkcOaES2UkdfQx
         dqZVit+EUm1OmXatnfIaTZTM8XQS6/gogXZP0b1z6lqRT3Unz8+gJyFSnND5bj6M6iMa
         3zNtGPbdvU7jZ2InP5TE3RWIxnfuufxZk+6ItBZThy23GaZq4a03U+F22xBBCkDxDyCp
         vORPWhMHazfZgHBVj7gsmoYQam94zR8qjU9DMkg38V1jNFFj8GlvfXbCWdHKWT5BPx+9
         zIigYXfrZ6IrcoBEnFyLwvcMheCie6P2M0dx66Enzk6UKjWpkjk15UFZE83qctdL2Xwj
         MXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836348; x=1788441148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0Za19fw+eHquh8yAgvDA4W6/FkCDg7o3v27TiWVqLA=;
        b=ivR9QX6Iswt409lbyWK6vHMdadowi8yNdeDduw5dbqeg7rt/5L1rzBY8xFzf8sUbbb
         7oLz6B/Lo+XQNs38hJDc+oX7sBvMUXxs/lzjEq6KHl9crHj4ZQItPJCfQ376DVots06N
         e0lyY9H9ZTiSDS6nSPsESC1Z+OeV6kP8vpAXDF/REr/dOr2ps86Cp8oB0yo3MsBeo9bi
         Rg98DOqAmuxRFFMsB14HpkspZ+ItuWaAD5JWiQ2ks2+t+Aqzg7Mhys2XoxSw8EqjxWsB
         Vxx9mCO8SR3xfkgnjacKuvcvQcqwZbLBsQN0A8z3DLxfIIxdsdQD0tr+oJhOB1OmMILE
         oQuQ==
X-Gm-Message-State: AFuF++mlRF8UWnSyAOhzY7WLJSx8xAY+MMvMT+/jKUzp8qbK2oD4aexT
	+ic4rq1qfW5oK66LlexYkGqHdPUsisOskV2mYekVQz2rQ7x76xbdrY+C06NOCw==
X-Gm-Gg: AR+sD10eyCDdamb+ULEOJsbBwp4KyhunSrhgCvkCKAsaNYVpgtv/oHF6SZgLNH2nsqZ
	Yvx6pyhprPkqNyVM9ROunMeWWCYbYzgyCdt+GH6fxR12sIUrT5TLCUZj3I2yTL6epH8V+ShFqi3
	ErPDB1kVYFvtGK/uyueIlW+1clVOnheEO8FvoNXhJj2X0XTDMRwCyRK/7V71QEKOqavxuYCl434
	aKQ/TnyqI2Vo2XgylHZdnroeX/aSejkvRGSVLVYlKY/D05wqynimPJFMPPMiCs9DAENlawXSyBJ
	JBV7yo2ENmCjn4R/pXGgO/ETz4HmCxoqNgaiKQFkebYwM1EUi5HhRZHgpkfpEFyOzDBt0L33RhG
	PMtbrvHBX3NpojIBn34h4xx3p3KStX/0P3XP9irh524bB1ET0XYQZb4M0KuWwzEK5/EULV0MuAh
	sQ0CoFmAQGLNu7Hm0clXVi/dthple7iWblJs2TwXCdbPSfLJHkgSOiW/qlbgP2COJa
X-Received: by 2002:a17:90b:384e:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3966d4232fcmr28605232a91.13.1787836348245;
        Thu, 27 Aug 2026 06:12:28 -0700 (PDT)
Received: from Default ([2409:40f4:100d:ce02:df7d:ac3d:4a05:c45a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm28978904eec.8.2026.08.27.06.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:12:27 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Don't add invalid kcontrols to LED layer
Date: Thu, 27 Aug 2026 18:42:11 +0530
Message-ID: <20260827131211.11946-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827113951.893291-1-tiwai@suse.de>
References: <20260827113951.893291-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/27/26 13:39, Takashi Iwai wrote:

>The kcontrol LED state layer tries to track the all associated
>kcontrol elements with naive assumptions that they are readable.
>But one can create a write-only element that has no get callback (even
>a user element can do it), and this may lead to a NULL dereference at
>the call chain of snd_ctl_led_notify(), as found by syzkaller.
>
>For avoiding the Oops, add a sanity check of the kcontrol's info and
>get callbacks, and just skip the invalid kcontrols before assigning
>the kctl to the LED layer.

I don't think a user can attach a device via sysfs without root permissions,
(correct me if I am wrong). I attempted it on my device and got Permission
Denied. But otherwise, seems to be okay.

Thanks,
Jeffin.
