Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DD147F2DB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255662; cv=none; b=GiZHg+tFJnZSSolRGX6EyEnyn8sdr/k/GxirZrubtSf+2wuNxTEkgHXDnGl5ssZK1IMZXJkNrp2JnN108m7ZMewDA9GwBFbMjB8IvZs42lNv2hghThr77sFXDkvAchtveEf9eLTP8pVQ6Kb/p/KsiLxLahBAv2gxl4Tur55Vi1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255662; c=relaxed/simple;
	bh=VHHnAvsUiXyMLywhj/CdP4Gc0HCGDFaSO8mlgs/s+2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d/Bfvg2NfzEqoqzdVPUGpd+aAr9ytbfGypVByQ77eh4A7UKgbngoezEOmNTCaZP6ggRhaSNcUDbE9nomaM83niIFQGID/a0nxkIxdwomIfUZlf4PaQ4y1FAFvRZbrP8sRSiQd35euYbglTZqdQZPkd/QGO3r2xF3dwu71yD7/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nawamyuu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nawamyuu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so11795625e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790255659; x=1790860459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq6oXmBjhmxYtZCGZMo9VNKB50nfTEO3RpL1ByCTTS8=;
        b=Nawamyuuxp6R/ZCGhoyynPFu478UGgjbsee/zrkM4aiErpxBg8oHVk+Pfm8QerQ9a7
         pgLFOc8I00L3bR3pB/cioBnQK7DJAqGRwPGO8c7zmXOXZu9dgSMZhRWpAUxAMmDByH8o
         EhkhM5etZM9EobqS+tZtlI1OOkUt9QWqQsO7FGll/r6gF2/hO6urJuBWeF98/0DjsL/D
         X+x6aUYC7d68i8ELBZQdxdpozWXBTV7Mc+Ac4mchPwrTWhL5XkxJoBpyELfZMra2ux6c
         BBNEaSa5zlWyg/tcmL+qXd9dWrbwhN/LqRkcfguKilp77A8pjRAleW8qq5ovGopxPUIJ
         B7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255659; x=1790860459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq6oXmBjhmxYtZCGZMo9VNKB50nfTEO3RpL1ByCTTS8=;
        b=IOVtYSqLLvK5dt2rXK0lnPwWMgUVlt+hsQoM27MJxJ8njpZBDG3F6YU3poI0iRLpdZ
         NPdiCkYUO71JDSRWKYEdkb44V02u9ectspQuBSexzx3AIyYZIUR8iywaU2rEWJ9+evfn
         VSedvpBdW1NjcHSmeEi6v1DkiTqObwWExXPh4lrtuv3GXTA5x3TCOnRhjp6yfsdTQEuq
         KjaGxD8EUldRt6QuuffO8KjmQwopA/KAPa/4hezXITc2PGibVTLd83txrv7vM0XLucsZ
         NakY9lJXJghnnH+RpF4NqrV/fJ/AK5Ln31la0n4NKFTAVKeZXELmRJqXclGktSBJqOT6
         tJDA==
X-Forwarded-Encrypted: i=1; AKwUvBzJphYP7+1k6e0lLk3txlz6hGxGquic000d9tm/8ByM1efPuW6MDEV1numPOGOZqDftOh6sDprF4mfOlt8=@vger.kernel.org
X-Gm-Message-State: AFuF++lf7+zWNnTCWJD0iMn2tMOiYELUV8ztRTFdbTizcarsR2IaK3o1
	dxr+XGf/1f35/GhG93J8gVQ7VmXdgWd+kT/fDooALqR9WyTjSVduvAY=
X-Gm-Gg: AYBFou3Yll3k9FxVJf06+r3wWl5hQfWXEdygoIchK0yrV1KC7V/WwElnM0fLyUH8lUE
	rGSQsYtZYUg3FZo+xid+3ND1UR7dn8GnqnXF25TvVSI/Br9eKtAkZxdsDRIdRjlpw1+kYnxFtjV
	VLho6seCCrvjzCKkUfHvgWdS+ho5JJ3ztj5oTcOrk+Wj8dojy265jparlLZEP8GqGN+iUn12V2u
	nRS0pAE+8FAYH1CbA+Gd2BOKKus+O9SBy1jsuW/u7UB/2XabNpa6H+81vt+S3MjL1xEk7n61m2T
	RtzGlQOBry3kW/eyxBn9TiiE2mkOnE3IBO6FDc6ojN3V0j+trVXqCiYWELwCagiZusvvHsUikUT
	k8DBZa99GmB7yUofUu0G87gzkWKR/KtzABtPPIrt5En/89zoZBhjKIKSdB9xQgOJTomE0sHLfk0
	FlI4JkbWhhvC7G0tFEnrW15xlLLXkd8/S3aXJYdS3LY3NB15rUrSw5CeUzYgM11vdFzCAIbth8x
	BgENo0hGxdxhV1V4X8G3fBC7Kh+G8LTRWsUPx2cI72ezF6nrHYFTVOFfGvIZrP/S7YKcm/Yn2jC
	tI7iut7F9Q==
X-Received: by 2002:a05:600c:4f10:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49fe66d09c5mr48279855e9.13.1790255659417;
        Thu, 24 Sep 2026 06:14:19 -0700 (PDT)
Received: from ast-epyc5.inf.ethz.ch (ast-epyc5.inf.ethz.ch. [129.132.161.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c104a6sm123986495e9.0.2026.09.24.06.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:14:18 -0700 (PDT)
From: Hao Sun <sunhao.th@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	john.fastabend@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	linux-kernel@vger.kernel.org,
	sunhao.th@gmail.com
Subject: [PATCH 2/2] selftests/bpf: Test non-fetch atomic on a narrow stack spill
Date: Thu, 24 Sep 2026 15:13:42 +0200
Message-Id: <20260924131342.934290-2-sunhao.th@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924131342.934290-1-sunhao.th@gmail.com>
References: <20260924131342.934290-1-sunhao.th@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spill a 32-bit scalar into an 8-byte stack slot, leaving the other half
of the slot uninitialized, and apply a non-fetch 64-bit atomic add to the
slot. With CAP_BPF but without CAP_PERFMON the verifier rejects it.

Signed-off-by: Hao Sun <sunhao.th@gmail.com>
---
 .../selftests/bpf/progs/verifier_spill_fill.c   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_spill_fill.c b/tools/testing/selftests/bpf/progs/verifier_spill_fill.c
index 39a1766dae3f..d9a4164b6685 100644
--- a/tools/testing/selftests/bpf/progs/verifier_spill_fill.c
+++ b/tools/testing/selftests/bpf/progs/verifier_spill_fill.c
@@ -1344,6 +1344,23 @@ __naked void old_imprecise_scalar32_vs_cur_stack_misc(void)
 	: __clobber_all);
 }
 
+SEC("socket")
+__description("stack_noperfmon: reject non-fetch atomic on narrow spill")
+__success
+__caps_unpriv(CAP_BPF)
+__failure_unpriv __msg_unpriv("invalid read from stack off -8+4 size 8")
+__naked void stack_noperfmon_reject_atomic_on_narrow_spill(void)
+{
+	asm volatile (
+	"r1 = 1;"
+	"*(u32 *)(r10 - 8) = r1;"
+	/* A non-fetch atomic reads all 8 bytes of the slot. */
+	"lock *(u64 *)(r10 - 8) += r1;"
+	"r0 = 0;"
+	"exit;"
+	::: __clobber_all);
+}
+
 SEC("raw_tp")
 __success
 __naked void var_off_write_over_scalar_spill(void)
-- 
2.34.1

