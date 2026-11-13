Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559048;
	b=TWW0OtUHFJi41cLloqnd3PaiKmmKLrfjqKrt3lzDX61q7QfirO4L3Q/SHZEZ2dZyhrQe
	 1qVDGTPSiEEpZrkeHCAT1E7lmtBMhvbTSMWD5zdnUrSb9qhDI27O/Spy++yLLbcW9JvoP
	 m7mRknjcPgmPK1BmT9fzely6SwVg1clMtqrHcCpPlyLJJ3eg2udBwJNHGAeZE+qE5O6CE
	 AXZ8+jQEItZ5srLIZuhnR5ogvn6RL9+UIULBp7TXKyDQ+A0nLmFYZk3bWfuzeu+uvwtH5
	 l2mMm0viVQZjSUky29KL5nOLXMdHIn7tzKH00G1k0jtPI+hfNfpsR/pjExCGwOo/1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
	b=ivhZ2MgtbGsl3CVQyHrveTQ0Tl7+2RpPKGgpy/3q7ecvwRsipIYZk9rrcuIUIDM4yXWl
	 z9VIHkYV2YtuKyBxWrzeK2vvfnoHBfFd5dy4Ag2KxiTbr+vDSawsOIVpS3mU3h/ULZqsT
	 AL3O9PaVdmFPeH136ipjr4tYxJidq+5p4KNj0P8SbH2j0tK0891yMO5RYqoQVpLgi1C2N
	 lZ4F73kEBqU6tSgSXm5fFXQHB5RMJ+FV80tniHCNGRcHGvZGLAQciufDJL55HzPd5Tdyl
	 oclHrX8BxSfTXqz7rkDsIDe2tQ6P470M0rD5pa9n7Y1LYPHGrEiE7HhiE5stUn36GAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=SgCe+KSs;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9927560A381D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9927560A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=SgCe+KSs
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9ae391a05so3618355ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559047; x=1795163847; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=SgCe+KSsRyjkOzf4OHsVlb3Hf9FWal04KpQVs268s1oTe1DFawntXydtZWS/qEKPBg
         IDuVfMnscTgBMqG0b3Wb9hVl35YjiXJtE7qxIdgZyfRnVDtmTiT1MI6nTVvsL6JVv2II
         aACYWV0ZTLjMgpNYMolodetslbD/vKtmC9+lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559047; x=1795163847;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=o9NQ1x5D63xi3vIx7uRIFfOih3U/FDc70o6Xg44Uw3iv3xrflBDxO+Ntg0IFbJpTEQ
         3cb13B8/4ZYPvVOSLsgGAYtg6kIp5m98IkqupS5/f/hJDHGeSnbcVQ608FO+TQEVy2K/
         F6LGHF8G0/jLe/Xvir+e1emq4zstFTLIwahJuLRlsKL9DIpDq2rWtJoMai0CEahZeCAu
         fEGWWk3br0lVqwfbtB3vmwvOaSMxqYmcfYVc28ev3IF3z1jq3sSFd8AANvemIGNPYmDN
         gby/0aXtT5mdIufzlvGY4crh3P9QYeP4Q6c+qvq/0BzMB9+65Fh0AtjwdTZNv56PCFVD
         r9zw==
X-Forwarded-Encrypted: i=1; AL+hErFyt6PEi1MSx011s/GS35sonBf52VhGEbR/g5XraI/RRC8vncNTj+fFdGdZu7EQPGV1fRdsUJWgU69JjC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oY2UWhBBwzi1BAhoJQk0oOGYfilT+Q+l8/nVWaShQh1NT37au
	nlyj4ceCKtQg0ap3RyZLQirQke1nDFY5Dub/famXLWl+9pXAEB0EK+smUEv8EZvlwco=
X-Gm-Gg: AYBFou0DB7pHnjd5Bq6nzgr5hcEhh8XMZHcDqdqH9Euo2j3wN57FHA21bUvh4OekmSb
	ONE1QrKY21GLskujif3vYNfZOn/7GTi4hsAkx5UeIjdEY8Yi11qg7aBHi7SxYIUU1Sh+ilX/WYH
	SnLM6O/bVpHWzVHH0T91qhovOip7ty0p5c64ZD3rf31OQPtpOlp6H54U7P3arLrOUbsgS5xLuI7
	zHm8a0pRj2srsggW8uANENOK8Us5rN9FNHRqqo605kxAPEBKN+dyl12Vjzrz3jxQ+gCtdxx4qLU
	CPDDpJ0rQxQNi4eM+Sg7RNAvsYSoX7XLns8X/5i8S9IJPrnjfTO+SmZ+w29d+wKnKWgtPjTUoUt
	LLm65Bim13hyVc442r+m5rvMmAbYeMO8P/KeTd9CmUqu3nPkBhoyDQCN2n7V9YQaJy8FdmEmQf7
	JUTwX5mGvW0i5TMFWRZ2tmeLOkhB38JbL0LilOckApRgq0Hp2pV+h+LkeGBt72EXZaFl+y7OfMz
	/0Sv1nJZs1ec9hN5MQw7H/G2hGxpuOZ5E+x+jChYFyP2UE4ITG97kO1NBPmT8BZkAllRpvnJdBq
	146cNBRCw5HeMgdhJuv+7vGK7rtGoeQRyNLhdzN6rJ40WmZaTC3Wr3BCTYoE5g3CzWNhLft2c+C
	2VORse2guYut2TGbvb4FJbKNM6jvXz4gDUpOrptc0mJBMAPy+cV34Qy7Z567G90xNXN43aPOEsP
	jX2m25DyNWm1JckExROK/QRMJmUax28RH8RMKnUGB3JFV/a3FoQBO1Bfbm/5VT
X-Received: by 2002:a17:903:9cc:b0:2e8:3b2d:c0e1 with SMTP id d9443c01a7336-2edf224a995mr38643685ad.41.1794559047053;
        Fri, 13 Nov 2026 00:37:27 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e48e2sm6802375ad.36.2026.11.13.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:26 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:24 -0800
Message-ID: <a8bc6ee26d1cf35df5b0a13e971d3726a1a51042.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the
 scheduler stack end check
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

There's no existing test for the stack end check in schedule(), so add
one.

CORRUPT_STACK_END overwrites the magic at the end of the current task's
stack and then calls schedule(). That should panic when the check is
enabled. When it isn't, the test restores the magic and uses
pr_expected_config_param() to say whether that was expected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 2761685cf4f8..a39cde7495d3 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -885,6 +905,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.56.1

