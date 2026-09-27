Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AC23C1097
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550438; cv=none; b=Wgy6qmsD/QKkpxXpM1q8irwXIX33QGFrcOdX3nLojDpdGvoX4DutlXilnSCNjlN9UArcMLmKCdmKx7fhuVuD7wnQDFX2w2x3/X/yu+DoTxLsn6P2un9pB4d8FT7LnryDNwPe3cIkCKdnSiVEGFOm+IHIAnwzmNY1FSFoEhgYFMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550438; c=relaxed/simple;
	bh=F9Sa7Q15VZJxKT3BZA0gOeZJQMHcfq0klY9AQGiGSOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gGLXmJfFvXiMudYo0/Zk5KW8HaG9WvpeId9Cb4o0RLfZgNpCvTurjL+y5e+2Y+g6UEgAxG8BGw3iACoTV+8Ij/fCMlPGOsYjvINBvW42P5u5+4GG6cjpP3+Z4eUKljxJ1bfcL+8dBP/FZx7lz4pvt5xckQ9PPEOVagOdQKvQATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5mvhz4s; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5mvhz4s"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso4771665e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790550434; x=1791155234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/a+F39bGWb4OewkX5Hci6JgQLGfPvrvosBqj3gZjoyM=;
        b=q5mvhz4sY88KKx91DnEgAULZZt1vBzV/a9AyA0NnAQarsBrPOuffT+OlR9K8M02LtW
         B2yXi5a82kNnMiTFum85upIioSXCzVEfnuPWV2LCcmBfX/1rbzSCpX550fN/qcYyguVh
         jwbY39Yw+Wo0kLYRlq9xnV83a6aoeSHYDcLRXkdsCx2boT8wfW+KfEisnoILS1dAz7ey
         DUgxRJd8GJW/9mzy1mku14P6zG/2u4+jxjsNY8LjRkcOhM+naXLHnu2k/LZfKDZbh+d0
         xvFrEnLz0shSq+1eeCMBQ1kWx6J/Cu0WYTa92Rc4VRF/UJ2adi2oJqAam2nr+S/PllL4
         vIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790550434; x=1791155234;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/a+F39bGWb4OewkX5Hci6JgQLGfPvrvosBqj3gZjoyM=;
        b=Bt+6YpyE0tkv4KYAZ9VlucarylpwekM9kot3QOhgYbuLEY2904VZERKXo4EsBT/rHY
         ilUejBDdgeR/jSEh7Jpe/wgRcQNPJ9yWF20kfTpenqYs3o0MusKmpJ8ZR+2neo3Jb9O4
         cE0dIl5JdgXyk8PhLZUBdaUKvZES7QJoUw9dIR9YpgLdFjrdzrBpOcyJkPSWNhopV6iB
         RrKkfpTs/NqKgBsHSLXDFaZWGr2NwCPQMnLDV6YKiQiWr8zMV9xlMbhOi5TC1P8WbrUa
         hCfGED9/tOfofJ8nNIn0dOAMDgDBpw1usAEvCDmKxxmIE7ftVm2OLCghwAAO1BAf5Db7
         dfvw==
X-Forwarded-Encrypted: i=1; AKwUvByQKAffuzG3MvkfbcxZJOk8wndFf+/e29gfre8AEzCcP0XlJgi+KJkgFPbW3JjdfYp8pdxoIvhf1u1rH3A=@vger.kernel.org
X-Gm-Message-State: AFuF++mkgyJi8Lxc7hCoUdpMYPT7sBS3cdLrJ+J3OxXzMxy2OjDfKm54
	X/CF9f/eJMsj1JkSmwxwmiresvZCDfBmxIQiIFFEz//YABFGNgf8fSOr
X-Gm-Gg: AYBFou0ls27P82G9b/OHFCy2OPhzfyQ7gmu+zDKewbTIiSDJnnvVA4STmy6I3B39EdE
	kgpPoxAoS5FP/UotXW20hDIKuYWJOTl8YPMffiKXdVfP+ehPoZS+w03prwCtyVamlDv/WujR/y2
	3DKE4F0jnrGBYaCu8zdge6iek7XN4ATbIv7QVigTxpOXU8cmQOQ5yfsqqiCaxTry0HNmWLGcBYd
	Eei0HTtFHLpdiA7/e2rpoI03keGEPP7v37w8dgk056XMI+FmdSeBUpB+lIac1b3wFVe8XN8DKy/
	U2CJrDFo1Wt8qVCu9HojQLCI48p8DJGQ0kircb68u1BYvmJK+uZeald5p3ak/tDAZ6dPWI+b/0M
	aEKgDmMlOqb8tLthdRObWVXSL5MeM3Vn9ytsKeV9anHqoqSU8H7IIOnp5nEiKde/SJxt3iMIhnE
	DnR5F+QLbTLxvaiRgR5MWAkdM/LlBpsyMK0Tge1dY7xudDPEaFwSxY4h4/jGtdwj2zJ4JS
X-Received: by 2002:a05:600c:3148:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-49ffc4fa10bmr80800295e9.7.1790550434194;
        Sun, 27 Sep 2026 16:07:14 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm134269715e9.14.2026.09.27.16.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:07:13 -0700 (PDT)
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
Subject: [PATCH bpf-next] bpf: Skip redundant destroy_if_dynptr_stack_slot calls in check_stack_write_var_off
Date: Mon, 28 Sep 2026 02:04:28 +0300
Message-ID: <20260927230511.417420-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bpf_get_spi() maps 8 consecutive byte offsets to the same slot index.
When iterating over a variable-offset stack write range byte by byte,
destroy_if_dynptr_stack_slot() can be called up to 8 times for the same
slot, even though it operates per-slot.

Skip iterations where the slot index matches the previous byte's slot
index to avoid the redundant calls.

Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 kernel/bpf/verifier.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index fec5a1ae6a4d..0eeb498db9d3 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3824,9 +3824,13 @@ static int check_stack_write_var_off(struct bpf_verifier_env *env,
 		writing_zero = true;

 	for (i = min_off; i < max_off; i++) {
-		int spi;
+		int spi = bpf_get_spi(i);

-		spi = bpf_get_spi(i);
+		/* bpf_get_spi() maps 8 consecutive byte offsets to the same
+		 * slot index; skip redundant calls for the same slot.
+		 */
+		if (i != min_off && spi == bpf_get_spi(i - 1))
+			continue;
 		err = destroy_if_dynptr_stack_slot(env, state, spi);
 		if (err)
 			return err;
--
2.55.0

