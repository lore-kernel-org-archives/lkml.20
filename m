Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698B4FB9B5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370969; cv=none; b=c/GlvakCs4ICpa9CjXUX3WjfBkmmOXp66MJ/R14oprp71ocXAoMnSaloPi6T8dnaN6izINhZtyrHCINQt/HVqCGAiR41FgRPgD7fXxLbtSvnAcZAeKoiO6WSKSG085ewsS5Xp9r7JupiIiZk7p/rib8YxCq03V3KapcAMVjihlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370969; c=relaxed/simple;
	bh=FOgGHwMNVv7MDQRWm8PMQdcyvauGb9qPaca/j6c2+2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cejNtfEziqesNOJsjnHg4gpVSalF0v+jPGZjmEtzVK2k1I64miceWOW+5VLffTc0WpbFxc3vdor2OBCTN8PHHwTEcXolnvk7+vjHr10SsDh/wAYinBoxA9iRYoI0FAZK8gRr0LFqXATU/Bd8RaQUzg66zn8+h1FVvHS+BD6sDQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJzZmoBw; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJzZmoBw"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bb359e6878so646710b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370966; x=1790975766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0wPevywQ4L6aM+vJB6sNB98D8zol2vthwx/ONSkXJE=;
        b=AJzZmoBwbZvFngn2UWptjxQ3zcVcUXL2C2hG6nZlnl2ghmGwY9FoKAwkaLKYy2+kET
         jUX9RYUe76uKp4sIC6AvzVZL78EPWdbaOXMqfB800qCduqviINXmqD/wb5ztkljupxzP
         6pufL8Jk9sErw/AaDRmTfbi3dNMCMZH8Mo+cQyHvgePhTRapbS+fxObJFTrEs+CV6vbb
         nBqFoFWlQDqm+CLZqW5xqT9u4PubqILjx0pcar3K7XWN0kc0OswJkOkAENe51zji6YSJ
         0fnVyjqnr9o49vdHpt+skVJPwHuiaaf0LhRrR48O6Y8Ml7arxxRFGTnKvl6F84hwrhcf
         EHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370966; x=1790975766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0wPevywQ4L6aM+vJB6sNB98D8zol2vthwx/ONSkXJE=;
        b=OGcr+WLnh/RXWSOQI2H/LwveprwoA9LQCbHfCP90+aK2S/7wV3aV9eWcr36bTZe5DR
         6T6l1/v2jZqyl9iXUfWdhMb57JYxsZ7eDkykpQe4X4PpcgPdUWaKzyxtBgvOGFIuRtYy
         N5C8wLfpgLsE9jQdsmEV3sXg1ge1xNQsgH8X/39cDhaP6dskV7kHGhr22wnNhOcvKUZa
         nsubIPVaj9i3H9mdQYE/XdPKuY39JzWveViM2sc/8FSIhRrL5apV3mD+kktojv/DxOb1
         9d24mUXXynYCDUGmOsrgMJsnLOiaDu2+jhu6UnnSMc/4wqNq1yTLYxpSxb0to6g3mlGX
         wGWA==
X-Forwarded-Encrypted: i=1; AKwUvByZg6SEwXEFWSX+djC4d/CCvQE+PjB2J5hL4cJupGgJllchoUvUdFY7L2vrBDYCj6VrOuJr0jchAh2gAe8=@vger.kernel.org
X-Gm-Message-State: AFuF++no5ylF8tm5+UzT/2Dqm5S0qk9H98o/fvSY3I730jsE9+tlJ9G/
	s7hfjsq4zvbBy5/UWi5gXR1vuJjKAOyMUV6BIjNX4wBqOEil9G2i6rl8
X-Gm-Gg: AYBFou0CRUyRvlpC3Da9M+eiJ0PJBQflcMrYS8UTJkq/EPMqOtvp5Om9lMTNRRUIo7n
	GS3cZRuuDxCA/tV9Umzhqbm044slAaxHGSrjaAw4EM067X/uQ80vbu6OKiGvUKATVP5ClCKpAG7
	bZZu6XS3d9N1iofGwR2OlKABJ5YxyxBxf22YnwWLtieFdzQZWN0Q70Yly34W0nyqQs+Y8MEduJb
	0JraQuB1m12z7q+EkmDvGxECrueZETsu9HdeWApSuBT5UnmetRNaXGugoFDccQvHBr1wmyINQhX
	BRJl82osAQNzEPihy3kOJA+WSK4ihAocL0OmruZaepnQxjzatPJeuOHXi+pTPeTtdq8uRS/15/Y
	Bn/K6chjMExvYfIc55Fd43SFOyCzO4mT8+4001uCYm6aZZrmPfZi5nq3GKdJmOm0BNJ25AjUgR/
	nv1j3UtyLlkDUxr7y3voXFP4yLL8N9fMzx306MiKqdy9WgLMrAe+DPiS21aYw98y3ThtGbHjHg7
	UCUUjCej0EFoQHATHwnSVqByxDutDpffXP+RCu8
X-Received: by 2002:a05:6808:2394:b0:4b5:b13a:9001 with SMTP id 5614622812f47-4d72a34d1edmr7683917b6e.14.1790370966306;
        Fri, 25 Sep 2026 14:16:06 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d72057sm3066734b6e.6.2026.09.25.14.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:05 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 2/3] tools/nolibc: fix FD_SET(), FD_CLR() and FD_ISSET() on 64-bit
Date: Fri, 25 Sep 2026 16:15:59 -0500
Message-ID: <20260925211600.119116-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211600.119116-1-danishkhateeb03@gmail.com>
References: <20260925211600.119116-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit feaf75658783 ("nolibc: fix fd_set type"), an fd_set is an
array of unsigned long, but the FD_* macros still build their masks as
an int or an unsigned int: 1 << n in FD_SET(), 1U << n in FD_CLR() and
FD_ISSET(), where n is the fd modulo 64 on 64-bit architectures. So:

- FD_SET() of an fd with n == 31 sets the bits for n = 31-63, as
  1 << 31 is negative and gets sign-extended.
- For n >= 32 the shifts are undefined. x86-64, for instance, masks
  the shift count, so FD_SET(40) and FD_ISSET(40) use the bit of fd 8.
- FD_CLR() zero-extends ~(1U << n), so it also clears the bits for
  n = 32-63, whichever fd it is given.

select() on fd 40, for instance, fails with EBADF, or watches fd 8
instead if that one is open.

Build the masks from 1UL.

Fixes: feaf75658783 ("nolibc: fix fd_set type")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2: No changes except dropping Cc: stable.
    
    v1: https://lore.kernel.org/all/20260924015222.31693-3-danishkhateeb03@gmail.com/

 tools/include/nolibc/sys/select.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/sys/select.h b/tools/include/nolibc/sys/select.h
index 6d65d9ef3d6a..f299c79939f5 100644
--- a/tools/include/nolibc/sys/select.h
+++ b/tools/include/nolibc/sys/select.h
@@ -26,7 +26,7 @@ typedef struct {
 		int __fd = (fd);					\
 		if (__fd >= 0)						\
 			__set->fds[__fd / FD_SETIDXMASK] &=		\
-				~(1U << (__fd & FD_SETBITMASK));	\
+				~(1UL << (__fd & FD_SETBITMASK));	\
 	} while (0)
 
 #define FD_SET(fd, set) do {						\
@@ -34,7 +34,7 @@ typedef struct {
 		int __fd = (fd);					\
 		if (__fd >= 0)						\
 			__set->fds[__fd / FD_SETIDXMASK] |=		\
-				1 << (__fd & FD_SETBITMASK);		\
+				1UL << (__fd & FD_SETBITMASK);		\
 	} while (0)
 
 #define FD_ISSET(fd, set) ({						\
@@ -43,7 +43,7 @@ typedef struct {
 		int __r = 0;						\
 		if (__fd >= 0)						\
 			__r = !!(__set->fds[__fd / FD_SETIDXMASK] &	\
-1U << (__fd & FD_SETBITMASK));						\
+1UL << (__fd & FD_SETBITMASK));						\
 		__r;							\
 	})
 
-- 
2.55.0

