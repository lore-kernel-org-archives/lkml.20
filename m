Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7102265CC2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903102; cv=none; b=ctkQBJTowhorOQ4BxhbcFsMeV6ezmcV4mE0RuYMS4FlDQ96ZNst7Kv7pGLdT6BvzeJ92s4t96tah5KDtOyQpKyGUm16Fxo50OeSiUEZo4/0XQutCYi4zWgae2WVVuAeUNScTrD4lUlLwih3XVhkFTckOBZBf7R0aadYuz8il+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903102; c=relaxed/simple;
	bh=70E4JEwJRhITrayTFGxFr/Ka+e6/XGMShGQ5vKZGBZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwpgXMbo76vQ7VX2y/xt6XqSSWy/ZDtR8CDvTp7fZVotsIUkXpS1+YWjrXAc/TWjQ198+fQbx5ygNsIgKlrxnoNz8eMC8Y3mreA9KxkIT3m1WzPTHpIdgV7IYDjod7K+BFlsbxkUY8wbO7lKl/bBJM/anl/W/rk+MdiTl035m/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fv/gSVkw; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fv/gSVkw"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a6c8cdb7ffso337335a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903101; x=1791507901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGNX4KL8GRa1VIINdGkPoVIRrpUVCsPABrTMa/jeOp8=;
        b=Fv/gSVkwZLBzjHeKivXsZKpxWt+zzMFQ2md9GZKSnGlD49HEDu738K9QCRd+H2G2Q1
         lz/OV/Lq5EXTpJYM02vxisOfzEIHB0IUNoetE1h75dIuAZNRwN/uYvVkhs+1VN30+Ltg
         we2m7WNHUquY3N6LpHBZP2DSqmTxi246x2W+H+ZKoSlb2taTk0bXfCR3oRFt1gTur22x
         ueRmmbuCAFtwsBq4yNTO76Cw0bwMv7dgX6AEX18F7S339+W1FOvWaLy2DQC6OfCUTZQC
         +r/h+fLNoYz8t2UjRtRg2LdzfgtzdA2c3/E9nZ4/3uDN4THJTBu/9pM0hUxnOdRRbkQa
         XJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903101; x=1791507901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGNX4KL8GRa1VIINdGkPoVIRrpUVCsPABrTMa/jeOp8=;
        b=uSbU/VLxxfhkabblAYin4JoKBzy5wDEf/owpgwC+BIC9FkuelCJg75Hr1byt9IcGhm
         XBrCw++Qeh2YEu9IdC6x3hJXDOqMboavQQHeUJqxr2Z9hv6JD0fQ/43LMisVpd4n7Oen
         MO+0m0B9J1ZoOQqkYH+7DxbroD2LVG0jnbzQ1S0V0liLr/Eq0VLelT6UlPDNWj7YK01I
         tdAcaQFP1L4J59n1nhHmSGoRcw++DO+9FZIcsibwDIBWciKKYbxsQtVQNkBRG9ZflBsK
         fhtRnov/I2dcomOmRxKEghnu0Q91PtV7DAEPnf5izRyCzO0x4wrWcrBEhMeQrxVCqHO4
         TzqA==
X-Forwarded-Encrypted: i=1; AKwUvBxccrhLRSgnK0A+BTUMN9yJ8w4BGhY2ETGXhGXF6zO4bw/cbJvF96CZKtt6L/8I4cvvhntqITcNUHVQBLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI04lCPaI/BY2DLC5rSusFohDQpqhQsWGA2Dko+dLwa+5xncTDp
	ZoElYW7rAUMX3suUlygWti/Qbx6LFEW4fGr/dgmdhVM1M0673F39SSVL
X-Gm-Gg: AYBFou2sCUokJCDSAznxrS+aReomxIyYgRE2fEQDnMarrIjYmYKWyx+sTyz4pl/AIL3
	oMb2atAQzRcg+nerpCYbUc0s4Fp1/M2UIbIRqZ+CbDb0C4i62AwboTnXjLUGIAt5DH9QOahtoLI
	etOLpM1DEOs6aIspers/BhXxwWIBGh08aVXp1hXIZHP7CvUmKbMXw6PLXi/Rj0xT3/Czz2iGIcZ
	51YORxrKCijxaTWP5agrXdtuM9VfSvLcNzneaLrY9ESZorz2dg07BY3Qkegk2tUuSSsfrLxw7Yr
	8sAcTJHuRk2Z0dXmxhDlhIxifT65HyNpr72IwnVeiQfuQXqNir5Yq2lrBPeWpCr/MHyqa4YW6YT
	Cph9TjxfQe4Iu7q+t5LGqSomP6Pc+PLioGwQtmptKLCG6GADu66I8zGX9Xe913Evv8In2Xli8rj
	+jJ2h1QJ7G/Xl4RAgg5WrzcsltXWWpSZwrM2Fw/Xw7A1tjV4r4l5R1YFHwuPWGkAuBYflzxH+lZ
	1/XOSQAffg=
X-Received: by 2002:a17:90b:1e53:b0:3a0:a055:1741 with SMTP id 98e67ed59e1d1-3a6ceaff95dmr666070a91.27.1790903100692;
        Thu, 01 Oct 2026 18:05:00 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd44c23esm1587388a91.4.2026.10.01.18.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:05:00 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: marcelo.leitner@gmail.com,
	lucien.xin@gmail.com
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	nhorman@tuxdriver.com,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net] sctp: revalidate output stream after association connect wait
Date: Fri,  2 Oct 2026 10:04:49 +0900
Message-ID: <20261002010449.3689454-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When message interleaving is enabled, the first send waits for association
establishment before building its data chunks.  The wait drops the socket
lock, and handshake processing can reduce the output stream count to the
peer-advertised inbound stream count.  sctp_stream_init() then frees the
extension of every removed stream.

The sender currently resumes with the stream that it checked before the
wait.  If the peer removed that stream, sctp_outq_tail() later dereferences
its NULL extension.  Fatal-oops policies then panic the host.

KASAN: null-ptr-deref in range [0x38-0x3f]
RIP: sctp_outq_tail+0x49e/0xaa0
Call Trace:
 sctp_primitive_SEND
 sctp_sendmsg_to_asoc
 sctp_sendmsg

Revalidate the output stream after the association connect wait.  Return
EINVAL if it falls outside the negotiated range.  This matches the pre-wait
check.

Fixes: 668c9beb9020 ("sctp: implement assign_number for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/sctp/socket.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 4652fd90d9a6c..394d31cb698e0 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -1848,6 +1848,11 @@ static int sctp_sendmsg_to_asoc(struct sctp_association *asoc,
 				err = -ESRCH;
 				goto err;
 			}
+			if (unlikely(sinfo->sinfo_stream >=
+				     asoc->stream.outcnt)) {
+				err = -EINVAL;
+				goto err;
+			}
 		} else {
 			wait_connect = true;
 		}
