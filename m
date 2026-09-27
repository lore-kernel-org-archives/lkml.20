Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E599A3C378A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790551777; cv=none; b=kkl4EmCvk16Q3FPAY4TjwGf5dIx1jDbvj+8z6wq7KJ3eKH6KMDGeDTRZNDyD/gC4mRJTW2ABVqGymXI9qLjajbMqowQl+aUGW7QWu8u8mJLTR+KOcoy+Yr3gkNUHJ3H8ZZuITC0+eaVlLLmvoQVA+wo0m75pJy2q2uoyqyvmUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790551777; c=relaxed/simple;
	bh=asJs0c5zT/497M6//GyJ/PuW0cj6uiaNYR792UIjbqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Du6EJHS3otw2AWUricnuwfPagNbJKBC11tbsJdW+u22zHlQ8S9VGdx1Vw0e65EnxJEPNRZXoYxK/GPxwCm2vVdgoXw2GvR6E1YxkfKgjHHbrQs4c5ixNADTkocZR2KHNvNVDgz5+1e7b9W2WUV5XMgbqNnKLzDhQpdFtNtLO2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB4WYcl8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB4WYcl8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so12111905e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790551774; x=1791156574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdSUb7fF1yQuVuZ/Ucyhp0itw3vsUUaaEZuWy+I0GJ4=;
        b=XB4WYcl8zXGRc9DueyfH1NHe2vI9s534iZcipOk7Opr5eJKkVk0HrEM39H7lw/zGG+
         5XWSMzKuNbwRqlJuMpnMZkzZ4jJ5nne4pvD2E3KRfN8DnvqIsYM6rN3I+eALx3BhB1ac
         /o5NRN88nQCoLpbmkWuqpINMT0xIJq2xSS01P2FrQn+6Y73dKRvV2y1Kj7ibZu5m2nsF
         3XOVP1eK+q346NC0wmFG/0vZirS+e93dvKMju9jygyZSzftOhFwCfU8nUKe9xU6gJzpb
         3esxFq2kKSEUeH4zWvQKjm/HTZku1wJwptfSPhKyUlR4spt+iHBOOaFmuu5V4cjaEA8J
         oNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790551774; x=1791156574;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XdSUb7fF1yQuVuZ/Ucyhp0itw3vsUUaaEZuWy+I0GJ4=;
        b=MFnowTOh0DOtU3hTO8ftMLyk/M6a9898Zt2bCQv/nZNUXWtvXbRMTRDLWvBfSijXtm
         WhSRnh1AYaVg2YM8f0vnnaEwaUWct6IqzKLGWO7CEtuxx9PzRdQubP76rIzlFCag6vxK
         /ldTFc+mbJ6H/EgArF5hfXCah6LmTKv4yb1ExCP7TqTFLuIFYIHd9b+xnawlIz2e+LIA
         6I+1MsID8dB3ZuJermA5e4U7YIkBImafEWEWL/fK9Nb16g2YfRDnAtYMIdqzlYJH3hPZ
         BQ4FSRa4tJXTYHZM1tE2rKqG34O/c7TRP19e48uu2Jfxkw54FPghLcRNJt8g0DWJkWQ6
         dNUA==
X-Forwarded-Encrypted: i=1; AKwUvBxoy/Kgj5h3HtTSFQW0S52wZe4wPvT1E+GIUoJQWsboHkJy9p9TZw2QFbiGmkliMDOj1b/0d6y+eRT/pYo=@vger.kernel.org
X-Gm-Message-State: AFuF++nu/gbrNLVPPgur2NfRCydbwibQaulHXW+zidO/qs6ZGeiiNEp5
	HHr04c9n5zK7LlBxfsvgkJVHR/OgJsfBRh6DiDgiz4Ofi1tGUzN//3wC
X-Gm-Gg: AYBFou0YYGw7T79r9eB3vpdJemvNktNdkhbEcfT0UizKGRaiB8gnbb3qCeLC+F0H/W+
	uIYVRn+i208dgs3TssJ0Qf4kCi+K0OY2jMzPQL/fpgopJv3IHdb2bbEXeWX0HDgbu5w/le95+7I
	dd4CJcgKtI9uS0atrq4Y0WzBlihgM/wIwhdEA3d0vYKdEenVvMkhMbmHAJ9cQsaTHNwpBDwjjPO
	HoTYeiPJkjBuNjDoH675m4BiBfYFP2zrwUNbLkGT6dMC3QYLdm3B7+AyvrJvTspynbqjt2DLphH
	TKu1ppd71L6GMbQnqQITGkxC1/wpYIfFRNAKP9Zdzll5wGeawyQCN/r+q82+v4tpVVMqberoC+p
	HmHSG5o2KMFgiETTqHh+TISyFqokrt48dFno3JHAMBf9V6aYdix8gDmnAlf5mEUfRdUARln8L7p
	1TWEVKI0mcOyCjMM/kIX+oph4/jqrlf/bxALnJCyKFTqlpcsO4xZlnt+sR3cbPd/vzDaDZ
X-Received: by 2002:a05:600c:138c:b0:49d:174e:2a1e with SMTP id 5b1f17b1804b1-49fe66e6538mr205793325e9.19.1790551774183;
        Sun, 27 Sep 2026 16:29:34 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a314sm23987518f8f.6.2026.09.27.16.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:29:33 -0700 (PDT)
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
Subject: [PATCH bpf v2] bpf: Fix wrong frame passed to check_fastcall_stack_contract() in check_stack_read_fixed_off()
Date: Mon, 28 Sep 2026 02:21:37 +0300
Message-ID: <20260927232917.422183-1-omermetekaya0@gmail.com>
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
'state' (always the current frame, vstate->frame[vstate->curframe])
instead of 'reg_state' (the frame the pointer refers to).

In a bpf2bpf call where a callee reads from a PTR_TO_STACK pointing
into the caller's frame, 'reg_state' and 'state' are different:
'reg_state' is the caller's frame, while 'state' is the callee's.
Passing 'state' causes the fastcall contract to be checked against the
callee's subprog instead of the caller's, leaving the caller's fastcall
region unprotected and potentially causing an incorrect fastcall rewrite.

The three sibling functions all pass the frame the pointer refers to:
  check_stack_write_fixed_off -> passes 'state'    (ptr's frame)
  check_stack_write_var_off   -> passes 'state'    (ptr's frame)
  check_stack_read_var_off    -> passes 'ptr_state' (ptr's frame)

Only check_stack_read_fixed_off was incorrectly passing the current frame
instead of the pointer's frame.

Fix by passing 'reg_state' instead of 'state', matching the pattern used
by all sibling functions.

Fixes: 5b5f51bff1b6 ("bpf: no_caller_saved_registers attribute for helper calls")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Changes in v2:
  - Fix commit message: sibling write functions pass the frame the
    pointer refers to, not curframe. Reported by bpf-ci bot.

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

