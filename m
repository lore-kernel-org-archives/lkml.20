Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279492;
	b=UwRJ2oGeUbJ1tYL+81mgxO75eHeMcQZj1aujDSXCFju3EfjMo4xM/2k0pLOUBWunXqB0
	 fHYlHOgQ0uSuONelzbuQmWtiCKkw0N7iJ2Trnh7cpG2hx+46zWzm28Dm1cTurkDRqZiqk
	 Q0ZO8wqHgHbFqyZUu3znMuy5yT4mb0vy1hh0GfEPCjvibvf0TWgWyYgDS1GdTgD1ET/kC
	 ivogqfCEdkJIqRg1T5M0TqSYzS2KWxBxAhssV4vnPPUrysCiAEowmaRtmJkV8SriCgG9m
	 NSpwTosChRk6El/G6JfAsDaegpp8hgpN/vYUYsgmlj3HqYBSwUJGPKNvqdOhnKtIOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JYvguxWw9XKF1WQMW0Z0UUNA8IkuNdwUSuFinOvaoN0=;
	b=p/5xZ0228xynJnH2qu504/1IXZL/cdLplG4SBmX1pcEQ7/mk+3aKtVRMwvITTXdAR4+V
	 8mvvmKv3jkbw3JkrDnnzHOcVe9StUubGoKe3kvs7f6+0GCfWIxLTyrfOMYeBKin1Rrrgw
	 CMT1o0BPXAq7g28lP6fsboEgDNGEyklEJZjSEVkwiyOlQIKs0gc31mfQkmq8CA8XbNk6z
	 4MItyTEnEO8vHBosCoPoe+CFcJq4XbOBOO25Ly/mPFsabiEedgmt7rAKB0zaxz9gsSqn2
	 F+IK8G/JuaFDsnIwEQPddHsGcGlaZBhX8ALEHkkEQhw5rgZABK/QWgp+LOEdEvSWMFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzaIjbOb;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzaIjbOb
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so1444034f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279490; x=1793884290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYvguxWw9XKF1WQMW0Z0UUNA8IkuNdwUSuFinOvaoN0=;
        b=SzaIjbOb+RwWXENug90d3zvL6neetSgerRFZE0gmTbYr4aZLzqDUih+wYhuw05vNY6
         +BJUjQk14TUn9uH7sjP9GHYTiom9RPqLasdcsmL4wAH4swEkD8D9GcposWt+h54N+LrZ
         yiSBHnAQkSjNaZRQrXH13I1o2ucz2WCb4/ifNrM86ecRMB+32EwTORXYNqsEK32LeAID
         vKgaFc5W7QGm3fAhIK9tEVVwO6+X28y5JiOjdsNRaZ8XbM0kJ2bDfPMthScviMVM6/g+
         G/hNOIwK13GRfE9edNfqJmppBGjTHhCBKK7vl/kOdzntLq9VuWDv3w6UtAzgvjl+uUNm
         WSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279490; x=1793884290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYvguxWw9XKF1WQMW0Z0UUNA8IkuNdwUSuFinOvaoN0=;
        b=p4rgF3/qUHPqCONM69+5XXyYBJEo71edC1A0mgu/rNuXpQe3ix8/Vln7yW7DisvWbm
         oxQqrTIdEVtmFcRAp1bTAIND8Pc4yShO7/+CMVbJqjPUa9B0BngxbQsK7AmbHyyOZxP/
         03vEJsICkwiDpbUlwJLpgOdZF/DrxCZ/OogQ/60LRim0FJpqtykkaEAD67+pePJJBo3g
         +5pgfUljLuADBz7wv5LP7Eh+1OnzIW+5WbcKBIyA3Rso9SDOUPshAsNH6pQ/B4Pv5pUR
         7MXKD0PVF4WFJ23tW1G+4WBKu1yKWDtpkOHxTkSdh2cA7DHysZxTAUP6FuKfDJopCIz/
         jhDQ==
X-Gm-Message-State: AFq9FYLbHZORwJZjue4qQ+N/5j4v8lG89gyYMvG8KvPw3jKl7Y0QbTd1
	sYRrXrmpL+raX9tCPLM8FwOic1qjt3KhG+PIqREIq7gDDRkMnFraTxZWjUm5wLOg
X-Gm-Gg: AYBFou0tAj2WKnaH0k4+UJbLJH9wWPIAct7wssJWyhvRqP48YzaFfvSqlVA/oy9aU0K
	AoVdDMM7g5N4XPcNVf5HW17wVi9IGVgSoHeTdFy6hDf7iF3g5riW9V4rTIC0GF9Vwg+7zjGwfTr
	29U8oYziCzJkz5uuwkhGyhBmEUoxSxKLXNrvb5KjyH1i2Hw8e8fJlww1qt+tvBWhQa2RUL65ceR
	Ao9wVwBfDcSjhGqTs3NI5e39e78+YDe1LXyBedtUkwhTcb11VTNrx2clG/++xIMi10xPFVdZphm
	wPSmPXzXFhphmwOI9oHzHICQso9N8Bz7QY9gUrGcw4Dpp8vZmva8SDA1OEWlkh4NwNIS96WCe7x
	Jgb+uoDxo0I90iqD+o3gS7ns5gh8EG22R2Q57XlCQBfEKqDwwMdZXaM5w2eRVIgHOi6fnEoJ/Fs
	6gFls/8gRCRoLKaf9gT1t71pBB9ozB2B/Lx09mZVkcELwWcyk4PkV5spXUar86+LpgqB+D57vSi
	Hqi49ZY/SbO9kSVfTPux18RP/MQiLXYGNoLGAk/pqYU/tB52swnuhheHSl7F+RHhPLPOt//hPsv
	xG+EF8KfMie1kZc4z3r+b7pRcChyH/AorIvMGeYhW9y3KPByq2SG++E4fc4HoQNSPAo=
X-Received: by 2002:a05:6000:2c13:b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e5d5e2521mr13055765f8f.49.1793279490117;
        Thu, 29 Oct 2026 06:11:30 -0700 (PDT)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm31899557f8f.58.2026.10.29.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:11:29 -0700 (PDT)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] staging: greybus: audio: add missing newline to sysfs_emit()
Date: Thu, 29 Oct 2026 14:11:22 +0100
Message-ID: <20261029131122.167464-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The sysfs show() callbacks must emit a trailing newline. Commit 14c91651df34
("staging: greybus: audio: Use sysfs_emit in show functions") converted them
to sysfs_emit() but dropped the newline. Restore it.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.47.3

