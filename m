Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5042DC331
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324912; cv=none; b=ckV593F7rHpwf8UbWorserQ/eEHTgscC3rfX14kh37r6GEkjOzc5WR94WXac8r/o9aPZ67TF2FhQPxEJ4yUkoaEngeZP3EV2eJo8RQ7SkvtTo48pz0ST5H/o1Hpug5xl0/qFw7JOPLb3745mxk6MMnc5qrClBhpJORo+3W3j1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324912; c=relaxed/simple;
	bh=KHNLBWYb3Agw7rp5Zo4AMw6jvTmqV7B0MMc5VXWKygI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CxzBwlmYulZhzuKdM0zTLIpAkyHWkNP0Qs6g1Tl0sXnoPTLdD4E+IwV4wT3XEzdMBobiF2GIcacJmn8PPQxHOlDEHqXk9zQY79PgoZOUPogoP/C7qerycvqPNEqnxOaJhkW4InzM+dl83ZZCDmGVQV56J3gdriiTfdTd/tCdfJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/GszPIW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/GszPIW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so3195655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790324910; x=1790929710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQ3tW+/KlCuB42+pkQvUxoLmJ9H4mJ7fHt/ahNQpmBg=;
        b=M/GszPIWVOb0+RWzayv0yw5Fw8faIoE+QFtoOcU135DMY8ojUnMYVyoSCXYjDc7yBw
         YhcJ/AuIW9ALjQu8ZhUu4bB7JD9K/wxyYPjPu/nOVx+8xJ7oJ9JFE1ees5/xT38g19MS
         g+t8j6H1TuB3tTm8J/+f7rM3ryttrs9Cjq9TffZ4lyrHmylOBotQqUv/RGOOnbBMqlKr
         qVS22DQAf0ngXPhYyWao5AU11SJFY3EKP87+NScgP+XUPFccPZz9lD/rGnQGylx2/L+N
         XArYUHfleAOLVieH0X/VOgTJ2iWiQNvmXatlkvHgBevOz5tawNvvUVrPD7v8QzoOyBWJ
         HZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324910; x=1790929710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQ3tW+/KlCuB42+pkQvUxoLmJ9H4mJ7fHt/ahNQpmBg=;
        b=wfOi6CyksHnLTwSTsHSVa1W/By/s6UXrB0ffiM9Kt7Es/xnoXCyJFrU43r9bPu7Fvj
         dLYlSAVzokYmyvmZB6PT1lvG5qwVUcNxwwp3eiBB4xqr+1rEdCyHBJQ5bA3e/sG0hVgv
         K6Do10gfXLA6o3ycdYsBlO+4DotyT9DM5r1qlabQUARW/EP/wVWmxXOcNh3TaYepd8/W
         DqkxhUMkdfpo/6B3SYeBr8e77GNOnLx//GP1IPdUmVciY0jmc9WtSOpXTYUQNvcs46il
         erPMeBUKTBX46nY8nfjZ24kW0jereDfcz9gNK8B/5hPXTUu51y65h/FfjLnRSzCUFzQt
         gDnw==
X-Forwarded-Encrypted: i=1; AKwUvByeqt1yfJUMsJ7ke8V3rU9StuoUQt6Ap1kolSPZudgeEuPZJa76wKV9Kox5jzud9gCklIjIrx6CMNJ460o=@vger.kernel.org
X-Gm-Message-State: AFuF++mhkhwEadNpStkqppHhE6eyEGTb480TorS1GaYtJ7b7rz/fjgpr
	MEvy6J+RPqUrnwefsXvwaCERcKcUWIH1eBcV10P9Pv8eAf+5czybPQw=
X-Gm-Gg: AYBFou36s70kXosaHLf7vBvw4Q3WNgyg2CFRFrb/XMyP5S+9TJnShcZUu2i6p9/vD8W
	1fnD3IIoOiHeudSWSrkQeYWHTr81TlyPlpQQgf+rNIBWi04TNQTyAmYxVCN4rJGXyoJjzkk+rY8
	wDgg4q5WQQEQa4u1oIyUuhZa7/E6AV9JBPTR0Dps1iUpGcoHb1r5/HUJyvzOwla286+HDw/ij+Y
	CLecgpuddBJ430BGe7bCGgmE2pbFV8h1nDxqDbUfIx0orZlVfHlOef/lEGKRfzHVfKB0SAQKJEM
	3MJvGjzVh76qlHfseq/J+qEgICMEuXp0hDBmx05/wDcKlcCC3JizCJJVt6GWhJitozClIXmRoWm
	YgjqLJTYZf+k79a6d6/o8laiKjxe/nJmTBCanQbzG/64aHOle5ePyCdVtK5pVs7pe7L05dawkLV
	Cp7zkRBrR4uYR1uCxsyQRzIzIhTP+UtublxT5q2CorbeVaFEhRYWzExXRlYaaiieLJOalC3pnvd
	nqfvUe+SzVPInOqda7WJ6RxcP/KkM9X8K+CWXzIw9+2IGPrccX4JsOyD6Z8QyYocfuC2j26ZCdQ
	BoGBRYurzW0vfxMGuZmC
X-Received: by 2002:a05:600c:4f88:b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49fe66be085mr81937735e9.1.1790324909517;
        Fri, 25 Sep 2026 01:28:29 -0700 (PDT)
Received: from ast-epyc5.inf.ethz.ch (ast-epyc5.inf.ethz.ch. [129.132.161.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm5142896f8f.21.2026.09.25.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:28:29 -0700 (PDT)
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
Subject: [PATCH bpf-next 2/2] selftests/bpf: Test helper read of a narrow stack spill
Date: Fri, 25 Sep 2026 10:28:14 +0200
Message-Id: <20260925082814.1554771-2-sunhao.th@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925082814.1554771-1-sunhao.th@gmail.com>
References: <20260925082814.1554771-1-sunhao.th@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spill a 32-bit scalar into an 8-byte stack slot, leaving the other half
of the slot uninitialized. With CAP_BPF but without CAP_PERFMON the
verifier rejects the helper's read.

Signed-off-by: Hao Sun <sunhao.th@gmail.com>
---
 .../selftests/bpf/progs/verifier_spill_fill.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_spill_fill.c b/tools/testing/selftests/bpf/progs/verifier_spill_fill.c
index 04989d08be44..4d1374885f6d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_spill_fill.c
+++ b/tools/testing/selftests/bpf/progs/verifier_spill_fill.c
@@ -1363,6 +1363,30 @@ __naked void stack_noperfmon_reject_atomic_on_narrow_spill(void)
 	::: __clobber_all);
 }
 
+SEC("socket")
+__description("stack_noperfmon: reject helper read of narrow spill")
+__success
+__caps_unpriv(CAP_BPF)
+__failure_unpriv __msg_unpriv("invalid read from stack R2 off -8+4 size 8")
+__naked void stack_noperfmon_reject_helper_read_of_narrow_spill(void)
+{
+	asm volatile (
+	"r1 = 1;"
+	"*(u32 *)(r10 - 8) = r1;"
+	"r1 = %[map_ringbuf] ll;"
+	"r2 = r10;"
+	"r2 += -8;"
+	"r3 = 8;"
+	"r4 = 0;"
+	"call %[bpf_ringbuf_output];"
+	"r0 = 0;"
+	"exit;"
+	:
+	: __imm(bpf_ringbuf_output),
+	  __imm_addr(map_ringbuf)
+	: __clobber_all);
+}
+
 SEC("raw_tp")
 __success
 __naked void var_off_write_over_scalar_spill(void)
-- 
2.34.1

