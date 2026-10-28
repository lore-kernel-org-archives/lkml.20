Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218070;
	b=whJzl/xDIXHQblBuQwU8GmbFFjsMh3O3Zc9CLcdVu2tE4RPdPE/mACVslc8oPVrx5q6x
	 Yu37FAVnHk3Hs+MgbG9De8tsuyhyCXUwNUbDsy0AnAkoPRxJkp8zXFOBIzcfjUNBjgj9M
	 Kz1LlgOV7wdG598/PJDR0zkiItrGr6LEGDbljIK0yzRM5KcJxdNUyWW1YDLttuYY1oAHp
	 vodutPrCOaDHOC73HGG62Ja0jabQxlgz7Nnfo5S8GAV2yDo0oPDt3hkxAHzUNRSalSwdH
	 W+Qpc327O6PaoaH3ILr+DI19JQNY0Yz1Ue/fFM2SgyMTiRMHU9LqTjQcYIMCi07h+Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EEE0S447H07G14c/bigmjxl8UhVSTm88YqU2YDdK8f8=;
	b=lkvw9gDXMIZwV7rsfa9MmNioJ2VGLC/UJcG5nng4ZljdopkoF2May8SgobTG6HjbI80Q
	 6KeJP+MlFSzAOBlXcEyTBtpgKtM+x6SM/VzUXRfx1Eg8BvcpElgfbXqHYGAXHw3ltG40J
	 9DoIsIDqHdQpT8R9rkR+wS8QfifIipuOWVwPufjXen7JPX6cd5T43T9YG8P+523b7Lb4G
	 LyHR5EZ/NW1Ztw95FrOFEYPuZCx9ljxlhRdiUpYeBMTMScvkuo3AGKuz0HcF2g+96Fi/e
	 eAIaGQ0enE20bN8M6l4DFfaa7cyuSkTyoWoRdzxQlEnf4GDBxoGf9WtAH5UJiSluL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goXdhqWT;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED4606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39ED4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goXdhqWT
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso1098082eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218069; x=1793822869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEE0S447H07G14c/bigmjxl8UhVSTm88YqU2YDdK8f8=;
        b=goXdhqWTJfd+CTvBoGYly7epv4whyvY5KBKcnA+aojnz5OiFwcUJ/q8yH2EYgGvAyr
         GtrBqukrRoYshE1yD4nuOJ94bVch748DtdVEiC0YzG3HJp2AHbNnE4vx+fvN2moDOxSh
         4sWijukY3j2XW8cJv7pBIA16WSnHO4y2v1BoNWAZH8/ZOWNZAjV2u8Rb/7V+87k0bMdy
         rEdjTJGhy9nZgNzp33c3AA6WHs4AR0ryEYoY6zjXWIGnkno4bFZCyKlCljhIGzgwlwea
         MxfZP4Vim86tSEYKG6GZuC2+Gqr7mEaZh0yPHPUgP8z3g21eFKBdNqrql+6UEc4kk1nr
         3k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218069; x=1793822869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EEE0S447H07G14c/bigmjxl8UhVSTm88YqU2YDdK8f8=;
        b=uXMV8TfjV5sPPS77rwm9AxxmWRChbmvB8C18e+y3UKi/w0uLZQWawBz4xgpyvJktLM
         kJHA5kHuKsw9Gu7rQSkd6x2MsMDVVWNoALm51K7dGDPY3QUc4cc0DzFRi9jR8c5uJPJw
         Uq/66Y2CReFHJ5PJmGjSUntLnii9inxuq++9DnAwetKmH75sOE8W0ZI5rAsw2DoeXzVu
         xTN37cyxGxqYKnyTH/VV6A3cneSi0mr0C3/j4OO5c7uk1PAC9EcoV+MdQ3qgyN2inyoE
         mYPxUdlchGoARJPAuiyjVVojvcZW0XD7NAp9vJDyhgfp/Dhn8ZJE9Zb0tiY/N6tfFfSw
         1w5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhKJm7QGmDFlwTxnDx9xy68RVheSNOwuD2fdJlxJ+9Ji9RkmbcX0LxzMMAtFSklQ29iHK5DSd2SLpoQwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4mWz4A//yHLHhHbfhuCk/KO4NcirP0Gz9fTFG1DUYKDt5t+ps
	1/LpUAH+K8E3bz5Rc8g4c2bJnHfjfHA7LdSn7kjASHrMsCmKu4MQBTAa
X-Gm-Gg: AYBFou2CcZGyXVOvt1dCRE0Rl9nwdG3mCz5YxfZ9PhxlvI0VBzdI3A3OeJZTGZjQ4XY
	PO7v6GSFr9P5slBUODEfiw4mXhDthPsrgK11K84lqtGBaR9tsD9W9S7TSWHMsWhUY6qYz32UJRC
	LOn7VV4Xb426oKomchGfihOU53QAhT+w1Ndp89Hlj2+P7tx9OdXdQM+cl8kE4th2H3+1ZcrG2tl
	f8YXWmhzop1t5b5l26L7iHAZvwo3/Kud+qv4SnGH8Or3ibY3XUqeimQmS67v+cDeDUr8tRqs6pJ
	W+3jzCTGYoNDa5J+9RH4RN86lpk6H3k9aIYy8Qt9oXWZue3vE7UeWToJ37baUKEntjAzx4zVdk2
	sGFROOyG9wr4LT3VRjRNKSTylHmPaqS6YEdCewRb9DHI9qK9RgFgNjsHq2Ijt2AmxMM6XDuLLmM
	TG1MEJLQT+WZWRkyBeMJuHqfHgDOmmWzZ4atmEJ2ty638U+iUdAzyp0tJe+3jT3V5M9bLD14GjC
	lnw2sXndcS13ZdTkRBVGRQIMznwfaVi/ALJ/PejbUUoxRa+Jr6VzIlQ5VZFN2FEpPAFXfyMu+BU
	syfJTAFVHfQKKTXzop02qhV0swQ7e3YMIIRxScApZufNUZxH2lGCxt/uTK0v5z3UyiZYiM4=
X-Received: by 2002:a05:6820:151b:b0:6f6:dac4:65e6 with SMTP id 006d021491bc7-713ee08ee78mr2343918eaf.41.1793218069336;
        Wed, 28 Oct 2026 13:07:49 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:48 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/3] tools/nolibc: fix fopen() with the "rb+", "wb+" and "ab+" modes
Date: Wed, 28 Oct 2026 15:07:42 -0500
Message-ID: <20261028200743.154151-3-danishkhateeb03@gmail.com>
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

The C standard allows the '+' of an update mode to come before or after
the 'b', so "rb+" means the same as "r+b". fopen() only looks for the
'+' right after the first character, so it opens a file read-only in
"rb+" mode, and write-only in "wb+" and "ab+" modes. Writing to such a
stream, or reading from it, then fails with EBADF.

Look for the '+' anywhere in the mode string.

Fixes: a009a0c6faa9 ("tools/nolibc: add fopen()")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
index 00a95a267d90..205b06f18b4b 100644
--- a/tools/include/nolibc/stdio.h
+++ b/tools/include/nolibc/stdio.h
@@ -75,7 +75,7 @@ FILE *fopen(const char *pathname, const char *mode)
 		SET_ERRNO(EINVAL); return NULL;
 	}
 
-	if (mode[1] == '+')
+	if (strchr(mode, '+'))
 		flags = (flags & ~(O_RDONLY | O_WRONLY)) | O_RDWR;
 
 	fd = open(pathname, flags, 0666);
-- 
2.56.0

