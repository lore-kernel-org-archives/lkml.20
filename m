Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199388;
	b=KjN5wq8DS0OZC+Ig+ZzzqfhPc3YilNLuP9WzQ9j+OJKDG+UAMWeZUgHwM4KSwAoRT36W
	 1PENFeYH4xIQ+UyB8s94sLgR7f3v3b5qdPJPPIRvqGY8Yp2jwOfGoU1q9onEjccjfP1ck
	 tcsYumuXRPzzLxnnV/4mq52lbszdNd/VAZVvNf6MZVFzLwURw+wbQiTTNAHG/Wyn+DP5Z
	 LpWqi7CdL4AUOn82UpdQshbEd8geq4pp48rvoM/q5aMQ+kAZP3WomBKqbV/LZxLjdK983
	 sFoeXsQlvP4Mf859kq+6RJhvkXwzM90WqMy+mZzjYjpRRmCb5uDKSGqsK5k/d08g00A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dMqTaIY27cXKarwOSTeFtEgtD+KmZSEaqSxsz/rGNT8=;
	b=NpduBdDZQu8kqQLvYoWT/nMzsaXUMsTC9T6FSG6P1TQGgdvk/uhHNEEdD1MgjPQirEYr
	 k2dns3DNn5m4EUWmzjAHVRDcPlbYEgdqn9CqZwWa2SdtPuvy3j4yGKuDrORL4gTzTBRju
	 WTkjxeI5yyS35xZa02hBi0WPgvEr1rj0Ju58ptiqspza3daT8LMytSetpLY+quyv09UIT
	 uzVPvISUuB1ikqleVgyO0ewciMq8chIVI5ED28eiR5SIkoC5TvR2LP5YJIpEcogzwhzbj
	 V5GlK89VYzDFIWSiYGe4OAsrNPBrJpZ9pkydBUEfekCZHSPygOaZ8i9ZpZby6EG1Kmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CNZ+dvze;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E45606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E45606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CNZ+dvze
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso849092f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199387; x=1793804187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMqTaIY27cXKarwOSTeFtEgtD+KmZSEaqSxsz/rGNT8=;
        b=CNZ+dvzez8BAbePXIQWx8T/xYyyDCq3mBeNeeCpihiw90SpkFvxZ61/tO+Uyct1Y+h
         WWJuMD2xAhCt76nrRt2KSD++hKe4d5gvvmqyYU0w0AkZXNliRqjoxpvLvS01NwotY+/Q
         2XxioErHRwcwZT/dxzAQQgKtITJMAxYGRp7v6zX9jfbjs3wYdDBtxGc4szd09UIOFk6L
         ZW9KfdnfnfZ7+RoP/wbr4Yaxiyq6/8Iu7APPaiJMkkUrHYdN5ipHoWyipl40S6FE9F+j
         9Jehthrmgm2fc3jRVWffvKKsBqWn1przVNdNqdludUMR7P8yv20GnSm0l5Dlu4GWxzmr
         dT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199387; x=1793804187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMqTaIY27cXKarwOSTeFtEgtD+KmZSEaqSxsz/rGNT8=;
        b=bSTG0VDmhzIbReySiXXNRVHYJhl10x9EZnGQZ2SYo/izvrAXXLhsUmZpVS9LMfllyQ
         F76DUD+OQoh9l3jHkw6VmvFO7n/ZCOWLUsILOSw8q+Nb+L2KmBWP6IoEeB9CmixEG5kB
         z64PTuYc6IIpZ24GUU5g7bs1D5x/n2hhWbSHxMXtW9SnXYbKILLmZbwhXEWfQCVkE3Bp
         ysdtfNZYvv0wQeI1VNDsEcAI3BZeZ3VCIp0Pir+XbMkV13uj/3q/FXY7BByY05bs7+pG
         Ga4bE5DbMuCOLZyCrevDMJ7eeuIrqtsMKadfgyd2elZZ9eDB0ICcGGYrlKChzonkCJe4
         mB+g==
X-Forwarded-Encrypted: i=1; AKwUvBzdFEZFF9SvrVbozqg5q7Ln3rzHCNkW4ARYkAxheCsOWsgRv7UJaOx1sFxiE3delgainL4MS8aF7jbFV90=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyLk/pI7D/yRkJnbV16s5nKDc6bFZBIvEUZnolYoLDbJ2q78Tt
	uS2mBz0csNHrZIqtKDYvAbnz2k660WIomS4MOUYGW+z9IQeo5aCviegx
X-Gm-Gg: AYBFou0AybwtxRgMlI+7S/ofek+z+mLZOwtpp1FxAxpN6OAUe0m7ysdqu9vDUFXlagL
	4/ACMqM4L+sWUorYnKO7eQnxqiFy2AEUw9FRYJIoGuP0gZkUIZe11g2WHSsTx5B09gLa/uU7b/P
	lV4JuUl2lYzz1j4YdvC7bZ28PqQQDh6Des0Wf9Lj2GKOyNQh3dAMcZ9VRoyTtzbWevPVs/Ha+1/
	F9PR9h3XznSalIqZHQikTeWIDKnnPqLf9qhm4bW4CRklISSN5B6LVh4a5R9pFolQxNZblfeiwG+
	pYM9JVjVbNO1MstgZGj6W9u0OeydUoE6llyABXex/4DOlSI05vM3E2jH0dxUcF8sDC7Jm9c5H53
	k8uscmE/9rxAGrBkGTnLbqkEM8LYRKnKwkoalxYwM5QLTwaDnutkoe+kWWRObkcfu0aVpqorzXd
	KypJXUpamDmq620GTDnF37Vyv5CqE2z81I30YYwHlQNVUfG3zwRP8jNVadfeXMNvSMqChdixuD+
	Ss03Vmk5ORnCr3daa7FJeS57Oesgg8rItRtGlb7es8FlCIcqUk747sOGBuXPIMFTMSnuXCnLLym
	g4WwKW/VuzUmPVZjnDpjJjS4y0HcKEf8DY24QFh03pdWXJJ0+Q==
X-Received: by 2002:a5d:6e63:0:b0:487:27f9:841 with SMTP id ffacd0b85a97d-48e6422b40emr155868f8f.54.1793199386516;
        Wed, 28 Oct 2026 07:56:26 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c12:cf67:f624:da42:c66:27b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm28529668f8f.42.2026.10.28.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:56:25 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Yongzhao Chen <yongzhao.derek@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v7] net: dsa: qca8k: preserve port state across MTU changes
Date: Wed, 28 Oct 2026 15:56:22 +0100
Message-ID: <20261028145622.195730-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027212505.1848-1-yongzhao.derek@gmail.com>
References: <20261022155837.760-1-yongzhao.derek@gmail.com> <179268501671.3290.6623232109527554630@kernel.org> <20261027092718.266370-1-yongzhao.derek@gmail.com> <47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch> <20261027212505.1848-1-yongzhao.derek@gmail.com>
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

Hi Yongzhao,

On Tue, Oct 27, 2026 at 10:25:05PM +0100, Yongzhao Chen wrote:
> I will send v8 for net-next once it reopens and [2] is in net-next, and
> say in the commit message how the problem was found, as sinfo asked.

By the same rule my net series [1] belongs in net-next too: all three
were found by the AI review of my MIB statistics series, none in
production. So I will send its v2 to net-next once it reopens, with the
regmap locking patch first and unchanged, and you can base v8 on it. If
yours is ready first, carry that patch in your series instead and I
will drop it from mine.

[1] https://lore.kernel.org/netdev/20261022192933.384898-1-kuncy7@gmail.com/

Stanislaw
