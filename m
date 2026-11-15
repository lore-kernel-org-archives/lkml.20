Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739096;
	b=RZMkLbfRpcUihIo97YcI7gtETn0mT+DFydlVdKczOO8Us0S3r0pjGTQNtR/feK7C1chO
	 I7bHLCCqUqBOTrYPqk/y9I/Ezixfn+Sw5CdZnEccr2bpwxA7h9pXhTuBExowPYRFVo0Iw
	 tq51A8w2TinftLZlzoF/8X0kbxjAGqNMdK0AtapgXOngNP6riVvp88fCA8ogK80k5dYBZ
	 7QUJfAGLv1YMjvem3QX9bBz6xUqjv0HvvwcX8HOtMoNgUBy/RhIiVdeHxX9sKV90LXqKD
	 J+Xqc+bFwj0f7Hc3wVwEVA8S6IymET5ifVPs8KEHHPM/w+miZRqEX1VUErOugMzholg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y8oiXQV1HOy7NuomfkqPftUJd1Ir7JJpxig8oQcCTK8=;
	b=V8B/ecnfBL9sRxY7j1cXRGM2t7La28seC+vRYGqqiJmOCJQlBG1oZkMdwmcEOVtjZTso
	 VQuuFZnzATXCKleAbPgdU2T3XtDZEFyiHgvB6IjxFejdmSPxucV/Ib5Y+IIbFTSD/5UFG
	 JlvA/dGTN8ryYJeSZKytWE5QeQ4iq5e1kL7JgChTh3Fhqdldft+TJ0sauPqnV+p3dEZ3G
	 fB6tfJtZ/23CXq7Ka9sQr+Nd01qg1LOUFDEWlzezkUw1KJwdeXglh7Tl7wwIUirjJvo6M
	 AaTGzI2gMLRpMXmlxBNIdAgiaN0M8ucG0ohHnMYlB8FtA8s3RkxWYRThgaU/hFeYkFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAgGLWci;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8258C606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8258C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAgGLWci
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso1276513e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739095; x=1795343895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8oiXQV1HOy7NuomfkqPftUJd1Ir7JJpxig8oQcCTK8=;
        b=fAgGLWciBjUBmsBp3/62k5L97NrmqQfGrjl/XpIJfQD5buxxAf4J+bTv5zbJ5WVB68
         2+T+Q1NfnbxRCZtPXTRxEWWPz2I2sg4aZs5Cb+dXgPIeOuqvGkjSlWZYEp5LAVsIG6bP
         kogwv49fjey60nhLHHgqyYknKGHEPmMMCGZgjaZ/qpimyNWPfpuLwWrZVzYMJTfrYOym
         ZhDOjTEajgamBu4wIxrIiykX8RPISOJab3Z0+ce7CTwwABZyxRHn8leS+btBlJSCFSdE
         9Tql1ThL9OAS2wuDv5uZHP3CXtOGBU5bOu6tXg28A3/8viaDyQEIJOtxjo4wbZWlMIf4
         UG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739095; x=1795343895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8oiXQV1HOy7NuomfkqPftUJd1Ir7JJpxig8oQcCTK8=;
        b=0EuDRhm72bxMW0VSL13yu0UrmqW8NF6hz2WOFFOBOy4PWp1Dn6otZMWWo7vHTeMlvq
         J58gaxFoFYVCyMkRTipYKrQrYzRRfrgklP/l0v13SD9QHhfOmqMwGh8q6RDZk56NwzhR
         u4gul9CGdIYRAVXcKil77BGpWSe9CaxQOdEJIGe3u/LPZDISNNnsFyUBdsUlHW0IDxtM
         z45mRvkWvdekC0bpHnZza++kFhNQMQBN+OAOW9LrP6hQ9BpeT926UtEWVJgH6g7LOHyD
         SN6sLT4SmWK5eWi8AGGomxYhOmTiRKzDMhFOwVGBFWtBFMkxA8fG2Q+0WkRlHfX159k9
         RMAg==
X-Forwarded-Encrypted: i=1; AL+hErEZGRICVDkN8xw2iqHltl35gxpCAA2pOnLxUAf4RbUH0Ctsnb4XizGUkmiRFfK1uo3H8Sf4FvL8Lx7Zrow=@vger.kernel.org
X-Gm-Message-State: APuU4Z9meV1lEw+uN9IPhRq6TMNdsOJc5w8jFc9kENaX7YXb+iKLbMzF
	A6ZHKaNTEU6FdSGOXiZuOJJroGmdfKazP4CsrYcxl2f75hAGsXHHq4DsFu0ffo6Z
X-Gm-Gg: AYBFou0bqP6DcgHED23+Ua8psuNB5Apa4uQYJaIjqKPqqCNweEOW6LPjNvuYq/lxRZV
	Do+paHAj8jZoEt/T24iuBaSBJZ+dmcr/tlSTQh0IuWaHegw8wcBivv39ErbOqSA0lveTjU6lji3
	cFqNd28tRriEKxNJqJoiCisYaiX/5wWaUH+j/QHIrgyk1h+fGWO90y5nHrmWcllTTvlZKayyDVM
	e4uhr0qYRFKv7k+jO4CXvxw3SrhMGKqWqKYwqn5MCQz7b26zVQPrHaTqe1rcaVvAs9qcH/ytuBB
	Y/2r/fqIEmCW+n5ECXSwZak7TaKtmqV0Gy00PuYfqHB5iiqaolbfeocgoPHy6YUeUfEUqFJFi/P
	zFx4cO6l0UfAmyK4iH1woBAPj0iaDo6kB3aRYCl0no6tL1wUXeVywRIbJW0xfNL7yWj3t8dRa+o
	BU8doLBUHP5dE5egO+B769yGBll50IBPO2ljlRC/3JSvyN+bKv7IjhwTeVwa/pilMBpgs+oqjTA
	TCzPW4PWX4K6Zyn2eLCFpm4rWbRO96QMtJwNGqwmfwwz0Zp6lRWX7OiXO7VSNNCNeayL3oscPcR
	ySUkh5wr4U1rv22NUIwvA0ZBfjUcU16HFpbRx18kxnYvrbS56zf5DNBfp87DHH/skOknNAo=
X-Received: by 2002:a05:6512:b1b:b0:5bf:b7d2:c7d3 with SMTP id 2adb3069b0e04-5c170b51016mr2198984e87.39.1794739094460;
        Sun, 15 Nov 2026 02:38:14 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135649asm2304491e87.77.2026.11.15.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:38:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 1/2] alpha: parse early parameters before reserving contiguous memory
Date: Sun, 15 Nov 2026 11:37:42 +0100
Message-ID: <20261115103809.1288167-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115103809.1288167-1-linmag7@gmail.com>
References: <20261115103809.1288167-1-linmag7@gmail.com>
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

Run parse_early_param() in setup_arch(), after machine initialization
and before further memory reservations. This lets the subsequent CMA
reservation honor cma= before start_kernel() reaches its normal call.

Initialize jump labels first so early handlers can safely change static
keys. The later jump_label_init() call in start_kernel() is harmless.

The parser uses boot_command_line and guards against repeated calls.
This moves all early parameter handlers, not just the CMA handler.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 9fda01b73b18..f21a7c8f5213 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -25,6 +25,7 @@
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/jump_label.h>
 #include <linux/string.h>
 #include <linux/ioport.h>
 #include <linux/panic_notifier.h>
@@ -579,6 +580,10 @@ setup_arch(char **cmdline_p)
 	if (alpha_mv.init_arch)
 		alpha_mv.init_arch();
 
+	/* Early options may change static keys and configure DMA CMA. */
+	jump_label_init();
+	parse_early_param();
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
 
-- 
2.43.0

