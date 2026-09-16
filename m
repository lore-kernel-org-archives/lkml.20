Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069B41C71
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565552; cv=none; b=ZsysQRUg6AC98IM8BE+Gor3XTjJCVKMvsuchpOxcGn1lHVuk2XfHaEDeF9dRRCKUvtQluNp0KoR42ByrHiVy/OZ63ixwlWlW2q4KzspSNFEyScjnkrvC6HaAVdw/faAXsY0Agl+ZRmAhGEK5RqI17Qw9jRBZU5frg0MNkuLubWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565552; c=relaxed/simple;
	bh=KsuApQ6jGsBL9H1Lg6ZPp17XC38wi5V1uyun2b7groU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FnAcR65m/yzLetHbAu6VDulPxSJma0FsYpFUZW0h6WycAt+JNMAV7J07siCYzdFoS1nI9m2l6mqSBDHvNYiSVeT/uISY4Ip2GsRiW+m5RL36KPgxHEU34VkUXQyDsnKmKZH7HK4kPFJWd41pkDbGTxW0JuEY+CqE3N1+SfCywHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMT+C6Dt; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMT+C6Dt"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so500532a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565546; x=1790170346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCcn2LkYFEOrgsqYd3Ql/075Xn3VWWErqZWMbblb648=;
        b=HMT+C6DtikFWg1GGY1QsMdA+B10uV8lOn+gpsA6i8QT34RMF2oo7xu17OHGsLDk/tL
         O2VltJQydWXfBf08nxVgPd8lo+0flMQkmcbxUl0GMXYlbC+3r+qwErQ5We5QRCOjRy2o
         kp/qJej+WXTq8wLunaZjpGQfZqF237DSiFyZuuzEdo3JpjU3gAWfWC7P7hCuysFwXPQX
         mbJLIhp3kEMh1BQhZIKn2UXt1kFfVw+dgK4Oggd3bk4JsakoahxC/JdmQgYayitQjEst
         TnLYMITgUUfeM2gZ/gPn0oe2Umw8kQjCR9LCm51zXanhQTHh21hpPxq9uX9P7w9WwiuY
         MpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565546; x=1790170346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCcn2LkYFEOrgsqYd3Ql/075Xn3VWWErqZWMbblb648=;
        b=X32S3bhmTMk+vOv90Z2m1WbyrnlgB2BE/hG+g4g4iz35icZkeQVQC2/YGzf1PxJGGL
         p4JEMesg61K87eb21bIWd9ibfbp1M48QJcFLvPY9G/JtLXPwb9P0WsYbN+nJkNotr4Pp
         LouCUy+n6ZnvD1xt1HrMCmGN0fLDpDbwdK2TdAR1OPcpyW7c5heBNb809XSRFGTMGkw5
         v8bfEHPOFfupnMsP85iDlj2u8khS4O6sA9dym3GUkRu8UQo3AswV+BKDoF0rGMZfWDXc
         G4uerECM86YGSXG8hmg0/ZtqnR4uTs+1S33xl4OHOnfGiccarJFzksg3ZcCaAHQfD8y+
         7I8A==
X-Forwarded-Encrypted: i=1; AKwUvBx3MUNNq9yaHAIWu8nFWYYOg/pFkSsUlk09AIf2HJlz/rU+Rw9KMZdhycwtXspS7tA3o1nnzQdeiPYZytg=@vger.kernel.org
X-Gm-Message-State: AFuF++mw8G90NpwOdljDMiSa0WdSahM1k60ZRlj4lVxV8U5ChhTqlwTL
	YGVHCN4wh+I1b712zyiizvlgHp5WV9GRe+ev0DgjhLyQQc5dQ6v7fEaH
X-Gm-Gg: AYBFou3aEEdl57giLZrnIa2UJrqMgCcPiQiOPwohHOwoUq/MC/UN7IDz9H8mVc6UCxm
	AsbEnvL+fkXnX17DjIm9M13CYWUq5kliWbXence7VNcfXJNmUho5FiKUiSID/D38qSWy65TerJx
	+T6VgWzh3f7PHpE1Oj4cj/OG9A7rWC3lOPG4j5ORVJDz3/R3F58G+xYZr9P/mYHHk2yL478hWoX
	I3jO/ZNHnRTQkToGp4yorzY9RklFVX3u2EwxRH/mDmKQ+dyEDH9D8jOMykY/zuRWdkTlflEv6By
	7YGR91A2ktQyFu7QrdGcxvCwUAox4tBDd5QvgOigheDopClkrSeu0wUra1wDpzll5ueN0X5H9qd
	m2wVUdpddT0QUezEoFi0eYoo0E7AqRh/odcBsl1rzhllAORuZ1OOeJdkrV5syPIEI/Kh6HW05Hh
	GklqurFt3wpNkNcJPkL6LU+m0vP2HCTDtGhknOHEVJuQqtbeISKfO/dY9Dx7+D9t7xt7YR36igo
	ua5gsDchrtYwVw=
X-Received: by 2002:a05:6a20:430a:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3dd5f5d673emr6093359637.18.1789565546497;
        Wed, 16 Sep 2026 06:32:26 -0700 (PDT)
Received: from pengdl-pc.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm1651702a12.20.2026.09.16.06.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:32:25 -0700 (PDT)
From: Donglin Peng <dolinux.peng@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	dolinux.peng@gmai.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengdonglin <pengdonglin@xiaomi.com>
Subject: [PATCH v6 1/4] tracing: Avoid BTF lookup in atomic context
Date: Wed, 16 Sep 2026 21:32:15 +0800
Message-Id: <20260916133218.1282590-2-dolinux.peng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916133218.1282590-1-dolinux.peng@gmail.com>
References: <20260916133218.1282590-1-dolinux.peng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: pengdonglin <pengdonglin@xiaomi.com>

The function graph trace formatter can be called from ftrace_dump_one()
with interrupts disabled. When ftrace_dump_on_oops is enabled, the trace
panic notifier can reach ftrace_dump() from the panic path, including the
nmi_panic() path used by the hard lockup detector.

btf_find_func_proto() calls bpf_find_btf_id(), which may initialize vmlinux
BTF under a mutex. Skip the BTF lookup when running in an atomic context
or with interrupts disabled, and fall back to the existing return value
formatting.

Fixes: ebeed8d4a555 ("tracing/probes: Move finding func-proto API and getting func-param API to trace_btf")
Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
---
 kernel/trace/trace_btf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/trace_btf.c b/kernel/trace/trace_btf.c
index 00172f301f25..ae562192b619 100644
--- a/kernel/trace/trace_btf.c
+++ b/kernel/trace/trace_btf.c
@@ -15,6 +15,9 @@ const struct btf_type *btf_find_func_proto(const char *func_name, struct btf **b
 	const struct btf_type *t;
 	s32 id;
 
+	if (unlikely(in_atomic() || irqs_disabled()))
+		return NULL;
+
 	id = bpf_find_btf_id(func_name, BTF_KIND_FUNC, btf_p);
 	if (id < 0)
 		return NULL;
-- 
2.34.1

