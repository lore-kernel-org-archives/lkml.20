Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673605;
	b=GEaqsZmf0iHRSsHxLRHDyP/KgDRm8xn8bRlbrDSmbiY+qjE1gCSpQQly2NLw2jaBxd+3
	 Dpk1RCvjqV7mKZJ3yOkQr9q3jh/kOMcnj//hC6q9N4lX1gV+Cy9pv07kxSNFdUYhwdBEv
	 Tr3KjOKsao8WMW4fI9iVykhz/9VNoVM91alSLhzEpi35pbfeVKIUAYLak9y183MEKod61
	 uaCSN/lCX6OC71Xp81dsHp309veZ0U0PmO0mpUxK+pIpYjSy2kDluPskj7lvUakR28yCu
	 yyT6esr5abl2UON3joMikUNJ9RedC1RW3rm1K/4mTFBgg1+fuolimqVn3M7AqPNZewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
	b=5iRR2i0169lx49JIr688ofR4R4j5zLXWGk0mo0hTCKv5nnkBouD49aBprD9memx3yNJd
	 vpswuhAN2FiXAidX43/UlScMW3zX86SSRzp7da4sSITQ1mnykt7rOfp+FyZghG/Fpa7EB
	 srY2MdnB1U4VGLrKsFF4GLFAyKodRhHKVKeLefw4PLq2camDkQpXHJsC1Igw8TI+Hqw5W
	 d5WAz+5xYc4jEeDLdYkhnEvRN0astIm1K66NOEpqJGbcQ9pYviYJaS6zn2SSiPCZbMATr
	 1U2X1ehRkTYNy871QVvSCvFa3FOlXdUaBGaOVsYG8XK/XpqjVlyK9XiUWp4V8Q7/DVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EGFEoWw/";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE81C606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE81C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGFEoWw/
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1001191a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673604; x=1795278404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
        b=EGFEoWw/K66OepLc+Jg+1H3FNhIxIOjTvVvh3dIMaaL9GQ1uDnLPUQHe+lj+FgQkjN
         /q8il6b42zPDdNTG+bt4wLaf0UPlZUWvVdM7OduPNjxsDpHgEjA1WrBwBOLrHcFwgoc6
         0r0OSsBaW8goPuNi5+gJe6PgUEyd/tBSQRtC7iUR+YgaTp9iLiZxkUJUsrCcPZ0AbJU5
         kKn1HsH2VzMPDRpFg7ZSnicvbK6vdhoUUIHitf3Rt/fsP+6I713HymPSKM8VdBaild+y
         uSSbulC7kdMTS+tJHE7BKoAS6Y7ehcJ6tbxV/hPttGHRApR4Xo2L9KKAFU1CCDlvDq/q
         rmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673604; x=1795278404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
        b=WSJROvmyrXbMoQEFBtPsRxmp3+/CQYd+Q9C4Q8pk9EIRzekaPxiK8aSVjDwDgvUxEX
         pzHd4uwZOpAndw+C+77AwWTN2NH3Vx5mQYLoZPC/jzCskmTzdoUJs7qMwVrcOwIGf8oO
         M3w/zWq+9szZvDGDAR3b881vJlNNsAtRcaEnsc47Ja14Y4rWUUkaRzchR+GjFop8Uy2d
         neE/1NJHnLmBZol/MUdq2WElewKNWSNknWi9KSTa10Ja7pMYoW4F8BwiIE+7aZj3ptTL
         i3QCvCcAXwJtnyCTVH0hJwljc/kFdIepIpipRulnGixUmAf5RNgvahjobbDNTTHN91ts
         wVKg==
X-Forwarded-Encrypted: i=1; AL+hErHxGfXVi0hWtBqaEjeBl4sl578SPRYppAgT22jxwhN9uxKlm+G5TEzh/xt8q66lRXQWu/Sq/OI8cYJ8ouQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s98Ughy4mPfAOCwm1Cju3EoyHwmWuq4UP2yIt879SZ+gRYEG3
	OVh8LbSNgAxRIgjCzygMWqFMljUo+nLveqXOZomufGOXCJ9ApD9KCpNu
X-Gm-Gg: AYBFou2gKBvRVbZ1auLHqpiOgqrCSvqOYp5qiQWcTP58p2kvkFLC/vis/YKFMn7KvT5
	k2pFw0t+ZyPdoGgv9l45trcZ2px67iDB3VFTEEBmhjZ3+v3Y63brQaukzQ67FGQrgxDww76ddRw
	Ju/5YSvi0HCmeoMewk5PC1xGEL3FekjLE/j4fdbhT7XrA8ATiU2EkgAz0j5UPZAEv9syL+CT+Z/
	0bOl1qLv7kIA3NNDppL4uXd0s1/Sd1qTFtHnYjvlThrVOB9HTw4z/mIpDsT5uublPOI1wyYbjDx
	Q1bUoSw9AIsRcKinleUuiwYoIVxQRYvIaPZFVt4yvVbpqENHQYelVj9M6iOKI4mTG+XvMRAAHkc
	fXQHXttg6SBhlWh9sQiBet0RLuTXINuk1Inmfh/l9s9hLbfQyWkp4ZgUY19zhVBaEVoEUgLW/w6
	96lVFtrkCcEUcgvw2AB5CyyffNeY+r8nmxWxJA0JwNI1AO13cIfJhI2FeEeHm0HjNQt0sA7jJNR
	3LNia9f/7C8/w1JmWL8zG6kZV0QxuPjQo+dLMd6lh9VLHZiGeOXOaje76LY/1W4gDI1Sgg9uvLI
	Ep0uqTWwXgXyu/aFMQWQDeXgLg02W29VK66FNy9Oc5lhg4T9tgQvPHXmEuzs+0FJkA4JdlPPl4K
	zhHcLl+N0mbwjQB2eFnrzuNldbZ4eb9A7SXPN5/xStFe+8up1rLD99ffscVXjE+U2Vg0pHWz1Ry
	6wfFkYwugR3yAxJQbtAsKOsA+hi5S3XbsUCVzT1hah
X-Received: by 2002:a17:90b:5107:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b1b0cdafd9mr3966945a91.32.1794673604170;
        Sat, 14 Nov 2026 08:26:44 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:43 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 0/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected()
Date: Sat, 14 Nov 2026 16:26:30 +0000
Message-ID: <20261114162632.16346-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes a u->scm_stat.nr_fds accounting leak in
unix_dgram_disconnected() when purging queued skbs from
sk->sk_receive_queue on disconnect, along with a selftest:

- Patch 1 splices sk->sk_receive_queue onto a local list in
  unix_dgram_disconnected() and calls scm_stat_del() before freeing each
  purged skb.
- Patch 2 adds dgram_disconnect_fdinfo to scm_rights.c verifying scm_fds
  in /proc/self/fdinfo/<fd> across connect(AF_UNSPEC) and dead-peer
  send() disconnects.

Changes in v3:
- Drop unnecessary count_sockets() and sleep(1) calls in
  TEST(dgram_disconnect_fdinfo).
- Link to v2: https://lore.kernel.org/all/20261111225148.88506-1-sidchintamaneni@gmail.com/

Changes in v2:
- Drop MSG_OOB patches and tests per Kuniyuki Iwashima.
- Splice sk->sk_receive_queue onto a local list under the queue lock
  before freeing skbs so concurrent senders cannot extend the drain loop.
- Make dgram_disconnect_fdinfo a standalone TEST() instead of running
  no-op fixture variants, and also test dead-peer send() disconnect.
- Link to v1: https://lore.kernel.org/all/20261106051905.218638-1-sidchintamaneni@gmail.com/

Siddharth Chintamaneni (2):
  af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
  selftest: af_unix: Test scm_fds on dgram disconnect.

 net/unix/af_unix.c                            | 59 +++++++++------
 .../selftests/net/af_unix/scm_rights.c        | 75 +++++++++++++++++++
 2 files changed, 110 insertions(+), 24 deletions(-)

-- 
2.43.0

