Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419260;
	b=GuSzprKd3+9zQ0mQNZT4huRhsTlJ+8JhnFyIxwvdzHD0IXVgO38UuH9waz8SWZTV9nFN
	 5g0ecDsHCLv+TkSjlmspb0kwtPyK4Dy/kz7QH9RiAbbXsNjlptPb2l0IvkE+gHVksnpms
	 yQxR7hl4ZZrNQQ4W1ZvO08H/YLPt8Q2Tdljya0agFoz6VgW7X3zLrQH4qyGGDZYsxTEwx
	 vvPY1Gq8QmByC+TUl8bIT9+CFsygYrayXpLKUDpqOQiY7j2/8JPUTpZZkx8YoMkh/4Sss
	 jzrCXNKYzdUVxImyxbHxt89wqKbkGsQLzS+eFhtPR2LgkKusfRg8b6+M60VtFL2XJBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4MaTdFGm3iwJfcX3VGdFborPM6URWf3gTu0u7KO9Lxw=;
	b=hnxfXzuhhia77wsFgJjcuAnHz2SC3aeUHxHNVAky5P8gZd7RMfjftrgHKz88o6RjA3wj
	 uI90LWBAAybNagnSiOkQDz9baMKaosV9mIAlQ1lbtTt1nKa9Ftou3Pt+irlsok7j27GJo
	 P7YBakK3as4HCvJupPTyv3vrE23szDn17CJhLoC1ZwS03QQiug1H3A+5LgRu1iokVqU74
	 tNchll8bLPdIiwvnE6gMHsdWsUA0Eq2dIs7S8wH3WJwXKMMklbGvd06DvGLEo8nDBc1gK
	 26FW7dbAe6dKROujzoo1Hj3QqHPGZyU43bh/C+4nJlQ9SHvh0MwBYzRz8S5NbUUs2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9iQQDXK;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E2A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E2A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9iQQDXK
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c246c0c60so104641d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794419259; x=1795024059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MaTdFGm3iwJfcX3VGdFborPM6URWf3gTu0u7KO9Lxw=;
        b=X9iQQDXKuNjq+myrwm8V4PXdcRhRXJAvcHYei6UT/AUaVZFNEBxcYcvMm86gIAU9sp
         9fiv5DnqAq4z5pG4pFLxxnLrVyiKu7DkyjkiZx9kEWM3cBVIz495kFM5maT2g9nuweDC
         b72QIY86lc9LZwtjGAC2uYkst3x4CwQzwWb1nGOpDOEATGbdtF6jp18tvNljPOKs4e+O
         WW5cNYpzFY8lrKExK3+jIhhthMlMGOIWh28yvumgj5zqcB6L77liKuiOLthogauVjPAq
         P/0go/3r66tFxEICnaM12TEa4SgzEBr+7jQkMyBdU0xO6uXRzzVAgeyDQA8pMG6ZqNu6
         5KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419259; x=1795024059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MaTdFGm3iwJfcX3VGdFborPM6URWf3gTu0u7KO9Lxw=;
        b=xZQ7JG2aLHhE+zc5ml1yphuFtUzAjbXAASvawEC54fpLfuO6FA5s1MocYbyDu8iKVk
         0ri4wiD4v5fAonIzkHTeVS3ru7EFwMtcYsSztQxGfw20fBcMmvHB7hb/QOsw9TsXpmtE
         he3PGZx9hoPToEl8sNuSfKOh5H+b+4Ezkic5P07cJcc+sgjjgvb9+NKiS9z5RWXC5Xcw
         dmTpgfhyIhusnJbTwsw+pKlfF4vZSzIRQ3tlaFEvylIfi6icRlqIMDMtHJYParGnXVs7
         FHwE3fQx9P/BwOMtr22OO5Z7VUipgmyXXf50Teg2vhqR4AudvNw0k0gqrVwRCYBUFt18
         qarg==
X-Forwarded-Encrypted: i=1; AL+hErH+EduQe1Y20TzOfkIcYkloiZPEDPPDg+20EY2s/EeVhc3OjOptI3Znl0DnKIhj/YuwOcjvNvdP8hBfXgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Eul8daQ1g3aLtuTZVVbLirF2gyYzMEDyrxIq3y90nS1Yj/hTE
	mTgsMj4KEshR/YIyEnI4sPmWNLD4CAazawdS3J072UxdiRfc1Zt+eOXn
X-Gm-Gg: AYBFou18GL1Xg8S8sPh6o0N0I1hfngznFozuRh8bzq1mfMKcYIk8tkfQwdCO2g+mcjP
	vSpGv3pinzBuRe7IHEhR9JsfYXv57ll2kB2kUlUP5tP4f7yMXJptR44bqCIQc/jVSjMziJQmRoX
	uO5+iDf4YgqwRBC/iEqRjJ5V4QR11PxAwHRTgbnQxikZev6TiCx5T97eNVEXQ7PaZSHPABBQjJP
	+Jug7GOcf6m9VvwoGk+BnJBec6uD0J0jjfbnZmemBfsgqo3/pbD1lvAbCvbybt46olf4Lt7C1bV
	x0OxOKf7wnZEaAh0jVTnaGFO8JPhy83NANZugIi1Ex08X48llMasAlG8F2clsIaVfLUnf4/hlH4
	rZQJyOIUOQ/mZPPRc1euqwC6PAhlVPPJXSQpnZdfPO9TFj8rzEUn6dL77s2p0ucbUaC0UstSqio
	wlyOUqVqU8CHs7y9pW6ZWiKi5bQOt18YHlOwN66dn4EYnUwv7TUkY9h453YfShLSPmEkyuSe9bH
	FSeh6tIjcdi3eQHReFcooY3217S3hYv4O4jcia/15IuKzf6lN7oeToAOEy3SNCB9UbiHB09sZ8H
	4h0O7I6fvtzaH1+NFFLx+c2Oo9JTxpA5vbVERAgWp/8Y0bf518do/A==
X-Received: by 2002:a05:690e:dcf:b0:67c:1fba:b450 with SMTP id 956f58d0204a3-67c788aaf25mr106177d50.16.1794419257699;
        Wed, 11 Nov 2026 09:47:37 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c6f24sm5077708d50.12.2026.11.11.09.47.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 09:47:37 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>
Subject: [PATCH net v2 0/2] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
Date: Wed, 11 Nov 2026 12:47:02 -0500
Message-ID: <20261111174704.24312-1-juanagusnicco@gmail.com>
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

The SO_REUSEPORT bind cache (tb->fast_*) can let a socket skip a bind
conflict check that it would fail, so an unprivileged user can bind and
listen on a port that another user is listening on.

Patch 1 fixes it. Patch 2 adds the reproducer as a selftest.

v2:
 - Shorten the changelog (Eric Dumazet)
 - Add reproducer as selftest (Eric Dumazet)
v1: https://lore.kernel.org/all/20261110080008.26112-1-juanagusnicco@gmail.com/

Juan Agustin Niccolini (2):
  tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
  selftests: net: Add SO_REUSEPORT bind cache test to bind_wildcard.c

 include/net/inet_hashtables.h               |  2 +
 net/ipv4/inet_connection_sock.c             | 15 ++++--
 tools/testing/selftests/net/bind_wildcard.c | 54 +++++++++++++++++++++
 3 files changed, 68 insertions(+), 3 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.43.0

