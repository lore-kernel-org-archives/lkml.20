Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307787;
	b=o6i1lh77bJ0mOxSOAuRCNUWOxWBl+UH5kR9bY/70HWAqXkYZgYa7mNdpPsA7iBkNFk0t
	 hPAO/zQZ7KEn1L0JFNnMb9mrujhRN93rAgsENKk2JXxm7rTTS9bWaI5g3+l8QUy5gmSSx
	 4e+4ikE1a6Z3r7JimFsk0vK2BxPP8d36KzhLG9j2pmMqzwq2+Z/X6Aju+XIOb6hiP1DQm
	 RbXlF8iyLJoMMDOoSUfExAloaEKCobIm5QJieum3gu7OiKPo20nf+19I54LHeHIl/g3kF
	 G/n9iyGgLV1vaNw9rlYDP8IJJAg3R3XF9+u8RVQbwjEeYmF4n+z+FITThOoSIdwqUFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TtZhYEtABJfA2LZa7bPQ/zz+wzRCh2ll5SwHuH1Q5/g=;
	b=fVBnMK1aiehPn1Nmsw9xnnY0Q9UwzotkKxd9aNeuy4Bi8gbW6BqaqRCqAdIGUM4AqRgo
	 64kLhseKe1pxFhZqpVHc20f8JfVww8TeeRHozZN+B5LD6deWEdtw9S5UB1RXjX+JVPNyn
	 a3HkoH/vjziM8QFV05Z5vpqANqmMaw1wKmuchFgTJ00NKAbxRvbhHemK8g+VIse/VrMq4
	 hCiYOjg7gz7nu2O86qsGPvy+MKUX19IT93RvPsiMK8QcdgefKKSNN8+yVyA46cpl6A6fv
	 u/1g/N65GHDUaybe8mHGoIuV8VkgwIt5SQcnrX3zhpTNaknVPSDxR+Uq055xk46pAMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVmeAA0I;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A6D606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A6D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVmeAA0I
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed06b725fdso14076565ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307787; x=1794912587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtZhYEtABJfA2LZa7bPQ/zz+wzRCh2ll5SwHuH1Q5/g=;
        b=VVmeAA0I/x5Jg8HsmZJb5VdfMpr4zhvPv3CVsEBanr1+33/kKxnJC8xDa7BnpQLcv/
         g3OvBUvWv9kSAIb4H8BXwvkXW8UnuDZ4pacWN4tKtw2wLtSB5nNza+xs7OIms/gyCnO3
         Q2XgvSuWKWrkrGF5t5dXCHMxppLCcGJOaMrWNI0ZaDOKYYAMUx3cCK6nw+2CWQdCpRcD
         u4sFJX46QFkwCADxE5aPQRYY1IefSihldQComcFDHIDZolxkxh5lwzXD2TERVddeSgsJ
         tu9V1NDZp5ZzrAAirb4EVt7KaoqbmoCxT9iqdA0L7dbr2GkbkwbcpLDl5aJ305uZ7oi6
         IkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307787; x=1794912587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtZhYEtABJfA2LZa7bPQ/zz+wzRCh2ll5SwHuH1Q5/g=;
        b=Cz4p6zhCcklKLANMgGW9dhRk7L2YUKqn3UeXZIIbw805/mrbbuPSQJFUWdTo6/b2ZL
         26JszGPuWasIaDW6eGvKtGhwq3laWljwplqEcpnWRCXBtBWPJuPrr9ZBOmdPKOqo7mRW
         +UJ+vnQp7jVFU81HAMCLpQ4qvBM9rPxQh4WwRhgSJiyMf8E8bWC7Ff5iR4Y1wy3FRy9f
         evxtSPfRx4kHbkfsG0Z52K7qb8zzHTazu2GdAY6V5L/P5ow5OdIBeoReH5DCAj5LVyUt
         E/9aIYnJlZg7ovHmZO1RqrTNxqw/nnAeiIeYsM9yLRNXatEUE/VJ9602gh3ddDxD55mf
         IYAw==
X-Forwarded-Encrypted: i=1; AL+hErHPFx3pWXtFaDBsmqKJXKFqdVDce0YRng4NUIlSND1dMVtRsD5SxiFbH2ocmPh3TxylgYnx1NXg/vd3W5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rnLerFPq6E0VM3CA7OIqQ1qB1DBEKegQ9BvcpZHwXRoQ+O+z6
	sSg5o6mkVOcDy2XRc6SAwcPf58ti3OmYuOvxPokzosRH58dGYg7MttRiTXxhExRn
X-Gm-Gg: AYBFou1e2zlTPqF4nbInZrI8pnI+FPfxwegFCDtyTpCE6cFof1CTNsUe2I1X1/diZH4
	TlR3SND4D2atoRR03l3ebMC7dWRyc9fDFARhm8EskpYuIUDqmFtFFz3CkctJe+GQ7Tq9Lk8qwN9
	g7L+oXZXzA0rwYm8OAf25NEjylSIQubG5dtdvcAblBwnSBglnf9LATq2LM2TocIyB7+i8K+KxKv
	ckGuWudsvCqCYWtFu/dENkqkffZHr9nQRjQ6naxXn/aUq+2rO919XQEG78Q44W2ig4LFXOvWnnd
	bfVIkL5fxLAAI8D0Kj+BGxdnN4z+G3hZ/YUzNybEG5UDmAkENiBjH2ZXIXOpVL3n7qbSZXGVD9L
	riIqcC0TZXOPayaldVSZiUWxiEGLase7I1Xgt7V44qREqypfgnL68Uhpl2dgTrJRWOw8J/LXjf8
	iMLe0PWqfm8p7U8yJzx2kivGu5NwTh4SAdY/6859IEJIAdq8rJ6eWKSYi7YIS6kmV/pnvf5pmZN
	PaWZGQk3Mptm/5yOdG3lWZcFveNXILHyL7bJVtfreS/oLREL1/SgrfrdtZlDxhbcNvA/HBowsMw
	K4kmI+HeOp9kQIMhMvXfz9zrB8Kyl4+GOv2SFNwTsRIN/a8c9+X7FT+j
X-Received: by 2002:a17:902:cf0f:b0:2e9:5313:8f7b with SMTP id d9443c01a7336-2edb715dfe2mr16779565ad.9.1794307786556;
        Tue, 10 Nov 2026 02:49:46 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6214:1250::1d3:d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d906e4sm7337815ad.40.2026.11.10.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:49:46 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 0/3] net: dsa: motorcomm: ACL fixup
Date: Tue, 10 Nov 2026 18:48:52 +0800
Message-ID: <20261110104930.223598-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Various ACL defects. Found by LLM and manually verified (on YT9215).

v4:
 - reject action following redirect action
v3: https://lore.kernel.org/r/20261106073806.112122-1-mmyangfl@gmail.com
 - also unset `reason` initializer
 - fix action resolver again
v2: https://lore.kernel.org/r/20261103095514.338700-1-mmyangfl@gmail.com
 - withdraw patch 2 as it needs another test run on the device
 - fix patch 3 to align with software behavior
v1: https://lore.kernel.org/r/20261102071119.3435180-1-mmyangfl@gmail.com

David Yang (3):
  net: dsa: motorcomm: Fix extack message on unsupported TC actions
  net: dsa: motorcomm: Resolve the flower action list to one ACL verdict
  net: dsa: motorcomm: Delete the ACL rule of the port being unbound

 drivers/net/dsa/motorcomm/tc.c | 88 ++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 41 deletions(-)

-- 
2.53.0

