Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF89A31618C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404046; cv=none; b=FNXLmPgT5VDkV7QAj8vat7L3uh1LCcW4c0A2y1BYl8bjqHU6nccHCHkxmNL7P//ssqde08MSOCOIMcJD6Yi00YLfTMT7SPYhGWkgGUQekwEEaLzQ9VKEzY9gRaIxXJNyXOcbscGfA/rU0RA9A+VvyNPyiGXfXNMqZ/Ay6nB045k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404046; c=relaxed/simple;
	bh=aiHnBTzn4LSsZgBjJK6hlwcyNiRzkQ8Jvxhrngb3+7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4ERl/oot/DfmN8fmJR4FThKEfPbdV416ySUo6VIBlOXWgqkzjZgOQQibZBTmdM5/zGEsW/7/HN/FbC0RFgbQ1hTWsc43Kxs3kZ5uqV4JppfXPx+gxCB2Izb551lxxCIZAdaUhCOgknAZiSbGEAEr1Gt36YUAd11KW8lz/PVlhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kxjjsn1A; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kxjjsn1A"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4af173320f9so1276553b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404043; x=1789008843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OjDl1z3rUoDmRCi/Ls7KLepbD5M0zU+LwTLRi8pr4mk=;
        b=Kxjjsn1Ae5oX9dujUugcpi2IY9t9pAt1M/LDC5jOHhAZmRkoxVhNUTyCj6JS5Vgdt4
         zFfqkOK4BrH5vAS49ZOnHvaFMVNcTmQDcL2m9P2hEidU91+NdW6ktpz8ygQmvqXZ4dNl
         0KSMCV6Ug+lIxjxpRHrsHM9BxtlWE6tgCydvdR6zpCP6lPOnVpjqtmBZ/A/3JEfJw6aO
         SNGHs65OskFfLbUT7j41uyjweeocu8sO45B/qWpZJHA+EgBSp9XiH3O7jCaA6JdVYB89
         zLc3sDEhXXCFrsQH56MYxvfw1OIlZ+s1/p/GnQQJb46Trh71bZKLxvuHqClb1EhjxQ61
         Mqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404043; x=1789008843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjDl1z3rUoDmRCi/Ls7KLepbD5M0zU+LwTLRi8pr4mk=;
        b=Eg2OsmB2JLn9YFNtFgdlg8B6HbfkVhjC3PpCHbVDAh67/FNodG44rktHKTmJjrWn60
         rERAWlRKSPMhIF36VgLZgzkCmyBPtPpp1dix6UPi/tD5t+8mBizEKjjDE0aHBw/+yylf
         sSUFUY5F8M8u1EOy4P9Ad8sBtjNzUBNI9z7fr3ERS9yf6xMAF3/XBvwe5XokqTrgZNDv
         yBxRc+Jd9BwLPTLm6FxKpzT8xtEdR+aYowLpCCdWMrMZknQPmaKfiG070DP2KK7vbnZg
         dDMzkcOjLgjqlL0hMfPz829vHMM/psf4SKtxfk329McBFn0LvKV5+HUBwj6Fa0g2RFWp
         6tZQ==
X-Gm-Message-State: AFuF++ntlZcoC899lqyB/La7ZgiLrms5OkBMTaDGBIOgkZO+OaWLxBvw
	PmguEZwdyHnST6PuUdvClIpStUhCk6iVOyee2Tm+GGhcCc056Scjinvv
X-Gm-Gg: AYBFou0wmV7DUeU+D+m/rCcsnF+8aN9jWF8fsoR3O1AWBMIwrVe4gZLYlIIJtSySOEy
	ga5Y4Syi3Kgn88do08fU0Q4pAa/l0S78AkQjtY/N5ndHQ6kLgRA5F6EpuLinwoO994rrR7b+Pbn
	KoDiaO+JCyQVRSWDZIoPECPis0ohFPMHL47yi7EQD2LukyiFyU+7S98mKi71gSGjuMEwMg3ojb+
	iuC+7/sVktnmF4VWwt6A6rCvbaY9BHEiqj06PnDlLhSc1hPuYS9MWSbglBbtGBQWT3Uy2bJSeDY
	BLjpnsxKiFz7wu/1zKXwJSyGxhmiAWjV1aI2hVdT24aTWJxXxxiW52Z1CMR6XpFxc6WWBnfDi7F
	Ps6EkZsSjvtg+BChhO62xKsVmeh5Q8jxJ7OP2lPhjQVykEo1t6i/c/4Y4gts3NXBLILDUy5WsJX
	dVVUQw0t6iwmeFSaT5+2B1CWWZ/ara6plDYMIg4MQy31p5a3N3QNjlzCrO0kRRYtVQbvTVFCPJN
	Q==
X-Received: by 2002:a05:6808:4483:b0:4a4:933:b20f with SMTP id 5614622812f47-4b6bcd86805mr8728713b6e.7.1788404043512;
        Wed, 02 Sep 2026 19:54:03 -0700 (PDT)
Received: from cachyos-x8664 ([177.245.224.138])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b69b820671sm3477672b6e.15.2026.09.02.19.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:54:02 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org
Subject: [PATCH] Documentation: arm: nwfpe: update stale document references
Date: Wed,  2 Sep 2026 20:53:34 -0600
Message-ID: <20260903025334.44666-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetWinder FPE introduction still refers to README.FPE and TODO,
which were renamed to netwinder-fpe.rst and todo.rst when the
documentation was converted to reStructuredText.

Replace the stale filenames with links to the current documents and fix
the accompanying grammar.

Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 Documentation/arch/arm/nwfpe/nwfpe.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm/nwfpe/nwfpe.rst b/Documentation/arch/arm/nwfpe/nwfpe.rst
index 35cd90dacbff..b6ef46ff0f4a 100644
--- a/Documentation/arch/arm/nwfpe/nwfpe.rst
+++ b/Documentation/arch/arm/nwfpe/nwfpe.rst
@@ -33,9 +33,9 @@ double precision and extended double precision formats.  The port of
 SoftFloat to the ARM was done by Phil Blundell, based on an earlier
 port of SoftFloat version 1 by Neil Carson for NetBSD/arm32.
 
-The file README.FPE contains a description of what has been implemented
-so far in the emulator.  The file TODO contains a information on what
-remains to be done, and other ideas for the emulator.
+The :doc:`netwinder-fpe` document contains a description of what has been
+implemented so far in the emulator.  The :doc:`todo` document contains
+information on what remains to be done, and other ideas for the emulator.
 
 Bug reports, comments, suggestions should be directed to me at
 <scottb@netwinder.org>.  General reports of "this program doesn't
-- 
2.55.0

