Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C004756D3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394019; cv=none; b=YcafAJC6sGbzdUdCvjE/9mgyJvKlxDoIKw27ltf6skp40t12iFtro6Vf6IIYwSFZCYmtKXLoQbPYsrj207KzIyZpxuBUQB1868G6O/GyvtEV2AzEZLDl9FkgXpAS6f/p0yxDObTlbd9oVUP3DVf7sw5zm7TuG0sc6Jd1QjihSi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394019; c=relaxed/simple;
	bh=BEDapZrL6/hvvO2kXpOejmvG4ExYC83wI5Wnd+3+Nx4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KIZ6gIzu6EpEo8hdIXDHTJPMq8QIUPXMaGG7LezdNvgemgzvuItTXJB+aPCaR+fczJdcBkU3onKVJlhEBzkf0N5qsnPVbqRaJrsgD1cWGIfYtMOzrsn/e9z414LriS7JfEU25vtNPzi/A9b52gFXKap2FlTG2r3rdRbwHeQgMWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X9VYh8mG; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X9VYh8mG"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a35a64530bso18695521fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789394015; x=1789998815; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dBgWHSwhYz2Q4YLyQIKrQwL4mQeJ8ts96wvrrquXsvI=;
        b=X9VYh8mG+g9Y/RJ4/6w9KieHLcPziaHyhafmXhleClFZq7w9lUJ2r2Zd8TwwxOXxWD
         g04FTp4sssxf+XhAoGPHZ5VwSAzCdcvmV7PKA0EmGVQJKxO6nztD+ejViepnK4+h3pud
         hYwoeq1eEILuDndIKOz80LonoQPkGuq+U8ipA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394015; x=1789998815;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dBgWHSwhYz2Q4YLyQIKrQwL4mQeJ8ts96wvrrquXsvI=;
        b=FBJVtqLcVhFQyYECISneWxKIbwCsm8QeVo8qvTOYv0ZMo5mhaH5V3MDvh19ygRIZJh
         kkNUC4ObK49LraHb8WZz0YyRMCGwwo/tIBN8w5H/lsMvzIECqSCcnHPMEHcEKmk3i1f0
         iiBJZ5uiHMRSNCqzyGppF6fs5ZnMSayGGdTxIINvvLrdNJ+TPlvh8QhQzVQlDWyqY/sE
         G1ljSciTr7wPLoffsJILBWHw6xyBuzu1v2KiHgCDaOVdaO6sOmFpdCDoK/ZUNzi3Q5T5
         Y79hKTqyAsZVJV5iezx/VTqnD4oqPJQen7dw9qemoFng5EJx4jFgSQ7QBL/jVlsUA77k
         k/+g==
X-Forwarded-Encrypted: i=1; AKwUvBzhO3tPjA+oCGWJulGLomMIFPn/bjXYKp82Y9qIQlOM0nrRty/Sf3dHUEu1kOHKVftYpFfZ8Y2d9x6InRA=@vger.kernel.org
X-Gm-Message-State: AFuF++keiHzbHFJxXhbnfZmU/2k/+akomm4lFWr3c2+BHQJeZ1l2gj5a
	SsI1St/N/5k/uNtvTc1t1gpgAvtSk5pZarlIav0BFg17Qi/Kqm5StGKmTE8LIW2JZ9+hZHKzwnn
	HjHfMqQ==
X-Gm-Gg: AYBFou2T5eMIRtdlj//WTUfgpxKdSarc5gkFoo5Om0uboncimRzgO0Tu002xG3lG9jR
	Jwg0OTfQOmEhd0abIzA0GR5Bxo2qvd8FuzaLpD0TN0sQlnQaybnT2NblpX2o+nJlLML8M9amM1s
	xCtl5SnpztL8maTwt8x0bTYBWS98E1E2f1R0C6moCqFVURIAvtmT08cqTOQLsaRBp7WFR8WMSEr
	BM8SLT0YugF9nr0V5tr0v1bwr9ndLquP1UL9nN158Ne/6RUi087GYTy2jlJlCVK06L2sUEPX7Dx
	v+V2gYru2YR0/uc060NL6tppl3iODubKJCapjEizJWuNM3ZfcAtvjpwjjGi/X5EfBpQtt3kVHGP
	NxYs5TIVId59YKJcSyp3MFZ77i3cMuNAj7GR/Uhavld7gWNsB1C0Xa2AucBmYWrz+Q+HNLCc1r0
	0aJXFY6ccRvBJ/ccAImAUg9QXV9ISRvW1bqQJhgctT9CoudfN16309jOS+Nw12QvRAo8WUTwIwM
	RBgFG6r2gFz2rWbTMQL1A7NWLEk+NSJqYACL957KJsMqCjIfw==
X-Received: by 2002:a05:651c:19a9:b0:3a3:115d:daf0 with SMTP id 38308e7fff4ca-3a5c885b96bmr4384971fa.6.1789394014811;
        Mon, 14 Sep 2026 06:53:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3304b38sm29433921fa.13.2026.09.14.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:53:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] Fix warnings with recent smatch
Date: Mon, 14 Sep 2026 13:53:30 +0000
Message-Id: <20260914-unqual-v2-0-60a1407a0cd4@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFr8p2oC/2XMQQ6DIBCF4auYWZcGCFbtqvdoXKgMMkkVC4W0M
 dy91G2X/8vLt0NATxjgWu3gMVEgt5aQpwomO6wzMtKlQXJ54a2sWVyfcXgwWesOsVFGCw7lvHk
 09D6ge1/aUng5/zncJH7rH5EE46zhUpmxFaMy3W2y3i0Ul7PzM/Q55y9C65KunwAAAA==
X-Change-ID: 20260825-unqual-25d9ee74fd10
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Chris Li <sparse@chrisli.org>, Dan Carpenter <error27@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, rcu@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sparse@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Recent versions of smatch preserve the address space qualifiers while
running typeof() [1]. This has triggered tens of new sparse warnings in
media-ci.

This series takes care of them following Dan's suggestion [2].

[1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f
[2] https://lore.kernel.org/all/CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com/

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add TYPEOF_NO_ADDRESS_SPACE() in compiler.h
- x86: improve changelog
- Link to v1: https://lore.kernel.org/r/20260825-unqual-v1-0-7024fb81b4f9@chromium.org

---
Ricardo Ribalda (2):
      rcu: Drop the address space qualifier from the dereference macros
      x86/uaccess: Drop the address space qualifier from put_user()

 arch/x86/include/asm/uaccess.h |  4 ++--
 include/linux/compiler.h       | 17 +++++++++++++++++
 include/linux/rcupdate.h       | 10 +++++-----
 3 files changed, 24 insertions(+), 7 deletions(-)
---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260825-unqual-25d9ee74fd10

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

