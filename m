Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253315;
	b=3PF57R/PIT3sIS1R6oQioJVUk5mEX4st+aetBvymohjjzrKxqkJ+j3uzydP08bev3616
	 wjO1SZF7zDiKLNPoE1s5FWYVWivrZX0rgwFejxBSCpVnksqPpFRo+Ek6oiSNMMVYDvUkz
	 oRR6Hg8zyn1F16CDQVQ8StnK2ujItMqI2gXZvKA0F5dWVBBTZB8Fx3dyYbsapAfcHE7IW
	 DCLuQ1JRrxpDj/7fjGMa8Q1qIHNC+Y5bjS6K/taOsjqZjgSYRYRV5nNTUWEd0gpVjq5ul
	 fr8QbkuOXguzqW86XUTcHb7SIbgG7Aa6GZ3OlS2o8EcsJNOjVlcIi4NGpx4d9R4BFnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=85yyBQIzKGZBCqGcTfxQFWl/kJjPTDSYq01hGWqbZYQ=;
	b=j1/HiRwDqsgtGwO0BKdPDgKY6gqk6vidSIMd7tQO3Suy8I+QyUJAW5j5RajGlSPZfWMZ
	 +YLII5nK4QJhYVXAPc667z/fHLZd8SSS2kq91fenVOJugihhSBn2c2lU7tvCnvqs0Kfvs
	 ojuGpwKAH9a8uZLOg8s8Dsh8BEAY8GRkU05tAOV3yFt4BLQ5t6rEtWRtlHMrV6RqrIXdh
	 a5mg20WcMT2dYaPoovyOY1G3ILRmgqpmb1CiAP+Y6f3Vi0cOblt7VE4PA3AHWd3AXDx/C
	 gcTOB9L40gYpW7AxgVghCHDjFCLZzm14EJI7+cVc3KqxcnN080c0tZZEybqJOVXZL9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBoqutWe;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD65606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD65606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBoqutWe
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e95bd1c14cso11366385ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253314; x=1794858114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85yyBQIzKGZBCqGcTfxQFWl/kJjPTDSYq01hGWqbZYQ=;
        b=HBoqutWebrHtLpZ4SJEKm5jb+nZ8nMjLKG4NkFYg7QbzsZLrkASRuAP0dhoWoIO4D4
         16Wyyo/X9IaDgz/nRSGE9POzoQaKrI+385PbcygGHA3Co0UWJNujsxoSd6zo4CqS+Niz
         OIFhfWjPTzEWI3Tb3I7w3qW+Aey8Ziv/kymegynrz1Hyifx+EpBj7XXlXyjinRgVWuNm
         ET/QdWVnU2pht0nD+PA0+4aF1fzw8+2kT80McBMxfNMhTi589lYDTIy4ZDuBBq3G9wg7
         ofX1EE0UHTaa0KiXdgOm+Z5nh2We/5Vz77FUKv8/29fRwn2uMColTanVg2VtUgbhgXQE
         B/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253314; x=1794858114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=85yyBQIzKGZBCqGcTfxQFWl/kJjPTDSYq01hGWqbZYQ=;
        b=mSQv/jGBXP+0gujzcAop9W2/aKXNyXT8dSriEz8taINou8ie4CixKlcJtVih+JBJ0O
         56amR8jyjSu5li/hHcYyQDCno4QchIMcXjktMLukDqVTj6DwbFwnpYTtSXvfy+jgAppp
         n7/nwcwI+jykLk5V9E4mJLEJUMUvk7upcCEtt/ERZlNq0Zz0NrQ5YNRoXKl6yFS1hSM2
         dIHKPQNE1086GllyFNTWg9clBn3fDYb8B/Y+GZzxkYd+AvN5ma6tbLehTTK9yfBTXJiY
         HnBq/5nF4pF0Qs3ASJlWVmil95HrKXkByDORUmrRyURN1HxvbvNrpsSJIVtZSBw2yerX
         lfSw==
X-Forwarded-Encrypted: i=1; AL+hErFzQcbNU1WQaBsFnDjpUJ6umhbgx2IGgczsVejCECgEOSyI/7sBLfMxemqC2NasaXJWy/Irax/ItwtMGz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YLVNXdEhuOUi388EUqZksvw0wWR5MwthPQNzTcUjcYcLpI55e
	qpbqB7VoMHXFg1NgcZySFey/HzgfRUGBfWV4eZglhFjgtAiZ9WLaI4ec
X-Gm-Gg: AYBFou3NFfenDjHQ4lxg+VilteFvWJPdcqoFv6yATyHAQ9Zggv/R3lJcN+L8S/jFHgY
	mJjcLqg8uwIKgtKcz1yUBRCGIvwGWy30XBdv3baM+KLfq24dgz9h+mlQGRWUAHy1MrQIjjR32qh
	gfzuvCAP9PQa4wae3/zdub8YF8LmsWdIyJdR59NfDKP5PJ7ZFtHrTTtXxhA375hIBtGqij32P+H
	ASKijUDs2UQAlhIxcES+J8UzAQPa+oAg8PU9HdIEYFLSv9mMs6oTK4C5f99g/BTtKGYDdJyOpKd
	xM5F9GCLZiR0VPQgItGxgHMmdrBpud/Q6hX+Tj65ew7kqYVYzteJoCg6Ordh1z9O37NEwuBaoWK
	dygD5t+TsY2P8Ck+tIC813XifPWEniRiew5zg8WQtD1ZAcvZ9J86mQdCjPMF8bGwbU2W7bXCjwl
	7xHYNvkXXp6Un+r7wWHDpG8EhLe9N0ZrzzJGpO1mvARAV0YsI2U1c1h5o8cdQjLtWchwc/CBHTw
	A2U56MHVgpaH7XaCzlHh5aZ4msHG+g5ijqNpt+fb1+IqQ3Ooj/GIYKSATwqXqrc3nRY5M03dgv7
	5zT+o/QId1z0dvOwytAu9XQPyF0nQMVgAXhvsTihMrcTplYVEVkgWaJi8seCQz1OAwSQAqKVVH+
	Bap05vrQRCKK70ZMR11Gcz2gDC+vMF36joa7au58t/kQKiG0aLr8BzNM=
X-Received: by 2002:a17:902:f541:b0:2ed:3be3:c63d with SMTP id d9443c01a7336-2edb91e2b78mr1330605ad.23.1794253313947;
        Mon, 09 Nov 2026 11:41:53 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm1388585ad.13.2026.11.09.11.41.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:41:53 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: linkinjeon@kernel.org,
	stfrench@microsoft.com
Cc: icb@fastmail.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	ematsumiya@suse.de,
	lsahlber@redhat.com,
	hyc.lee@gmail.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: [PATCH v3 0/6] ksmbd: verify session setup requests before signing with their key
Date: Tue, 10 Nov 2026 02:41:38 +0700
Message-ID: <20261109194144.22814-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-Jo-ObBDs-AdGfaM+QmDsot3gj1g0oJiyDKczoUDg2TA@mail.gmail.com>
References: <CAKYAXd-Jo-ObBDs-AdGfaM+QmDsot3gj1g0oJiyDKczoUDg2TA@mail.gmail.com>
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

ksmbd signs some SESSION_SETUP and error responses with a session's key
without having verified the request, which lets a peer that does not hold
the key obtain signatures made with it. This series fixes those cases,
makes ksmbd sign with the SMB 3.1.1 signing algorithm it negotiated, and
fixes three related problems found in review of v2.

1/6 verifies multichannel binding requests with the session signing key
    (MS-SMB2 3.3.5.2.4), as reported by Ian Bridges.
2/6 keeps the negotiated SMB 3.1.1 signing algorithm instead of always
    using AES-CMAC, and signs each key with its own algorithm.
3/6 verifies signed reauthentication requests and uses the channel key
    for session setup on a bound channel. A reauthentication with a
    forged signature used to get a response signed with the session key.
4/6 checks the MessageId and signature of a request before signing
    STATUS_NETWORK_SESSION_EXPIRED, also reported by Ian Bridges.
5/6 makes the signing decision in a compound follow each command's own
    header instead of the first command's.
6/6 consumes the MessageId of a request on an unknown, invalid or
    expired session, which the error path skipped.

Changes since v2, following Sashiko's review of v2:
- 1/6: correct a missing negation on the multichannel flag, so an SMB 3.x
  binding request received while multichannel is disabled is verified
  and rejected in the non-multichannel branch instead of falling through
  to the reauthentication path.
- 3/6: also refuse an unsigned, unencrypted reauthentication when the
  session requires signing or encryption. Negotiating encryption clears
  sess->sign even when the connection required signing, so the v2 check
  let such a reauthentication through. Merely having negotiated
  encryption is not treated as a requirement, since clients routinely
  negotiate it and then send unsigned, unencrypted requests.
- 5/6 is new. With signing not required, a signed later command was
  processed without its signature being checked, a correctly signed one
  got an unsigned response, and an unsigned one after a signed first
  command was refused. It also decides whether to sign each response
  before moving on to the next command of the compound.
- 6/6 is new. Only a signed request on an expired session had its
  MessageId checked (by 4/6); any other failed-session request left it
  unconsumed, pinning the command sequence window and letting a replayed
  MessageId be answered again. 4/6's own check moves to the common path,
  so the MessageId is consumed exactly once.

Testing, on a KASAN/lockdep UML kernel with ksmbd-tools:
- forged and replayed binding, reauthentication and expired-session
  requests, also inside compounds, get unsigned refusals with AES-CMAC
  and HMAC-SHA256;
- new targeted tests for 3/6, 5/6 and 6/6, each failing on the kernel
  without the fix and passing with it (5/6: each response of a compound
  mixing signed and unsigned commands is signed exactly when its request
  is). The 3/6 test uses an SMB 3.1.1 client with AES-128-GCM
  encryption: an unsigned reauthentication is allowed when the session
  requires neither signing nor encryption, refused when the client
  required signing, and an encrypted one is allowed;
- randomized requests against these paths, and 8- and 16-thread
  bind/reauth/logoff stress (about 130,000 operations), found no signed
  response to an unverified request and no KASAN or lockdep report;
- the Linux cifs client works with SMB 2.1 to 3.1.1, signed and
  encrypted, and recovers after its session expires;
- smbtorture's session, signing, I/O, compound, lock, oplock, lease,
  notify and ioctl suites give the same results as without the series.
  With multichannel disabled, the session tests also pass and fail as
  without the series; six binding tests that fail either way (the d and
  s variants of bind_negative_smb2to3, smb3to3 and smb3encGtoC) now get
  STATUS_ACCESS_DENIED or STATUS_REQUEST_NOT_ACCEPTED instead of
  STATUS_USER_SESSION_DELETED (they expect STATUS_INVALID_PARAMETER),
  since 1/6 now rejects such a binding request in the binding branch;
Ian Bridges also tested an earlier revision with his own probes and
smbtorture. Not tested: Windows clients, and Kerberos expiry with a real
KDC (it was emulated with a test-only change).

An AI assistant was used to draft the patches and as an independent
reviewer.

Michail Andreas Michalopoulos (6):
  ksmbd: verify the signature of session binding requests
  ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
  ksmbd: use the channel signing key for session setup on a bound
    channel
  ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
  ksmbd: use the current command's header for signing in a compound
  ksmbd: consume the sequence number of a request on a failed session

 fs/smb/server/auth.c              |  14 ++-
 fs/smb/server/auth.h              |   4 +-
 fs/smb/server/mgmt/user_session.c |   1 +
 fs/smb/server/mgmt/user_session.h |   2 +
 fs/smb/server/server.c            |  80 +++++++++++++++--
 fs/smb/server/smb2ops.c           |   4 +-
 fs/smb/server/smb2pdu.c           | 145 ++++++++++++++++++++++++++----
 7 files changed, 221 insertions(+), 29 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0
