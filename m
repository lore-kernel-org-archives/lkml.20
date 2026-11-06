Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993575;
	b=oXKKBFBTGtnul+29rOtW5H093cvKNga0qs0Yel6iLD82Vz1T/s3roxKg3b9k0gRp/FJR
	 dcdp8g7YvhpYiP33otGggw+CVUlq6aB7XnOCRbtT0byQWv2zrkmgnOC7HowNibgq0uEgT
	 iwn6HyFsLKOZzly6CTaqJ+V9Gqa3jkqhGnJSSdug/QmBto8esVdBzFR7f2DFbMVWs90S6
	 YwWs8KJt0ciYA2oygv5/hBAobVPpGSVc4jnwxEBELYkwbIoY53dJgrlmBUGYYvzkTwA9K
	 4aE8jnZ0tLLjJNnL5A6mrXVT7h0w4YZ+HPA8wnTeEF8D+eReZMc34R8nLsG55pf4m7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
	b=qF10DRoJxEBhD0PyhmfXHUwx6Fkzk4yzOSJwsr6LqweSIqBwM7SCc2r7e9ZhB661UlGX
	 3AI3lqZgZrNnwFf2O89GQdUqp/EOVE5yF+Dy09BbVM9H0bs3B7P0fTYy0v+9S4PIG8CHH
	 F/uHpzUFHcU5bAk565sGtwB20hsaX9ETjNokAURIDpkuLz9Z3hgh4iQEN5iYThgdc7qIb
	 JIygrcbWGFO2xHm7KJdT6ckVDpOrI56dbsA+xYbQHQHToCzLcGmbJJk1bXpbCSyt2NwoW
	 MEMd+4nn5TnxOQCU6UPWRnQho2KTdv1GvmmSsiXzoQWb7Xht+Wcane7UV63tpnPyUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="AJl/oz2K";
	arc=none smtp.remote-ip=209.85.208.198
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348F606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0348F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AJl/oz2K
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab3061668eso4764181fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993573; x=1794598373; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
        b=AJl/oz2KTG1VBy0Y5l0VEECGhtquL5PzpdP1sb9PtaqIkbAB0THpeGHJb5TQPJNosk
         ch/XJCUboLbbLC6YWhyjJIYB08eo6fRvDYaHCPkb2rltS1awwwPwc9foVExjND5mvrX4
         mnPlVGdkq3KCw+eKHc1GrQ+onoCt0iBkP9w7fKKZ25P4tPX/Ekm5iwaO5lBVwOuA7l6b
         sUdG/LgycgOGknHjoqA1+itwl9b1wD728YfdreBKbptA1s+NtbpZtSu/fiW5ChnryDuq
         uYt4gzpJki1bS92vK5T/O2iKIKrHnVhagDegePiKgMl+ayazePUPy9paG1nYwKfCncF2
         9dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993573; x=1794598373;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
        b=A01KpgIdYwUUzEiu5EZP2xWyDAyQX8oMZz1KrptjBU2FcNeRMBvENvNL07klu3Y34f
         j6z1ABGKgMXDFuy/EFF2SMH3EQoDIZck+kmZ2+FUudU5wjzJUYC+as2WNuk6THatS1Te
         ayiOmYqYPqxlD734tRqgOcQ6+r+uOacZAZ9wAD9/RpSyU9y8Ytzj5tEv+DLNQackzQXU
         k7eKZ2/OM5nPjVbyNfMi4p3/IyNq86PTx9uLJW/vGQG36Z8b96YaFCOG+C8PTHcVT5pg
         1hNauvlZ49sGcVKedatPJQHReGREYF15Qj556yMqX/u8x4k+oaR3Cth0obr9a0bzIgXS
         MOng==
X-Forwarded-Encrypted: i=1; AL+hErGvfqoFS06yZUbes2FoHsNfYY6ftdr5X3aDSA8PzeMldLYpaOzhHI0ojBcjT2J0N+WaRyKRm4ea4YVa7UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1WnHT87YKGlKsvSxjvK6ya64A9zok93Cu1s3BQucaSe8sGnG6
	YnGz5u+/GTOypTQ1P5t2ksJbkEsCngEZC38Hm4V1vXi9DXqvIXQf5i9voeMXZK1g9uIrOh8l43s
	UwCghsPSLUw==
X-Received: from ljou21.prod.google.com ([2002:a2e:b815:0:b0:3ac:e012:5784])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:a80a:0:b0:3a9:8762:d77
 with SMTP id 38308e7fff4ca-3ace3028f4dmr14685591fa.6.1793993573005; Fri, 06
 Nov 2026 11:32:53 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:15 +0000
In-Reply-To: <20261106193129.43493-1-dbalint@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-2-dbalint@google.com>
Subject: [PATCH v1 1/3] platform/chrome: cros_ec: fix alignment of ec_params_pwrmon
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Sync EC_CMD_PWRMON structure padding with ChromeOS EC firmware by adding
explicit reserved padding to struct ec_params_pwrmon (2-byte union
alignment) and struct pwrmon_dump_info (4-byte struct size alignment),
as __ec_align2 and __ec_align4 expand to __packed in Linux.

Fixes: b57af7f8d194 ("platform/chrome: cros_ec: Sync host command header with EC")
Signed-off-by: Daniel Balint <dbalint@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index a7bd69d83522..6d74371c7074 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -6635,6 +6635,7 @@ enum ec_pwrmon_cmd {
 
 struct ec_params_pwrmon {
 	uint8_t cmd;
+	uint8_t reserved;
 	union {
 		uint16_t set_rate;
 		uint8_t channel_id;
@@ -6651,6 +6652,7 @@ struct ec_params_pwrmon {
 struct pwrmon_dump_info {
 	uint8_t channel_id;
 	char channel_name[32];
+	uint8_t reserved[3];
 } __ec_align4;
 
 struct ec_response_pwrmon {
-- 
2.56.0.455.g6c5a503b38-goog

