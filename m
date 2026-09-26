Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E732AABC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386088; cv=none; b=ajrOe5pL+eEEb6iwDukgRUW7a+q3Ozm5aL4PF830KdInawhVFf6642h5IfgFFbAg2L2iyQ/c/KY1QnD2n17l8GWEx88fiXhIn+bz6s5uTCCiDqYlgsT6h2K/OA3y7jLFZyPLS1WUZ3EuFgtaPdKwQFDnY83iBo6XxeT4PGWL1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386088; c=relaxed/simple;
	bh=wShX0zpAC5r5PRHtNSvfpXC3czdmPPUwjX2QIAvqv8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q/nLCvl4pXVfu5TNDXLGsxWeTVapWYrE+U+g4iAzDQjE+8zTNsJoV74mkXWyByrjcVKXDwl34YXpfrchBOlkEmWgMj0khXSjI/kPQa51XOGHeAMFkPzRwPKJ0+FxBfzqjoh7l5xsMBVysNlKcLx9n41m+bZVLgZiXrFRCNnn5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL0i4Nxi; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL0i4Nxi"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-8167e0d1f90so931418a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386085; x=1790990885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+toha6VrbQkrcl6KomMLuldwsTi2oI7Ju95Oeokb+VE=;
        b=EL0i4NxiTAFGlcMeQh07a9PuDhNsdze5MImumDh/R8emeZQ6KOWVgcb9ZVUF+M01iA
         zPX4EOd+9TFemjgGT+qC9wQ89W7PgeKRaCLqEKexP4SFvq4g5lzhKTUruLuaz6eRPefL
         CCaUPxAdGmnQ0VfNMThTrb5Ta/zM79RRCmTpI9NITB2UctjLDcW57Iuc1qrvhjjDpfrR
         9rKw8oyHYqslvP2VVuBc1ljqrzeA4DtU66idtxJeNExvRSNYkf5hs/vyPFLt6bi8q+5b
         LNVtZ+6g3g/AXoS1ZbVf6+RNrbHRwdhioAtgdjpa4emmMjU0867SgRPhRT6je3Nc01Ae
         qevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386085; x=1790990885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+toha6VrbQkrcl6KomMLuldwsTi2oI7Ju95Oeokb+VE=;
        b=uHkBdSZbpLxfUqBCLw8YgxE8svTJXcQjbrFp2QOPQQUVK97tJXu/0rot/RHqGKyyIk
         RZl1lOkUqP+mEMCEzMawVqH2pySYWUVMqMtYX1HFYUFN0Xn8+VpTL6d63RSgel9wNlU0
         hLtZfQ8RRHqoAQjFVG4lREJwUkbnoWVuVGBfsl35alLecRW8W2F7EUeiAoVa2Zkde3DK
         nhXB0WbTSPZF432TGZ6eg1SGwi36N7Oj5H45QDYR4uJ45YihkBeidACJb50x7IBIE6H9
         stVYKcbbdK+DnJoJX5iACdwVfJWoSBJW+f963XsnGDaAejKxNLzymrWmc/CmMA2l6fIL
         ZrSw==
X-Forwarded-Encrypted: i=1; AKwUvBwcLEaRXh9CE6gJGLHxD4uiDHNr8onTN2DtDXuhtxCyVfJpFvMAvdPEpKrElaNxR6RukINkJcmGTeN44k8=@vger.kernel.org
X-Gm-Message-State: AFuF++lozA0kbi8yvJ6xzjl7S2k10j73IICYgmXz4KixME64hYIkFnAE
	M9pY03469wQY6fcPJBcCfkNp0WeUnkOXA41DC1HBKGXpONvIgjaSTbrR
X-Gm-Gg: AYBFou1PIxeecCIxFzvWEWQ6B89Q80zxEMw7YDVVTAppDS6mda/8Bce5Mz4wlg8w3uV
	fFjHW4Fcs13vw/JruVPJctOGBjUE1OebUfNsqiEwH5+fKmAjz/2zGJ0hVlTDgfXWNiqVsCPKUML
	qlsDceAVfjcWvWaSPKLBq24tBmb8vzljWzBK7NZGBAvPVy16gnhyBOEUOu5VAZXdd9UMEFZPSe4
	CRFB2jHLZ42wX4ELvpKXeS7era8scibHhy9gJuWzXFfBEilc40pmxjkFY12PaJgDSKPAOp1fJjs
	8rVMbqc4Tcm24BIjF7S6/FzIxIbSWdoHgBJJbT/zaor+v048sfTsv2htxZgK+dKoH0ZaWLpzwXX
	hzepkxi5cbZBL/NCZ1YMpvoLsVr3+IZXQbTQOT8ZE0QJLXVwvZkAWwbQqpafbkobsv6eHcmppN3
	YoCBkDm/BhEW3OEkdl7Gq1WMg7CSM895KnFQum62z2P1qEBSFxzoCwf49GE+ze3+JaqZ+p
X-Received: by 2002:a05:6820:221c:b0:6d3:54a4:4dce with SMTP id 006d021491bc7-6d43fe71fa7mr8043748eaf.37.1790386085363;
        Fri, 25 Sep 2026 18:28:05 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d581dc77b5sm4858172eaf.3.2026.09.25.18.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:04 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/4] net: psp: require an established connection
 for association setup
Date: Fri, 25 Sep 2026 18:27:55 -0700
Message-Id: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsft2oC/x3MQQqAIBBG4avErBtICcOuEi0s/2o2JioRRHdPW
 n6L9x7KSIJMY/NQwiVZzlCh2obWw4UdLL6adKdNZ5XhmCN7bHCFnR6U6e0C61eqQUzY5P5nEwU
 UDrgLze/7ASTZC9JmAAAA
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
closed socket with assoc state that connect() can be used on due to
tcp_disconnect() not clearing PSP state. Patch two updates psp.rst to
discuss what this means for users.

The first patch converts some tests that used TCP_CLOSE sockets for
basic uapi tests with connected sockets, so that the subsequent commit
doesn't break them.

The second patch introduces the actual checks on sk->sk_state during the
rx and tx assoc handlers. The commit message contains my argument for
why removing these "features" is appropriate and doesn't constitute a
fix.

The third patch unwinds commit 1d2929d0850f ("net: psp: do not inherit
the Rx association on clone"), which was introduced to workaround assoc
state not being handled correctly from listen sockets.

The fourth patch has some tests for the new checks introduced.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (4):
      selftests: drv-net: psp: swap closed for connected sockets in assoc tests
      net: psp: require an established connection for association setup
      net: psp: drop psp assoc clear in sk_clone()
      selftests: drv-net: psp: test that assocs require an established socket

 Documentation/networking/psp.rst           | 13 ++++++
 net/core/sock.c                            |  2 +-
 net/psp/psp_sock.c                         | 12 +++++
 tools/testing/selftests/drivers/net/psp.py | 73 +++++++++++++++++++++++++-----
 4 files changed, 88 insertions(+), 12 deletions(-)
---
base-commit: 4a0f98a164f7d049f337a1a17579f402707a460e
change-id: 20260916-psp-defeat-a271649be9dc

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

