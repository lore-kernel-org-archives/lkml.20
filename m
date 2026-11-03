Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667149;
	b=O+QnNkUWGWZ+Lgb3oYdyKmLKkR8A0bNXN00O65c903nnPu5YvBbyNz9TpJuj7hrwaMbF
	 QSGUZylCbn9G5pqQJ1t+GvuR64Zaekz/L1huJhha5KRpPtW22k6PLvlSQ/ag2ZTYQb2vT
	 E9v/iVgqCHYktipSozN1rGohs8x6GAM/USJMba9SZ/Cc0j/+3RG23iqCH48pKK3M32GE8
	 oG+h5wFugCR6XLpufnfZAVNoeO7L0zUru+QhXHyaQwSOzDnNWU6nIjrJnwL3htWXeLIn5
	 oCLNink6qQzSGzLVxPEGSds99qrQnElM63I4Jt/oPu5VDpm4NYYmCb3OftAGgioBwRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PHN9YZcJMsowYaUcF99MiiizJlDDuKpWiJxJvW9EH+A=;
	b=AM9NpWa29Gw7n02uC0jz4UXsMdDHugip7K7wR95DKTfEGX4Ci9RKsdlb6RNW+v0F9zn5
	 +f7W1WG8U+2a8Y5JbQzXSH+ZVUcaFXMxed7IMVFOrMdkNvaLvT5vLJ0OPPYjJ6x9QXZgE
	 3nnXB3csMTgBd8H7p5fEO+7zZlS9T+NKbL4sRYm0KLKPe89xj988rpiet/v/KI98rVhVO
	 zcqSmpwrpFnPZv6oXbn3zZJ5nvY9yQUAS9lisz8eg0HvjiRe9T/SdU9bUM7ns2tOQ42Na
	 TG4wxrr9MtBtx34I9xDz3yd/IaKcqOz9ZYKQ4LvjlA3onvK+rIhavcJlj6P0KEZyTjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+4NbREi;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130D1606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 130D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+4NbREi
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1310914a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793667148; x=1794271948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHN9YZcJMsowYaUcF99MiiizJlDDuKpWiJxJvW9EH+A=;
        b=T+4NbREil113iCWyzl/G9gT8SUZs6vj0+jBzKG7gJqt823aBka2YVz3tZ9Jw0CN4d7
         7l/a09owu1bpMwGcGrZFx93zrTgf+d87SOTo8z2FlEEBBKz8E8XZySnARheHOFgQuDE0
         wf5Nuh7gCvG5dOMO4JqPpHe8Dc3Z3AyriRuF1OFEkT4RAbLlY6TAj5i7BNlc/9Kk0zOB
         2ztuhe+6iMoPgbjMwS72LapXmgadiojXE56mBZ76o5BwoHeWm7IY3OltKL/2gBw7eAue
         vFXGF7kJz6t2eb8A6lH5m+oI9UOXOeLmpYJVsrY3bWaO/DZEq+ZERFfnfRX+vn5lpfOK
         Aj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667148; x=1794271948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHN9YZcJMsowYaUcF99MiiizJlDDuKpWiJxJvW9EH+A=;
        b=SWHP8PUy6Rdm9lwnN4pxmw3X33g6a4CxFf0PP6V1pxCuuUZjXhPmtENDvvw9zL2aNw
         RYM7DMrp9W3oiIIrdY9ZWfuaNhjE03k8GsnitoBqTsE4o1XayE10jK5EJ+swIiKLIZAu
         Mfeqt12npXYjjewpy1OI5xlM/dXkKkMTkmeIE3OlI2JgW4vsjAyv74XH+nvV8MWGyMH9
         dBrDuhe2Zj9obR9i61BhNamrB3qb/3mHzgNnuhDzI9yDdAOnmpgWHa+ue9Yf3siEOIQV
         fTdIF+PxBfPxHQevQ14C6OCTJtOZQMYJDW+2LXapd0PcbyZWWlwdwM6kjoM9SKXOAyUn
         ss+Q==
X-Gm-Message-State: APuU4Z+SpPyndZsLhrZA9E4Ok/ZoqQa0VscJz3+DYVl4yYIbcZhXfoUC
	72b9L2VMLOyTnqsdxuVUGT+KttjqUFQHvmAL4Dgz358o2MQrhKf5ATv/C8xWnL1bK1g=
X-Gm-Gg: AYBFou1jdsbGh/3ELhgokTBbr1CAY5X9cVpg8WbT0frnp5PWwIdY+v/UCKGjemKxpjY
	yjk4I2EkG2FSQskKwgQZqwxqq9EgPBH6qjKJEQFrqR/w/tL13TgDFevPRpT6nOoxht7ZAuX3yeo
	97rNllpvRIFBs/0mxLfV/nsSxPpmpQCBmvp8bbDMTpLdXfvmFMbJ/RK3feXwONWg/ld7CuOtv+H
	HTZW6aAHXZC57Vm9jn2WIPgjN8YKL1L72ZsPVS0abLh9Ur5pUrPZOLXEmBOGRop2AAuuSSVEdI+
	Fe3Z+1cpZRpDt0E9OqjicqZNchoj5LDMwQww8Dhze0UbhTIr69T+YPq368QB2EU4R/oHea015Wx
	sE2lGweVM93R/kXJxfBSkpGPwurAaQe3I8WfM2ikP7FGRnNFHPV4LMVgnOKYzpJjuVPULvHRo5S
	vtLpSrC+ZDHi/BWAe+aBfrNOXcadVB+D3yLOAZsL21JH83CzDALrOC97iaN6HbZyZBqj6uhGjOX
	DlpLEV61QHKqoX6Q51sy1n3edRkMy++S84zKKXH5s/AVyQsYln1qpwDtdagA9+/TEAsyZ2XetSX
	7G9UmXLQzBplZ5Hg1Zcm0McgPn0=
X-Received: by 2002:a17:90b:2c8d:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3ae8987e32amr9469960a91.67.1793667148284;
        Mon, 02 Nov 2026 16:52:28 -0800 (PST)
Received: from localhost ([211.249.71.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5aa69fsm1428198a91.2.2026.11.02.16.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:52:25 -0800 (PST)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2] tracing: Keep copying markers when one instance is stopped
Date: Tue,  3 Nov 2026 09:44:30 +0900
Message-ID: <20261103005219.3236380-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When several instances enable copy_trace_marker, stopping one instance
can prevent the remaining buffers from receiving markers.

Continue copying text and raw markers even if one copy fails. Return the
last write's result, keeping -ENODEV when no destinations are selected.

Fixes: 7b382efd5e8a ("tracing: Allow the top level trace_marker to write into another instances")
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
All writes are now attempted regardless of errors.
The last write's result is returned. Would this approach work?

Changes in v2:
- Drop the stable Cc.
- Do not save earlier copy errors. Return the last write's result.
- Rebase onto trace/for-next.

Tested on x86_64 QEMU:
- Before: Copying stops at the first error, which is returned.
  Later live buffers receive no markers.
- After: All buffers are tried, and the last write's result is returned.
- Existing text/raw marker and instance selftests: 6 PASS.

 kernel/trace/trace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 08614af8fad1..0b66c55d378b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6330,8 +6330,6 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
 			written = write_marker_to_buffer(tr, buf, cnt, ip);
-			if (written < 0)
-				break;
 		}
 	} else {
 		written = write_marker_to_buffer(tr, buf, cnt, ip);
@@ -6409,8 +6407,6 @@ tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
 			written = write_raw_marker_to_buffer(tr, buf, cnt);
-			if (written < 0)
-				break;
 		}
 	} else {
 		written = write_raw_marker_to_buffer(tr, buf, cnt);

base-commit: d7ff48d92a0f28bc0612da47c054efbc28c19562
-- 
2.43.0

