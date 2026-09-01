Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388DA3A16A1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237662; cv=none; b=bSwQOJQnh8DOR71ZKhB9WD4dVzswuOILbIX6l4UA60P87aHLBAHeJ8oxVdQGEmBNw3AnAlxK3K40ysc9xO3fHtG2Rdm4kbTf/ELVCyTjK8mu3sJ5VeYn0KAW8FC3iwdQoiyKt6c73qnKMbeUZ9rhZX7WhEVKGjrBWk5p3uratSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237662; c=relaxed/simple;
	bh=fogOGiECK46KlKG6A90Hn/KlqqibbAb1EYawhy5Q3e8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUWCldYo9Pz+eU10svHoEtmrj2qe+YvvL/+WQ7YJjOyK+9sOfyXB912+J5JC/9Ia2j/1gg+mxVXWHIz8Hv5Mef6a7+nSdOqn9Rik72P+2rDw94+d4Mv+1G4HUnpOXyGN8EIKGgLG8FdrolKEyx5+oxlba4BUt9JO5jPDP80nJ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1Ki526U; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1Ki526U"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso2559799a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788237660; x=1788842460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+IXFWSB63JkB5NPYaCMrM5Ux3r1uuXw5+BbmZrpfR4=;
        b=U1Ki526UzcU7HSRfP0dbKkJq4UBNwubEWklY6ykphDoDHG5PTa3gNpMn+dVBWCCuzS
         ZQ+8vFHxmF3OiTGfut2jG4uJDjaujVCyw/mjxiop17oFdjtMIKbhXKgV1EV/YsaamLl6
         rQwflboxTyBDWgVUyRCxM5UtCtwraBs8/IQR2borP6/YfbL3w59cz2BDbpIol+rzzPZV
         /BgLK+q/JL2rVpQ50Jwt/B0heYTIoKxk06DeCiwqoBWDXRPU0PRRCyBE58EK8fu4RztD
         2is1Kc0spBKmeZhp/qygY+cNk9a9zt59j5U4hqHhOuGrm55ThMRn6eK0gDXP6bTIdb5/
         40xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788237660; x=1788842460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+IXFWSB63JkB5NPYaCMrM5Ux3r1uuXw5+BbmZrpfR4=;
        b=pe8f/hhCZUIDBKo6QldcJnK+uRXzZsktDSBLUTO1bDEEoNgOTcAOcpNQ3jYsVjr/6d
         9FKos2m1O6rqjoLyS1gtl1LJyMWflWB4mIr1yrIAzsjLNcmSzZH5R8bCbR9AOu1+5/Ng
         CxEK2OXkSkZD8ksi2Rnlwi93z+ew4aNWOjqlvxRa8hy07vfod2I2EpQUidZkN6KIklgo
         CGZC9TDrFhbdoJ49ZwFoj54As1/aDI/K7KFU5Zi2FDOcX49N4LLa8BuDwXJd3efRzTh1
         520Y2ieJAVS32cw7wao2XT9ge1mhyHzvAMew7hJP8sotSaClEyVGd9zgwq8FKefynjou
         OYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKdYGN0ITtln80BcKXzbSsfCMlrkWQzaPFm+gFfDyNuDhkfzXeKY/UQ/g984gWsjTW6gCNpH2hJvmdSiM=@vger.kernel.org
X-Gm-Message-State: AFuF++kDj3r5FoSTHmYAUhi6H89UFu+R7xg1a2Dkq13LfwRskXiHz9HZ
	A3tB54jPekZiUSLzg2nQ3RMTZBuiuF80VoXa/qWP4kLK9lvy2/yCCZ2G7c820w==
X-Gm-Gg: AYBFou3U8VXSC1/kYBEMy7mWksCahvFuRwf84A6E4VlKQ+wDnpmH03E0O2ew9ARaf5X
	+fFLBO1xsw426hXnqMpMxdL4q0c2iIRNTnlbpRjv40krkGFsPqVjh1gdwmRPUZfvJW1oC78a4Gw
	5intgTCOv7J9V8nZXwvzZib9StoB20fV3hkyNXM+Y3RiSdHkoAx56YOmKjGWpT8eaJ7gftFf6CL
	+cv+J1tiLE5omBqZLvtgbiKFcWG4rxcSwHxXAKe6+SugmEPRrQWKtYm4NrNVuOUP988hP8tinuK
	Tg+IYPTFXMOhU4AgIE1n14xV9F4gs3dwjU2Jf4DQnbS+uMDeCthEbWkEbmdhIYOrtxh48g80oGB
	xjTUE7kzuwC9MAga+fiDK8ZnIzeB7toukYj5pmmrqIXULd+8lraBoELjLGSUD8c1BdlJxJqbiCT
	kgpnmonLj4vneYf6UA0iB/MY0MQ8sMH0t6kktAeALcJdjm1Kf707iX84GazD+R/9Butd3q
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr33964438a91.19.1788237660571;
        Mon, 31 Aug 2026 21:41:00 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm45447647c88.12.2026.08.31.21.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 21:41:00 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: ulfh@kernel.org
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] mmc: sdio_cis: use strscpy() instead of strcpy() in cistpl_vers_1()
Date: Tue,  1 Sep 2026 10:10:54 +0530
Message-ID: <20260901044054.346524-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cistpl_vers_1() copies each NUL-terminated string out of the raw CIS
TPLLV1_INFO data into a single kzalloc()'d blob shared by all of the
strings, using strcpy() with no bound. The strings are already known
to be well-formed within `size` bytes by the counting loop above, so
this isn't currently exploitable, but strcpy()'s lack of any bound is
still worth removing on general principle.

Track the end of the allocated string storage and use strscpy() with
the remaining space as an explicit, always-safe bound instead.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/mmc/core/sdio_cis.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/core/sdio_cis.c b/drivers/mmc/core/sdio_cis.c
index afaa6cab1adc..24f670a798e2 100644
--- a/drivers/mmc/core/sdio_cis.c
+++ b/drivers/mmc/core/sdio_cis.c
@@ -27,7 +27,7 @@ static int cistpl_vers_1(struct mmc_card *card, struct sdio_func *func,
 {
 	u8 major_rev, minor_rev;
 	unsigned i, nr_strings;
-	char **buffer, *string;
+	char **buffer, *string, *string_end;
 
 	if (size < 2)
 		return 0;
@@ -57,10 +57,11 @@ static int cistpl_vers_1(struct mmc_card *card, struct sdio_func *func,
 		return -ENOMEM;
 
 	string = (char*)(buffer + nr_strings);
+	string_end = string + size;
 
 	for (i = 0; i < nr_strings; i++) {
 		buffer[i] = string;
-		strcpy(string, buf);
+		strscpy(string, buf, string_end - string);
 		string += strlen(string) + 1;
 		buf += strlen(buf) + 1;
 	}
