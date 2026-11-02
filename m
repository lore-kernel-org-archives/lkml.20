Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650445;
	b=BHwqXBP8T55vx1JFBzPwRAUzKVo0ReKRkUknghzFpeqFa3Lh+lYlA92GVa1DKcECa0bS
	 p5JC2AjH8qscC/2agk0q4FF1U6HvgHsb4r2N2AcrTGiXEZCxZt807mBRCngCd14FpZKw5
	 dP0ukviTBmaZqtNchWvk1G+Ld9syrh3VEoDmhDv79/KARDcIbKkqwJV3iAikGllCP9+hi
	 wy5SR+OYG+z97uV8NvSN6b2V0S1UBI7LprM68UZ70+sskCdVlG4LCu/2wsCVbhPaqnit2
	 wnM8MLaRlADnyRT7V2U4zmiK7llHTUIgGnd1GOL/pU06ucHvIXlekD1Nn0zChvwDGRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
	b=l9EewlnGRg+TOYU8o8L0RwlEJIkh9odPOPH8jjCxVaUGE6Ye/KkQgLldMn67R9+VBar1
	 Ws1ptfGHVYL4q8oqZ+p4HCl6WhdAt7GM8FShFiEzUcHh/Fsz5EML1+8BUQM703tsyIMfu
	 n8EvicQUW1wbLr0Bs7HBMKiPX9j79cmVXk+I0VhU6io2rvaPuOeZhCfl7WCGC9S1Dbpbc
	 hX7B26nOsOcnz0bRaRJAHDgXto4DCnbqyupKjBJky8mrKcUrN8FfqeGBeW6VlSAv0GJz0
	 lF1hoTUWwhtXczMIAy7L+KbRFMpToLV++IbbVTT5a0fTuZ8J0Efd8erG8dc5c4t/PDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qx8587wx;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB525606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB525606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qx8587wx
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1666132f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650443; x=1794255243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=Qx8587wxxbR22BoOvIwqG8mbTtcPopxfea//1XQLP4IJcVMnHNo5IfbPTzhs/JRkt/
         Qb9b0N1mMt3ctF7j/LteVwQqMUgbMnpFJUUoBnrW9+N8c6pd9KEdB1CKlk7FH7fBffnI
         yOFdNrnInbc5nGWNZq6NPmHX3XN/FTZNnJG2EQzFrPDs45KFrKjJFM9F4uqG33fIJ4Gl
         qRbu88baVzNcrNBTDz9de2+wmIfqLbNqWxtimMAYBLx8EYt/afzmuqytEjFXjg7t7oRo
         FoqsbEq107BBV1xiob+8M29o2OjzRSEqIOOQiLlyoLO8wc2GhPRGl4qfp93c9lWnbBdq
         4E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650443; x=1794255243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=TKXd66MUjKC6HjyqIHX9J+HAgekcH70qGD3bdpQ4QQ5xjJbJlTtzGrBtc/xP+04xD5
         jyXEKd813dU4GsM9HgQDop7ANdNx3EDAXxmHkh07LzyRYsIURt4ldYAv8bR61LnLzzN9
         O3kUPE9Zus2xwORK9x4wKMs9oeGRzSAD8Auuf9axCffRTWtEVQtQV8e8VHbbIdTrgbnr
         7+vP70vvLnt5S+WhhJA3XfzV2YK+NksO4r98tvYfO6Rq4RtijzSZYVwlzswRS6G4vc7R
         u2ohstY1bRUTd9kQ53Dz49iZ5wPTLtUlbGwK4UBqixsQr9GyPpQ9f6AR/fc9Y7ru1owh
         pvJg==
X-Forwarded-Encrypted: i=1; AKwUvBwqGEdqVD5Omg/V9PKGR/pOEcJVKbbIaWXcXsHkSrI6nwaBOH1rRiuueUDVE4Rmerddl89oesLriwyxr0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+af7chUEUpF5DaA+K2Rtgk8Wm9Dg3By6p1GNxi0TX4IHKBXfOk
	GVEc74MfCaiWAMtQP7NDndoPDgRhTPIqgOXvmuxi6GNATi/hWyEn22OW
X-Gm-Gg: AYBFou0h38/1UkK2grrXim1DRk++LrdlRscVsb6RudkzrE3e6a4TJws2TV65y5UxPiS
	77lTnM4+Vdh6/0/TJXaLvYqYLCGTEkXxS016RuGY4ldY/SGF9mWeruvlpvXgcZE4ViHJ5HDapuj
	cE7sNu5ap1naQ1jUKESxREzGAmnIEGK4qaixXmYo7vA4fK19Qh9QjNx8LrgIEHgq9XEQJbYDuFG
	t8b+wDChu7PJDQM2uLIGmLpGGb6zWPZ0T+38Kdcv9LbnYsNuqCHHDngBCPfNDSyBEA5Qf4O0Pfl
	QC1gXXSr3LboqRCm1jBmnfGMP4Ii3Abp3FI76rqxafBiTo9wpCz5caAwIyYhDCPBm7U7efclftg
	pNNFFC6f0s14797yUQchFUocU/9umVjcFOycOzQQ1O1Y1M2tIFfZ9fBmuEl2FqdsHDcf/5QVWH4
	3l8+BbK4TRKAnXCk/NLFKx4SJDGFqZWywcbkkFvN098IhH7BPhbJncU7MKfU0v9+B4PTDd3OloD
	utNS8r/mU+ObzWQBS0DlKymEBMNF9vHa9UlUhVJ3tY1civLPuCiXJ6Qb31xN33NlaswTN1Pdcu8
	cT+iW6B6imY0++bVPmBLRsh5Ahep6JP9v42RcxxHQM7X9kdKznY0ac/rggy21Ai6wK7LQcAmpOs
	1
X-Received: by 2002:a05:6000:2c03:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e6e4fca93mr23474451f8f.51.1793650443196;
        Mon, 02 Nov 2026 12:14:03 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm21471805f8f.43.2026.11.02.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:14:02 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 1/5] libbpf: Count entry programs for bpf_gen__init()
Date: Mon,  2 Nov 2026 20:13:52 +0000
Message-ID: <20261102201356.5798-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102201356.5798-1-mahe.tardy@gmail.com>
References: <20261102201356.5798-1-mahe.tardy@gmail.com>
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

Commit '259172bb6514 ("libbpf: Fix gen_loader assumption on number of
programs.")' explicitly mention that we may pass a higher number of
progs because we include subprogs and autoload=false to bpf_gen__init()
generating a bigger cleanup section which is harmless.

This is in preparation for the next commits that will introduce cleanup
of the link_fds to bpf_gen__init(). We don't want to overallocate but
have the correct count of progs in this situation so that the
program-slot count matches the programs exposed by the skeleton.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/libbpf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 02e75b183ed0..a7cbe7204043 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9800,7 +9800,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	 * permit cross-endian creation of "light skeleton".
 	 */
 	if (obj->gen_loader) {
-		int nr_func_ptr_maps = 0, nr_progs = 0, i;
+		int nr_func_ptr_maps = 0, nr_progs = 0, nr_obj_progs = 0, i;
 		bool text_has_callx = false;

 		/*
@@ -9815,13 +9815,16 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 			if (prog_is_subprog(obj, &obj->programs[i]) &&
 			    prog_has_callx(&obj->programs[i]))
 				text_has_callx = true;
-		for (i = 0; i < obj->nr_programs; i++)
+		for (i = 0; i < obj->nr_programs; i++) {
+			if (prog_is_subprog(obj, &obj->programs[i]))
+				continue;
+			nr_obj_progs++;
 			if (obj->programs[i].load_strategy != BPF_PROG_LOAD_STRATEGY_DISABLED &&
-			    !prog_is_subprog(obj, &obj->programs[i]) &&
 			    (text_has_callx || prog_has_callx(&obj->programs[i])))
 				nr_progs++;
+		}
 		bpf_gen__init(obj->gen_loader, obj->log_level | extra_log_level,
-			      obj->nr_programs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
+			      nr_obj_progs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
 	} else if (!is_native_endianness(obj)) {
 		pr_warn("object '%s': loading non-native endianness is unsupported\n", obj->name);
 		return libbpf_err(-LIBBPF_ERRNO__ENDIAN);
--
2.43.0

