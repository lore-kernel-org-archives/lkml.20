Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709081;
	b=mKS1/bvFrToAW7/HruEs9bk4Ufsqa1VUJzWiz3hfEHn4Aa3bnIz1bV1gFVBfos2Aobzt
	 XT0v0su2rKAj7P/WEgYDRIxJ+qgzNQtz97HwLMBaQlZFvDWyg1rp/Af1CLa6Z8ujTT5nD
	 AF2NZjBRIwAqW3aylE81PHosWVzaxDD8zDstF2W3PttyGoacV4qogIgYckVnFcze1IUnd
	 XldEN0TuM7khbfKN0/xF6DZb4844ojMu9Is7yIApMBGMdxDf8GOS3MCgR1nM2McF8l6S/
	 Z9JWdBZEN4OWj1HOFhHR4+dLpy13JwEAy3Z3qd/4X/HsMnaQvi3cIIbpBwJL5oDxjDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMk2f/fqCAvSxJVDBmT7g9JYmbYmFWnKJP7u8qwul4w=;
	b=JwEFJDui0ec7V7kITm7YcvIY4hymNwwbJ5onX/MUYbreJzjr7g1ph3Sg3sbOJ9ah/Po4
	 07lDPjaIuKP1OdEzacwzIg6SGPw8BMOTBIIB4KE8kounwK8y1X8B4bv1YH8grQZ7kdJsY
	 rt0PDMfDZBeY2beZn1467JfpQQVahbalAGiGAFApTub7Iykeytt+AynSBLYiMXUWJi8HY
	 Re+We/Cb9U3JBmzNqqDs57iRuUc+VZ9BZ0vpMuJhrhAlx7AHguWsq7g2EKNScmkY+WfRf
	 P1BTJUUWKvd0BbXo2RccvNzwkq1uBcDbyaS0WOmINKwSTiuju3GyOlXYS5e3ErppCOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lknqSoyM;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8960A2609
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE8960A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lknqSoyM
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso125492a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709080; x=1793313880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMk2f/fqCAvSxJVDBmT7g9JYmbYmFWnKJP7u8qwul4w=;
        b=lknqSoyMqx7M5JzkCB0hI//vEdyeFjOV/snJIk7rjc22ubicY9wEfQPg4UxeobKwNk
         17DJY29vRyF4sxAEDtcnN4xiOZUToZTaNmc+FmUPBNFPCwU+Ru4U75gkQdneRkd5tT4P
         /7iDRPnXc8VWTsWI3JlgwPm+nkjWP4FPwcRLjXZj4Vy+thDsyk5P34mln8H/b0xOG3r7
         2VJ2owrmo+EEft3dKUxx6Z0EDBQHaEyR7vC2gv/USn7wIcZmmNC0tHdYbmpuTBPkkaDx
         DIJMg1c19qBNK+rkawAOu3/MIeqgpQFPqa2xctX1EywvDrdHPNThXztui8qHSQFUz5Jl
         M3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709080; x=1793313880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMk2f/fqCAvSxJVDBmT7g9JYmbYmFWnKJP7u8qwul4w=;
        b=uYckPMYQ0zaNHOG/cUsKlKacukbnR85uAAOXsGrwXnuQvDDIdwHoAl/vLxjsWV8dqY
         ZeARTm7AD2mLHFefsNGv3WNKuo/aGNVy9AOYL2bmH2REnu0VVa2sGBTPDjIGygqBu/9G
         /C/qS0MUlb/7PROXScwxIdXqj3nS56aqe98Gr2qHAjS18HYdb/SaLHo04B9OaSVKsEHo
         XzSV8UeCDQ9U4msVx+IyA0ppbSx+ZfZBaSAKcikrJWwVIN+OOjgNXxuhUBKe7aSr0qdc
         pH89mQK9vfx6gxmMrBW5Z8p0CDwQsKyZtmrW/Vj3f5U/VHOmiV1buhp5uq8v2zedl/SV
         xfIg==
X-Forwarded-Encrypted: i=1; AKwUvBwJLfYgTtZ4VoX8/pZfNdgAjwcSdPUja1DMjXdmVwepDDQp1DwnE6Vo/kCSN1R7Z+SQnd/MLlXRXMTmv7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmVi2BSHrzdXKaqVyDRYApKbkMbBUvxISMW0Z1iYbLI+DtiYzt
	GTQxcpvtAqj3REwC4I9RykWsuLbRqsws593GXGkDIv8X+1qePx7uVWxn
X-Gm-Gg: AYBFou1Q0sNd8wC0fTLHbILAkm1a121ozxT1xg5h5XE/NvyKQaJ1uWrJTSOzihLmalx
	ugJbuyeVNL9Q6e5pg3GRcvTuyFOdmjVLm6BS9F17VENklGcI616wsxpHBEw0GMwP+P6gP5gUYpZ
	2DJd5aRYGVbT5vrtqhf9vesmNDtce4lgg2DN+1ps+vi4oqmMReP3GBvl2raHDbLk57Q3yaRZDmg
	aJiVsp1zdhoopTjiyU0coPyGmY2QWANJUUqt5nTElS8Shdm1D84qY7eIyAkdAgKzI2wjYUeEprp
	24yU2Pdk72dYbTw6cxDjGsHOETyuSoqoZ/qN0zFXIJajMfO/lUdshpPhm4hvaBFJwgExSSnBbBV
	eTvEdG9SHJRmp9HGqDKIXRnyB1PdT8GOcOcaYVdHLXN5OtXb5QCP5J6fCL0iheNg6d8ly/9cYNE
	XCtkOeqlQr5s1MYAWDAFbIL9jIsP1ChkRGZssOHSJXlU2BfCt+PduRFsrMb7oib0TG66H1+wd+T
	Dd5R9KIWEtZ4xApTb+G8Y9ZafCKAF692VWfuj2D+qKrA9fNjZPdoA==
X-Received: by 2002:a05:6a21:7812:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e3766f2f79mr215409637.68.1792709080029;
        Thu, 22 Oct 2026 15:44:40 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:39 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
To: Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kir Kolyshkin <kolyshkin@gmail.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] checkpatch: don't warn about BUG() in userspace code
Date: Thu, 22 Oct 2026 15:44:22 -0700
Message-ID: <20261022224426.2756960-4-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022224426.2756960-1-kolyshkin@gmail.com>
References: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

The AVOID_BUG check says "Do not crash the kernel unless it is absolutely
unavoidable". This makes no sense for userspace code under tools/, where
BUG() and BUG_ON() are assert-like helpers provided by the kernel API
shims (e.g. in tools/testing/radix-tree), and crashing a test program on
an unexpected condition is fine.

Use is_userspace() to skip the check for such files.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a97d5748878b..be0e0493d4a2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4924,8 +4924,9 @@ sub process {
 			}
 		}
 
-# do not use BUG() or variants
-		if ($line =~ /\b(?!AA_|BUILD_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
+# do not use BUG() or variants (does not apply to userspace)
+		if (!is_userspace($realfile) &&
+		    $line =~ /\b(?!AA_|BUILD_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
 			my $msg_level = \&WARN;
 			$msg_level = \&CHK if ($file);
 			&{$msg_level}("AVOID_BUG",
-- 
2.56.0

