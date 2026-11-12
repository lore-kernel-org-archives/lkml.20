Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478957;
	b=DiZXD28tL9wZHRSe1Ntp9p2dUXG4LENgNxyRo5mW36tndayTmCVW6vWFAbPLKv44AOwQ
	 oOGU760ki5ZIBAqhTqoj+ie0hAtN+qmTTlaELJvR+4Pwz6yvyc7b8LIFWWPVC6dUkG3st
	 pOKFy0zEWRDBnYrs101Txo1rFFAfdkFJqhjufpq01TPigBmqyLTM0CWr8OgrE7fgsGibJ
	 Xw4e9OOmv2MEqrRL0Y1q7THfe4pSX/s8+g+OG/oWRN/eicwm/gdkSWZGMl9n/dLXSTtpm
	 4seV5DKYJ3LLmNLKFuXf8Bqa1OrmsJcby8BkyoC00z7jvCiDY6VS1z3cHAVjNkl3f+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=inWYmIxz6VFGDkaCA3AF8RBW2atE9l0zQleo2j5RdtY=;
	b=YTZ8SJAC9jNvj/JKrtjOIGnIxYePAiFPWboDADf3ZbU26Fx0kl4PTfpRVBpnmV/8J9cN
	 NebSdfN6Y7gkJPw0LZT+TROzEza0PPIswwdNQ8VFNVkBa/5Yh55OykULprUeBwOUDxN9V
	 MlQZgf77ZM0LHEMaI2n/VLxT+If63V929sIBEp5Yvb169N43oPo+1uEGWnLEjPxwq9Y3u
	 KvCo7/eeNaSKVe9pcPdwbaSziV61Ijnbl1S4zmiGYP71ZQi8zTNioBvupgRUu2e3KiZz0
	 35G6LcyG5o1CWICjOcfqXoOdxzAdqmRUcgAuFUOxsPAoRmPrl7Whq6Wc5zSJUMfhK6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVROfkn0;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B96606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVROfkn0
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so4912089eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794478956; x=1795083756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inWYmIxz6VFGDkaCA3AF8RBW2atE9l0zQleo2j5RdtY=;
        b=gVROfkn0IBUBn8WsD9STCPXOnFDT2DiXvQrwKw4x9RJDgovnX4BBNg8CheYTVkU9fa
         DE333abaVUYD0B7qoUBkxFnoRZ5yyny93zrg3JMXb7hnTJWXi7MkL83GS5hHLASiNj3F
         6l3WFsv0/+Ete+2BKpTJ+r6ujOe8BgOszVE3xWnTTYPahcEQbmW7EPgtGpWss4gBAA7e
         YXa0CFSYYtawNAPFXpuRSyG/HG0bxKQoZMLSTNJj0WaibAeO01lhFnsj8veKklxwlO6a
         75NkdD1LBdbgkRNffz8ercoTsCLlR6HfUKAdhfnyLWbGgtl20sW49gnqqyq2B4dmP4bu
         YgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478956; x=1795083756;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=inWYmIxz6VFGDkaCA3AF8RBW2atE9l0zQleo2j5RdtY=;
        b=fKCEk1vyzmEs/+7au7Juv78+HkPXPAI0IJZy9TNZob0BZMcjjw4vElZ7T/G8VzgWA5
         ZTeeSMeb5iMECGKlTt/kK45eaZD0Jjexn1fEjEQMWhaZmp9XBaKQgrBsVywFoSxij0wo
         Ch6g7NQR29Tu9y7IPbg17HJuyF+Zza2k7hxqNNxBcqksEhAbclGeVgxGhGqueqph7B7n
         A6jU12p9/Tmw4ohdgG95RryI6BLO9XsuC96ivMwZiRddqrJQQWB1uP0GCDq276g+gJOx
         7hUWi5OcnergPk/Tl2Qhlzy/N72saBsLwM8QefcGjx5D2OdSpecfOe5IOm8uPbpolUY2
         WvIQ==
X-Forwarded-Encrypted: i=1; AL+hErFh2x5LeCFNMeHpaq7CJe1AqUjM3+lcqDfHAr4GusVprsrzupVOdaxJiET890/uoZLoRgqB59HVH+BR/JU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ipTSdtF0lddx3jbPhtZRqnjekQdi/sTdM8TowcXNPLo4bUI7m
	P2bU5yB6JKKsAd4xTeyIY/wOD6c2kiF+bWtGrK4sN7Bg7h145MpXvmHR
X-Gm-Gg: AYBFou1OIrC4RRZloipsJvDZqEu+1ectlZUBW9NFX9XRjcNrCTJ1zBCzyjpDN+sISLh
	6AmyyCxk+KkecBtIXzy/L7+aSqO7AXiuTDlab58b5ZKiB+2aqJeQKsyBmJNhL2cDMKcl3Rwo7Xo
	4QkPwKiEa/wUnJ15COc+M+f9borsjxr4DYiA8aj/1rofDwgzG6FlTXeuoYT/S1FTNcpToB8C6iE
	cUcjC7ZAY6V5NY5thS2SxdRXn7Rf8l0e7ErWRsr0q8e8hDOmCvjCKvP9BgCdx6NzpHsDDhYVd/x
	DPeu9px0ncJ3gBdKWdhxPaM9Gn5QKhXXHH+bkX/jRJSM+bMBTT+JMCsEq74eXRN7CVLIBIjN5Pv
	tMdspeMxOCEMn9rTsadh62dHihWwyy3L9fng6fEQmJHt2pWT7pt8sYy+FbesvZcG+LA5iYSIn27
	44p+1W3CW2OWlCL+5my7DFVJY2WBVI+J3MOKKwLzWWz05pJTdVhQr4eTeVtkGHde6FSuzaAZiTT
	rgeaC5Kg0XA4z8NN5ysgbxtGNnn8Xia2OnxuoO1pF9anH/P6DWmAjuUbB9Vak9oKbnRvTe+A+0a
	cIBFa23m73AXtdXJaqVKZ/vddF+8LkSnm1iE/8Ob7A==
X-Received: by 2002:a05:7300:cc9c:b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-37686466019mr5517230eec.31.1794478956100;
        Thu, 12 Nov 2026 02:22:36 -0800 (PST)
Received: from [127.0.1.1] ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm46483638eec.18.2026.11.12.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:22:35 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rvgen/tests: cover an invalid monitor type
Date: Thu, 12 Nov 2026 18:20:20 +0800
Message-ID: <179447882047.254241.3226415982233977960@gmail.com>
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
Content-Transfer-Encoding: 8bit

From 0c12bf144a7267be93a9e45d872eaaf0c8a2d841 Mon Sep 17 00:00:00 2001
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Date: Thu, 12 Nov 2026 14:26:11 +0800
Subject: [PATCH 2/2] rvgen/tests: cover an invalid monitor type

Add a rejection test next to the other ones, so the new check is
exercised.  Without it the command exits 0 and leaves a generated tree
behind, so the test fails on both the exit code and the message.

Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Assisted-by: LLM
---
 tools/verification/rvgen/tests/rvgen_monitor.t | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/verification/rvgen/tests/rvgen_monitor.t b/tools/verification/rvgen/tests/rvgen_monitor.t
index 5f2562600..2a48a7b54 100644
--- a/tools/verification/rvgen/tests/rvgen_monitor.t
+++ b/tools/verification/rvgen/tests/rvgen_monitor.t
@@ -64,6 +64,10 @@ check "invalid monitor class" \
 	"$RVGEN monitor -c invalid -s tests/specs/test_da.dot -t per_cpu" 1 \
 	"Unknown monitor class" "Traceback (most recent call last)"
 
+check "invalid monitor type" \
+	"$RVGEN monitor -c da -s tests/specs/test_da.dot -t invalid" 2 \
+	"invalid choice: 'invalid'" "Traceback (most recent call last)"
+
 check "missing dot file" \
 	"$RVGEN monitor -c da -s tests/specs/nonexistent.dot -t per_cpu" 1 \
 	"No such file or directory" "Traceback (most recent call last)"
-- 
2.43.0


