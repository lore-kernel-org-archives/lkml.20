Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F5736F433
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846589; cv=none; b=USh5xIZ3L1J8lZweAdfqGZlTptErfLnIs6eish3dO5WwlLM4y+zssS6wQxBfJ0IhnZoHOki1NuJ72bjG03m+agMnmomtfN9f5ftp60GGrsEY48e2giZQ0ZsZ15kGaTQIlqEzngwShJRfwcfsEjZW9VCpGUD7PvMwekloS6NcWv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846589; c=relaxed/simple;
	bh=UErhiAlzr8WjMoBRENwt/AEHPbueyU1pd5tdq23Ux3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQhAeyl/nKGcvGR+oQSonyqEvgg0nAReQVZyr/JzCmpsKY/Z8aNAMCo3I7zibUqoxMcLxncWknUi/1BMAcp1gNcnewdU7NkPn4C41FSr5Qg79uw1nzPs5KElM9yiF+1F/Y/Kjd6IaQ8wmza/jOQ3rmdrJWV7GBtW1dEwlOZB47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J15fXLeF; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J15fXLeF"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so3112045a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846587; x=1789451387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=J15fXLeFVUS1CUuUZ7W+Mo/WIXCmF+aELwslfsuCrGJDc2gTNfcReGITZmVVDPs0FC
         kENOlOT8Wcdp+QO54GuJ5ct1jStvpe1Q81hXPfzNrbaDbUTdB3qP0JZmqXTMFgKlO4c3
         bqUAcNqcxoh+qzZTeirh89hAY2kcskVCUKHEQC5YAMWM97uFXViXBXml8OMOrWmDrTSs
         ssA1MA1G7kCvlACsFipBdj7njMx5GCVh6AFDqiN+rxLDQ3/3Zrh2mha7byX+ob0E9bUS
         1B07FUic/kSkVgw0soVn8N2jESUEj4dZGtk7kfRx473P6+n9dzb2ybWd0wxBxEPOiavb
         y9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846587; x=1789451387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=FiriLsM8qhyq9ueBTKPUSVVVJGRN0GaSDxS7okDNCQL+GDRVszKWdu1qkuIkipS+Uk
         ZoERkWnUyzvxtFZOPcvnQOQ3l6KLAdMUqtrLKu7YMlr+kD3Df3fknnBsA05ZYn80oUdQ
         1MxWTX/2uo+sAR2BmuAlUoa5up0+kZpe8CqhoYVUJlDn6AVmU7XD6tH0k5aapdsefaM4
         TsXHHmmMu9w4OqWrEb8oBXcuS5fikoJa2ZA3s+O/Uz4LyyE2iPEumxnF5OOOpPW9ZGGr
         SxVGziPTharYocZuY0gHoNe1g+pwqCTksew1OdGl14GK1Hefkyltr8SIJGHVGKUWamIs
         Qh5g==
X-Forwarded-Encrypted: i=1; AKwUvByM6u/sm1VfpCSvDZfV7s2yr3UbzIV7cuNaMnW/v+bmAzF26bbkKs6WHsSmrhObY0jILl7khNCIinZyXVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nTOZqR7nvKpYb4sc4eWKqN/+Wg6YPJ6bu+KP6HcWoGF+setqO9
	6rmLiMRcwYU6cim11c7N2+05fT/6lXh4TfEtZmrr5JaPQyTiGnr7lyeL
X-Gm-Gg: AYBFou2TBSKtJ19gdhGjrLnkZMKD3ROjtUuWIH2o8/BKMRX/YA6lq1PU0w17iU/nQit
	vqw3/6JgRtH3yhcqqc/kwZRwDIN5w5mM5YyqPJUnVI5aw/ZLPPzsNpqPdNx4OWcRVV4Qfx2rkpI
	3wI+a6s49PLL+KfIXtW3RyOA1VyFspgi40Lreu/SjQG+0+zkS7bY9Wp/VWdRZSfa6iPxCrBjcsg
	w76tDDXf1EPhipyCEYczTgdl7vr6P/Inm5JtVWZiqrNVq/3d43U86t/gnvgqjRiouBAqWjZ4bi6
	g7o+Yk0Zsy1DaHl1DWMM1ToruPPkWrZzXea5kCV4vjXgpWFxx0e02CC9bYnL6xc+ST4wCUc3mBr
	Zhi7aGxOzMtBgW2/eOPXGJeupzWOyepDQoogjgekKktypA7e65w76vlLu/T6ED4sCbfppZkEcmZ
	zulOXn9ncwUJ2ruPQQ2gAC6peO9yU6Q0H8/PUncqXO1husK2arGYNiPJAzcIXYoLZju87ZoiGNU
	r5yL4aH5xFBPA==
X-Received: by 2002:a05:6a21:9204:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3da39b7183emr44883342637.5.1788846587447;
        Mon, 07 Sep 2026 22:49:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:47 -0700 (PDT)
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 5/7] sparc: net: fix typo "evalute" in comment
Date: Tue,  8 Sep 2026 11:18:51 +0530
Message-ID: <20260908054853.13820-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
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
-- 
2.48.1

