Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539904;
	b=UZKj8X3NstgpU7B+9w/wYEjQ1r7qSjs4YbwrGJxSLxi8NWLv91ULIkMIJvkLN1bvcpW1
	 lJFM1UF0j6v9KT/7XQLu8cFkwZ9POtOG/UCJi70xixaCF/9WAZYzOuL0+ErTtKnJcw4yw
	 Lu+8ZueWMFlW1C/bG5Ug6zNfJ9mZtOOjwPu2T0T6AEQJ0aaFHLAYe7J6G/45NcCWQsgrG
	 S9RkDF6bfA8g0wy7k/I08aLnfb6n4AQvCtMtwzXcKeHa/xtuzbXHGk51eBMz27p7WFnuD
	 BL48E6dfDNxVNAlowzr/sKAboluSZH8ykOPRqqJ48GNC5BiOR4UMz7+ACrnBD8DS8Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FBOQc97nZrdHAQNgEpsF/r9Rzn0ftT3U1q/pgQLpdjk=;
	b=fd4E1m0OreYX2dqXHzZL0g1ohMqJKaDamehb/7AOwdKracx9ji+i5xnnxgIVR5AISoB/
	 tgqEq3QkMmxD35ml8OCbcYu5Svk92tvkwXxtGypw21uNhuntZ2JVGBa7ZYRReok5U/ZsB
	 v62wCaHmpVdvOZvMg45EQLTDA5v4aBBh1MqRb4G2bFQn9CSg24hLJs4AxoPXhtjHrCrki
	 0HzUL5L1IEHjVWs3tEwLWo+bv5N2hYKx7f1mJRi633R4kkQcw1wgHeA2dWNLPbyXr/gw+
	 hlbE0Aj6JIy44ccctG/qeYJ5Wr9GIN9zUiw5lvLgqiOvJ7q3x5HrB3091KuvUeGlIaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i0nRTSQa;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD0606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDD0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i0nRTSQa
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso371606a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539902; x=1793144702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBOQc97nZrdHAQNgEpsF/r9Rzn0ftT3U1q/pgQLpdjk=;
        b=i0nRTSQagxndf5XvpYRinhbw9rj8Ro4ZwFe6n24flHdddd1nTD4li+/VBXjySdAmI9
         mpVAuwLFQsJQ9GhfYspnIqiROLkRmQPumQnsI4NMSNmpqd7vytGGB+1wC54U4C0v164z
         PfCdyNdz/NshhBze1Z4YOThkzj8XCtvA7J7uo9+szvRzZ+6aT8JmgwcQwYaLOBgQEuNV
         tXXzBw3cRLax9vAClZ/O276cMHJ3yMuYjNWIS+ArzyvrJe52/+314p2s5YHbymO1U85M
         bSSPnaKsjIcgafHUYNnWFupeMZ6WJwdIBJAoygyd5RfdHyGQEiczsHGfdro8lqQO8itG
         bJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539902; x=1793144702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBOQc97nZrdHAQNgEpsF/r9Rzn0ftT3U1q/pgQLpdjk=;
        b=KKVpVHdJx0+3uiVcpLpBxYlWIwbaQ2mB7tWOFM4ri9IzTa3CKEL1SQs9adf2nvf5Rl
         c2NBhV/2db9QViPbI9KfsoQNqO+mnwjqwKSQgf8hk3GxHnp01iUXkZxpRVwjo5tkLVao
         lF5N2qVHhPYwaQ0kBCMpoTSKXArFYfXMiPhvxJyRrQQKqC/UC25YsHAmMBJ/doctYdAc
         iT16nx4C2cpTgeRzqknEn3lnBNYyYJainfRp61VfVaKdQURaA5yyZQ4+2GjLMhDr82hj
         Osws6Kg8JxhI4DVQ7RFs56MjKXPoiOvyeLXikopiyzpOOvYpyBjG7VJfRUzj8t+78LH5
         /Osw==
X-Forwarded-Encrypted: i=1; AKwUvBz6egSzH86gE8mAIJE8bcULImb7YBHecSgAd0j9r8yMTVC0teGu3/Po8Sn3483QB370PLmVdANV37ETE4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCyk+meXuFMcETUVg+LoPo2mUPcJaytpAOF12HpSNd0FSk5JV5
	7c2+q0LvV3bsjc62QGg4HkNqcLpugmXZSvkc6PzDU4RjxUL3Ej2i5Ykw
X-Gm-Gg: AYBFou3c9rWRfCTCLxBjMoVboncfBAmk+ttTxxvh9FLtKuWqDCavIN84AOS96c+Mgf0
	B03Lx++rAUHcp1P63Z++x6mD+8HVVxlb0fpvTN1WOIttzsrLSpX+wtunWv85X7viCnaEvWfnE8K
	GUOx8u92bciC7zfzV/MIvOaWVUFIIWWclHe+73tzlVtrAJjOkbgpinWqI2igCjHQd25ZDLGv5nW
	TDY2yiea0X6pxCIAij50oDC+vM1UPtmAXCHwndPRxRbrKbyPzsdwU3kfnSb+V4LmqhWxFEi0H1M
	Yu+uTo5HwlGQbSIViReGb3ANXquDAXbne9onJOG7shMeYGlilS+VrYUucXzDsvmCj4U8pJRiqgh
	c6KZcXVqO3fQOBIgd7jpEZQNnh1TKpDIYlqdSmh1QuuWNRT52GwH6SI5a5ZbdVFx/J5Rt6zN4sB
	82zsqk+zGfqRDaeWFDYd75rJQqgLjobkihOJ9TmewqMsrgxNSv35k4sq10Vb0zitTlFUQX4GHbH
	SdDTySvztS+d3TG1HCbqA/8bGspmroUeZZWD33uGa06t3WwoxoKu+N14T6NRe6jnKtUaKOHDA==
X-Received: by 2002:a05:6402:5190:b0:6aa:12f0:166e with SMTP id 4fb4d7f45d1cf-6b408ef00b0mr147336a12.16.1792539902101;
        Tue, 20 Oct 2026 16:45:02 -0700 (PDT)
Received: from DESKTOP-DIIS71I ([5.18.141.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403110fd7sm216863a12.20.2026.10.20.16.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:45:01 -0700 (PDT)
From: Rand Deeb <rand.sec96@gmail.com>
To: Denis Kirjanov <kirjanov@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	deeb.rand@confident.ru,
	lvc-project@linuxtesting.org,
	shda@confident.ru,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH net] net: sundance: fix sign extension of the octet counters
Date: Wed, 21 Oct 2026 02:44:34 +0300
Message-ID: <20261020234434.318-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

get_stats() adds the upper halves of the 32-bit TxOctets and RxOctets
hardware counters to the byte statistics with

	dev->stats.tx_bytes += ioread16(ioaddr + TxOctetsHigh) << 16;

On architectures that use the ioread16() from asm-generic/io.h, which
returns u16, the value is promoted to int before the shift. When the
high word is 0x8000 or more, the result does not fit in a positive int
and ends up negative, and adding it to the unsigned long counter
sign-extends it. On 64-bit kernels tx_bytes and rx_bytes then end up
2^32 lower than they should be. x86 and m68k are not affected, because
their ioread16() comes from asm-generic/iomap.h and returns unsigned int.

Cast the high word to u32 before shifting, so the result is the same on
all architectures.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/net/ethernet/dlink/sundance.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/dlink/sundance.c b/drivers/net/ethernet/dlink/sundance.c
index 58873fcd3..cbb1f1fe1 100644
--- a/drivers/net/ethernet/dlink/sundance.c
+++ b/drivers/net/ethernet/dlink/sundance.c
@@ -1545,9 +1545,9 @@ static struct net_device_stats *get_stats(struct net_device *dev)
 	np->xstats.rx_mcasts += ioread8(ioaddr + StatsMcastRx);
 
 	dev->stats.tx_bytes += ioread16(ioaddr + TxOctetsLow);
-	dev->stats.tx_bytes += ioread16(ioaddr + TxOctetsHigh) << 16;
+	dev->stats.tx_bytes += (u32)ioread16(ioaddr + TxOctetsHigh) << 16;
 	dev->stats.rx_bytes += ioread16(ioaddr + RxOctetsLow);
-	dev->stats.rx_bytes += ioread16(ioaddr + RxOctetsHigh) << 16;
+	dev->stats.rx_bytes += (u32)ioread16(ioaddr + RxOctetsHigh) << 16;
 
 	spin_unlock_irqrestore(&np->statlock, flags);
 

base-commit: 4cbdd58dfa7aaad679bf62f81cdbc96a6cb7c6ae
-- 
2.39.5

