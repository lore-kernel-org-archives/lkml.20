Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A754E25B082
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789518464; cv=none; b=mfyKBoyvNm8jvaMwGG33rDQnQ2uVpG1OTWPF9W+VrsMIuK5oqrjTS8ZuPNEQXjK4Q1/AJ0ztdpWgFO1xmU2y0jcYwkUW6jx9dOWH6XTuqDMblSB1CC9gSJKAcTuWlbzy9Vue2OBIjlj8ocRl0qzCChaBblxD4wHMh3ThtdgpATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789518464; c=relaxed/simple;
	bh=DLCpkfQRYwv53EtU7ffiV0uJvpcRkR5G8HF+3tqhRA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGKLrEspUJqTk+BRihdL9EuGsdXGuhptD9VDUDgE8cEqR6ZxxJYeZ3NWYC7TNxixq9ZQPTWqZ1i87XM3NW9Lr9O8xp73VTzyEXnmQI4Z05p7LZeFgOV6Zv92zaV1No5CJh/auOqP9Xx5pcocDffJWm0mylkiQhfpSdn5Nlm9Knk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=px/fyvoM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="px/fyvoM"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so247360a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789518462; x=1790123262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3iZTTGe1I2+bIqFKsKCsZmuuacX6LcktM6ichGDqGuY=;
        b=px/fyvoMuHVxm6XXjijMtd/K4gar/rMtPlDAeLeOg2jbh/XoZ/YSN0YvCRj8ywmNiz
         AHIIFJDi26zn8HAd1or9LpYQCpF9FVHTfHgtTX1AkqmMvWn9kFQ9wDLdQU7lCyIdcM7g
         gbXV+qENAzjOjG9+ZAytc3Qe95QeO6q/QbDuPN2RuLgHHSuL2y1sfsV0L94TFDrZIiUY
         kw6ZV/V5RyBhrfqIoGzlOynQRIx8OG6vpEeXK9vq1MTFCsQuzZY6FVWoEdT+KdAbsI/T
         Uo+xA9Cmsqs6Gm66aAMeV/mooixcAVGSA50ydq+9N3xcz1h2OcvF6X36xWopHw7qdQor
         In9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789518462; x=1790123262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iZTTGe1I2+bIqFKsKCsZmuuacX6LcktM6ichGDqGuY=;
        b=lmlD0j+J9iizojOvyjULBKhjgXHlyKxJkUlMMu4DNMXleSd1sYH5Wqo8DFTDS4clZa
         bWIHgSsitk5lJYw19wLb90VaXM3H+gOKiPHqAAAfCVHP6oNOUswRM4ZUHwDBYK216mBb
         J4lv1q6tOjRi5ZnsvZnMiWVQMmcK1XFaqalGKmbN/8rHrjw74KzxtZ/Kq9EFuSHvkInQ
         aYIMoTrA/630qH3R9ISFKpyvlB/XSmMBhH6pjvoMjX4IBK0Y0RXM/jzR9amxHi97OFUu
         k3rbupkIjPSMtMIaR1FlySyIaV3T5xHDmV/ao2fvyV6MghsA8apkiOMMcGSOTMHU79Ee
         AsvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRCvntnmslEOkVuveIepe1BnCG4Ks4+PMW2t+8RXksfkQoIlYfVSd1eIcePEk6srZfBLsCz1P4IEN1jJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mncamANKM3jU3Bl/nizy5HHEfCq2arcMw7CzdaeMUB20jnKohU
	IG2EDZquY55giO9RhyuKo9S+J2imPc5p9pPAHM4wPWyquC215hNbvco=
X-Gm-Gg: AYBFou0Vgk9jrpxpq9LnmIYZeOmwVeq5ehF5BN/5C4W4XEmdViEwpMtz8V5+CdGL9S+
	qf4ViU9YLDUWWneMfjwcGgKvySoAfF0SfyrOmTmOPyyhdjBVzgJnjZq4QF346/nlWB10+Y++ISO
	VI6yJC81TTpuDhIlVdXX0NSewZohRrVfFFJpgDSEwW2jxaCHGXs5qVFDUpau9fy9Fzb1ET9Fu5w
	W+hsA2Rz9CbT6UWb/kVoFnioJMLErniDakrWJHMat3xJJMkpOMjAy124d9yjGHo1UKCuwcLqFSP
	A9cQ5vvzrHcodmM0ofvpxEVJFB0z0a1m5kGAN+lCIjVK7xDh20Tt6X7kgGksDOQq902HJA1RjoJ
	8mOQTE702gv6q0pU/nthXYZa8TjtSaEcJxI01muUwrycl/QyBFlx0S8rEzGr9PBYwPeoABRLosT
	7Imh0JianMjnU9drvoROWXeLfbKDJwNpoeXpEk41ZfyVx7naM+D/GICxxzOTf5ejvt3n4mBH0sc
	s6rUfFSQGiE9Wi6Pd1sDviMPep0TyIw+Ht0
X-Received: by 2002:a17:90b:1c87:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e1e51d7dfmr1284461a91.23.1789518461659;
        Tue, 15 Sep 2026 17:27:41 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:7ac9:5783:ebca:ad9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b3dcf6dsm1172477a91.1.2026.09.15.17.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:27:41 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH] tracing: Fix the shift out of bounds in the log2 histogram modifier
Date: Wed, 16 Sep 2026 09:27:35 +0900
Message-ID: <20260916002735.808520-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The .log2 key modifier files a value under its base-2 order:

  # echo 'hist:keys=bytes_req.log2' > events/kmem/kmalloc/trigger

hist_field_log2() computes that as ilog2(roundup_pow_of_two(val)). The
out-of-line form of roundup_pow_of_two() is

	return 1UL << fls_long(n - 1);

which shifts by 64 on a 64-bit kernel both when n is 0, where n - 1
wraps to ULONG_MAX, and when n is above 2^63. Both are ordinary keys,
because the field fetch hands every value over as a u64: a syscall
argument of 0 reaches the first, and one above 2^63 reaches the second.

Keying sys_enter_lseek on offset.log2 and passing 0, 1, 2, 3, 1000,
2^63+1 and U64_MAX gives

  { offset: ~ 2^1  } hitcount:          1
  { offset: ~ 2^10 } hitcount:          1
  { offset: ~ 2^2  } hitcount:          1
  { offset: ~ 2^0  } hitcount:          4

Keys above 2^63 land in the lowest bucket. With CONFIG_UBSAN_SHIFT=y
the shift is also reported:

  UBSAN: shift-out-of-bounds in include/linux/log2.h:57:13
  shift exponent 64 is too large for 64-bit type 'long unsigned int'
   __ubsan_handle_shift_out_of_bounds.cold+0xdd/0x1cb
   hist_fn_call.cold+0x8b/0xd9
   event_hist_trigger+0x1cc/0x790
   ftrace_syscall_enter+0x197/0x360
   do_syscall_64+0x402/0x4b0

Use order_base_2(), which is ilog2(n - 1) + 1 for n > 1 and 0 below
that. It returns what the old expression returned on every input the
old one was defined for. Where it was not, 0 stays in bucket 0, which
is where x86_64 had been putting it, and the keys above 2^63 move into
bucket 64.

Cc: stable@vger.kernel.org
Fixes: 4b94f5b7b4a5 ("tracing: Add hist trigger 'log2' modifier")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
QEMU x86_64, v7.3-rc3-78-g9b87fdc9af2f, CONFIG_UBSAN_SHIFT=y, one kernel per
arm and one initramfs. The histogram above is the unfixed arm; the same run
with this patch gives

  { offset: ~ 2^2  } hitcount:          1
  { offset: ~ 2^10 } hitcount:          1
  { offset: ~ 2^1  } hitcount:          1
  { offset: ~ 2^64 } hitcount:          2
  { offset: ~ 2^0  } hitcount:          2

and no UBSAN report.

 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..1d7169527dcf 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -289,7 +289,7 @@ static u64 hist_field_log2(struct hist_field *hist_field,
 
 	u64 val = hist_fn_call(operand, elt, buffer, rbe, event);
 
-	return (u64) ilog2(roundup_pow_of_two(val));
+	return order_base_2(val);
 }
 
 static u64 hist_field_bucket(struct hist_field *hist_field,
-- 
2.53.0

