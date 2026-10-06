Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE3623393E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263789; cv=none; b=ejum9bFHiRG0vnaK4/U+5TXw5wuqBzXh6hbB1x4Wx7onBtz+KR3hnsnPzKjE6X9vB2W6nzuwp3qj7QumvJeE7aH2WuqFiXInBIsGnyYmoqW8Of6lVnUNLByd0i9vIZGM7KnPJqWtvDMxVtKfaM4SdRnIK6fYmOVMmwrFplI+I8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263789; c=relaxed/simple;
	bh=r7yDJGNf3vg9Dsuvo+2fXtkz1amrdnaQFLDyMDdoBeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=by84/Y4wSF5ThRbBAFs18ceCl/VsKgeHWd84QBfaYy9h8XsdRS6pisGcyqB1coEV6whCoh9AD42A8/aR3KAONlrLtWLHrOd8wab/GIkbyxMbUY3rcDG3y+bOLJd3mcmnS4AIvu5OKEC6hD68btQst2CUzReezADJ1K3cnsX2i+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=UoKaKUJL; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="UoKaKUJL"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-82621039b6bso1225387a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791263787; x=1791868587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcZAWj+F2P6v02eYEvSJlSeTa5ggyC9iZf9e6Z6vbRQ=;
        b=UoKaKUJLMoZduV6Ofexj/lX7Cze0j9UyMMCDm92Rjhm6jL2zJq4J/va7aLHeu24YAN
         MzpRtOGD+8c3TNniiYc2Hyf42JiaXDuVZtheoZo7AkIu7Nrt2NuAoFTCFc0z8Xcl0p6q
         Lp0ml28EpUnyx46Lc1ma4Liy1Dt1SKi+lEgWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791263787; x=1791868587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcZAWj+F2P6v02eYEvSJlSeTa5ggyC9iZf9e6Z6vbRQ=;
        b=DDJMKwJm7Iokxq9a2c2V/gzg9HRRONrsIgSwiB3TURzJ2GAJjxoOwKx52meaegwGTT
         DeQW44LrYI5dvhcZf+uLoHzC6JXCc2XtYX80TgMrOBHBMbAFm97iGwwFsMcZaMl5bJBr
         hFpqRifSesuwkVe5dVpbOQNMqg2U80i7TALjHiL28EtbcwvEYfJYWTCu5cCsDRCmw5Q0
         xKBEYlrOUYd0y62Hpobe5qSnkQcwJWbTZ0sk2rprUMr7poP/c9Y+bbh8S1jQ1TMjha0P
         sthBHXRpJPt3qAMAd12y1Ev/75DSh2n0md+e5BkW5xy46bGT4UuLD0eRZ30M8s3HFY4p
         5y8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkwiNyajvWt26p8iiD3LTR2XQGK4uZ8zNl/1sI48bUaj93nUWWfLk/dNlCL3y5qh9IVFr35hI9EUO464E=@vger.kernel.org
X-Gm-Message-State: AFuF++nvIvIbO6jrO9x18ACNjR471LYOijn43BjQTzrpUosR3dVAsMhl
	W4MuD0uMWX/Tk0zy1MyW0sydSeloRwAn0WYhoVKqfwc9HZFyA0KlfuC6fjP7BDt19sI=
X-Gm-Gg: AYBFou18Fz4jbT6rt8vewmnQO5zUtrIVVoJlpsZXpcYO4bk2dMNZr5hOer/dUJGTBdT
	ZeeZ4PH8LRwP408gwv+FU27UjPQNlZ4IdhuZg8z4HexBS6vgTEkoRUbtUv8RSWRNvcHv5Xb2QaF
	Y9ejo+ONKzk0BsV92o4Q7f8/e7cEx+XtN/RPoKr14uBLGaxyv0P6y+Jp4bT1RpiT+ApFteRLiKd
	/bc7n60jRZQbVS8Rmq9yHPVjhQX6nlR21ja9Ih/2/3vrE7I/cRoHGTe4ILNAwuxlEt0Efc3kfRv
	0N38MjLQtV30So1ODOs3D3wG83gKHZyib0oKtYHUhFHVzb5DhnK42XexJUE/N7eDAltxAG5B7Qt
	RHVuvHM0wZsBZRuLoyzSfzvge4bj+uWxXv6eA6YU7pRpa3Q6uIJplZPlGsYI48XQAlw9zv2eRaK
	DHW5SoCqGC9sWPAtZKPt+votdm0W4c3GbE8toJkybytFHRaRg4+xdzlwoxjIQqfQfLYzkvLj6XQ
	gTunFeYX+0OBtRKWL8yj4kxdhPkqx4V5a7S//qGqCfzzkgSm8z6OkfmyF+qpx1MyIW4aUTYIFUs
	LGo=
X-Received: by 2002:a05:6830:2b0a:b0:805:9b28:87d7 with SMTP id 46e09a7af769-828a167af3amr262818a34.8.1791263787188;
        Mon, 05 Oct 2026 22:16:27 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281fcce238sm1622898a34.6.2026.10.05.22.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 22:16:26 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 0/2] tcp: preserve RACK tracking across partial undo
Date: Mon,  5 Oct 2026 22:15:25 -0700
Message-ID: <cover.1791248202.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Partial undo can clear the TCPCB_LOST flag on segments already removed
from RACK's list, which prevents subsequent RACK loss detection, leading
to segments only being retransmitted after the RTO. Restoring them to
the RACK list as part of partial undo makes sure we can properly
reconsider them for fast retransmission in the future.

To do this, we first sort (by transmission time) the segments whose
TCPCB_LOST flag is being cleared and then linearly insert those back
into the RACK list, which is sorted by transmission time.

My investigation started from seeing repeated TCP stalls in prod and the
mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
96 KiB. It also seems like others have seen similar symptoms before [1].

[1]
https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/

Changes in v2:
- Added production symptoms
- Removed the redundant TCPCB_LOST comparison
- Fixed lint/long lines

Patch 2 is unchanged.

v1:
https://lore.kernel.org/netdev/20260926002520.42955-4-nramaswamy@openai.com/

Neil Ramaswamy (2):
  tcp: restore RACK list membership when undoing loss
  selftests: net: packetdrill: test RACK after partial undo

 net/ipv4/tcp_input.c                          | 35 ++++++++++++
 ...tcp_partial_undo-restores-to-rack-list.pkt | 54 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt


base-commit: 11536ee3d3e0b1bd35b6f3f8df55a6053eb0c71d
-- 
2.55.0

