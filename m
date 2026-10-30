Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793403897;
	b=4nbpzyXUAXFSyDHKeoaOgI5c2hgjzMHH78EObb9tokTzZqS2RKTjjEEQwsx0BO2ZHzfo
	 0lm0zNGDUiq9IYiLBWZzBW6qUTvzQmcd3qNA6CQwxrTu0v0x4+kZ1ewtcty66jK61W4tp
	 +i4NNK5M9a/4sjmEgn2wKoEmGNyWmHa7OxG5tSR3dn1mIO9KGvQnqD6viwpfW/+15OslB
	 qjG3D9uqnpQBZ61uToK6oKfw2zx22KXRY5aDpWMe/bKmdXTS0sZSQHKr1K9EMOx3KxGex
	 vAUQxAIg9UwLdKYOQg4Ciq+j45FLUfnzbjlixg6XF56eDpxKxDqwTKHHaXvOOm6RMpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793403897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ENPGEJQjHDmi0YXc71Juxw0DF5443i7C7rtlAkvii2U=;
	b=jvN8+Cth4NOnLVLr6zBYyM4WbYIbj7UMf4pBIZD7zpQCl8bYGm8Z9wHH9uF6YydOhLHA
	 c5sltqDi58xUogCYc6DtFX2RFP+mmRzX43NLSOkcFQV90r4x2L6Z7l2GFcyId2BZPQyDP
	 5z78aeCc01EK6SXhygM7gBgSNEGePVVytvBR2CtXtSoxVRKs0Qo9eUSCVkXcoFt/fldSd
	 M9kqxvXyZbrTp2w8wXWQQw/OhG7xupY9mSKG078Gi+0yYW9ZSdTvwscgR9CuU7u1lk1rV
	 kcYFMPvoj1/bvj7fYmCinm/Yr05VzdUj30r5XHiGpwsg8v02YTqsgZjXI2mawMoR97A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	arc=none smtp.remote-ip=209.85.208.100
Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com [209.85.208.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648CE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Received: by mail-ed1-f100.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so1220945a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793403894; x=1794008694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENPGEJQjHDmi0YXc71Juxw0DF5443i7C7rtlAkvii2U=;
        b=ydriti7zC8uEtFrWzYDb1hmakiggIIPqyZubmQU3J5TGQfdMUBxqMCjS/7PGld049C
         PIJXQpd3EPFL36vZE6F2udfB1t05qSE+ovPBVmYlQrlHpSQ55Lsqa2MCmzqNPh/a80Ac
         BUiLE/kV6gr51kv4AuSQjItwP9IN+vcPj179bJjj0dKzPCU1B8GWZzM54JSsGvH/qm4l
         SodEgcZXYiC8TKZzUXknTkCF1YSVmFMZwymRrfo0CdcigMJnCjHY0Qdl20GhmviAsod1
         zr2WcqnCg9SM59uBUwjf/vujnxqU80D/Df9JZ3iYmi2S1rHJDtiKjxhgvKxkn7zkXpA7
         Fo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793403894; x=1794008694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENPGEJQjHDmi0YXc71Juxw0DF5443i7C7rtlAkvii2U=;
        b=SG3fl0Gx2ApznD7i0odQWwzw02ZgjD+4n68WclE+Jutx4IJDHJmtksFXPIDUypJ30n
         LNshOqNucjDj4M6J05rHmz/Phgl5turLr6EKCQameNAupS+bRuv8lh83Wm7K9zWrEhTP
         2v/UeULhGlxTeFhPTy1o5Kr2hejrInNkqCxGp3x8Ln9ntlO0Dd0uzmCq1Aq+A5qdkrRg
         EtuPrBmPrTe/8XgGuziAaMP2OKWLBdVt/27D7CyDuRRODrOk+GJT3YhVw8rDO+sKoeQT
         IubQL26a/SyKP6P2LI4Vdlcl81YaKPBXweVP25bWx74IkgYFvwBRYtwkR9ADPABjeG7u
         tPww==
X-Forwarded-Encrypted: i=1; AKwUvBzxqt7onhtyP+fAosMNMVKX+PI4obC/hVG1DbxjTU9YYvVV8rspAlQED9S78BBjSzrFbrnesk+6IojxmeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKolUGG7c8d3tEYjKxy1JN7yn7eqWyc3ktl339SaYrts6vQqtMj
	8Tt9GSR6mUMnjBFLwWTmAGJoPlt3W1S10F2wzmuI2tpg+dYBlMJ8z9FX57lnTn0+9mRafNTDDHq
	TXhY4Z1rRuFOoUQ29ifk51qwFj1HI7dioTDr5
X-Gm-Gg: AYBFou3efEpmW1qyFdppxmE0czBpIdTYgazMMp6WKoDnLk5gXen3lZxgHf5lOPM2XBI
	n1CWPFQKJfGTxeGXf8NwuOwF63bXJZ63qIdkMbgyoDVv3R44l9UU83GA4ajerABYohMfoinmdmz
	x/hxP+hFybmHx6fIod+qy6++TyLt7BPhS//gra9k8wPjdkBeU8xDe9k8qTTWvSwsF0HgAxzEAks
	+yJLIWAQ4RQhwtgWoeusVtsqY/7LxTtmdo1Ap0VtfOON9A0Yk1+dG0+Xk9akW1yxwnU6oDuNhqI
	qb/rD3ToHNnpqRmaeKQgcQ7Zb3U0CamDRUswms5gLsldo1ondFpoVbVDvvdpE4KlvfzWdZRtFJ0
	CtnsSueL15jZoO5RBkis4RVX/xNtM4VMaMkmRRPQ=
X-Received: by 2002:aa7:c70b:0:b0:6aa:f14f:5571 with SMTP id 4fb4d7f45d1cf-6b4d5ee0692mr2076001a12.45.1793403893737;
        Fri, 30 Oct 2026 16:44:53 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b4ec9f672esm196010a12.14.2026.10.30.16.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 16:44:53 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 403993404F8;
	Fri, 30 Oct 2026 16:44:22 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jon Curley <jcurley@everpuredata.com>,
	Eric Badger <ebadger@everpuredata.com>
Subject: [PATCH] NFSv4: Prevent indefinite waits for out-of-order OPEN stateids
Date: Fri, 30 Oct 2026 23:44:22 +0000
Message-ID: <20261030234422.2367263-1-tmenninger@everpuredata.com>
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

When processing an out-of-order OPEN stateid on an NFSv4.1 or later
mount, nfs_set_open_stateid_locked() waits for stateid updates to be
processed in order. A five-second timeout is intended to prevent
indefinite waits when preceding updates never arrive.

However, each iteration calls schedule_timeout() with a fresh
five-second timeout. An update to the shared open state can wake the
caller without satisfying its ordering check. The remaining timeout
is then discarded, and the next iteration starts another full wait.

Under sustained concurrent OPEN/CLOSE activity on the same open state,
repeated wakeups can prevent the timeout from ever expiring. Some
tasks can remain stuck in update_open_stateid() while others continue
making progress.

Compute a single deadline on entry and pass only the remaining time
to schedule_timeout(). Once the deadline expires, take the existing
timeout path rather than starting another wait. This prevents
wakeups from extending the wait indefinitely.

Observed on Linux 6.8.0 and reproduced on 7.3.0 with 96 concurrent
O_RDWR|O_TRUNC open/close loops on one NFSv4.1/TCP file (nconnect=16).
Ten workers made no progress for over 300 seconds while others ran.
With the fix, all workers resumed after transient stalls.

Fixes: c9399f21c215 ("NFSv4: Fix OPEN / CLOSE race")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Menninger <tmenninger@everpuredata.com>
---
 fs/nfs/nfs4proc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index e1018b03c1cbd..f2cb8e788c017 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -1722,6 +1722,8 @@ static void nfs_set_open_stateid_locked(struct nfs4_state *state,
 {
 	DEFINE_WAIT(wait);
 	int status = 0;
+	unsigned long deadline = jiffies + 5 * HZ;
+	signed long remaining;
 	for (;;) {
 
 		if (nfs_stateid_is_sequential(state, stateid))
@@ -1756,7 +1758,8 @@ static void nfs_set_open_stateid_locked(struct nfs4_state *state,
 
 		if (!fatal_signal_pending(current) &&
 		    !nfs_current_task_exiting()) {
-			if (schedule_timeout(5*HZ) == 0)
+			remaining = (long)(deadline - jiffies);
+			if (remaining <= 0 || schedule_timeout(remaining) == 0)
 				status = -EAGAIN;
 			else
 				status = 0;
-- 
2.53.0

