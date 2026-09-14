Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838C25A645
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409406; cv=none; b=QRyM28bDPMNxjq2IdxDZKOrlS/M5KPqQiGsbHjttUhZ3XHMcF/UvULTGpEDhGT4PXToef4KpO7GzafEXWKQbXnzF1Fl3tC52uu9l0n07XseZt4xPp2jsry/DWX1USLnhNABKiKMeav2Orsf+2bjL37g6r//HoPvL28hzdE168dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409406; c=relaxed/simple;
	bh=BYAdkqFw+JhFCbVAYMWPqM8MRr41rR9mE0Rhks0Supk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lAAxdSiAzeks8ctvRxa12mT91GPOEbEr0Z2sYTiZ9CWhLdGcG6UgIdhEhWDivIAnZiNiVM8oij7SQS/POUkyHUQ2/UxyoYLKtWfujzOXorCtykda3zCfqRkgGW5ErCOec0PUxHL1tv4iDW9wmDi1pPMkfmMcrUEGnidp402Ocgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=vyfnIJsJ; arc=none smtp.client-ip=74.125.224.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="vyfnIJsJ"
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-66e579ea059so81402d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789409401; x=1790014201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OIGXq9LPdM6hJ4yEHsUVyge0A5woOLwG6L03+WxApo=;
        b=vyfnIJsJswN7qzRiqUGOS/VpBIvTG1LFLie1I3KRLjtfYe4LVnMyoWiL55s4kciQkU
         Sw1zeZocv7NNfzJlxTxDvvltpES6mmbICO50PBFPK6I/8stSYm/9etbOQV3Lsu6MKmnA
         +Ag0iDirVLgJrpLT5K1jmUaVef+7J4RatiwgarUlTxUdZKVwfF7F1Dzz3nEkpv+uuTv7
         eZHcYtQMcgiJ26iuGOLPTpYFI22eVpBU4OMBYsCA/N+Gs7hZGuXLW/JwnSkT2x4jA8Po
         oi4x/ZehEz8TCQ1ODwmeJJBR9qXzpMJ+jmOIurT8uHRKaH5LCR7MU+7zf5IhBSQMwmOn
         kDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409401; x=1790014201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OIGXq9LPdM6hJ4yEHsUVyge0A5woOLwG6L03+WxApo=;
        b=BM/qNKLR26Gt0Y3JHUMQnN+McNOHX+CLdmFu8VTAv32WB6ERgOSHAj/UipZ1KzBaxD
         Tt51FLvKXLCuodZpq+72/O3QFQYx/xA/ZFdI83HoHNfmwHMSKfgPB4NpGlsK/AccRbaM
         KqKNC2z7CL9fwvLTKCpmOZ114ggYjnrE2XfwTt9BuptYUHvdlhIFCcBI7NfPJz9Uy8/m
         xlXnB2Y+F635wRhUkAMrmpDAhah2Ji58mJAif9AApCnpwvU9HGW5yiSb8m4a3Uriwpdc
         j7qbs74/fDaGfLwI27l2Dz9L/KpOfbv8syoj9CGcb2ICjbjTA7KO9D43xYYLkkMCXxdo
         YIuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnI++u4S6nOxgjL3UTCu4rJKg4AVfcj1FeQkut/H4DTlddVrnxKwPTuGs3uVP5/hWymq7Dih0//SOTvzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mw4EVUXaEzXi3FMzKwt3NGsWkadSpSNDiLS1bzp+QF3tIaFCYN
	/CWhGvxVS4OmOcXPACxdklNo0x0/C4WVajs2tCLOezYKBp2GAjnmWIJ5sq1YRzkkJbwv
X-Gm-Gg: AYBFou0IgXqCnKGbdbedJqUkj7VEtNRx7HbpqyzuPiHwYMTFLqA0K4ypMeqaB2y6J7n
	u81rWbe9pOSzB19mWd5C+tFnfiZT3Ym0wSvV+94kec20VGCTkkTkItglNaaQ6/aeecCnRWiW4G4
	YztfjBNLS2ulZoRAvRetPCO0rBcykpqo6VpRc4MuNMTiJMnZHbX33Km7tcmO1eD/Sg8jUSVw2uW
	cTF9/9IsVC30q3SUMna2vc1PKtRz/0LFfuv9aLjfaI+W/BEmiIiFIzg3JCtFV5gptkM1BEGmK3V
	/yginXlf1EVIUPS6hYhTgW50pQXrkh3AMBscXHV+rbqH6RmewUCjwxRRPdzL2BCWbybtXfaX4Pk
	HmeolKzCPM2fTTWfpYS/1HjsNMVhLLA5KWTtDxp66hPx07VH51O3dgwgVQRTl4wL5PAt9aIRycO
	9DgRDctpkSXuzcL2OvWQgMeb/1qp3l7d4xPZaL1cPX38Ijpd4RouyRKJXfaeTyDTtbfrTADo0VO
	M5jS8wbe/teZiOEHZjyGeH3GfY1aMbD28fkBp0=
X-Received: by 2002:a05:690c:6c87:b0:861:a34b:7de6 with SMTP id 00721157ae682-88d1992ba59mr15916227b3.0.1789409401043;
        Mon, 14 Sep 2026 11:10:01 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88488856486sm39517817b3.37.2026.09.14.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:10:00 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: landlock: clarify TTY signal scoping
Date: Mon, 14 Sep 2026 14:09:46 -0400
Message-ID: <20260914180946.1462099-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914.b8a029f9abb8@gnoack.org>
References: <20260914.b8a029f9abb8@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LANDLOCK_SCOPE_SIGNAL mediates signal delivery when a sandboxed process
selects the recipient, including SIGIO through fowner.  It does not mediate
signals directed by the TTY layer to processes attached to a terminal in
response to terminal activity.  This distinction was clarified while
discussing TIOCSIG handling because the PTY master acts as a capability and
the signal recipients have attached to the terminal.

Document the TTY-driven signal paths which are outside the scope and advise
controlling access to the terminal or PTY master instead.  This records the
outcome of the RFC discussion and avoids implying that
LANDLOCK_SCOPE_SIGNAL covers every signal-delivery mechanism.

The documentation text and changelog were drafted with assistance from
Claude (claude-opus-4-8) and Codex (gpt-5.6-sol).

The userspace API documentation builds successfully with the kernel-pinned
Sphinx dependencies.  The remaining warnings are unrelated to the changed
Landlock text.

Link: https://lore.kernel.org/r/20260914.b8a029f9abb8@gnoack.org
Suggested-by: Günther Noack <gnoack@google.com>
Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---
 Documentation/userspace-api/landlock.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
index 84cb7bf6b3ed..64418b09840d 100644
--- a/Documentation/userspace-api/landlock.rst
+++ b/Documentation/userspace-api/landlock.rst
@@ -430,6 +430,21 @@ The operations which can be scoped are:
     This limits the sending of signals to target processes which run within the
     same or a nested Landlock domain.
 
+    This scope does not cover signals delivered by the TTY layer.  A process
+    holding a PTY master, or otherwise driving a terminal, can cause the TTY
+    driver to deliver signals to processes attached to that terminal across
+    Landlock domain boundaries.  This includes ``SIGINT``, ``SIGQUIT``, and
+    ``SIGTSTP`` via the ``TIOCSIG`` :manpage:`ioctl(2)` command or the
+    corresponding control characters.  The TTY layer may also deliver
+    ``SIGWINCH``, ``SIGHUP``, and ``SIGCONT``.
+
+    These signals originate from the TTY driver in response to terminal
+    activity rather than from a :manpage:`kill(2)`-style request.  They can
+    only reach processes attached to the terminal.  To restrict this
+    interaction, control possession of the PTY master and terminal attachment.
+    For example, do not pass a PTY master to a sandboxed process if its slave
+    has processes from outside the Landlock domain attached to it.
+
 ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
     This limits the set of abstract :manpage:`unix(7)` sockets to which we can
     :manpage:`connect(2)` to socket addresses which were created by a process in
-- 
2.55.0

