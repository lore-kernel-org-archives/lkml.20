Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B20B5172CD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738858; cv=none; b=A+Ap6f1GtnD0ausFNrQl15Ijz4DWDPww2U0iN8zhepqorDOTe8NpUrGOQT74ilZFLtx6FGlTWJl3dfpIYNI0eZkq54hLY+Qr6mKAJ3pZiIRVVJzzsvpOpGckS0kJTBgxtzCtagL+bdh06lc211WcX5A/g5P0gRryjh6SZvfs2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738858; c=relaxed/simple;
	bh=qhyuo27wL8dOZ4t7i/6sns1OCJ7PshGao21UmCh/3iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7XYU4IwBNzGusXJlhJvJc47/xNHw7n4UmcpIjyvBTxA/U35McsZzcfsfE7uyXtTHjFXJR8ctJfnNx2rwHvzF4YH8G2BI/uiT5c4xMmgw2zQTCMa7eQqhFTAG54Dr+7spWYdMlbRfeNqawJf1XCgOkhWNbdfNIXgXKlGHIXRfr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3VQqOnq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3VQqOnq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so398772f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738852; x=1790343652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7hk4kSUlQH1wBSNdgK7hn061of3Ek8pFYZgMv0vOlo=;
        b=n3VQqOnqX+Aje+gLo3NPBgQcGs1lOzw+0JBQug3/tV4zoXV5Z48cvgOAKFelh+Apw/
         GjtHg/s+zbXYilCh70oh3sNYMiMDb13RgtRMGr4O2LYupEd4LBI6gsLlsKMFosnHxwNF
         UoPpl5XiNixwJJMgbHDpffPPf8KurIeq+MZfe8bOccfDo6EjCU4Kq2rZTzWc++H/JFEo
         Nm4hIQL9LLi9Qqf+idWA/DvT6lqQFTBG3lFaUsm7Fm583cYkzV5HvQColeZgoSWYQp3i
         QCDe/SiGQ5425OdLuxVbcwAa99uC6d4FshAShUkW2cth83tHU82IieIDwahaLThDhVjx
         Rixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738852; x=1790343652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7hk4kSUlQH1wBSNdgK7hn061of3Ek8pFYZgMv0vOlo=;
        b=m563u5FODj0Ahs92QDwtl7tO0gcSLIkXa8aSHL6fPU5SIYSUCCNcnTaZg+LcS+npVL
         wf52/WP9ykVI44k4iYSc9PXvCNlPrI8jiv57ri4OAq/eNo/FvzfgZqEeyvufYTpWKuoG
         ZJGRO4bpi2hVZxmOWRaCheIHVJm3Ii4TtHc+4lp0crDQYPCu0DnPs7ctdpw9uX/6+ycO
         +9DmBkH68dibb54WX0kadJbTt7PEw15iPPnTpkm438n3hsYzQdp6++2P2TtGKWq4rxnI
         ctJ7m2KTMb8qAiy+nRIRRJijpdFD2CinwqIeIs6VUDY3yyVztlVPSImnxaSOF8YieXwC
         ko0w==
X-Forwarded-Encrypted: i=1; AKwUvBxfoQKmzm2f8P2GT/yoKUSCCiDWMUb2rZjW9sNuCt5c0wCEOPjfyec+Pq4KXSR717lZg7yd8N1tFiFv61E=@vger.kernel.org
X-Gm-Message-State: AFuF++mylKgLNaKLr/69j/x9q+8Uj/6b8mQqmJVVXCXlrJPK7OvMBm1L
	QjtehNquYv/rqotSE/5sODss0G9x1sVeaHakgWy16n9rwLiXLakkvq1D
X-Gm-Gg: AYBFou0odB8H0dQLyGVohu/OwAD9pDkS7lXqCIB2kLmlCLKA5KcxlVbPY40qAu0chCk
	L9OK3WA6gX3sXSHCyuBlO82dpEzvOGVHuL6Qh6FNGaB1lduqP3QC6OwOEK+GNUozZvIrtv9F/BW
	ML2dJ/oRdmsnz+tpy5GNB9wf+4D/+axL4AW4BGr/tArfb+lwRKkcIh6dS8iMRjWlkDFGlI0RT2n
	QoUF9KO6qYEhU+JuP9R8zVnlSoI7sY5cco5oqs0xwCM0I4iNWU04P6SgLufikLVxFFx6HHrCgJU
	C815PyDmIudMTFKgXcOz1HG4ajXSvSg+Vp2JupUGwSH2jUqCdP01KbbP3NdlnQFSP21xS+uCYSz
	8P1T4vU3aE8efmO0cYPB67TKUzRtaedmNpLy3R1pkNr2bUX6b2BLq/Sg4BYg8noq6Ju7kgH5H5q
	PV5j8UhB67CZjuHTa7lOdPlffPU+Ri/KEmhtGcUy7wuy5eLUKKUnQr7vFjVqAZ/3EgNWeZ7wcIM
	fF3S3GHbjOaVH35/ZGTZWXQ25Ajx9h7HAO3edvnwUB4gPaG85a1N1VJS+njULeIkhL9dw4Px0sJ
	QfF+YPvqC5UspZATfkPJXa2Zj3FglkSOGDmu3H+flVIWNC/aAw==
X-Received: by 2002:a05:600c:474c:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49fc56c3c34mr35521715e9.8.1789738852113;
        Fri, 18 Sep 2026 06:40:52 -0700 (PDT)
Received: from localhost.localdomain (p54a14b85.dip0.t-ipconnect.de. [84.161.75.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd225898sm168149865e9.9.2026.09.18.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:51 -0700 (PDT)
From: Bernard Ladenthin <bernard.ladenthin@gmail.com>
To: netdev@vger.kernel.org
Cc: Bernard Ladenthin <bernard.ladenthin@gmail.com>,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	alexander.potapenko@gmail.com
Subject: [PATCH] net/sched: fix potential stack infoleak in em_text_dump()
Date: Fri, 18 Sep 2026 15:39:37 +0200
Message-ID: <20260918133953.12494-1-bernard.ladenthin@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

em_text_dump() allocates struct tcf_em_text on the stack without zeroing
it.  strscpy() writes the algorithm name and a NUL terminator into
conf.algo[], leaving the remaining bytes uninitialised.  nla_put_nohdr()
then copies the full struct to the netlink response.

KMSAN on Linux 7.2-rc6 reports two kernel-infoleak splats from this path,
one triggered via "tc filter show" and one via a raw RTM_GETTFILTER dump:

  BUG: KMSAN: kernel-infoleak in _copy_to_iter+0x1c9/0x2620
    nla_put_nohdr+0x83/0x130
    em_text_dump+0x291/0x550
  Local variable conf created at: em_text_dump+0x5d/0x550
  Bytes 168-179 of 199 are uninitialized

I am not certain whether this constitutes a real security problem in
practice: the test was conducted in a controlled KMSAN environment and
the leaked stack bytes may or may not carry sensitive data on actual
production kernels.  I am reporting it because KMSAN flagged it as a
kernel-infoleak and the fix is straightforward.  I can provide a
userspace reproducer on request.

The original code used strncpy() which zero-pads to the destination size.
Commit b04202d6065c ("net/sched: replace strncpy with strscpy") replaced
it with strscpy(), which does not pad, creating this condition.
Zero-initialising the struct closes it.

Fixes: b04202d6065c ("net/sched: replace strncpy with strscpy")
Link: https://lore.kernel.org/netdev/20250327143733.187438-1-richard120310@gmail.com/
Assisted-by: Claude:claude-sonnet-4-6 [KMSAN]
Signed-off-by: Bernard Ladenthin <bernard.ladenthin@gmail.com>
---
 net/sched/em_text.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/em_text.c b/net/sched/em_text.c
index 343f1aebeec2..4132f8c3c5fc 100644
--- a/net/sched/em_text.c
+++ b/net/sched/em_text.c
@@ -113,7 +113,7 @@ static void em_text_destroy(struct tcf_ematch *m)
 static int em_text_dump(struct sk_buff *skb, struct tcf_ematch *m)
 {
 	struct text_match *tm = EM_TEXT_PRIV(m);
-	struct tcf_em_text conf;
+	struct tcf_em_text conf = {};
 
 	strscpy(conf.algo, tm->config->ops->name);
 	conf.from_offset = tm->from_offset;
-- 
2.49.0.windows.1

