Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869242;
	b=Oos4zeb+MvOm7/wHzf0atK9eU8Md0nHo1EEgH0uJSfpijt6r4udTjRL2QWkFsjpbcVax
	 yWVRG9GNTeDAqk1u86u51ByayLNbCtaNDsOXnx7NKUNYqBV0C+DGsPrIPFj5Oi+KWLX4G
	 d+4v8t+IpAxvqPc4r3F0BIrd1+/KYd8Rc3jXVO4w+Xkv15J1SYAVk0Gi46awba2MkRags
	 e8s4P3n710eAsKKklDLRTFrIaPPTQ7WeLJkch7qLYsqAGYNROswxhaElFMkUewSd4wikE
	 SlxvWvrH9K2PqdV5uDZcLkPHgSD408SH8CmUqagmmcgJs36norjRQ4YQDR5vef3DyKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IwLfmncwgXXOir7e5WceUGBJ6iLMIduxAy587eWfRD0=;
	b=UlXVFRqmyPYkjI6CSNy2VT2HHgSJv4OsqbuixoPzy/4GFOBH1gvcV3hr6dWf+TXJQ8Ze
	 pdC1Klv4i+h/tGyYObsy6AfMM6NxBg62LbqTFoPqEduksTe8BD/pHN2p4PHBDsUYzK2xT
	 0gBPMgFkIpM5znIuhj3q3in+rwin8YgppUUFPJyydBODRsRTgM5XbmWIJiGTnhP8jd1a0
	 o+hPh4SngKNoLxrfeNUH4x1oW+Md2qYnrwXaMtHUCLEM0OF9xUcNLu85A69grOZwUxnyp
	 mPVkMz/Epjqa4LYPkOaAGpJcvVx8BJRukTys14aJD1NYGP02Lh3W4DKuiH5GWkZh0xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OWHz60La;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ADE606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53ADE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OWHz60La
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4825310c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794869241; x=1795474041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwLfmncwgXXOir7e5WceUGBJ6iLMIduxAy587eWfRD0=;
        b=OWHz60La9AXudh80xsZOCT6AunWRd1WCtzxOdsNHIT4WpdWqrXILNkKbnDAS/GcSEG
         D7iC3nZplK+nxTIw1qEDnKjPi5Y/l1uXHxYvesGPF03F8tvfYgjdTdqdlWqed1bak9VC
         R1DkXTTY4kO+hJsX0QDhysucXhbgm3oKYaEfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869241; x=1795474041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwLfmncwgXXOir7e5WceUGBJ6iLMIduxAy587eWfRD0=;
        b=HBiBN4Y7NUtUQC+bCejv1ddshlplL5ADJf4w3NzFHCd590MyxQkHQW6MiTYgLLISsB
         HE8fam5YEOfUU8fmCVKsHfP5Y9GDWO7c3TbVvKkbN5FGxaJ5nBkYo8y/zRBMOiUx9U0c
         24NdDzuVc3TvpF/OA5R4NfFR02xc9F23PJ4AHIRy+ve8jj/yEv4rytYZS2I1EjrXc/+r
         Ap38it6OOXY4EtJZqQG48P43Wpk8vvW2ztGOvmmUDT4FYtNu144z/szDhCYKpfVB32Dx
         Vbq0cdgl4qzpK75SYhknH5H4X9gTVe8MpMAiZARDPmhfGL8j3vX3qfnSnwQ+YEt4zGJm
         32EQ==
X-Gm-Message-State: APuU4Z9egn60T90+1ARiGUsbYqyq4uao8tvv08ZYN8DmixabEKcrJqoW
	iE4jSRkjgeBKFHelM7jmy0xvG5ahMTPgFh2446UExyTvj59qC00KD2s40gmfTx1RJ571RSOWGkn
	x8b8=
X-Gm-Gg: AYBFou1i0bEvF/8GgVOcdZAP/EHZAiW8txO2yWHJ+QX4tNVj7N26arJ9sXUDU0Yfaph
	yx/hxEL2lc3YQzCRpa8WoQk9xtF2SIaguo9pKFhPDbZe8LgFDiAwRhJR82KlnbksXawuq/Iv8IS
	9l72BYKRn4O/aWB3PQ+EVfiMTMr/IQIZKxiXVo8TJ8QYg6XqMD2Vns7gWE6Pt2poNpKA5CDlbWI
	inmUxxUUf6C0AfQRFeQxlPZ26DwdrtqtdF3zpe13UEaTMUQ+zdBd5OM5SOdPzbmhKY0oRA1ULO5
	yTog5f4HgyOJCexgkkFTxw8lLTfTWl1mJfakD8qngYgvOcdOc+5QWscplNyrLDIkBLVWOzmcBDK
	m/QRhX6MmbmIAMDNa/IR0NsN9XuZz3euZixSKNpI4zP6z1majwuwn7+2Q2xU67I8LA4NimBwNiF
	DGvr+aX5H3hBElJ9cUdN57beev0uaV9mre7epcv/rcRSDWi1pUsEEKPx0QoHBwQWS7vfWshjzkX
	2QvBZrdeFHd7+7ebMg3HKUNSwEC3EshjgmkQDrXhvm2WHcyq8Y4Vcxw0AfPZPuIpwtaYJWXCOl8
	UxEGQvb2qpA5EZxEIJEB4b0jZNmc4HrwE6pp6nxBoIzuVNaNMRzkKPMHFyRiyVAhfGE=
X-Received: by 2002:a05:7022:b0c4:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b5030f291fmr9804741c88.18.1794869241395;
        Mon, 16 Nov 2026 14:47:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:264:3904:fc3a:a69a])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5329ec87bsm8470305c88.0.2026.11.16.14.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:47:20 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] tracing: 'select' GENERIC_TRACER, not 'depends'
Date: Mon, 16 Nov 2026 14:46:53 -0800
Message-ID: <20261116144652.1.Iecb63200dd245f62032a3b1f60ae78cc48868094@changeid>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
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

GENERIC_TRACER is not a user-selectable symbol, so it's impossible to
enable FTRACE_STARTUP_TEST unless one also enables some other symbol
that 'selects' GENERIC_TRACER for us.

This very file also suggests:

  All tracer options should select GENERIC_TRACER

So, use 'select', not 'depends on'.

Fixes: 60a11774b38f ("ftrace: add self-tests")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 kernel/trace/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 35d043b19332..8084d46ef2a0 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1135,7 +1135,7 @@ config FTRACE_SELFTEST
 
 config FTRACE_STARTUP_TEST
 	bool "Perform a startup test on ftrace"
-	depends on GENERIC_TRACER
+	select GENERIC_TRACER
 	select FTRACE_SELFTEST
 	help
 	  This option performs a series of startup tests on ftrace. On bootup
-- 
2.56.1.703.gf848ed807c-goog

