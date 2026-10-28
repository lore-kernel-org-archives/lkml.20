Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218069;
	b=cAiOH65gdZfCJgYTFMXdMYs6a/MfOSw3SXkw3hoAoJlaB3kzXzGjzBEA0wyJ06FcLJo6
	 cp29ym5f7M1gPq/jhz0pCeAJP7bn7QGWar4i/PxViYC9VNlV71cS+1SViTHC35xheOhuU
	 jeoNvrfsIPTClgEqvyquARklByBMy7RiVAORKATdE2Us3/zD4thmhuJTlFoeTcXrGJGLx
	 Ge7r0hx3VptDEpQseiXrG2p4WMHxNvoTwa1W/vQDBFx6vh4+dNDgMsepHJ1MrOXMl63rc
	 ZfciLrgDO0qXk4llPwuFb/arkvVzhKBtTMb/gbBrRFjPn4n4A4VGqoZwMDzfiqJh4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yU15C9lGWv33DmyhVTu5h/6S42IJzqFMS8tB7NUy6cw=;
	b=F1MWHwmM5l59dVb6fn6ALm2ezpjXy4J4pzo9cKJSM0RWOqLpw21TS8jkN5G95ZhNfBgE
	 Jz6zE3JeiSss8nS8ZLmJkardTqH6gkGt86VgAOdaFWa6LINrU7ZxFIG48JnID2lyLnst3
	 SIVUOzZSy4Qq7kMXZpdQ9j6dDOoKp9PPRkiRrb48Az7eT0+Y+sL0IBPwXV/Y04hC+wDkO
	 95m/yUycydg+lgDIY18Mm9JHhKNcM/4us3e6UwmO9zxr3P+1S44Q8h1ytp3fOhnSaJww5
	 7C7DpoXlueLm6SAKnz06lKecaHCXuAET5pQDRt1TaXvACTD9xDN2LcRtr4f3WykxKzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtHfr7qP;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B000B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtHfr7qP
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6dd059478dcso1072501eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218067; x=1793822867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yU15C9lGWv33DmyhVTu5h/6S42IJzqFMS8tB7NUy6cw=;
        b=YtHfr7qPjSYo96TVPgIMHoy8TBA2zUpb+VWu3s4l+GYonVMnKgWsOoiF2MHC7T5Aiu
         a8QeoYoB/RxiaqXFiAxtLlLym5Yh1X2BCJqzlz6Zxy1HAa71p84IBQLq6/U/hJ9XDIwz
         1RyC2Vz90wgp9orha9NteWCbpe/Bx9GndPp1lUyKYhz4W5d1b3fZ5DHyFROdd3TP209E
         Lr0RVF2c34MlgbcKiClhiInQkrAhesp0GTt42Zp6sVt5+DVmunNJ9xxusTlokYLkH0mQ
         fEglLI95ubsTdGN/s4Y6EqFYE0IEnuHJh01m50A9Egw+uegxkzSMJRe9x4q56xCV95CY
         beGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218067; x=1793822867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yU15C9lGWv33DmyhVTu5h/6S42IJzqFMS8tB7NUy6cw=;
        b=Ymv7xi+pdLcv7n1WJynklGh66Q9IYpHmAUwKtoxTwmEF8lc7iiKt7UOx5nVtKMXoLH
         jM/Uwf7uwLaqhdaXYwwaih/bVNqCvUbgBjo24BKTK35zUbcZDHCRKYy2v284YxWcBQ24
         eKsV0awg8FiGnu2l1EP/QsCaGwuWwI6uYTI+M3YNvnuf2+9DnosxvVKVnyoV53knX8/k
         iyelBiHhoCyBO+15E2BTEfkStJpUlEKtLeYKcg2M1cakIQMYj5O1d27ZPDYeyG5M6YG1
         IrDge5x5qE3aXYohszKL/5RD5Zzz5sR/H0SYD/nUpR2TFB16NPYfm5UF4RW7PVV9F3cI
         K73g==
X-Forwarded-Encrypted: i=1; AKwUvBxf/oeo/1+DSj5D7jS/I5AE4+MOVGd1we2KUIwuwyHzfzqU9OPyVTKwxFCvoc9pVC2ZBwCypomgX6dVCSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOfyKxLxYO2pnKKEw2u9yWqAvz8mSlZEgIwKPsV8b/ch1W2904
	Y44udpdP0j1anassDZe0OCwQAXsLozB8Ib/BltSrPzrzIpQTGRuFMx/o
X-Gm-Gg: AYBFou0jyX2VKflclYUkyTRhoAt7xU+KUSEGgKypfCzsZyXP1Q5hqkG/3OeQiwY9ihN
	3YJnAPtM/1KYv79aw5v9QMSa7TndzHWi7+DMMVgmURtp3znPi2RDqlAuqll6ngWVIwFr4E29ccP
	X9wyLCxdWl2msYNn4bg7Bv9O8x8Ctqn0Uuc11cNCva77k9bwd3DmDTrdts4g00Vjkeq+2GxwQbn
	JrRGkUtWyHu8604I9P5fkb+yFAA9rD/FBHXpeMaKW2GSkBX+F2MnG4P5FNzaduSD9zE4dGa+6cY
	t47/UI1s2dd4zEgDQpWGAxcX/UyDQ9zAVdNp/GFuSeYRvlOocznJVOh8FFw7CGBf9UOuJooSeUZ
	Q0SxOqeUZV6RKqo6VcChyeQ3hfw+5rrj8ZS2VVi53ZdBGFd94T/jKsxrB6OQs5o2xeRB+c5d5Ji
	YaFOvhQH5r95qWId6MXDmUAfIUzNpNjCCGFX2ZCGjS6WI1pgZ1jysR9UunfSPhL/ILAUN9BFXP5
	Rlk+BRNUJtAt/XQsaT7n6PshMdHGoqID2XniJRk68AlgRO9tcHEjdymAz2hP4mx/NPFkKF+Bnf6
	oAdMasGSrEvaImlDauwS/53bxvm7dGLpqg0cRA8bfm2kUfeXBNQljvzPZG1US5GLviSNs58=
X-Received: by 2002:a05:6820:828:b0:6c3:2390:c293 with SMTP id 006d021491bc7-713edca6654mr2114633eaf.32.1793218067584;
        Wed, 28 Oct 2026 13:07:47 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:47 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/3] tools/nolibc: fix fopen() errno when open() fails
Date: Wed, 28 Oct 2026 15:07:41 -0500
Message-ID: <20261028200743.154151-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028200743.154151-1-danishkhateeb03@gmail.com>
References: <20261028200743.154151-1-danishkhateeb03@gmail.com>
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

When open() fails, fopen() passes its -1 on to fdopen(), which sets
errno to EBADF and so overwrites the error from open(). A missing file
is reported as EBADF instead of ENOENT, and a file without permission as
EBADF instead of EACCES.

Return NULL as soon as open() fails, leaving its errno in place.

Fixes: a009a0c6faa9 ("tools/nolibc: add fopen()")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdio.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
index ebdd413d13ec..00a95a267d90 100644
--- a/tools/include/nolibc/stdio.h
+++ b/tools/include/nolibc/stdio.h
@@ -79,6 +79,9 @@ FILE *fopen(const char *pathname, const char *mode)
 		flags = (flags & ~(O_RDONLY | O_WRONLY)) | O_RDWR;
 
 	fd = open(pathname, flags, 0666);
+	if (fd < 0)
+		return NULL;
+
 	return fdopen(fd, mode);
 }
 
-- 
2.56.0

