Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660C3E7BAD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336334; cv=none; b=kmcBZo0qw8XUSS0XzMfad9kLE5xJGGEnVZFA3kdA7AYOhzicYbTihSrnQ9tNatLp2z2lhr4QhGhE3Xvte+4v3T6/6FYhvjJJNczyQlGvreKrLjGUqNmL/Xgb1oxkQdi+VqsAhEWo9WfpWrCfGc189upXJuasNSXcD2q/CALkl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336334; c=relaxed/simple;
	bh=uwT2KUAI1VvCWLMzjJ8R9s6y5wJv5+DsF35eViA8fUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QszY08sx0WPNG40JO4JrEayQG2gPPyTjV7NcXKDlFePyXOhVWBFJ0IJeIHYrmyUBp2U9fRVI73znhM5QlhXHi5ItkX2/qTLhlv3ZWiqPhwjm7qTQffSp/8j3xcAHQFx78TGTwp/zCxGMakg5wiFfn58KsLx35rChfqirs8Nl5e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=FputoI0c; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="FputoI0c"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so5902435e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336330; x=1788941130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cb3utlTtnJeIblx6OWLfMMuXM2H1GUHEGzZQA00gdUU=;
        b=FputoI0cokTZZLIeui22dUOWyMeGub6F8v/XVCwvcfr8YolKFGi6VkpAgilL0BLfB6
         sGJb8540rkbAK03bw7vrrh3tvp/3wmeZJ8Utgxl7uS0ZMss0j8UdH/FtprpZMjIKhONp
         pmJVWYtXY5u2huAkLN5HAHuHfRCtqlkvtzQjBj5EUfx9IH29pb8qt0zefetrQTnAwz6N
         qRqKwqOiyQwoKEzCBuPoJ971jhb4xOIb4Hu23ERY7b2CCOsF/2MS+WqMKX/xLPfMC6Hm
         8CQwREIv5tfT7pRCC4U2OiFcvqJuUFj4Ak01Hzbsmaf6+vsI1fbAY44CzsmJ4DkK1Q7h
         R6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336330; x=1788941130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb3utlTtnJeIblx6OWLfMMuXM2H1GUHEGzZQA00gdUU=;
        b=QcL2+0Gvtkiwx5IKCrEqj52AOSe/2JL/CY0DtWUvjOCdm/1f+n1jui5FxESEoJmdcJ
         5bdM9uFNZL9OpwTG2ZH7i1RG6UDQYYF8KI9GN2st+8z333dA+FZ8jtC4ZSsta+FD4Vip
         8VTRCP0RUAWRXPKU9rVpKzs7Q4yVM/eG9YPJ2NjCDSDQexXCHFyqaGwS0I2i9dLPFFi4
         JPjzwbR96G5kLbq0jgdo8KFTDc1ZBwqS+sb8MOLi4iI6yx3WMtHRUwGpJ9tY5MdVH/j1
         prNEzH6ricVKhzxmdRRulrJ4ibHF/LP1Gd2Pk0fgHWvlvcX3MbfQE+S5NZc/rgTAjIu7
         3vqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVEDuMAoIAN0rP58P3sc6ljSOp8AW+P0bAUqcYp8MPrImch0nfGKgXetoWxS2zc9jL+rw6KQiHb334wdo=@vger.kernel.org
X-Gm-Message-State: AFuF++mfpye1l4ilwq+ISw0Y/4yeHfz2mkHVmhTVzj0y8BlrqiwfbUEw
	qCeYQkOoxy7AtPhsaVH+NclYYz/XtZZQ2czJZUBUkJLl43tcpy+EV7QbW2PBUsMAeck=
X-Gm-Gg: AR+sD108QGzV5NtoiyXLuvj30Geflw+SjlZ3SoOcZbMBdtbMtXw5vYstF5RYuiWkFsr
	pZr8JOIbiBqylfhd58/oZSwmjXK24xeFmjZLx+igNbVb5WVoZquJZ21UGeWo57nla+SB1MakbC6
	W3KSHlHuDKvp9kG7iR/vLYlK9f61kZG3hucV8c7KAGbZ//k+fo+x70K6hsAIpp9zzPB9vE9+05+
	Q1a/MxWtxbbQc7drV6MRiqPbtS8PAYeqcwrioQSnQjijOOsVeO67ysNVjqD9E5hXeVSqW20tJZA
	JHJDncxjWdu8YHzLb67Xx/6sQXFYYSnV17Il6hwcEP9U32U3AtmaWlFhzoHgrbBnlkl005GqVGQ
	JUn59mwcIht687cup4ZmsFY++dcXUZeGQ7ZFVOmnzmOX+07//0B2Ux/lhBSQfsotjSRsmWzOZqz
	c2aQMFfzlZbEgu4CEoHNNXbMMtSFLCT/wZBLhXJOA=
X-Received: by 2002:a05:600c:8b62:b0:49c:d293:70c8 with SMTP id 5b1f17b1804b1-49ce57f524bmr58112675e9.3.1788336329943;
        Wed, 02 Sep 2026 01:05:29 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7dd5154sm17766875e9.2.2026.09.02.01.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:29 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Th\u00e9o Lebrun" <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] net: macb: fix the link speed the taprio setup reads
Date: Wed,  2 Sep 2026 08:05:26 +0000
Message-ID: <20260902080528.2211468-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two small fixes in macb_taprio_setup_replace(), both in how it obtains
the link speed it scales the schedule with.

The first: it hands phylink_ethtool_ksettings_get() a stack variable
it never zeroed, while phylink fills only what the link mode provides
and even reads one field back from the caller. The second: the speed
check is written as "<= 0" on a u32, so SPEED_UNKNOWN passes it and
turns into a 1 ns hardware limit that every entry then exceeds.

Compile-tested against net; the driver has no test surface, and no
macb board here.

Aleksei Sviridkin (2):
  net: macb: zero the link settings taprio reads back
  net: macb: reject an unknown link speed in the taprio setup

 drivers/net/ethernet/cadence/macb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.53.0

