Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803113;
	b=1nVPBIVXrq/aCOUlbnf3KuxX5SpgFA5WmawkKGLSdwMe88n4pQOiYFzE6AeB8Ki4kC46
	 WyMJ2Uo6oZqhIrkNAFwRYRkwd9ea+EI7+Rp+NmhooLI9hjQobn5uNrGHOuQKCx0NYG+m9
	 ju3MABNmUdYpWuAbhftPDpKHG81haPMOmqUmOEMa+q/D8QhHs8q+xRx7QMuyAF9iIo2jk
	 5evfr6c1YeoYaNkzq1FlBMAgD9rGvWGYazmylieytqKFbCHNxkms66pG04agJ0uKjMV9b
	 3jmvharTji//REC9d7jx5oFsurT6EJpMAkgvp4w5hiZbc+50Z1quX6xCsKJLGbhI5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+y0vpLA6rDnZkZJGvTpFSS8QdG6zDUiFg4vlqbK0zls=;
	b=PjkXnpxO2BwlCh1eD6zbID0tvQ/lIgR7IBp3z2RqNH/4Ud6Z4UBhw4JubTHKOCgDRjs2
	 hk5sRHYm80LrYk5dJ1yIMEH4o9L3HwLAbMESumLx8ydFoUetUJGYB5ktmafh5Hqxk/NBw
	 ptNdyWPA73WVtinmL3BH/7HNf3kpDERe44dN3F5cDGqR4OTnjmajh4aQue8m43bWdg5GU
	 /oe6j6cIpPf+/P8JI/dWlh5E972Cs8OlVaNzaZVgtGKO2gVyksVSe94Q0sN9TXr9fLkc7
	 MzpJpVrqsGNP9cahdxasmHe67NsTi7WYevH8peDggAnVI9//8TVE+oDHUMuarqcj0ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1cZa65q;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524C606A324
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0524C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1cZa65q
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95bd1c14cso11947905ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792803112; x=1793407912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y0vpLA6rDnZkZJGvTpFSS8QdG6zDUiFg4vlqbK0zls=;
        b=Y1cZa65qKf3rNeVmoPQnEIKAF6xrQhj1+SuXNOEflQZczWW776jP9jQfcFQR6OfJV3
         yqF6PfKNfijIBpSnQqCst/hTuWflEY7lqwUKFO8OO5VZ5DjzBE+b3dFU9PwoJxIoU5yx
         wkHl06/LmYFBuagl6SSUwI0oJW4wcEXUQyUOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803112; x=1793407912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+y0vpLA6rDnZkZJGvTpFSS8QdG6zDUiFg4vlqbK0zls=;
        b=JL/RpsUBIryhg3DXuWwaH16CDfIzyBOfe/3lKj97hvZkFn9gPu+yWoO00l75i2mejs
         ZDBB0yMZkbQO/39Yaj79fFHng+F8xcs2HMblWcccST97dNpulgLh+aG8KOD4SlwlHEcw
         c2bwX7IEvcTI+4EAxufeHOZnz5lUfcG5zwaxbLrl4v8RVo279PXO8bZq4vkMtm2za2xm
         y3xa+G52s4qnIyVTGuge27qgLEB2ngPsIYRDwJhHK7rsqwB5zOx3sI7L6YffHw6V6Fto
         zBMfYRUvuTGQ4VaSfJMBoDnwGmPIK7w83ulBFBB0dUDDHb4XJK9nhCNGgLQjDSGiLID7
         zqww==
X-Forwarded-Encrypted: i=1; AKwUvBwlLhzK9u8L+rmkUowMI6pliejQxioETZ7VL3P4fW8XmazLAASQKlhOty2uo2N6kOqeOpUtOKyzsUb+x30=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/vJg3jkB3rmYV4YDJYIb/I6+GAQaOn2m2zWfP7UGFhG89k57m
	HDjWr1Jc3HA6i+8VZUH+/FQGs8QMNG/il4nl8AOF1KDLsatFGKZWLXeMzrHo+YKc7Q==
X-Gm-Gg: AYBFou2HaCi880OFAbcAxPhsC+nVGhKBaTJpuuaZM7fV9EAGjzruIUiYaE60TE7gHOM
	cMnCldaHrNX2Or23xTKGzFl78wzA7xB3AIF3MLKE81ELxwBDBl2w/YhIxSunaCwyyChRdis6gkw
	cKECHjpzY5GKuSYNdFJ0aohO+VPEKYXHnT8rTYW/4tigTiuBSbKt06spmqlmAeT6HV4OyWUcsJ+
	64kcWoFpLex6F+LYnWX9v3L1PkkMejiZkauWXZCxVVWUDHGwSkPuUM7/g/TLw4RK8F6ieZ9W9nP
	BF2uOcrzgTvVPAAH2X7duhKJ9CwnZqUPxPSnXJRigEm4KIlKgAlk1icz1k+fd5DjlA5+MG6CXyl
	JEK9bws4tgvTUCcYmYSP2mhTjtrs1zGF8J6mvBYhNaci2mPJReAurHLa+ZO4OH5YftjptcHDYcV
	yuJYr4z9EZSA7SF5+7atdgXlEfzZ9VQIxR1uZKDr9bGIyuY1YKic2dPUvkH0RRmhL+AbRwiXaPx
	IXkHwOdk2ugq4VlyMqtbglqfs++nfRwaz8vexNQCPSYzSrqNoAYTrTfvv0DsvL4ghl4jNz/+3RU
	PeA6C1wsz8hxt8/PpMmA2xnMIZpEafshGXEJwSGNAe47ZRiUbmWavxSF3cpAJMw=
X-Received: by 2002:a17:90b:33c7:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3adeae78223mr710221a91.50.1792803112460;
        Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm843763a91.9.2026.10.23.17.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Sat, 24 Oct 2026 00:51:35 +0000
Subject: [PATCH v7 01/11] Documentation: Correction in HID output_report
 callback description.
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-send-upstream-v7-1-abad13174b43@chromium.org>
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792803111; l=1212;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=IwRF58jgSTKP3fdajEFSeRD6vCiZwxLFM3sXfjl8RPQ=;
 b=sqNkuLc95RysONWlhkLkd5q3xh/LjwcP5ptF4HGTo5fIv2IBDuCMHn321hsAylqkyHBNqNSSl
 je7LcVE/CrEDf3mcpNveHsUUJQfwXAnE0sFD4Emc7TLquH4W7kkL6F0
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.56.0.257.gf7497c7d27-goog

