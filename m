Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498127;
	b=MhiubwV1V8hzvh1D3xawr/jDTjdqsA2SRDWedY5B8Jr0u2BH15k3YN5kCNEK9Yz6Uh5O
	 Sw3AH2U0NUaDJrJ6VZ9xkjxUizzG/9rx3u3ArCZ0CZFnUHlq8BG41Z8V5fTs0VKalXe4U
	 c7LeWj9w96dMF3Xw/JuZ1BQpnhuKNxe/J3jJ1hEUZTijcfalgNHVUQlsfDpVhpnXpuhGi
	 3tQ4h45PaOjDTxFLD/n7V75dvtlvszSo3D7ez3ZXa9G/TNTUag89zjuToHWR4gJU0R4TL
	 tWP6m33ShG4QiUSa0iMEHt/LK1aiHJKTJCnzMq8Uy0J6tp9eH7mFg74coJD8FGs7Iqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n34VYGkgBYePnRkvbEYEe/GsiQZ2DgvukkuywHHCQS0=;
	b=mIGTVSY0O4iEjbLzqSk3MSRnFWbAFC8SB2hpxnBP+HppkzZu6HwvMa9EZozb41CUSmIB
	 rpNpJCmbuY0/eOvb5WK2+87/1KcIrDkLFGLihZxbAlgR3YVajYMM04FhWSmf1+WQqGpAC
	 vq3onYaUiViDOHiF3FGd/sZFIpbtChxWveFzxbJ2KyKGRkINOwiXlXOOrUr94+smK9MHe
	 BlRW7Z6jM/qNXdpny3PmhgzCg0477RWHOWcL2BaXHTL5YT98vnimKVeSX2i7s8pX+HyHJ
	 rjS+7TS0FnVUfe/L9jfKmGGzJeWfebVnSIz2lIlL96DlhpTHbk9Ir/m3hcLyTZjUeig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfI5tXfi;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C936606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C936606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfI5tXfi
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so798762b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498125; x=1795102925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n34VYGkgBYePnRkvbEYEe/GsiQZ2DgvukkuywHHCQS0=;
        b=DfI5tXfiGkdWSLzriUDTj+Femy2kgBdEEFZ0rCGqMiq9+FjoyKtnP3taz//Y49Rm1x
         YblzicWm4Kkb51uujSKQ9l0nIJpjpvc10j2xwsVMClu2COEmgp/OEDK+rnb/1FLUQbz8
         QiZIf6FforBhuQnwPWQnl7Blr3A3wOGcl6FQJLL05we09GFHBW0gbZE5nWsTNmNE/zWQ
         FFYMPY7/qEY7Ji/aKs/wXg7csD3tFPhNQ44tlI+AwqivBdsnM/zFEsn1SZQhtSVpJ4C0
         ODDi/5S1e9CQOciWfyXz32me3AcRttd0CN92/Z6yIuUBCJznuFChqxj/yzHO0H0evQ1z
         lsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498125; x=1795102925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n34VYGkgBYePnRkvbEYEe/GsiQZ2DgvukkuywHHCQS0=;
        b=UstUP9j7xU/SaTPn4FkrwL62xfFX64VLLmuFeMCF2B5Uzl43gaji6MIqqjMaSbW+fT
         lOqzOXGkTMMClaj19EP1wixhRHR2etijo2+wlZJntxWSOH8PLTLRpkTgW/+PXRMwQKzt
         34aJyCx5lMPTc8AdM5GukjrhlRuR72KTXjdu8wGVZmc11M/s8HZbdRbiYi1T9Y2vNKDV
         XxtMCvKfkIVHdBVTRQfKtTSaknUttAJsPGjgx+NgyXRWTIKwT6c8hw/CMQxU/Zsr8NI0
         IL5dwDr6mb+VA11h+AlbnGoUERJNK+bGZF5v97zYuxYgT2gbOLTKOWvsbiUzcGZ4gUpl
         E0LA==
X-Forwarded-Encrypted: i=1; AL+hErFTCG9KuOM8J/AhcVanfWZ4/OAQ5ku3/ct0z4NmlqtQ2k+yBDOBKB+jguqm4cCfgFZzD7ryJr/5cvJbbtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z++6RgolWA1HKIBF8leg2wvISL9hABpmdpqexbykm0DeFzOsmCe
	vqoQ1mP9sdKspWycELHbG5ZlMSXWInpaMarakB87fQHtbswMbiriba5N
X-Gm-Gg: AYBFou2Xn43FfbiuYT67+MlgSsAIo+AzEIvCBQZ3axu3WGlHHonqxJv3Gb9+araKpEn
	JAPwWmUsJV2evRHKv4e4zs8fUU6FCRAl6iz+w/pLhwaN+OUcWWRRZIiD5kF02f/WMXoTcp6cA2s
	l1U6eXC4eFJiRjhWzK7KIVCJpWb0ZZemO+HVGPAo9FujsPwjwdCzFFFVGH1LvXPQTs5JmOHnywC
	MoEZ8Izl0yfY+GBoUDH94FdOelSRuyxktY7Q833NmQtA0NFsMzsv+/kB3leVUlgnscPQ88TQjes
	EqvbuSiWwdKdLH/c9xcS1MMhb1608zITAz4U60WeJ310HjhJYkoWiDSQMJabnwZ66pu26Nr3NIE
	DXxaCnUIfxV/kY9UFi+0YedHvvgXdoVFx36L4C6z1Zd43J0Q7DUIlH5Mih5/0dQZD81EZcrkKsn
	llObJQxcOhAbTSHw0rav3LIYIVnsHRptJbdA71wKvsTj/qOAiD3ulmScOrgK9vIdEtO6so22TK5
	dTbIZyIpc32UyIxeLr+e/eqQCYN2C92UkY2w4EbPEFChiSmw7oadugoFO8mFWFAkQDCRnAMvnkV
	eobSQDpmIjTrd6WyqAmJa93TycPk/dh4d4mSlNmkdARlfwthBBGKnsHh0IrFW1KjJSl6POYvzil
	a+Na2T4/kAjlQ4LD8OJXWMm/wt2s=
X-Received: by 2002:a05:6a00:3385:b0:8a0:3072:ee9 with SMTP id d2e1a72fcca58-8bc1b8f8e9fmr6558661b3a.13.1794498125152;
        Thu, 12 Nov 2026 07:42:05 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:21c4:c32f:67c1:d87c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3619sm3790596b3a.5.2026.11.12.07.42.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 07:42:04 -0800 (PST)
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
Subject: [PATCH v6 0/8] ksmbd: verify session setup requests before signing with their key
Date: Thu, 12 Nov 2026 22:41:47 +0700
Message-ID: <20261112154155.20255-1-mike.michalo@gmail.com>
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

Changes in v6, following Sashiko's review of v5:
- 1/8: read the session state once in the multichannel binding branch.
  The signature check sits between the checks for a session in setup
  and for an expired one, and a reauthentication on another channel
  could move the session from expired to in progress in between.
- 1/8: refuse a binding request for a guest or anonymous session before
  verifying its signature, with STATUS_NOT_SUPPORTED. ksmbd derives the
  signing key of such a session from an all-zero session key, so a
  request signed with it proved nothing, and the other binding branch
  signed its refusal with it.
- 3/8: an unsigned reauthentication of a session that requires signing
  was accepted if it arrived in an encrypted message and the session
  uses encryption. A related operation in an encrypted compound can name
  another session than the one whose key encrypted the message, so the
  session of the transform header must now be the one being
  reauthenticated.
- 3/8: take work->session_setup_binding from the request's
  SMB2_SESSION_REQ_FLAG_BINDING instead of conn->binding. conn->binding
  is not yet set when a binding request fails early, and stays set after
  a binding has completed on the connection. So the refusal of a binding
  request with multichannel disabled could be added to the session's
  preauth integrity hash, and a failed SESSION_SETUP chained after a
  command on a channel could be signed with the session key instead of
  the channel key.
- 8/8: when a CANCEL answered on the failed-session path ends a
  compound, its response now reports the credits granted to the earlier
  commands. v5 left them out.
- Based on ksmbd-for-next, to which v5 applied without changes.
Not changed:
- 6/8: Sashiko noted again that a SESSION_SETUP chained after a command
  is checked against that command's session. A binding request in a
  compound is already refused during message validation, since commit
  19f8fd6b5ced ("ksmbd: prevent session binding in compound requests").
  An unsigned SESSION_SETUP for a new session, chained after a signed
  command on a session that requires signing, was refused with
  STATUS_ACCESS_DENIED before the series as well. See also the note on
  6/8 under v5 below.

Testing of v6, on a KASAN/lockdep UML kernel based on next-20261105
with the ksmbd-for-next commits since then: a compound of an ECHO and a
CANCEL that names an unknown session now reports the ECHO's credits
(v5: none); the tests listed for v5 below pass as before; smbtorture
gives the same results as with v5; and each patch builds on its own with
W=1. The other changes in v6 have no test of their own.

v5: https://lore.kernel.org/linux-cifs/20261112044645.4074-1-mike.michalo@gmail.com/

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
  a request without the key then learns little about the session:
  whether it exists, is still being set up or (since v6) is a guest or
  anonymous session. The
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

 fs/smb/server/auth.c              |  14 +-
 fs/smb/server/auth.h              |   4 +-
 fs/smb/server/mgmt/user_session.c |   1 +
 fs/smb/server/mgmt/user_session.h |   4 +
 fs/smb/server/server.c            | 124 ++++++++++++++-
 fs/smb/server/smb2ops.c           |   4 +-
 fs/smb/server/smb2pdu.c           | 247 ++++++++++++++++++++++++------
 7 files changed, 345 insertions(+), 53 deletions(-)


base-commit: a4277e7b7682540e23334fc927f201e5bb7df5a3
-- 
2.43.0

