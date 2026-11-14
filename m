Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675432;
	b=pTrmmRhMin4B6O6AINXV5JqxPg2ljvHxSiYul1yHBTC3PIcy6fJE82FqgVWwZZX0WLrL
	 3oHR7ffqgvUA8gTDwOz6LTAAhQfobuVJiuoX6uLjJSz91ivrXux71tjs9EUwmgJOQMbkH
	 RsrDzwN3kC10PDz78M2+IpYLg36l4YKnFPZujf+VfG3Ne0lErbc64Il6e0Lba31M0OWVD
	 f6cuhnTtijnVKD7usYHZtMfdtn77930aE4qxQE/uj4q3xxdC0wgxfTFCdHaXer80svnX4
	 7lKosOV7rvmRO5lmjFjv7jca6xLu9S7UHEXcO+KaZI5RAwtt4wf3bV9Ha+Q9FPRAdMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bGPzos7sk5nHjVxh5Oggt5lWpbhx1pL2PzAVp8yO/gs=;
	b=DhnW2Z0epypB/wE8VaS+uNPjLVYpLGNacpZ9/QRxisvd2y1SMcpc8Pue0cVJM66oarDP
	 DBKV9jYy6s9kq6rWm4WcPZ30IuLWDdujwknCLFJ4VIR0IU0itVUiP/JMUzsmRKV01DpEX
	 pktBzK6+VzhznXPfcgM3xbHDYFTcClskiJR/2Gb3js1+BlknA4mkw+OINlXUZgfDYoFkO
	 IiuqK8mcqU/ywHmlg55PDMPaAtojX/RWEqbQ2vNQozjCj/OrJBPCHs8ytNxGhv9jz33r9
	 ibi4OPnCntqiqK31JjKLsiIBnCyDkwpruGr0PuS9X5CEQwl194ObnErbULDzRz0bK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3Fxc5kk;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14498606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14498606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3Fxc5kk
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso2812285e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675430; x=1795280230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGPzos7sk5nHjVxh5Oggt5lWpbhx1pL2PzAVp8yO/gs=;
        b=S3Fxc5kkfD7BvnSQ99iXnViTxXdcfQe/zu7XudlxGz7YGe0OAapRDFMkeJsv+j0h48
         +xCSRzsT+F3bszBB8BAeF3sL7RWbTllQ6wEYnzHNscQfhmxonitMvdtSdHSstU3kl+5c
         xgxNm+wY6EocmCIt9v6Np6L5JdHb+jSkDcg8fej/dxyBaaXSwOjNL4DWAfN4rrnXRGOz
         jUupCUdzTwHr3f7D0CvP727MkqvWOe5cCOamRM3OV0EnrJ1v/L5NDDVZHZpht5DJ03Cd
         +l/6JcTSkJyJymFi0TD7SveHxxRdjF+gHYU6WFU4vhdZfGlVEopmAHLuLhFr+2+G7aTC
         Jf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675430; x=1795280230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGPzos7sk5nHjVxh5Oggt5lWpbhx1pL2PzAVp8yO/gs=;
        b=srQsz3DNhgnyGlj/JiqPxikYNd2Q8I1wIqE7zocSEv0Tjrnx231wHAZF8RXWMrSrWp
         1ATTJG93BA3tG9il8sCPceEvNH+U3j/oEZdD4M4Ds+EoCcwz0P3TP5q/1Io8QzIq8kb3
         P7GooYC1tnSEiM02bIjAbZZ/3y+nYAxcCoQOcO0Clmrc5TmC6AnL3I37NPwZFE9WFq35
         bnantqIp9J0RFQZ3ONhWrAxzHfmiYqisYXh4RqZgDwGhuKaMRpuzFrcKAhxt/gGH3APH
         MAVHwiAB+SkqnhBq+hKeYZYkLQyha8I2QHtueQ/jjgvPjVGgIiFSfZz2nrOg8mgJlRtg
         xdhQ==
X-Gm-Message-State: APuU4Z8vbrSTxP28d6q/pl/5tK/AZvHX8fLx7+GgMCjiUwDym5Or0DfS
	oQ3/cwZaVEtzjkFcEshlovn+o2zaemXcBWMh39Q8VvnIHkIvEKQFcW8ZdfdnqP2aKJwom8Vy
X-Gm-Gg: AYBFou0yECzgUUZNKtZi9GAJYBeBuxhHSnIAZimdw3Dnd5dIbWyFMVJxfs3ZC1o2KZK
	q+SCAhRv2ImvfTyaeScUTRPgmNp1RJgPS/ooIrsPzAraJjUFmCplAQjFfHtW38MsHfb/U47Dfsv
	fLv1ACjnuOmxbmuAN/D5J7SMfb42Qz5cE4Py1B+AGHGEu2INB1MRM1Qq3f5cewSOPPr11x8ga4H
	tIABhcjMpH7Q/J4PTSDUZwSnPdtCPy5hoTCG2VQ3xLq9qTf/yCwoP27OH51PLIxQ6RBSDj0JuOz
	8KZ7nbME0NTXF/VZ3HwYVgZmjI/2ZGtP2SR3AlEz2s2a6KouUYcOOaA63u4oITjgskIGibv1UlA
	FNw7j9rBiPNKCd+ih5zCjHpzbB9vbRaaIFIAmTaPpG80N+o2moy4cc1LtqSNOqUSx4pew9fYnsW
	mC03OGWixQp+LswmnFJ79R1A2n9o3/QMwi2GOYta/ZH1xxuxl0o74a7W3NwGDts9PkeGuqMHs8V
	EF54mSUwvBHSkiwtlfrzKlgWnM1MKQQBPsB5R7qeN1FJ1DCX8vaPXeCuQQHbiTlF1CugdMeyRzA
	J3REz3wiOoUY1ONYBGo4HMw/R7rWEbR9whip4TBS2xF+jsM/lOA0oxdN3wtHzVyVkUGMrWx9OU8
	gOxaNWLTAdd7t9L97JzXiAf5457eacNA=
X-Received: by 2002:a05:6512:b88:b0:5c0:1c6:69ee with SMTP id 2adb3069b0e04-5c1709b1c17mr1757587e87.4.1794675430228;
        Sat, 14 Nov 2026 08:57:10 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.57.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:57:09 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/14] shed/task: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:52 +0400
Message-ID: <20261114165612.368785-13-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/linux/sched/task.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 90ed5bc3c..5cdef6b0f 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -61,7 +61,7 @@ extern struct task_struct init_task;
 
 extern int lockdep_tasklist_lock_is_held(void);
 
-extern asmlinkage void schedule_tail(struct task_struct *prev);
+asmlinkage void schedule_tail(struct task_struct *prev);
 extern void init_idle(struct task_struct *idle, int cpu);
 
 extern int sched_fork(u64 clone_flags, struct task_struct *p);
-- 
2.56.1

