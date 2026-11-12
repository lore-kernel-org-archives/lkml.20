Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458816;
	b=qMz8IKZYKLLdpirr5HKwVm6EEtqToLRIn1jXH96nDnaVc0ZJ24mnHj8cXlxWG9QpN1yE
	 mjuByEuvao+qyO00kw3oR6V140hMSpeMsJzWyrLDRSWvaHhi0oZmXcbZwux9r2ZfSAjlI
	 /CXzGtQonAn+7Xnqt11WAp8OnGHxEu+Pm4ORC/OW/uvGlUxjOAq8Q2VzfDaS6RhHr1LpL
	 rDHiYyBiNhMDe5ONYQrAnlJH4m/J0FSBrwZxPwFhTKWjtOYWiXeyZKOfs5ZeoOUaIIKwI
	 XA9oXHuYj0IcAtFPDoS3KOTAjkJAM3CDEZBxzHCzXcZRtQVDcxyy/RZ+AblRF8OrZOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cZc4XGv4ugRurmrBQr6mexiDRS8dTs1brzmeqXN2mQg=;
	b=TojvZ1JSxeERpkOpVzM/IoSqSm5v84IiWFUFc2j7uuqM2Av3e9LuaHzONF1TTSfkO3lp
	 IkQsSUc4XkPfunTkwMoN+EyAIU6MpX+PpwGBu9CXKf8geNdCf47/18FtnUH9WjPu0jxyX
	 v19euzgrBvn1nlb6BnjXFx7jIQgaGECiGPW8rXSuP6PXaSKUijQNM9pzQC3+2f1ZuMFre
	 Iev5I5bvJ2xAzMR70/zHqx6+MYZYA4XX7fq7/9JGXv/pFHwsjinC7h60jZFo/K1ZH+Beh
	 ly7EceGM82V/EvWNBXl43PZ5MehGbAANrMvG/9+BOhhS0ES7YMhPjanjsmIm7c+96VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ab1suQVx;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09B6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09B6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ab1suQVx
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so5239903c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458815; x=1795063615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZc4XGv4ugRurmrBQr6mexiDRS8dTs1brzmeqXN2mQg=;
        b=ab1suQVxGfbjNpjeyXsuEe3n/vITBWC1FO3llnWZzlpn7itFS6lMR5cR4GkrJdn/vG
         XJsWDMYXB1YKwGKM0+RWBZY5ft3GI3Vi6UVEX/5zkVnUxqHZ67GiKJQcxOT7Mpn+8EqJ
         Q3q56Yn6OBV3gitKRrANDGRT40vTr8Ve3dIIT6whbyZoWnj4LLa4Vub+3jZo+SgeRa2s
         wk681jXS4QDYw7sAw7lcodI6X9aGB9uz3eBhI//Nl1/vO4agoi+lz3VChv//AXHJ1TxQ
         3I9qi8VzEp8wI81d2cRbha6bNMwsOYlgFjqIn/mphZS7LfqRmWkwRHlLp2AK0sfBrnfz
         xN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458815; x=1795063615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZc4XGv4ugRurmrBQr6mexiDRS8dTs1brzmeqXN2mQg=;
        b=D8ZP3Nm7FcLL3RVgSyuQ2jhC8oZPIEKPZXXkjDU25JjwQGwvThIszEeAUayhfN1PTR
         pTz9WxVAxoSo5chZoii+DAjmcl4HZAqH2vQJoXSYFPQvRBIZ++OZtuP2tUDe6WVGt5co
         hm4Cd4XfKtApDJOe6ldViXEkkugrSL1vsjgxQLCIKOvnXlO/TSHGpYYPhVwPxQL6seWk
         Cb6CHST77wjXP/6sdKVig9N5Y7DtLXzLXHpZSR1SzH4sYTqz4x/m53sBoG0E1Sy7D4GK
         n4GBRdnHgMRFptqbMcBCV+JBDhYX8shI0vuM5h4GKRRHMMc45dQLweIJs0Hvz/LZYc52
         hVMQ==
X-Forwarded-Encrypted: i=1; AL+hErFqJpdnAWMLI+CWpox6Ch1nqSw878VdVxhHUWqy2QN6IwmqTgsOaZpnQDv5v4q0sHhz0MnVLvSvoGefYv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z827z2GmKrqp2iMPrM9NPb+OjHpkruizMgy8SKW2EUA07K1INdi
	6WiyBa2+RdzTn6xAqdzgFWQ/l7m931FofmeIFvSv5rcLaKCUe7h2N1Bb
X-Gm-Gg: AYBFou3zNjQqMIXGJTwgbYR3r6lsSqOfn7yHaxNvTGG7JnRCO25KLHFTwFAVzwfFYHO
	QwcFmKsX+ebBiBZXW6XsWFOqaZrZf14udrOgMTcNbDdggfQ1ryvBrBZbZBYK4vWQhuVJwtUmjx9
	RH+KZEuM7Asy+IEdJFpUdSoD/R0kBMbwWmhsLI+mDbpmE4eoyCuFUcMfooqBu65x6dmz8pmxT/4
	Qd/M63vUQft7SO3xH6SUAD12m/n4Ll5FRH6sxBAYz4KnLG1eTkAO6o31J1Iz29gAZKCq/e1KoLq
	AuuwDGHMCKHKZf0l18q4lLwXo+yqmwigTaPIxCFWpD9Eug6OkEi3gxxZgACFsn9Qu1zwZFBF9Mu
	EdbvgU3Ez7hK8YcURh2Soxc6QdJIg80+yeYUTOSJwNg3bnaLzUe6R77NvNXt8vnEmti+Mhp5gw2
	q7PUEYnG01MvewTzVCxR+Sc6bRp9igTcPd8sRLPhpDliLPHto6UvcbFbVozQCgTysrVk5BMIaui
	6of8cW7G4+e2z0eRSv7mY6jvAERh5l5l3gGEbWYzUk/hW6r83mZP8u0/KJtzVJdUqacSskjG9As
	qUMPw1BToIc01aiuEIq0gohzGWDy79X/ejQzr9b7EixiJlAxThWFj09VyL2lSGmFjJOpZni99T+
	QMxgGO0SfbwKoXjd9Hj5l1WLMTQJAeBB0TNtZh3JVv8iVyg==
X-Received: by 2002:a05:7022:3b81:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1b3c0374752mr4684469c88.31.1794458814460;
        Wed, 11 Nov 2026 20:46:54 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:5d51:6f:e2db:335d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm21024827c88.12.2026.11.11.20.46.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:46:54 -0800 (PST)
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
Subject: [PATCH v5 0/8] ksmbd: verify session setup requests before signing with their key
Date: Thu, 12 Nov 2026 11:46:37 +0700
Message-ID: <20261112044645.4074-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
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
fixes related problems found in review.

1/8 verifies multichannel binding requests with the session signing key
    (MS-SMB2 3.3.5.2.4), as reported by Ian Bridges.
2/8 keeps the negotiated SMB 3.1.1 signing algorithm instead of always
    using AES-CMAC, and signs each key with its own algorithm.
3/8 verifies signed reauthentication requests and uses the channel key
    for session setup on a bound channel. A reauthentication with a
    forged signature used to get a response signed with the session key.
4/8 refuses a binding request on a connection that is already a channel
    of the session.
5/8 checks the MessageId and signature of a request before signing
    STATUS_NETWORK_SESSION_EXPIRED, also reported by Ian Bridges.
6/8 makes the signing decision in a compound follow each command's own
    header instead of the first command's.
7/8 consumes the MessageId of a request on an unknown, invalid or
    expired session, which the error path skipped.
8/8 charges and grants credits for such a request, which the error path
    also skipped.

Changes in v5, following Sashiko's and Ian Bridges' reviews of v4 and
another review of the series:
- 1/8: refuse a binding request for a session that is still being set
  up before verifying its signature, in both binding branches. Such a
  session has no signing key yet, and v4 verified the request against
  the all-zero key. It gets the STATUS_REQUEST_NOT_ACCEPTED of 3.3.5.5
  (3.3.5.2.4 would answer STATUS_NOT_SUPPORTED, as the key is NULL).
  SMB2_SESSION_VALID is now set with smp_store_release(), so a session
  seen as valid has its key.
- 1/8: with multichannel disabled, the refusal of a correctly signed
  binding request from an SMB 3.x connection to an SMB 2.x session was
  signed with the session's SMB 3.x signing key, which is all zeroes for
  such a session. It is now signed with smb2_set_sign_rsp().
- 1/8: drop the unused hdr argument of the session-setup helper, and
  shorten the commit message.
- 2/8: no code change. The commit message presented using the session
  key with the algorithm of the connection that set up the session as
  something MS-SMB2 requires. As Ian Bridges pointed out, the
  specification takes the algorithm from the connection; the patch
  follows what the Samba client and smbd do, and the message now says
  so.
- 3/8: remember in sess->sign_required that signing was required when
  the session was set up, since negotiating encryption clears
  sess->sign. v4 derived it from the connection, which missed a client
  that asks for signing only in SESSION_SETUP and a channel whose
  connection does not require signing.
- 3/8: apply the reauthentication checks to every session that has a
  user rather than only where the connection is a channel. SMB 2.x
  sessions have no channels, so the second leg of the reauthentication
  of an expired SMB 2.x session was not checked, and a forged one
  destroyed the session.
- 3/8: copy conn->binding into work->session_setup_binding before the
  error path clears it.
- 3/8: treat an encrypted request as authenticated only on a session
  that uses encryption.
- 4/8 is new: refuse a binding request on a connection that is already
  a channel of the session. Sashiko noted it on 3/6; it was already so
  before the series, so it is a patch of its own.
- 3/8 and 5/8: commit message corrections. 3/8 now lists what MS-SMB2
  says about the key of a reauthentication on a bound channel; see
  below.
- 8/8 is new. Sashiko noted on 4/6 that a request answered on the
  failed-session path is never charged its credits and gets none. That
  was already so before the series, so it is fixed in a patch of its
  own. It leaves out SMB2 CANCEL, which consumes no credit. The problem
  goes back to the first version of ksmbd's request loop, so its Fixes
  tag points there.
Not changed:
- 1/8: Sashiko suggested checking the ClientGUID, the session state and
  the user before the signature, in the order 3.3.5.5 lists them. The
  signature stays first: 3.3.5.2.4 verifies it while the request is
  received, before the command is processed, as 5/8 also assumes, and
  a request without the key then learns nothing about the session. The
  refusals of a binding request before it has been verified are
  unsigned, as they were before the series.
- 3/8: a reauthentication on a channel that was bound to the session is
  verified and answered with that channel's key, as the Samba client
  and smbd do. MS-SMB2 does not give one key for it: 3.3.5.2.4 has the
  server verify the request with Channel.SigningKey and 3.2.4.1.1 has
  the client sign it with Session.SigningKey; 3.3.4.1.1 has the server
  sign a SESSION_SETUP response with Session.SigningKey unless it is
  STATUS_SUCCESS, and 3.3.5.5.3 a final non-binding response too. On
  the session's first connection the two keys are the same. I have not
  tested this against Windows.
- 6/8: Sashiko noted that a signed SESSION_SETUP for another session,
  chained after a command, is now checked against the earlier
  command's session and refused. That is right for related operations
  (3.3.5.2.7.2), and ksmbd already refuses unrelated commands on
  different sessions in one compound, although 3.3.5.2.7.1 would handle
  them separately. The same check keeps the refusal of a forged chained
  SESSION_SETUP from being signed with the earlier session's key:
  leaving SESSION_SETUP out of it made the refusal signed. A test now
  covers this.

v4: https://lore.kernel.org/linux-cifs/20261110165834.28162-1-mike.michalo@gmail.com/

Changes in v4, following Namjae's review of v3 (numbered as in v4; v4's
4/6 to 6/6 are now 5/8 to 7/8):
- 1/6: smb2_check_sign_req() and smb3_check_sign_req() now restore the
  Signature field themselves, using their signature_req buffer, instead
  of the session-setup helper saving and restoring it.
- 2/6: use SMB2_HMACSHA256_SIZE for the HMAC-SHA256 buffer.
- 3/6: no longer changes __process_request(), as the check helpers now
  restore the field it used to restore there.

v3: https://lore.kernel.org/linux-cifs/20261109194144.22814-1-mike.michalo@gmail.com/

Changes in v3, following Sashiko's review of v2:
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

Testing of v5, on a KASAN/lockdep UML kernel based on next-20261105.
New tests, each failing on v4 and passing on v5:
- a binding request for a session still in setup gets
  STATUS_REQUEST_NOT_ACCEPTED whether its signature is random or made
  with an all-zero key (v4 answered the two differently);
- a binding request with a bad signature gets STATUS_ACCESS_DENIED
  whatever its ClientGUID and for an expired session, while a correctly
  signed one gets STATUS_USER_SESSION_DELETED and
  STATUS_NETWORK_SESSION_EXPIRED there (this one passes on v4 too);
- the refusal of an SMB 3.1.1 bind to an SMB 2.1 session verifies with
  the session key (v4: with an all-zero key);
- during the reauthentication of an expired SMB 2.1 session, an unsigned
  or badly signed second leg is refused and the real one then succeeds
  (v4: the forged leg destroyed the session);
- a second binding request on a bound channel is refused (v4: answered
  with STATUS_MORE_PROCESSING_REQUIRED);
- with signing asked for only in SESSION_SETUP and encryption
  negotiated, an unsigned, unencrypted reauthentication is refused (v4:
  accepted), and an encrypted one is still accepted;
- 8/8: 40 requests on an unknown session right after NEGOTIATE, and 300
  on an expired session, are all answered and their responses grant
  credits (without 8/8: one and 127 answered, then the connection is
  dropped); a signed one still gets a response that verifies; and
  CANCELs naming an unknown session are granted no credits and leave
  their MessageId usable;
- a signed reauthentication of one session chained after a command on
  another session, or a forged one, is refused, and the refusal is
  signed with neither session's key.
The binding, expired-session, compound (including SESSION_SETUP inside a
compound), encrypted-reauthentication and sequence-number tests pass as
with v3 and v4, the Linux cifs client works signed and encrypted, and
each patch builds on its own with W=1.

Testing of v3, on a KASAN/lockdep UML kernel with ksmbd-tools:
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
  since 1/6 now rejects such a binding request in the binding branch.
Ian Bridges also tested an earlier revision with his own probes and
smbtorture. Not tested: Windows clients, and Kerberos expiry with a real
KDC (it was emulated with a test-only change).

An AI assistant was used to draft the patches and as an independent
reviewer.

Michail Andreas Michalopoulos (8):
  ksmbd: verify the signature of session binding requests
  ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
  ksmbd: use the channel signing key for session setup on a bound
    channel
  ksmbd: refuse a binding request on a connection that is already a
    channel
  ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
  ksmbd: use the current command's header for signing in a compound
  ksmbd: consume the sequence number of a request on a failed session
  ksmbd: account for the credits of a request on a failed session

 fs/smb/server/auth.c              |  14 ++-
 fs/smb/server/auth.h              |   4 +-
 fs/smb/server/mgmt/user_session.c |   1 +
 fs/smb/server/mgmt/user_session.h |   4 +
 fs/smb/server/server.c            | 119 +++++++++++++++++-
 fs/smb/server/smb2ops.c           |   4 +-
 fs/smb/server/smb2pdu.c           | 197 ++++++++++++++++++++++++------
 7 files changed, 296 insertions(+), 47 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

