Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955AF47986C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196934; cv=none; b=kgkw1mvfyXOLrtchIE6HD8FYJX63f4zBm/GdyrfjiHc+ziv0LR0/md3HxhlPW4SsdTgPCEWny2SoA7r2E61KVdEabuES3x31fu6CzPXSFD2Zy6lCPwwCwdJDdhOBwZ7yuK+mZs5rOIZzAmvAEAPuW5nd3Rv8zuEMT/5EAa9s13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196934; c=relaxed/simple;
	bh=+c5COAnNFvbEoUdyXXW3nbaU/kfXy7h+IIzi6jvXZyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GPw7q0627TwTh6C/SKCfJjEHoBLBiIIJpM502AcvC7sGytfUCNvKvydoMuDO0PdKBqjakpi9iXME3uji3rcO8Ho0YQPWUx0W24pzGdjjEIpQbnWRWHdqIwHxJuXRiM/dbTowLFwtNKwlP5oUi7ydZUYx8LraE++AKVwidgCE+xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QajWOpzN; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QajWOpzN"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7fccba9c675so1408453a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196931; x=1791801731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8W0+fYbRDHfh9L0kglCj5tuLWYsPG45RuqeUrhtLXE0=;
        b=QajWOpzNeAsU4LXlltRo5ehIyMkgRGzpBfGhR32f5gIXaQs31SJF2POdexuVJPdpWe
         RT8SJMh8ybj0Lrd1oOpeBA7hP+df3kFFqIkHcSS5/KiUkCqfo1pEXG9BEsVcvHBj7Htf
         vDcKTn5sgaLe2Z5QBIJIMa8w3PK/rwp3bVsaTdFpsg5lLbzvRqc/gcfzjI9VEO2RNGT1
         NwzF0JkEMPXIOTixFfswKs3+z2Ypsdn9prXNFsITzcokV3ofFf1pGCMzji3/RFVC/Bxq
         LeXzRpHw5xwtB9z7+7/560aSi6BV0O5ZV82sOLHtRvpGG+lalocfmbhdM9KGdq5K16Qh
         XJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196931; x=1791801731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8W0+fYbRDHfh9L0kglCj5tuLWYsPG45RuqeUrhtLXE0=;
        b=D+p9pQ7cS49npqO4ylRFdKFn3Yee4HwDj0K/1q9bPoD0AWFD8JSDELr5grwTAaA8Kg
         CiWl3CaWzxAcdHdNK1JL4G3DskQEHwpxeQySma97k8rFunhHgLw4xcGrEHfaDz9ZZqA4
         75/HWhwVozjkZEGzKV1cijrExyw0Rk5xfy5civaJ3/uDFv9pnHABLhdBGZhf9EwVfard
         0UHumS+u4knK9WKK4phNhL0+KRWhbktfPdcgs28y+x4ayTeRjigzMnZoDv0qBPdvjigV
         h8OW9+jEK0bCobx/0mHoXx+9kmcJAQ065alIpjNF85RhnQx/Uizkb8lR54yP4/b4aWX5
         XFVw==
X-Forwarded-Encrypted: i=1; AKwUvBwRrSmOjhBsXGg408hS4cDlHBLgjNOHxpJfabVfpOYkBnNGKuFxvrrflQ40oJ7ycJuYvXzhgxAvRE4t+gA=@vger.kernel.org
X-Gm-Message-State: AFuF++k58O1lxmYv9lCtTWbYsFPZIDaj38q7UaWh8twRppo8w24g/Dlb
	URlrKMFmYvqMD+TNudmrPl+lmos05mVICfKVQzNGg4N3SA85esdvrsx7
X-Gm-Gg: AYBFou0rWdd85Nwlivs6YID0WIVGFE92/DSWZ2ZE2WNyHlAtAkBUjTuqm14VcYoTpy6
	BIGngtcYEJYJXnnV+sFk13P3JE43MZ6TTqPdvXppqs8Yw+Tgrhv1QIFCNQ7+SgQhMo00fMzsF3z
	W2by0auNfaf3H8iPoCTYY6EzvqtpmDw5BLOYHyudacCQ7K1fJYo61E1ZFF2FzzBw6A4/Q/2Pon+
	AhrorOd0MrAle5kDmj66hNHPWroE27Eexog26dbekIgLwoCjIVs0Qtz/ypeARIvyeXuKP78eMW4
	62GZt5VQr39pORikQQ6CC3kVjOf1feo+vvut4irRnpLBIy0l86tdZSWN2JMQ0h0RqjizaAFBbn7
	+cvjnL8kyyT4I6O3NXcjRZzPgXadvMptjHJ6iKqJB6hR98TdnP2thQW/uhgc8aIW3i5KHTtQyGg
	/tG3F1g8QFyksgc7WlTA5cC+rbTTA+jFTzqrOwF6ubeAcrCxMkpOfbaDNefwA9qjgZ92lviwx44
	zuWx+vNeeqr
X-Received: by 2002:a05:6808:2203:b0:4ca:9850:4dd8 with SMTP id 5614622812f47-4f3080f790dmr10412563b6e.10.1791196931437;
        Mon, 05 Oct 2026 03:42:11 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f5249d7c75sm9588989b6e.12.2026.10.05.03.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:42:10 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tracepoint-update: check the section end before reading a string
Date: Mon,  5 Oct 2026 05:42:00 -0500
Message-Id: <20261005104200.1787946-2-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104200.1787946-1-lzsx618@gmail.com>
References: <20261005104200.1787946-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

for_each_shdr_str() evaluates strlen(str) before checking str < end, so
after the last string of the section it calls strlen() on the bytes just
past the section. Check the bound first.

Fixes: e30f8e61e251 ("tracing: Add a tracepoint verification check at build time")
Assisted-by: Claude:claude-opus-5-5 ASan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/tracepoint-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 4c4b66901..ad5f691c1 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -74,7 +74,7 @@ static int add_string(const char *str, const char ***vals, int *count)
 #define for_each_shdr_str(len, ehdr, sec)				\
 	for (const char *str = (void *)(ehdr) + shdr_offset(sec),	\
 			*end = str + shdr_size(sec);			\
-	     len = strlen(str), str < end;				\
+	     str < end && (len = strlen(str), true);			\
 	     str += (len) + 1)
 
 
-- 
2.34.1

