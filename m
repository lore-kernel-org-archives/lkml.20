Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6C3BD65D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790548075; cv=none; b=Ocs8VCLvuzGbfDVLyyWPf9Ie2fxd3pmpWEtSPetVlBnOx974UtjsM1Vcp1QRe7QrV2trwjw0gKUMOgSzbQdhigZq5fOD/QMJ7bJ248t8CWN5KHuYeJ3zguRZqjoAcXkrCw8N9ikurkdoLdMgRK4FjOgeG0oXP8nE9zQCc5b3BWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790548075; c=relaxed/simple;
	bh=hN11+0jGO+kQVoJYilWNCb1+RxfmTWd1YuQ6sd0MZ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DT8pNhUi3y4CSptrf8TDGlVljVH3UZv2hkKoRzloQo0bVK9NmUaWmWsl8cNhcZaiPs2/8kifpTpwZ9OqXrKtIxyrVAs6Ral2YbZ5D78hguYkp3u6a0/Ug44IiCpBRsygqLS9HYDQQnefnLl2vrH8EfvBGXWTiQzhtqHQ+SumYkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLeFdwFc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLeFdwFc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso26568805e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790548072; x=1791152872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNv/YKrib12Ia+OnE8CWdRxUx18FQtBwv4FLLr1iZq0=;
        b=gLeFdwFcVcf22cW2WPgtavg1rZ2AqECRyPmYXZnyAOzMJLySeveoDDRo8wJzIqYodJ
         UXDAKNZY3v9u8+AZrxuh11R3lRSkw3/naEtfRAOvxV1O2FYckibZ7lPnWfwZ2B8DSjuy
         ELyoZy070LKB11laQAlQ2GFwDYYXHiLtixPFdf3g9ph+SfmEu/sVA7sBW6oFnHMTu4MW
         EJpG3tSmWGEiFLBVKgXfwGr+Mq0UycdBzGSBYPBCOIlh23sxXg3k13sd4lwpTjUkSA7s
         dVLgBw/Aq9U+anw19WGjcwuUEG/eIQbFE7WZzo/oT1dNXrx/4F6EfUIC2BFWyspcW+lT
         1jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790548072; x=1791152872;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNv/YKrib12Ia+OnE8CWdRxUx18FQtBwv4FLLr1iZq0=;
        b=Ot/SVSG4RDK1/u6jM2vMZVXkdAFWu5pBB+CTAQRsD77/rnbqWRRIpecpPHTCU2MNs6
         7Tb6ixLno0mnZ3KdjhsrO5KWod8d/4i5+FxGnvGYR2ANe2jqkA5S4HcqQIfPVk4V2B5U
         hVSwZh90W0DQwm1zzMnjAe2T7V43rK9RDhiXrBb7N30f7H+gcgmJ0tPEC/nb82TgYJu+
         U2o2SthpyuNlkXkoqZHMwxKA+T4y2+VmzRybTY7KtrFdOZ+2Z2yao/5LDlNgUczhKpuq
         yir0+5fdFbvfSFOmapS2IoaSe7FTdZ5hjqOwma33pOFhcBt+4U1twENepjTEhcsqGj1u
         /YvA==
X-Forwarded-Encrypted: i=1; AKwUvBz1bzkwMazeLSI3YvxPqSkw7wxt185qHutTIbLrrrkm4t6Cia73nYDosi75qDs8uBwtXgtRn+oZCffmBCI=@vger.kernel.org
X-Gm-Message-State: AFuF++n+YM7eojhXdYFIaLOTCaDwLD2rwrI/YN3gmVFFvHl/nFkjkU7x
	Tqh0k94Dj1x+RleA/7I0YZzBAO51oF8ce4AbiOtSS0ZHYKU63Ghu5UW4T0c7+Ghf4Z4=
X-Gm-Gg: AYBFou0z0veqniT8IWolNDk4wWieza+yE2oa6BTLSnYgSrEW4Yy7/5eXafbZqlWt/62
	ZiuK1JNDC75myC+awy6sDw9x4u68UxFZRRA8GMBcPvvG6RASXrZ6S1H5R7+ztW2HAc+Kn3e/T3P
	xMneNAcDGv12dqIwa3QD6VKivgEBMC6LdVqI8+3wGAJ8NKak8m/SZW9HGKgNrz+6dInMmwxD/Op
	WVna9AOcgVgnwqxsTIb+lE+QCx/DIvBsviAfgh79/sHgwITtmEdS/WQ67g/TXnrGMCzVwwLnGc0
	QrKeBqj2//sBR3eH/xiwBxXPtFGTdDI6S0sk6oQpmki2lUgowdi38gWTbQ94ly5eIpd738LSwGw
	LbUiKYJ1xWrN0ogCHXHVZskEm9tnHIUEeGBjdBCRStmnGqC4+rvbW+iWXxh6DWuo1ESyZ1BEoy4
	8T6k9feFOf6v4qhi7eZO5Fz4oe8jvuGDiWtlEgB0Aex3kGUDHhSXt0Cxd1XwkJMcPOunz9
X-Received: by 2002:a05:600c:37c4:b0:4a0:37a:10de with SMTP id 5b1f17b1804b1-4a0037a12fdmr27987895e9.24.1790548071788;
        Sun, 27 Sep 2026 15:27:51 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm157073785e9.1.2026.09.27.15.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:27:51 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net
Cc: john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH bpf] bpf: Fix wrong frame passed to check_fastcall_stack_contract() in check_stack_read_fixed_off()
Date: Mon, 28 Sep 2026 01:23:44 +0300
Message-ID: <20260927222718.414674-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

check_stack_read_fixed_off() calls check_fastcall_stack_contract() with
'state' (the current frame, i.e. the callee) instead of 'reg_state'
(the frame that owns the stack being read, i.e. the caller).

In a bpf2bpf call where a callee reads from a PTR_TO_STACK pointing
into the caller's frame, 'reg_state' and 'state' are different:
'reg_state' is the caller's frame, while 'state' is the callee's.
Passing 'state' causes the fastcall contract to be checked against the
callee's subprog instead of the caller's, leaving the caller's fastcall
region unprotected and potentially can cause an incorrect fastcall
rewrite.

The three sibling functions are all correct:
check_stack_write_fixed_off  -> passes 'state'     (writes to curframe)
check_stack_write_var_off    -> passes 'state'     (writes to curframe)
check_stack_read_var_off     -> passes 'ptr_state' (reads from ptr's frame)

Fix check_stack_read_fixed_off() to match the read pattern and pass
'reg_state' instead of 'state'.

Fixes: 5b5f51bff1b6 ("bpf: no_caller_saved_registers attribute for helper calls")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 kernel/bpf/verifier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 1cd92336309b..5c523a9bde6b 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4020,7 +4020,7 @@ static int check_stack_read_fixed_off(struct bpf_verifier_env *env,
 	reg = &reg_state->stack[spi].spilled_ptr;

 	mark_stack_slot_scratched(env, spi);
-	check_fastcall_stack_contract(env, state, env->insn_idx, off);
+	check_fastcall_stack_contract(env, reg_state, env->insn_idx, off);

 	/*
 	 * Refine the in-progress load record's origin to the source stack slot.
--
2.55.0

