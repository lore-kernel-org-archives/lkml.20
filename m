Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753067;
	b=DPnwbDyE6KJltW+lA5tbzL0WP0AT8NgyMqemPjGz3d8peUT8uvpViBi5wKFSmq+b9HUl
	 LTMMZAUaylIj/xhf0Xdiiuxb49+9Bh+S3gEuIUTUHVM5Us1WyBetw3bBlDmk5MWMr4JDR
	 xqM1KFJ5Ya7Ahm4cXk4jBIWDxALIw09FWODgfYZvCx+6h6ugN/jDaT/9qS8F3RIZnkKc4
	 Ghiijlj5yNf3tmMDvtL8SbU7I7ymxeRtapfdBxJo+qS+/uHjYJGVyHKxuguY4GRktj2a2
	 UxlL6X5j7QdB2bKdkTkqnV67ZRsGf+ESvB3gJ3fZZuG5CMAkrR2Q/aiJfsKJ241hHwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=EXDY9w4RlOwbfIpRjyMCCd2SiyWv43JxMOCKrc3iaW8=;
	b=ntJdOwjIjxDkdFeN8SIFh4hjmCiYPcM2ntAVHebaWrGCJfrf2qdGEsVXDH28HFftIqQf
	 h+zVJI4qk8rAThIzAPusyUv5Oq2EuI2mxTrKTf7j3UArAH6GoVQ7nbyhkzgeis9Lfixmm
	 tl1+zmRh2wp0DB3WAZtTfHdobGbY771sgqkpp6ICx/uHXXwrpCmf3MX81Eh+npkImMDsd
	 7QG4zlop4QjBPl5mGmyAkKzCbL6f5jK6VlM2qnnjsMg8e+Gw1QgB770i0gnGPp7h8Uo8b
	 7EXfEtIdAycRh5BFWILplX6+L7KnSiQJ2t7Fvd5DxMQoLm597Cw8GEhQ+OmEOSY9iJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngl98GbZ;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194F1606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194F1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngl98GbZ
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab98332238so94381a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753066; x=1794357866; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXDY9w4RlOwbfIpRjyMCCd2SiyWv43JxMOCKrc3iaW8=;
        b=Ngl98GbZWvNp9KhithH0kX4jd3+dZnpMCeIFB+t85NCm271/mMF0fbRM4Mdf1r79jD
         g1AW9F15+84oH2lsdNfLTHD+JPME6Zp/9cO6z2r3QYVx1uoPF5jCSXmstXi7P+zxfVJk
         hWVOnUb2UIPIHAZL9unt2/Fnlw9PB2pgXeyKggwdtCsqHKyKIgKMmhpE06+Q4xzHzG3V
         YOPj/VPOWjkcfQPxAjEnJltGIDXPYrdzgLIRm5598V1Ur3yE7xZRQqFAbtajb+0L2vTD
         JUtGD6RO401EaI7b8ed08LEGDXgy+ms8UzAMBzxC+xFu0OhMvTqEVxbGGUJE8yVuHR0s
         zutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753066; x=1794357866;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXDY9w4RlOwbfIpRjyMCCd2SiyWv43JxMOCKrc3iaW8=;
        b=jTLAop1TkGGjIznYk/bSgC2QsBZ1ax7yuEfFL6CCJjSeorCYw2ohEfbtuckiWCztvI
         FZhFOMXkLV94Dv15Mtzf0j/hGU3AimTFkNukyukcrCWp+277JXSYBV8fG56LNDRLexnC
         ncYFuxiunhzhQANyMwWgKN6j3cU9Tc/8iB9PC1heASueCT62FMGK9BnCD4TyeHktrLUo
         zDxV5Tescam3ltiBhMgBZOv+VhcRSs85BEG7h+H+7y2JBqCAP79atFRWzCIkLBxCqoF0
         Cz58QS3Uu6ychAIWJ5Z4LmuIWLliQoNxnI+be3T8cuP1eqIJwkDRRFHuMNn0VzOj97/l
         pZqg==
X-Forwarded-Encrypted: i=1; AKwUvBxnYUrqUXKklei/QwOGklcfMxotnqfQR6+1OEBv/MUcAnCI+OaBPRFu5O0fD3+Uyj92wjdUZo/lBZEifto=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lRA6lH6GHNrWv4oVkH6Npq00p+2eVKCdrmhvZKFtoanQGVML9
	P8AduX3dsVP4DSRGKW0EWeguMhLsKyK1dlnNI9XYN/R1gQ+RQedDOp7TSmnNXg==
X-Gm-Gg: AYBFou2v2j4rc085kZEuo2bl+ukC9XrtbHDifSaHI4DMM77QTaeXrn9vwWeiFzHQWCB
	BCMQbdlHrg6ngZb5+2xXhlUuolJz4eqkLoNae9rE6uz79AZZyk64CP4RU/wsRbtti7Por5L09oT
	j/AFTGwjBA7LBiOjotxPSWDSjGiQkyQFyPQx0ICfYzGF7viVGBtRmn+Lbcg3JmfxNBNgI6iGbRk
	aj7X0kf6UMixG1k2vxrADw6mRv66RcNrrqGxZGZdh204qmVDGX2F7o6MoFMri8MX4V+kxzf2CVb
	M3iEnSH1xR96K9bcG3ejr+1VO9SKnrla2Tu+R+qvZBqlCDMv9XqyrsjrKAwnta0jwtTKRx6ew2s
	2jR5r/nFu/Vm2lahZ9wabo47sMuee3bAsw6Pb8S/+eF5CuksjeII9+q6sNgej7fr1wTOFMHNeAJ
	3evuTzWnHX2tsXuucdedSXcrTfqpNY8I7FOoTn0GiCU6a6a20QMniQjjkVOnkANj2ycQL1YSooT
	iDeGVcN+753Xp8TiBZ3NE0witjG+PDgact19Y6A9HpSbvplYvN9m9H2oBKe21M9sU6D44jKdauJ
	BuJ29AStOAPpIJ/pTsu/JoANFag51dvukxX2ViYYQpEb/T9FxyCK1W5XiG7jj8/1+9DV1rIK2j4
	eM/ThN587WVDlZYsxrNMpJhbwrkIQspwn+fc=
X-Received: by 2002:a17:90b:1845:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3ae89787ea2mr10693463a91.46.1793753066335;
        Tue, 03 Nov 2026 16:44:26 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094d572e7sm567255a91.1.2026.11.03.16.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:44:25 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 00:44:25 +0000
Message-Id: <DMM0E6AA3KB6.28SYB9X6ZYIHL@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Account for zero extensions in
 patch list expectations
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <bpf@vger.kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <iii@linux.ibm.com>, <bjorn@kernel.org>,
 <pulehui@huawei.com>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20261103215309.19950-1-dennylin0707@gmail.com>
References: <20261103215309.19950-1-dennylin0707@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 01:53 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
> patch_list_insert_in_front() checks the translated instructions around
> the call of an inlined bpf_loop() and its callback. On s390, the verifier
> adds zero extensions after the two 32-bit register writes in the loop.

Thanks a bunch. Applied.

But could you follow up to
remove the two 32-bit writes from inline_bpf_loop().
'w7 = 0' and 'r7 = 0' do the same thing.
'w0 = -E2BIG' is an old bug. bpf_loop() returns long.
The helper returns 0xfffffffffffffff9.
The inlined code returns 0xfffffff9.
So 'long ret = bpf_loop(...); if (ret < 0)' misses the error.
The "over max limit" check in prog_tests/bpf_loop.c doesn't see it.
The prog keeps the result in an int.

No other insn of this prog writes 32 bits.
With 64-bit writes the xlated code is the same on all five archs.
Then no need for the #if and the second copy of the expectations.

Something like this (compile tested only):

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 6b719a2..321624a 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2783,7 +2783,7 @@ static int inline_bpf_loop(struct bpf_verifier_env *env, int position,
 	 * expected number of iterations is too big.
 	 */
 	insn_buf[cnt++] = BPF_JMP_IMM(BPF_JLE, BPF_REG_1, BPF_MAX_LOOPS, 2);
-	insn_buf[cnt++] = BPF_MOV32_IMM(BPF_REG_0, -E2BIG);
+	insn_buf[cnt++] = BPF_MOV64_IMM(BPF_REG_0, -E2BIG);
 	insn_buf[cnt++] = BPF_JMP_IMM(BPF_JA, 0, 0, 16);
 	/* spill R6, R7, R8 to use these as loop vars */
 	insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_6, r6_offset);
@@ -2791,7 +2791,7 @@ static int inline_bpf_loop(struct bpf_verifier_env *env, int position,
 	insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_8, r8_offset);
 	/* initialize loop vars */
 	insn_buf[cnt++] = BPF_MOV64_REG(reg_loop_max, BPF_REG_1);
-	insn_buf[cnt++] = BPF_MOV32_IMM(reg_loop_cnt, 0);
+	insn_buf[cnt++] = BPF_MOV64_IMM(reg_loop_cnt, 0);
 	insn_buf[cnt++] = BPF_MOV64_REG(reg_loop_ctx, BPF_REG_3);
 	/* loop header,
 	 * if reg_loop_cnt >= reg_loop_max skip the loop body

