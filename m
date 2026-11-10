Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316846;
	b=m/pwHBIpgRSkXAEdw4VBzwe1+JSyaf8KIz1LOXv6xNeRDRtjrktkZF59z8bE+II23DtB
	 tnvKMleHoyRmMAC2I7CnvnexlGitBdETcHD5qYPBdc/+S7MjfBYvQ3rzt98YW2xtcxMr4
	 qjJh08hL5kXnTAVoR8ZxftrIPBGCiqfntaCYkSuTUa+6WpFCN52ziYk+PG/9u1zfSJ44E
	 KhCQQne+aYK/AmbNNz+KSw5TbWyUHVQ4E0cAHZ57Qaz6YolxR/2jnbR3KI4rfEzShM+ul
	 aembEAAbQlYfkTT1E1C0HFlkM+JHZDImaMJ4i7yuSHNoC45NSNG1t27TmiDKePKebhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nOV6h0PZaqwHwVMl2GxvCHfQDmp289bzmQPwDxXJnZ0=;
	b=Q7Dd+0DsIUreI1Tox+aQU75HBPkEmZxeKqn6LYmqTDuD5UwBG4cZFh4S+8MyWwGFFF+H
	 42HSWK13/EKbXHINB95Qx94+McYz/Ta1Q22P15bSNLLopkhCzzrZAHiXnt2A4snNTmY2h
	 VKmlTyIBErquipWNFvaj/KXk1qrjlOEGACDdZUqMX3URJEOa8WZLURGHw9yDdyYzMmSwE
	 ata3x2fFV0JlESsq3piZD/4tXiXkf/JGuRFEHwHwdwmo3crhaL4cQq0lyLt87EZSbzDm0
	 jHdE4ZEEut7BNZx0cGmS6en1KER13pnSChTBGQQVt1E0W5W4ODeB8PJrW6KEJQn2/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMfdCrHB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77860A6F4C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC77860A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMfdCrHB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so24650105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316844; x=1794921644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOV6h0PZaqwHwVMl2GxvCHfQDmp289bzmQPwDxXJnZ0=;
        b=VMfdCrHBw2dfp6abCT5rVeYVHN0aZKjAE8RDXt5VvgNtzo6LeoUbcNxkJjTkymNzLm
         fdHeygnzwD0bqmE7+K478UL3kPfaxtQ2NHMjNHV4ZezRWeDlLK9pEK7bsPSdGds88wq4
         KZSUinfmHGlcYgqCuC/e8j7qdy30r4XeOvsGDQRMzkFZhSH0++4Ik2S9rx991hw0a8tU
         YQQ8I+BoMK+fhwQFksgN5i0vTIQTWrfM/u4SZw43iZul0GfZkvsE0MuIORUcLFIZYZ8d
         qZfjDV0fcCp5N8OCRO3gb3KGNmG7nma0uKqRmhixoDK8WYv4H6AHJvJVweOSljthRDIF
         A26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316844; x=1794921644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nOV6h0PZaqwHwVMl2GxvCHfQDmp289bzmQPwDxXJnZ0=;
        b=p0J3GfgL+VAzXpG6KGm8ptON8YkJSIYM/vTLwkJI0RFWJ+0Zzg5Yk0dlbzlQUiJhP0
         eZxjLFQajkJRUHVyAQB8QsKNFs2Ygb2SdAXUHPtfxUxJbQdkrVdwEU0gprNmQbxO8fZZ
         oXq/GhjlC6yfcZeI7YOeL4FyJXYVUgIGMS1vOAEB2+GRnXPZO3yQ0ojxdQIDLL6ucsxl
         FE4g2EP5ryWryoydpsufe12cGRbUWKkUzQL7yZ3gp0t5p2Dz3R6unBtb6tg8gd0saXaX
         kGB9HNXHp9xray0Yd6snIznV7rIXHtvUEGcXDIA+3fe87/BXgNNpFvhA1LHl/QajSVIb
         0sWA==
X-Forwarded-Encrypted: i=1; AL+hErF7cViWhtP0xXUbirmq/fxtpDlymlyXfgWgOnwNqCJzg7rFyyobVPMPdsEOEvOejbGkm2Ab6/EDU8CvzY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/D8+dWGy4uU7fd44XaG8CqLJLAz7WDqx7WN/bhjijBpi5QwMA
	ZgxcBtATy9lVGqsvpkts4rAOT5HiYtGkWvf+kyvUgcnevA8mSNUw4we+
X-Gm-Gg: AYBFou1Hlzk9k9GFVQaPu7wa9gXb5gp3B2qxME62EHCJVDdn5LSaL2CIXX7P8CGSaqf
	34K5J4tptUAj6q5MdlIuWgCD9Z2EVJVDRVH0FoEcocZuYfUXoOHXjWe3dcL7Tyg3zRbD9cxvaPY
	/B0DEwGOeiBG4+hkAuG9JMqhPw2+yA1sxd/rk6m+jn3A/DPUNK8mrg0iZHcFuy4hd9d0lygNTa4
	o4rxaMKgMLWG0xjI7zljFOWsOmOnsE1m5lsaQx3ojqN6ZfV7QlpjXMJ89/NGA1OuT2fUCICGxCt
	tKR6/qHMdKvzq/xWSvDqvCKo1uuq6mJNQWK4aSg5UWL1vKxXCHmm1WhkYuFGrwkanHjGt5MW3ps
	E/QziHDS7iL4V0FzL5ADojwCzZ5O3SXwbGKyV7LrfrZEIdg3BRZaXt/mP2se45DL/6O+TNGxI3U
	yisgntcWo+AmQrbvGd2TvWg08lAbizyJRTqGCXGEkbSlbt3xbq2nhKD/tDO+b9GfQtIOdtz/32P
	QAz/sVr28CrKW72ydOfxl+GQLY9kxnuk39h0cbsJOIpDxfTaiJzrwsq8lVEcFPSWeo6xI9OZDcb
	66FMHi1EXEt0sx+XTz1InDnEGqWe7n8D5f05/6HEo/erEVXsL6nfdRUB0y6VKfggoeTGaKhroAw
	m4UxAHUArEnXS6JW1L62COZLLH3+3zULUfi0meJas
X-Received: by 2002:a05:600c:1f87:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ba023485ffmr42762735e9.19.1794316844000;
        Tue, 10 Nov 2026 05:20:44 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([197.45.135.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm5043287f8f.10.2026.11.10.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:43 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Temitope obabi <obabitemitope765@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Remove unused sst_ipc_inbox_rdata tracepoint
Date: Tue, 10 Nov 2026 15:20:07 +0200
Message-ID: <20261110132013.732-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The sst_ipc_inbox_rdata tracepoint has had no callers since commit
970d299b0a0a ("ASoC: Intel: Remove unused code") removed the last one.

Tracepoints that are defined take up around 5K each, even if they are
not used. Remove this unused tracepoint.

Fixes: 970d299b0a0a ("ASoC: Intel: Remove unused code")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/intel-sst.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/trace/events/intel-sst.h b/include/trace/events/intel-sst.h
index 0416e91f8181..ae7c269b0824 100644
--- a/include/trace/events/intel-sst.h
+++ b/include/trace/events/intel-sst.h
@@ -69,14 +69,6 @@ DECLARE_EVENT_CLASS(sst_ipc_mailbox,
 		(unsigned int)__entry->offset, (unsigned int)__entry->val)
 );
 
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_inbox_rdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
 DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_inbox_wdata,
 
 	TP_PROTO(unsigned int offset, unsigned int val),
-- 
2.53.0

