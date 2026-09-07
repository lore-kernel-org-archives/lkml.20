Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF137C109
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756750; cv=none; b=H1MXyieyUn5r2YncEdxlNb/PjkGJGnIdpJmW9itRp5/EQiDriqM8oFT3Wso7kau0wTSpU6MTiscNE20gvHoVSrPRkUlIzHcTqnCwkZvXGPToFfv2c33hLaPk99GYk3Q2zgqWbyon4DoUr1K2l245Tlh9H2A66O43xjDoZ6SBg68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756750; c=relaxed/simple;
	bh=geshVPPC/sFWfefds6yEfFfn1FmETpgHyUfVVTDRiS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItpfnSfD29/Sm33sobCAzFdQvfys+plOBeDihFasiTE5elr9FRSknFXJrw1YLJzTSvQYfUuCrvn1EZzhwNksq0wdz78PRmI8mILQiHH1szNW55SQeQKhvke8VcXC3A5HMT8hDuepLtnWLpXtoxztt5WsRWQnwwXSAjiZwitopF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEAg3ruC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEAg3ruC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5cad1a6baso26386815ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756748; x=1789361548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm/cehq7ZbHazeTz6lyclFSjgW2pMvi5dQ4X+rlCVtE=;
        b=hEAg3ruCGRjHQz3RedAr8ltMRKlsmVWFpIrWxjUSEYxeFhJdrexG6OWbCLTDqZ6U/f
         zGK+FPF4SZ3xYNq3/QLWE5c5L0679jR+XjMmvLyLY/7VilSV1cXdLYehA2KgvBHEh5Pv
         cqpPzdJCMGKGusu03OrBLv5cBaXbNJWbtDB4sP/6OcrkcJrTJFmAECZCuTo3iiNJymu5
         aqrPo5JwNQpDpz+O/QUbY/8sILccE3zJhkSYLH8nBDg5d5CmauexfL9Iqdf46hcGi+C/
         fj1jWUb9kcSdlAbpGA/tmxcSj7BcPq0Zd5Ok3YjbaBgzw0/J7sCjfWEaTodnhuxQ5rQt
         S1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756748; x=1789361548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vm/cehq7ZbHazeTz6lyclFSjgW2pMvi5dQ4X+rlCVtE=;
        b=M+prQhOCZsGZdh2lNg5yAEPlEf0uCkk/ESUXrcwzWcwdk8BNzg6KeBvMds6qc2Vwyw
         e2f4ndTsmgCLOMqOabHzMZdwqId/dK1TKcQctCGm8wzdnPAT7jwFgh6yuoEcAyBGhVy+
         0lB/F7vVEVENQrCDR9KkoBDzfm1b0/t6UxCWs6GrNLooObTxDEnReyMQHFajfYgeLsLR
         REhu6DbtbMd9X047H0HI3ACyHE948BYEhgA7xYjjDA4JaeQT+SpD4mzWJx8A1q1jqbRf
         f2YiD4CEFbsRJ+PyIo6pjqQ4VxViqvf9s0DuNZa1UMQzOS5vIsPqvR9bh1r6RDVJsjXP
         NBEg==
X-Forwarded-Encrypted: i=1; AKwUvBzL4d9CPEl4CHJXHaa+FETrxcWO2qRj122zAfVeXANnK8vhQdOydbliITydRjUshzFSyyisJLJFOvOMOgw=@vger.kernel.org
X-Gm-Message-State: AFuF++md5+L+tPayBG50pCSz7TApgHg9ISD4EkGrEZdLbn2gcjfOgWP1
	OMigGCbihQVKeZvocaaIaFpw3B70PfV6TBMUYZpQ13vvxt817GpUi53f
X-Gm-Gg: AYBFou15PjHj7c8hv8fUrLrdwf9W4UoDexyg2HXxckijgfu9wXK7oAWx+ilWH/KQVg9
	jqgdfbSgr7cws00H8+EPhuKP/AAO2/Wjtdw1O34lqubHPyZeNDP2Q11RB3LQJtcczuheX+I8gA2
	hv+/iGOD+tjiPVy/YESbm1LvoeMTDQi2BJuiMR2TvGqGC2nHhoCwKJ1COgsbiZZGN5cWsIXAaI9
	/quwkWad+YWo9lHaTcV3aPcirWyzZYzldTBih1uG7vYFkfvrT+pUWaM67+2Na/vShPqf1VG+Tl6
	/8lFTV6IkIB//bqGfR+vqhDcCkzQSBbK0HIzJCsUIxoGOEZuq4A8tA1LjRfsO5zZVdKqYnYLsCM
	VRm3EVPmdkrcnCQ6QbsQk1M0z1lItj5AMynuU0af5g1WqhbUYcbdxtmYYzZQt2I6yKxFbMEkraO
	7jxyNj0iEbjRt10TVgN2DYs897F1G7X2JRL4l16jcXERasZd3nnfUALdNtkAp2tKYL5gArQK2za
	/7sPaRQfpAA2g==
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr32153720a91.19.1788756748582;
        Sun, 06 Sep 2026 21:52:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 5/7] sparc: net: fix typo "evalute" in comment
Date: Mon,  7 Sep 2026 10:21:33 +0530
Message-ID: <20260907045135.13317-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "evalute" to "evaluate", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sparc/net/bpf_jit_asm_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/net/bpf_jit_asm_32.S b/arch/sparc/net/bpf_jit_asm_32.S
index a2e28e0464a3..81430f065ac9 100644
--- a/arch/sparc/net/bpf_jit_asm_32.S
+++ b/arch/sparc/net/bpf_jit_asm_32.S
@@ -195,7 +195,7 @@ bpf_error:
 	/* Make the JIT program return zero.  The JIT epilogue
 	 * stores away the original %o7 into r_saved_O7.  The
 	 * normal leaf function return is to use "retl" which
-	 * would evalute to "jmpl %o7 + 8, %g0" but we want to
+	 * would evaluate to "jmpl %o7 + 8, %g0" but we want to
 	 * use the saved value thus the sequence you see here.
 	 */
 	jmpl	r_saved_O7 + 8, %g0
