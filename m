Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7B44BB808
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812013; cv=none; b=X8hj+8KR71UuTuOHK+q6RNTuMCzj5OJo7V8a3svIILstmaCnFstwNBxTtpj6/l0Nbr8UEEHw5g4JInK6M7rt/0Elh5Co4GFxpf8MpwVBS6CJ7sryOMK66OfQyKPzHcDzo1wBPyiBs9mg4FY4RyzlKWMXVReCRozZTI/IUPil9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812013; c=relaxed/simple;
	bh=lLXjXwxHMtrbCWdJPpOO3fzrxcILc2eoAEIijYWPvtc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RyEgV/R9RQyy0Yb2tSHcs7LCeejcLAZgTwyhBdbgDJNDT/gYyDvFOhCPZyEzehI6UZOFkmc0uZ5I7WjvIPf3EKt8/FnwriRteULZgsQtCruz6QAzlUo8BOmfgFG9tA8kuk/RmJKuIZ4Sxe56qOwYRyETLy/SkqK9CPo+KZmmz8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivi+DTVm; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivi+DTVm"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81b8e8e9cb0so2994719a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790812010; x=1791416810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OLk3KH4DpFFvqjf9rs8CgETJ9QoCI212MG+sEX/sM/s=;
        b=ivi+DTVmQcZ/qIQjY0lkvqo4nCX3TF4NYh5d0Y/w8r72mCDgG1pEX2cQTjuZcZLqPe
         9td5kLAgQXj4n7trRQd1CIkWU0858HegCjynr3Szyu/XcTEIxUkYVJNlbSbtOBWSK+EF
         joTrYP8KPrzKOuRo2z1qmNktvjXhAe0/Ff8lCkkVpClKvqvX/LiXbeSOM5/LxlIrHF07
         Skq1TdCCmByOB9CbpfumZPnkpl9MgdwpCvpies0XDE0t4q9q8LgE9it/uEscmF63cRfk
         R0fqFKGFfuicEKOPgIskbqjL3Svf3ejN6mlmFzJBfvayXbhJippG6dfZp4R2gVsSAJ14
         MfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790812010; x=1791416810;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OLk3KH4DpFFvqjf9rs8CgETJ9QoCI212MG+sEX/sM/s=;
        b=hKtqzl58grA4NbFbgQLq/xjSWRCrkD7X62LCpbB4QNK77YE1vHJt4E23+7KWUODPbP
         1zF1ovyaSIlG5Wc7jk5oQCFG7GDCzndZfyIyDOEJA+VpzO2GQO8CxkS6siUWvVn2ijXP
         YqpBdPEms5JTpwZbkS0y6USOakPVW+UaK4rGjijRNKMSwowBGexOKitywPO9Sosg7WdN
         JLIHmAXhC3yE1GC75EIlXkz93yJZQh5bGH0KI9wHFpu5dXVZG9q+/vFOQahdpJQaiAdm
         knNbV2FGQlvgOnqkAaKTQSjMOGfDGjIXYV0IIZBNjaIwAhGTI65xq7gFJHyVjKIZXDN3
         uPMw==
X-Forwarded-Encrypted: i=1; AKwUvBzXs5jROswewSOfC0Pi8zLHsxCJTN7DfGIJ3pYhdB1OXMSuTDj8CZGy/dEjOswL6e52Jc2rZ7PBY4FnDUY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnghZbM6xUyVEla8m/iX4jxSvp8+A2u28v6BiVINSLx/9a0VpM
	8hNZe209ioJKCR4Af5eOAmEY6IES50GdmAbCwQCUt3IEO08NFjsxyJgV
X-Gm-Gg: AYBFou21BnLY3uSrRFR1mlX3kNhU3vEtrSN/AxXfuo2E3pg1ZUArmrnPsnjDF++t8ue
	hvYwdMOzoNrCMMZ/1KwnyZ63zYcJq0dshGsmhRTXizt03PTjKDRcM+ePylUaus80rio1DNGBz9P
	3xno1uCu4hh90KECRBOY3Fhrx6OcaxhHwubeNlflAF96RqnGymz1MbhXgQF15Q0fOcfoQa8aNco
	zDeLwv08PrGftol3aNE4Ptm1/9zuBDKbvAeGAGte1w+iXzgd80N0Ae1fjOl9or3JXCY2KJBEiZn
	RIZ0jMA2rp6ux0pIfAM6MndqAWAJ5wZUw8b1LhWLT+mBH0YtDQggm34B6dFohLlMsYfq5fG3O/C
	3VzsMERhdP1iKpELjRjR2llFyqmz0WzC7YfF7GsoTBJicBndQaCWSom8f24nfsA4EaUxAUflote
	E0jApXxG3B8vAwkJdx3hk7/rGnLHfZeYY6JFHBvaZ7PEMGKKg3lTtNRkFtsc3FWxuofAo=
X-Received: by 2002:a05:6808:508f:b0:4e9:3412:14ac with SMTP id 5614622812f47-4f1b87b67cbmr4118217b6e.33.1790812010444;
        Wed, 30 Sep 2026 16:46:50 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f349a4d217sm796949b6e.4.2026.09.30.16.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:46:49 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v2 0/4] net: psp: require an established
 connection for association setup
Date: Wed, 30 Sep 2026 16:46:45 -0700
Message-Id: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWfvWoC/02NQQqDMBBFryKz7pQktUq66j2KixhHHagxJEEsk
 rs32E2Xj8d//4BIgSnCozog0MaRV1dAXSqws3ETIQ+FQQnVCC0b9NHjQCOZhEa1sql1T3qwUAY
 +0Mj7GXuBo4SO9gRdMTPHtIbP+bLJ0/+C6v4f3CQK1KPo65uQojXmOS2G31e7LtDlnL/M2dIbr
 gAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

This series removes support for using PSP's assoc uapi on TCP sockets
not in established state.

The PSP uapi and connection upgrade described in psp.rst is only fleshed
out for established TCP connections. Installing PSP assoc state on a
listen socket, or closed socket ahead of connect() is possible, but not
something that results in useful outcomes.

With commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between
ehash and lhash2.") in place, this series makes it impossible to have
PSP assoc state on a listen socket. It is still possible to have a
closed socket with assoc state by terminating a connection with
shutdown(), but the series then adds code to prevent subsequent calls to
connect() from succeeding. Patch two updates psp.rst to discuss what
this means for users.

The first patch converts some tests that used TCP_CLOSE sockets for
basic uapi tests with connected sockets, so that the subsequent commit
doesn't break them.

The second patch introduces the actual checks on sk->sk_state during the
rx and tx assoc handlers, as well as preventing connect() attempts when
assoc state is already present. The commit message contains my argument
for why removing these "features" is appropriate and doesn't constitute
a fix.

The third patch unwinds commit 1d2929d0850f ("net: psp: do not inherit
the Rx association on clone"), which was introduced to workaround assoc
state not being handled correctly from listen sockets.

The fourth patch has some tests for the new checks introduced.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Changes in v2:
- net: psp: require an established connection for association setup
  - reject connect() on sockets with PSP assoc state
  - drop PSP MSS overhead handling from tcp_v{4,6}_connect()
  - update psp.rst disconnect paragraph
- selftests: drv-net: psp: test that assocs require an established socket
  - drop assoc_tx_non_established test
- Link to v1: https://lore.kernel.org/r/20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com

---
Daniel Zahka (4):
      selftests: drv-net: psp: swap closed for connected sockets in assoc tests
      net: psp: require an established connection for association setup
      net: psp: drop psp assoc clear in sk_clone()
      selftests: drv-net: psp: test that rx-assoc fails on closed and listen socks

 Documentation/networking/psp.rst           |  8 +++++
 net/core/sock.c                            |  2 +-
 net/ipv4/tcp_ipv4.c                        |  7 ++--
 net/ipv6/tcp_ipv6.c                        |  9 +++--
 net/psp/psp_sock.c                         | 12 +++++++
 tools/testing/selftests/drivers/net/psp.py | 56 ++++++++++++++++++++++++------
 6 files changed, 77 insertions(+), 17 deletions(-)
---
base-commit: 1631d79ae57dce2c5f88ad278307028638a8b4d9
change-id: 20260916-psp-defeat-a271649be9dc

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

