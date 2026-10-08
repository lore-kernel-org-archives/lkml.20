Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B267483BE5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453196; cv=none; b=swdqI052YheBX1qQeDhoS9Su7hwSObh7JyQ7fz7ORmDYGK+QanPSjwr7ZdWp+6OoqyWwSpOBjrHr89J0C7QBG6UsJHuBkimxKuZ9u2FmCNKoqurChGTBR2/4GNeH8x0D2TYfxymjKIFw5rfLTAwGqN3hWXg5O7ymmTi6Mxsy5LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453196; c=relaxed/simple;
	bh=wUjYNkz1DPayKi6xom1xAiMmjrkORcjqSBD+DP9E8q0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N4Pv7B4bZEWBPlvB85okW5dShAbqC1RIEw2D8UNHB51Omr9Q5DS8OmSr6gyJgGiq2WM2Vh3/d72gILetJFgHFbghklrQ5MA3/TXecvaoajz36QzbZHD1yTPqeIRpvvFNT9P1U1INCTcoB1yZ50tOyrRPkwqzaBqQrFhFlkFWxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3kyBGjn; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3kyBGjn"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35115b52125so3624306eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453194; x=1792057994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YmqIKYdaFgNycQM+T7TwOEsRpUEkjHzmaTjKIGKx+A=;
        b=C3kyBGjnXzC9pWH5rqjTbgtG31Ap/N90idKbaUgkxF4ebWRBhzBL862z62Xl+bHols
         e+69EbIN7kMB4WIWVHhnX3ZZkD7L7blwk5OcE4IcD2ilQm2Zy3bsuBDW4mmg1ZbankVz
         DEfAOlTcFFp6l9BQH+KiB+g0gcUGJiH6FYd21V/4rJE0o+PTU+vso9Xp2yBAmB8pScBY
         gnWVhSM9r91yEVQmeOxngMGOuwheH/S+f9Kjk4nUyeXi6LXi8/oumIaLbx11UZC+/OEZ
         dy4w5MhaOm45NnN8oeImjlqGONED+lFps9yfGNW073qFLXK0ByFk7ww7hsXspfWxkfTr
         zZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453194; x=1792057994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YmqIKYdaFgNycQM+T7TwOEsRpUEkjHzmaTjKIGKx+A=;
        b=BnN2dJJ+06/ktg0fz2NfHP3UbqjipVTacVRs3qGdGakCSbL8mvrfm5d9aWTs1ARGbU
         rmY6W6yRcD5V8efCTRo5wcveEuLwrEA7BUN21RVu1uKvYmPRtUGIGbbeIzMQ8Bc4iNd2
         LV8NJU1mD7zsLFJdhT8/COKaGaxRhhlm0eoIdJkdAtCTiKUJiVixHN6YQbr3wdaa7Tl2
         lcMJf0bt29XJpDPplbBuGAjAqt6L0EzoeWAB9Tzr5/Fvb1jS2VfKfdCxShNYDXrtYWGT
         0GHUmu19K5UXUfWms2JELIq8pHQQAoY1ValA298OooNOZnpymvBuKvWEVpdmSHzhVsO1
         xm6w==
X-Forwarded-Encrypted: i=1; AKwUvBxdxJa4e1g2lzZIWRGb4lDKXSlae05vcHrbh3RgVfdGCTilWc2gOwIUqp/yP/EQ4PbI/Pr7g/m2VgJmUS8=@vger.kernel.org
X-Gm-Message-State: AFuF++mylQodVIQpvMp2w3sqkdggeZx/4GMW5dzJG7C6/mC1EOxenRTN
	HF7K5C20Ah9DdeQiA3laAtl+HVDi6k0V4mT+ByL3eN6GNYF3PRVW6KCM
X-Gm-Gg: AYBFou2gA6THuAhLrC8RnLjAAw+oY3Wv9fV6p1zd+a0OPUXWDKoLxK6fyRhFbU/zz4l
	axk9Jhs4FMuQvUK5pG+FOGI9ODtPmdYgHnRtw9ShrzkrnSiNRuSQ1NeEL5z1yGC/Be39T1nAemG
	BFaEQbxzOvLtXF2cOugCQxX9YVy6semi+mwWm9qaoODv0JKbEcgkQPbAHbO3PwxvlVO4X3zz7Ii
	bPcK7niwXe2I1mymtGnKhStSjEiCkJcMz38Zhi/PGVCR8MVUknC6hnaUwIoM17csWKw54SV/sNs
	w1Xy5V+0XQSVnMAd1JDZR75A9jmLHiwHWiELCt5Nht5trC9/lER4U7puucKZ9YeDz2bkV+c0mNE
	8hUE535joRQhFdN3vjmRPyvFMtWo2I/9+kTd5HLBnUZG4T9xAZzn8zytNQxiTGzuOfP04kLmOAw
	EHnOba2rO6gUmQ4zm5sDyMtsQWpuxVLrnxv+CdcaCXNrTgCB6vLUfBKBABaYWXcHuAy5fm+zMy3
	iL17lfI
X-Received: by 2002:a05:7300:d194:b0:33b:a766:ea6a with SMTP id 5a478bee46e88-3515dee3e47mr5439589eec.32.1791453194219;
        Thu, 08 Oct 2026 02:53:14 -0700 (PDT)
Received: from ramesh.. ([124.123.89.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afab2c5sm14137064eec.21.2026.10.08.02.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:53:13 -0700 (PDT)
From: T S Rameshkumar <rameshsv06@gmail.com>
X-Google-Original-From: T S Rameshkumar <rameshkumar.t@phytecembedded.in>
To: Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>
Cc: netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petar Sakic <petar.sakic@ink.fish>,
	T S Rameshkumar <rameshkumar.t@phytecembedded.in>
Subject: [PATCH] mptcp: push queued data on passive TFO subflows becoming established
Date: Thu,  8 Oct 2026 15:22:31 +0530
Message-Id: <20261008095231.103186-1-rameshkumar.t@phytecembedded.in>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With TCP Fast Open on an MPTCP listener, if the server application
writes data while the passive subflow is still in SYN_RECV (after
consuming the client's SYN data but before the MP_CAPABLE third ACK
arrives), __mptcp_subflow_active() refuses transmission and the data
is queued into the msk write queue.

When the MPC third ACK arrives, check_fully_established() marks the
subflow established, but because the third ACK carries no DSS data,
the queued bytes remain stranded until the peer sends more data.

Fix this by:
1. Invoking __mptcp_check_push() in check_fully_established() when
   subflow->is_mptfo is set.
2. Setting MPTCP_PUSH_PENDING and scheduling the MPTCP worker in
   subflow_state_change() so that once the underlying subflow transitions
   to TCP_ESTABLISHED, pending queued bytes are immediately flushed.

Reported-by: Petar Sakic <petar.sakic@ink.fish>
Closes: https://lore.kernel.org/netdev/CAFPPu1gU2Y-D+d4i3F0MoNkYK+e1U+=X3qf6QycjfKBw+8snPg@mail.gmail.com/
Fixes: e00b63056fb4 ("fastopen: only mark MPTFO subflows with SYN data")
Signed-off-by: T S Rameshkumar <rameshkumar.t@phytecembedded.in>
---
 net/mptcp/options.c | 7 +++++++
 net/mptcp/subflow.c | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/net/mptcp/options.c b/net/mptcp/options.c
index ce0de02f5..d5238fa11 100644
--- a/net/mptcp/options.c
+++ b/net/mptcp/options.c
@@ -1042,6 +1042,13 @@ static bool check_fully_established(struct mptcp_sock *msk, struct sock *ssk,
 
 	mptcp_data_lock((struct sock *)msk);
 	__mptcp_subflow_fully_established(msk, subflow, mp_opt);
+	/* Passive TFO: the application may have written data while the
+	 * subflow was still in SYN_RECV; __mptcp_subflow_active() refused
+	 * it then and nothing else spools the msk write queue when the
+	 * MPC third ack (no DSS) arrives. Push it now.
+	 */
+	if (subflow->is_mptfo)
+		__mptcp_check_push((struct sock *)msk, ssk);
 	mptcp_data_unlock((struct sock *)msk);
 
 check_notify:
diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
index f0a6725d2..f499073a6 100644
--- a/net/mptcp/subflow.c
+++ b/net/mptcp/subflow.c
@@ -1894,6 +1894,11 @@ static void subflow_state_change(struct sock *sk)
 	if (subflow->resetting)
 		return;
 
+	if (subflow->is_mptfo) {
+		set_bit(MPTCP_PUSH_PENDING, &mptcp_sk(parent)->cb_flags);
+		mptcp_schedule_work(parent);
+	}
+
 	/* as recvmsg() does not acquire the subflow socket for ssk selection
 	 * a fin packet carrying a DSS can be unnoticed if we don't trigger
 	 * the data available machinery here.
-- 
2.34.1

