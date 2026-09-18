Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918EF35838F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743524; cv=none; b=Ao3G7HRaWWfuGS5uaHGs92O9wf0mK7KF90XWECn1ASgoTorwFGMy6jmB2lCbMZ37SPacbs13cyQwfxgf5U2AHGaBrA9xmZBy/2LZ/VRUAf9Jt50X8erCghT+HGuAgWoAcqgG4e31PQ5lN/uokLT7XFt7TpuYDhc8Up68NV0WPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743524; c=relaxed/simple;
	bh=zoNTVsFn2L8ZQUpNzfD8JMrdLAz6HTNoSDK6XN9I9T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tf9Ci9ii36nmtY07XYYe8Wgo7nkVu9WR/v+W5cqub9sdXdpVT0mL1QLA3UKO2hrSAXCAFJGuFxRh9b4uTEOkCirVtxp+uRaMyZR4FAZWBbD5fbxfNFyrX7f2e5zEE9L92phl+QyXgomutkLW5i2xkRwQRSp+f0SPg3WkdApPzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=seKNOR9/; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seKNOR9/"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso484056a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743522; x=1790348322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGf6+GV3IIEO6NYP1DELXeYxIupStmMlcHdqZNWtH0E=;
        b=seKNOR9/8koI9tnFQ+ChF4kzmXWLW/oMqCfWRNRvrhNMXMKs5caedlQKhbwKh/8NvT
         NALCpmoTabo2+S9Yr0z7Kp/tpU27nAfy1y/dpxvi/cB4OAfxNpENWXht5S9Wo7mMRgeW
         uDM2oXvfUNZj2GmMmSfreSp/fgrJhuHEBVXtd0rjQQLn168N1QqxdwdSUn7M7FXGv5rj
         AIplP5pblejPuTRq23D6rlxU6wRtA8dSfMs1Dt8OUwPIVPF+WkXVjB5nFHNDNrjSwgYa
         xJHEBk5mAO28is4YBNy83EYUnvm3wzyZhodH3fOZOoBpOKKN4l9SpUdIvvxLo7MRlSYI
         a6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743522; x=1790348322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGf6+GV3IIEO6NYP1DELXeYxIupStmMlcHdqZNWtH0E=;
        b=Bwb2IMTqWB+6HcmANX56d3pQcK6Sl2k/7BqflKarOs43VgCt49IupQN5r/FB2n59HR
         Fsa/zg7jLV2CRiXhhxbNy8EBc9BJmqSeDFjPzkSMqV3KiBIWnXcN6iKCNjRaerBckKq8
         wsbagoOxkAJZ/VV3iZsXp0YOGoOLiFUyUhgkw/BcA71HCzKqVH3LHpe1XSoNCNTcXOHZ
         zNLMpj+YikQ2+DZ00Xs+BOJwZTo+rQe1bQeILHFaVE+GHiWb3ldSFN4+vvIgzY+OY3xi
         UHvSJSTmNdZiiq3urnUQKcVymBQar9NR8Oedfl1g/w/t9usMvjlQxh2Tqokt2xrN3MMU
         P/GA==
X-Forwarded-Encrypted: i=1; AKwUvBykgUV6xsTYmRjKtmhsge8V9aekjxOjMKlKfZLLnLbvwpUWTHQy4w6YUaQuuZXNqnwCmiz8EjBZ5XS/aLo=@vger.kernel.org
X-Gm-Message-State: AFuF++mc1+yqBWIxHQsklasAjOcNPO1hZuhCBCUH9m41L+ETfdBh+Nau
	P+MFWhsTzMNYmJ9oPVfUOjWHAaYJZ0Sl/5F8tGGSImCxxWFZxxgIsOSZ
X-Gm-Gg: AYBFou0KGmCMJVijJCThQEIXlZR/pseDnHOgNJRgI7NNVgk2yKBmurKCCQS55h9VN4n
	66g4zG6r0Z0OCbxmCq330gwr4R2jiIyXEqkCvjrhKk1j9DyQBDX/gBwya4RHgz91SgZC+6OCLYa
	NFimJmJoQTQqqgE3AvZ2kLdlY431RbZpZQ69fybgfLbvseE6tlvynuU6y3Ig1uHTEZRNg0vJ5Ks
	ogvmDl+dU7fX2ewqDUqcIRjVomkaDRyhNfU/TCbVWlW5KDcFEDiv9V9nBvQuNondb5lCTUk8gJh
	AZNG7Q4nPfUJNkJ0WYfHRHsqYb2At3wBp9Z2TkC35z0fTp71v4zWtViUuW3aO35LDWlKvCGqgUR
	WZkAGJ9xwZQVdEtsT+dY+pwrb+8oj4CettxMO4zdr2hyExgMXzox3Uq78fXiZvjU6Mt7e52pBoa
	sh3ftvgtFAB0l9cyyUMo1b0Uzi2Dfxf0wqTX9SvLXiOHvc0bWhCz+SqhepVR47eJX55EQHVs6jB
	odklO+89+xLvw9Trf+69iLvFwpGISoU
X-Received: by 2002:a17:90b:3ccb:b0:39e:4c7e:f03e with SMTP id 98e67ed59e1d1-39e54f2158bmr6529020a91.27.1789743521728;
        Fri, 18 Sep 2026 07:58:41 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50c9fasm3954108a91.8.2026.09.18.07.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:58:41 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org,
	co+c09f7e87f6209a56@bugs.sh
Subject: [PATCH net] rxrpc: rxgk: Initialize challenge control message
Date: Fri, 18 Sep 2026 22:57:07 +0800
Message-ID: <20260918145705.1511737-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rxgk_challenge_to_recvmsg() copies the complete rxgk_challenge structure
into an RXRPC_CHALLENGED control message.  The pad member of the embedded
rxrpc_challenge is not assigned, so the copy can disclose one byte of
kernel stack memory to userspace.

Initialize the whole structure before filling its meaningful fields so
that the reserved byte is always zero.

Cc: stable@vger.kernel.org
Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Reported-by: <co+c09f7e87f6209a56@bugs.sh>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 net/rxrpc/rxgk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
index 77a67ace1d248..799772b0d8472 100644
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -756,7 +756,7 @@ static int rxgk_challenge_to_recvmsg(struct rxrpc_connection *conn,
 				     struct sk_buff *challenge,
 				     struct msghdr *msg)
 {
-	struct rxgk_challenge chall;
+	struct rxgk_challenge chall = {};
 
 	chall.base.service_id		= conn->service_id;
 	chall.base.security_index	= conn->security_ix;
-- 
2.55.0

