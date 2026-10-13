Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A945226B7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912307; cv=none; b=ieSj9jV+c9AttXvNcEaM4bj/N3ojGJAlFC8WkJ5wzfLQD/kHhnbvcwLkN1lmmuGSI/vawgLitaEbeb0CQ/kYpZRzXwNd/XQjAApwmPRco7FmERD9wMmHTdDC3vKh6kRLKSKWHDMMQC2YzP99BLFDeRaieSu4ptaywVhPOab34qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912307; c=relaxed/simple;
	bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIStAI40mlpwf4jy808HZIEoxATLQ4fIZwn++27i/B1b6mipHe91jGTQCCUIZhor9EwicbcSREufnG0z+iDYJNuSSPx4AWYTbpa+kc8JExycl4H8N9U3Z3plcbf0+TwcvguTVRrxEYLXcpGWacOaEo/5ZJ1QXi6eJaQ98s7BEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZquZLUN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZquZLUN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so154717eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912305; x=1792517105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
        b=XZquZLUNvZGS7Dqtyk99CBWZ2mctza4orye/gcmmpRe0Wzu3zEUDimzpN0O9ompO2J
         Q//o+ll+2/tdGNKN2SjXZT7NE0+S0OW1stcepNH0e3sPXiuNhErbo6ZO5ZHQYSf6Ug9G
         uJ7DWaSnjd/VfAOTF43Xehp/ZQPFVIE2LrLdQFtLN2Yr7ZFpwbwOVwlTvJRbKU6auI+j
         iAVXqD2FyNMWU5IeZ7fC3D0TYWAeg7QNmmOQBTWwaJAeQht94hmKAsgfAZlq7mmLQFgQ
         EJqCW0Q7CaM7QUftTTKzhLC7HIAIi4qQB2Vt+YLweTVd/6kFDg7LmIp+pBcxzzEbAO4I
         MNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912305; x=1792517105;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
        b=HTBbE0Xb4/t9LmDJMm/6ZWtVDgym4wBrcc57GXXtasdez8PoZfiGvKSJzcihRwfq2U
         fmI8Y3PjkXWHi5aQmYHyWqVUr2QLBzg0RNfmHRpvr5iMPKXSs5hxYup1xZys/r4BN+U2
         A+jmOzmWOU2Ngjz8ygUud46tOTbD9VXQ7ECc+6qPNBcbvyStGAeaaH12fVz0QbKQGm7t
         aNtd7O51cId3r0Ee11YHJrcnLzD7zuxBZc5307CzAu2gGs37HLZsqsQdvvggyn0fw6xV
         3UDzX/H6hIPrwT2fzfbMx96k1C32P9Cnt1Yspywft3ekbZBKCgBMYgziBg0Er2D85yZk
         Z0jw==
X-Forwarded-Encrypted: i=1; AKwUvByBOT0mvAMT/4Tl5tI/9B+eQdALV9Vv2TNu8Epv4PyMSZS02lAj4zJpSt76BdQujuK9w8GOLjTNIA/xmfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqNJ9T+RVNs6LDPMU1yMRL/rUK2Hrv4MAjWy9+3wn0ahlvEaEj
	ljobAegeK2Y7BM8ubSjkRwh/T7/8Nm1lRGJJ0rgN2w3FMab4YB4zLh19
X-Gm-Gg: AYBFou1BqP2+wOVZzHU+LdRf6ayfDmymuaqj5+cGqATsNFlhgbC7sL62iJNMw9U6Ev6
	dToJHPGnNJoQtApUi/kjpwM/ohKGffaxGx5BSKs/MkfZRb/E9/rAlqAsIpLFSDtsPx3jh/ujcoP
	bZYZCb9MEHhGhEreDtvvcall2PjrBVHTwi9HCj2k/eLsTUN1QiTqpaT5BOreOi9lOvXZtWdVMHS
	4OyypkjjSxExrkooXYarQhfN7PL1TNfzaIwWtUgvJeP3rV4ZAbIHmkyO1exUJ58p/2r+EwdkGqB
	coIBkbcU+Qg7Sv4gWN0MW0YFKO6z8ksffLTYKIl50m97l8PMngphzNMoudknFBd8USgi2jMDmd7
	Pckvaee87jlUBMZWjvzQWSe0bTLg8Ov/jsKQSloBByS2IBRlzRyQMrjMdvwgbyOuprLq7GxDLWR
	fJWWfqoMTQpIe9LbdWSLCinoNkDYpvjpR5LNQrTvDK8InMC5gTTJmJcCPrBDhANurTn9vtxcg/C
	yFMIbdgZjjLxLINoHAWr5NcYkIH8HUN2D9F9Wi4VuHo8/jU0lYJoMIjwapdNNEQ4nLHLWLPXm7Y
	PwVlIPw=
X-Received: by 2002:a05:7300:ae30:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-35c8b969a6dmr3374472eec.19.1791912304982;
        Tue, 13 Oct 2026 10:25:04 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm50303555eec.18.2026.10.13.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:25:04 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Tue, 13 Oct 2026 14:23:38 -0300
Message-ID: <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013142351.771229-1-andre.przywara@arm.com>
References: <20261013142351.771229-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Thanks for the RFT. I found two things when checking it against the A733
manual and my Cubie A7Z.

PB is an exception to bank * 2: its VCC-IO field is at bits 25:24, while
bits 3:2 are reserved. With the board's SEL value (0x01155550), a 3.3 V
request produces 0x01155558, leaving VCC-IO untouched.

I also think we should preserve AUTO (01). On my A7Z with vendor 5.15,
PF=10 resulted in 22 SDR104 read timeouts and no rootfs, while PF=01 and
PF=11 reached login. This was one run per setting with one card, not a
mainline before/after test. In my mainline setup, MMC0 already requests PF
with a fixed 3.3 V supply, so the RFT would replace AUTO with 10 even
without voltage switching. Preserving AUTO requires no special case for PF.

I boot-tested your RFT with two small fixups for PB and AUTO on my Cubie
A7Z (rev B). UART0 and MMC0 work, and GPIO_POW_MOD_SEL remains at
0x01155550. No voltage-field writes were expected with this DT. I haven't
tested the RFT as posted.

I agree the full table and PI exclusion aren't needed, and found no
evidence for restricting the encoding to revision B.

A733-R still needs its own descriptor for the two-bit PL/PM fields. I'm
happy for your RFT to supersede my patch 1 once PB and AUTO are addressed,
and I'll rebase the A733-R fix on it.

I have the PB/AUTO fixups and the A733-R patch ready, and can send them if
useful.

Thanks,
Vinicius
