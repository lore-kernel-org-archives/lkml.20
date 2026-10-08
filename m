Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96105547075
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791436073; cv=none; b=PjY38SEIabNtOHFrnD/KdrDOJeDsk15zQb+yplReDpQ9ZsHjSnFS0cRQcSvqvFPH34fzmhW02SmJ2fxe4kLTWvv+tvwLaVu74pqu3kzarHUioqxqbvVe3pkGy3lAJMAxntEFqZPMKLv6FrFBCEWNS3BH39ybA/YD2VFnY6ybfDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791436073; c=relaxed/simple;
	bh=9/N2e9/MNH9Xfdq0a33d7UYMPJIEu7OufUPNTx5SHoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d8Ysw7c1MYBrefrjVZG/rUrwrK772+7EgeS4Leqbrxl2q7d3jVCeQz76AxQEEoUI25kn7J+ff0MmVY0HokK3nA3RcblVVhGGFmung+psN7VEfkBtaqp9AySlbmUfoYHTX69jsaD1M7gcvnKO2tNydv0pmheQm9GtykoZa6fLeJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMolIhr4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMolIhr4"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5378b281aso15196245ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791436072; x=1792040872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUva+MYne+FCUQfWg4Yu/6cO+ExcFD5nfGYNE4CV13A=;
        b=OMolIhr4vY0l/KcsAcM6t+9/mQk2MZFzq/UOigOTQXNHPqQxnJhGZ+mCMqmfGGxo2Z
         Dwf48O+g4U5rJQh6fGUpWUhJ0jKAExwpMkzrZoRhZnseKF+IRtYpwmR2AdjbOER6f+fD
         9hNY9jTjtqInUgAt6egr8FJFH9A5PK74xegqC7R4N5JKl1jbacAIqm4r/LXbLObySD8v
         IogomoryK+ZoxMXQo9pVHKa2yX3fzxepuQzbciGfU5giefls8Cl04XqtsW2h54N8RrzB
         Um2RYAV/ZwfMxqoGxyybJmMHWKXu1xscZHYPUi60J9CXWgJ4r1DQ75dOUSkRP+qPw9r4
         D/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791436072; x=1792040872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUva+MYne+FCUQfWg4Yu/6cO+ExcFD5nfGYNE4CV13A=;
        b=OaJgNPyAHSdrZNI3MjcTydeJ+NIfa/nzp/tOVEgKYfipx08qUGMuGpU8siGqJCWnzm
         JZ4LTASgZXSvPW/DDDBujvoUbSqgNX9wNl/kAqd0nLcBaHLShkKFYSzZO+554adUaOfS
         UmRgw5INk308xsPhCuSiqR7tb+cmxcZ6jnSnag2x4pi4XpzDAgMXILVYHuhGuxCHbkqt
         7kkB101kgsqyUsU4dJEpqwNj9vo5DkMPugLdof5z2w0RJEQpptEzIO5kV8ykjQzpDhhz
         j2RxmSoRiFQ1Yhhd/iHYfgb4qa46agAeTAdCCo47vPCK7+lDKzhQ/ySPfZgrDs/gIOQI
         Pj1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNiReGyRLBBeRf1gD4n2VvhwbXzfxx8xCR0OLTnzKAiyTLbHSHgxa5XCt1Y74vvUowLfD2m0bo6/2dfcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAhLXH+rqHTwZcYjbtfkO5oaFKr/ZdnJp4njM+qjFRR8bpjchk
	DKUMD0OjZabyR7Hg/Blfrhq+V5yYqQHIOfEzsGJPvNzzby4hA1lJGJqZ4e66gw==
X-Gm-Gg: AYBFou25fOaG4m0+v8ziUoYy1RPsQ687uxGhp9JswjCYUBY6OmVPOWqxPMx0aO1PdJM
	HeFSbuIFnY3Aya+xIoQv79hRoe73Lgr23rELOCHESG8M4OJzc2wRnsQAygbwcC7Bbzcy1Bw9ewi
	t0by4elaKWNibRd9CXNnfzOUKPf92jiNiJLS8pzwB1PZAhfUdg7m5oRdVopf6t7p8zHYtHRbqNk
	x7CzIFMRPp/cG8heeelsqAD/fvXHzQR4GF1iW3fdiodXlHDD7hMUSrVU8Q+NImOeYnmMT6G/swI
	ppbaH9Djx7JKUtaR5RrJvEyZzB8uBjGu/OId7mFuTR/gOVl7VC+ogE5deyVABE7s0IQbvAVLZn/
	wd8MryyvtZjb5YKqUkBfwK0ERoQxk36eLklPPa5Jd2/svgOi+aAbEOaL2fKRk4ygUHJkOFAiFYc
	sqRflqYpndEIl0vIs0l5uNvrFus7O+P9Lc7VeTWYZtlzfytkYpNr5Rnos6SvOGBtHmsnzHkiaaO
	zi6FA==
X-Received: by 2002:a17:902:ecc6:b0:2e2:ffcb:87a8 with SMTP id d9443c01a7336-2e6003941c5mr40854035ad.10.1791436071908;
        Wed, 07 Oct 2026 22:07:51 -0700 (PDT)
Received: from dungbv.. ([116.98.134.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a5804fsm19541565ad.77.2026.10.07.22.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:07:51 -0700 (PDT)
From: Bui Viet Dung <dungvn2345@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Willem de Bruijn <willemb@google.com>,
	lollipopkit <a@lolli.tech>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bui Viet Dung <dungvn2345@gmail.com>
Subject: [PATCH] io_uring/cmd_net: prevent infinite retry loop on unextractable timestamp skb
Date: Thu,  8 Oct 2026 12:07:45 +0700
Message-ID: <20261008050745.498415-1-dungvn2345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In io_uring_cmd_timestamp(), the skb processing loop terminates whenever
io_process_timestamp_skb() returns a non-zero value. If the failure is
due to a full CQ ring (-ENOBUFS), the loop stops and returns -ENOBUFS,
ending the multishot command so userspace can drain the CQ.

However, if io_process_timestamp_skb() fails because
skb_get_tx_timestamp() returns a negative error (such as -ENOENT when a
timestamp cannot be extracted due to changed socket options or absent
hardware timestamp data), ret is not -ENOBUFS. The unhandled skb is
then spliced back onto the head of sk->sk_error_queue and the function
returns -EAGAIN.

Because -EAGAIN leaves the multishot apoll armed on EPOLLERR, and the
unextractable skb remains in sk_error_queue asserting EPOLLERR,
io_uring_cmd_timestamp() is immediately re-invoked on the same skb.
This results in an infinite busy-loop consuming 100% CPU and completely
blocking progress on any subsequent valid timestamp packets queued behind
it.

Only break out of the processing loop when CQ space is exhausted
(ret == -ENOBUFS). For skbs where timestamp extraction fails, dequeue and
consume the invalid skb matching the behavior of sock_recv_errqueue(),
allowing the queue to make forward progress.

The issue was discovered via manual code audit of io_uring/cmd_net.c
and review of the error handling paths in TX_TIMESTAMP command.

Fixes: 9e4ed359b8ef ("io_uring/netcmd: add tx timestamping cmd support")
Cc: stable@vger.kernel.org
Signed-off-by: Bui Viet Dung <dungvn2345@gmail.com>
---
 io_uring/cmd_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/cmd_net.c b/io_uring/cmd_net.c
index 90d4ec7cc761..a5a1b8b66b1f 100644
--- a/io_uring/cmd_net.c
+++ b/io_uring/cmd_net.c
@@ -138,7 +138,7 @@ static int io_uring_cmd_timestamp(struct socket *sock,
 		if (!skb)
 			break;
 		ret = io_process_timestamp_skb(cmd, sk, skb, issue_flags);
-		if (ret)
+		if (ret == -ENOBUFS)
 			break;
 		__skb_dequeue(&list);
 		consume_skb(skb);
-- 
2.43.0

