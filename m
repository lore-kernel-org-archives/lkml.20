Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623044;
	b=eyZsLtm+clJoKrIRy0TrnsyzOEjyWpImrSNdSU/OH7G7IVPX0nalLltmRiZhuyB2x0TO
	 Tr9lDIlDTuRhJ8QrXKw44SmTGdeNrELxhK2EVtvVEzFXx2hGRQxi/4Ap1FfPaaav+aNcp
	 /ERxsTiv5Wd7zQgpVhxeWXjK9jr+kzSJYE0CzjY238BoZ+Vye9wK4lbEwFq+QSKIy8+2y
	 kmnFcbvqSKuOZzvZno1h+4FJCfzekYv5F4+BH5WcraO+hr154K6OPBUh23vKEaaPOBHPy
	 C44fo4OP0SuJVIyHNOKp4o7FzNz5BWy8IvgdHnYwoemlLbYXl5DYarbQSxehh/g/eqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8yGgdG3MuTUgBN2IlwGn1nZkRcdu7c0DJVMNgsIQLTs=;
	b=Jh6rmEIHGP2TlScMBnpgTdFrsVAeQ60Rqg6HSpykT8VYeFGbKtfe/JdFI3w1Bxzk5Io2
	 v/9GplEwnbPUC/iIrptQ3rsZ9crE4UTy9jAhm0PLeAX9dVDPze0YuVUWGVM3JRPa6YZKO
	 a1ZgW8Y45n3sAz6cySZKjxi8SkT4JHalLC4ncSy8cv8NDMjYVRjnIoXJH2zlfNKKgcqSl
	 WBE9owMdI2Q4aYTq7Efw71WRMZZm6Qam8X+mLEPpntqXmhcFWGthPgFIHH70219O11GXA
	 VVVdiiJ7/46MSFBHMNQKJstWxeSlR3/NZ/6I9fqgxNzCTRGaCJqpUXVVlfd74FchosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOoSOkIu;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD36606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD36606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOoSOkIu
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so5404674c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623044; x=1794227844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yGgdG3MuTUgBN2IlwGn1nZkRcdu7c0DJVMNgsIQLTs=;
        b=GOoSOkIuby+zJ+pcXZDwDkR/Nxf9MBeqs/4E1GhaH0/jXxzlb1TOan8oTVifidcaD4
         20IQiOHxKTyNlO1vLS2jf4UCq0esA9+3smJJX824cnVNTgTVW6Z7riIFdCW6fq/44sTd
         NRIqrG9j9aMuDD/rdYH1NvHifYY2Glsh7UmhK4s5vpqEK6WbEg9XXdLqiioiNeaFGAIJ
         S6GgXgkSFha5wibG7ycUOTuZ0BwCxt07FTOwakhHFyJxzzmXaaZKF4k29n38IVTm+FnB
         YkLT7u58R3zKGSCMFRDbGR3fX+LUWd2UHPMC6ESCvhHHQm527TrBDQPDGE5aOC0mXzCl
         ysQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623044; x=1794227844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yGgdG3MuTUgBN2IlwGn1nZkRcdu7c0DJVMNgsIQLTs=;
        b=acKvKpEWh7aLVm+dTvehRTBFKog3pyGCzpE+SFz6rx+mgy9jKHl1kUOFqKlHALj2tA
         rr+Y4vUfX2pXHCnqVM0KfJHwHs7+1aKuNnWGbJvPpDMaUVjv8BUNiYGwtEvSH/mCxq7O
         9Ed6zTNmd8rbGUxTH/WO6nddZ99+XUJ2YgZKxFbXiE89W6DBHroNX6511Co68NQ3sWFg
         Y4fuRz/JHt9mOM8sIbqgei/ndsqEtRbXVIl/806+smwF1fQf/SaYibpO/6t0yhYi6se0
         +bECt0ZZAwujQkePc0cyi0RLH8fwScc9HYvoIe3BzN4s7jQ+5vCZ+sLPGd8Qzpa3nkFA
         1CgA==
X-Forwarded-Encrypted: i=1; AKwUvByOvQFOCxZtuXnlIVYGYZHOnfEsbEGVSduK12XN86ZUpVBXUu9GL/BFR/YEE/HAFnzErTCLy+s3nPhoYqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYICd19M6pP3+aWU9bWP62A4XNaBjiAO5CYaSW8tqDTAupC3iTPn
	x5bFU0ALtczd4XFUnGRcEpP/WJDBTwoyiNvOzJGawLrkWJx+HORKzd+Q
X-Gm-Gg: AYBFou39s7OVODXUaTXphUln6z1BDgsreedYLrQQK5nxO47EQWWF+dcK0mmndtaa55L
	6J1nCqXctWL2ISiBv2kHFzC0UwU8vyuHZ+cXWdtrWFOUPhp8lmwbSIBWtAAizzJ5ptBP3ndFWVX
	9ufQynsBT72aAvv5IVwzaCZxzk7RwU58QzeRaXEDLZLwOccmpGLCMo51qYySRZXd0WgQ9SujUN8
	fS/Uc4pM14UEIozY12MtMte3acSzROfYKHwUdqsTOLXsX4TLAJut9iCcko1aY7O4c6rl7/+y4Lf
	PH90mScEjH3jJ/5KyGnE0GJ159/gDSLWIbVemoRm9a1qVpcUyuRf2qJAS7CS2kqpb8jFvQStm7+
	Pq0ceJlhCjaSgr4jJTCBaR7BzPmFQE28MWEeAsRJMtI1rhPM48/Bxt/pqFBt2QY8fWPt2MJqfsj
	EehWB5l2n1cnvSuJrxwWq1BL7qB0aXppgQyDrBAT13MXSMjdY0ubYtfCbgzATFt99x041tys+Jj
	TiGJL3hGc4Yu/Mac1qV/6cJw28STTlFdw9abPgsVmsxUJvpWAJqeNiTn2edWi0t/a/sMqjo8fhh
	QAhgKuW1aRYsSd3LM8SeQhp8
X-Received: by 2002:a05:693c:41da:10b0:36a:1cc2:45d5 with SMTP id 5a478bee46e88-36a423ca2e9mr15639313eec.26.1793623043663;
        Mon, 02 Nov 2026 04:37:23 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:23 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:37:03 -0500
Subject: [PATCH bpf-next 3/5] bpf: Finalize the verifier log after the
 runtime is selected
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bpf-blind-nops-fixes-v1-3-844300e42cdb@gmail.com>
References: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
In-Reply-To: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_check() finalizes the log, which reports its size in log_true_size,
and selects the runtime of the prog after that. For a prog of one
function, selecting the runtime blinds the constants.

Blinding can log "insn %d cannot be patched due to 16-bit range". The
message lands in the buffer, but log_true_size doesn't count it: with a
stats-only log, log_true_size is 219 while the log takes 264 bytes. A
caller that sizes the buffer from log_true_size loses the message.

Finalize the log after __bpf_prog_select_runtime().

Fixes: d9ef13f72711 ("bpf: Pass bpf_verifier_env to JIT")
Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/verifier.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 935b163f81e4b..974dc571eff05 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -24112,11 +24112,6 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr,
 	print_verification_stats(env);
 	env->prog->aux->verified_insns = env->insn_processed;
 
-	/* preserve original error even if log finalization is successful */
-	err = bpf_log_attr_finalize(attr_log, &env->log);
-	if (err)
-		ret = err;
-
 	if (ret)
 		goto err_release_maps;
 
@@ -24167,6 +24162,14 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr,
 	env->prog = __bpf_prog_select_runtime(env, env->prog, &ret);
 
 err_release_maps:
+	/*
+	 * Finalize the log after the runtime is selected, which blinds the
+	 * constants of a prog of one function and can log an error. Preserve
+	 * the original error even if log finalization is successful.
+	 */
+	err = bpf_log_attr_finalize(attr_log, &env->log);
+	if (err)
+		ret = err;
 	if (ret)
 		release_insn_arrays(env);
 	if (!env->prog->aux->used_maps)

-- 
2.43.0

