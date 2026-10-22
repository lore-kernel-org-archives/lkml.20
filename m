Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709080;
	b=5eUKeeP3wUXuc3Sk1OCqNTWS0B03FGIda/GeJyzHLV59+y5BB3K+LXYyaxpikLWER4en
	 EGB6b7v5h+bWonj3NQpMSGIkqzBOasPy9rzCFhAB80sNfxT6nC78Ipjz3PYoES8XaTddl
	 wmAwOt/e4waKkXQcNjGphr5KsRyXtaPKlYdffFWdUMrIpcF84SnThyM0N1LcYUlFfFv+l
	 jxaBDREH4s2hwbXbpBR8h3rCXyc7a+JRNyseuJI8I4OOoYpcQ5xRQxo0WOmXJapSv9vmZ
	 YmPx8otXEq5v75WjGJymX6wztSfRgfSGUHegH6BCp/RbdtAJMUx0PnNGj64X4J0/Z/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WaR5sww3EdstGojqnpbDRs5qtuJp8C5vVRJRCE8Xo6U=;
	b=iqf6xiZPAAbCLN5eF7WQ/iQ01tLs1Y76WjgQO9t03r8OtCPwwuP+FjyvN+BVXDtTW+VO
	 JD5CAxtqwhn0pGdiRjRRdoq5zssTcELLY0pvPbkGxjxqzq5h04gubepY/6UCtr4VTlxd8
	 jy7d3uUErO9emj97aGwsg7gdNim/Mfw0Owzfiec88ygBsT/S6E4X9BJPnuz3AXGLhEY7+
	 IGuhmQh4eOlBx4BDtgbGCXDOJ3GObWsCjdgBjpm3l0nL18hOPyrzosWYF8dyy1us+cmcL
	 OTvhOO9sXXc9oXgCAX/01209JzmcH+H+QzPaJmMlDx3KHJKXQ8HGpEe6XIkByr3gK5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIYFGTAg;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90889606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90889606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIYFGTAg
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so193766a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709079; x=1793313879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaR5sww3EdstGojqnpbDRs5qtuJp8C5vVRJRCE8Xo6U=;
        b=tIYFGTAgPjNmIHVHpzpmsvyQ+qAMZvm5eG2GjYs4khb9zIV0fb+v8BwTiS/lo7Mime
         +x66I26Uu9aO0Mpv5VZyMAE2JV1U/1mduP8ejsTqTcrwrbaCWrUyjnajCaC4f07FQaoQ
         y20GTHFtlUmgOU1npmb2HzYOUd2S/U9YfAN0HozRaIYz3KR0qlAuSGTC4I98gyELiTET
         vV1w5X7G1reBLSOms45zLtj0vOG4OZhPA6c7JP6qGL2I8nbjhkknKNL1+dttX9oTO9Mr
         ymKW8CZNV7rpSBmplsM+lQNboKOwfXiA8cb0dXncggyfy/sMElWJZFv80uYI62Qkkk1F
         H8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709079; x=1793313879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaR5sww3EdstGojqnpbDRs5qtuJp8C5vVRJRCE8Xo6U=;
        b=rEXPzm4TPsbdZ/W+8cln1WvktXg+3z4EBY/hTqW9VOh7uEApKRNQhK12aGitBgfZ6Q
         Hp/6CxayoKJcIytOBERpZaiv53IAD+4hCqsvCtHpQ+PS4IsmlTc/vXUa12YnG0QVDECu
         wQzTSStkuOBj89op+lRggug72y4JyntkKSPYSOK3fFY2aW1rvZ9UbeaQ1+p31x2xObLC
         +Qx+puEfiX4DvNiDLmVtwhOzUktuDo+Tyn6JAKEIbsJOUfjiiU7/ah64pVjvrbtHT9Wu
         cmmyxTsiJQjk9lykTh99wC0YB1pFF00rhzZ5q/dXWeV3eDun0ZD2gMH0vueZP3mVNhvj
         J9xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbXnliHIVf/jvf3vzjzVEcRknZsbHH6Et4HhP1WoqkbB52bkkU+041VXlb/qRoggTULpLRo0lVaYbF7X4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI3J0fe6DpE/RZo59os08olAnAhS+1+F0mlqZ4mmvjGjEPxM1A
	MdnMn0abCYGEhVidWee9+pQ5WIqneHiwsLfEDQ4lpmzUgDI85/5JlNWa
X-Gm-Gg: AYBFou0ufLPBNh+yHibWrgJA8NSw9WvyDEZtW6Cgjdp20/uOt8SiS9B5KiHkr6A48Gy
	IQjPueYuN1tjl+Z6CpWz6gvT43P9zrgYhvmPqkWj9+4Jc0uY37aHw8N1375mruMgD9jrTbi2jm+
	1SNKVr6SnN2h/F0CVepJuVvCSn6vaUX8Z8zt2PqDK3LSHBG/Y9wUUGwu9QqMFxTg70FEAGHT+gs
	G0h7hmhEzMkxhXnpGmheP9zOCZhWN+jm7WiraZBfWMubcP279KyHuq7mE9JYDP4Mda76AYM5kSj
	S18MZr32ev0UHiduEAm7kw/fnWv+qdaT3P7xI1Jo2DZzbcEiT5VeKqAYd0tx5uznJoeNyOlyZ0J
	X5B6oCEopsFKnKT4YtnnsGdKL+WuEmRNL40HrT2DTR122fJ9k1/FDXQAvl1dLXZbRvO52bj+L/s
	w0nF0jt8PXk0hAZMGxKXrA6sOTsN4tCHwo5KbmAIli+326mGFIe7QwYKc2qO3EXhLEBUv+1vNnQ
	7z5/1MsFYDd2T2Jc98rqn8vfnBjMYv4KXQeHRYMes+/oJTheNhxPw==
X-Received: by 2002:a17:90b:2e86:b0:3ac:9706:7735 with SMTP id 98e67ed59e1d1-3adce0d0ca8mr270746a91.5.1792709078853;
        Thu, 22 Oct 2026 15:44:38 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:38 -0700 (PDT)
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
Subject: [PATCH 2/4] checkpatch: don't warn about ENOSYS in userspace code
Date: Thu, 22 Oct 2026 15:44:21 -0700
Message-ID: <20261022224426.2756960-3-kolyshkin@gmail.com>
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

The ENOSYS check enforces a kernel ABI rule: the kernel must only return
-ENOSYS for an invalid syscall number. It makes no sense for userspace
code under tools/, where ENOSYS is a regular "Function not implemented"
error, and checking for errno == ENOSYS is the standard way to detect
that a syscall is not available (e.g. to skip a selftest on an older
kernel). There, the warning is always a false positive.

Use the existing is_userspace() helper to skip the check for such files.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f9a46d809ae..a97d5748878b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4985,7 +4985,7 @@ sub process {
 # ENOSYS means "bad syscall nr" and nothing else.  This will have a small
 # number of false positives, but assembly files are not checked, so at
 # least the arch entry code will not trigger this warning.
-		if ($line =~ /\bENOSYS\b/) {
+		if ($line =~ /\bENOSYS\b/ && !is_userspace($realfile)) {
 			WARN("ENOSYS",
 			     "ENOSYS means 'invalid syscall nr' and nothing else\n" . $herecurr);
 		}
-- 
2.56.0

