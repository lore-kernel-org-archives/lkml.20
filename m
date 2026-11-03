Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699062;
	b=kz6CX0RS5AYao2jLpLlA6H58hYey93pdB5p4qh2YOSo24TPDgy8xcEadf7/qTHczZxLE
	 2KoXf7PESeTWFG/KaNbJStKGHU1eA7O5ohUjSkHHRz4oUM2TOQDs0cZcz1QGZVepDpMFc
	 ISyabWwOXfYCzSlC8pSzc0ZWY19tCY6TRIoX7+9jQ7/pi9nUy0OBIx8vkQLtK9nCU+9qU
	 PubbmRkY2hnq09W1ZEgcHrNp2Z/2DUIduHbRlvwDD0EAEEyc2JZlnOOX+sIDXVWd+xJsw
	 PgIbE71SxMFF3EOfaTOsQSUlcotwei7tW+ClxDuvWcVGVqdsQQFgmxh4CHKsexeJd6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
	b=CN5XIrg5qIPAAhGXKIrqaimsaUKBvATIgAXNoNu1wmlQHjWmfipbvH3pubMudXJZ0NHC
	 4Vc6mYehQJ+3n1imBDSgtQgg1GXgaHWQBddaJZZkchcgx3bhvz/3qsjGeN1fc7moH9Jsx
	 XX9V+HbsvwkZb5dO9SKt4Omlymub4w85gBVMPh5HHOrKRQmtsCdmaPtpQPM7LBF5XwKQN
	 id7Q5vAgNJyk+2RVBM5fYVFeQF/ZI7e7xYQvo5kP9W+njmoj+S1SVbyHp9Dh7QdsaZJFZ
	 1FpdkedRrjMr24lEsBu604kJ0m6kL0OwK99q+jq8gcMMYyX8OWx31CEHbUPd4nE/qpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DArpoPKf;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499D606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5499D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DArpoPKf
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b00aa033bso512336f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699061; x=1794303861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
        b=DArpoPKf5xoeQIv1aNscCTXIGhjfLj/yxs8DzuAyyrL0HLsOm5EbVJLNYVjNzVts5c
         bL+XE6S2CfIAJYsLXppv4W1u7AZEqdvT4Vad3h/JtSo+6E91VCwWwhBtQZjWPF94xel6
         UFqawneEUqW9T4M/muDJmMkJM8nox/12rz8QtfjJmvsYItg/cpJDGpBkH/Isaj2/E4QV
         HIa8mWqBVMcN9OFvEHW+LBBtiu30wU8ZRL3dTwbTI6aLfW8O9Poc/PtGdL0W2uivhdP7
         7S5kTZCOvHFxbPPKg3Jw6AIrrfRdWAj5eY9YeCJK142Lyp1e/Q3gMGNB2VOIMoJRZVoK
         yBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699061; x=1794303861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIolNKpjbc4RYfEkJstUlCqagpZzn46CDvq+iobq3B4=;
        b=BuVynX+iXc6eWqmKPiZzUqkUSfyGnV/KXWBu1wavxcdaVw+4r58yGJB5vtcUZ3pX9Z
         KLEreVQTETvxbOFbpUGvQoIDSvyztXeNX0RRaMRz7woFzYR0dKMASpWOm27ZOQwB2NLT
         EDm7FptjOzNHgzyL5QNBrAk+dMh68IaSk/iMWZaJnuGH8fCprljwy7jIj4VP5uu02m0K
         g2CRVqQ+1hD/QDzIuts8pEp/5fbd2Lq8Nj1NujuBGGeJejIB93VuxcU4tk3oPUG5hcNg
         ewDxiA1nzjjOPkU2dGrXj1e7ieRY+5n70iO3q8A+GtiiAon6gL9bFX6ylNVVJs7WwPba
         eXjg==
X-Forwarded-Encrypted: i=1; AKwUvBzEQPMOGfZlrSswtMQ1cwpBhk6pASZ5gkrShT7sMC77F0YLs73VsKgY7BYwE1aWYTwc4aKSfcCIemafq5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wzCld+Q83slg3mN3Fng+mJmoYtD1Glr8Wb/sB+0zR5azFUse+
	wRlNOLVZGMuP2xEcNjuoC34Te8AEMv6IUBKE6bJHeMAHZ13eOhHYdVjc
X-Gm-Gg: AYBFou1rmVCyvb6b+jPcOK8+E+chj22NtPgidQFmtwLOWSSO0DcQMBIC9nAlsEcIQ0h
	ZpgWsbuHQEicTM7Pckq3jeTpGSLkl2A4ZzDp1IPHWLaIQUmJbqTJV+17oJLYsBoMAGWvE9Iz7TI
	P6O2kEv9zSIiSvHxypHCnSMqdX1PLTnfuy2N6ywhd9BM/L9me688SKSOSgB/xVQAK0lwsYo3qbC
	AI/NDu3xcwBjPeOoY883n4URkwbSYWEhdjI4cQkAr6H30GiH0fGnr7lqV5uX3xOb+HGpcrpn6Ff
	hexTwIYoN3jFuGLTa3/8bub/cE7XW6pU7gMYE0ympjzHtlCUcNUbPRKPx27zMt7WRzhJtHyP21T
	jNuZAWalHRCEjvocrV+fPF8JWhKOA92bJNmCPp+czfGPkvzj+www9f5Waz0y61IN6uSrz6dloR1
	jwX6PBAk6RrSyrMA35EaBC/YICE0+YjiETv1jAFyvtu9213BAUrWROSrfh1R9QlRqLv/p/nIVKZ
	kNNwS8POm1P4tNvxqfAdf2aSVjj9SNRoZzRj2/S2MLcggTcBlIaAOr5stqZGNQpiL5HODYo59F5
	dm/2MlPWtVj0ZsgmVE40sgcb2MHBoqAoMGsRWpYhhDl9GRLT3R209l8bD5Cby5jrDaI0bA==
X-Received: by 2002:a05:6000:4006:b0:48e:28f2:64ea with SMTP id ffacd0b85a97d-48e6e30088amr33275987f8f.4.1793699060575;
        Tue, 03 Nov 2026 01:44:20 -0800 (PST)
Received: from HIT (92-247-231-33.spectrumnet.bg. [92.247.231.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm5226314f8f.5.2026.11.03.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:44:19 -0800 (PST)
From: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
To: miklos@szeredi.hu
Cc: corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
Subject: [PATCH] docs: fuse: fix typos in fuse-caches.rst
Date: Tue,  3 Nov 2026 11:44:07 +0200
Message-ID: <20261103094407.912-1-slavik.a.shevchuk@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.1
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

Fix two misspellings of "successfully" and change "then next time"
to "the next time".

The misspellings were found with the help of an AI coding assistant
(Claude Opus 5.5) by grepping Documentation/ for the entries in
scripts/spelling.txt.

Signed-off-by: Viacheslav Shevchuk <slavik.a.shevchuk@gmail.com>
---
 Documentation/filesystems/fuse/fuse-caches.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
index 0778dd3d..d19592c6 100644
--- a/Documentation/filesystems/fuse/fuse-caches.rst
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -156,11 +156,11 @@ in several occasions:
 
 - When a new file system object is created (e.g. ``FUSE_CREATE``,
   ``FUSE_MKDIR``, etc).
-- When a lookup is sucessfully performed.
-- When a dentry is sucessfully revalidated (``->d_revalidate()``).
+- When a lookup is successfully performed.
+- When a dentry is successfully revalidated (``->d_revalidate()``).
 
 A dentry expiry time can be set to 0, indicating that it is stale. This means
-that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
+that a ``FUSE_LOOKUP`` will be sent to user-space the next time it needs to be
 looked up. It can be set to 0 in several occasions:
 
 - When the user-space FUSE server explicitly requests a dentry to be invalidated
-- 
2.56.0.windows.1

