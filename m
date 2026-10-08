Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4270F3955C1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477689; cv=none; b=XNgDZXR3rt1L04dN/8tuwz8PBxHfo7ARz6unr0nugdLxd55nEU7H7xtYthm98MzEE2yDlVy7trXdc8VFO1IUTlRYEFi+MqNmMN366DlUmcPXogvVrPOyYRscdVDBIZDLdpnuG5bAgaInpG+3UZnboEZaqnAt77m3Lv2cDCDq4OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477689; c=relaxed/simple;
	bh=HBh16VW8/lHAFmRTJaInOGmIL35BcI7Q3Wis0Frt2Is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QmcR23++c6URm7DqCiXUK1tJnLylvZ/K2VzmAF6/gMmax0Irust4ltwYWxaOCiwmAzXt3c5tS+1/IbRQNCIPL+mbA5Yfgg6+B2zBe4tMh8Fon4BCKvurrc7tXYvBlcDXDoARqbCz4EG1Y24hvuTHBg648fig3hsGgXkCZt4/Nak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XokWZy/7; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XokWZy/7"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-823b938464fso4193528a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477686; x=1792082486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkLLpJNGORGXxC7hkGQnF64CfJaOXfvTgZluzK41nQo=;
        b=XokWZy/7QPE7dd9xspIP9V1ypEhPT5dENRP0SlzXCOPp0BSMpLWHs5TlI3Vph2tABJ
         xorJz+Gc7JOQV0fz+uf9Uv1o/XOct/eyu5oDUMarqmTxHeYN0I+sgKFKb7hZv2zdRfCS
         vfudubPOzvzdEprV+KutaO5IRjIg2ooQyOj21er5zHHb8FPHmjJyfXv+9KLg/oes2U5n
         hp57YrKuV1SeFLE6WkvtvJW1i9zdLgH/ge4kzKhc6myzqnX4TKcLDTkY5FNxi41a1nBd
         qMcXK9WNRAL8HqKiRxtYn5tw1ieiM0o0xDeT6Nsnc/4S2Bh22freJCncpzT/ACxP16VI
         oy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477686; x=1792082486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkLLpJNGORGXxC7hkGQnF64CfJaOXfvTgZluzK41nQo=;
        b=dimvRKJbVT+AbA1W6Lxs5+7zseNSem6yOg9wNGrKxnfKuY2d9LkL2jsnppqA5mgO+s
         P9xyxWHnUHPfXVH0kWolMxymdrrX+bPTBqfEskH87Vr8GNUZufTITuTxlsw0GVRmjYw/
         GY9W+I/lQlnpWvUOVpIuO9UeR/eqGHtA2ElbPr6ht0v+ghRQ/y+k4q4WF0F/04zcjKOK
         gsB5xncBjsZ2C654ogVNAD2bco0OJRaEYVop6HUNo44AIO5LLrbCPcdEcnFr0PLbl6Oj
         CLc0OVOI7Dx+F/zNZql2va2j+vr3yb/nhOFg/7gCxxkqbdyXUeUMaY15ge6UxxeIOKEr
         5NkQ==
X-Forwarded-Encrypted: i=1; AKwUvByvNpeYgIgmv9Cdrz5sVmq9+lzElUVjRHLMCTydzbIXe25SupZxzDzNCq1Bxh/98e7mOX8D6jD4dvZVqMs=@vger.kernel.org
X-Gm-Message-State: AFuF++mT66GXiaLcuQmtQcTia96mRZM699zdTYaHJ/EO6zLOFGWdjeKa
	9QxXpLbIvKDycTV2tv5PSZzrNKBwAzu+TcGrFW7fuIZbnO0c6vy+sdKV
X-Gm-Gg: AYBFou3Hg0+0KgFLZL7UqFVhPTIldPYsrG+SdavKMTF1ckRYvpP7VBwBsHhDCoiY5KG
	w3OHQa1hbE0BPuh5KTTJ0Nf/XeUST10JGoyGeOslNUAf9I2jtTPqMHku4WAs3XJd7O4RORdvQdP
	NgObgzyE1cvhza2QUTwJ1XRm/dAdXuCwe+jl5FbpROBY0z87GGp9Yp6EbUFghiPxXYkeyZbo7pg
	hjvVxWNNmapOe2rnLyKEHis6Y0F8DVqygCmPZZ4mdzClhZBmSopCidX52phiThgFoGv8OfqyHHc
	LG5ggzoeopzWBHThdIeStKHAZQxk8PS2oW58SLYTt5tSQ/LBfbbJDeIFknHnlouGCrCmpF36LUa
	Zu5hprzAQpgUNq4lOF+PuF1c1B2s2eLzMeQDduoPE7yPPNssA0vnG6lJXr7rPZv/vqGuYinA/wj
	oMm+OOutWB98gHjp2oKmIjh7x+Yu5oPYTNVUUSsqNDgptq/8ZwywhA184lKfYvMRunOnbhMQcUO
	lDYv7lLzzeuyPN9vkJtFrs=
X-Received: by 2002:a05:6808:1927:b0:4f6:1e12:e37d with SMTP id 5614622812f47-4fc46f93365mr6574978b6e.63.1791477685995;
        Thu, 08 Oct 2026 09:41:25 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc48e3de37sm6249298b6e.9.2026.10.08.09.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:41:24 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] tracepoint-update: do not reuse section pointers from a previous file
Date: Thu,  8 Oct 2026 11:41:16 -0500
Message-Id: <20261008164117.3670267-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_data_sec and tracepoint_data_sec are static and set while scanning
the section headers in process_tracepoints(), but are never reset. When
tracepoint-update is given several files and a later file lacks these
sections, the pointers from the previous, already unmapped file are
used, which crashes:

  $ scripts/tracepoint-update --module a.o c.o
  AddressSanitizer: SEGV ...

Reset both pointers at the start of process_tracepoints().

Kbuild currently passes a single file per invocation, so this does not
affect normal builds.

Fixes: e30f8e61e251 ("tracing: Add a tracepoint verification check at build time")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104200.1787946-1-lzsx618@gmail.com

 scripts/tracepoint-update.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 5cf43c0aac..4c4b669011 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -163,6 +163,10 @@ static int process_tracepoints(bool mod, void *addr, const char *fname)
 	int idx;
 	int done = 2;
 
+	/* Do not use the sections of a previously processed file */
+	check_data_sec = NULL;
+	tracepoint_data_sec = NULL;
+
 	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
 	shentsize = ehdr_shentsize(ehdr);
 
-- 
2.34.1

