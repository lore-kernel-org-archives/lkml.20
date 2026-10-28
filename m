Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179966;
	b=yTL6/JhzfF4+rdywDIMDFAWjYtW1qsgMK7oJQzyg8ydTNeOYqTlS0sGC6uWlPfKcX7o8
	 CFPR+dd/b4JR67QSk0SgV88VnxGpuS18SVpr61gcfKdqoU4beC1tu89qVpB1VCzt2FuFv
	 oj/iZDG5SBG8ez/q4CjNH1QTR5QMClNSdYYgx2/FonP6TsJMl3PEKOPt8unUcnFvEaAKd
	 AqOkEofVUSgSGYoZuAVrxWKLPXuVKNKcacHDkS5bDDMS09Vc6X/40GWAPHoX9F5ZKB7Yy
	 6bp5eZWf34oJ8M5337ZV3EnJT0lO+a4TAsJ+yf6b/XMnRby51611T4CRXMiXX+q2WJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=StDbYCLf8QBugxMgigmlPKTKpnDxInqQmLIcu1D2CBg=;
	b=PnJ0mPEgIeLCM9IohpQFWsqUtd5iMnP7GtH28cXY90d9mRWV68U0pIA9o5CRRI6AaJCK
	 gij0tlQKv2E8SU1O/+XHS+EX8SCLmgotu4SafSoE9ZM4WvtOAX6nQJNtVdWp4zTEqbL+s
	 eNV8PMkl5xgLr2STTopzdHFik1eJ/NfJlRCQnkWt1AmrwB4l68pY+aJXPRzPUrtu9kOR1
	 n51MiujK6yI+LmB9Ou3SgqaOSxZpjf2+/LLDOijZxZGEKBqQyvkhrWEn0208EZqgFy382
	 /g/yaK8PFB4AE5ngXK6qTdGfsTaTwSNQGjCAv2h8Sr4OE4ScqBUVbolgRWVO5jqvQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNMmzGPg;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNMmzGPg
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso463106a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793179966; x=1793784766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=StDbYCLf8QBugxMgigmlPKTKpnDxInqQmLIcu1D2CBg=;
        b=jNMmzGPgjH4o9HBjKn3hoj12sxQLQmLlEeNXkCtGs0eg8QOS5Lrrk7EFqg16A33qQ0
         i6Fx1eoey5dSOzUkjYl1kpGMtgtKXXP5mZP5NJAD3cdFGDpxm/L4mkhm9c3YEgevXC96
         FTtFIwyKFeiM9MHqerHEtG+Ph8KKWiY42FTqdyCmh1HQKcG1lBFMUOISoWoZ8JIQx2ey
         ZokQXMY7ixyQUH2LXig2mB2DLW0LSFPePQ+ApqSeTUmXN8Ym8UJmcnnzGn23PlvtZKe2
         /CcCAyF1+NisUcpchb4Wzui4PQxMv7WSnGKRDp2W/OctEJmMl+GmwdQ1e0lPjE2F18bn
         rV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179966; x=1793784766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StDbYCLf8QBugxMgigmlPKTKpnDxInqQmLIcu1D2CBg=;
        b=RWJdsyWpFAuHHVTXSV4SLXuZm7M2uqKNUbP6yx0eSbmrIN6KYmIU5RpgTw71AhmcuZ
         FA50xx5rw9WVWa70y9zyTvPnZkTTlUuQf4ZNNorsuBTmXieaVhWp7deYN42Z7is1OeiH
         ETCGr2E/qtMvqGk4C0++rH8UnstR2ovYa8VRyq3qJc6cVsDDbTXTs/K0x34oTDVCfjTC
         JjVuY7hpfoJ0bQ9RBrmPw4pW4IcXmq+ZmsUrvv5/bjB7oTrQIxB/xhMqhGkE9kTWbCX2
         B2hozzWTuiWuVCYy0NcxVzLPCuJY6q3o9vz9HKtA7pAGnTWfVZd6LU+gXRjgZr74DLS0
         Zk2A==
X-Gm-Message-State: AFq9FYIIcZItGgJpCXaqxXOLla2qG8yDP1Evra57IrXrPFbJyAY50t9x
	cA4Mc4imbpcqwG7VuHz8wTEC1NN4KlxJ2a8Ag3NHF4FfcokiUpMquoj1
X-Gm-Gg: AYBFou0biueS4CkP9HWzVzWonlErLfEKPgBHAAQyt/9/p8m2//VgbKTMsdh28mb+YAB
	A9zhN9fPmanarYChP6qZJs3qtOBjLjqPqHZpOVm29rZsf5Vae/A3v8c7sGWKiHKoN1oZKA2h0C5
	JD93BQRHtwAmxOkrCAV5ptDjnQUrG0PncDcvrPzyflUuFJA72kdWDUL1iXl6zI18YFNqXGjP6UZ
	jpstg8yl0tsPsIR/7O7DKGNwSrASN/m052rc5N3ScaE/Kdk7Fm5eevTjrHRzKkIVijnOpEPCwXw
	73pexsgOsmjOPDuGY9rDLEP6ucbzpY3Teoe7ug9ae25xDK4duEQ6vv5ksQokeH7wpI1aonaRECW
	/9gE8w+kdiprMfqWl0PSHx4lPJmKOEUM6fKGshwSdTqePSB2kZ4hEzJqNLSDwSLrCIgH6YayNYP
	FR9+Wc5rq/hqDdmah2j9pldi6aVsJh6vrNTXDgM7PdSfd4dEpZmrR3nBLVeXcHr9I4kOeLS/XK1
	TsyXTKDUS0hoaKqni1Jx5aI4HIlb6CPa+Tnn2jukMXt20EvQU2eo78bDKJfnomWtzVNGQoOZrHl
	macJWuCibtgk18MISVL7YDQ23YDLszoTPvhhM4FUK1Eb2ZaRuPXZtDm+scDb+Z6z
X-Received: by 2002:a17:90b:57e3:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3ae58123796mr1167823a91.37.1793179965718;
        Wed, 28 Oct 2026 02:32:45 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm2211080a91.10.2026.10.28.02.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:32:44 -0700 (PDT)
From: Jianping Liu <frankljpliu@gmail.com>
To: dhowells@redhat.com,
	jlayton@kernel.org,
	netfs@lists.linux.dev,
	frankjpliu@tencent.com
Cc: linux-kernel@vger.kernel.org,
	stable@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] cachefiles: return -EEXIST for a repeated secctx command
Date: Wed, 28 Oct 2026 17:32:38 +0800
Message-ID: <20261028093238.1382712-1-frankljpliu@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Jianping Liu <frankjpliu@tencent.com>

cachefiles_daemon_secctx() returns -EINVAL when a security context has
already been set. The same errno is used for an empty argument, so
userspace cannot tell the two failures apart.

Return -EEXIST instead, as cachefiles_daemon_dir() and
cachefiles_daemon_tag() do when their setting has already been given.

Fixes: 8667d434b2a9 ("cachefiles: Register a miscdev and parse commands over it")
Cc: stable@vger.kernel.org
Signed-off-by: Jianping Liu <frankjpliu@tencent.com>
---
 fs/cachefiles/daemon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 1a66e0af2837..ef2ec7afd7cf 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -513,7 +513,7 @@ static int cachefiles_daemon_secctx(struct cachefiles_cache *cache, char *args)
 
 	if (cache->have_secid) {
 		pr_err("Second security context specified\n");
-		return -EINVAL;
+		return -EEXIST;
 	}
 
 	err = security_secctx_to_secid(args, strlen(args), &cache->secid);
-- 
2.43.7

