Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015445;
	b=2z23iUySRPtzYZQCM3AAZ8IUwlNRrp252AwLCtSRDzlfAdf8RLM7H4jgiHhN5Rv1FxtQ
	 5Wdj7ctfs8BrvyANT4mlSeuETpIMpALn4AzV9JWkjza0JOi12WF3rN3xzHVgLMdFz0t76
	 Kr1IG4xL1Tkv/eRy2cUwfL3UW4RVa+YhpyBbIWvo6ldK6nXy4eZOZftSSs7ERXFU6ll+U
	 5N31T7M+uK+OGIyLDHLz/17H2DFbZ3G4iPn4qVc4qlkQo96/lwJGtCl9tM7X8iSKMjyce
	 aTFu3OsKd9RsprznlSrxRtkkxSw038VBYkZTaqzqQHoisq5WhJUtAnMOdm11EB3zEQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lhhy4dOxtnnyPutzo8dg+ONteVRvx6diYiVVEcbUzY0=;
	b=riZXBOofLJ/eQSh55ysddYr+gkfRiMZ5DAM2Cs0l4bpiHLQ85c+Nq+4M/opDcabNjHti
	 jF7hMvGQQESxyw1BZELy0Y0lxZ+MK8OCaDnnWN50o8yqHiRZND7cj8MWVqTFCnnywbS+D
	 zY28u/kzOfv+r64wShChgwaTtRt6RPGF5ODqBkQaRQtNFDpjKyF7nV3lFMKv6cI5CB7H9
	 N5U9HJzvmO4g9n3/JrUs4+qfnmychYkJ5KyMSQZ/q2aicKIHmfGESR4FLcCmhLQMiKg13
	 byMMlRMOV8L6CuxyiAD/PSrXEGpFfeylplwv5OkchYqTN2fW6HFJvVb3qO6/ymKQRlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mzsx+Qdn;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463DE606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463DE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mzsx+Qdn
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso1429359b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015445; x=1793620245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lhhy4dOxtnnyPutzo8dg+ONteVRvx6diYiVVEcbUzY0=;
        b=mzsx+QdnmaXh6VOzJMQh2Yfr1eD/E7W/Xn0ObOfzC0kuS024gNwgs0zu75Cn0ZysSN
         3yA56gDH1PgrKcivO5g4r6AgqgE0kL4Vy6rKM1J0q62dkvPBruzKi0jHpF30KHKC+4hM
         MaTookWu7XMs32Tk70Vucpa+C8abpJt6CSfS9gw7O9XILpYmLPRJMVt+3aPhHIpara0a
         JA3K0ch2LMxwp7oC36IgpbnzucCPJr5u8SYAgRKqEBAVdxqtlr40koOSh/Q/GeEB5Hq3
         810xcANoR64mFFIknEr2J5184bt3pz+n6mGfcXdEyy1emdp6iQzILEIXiInIw1WwbgzZ
         Sp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015445; x=1793620245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lhhy4dOxtnnyPutzo8dg+ONteVRvx6diYiVVEcbUzY0=;
        b=mMN5iPCT1nQ1K2AywRg7riE3mR2zv3rD5ThbWTfXZ8t7ULhQuGMWDEcWCpokz8dvAS
         pn16rtlSMtKgrgq14YJbZAImP4RFa/EZWQAefLU+N4IOxOw5hQOaxMWIcyxnKWt9ZmyR
         Zx46MPN3q4qWQCRj90SyBYjy8a+3SaKq/y5NuwmRz4Lotkhcoc3oFJsiJ4UetzF6xZVI
         hGrx8OuNf9hIZJwD4GGa6wWJfuyMwIpjkmyag0gcRhjgmngTP1DZ3GcE/fL5AI5UV2Tj
         xb2HCAlLnop3iJGqYdZ2EU8ecsqFJBkirtZeh/4EWWn2gDViDnJUc1vGw3HdK1g0uVuH
         VLyA==
X-Forwarded-Encrypted: i=1; AKwUvBw5clBiCXL7PZejvFdgHFqIIcOrACtAW4mfZM7W5sdMEBHAH5WndA0xMti3KnTerucv8cEicpQbR89nLgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsgZ9a23oS9T+4F2Saqrjb8CRUpCz+Z5el1V3wshXu1OI2wQ21
	2lV6LVbPh5w3ebSXXG5uSirh68skstIucFPqAkkcBTONb0fs0mCxJafJ
X-Gm-Gg: AYBFou1Qtukjy/7B3e8qlfr+aPGz5Ej7DV6aVHaNqOGwmU6ZK5ksCGm8ijiuvZeEFa3
	R6LZzD5qO3I0ASJ8E59eXFHIE48z5oyO79a2qBT/ksvlZvwSeuv5CRffFnUJTu7OidWhuxEGCgm
	LolbBd0c0g95PgLLiKGJWy4n64Z6OpK7GxmLZ7KN5LE2fJCW2iH7eS4ZL4RtZ/Qtfi6Ebpsx1fn
	YZySbAqSrWo8njtxeHWipzBw4Q+9E4zp2FlFyYXvDdiGM9vaTBEdnZAg11Q2iDwiOgWKmm513iv
	Y+9mLV5gZXilDKNRy90FpQK+vy0ubvQ74XFT4lS+aJVBAJN834B37RkJ4Q25sy7ffO82laxhq/l
	0orjkkUzWYR5D0fjQxYchyWV/oQPTwiCCbXEUvL1Fhyazi8JLjgktgYX0M85aub0/ivm3X87G0H
	5ywcXXLI1CpkgJ0ULcyVkknbTb+SnXFiIlTLXKqIw2Wm5zC9/qUv+SuVH0gDy7bbb0cNhmkroHn
	RUs7bLrZXcOuMN0uLCA5GO9VlzocRxZK6VD9bbYDjOLbaakdg1mAN+LAzUiYJ6B6hdVeXru4hIm
	+Qo9JwUV8b1OyOWLoZqs
X-Received: by 2002:a05:6a00:148c:b0:878:34d7:69b2 with SMTP id d2e1a72fcca58-8a369b1d3bcmr4776262b3a.57.1793015444491;
        Mon, 26 Oct 2026 04:50:44 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a37695ab9dsm1054245b3a.26.2026.10.26.04.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:50:44 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] thermal/drivers/rcar_thermal: fix list_first_entry on possibly empty sensor list in suspend/resume
Date: Mon, 26 Oct 2026 19:50:18 +0800
Message-Id: <20261026115018.3227372-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

rcar_thermal_suspend() and rcar_thermal_resume() call
list_first_entry(&common->head, ...) without checking whether the list
is empty. list_first_entry() does not return NULL for an empty list; it
returns the container_of() of the list head pointer, i.e. a wild pointer
into struct rcar_thermal_common. Dereferencing it at
priv->chip->needs_suspend_resume (and the MMIO accesses through
priv->base that follow) is undefined behavior and can corrupt memory or
crash the kernel.

The list can indeed be empty: rcar_thermal_probe() only adds a sensor to
common->head after platform_get_resource() succeeds, and it returns
success even when zero sensors were probed (no i == 0 check before
"return 0"). With a malformed DT node (no MEM resource) the driver binds
successfully with an empty list, and the PM core then unconditionally
invokes the suspend/resume callbacks. This was found by code audit; we
do not have R-Car hardware to reproduce it at runtime.

Fix both callbacks by switching to list_first_entry_or_null() and
returning 0 early when the sensor list is empty. This matches how the
rest of the driver already tolerates an empty list via the
list_for_each_entry()-based rcar_thermal_for_each_priv() iterator used
in remove and IRQ handling, and does not change behavior on the normal
non-empty path.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/thermal/renesas/rcar_thermal.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 9a9038671..65dba6354 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -530,8 +530,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 static int rcar_thermal_suspend(struct device *dev)
 {
 	struct rcar_thermal_common *common = dev_get_drvdata(dev);
-	struct rcar_thermal_priv *priv = list_first_entry(&common->head,
-							  typeof(*priv), list);
+	struct rcar_thermal_priv *priv = list_first_entry_or_null(&common->head,
+								  typeof(*priv), list);
+
+	if (!priv)
+		return 0;
 
 	if (priv->chip->needs_suspend_resume) {
 		rcar_thermal_common_write(common, ENR, 0);
@@ -545,10 +548,13 @@ static int rcar_thermal_suspend(struct device *dev)
 static int rcar_thermal_resume(struct device *dev)
 {
 	struct rcar_thermal_common *common = dev_get_drvdata(dev);
-	struct rcar_thermal_priv *priv = list_first_entry(&common->head,
-							  typeof(*priv), list);
+	struct rcar_thermal_priv *priv = list_first_entry_or_null(&common->head,
+								  typeof(*priv), list);
 	int ret;
 
+	if (!priv)
+		return 0;
+
 	if (priv->chip->needs_suspend_resume) {
 		ret = rcar_thermal_update_temp(priv);
 		if (ret < 0)
-- 
2.30.2

