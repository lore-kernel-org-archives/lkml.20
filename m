Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243309;
	b=4N8X74xsj5NdfNGEfF7j7nw/lZWmcjf6W7Dd7K6i7TDtUuxhQzrCnfo98S0G+g2BkFza
	 RIg+Hy8JpY4Ba286fQogeukfm96uAtQ+QCGz+NbwxHeZ+mlcNzosa/cpWqrwmctAcIkiU
	 M7wk03F1BNjofQxsfLKruwyaOY/cSMufuREZJDaMGEvRZb12kzHOrOtTu1O61cCoLrv46
	 XndxYq/GXiyIp49KD3Adb25XERnTcpIB+y5O6WKdbfNipnB6m4lscmRCeyolR/C2inZ5o
	 XA5REVei9XxoR7XlIEx5ENoARij4VOVqmXzfbIEkYM62dgV/jFGabJrWJSZVJdE4cFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=glLlGfgYJChD8Lffm3hFkjvGlOWchXmtpUUAyQ5pkCg=;
	b=xryj6QhxURMZSuEV9SGwYGqLN3dcoLDsLjiRsOSwXHiMQZq+K4w1j/cizPJ1tDkjtiZy
	 Ax87FxOsk09ubDAqbFd2IkJcbGwzBMrJZJ7wr4tfhFZjH6HjTHwpPLeAy+taQidw84chd
	 +S9A11vEqKMproO5d5kpF8cnOeeIdFsIP73qi07fcOzRIqoubvPeNEbKtQjaZEe+MjoPi
	 lD5N5UVegVB6rVvvI4YvWz6O0EoJaOD+3Duip26d92vv4B1jfmzuqZ1pnX/t6xZoKXKfS
	 0SYP2ERTmvyVI807KMa8CHFmjLliRUJl8NLXiWu8pXZYzHcDjPViTJHcEcyUuWSu9KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X00UxUbw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5EB606B6A1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE5EB606B6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X00UxUbw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490a0e72588so610363f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243307; x=1794848107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glLlGfgYJChD8Lffm3hFkjvGlOWchXmtpUUAyQ5pkCg=;
        b=X00UxUbw+i45A+METVu7qbNmn99LG09FQ1uycXpRq4gPRPcAwguyi15Guwikis9GNL
         FCb8U88s9CQOrRoqzTr569hCuMWqWQBZbFlkLUdQhxNwkFhTyy8w21aHG69C2IsEGx4w
         LpVQCt14mfYoapuJ9dc8gWyNojMKMQb7U6/7Jq6jmOKhBuckQZi/ek3iC6E2Lgvpx5Jf
         Uh2mQHMA8sHQFGD9O4rJpiXwZ/LLIzoJCUv2aGDB68A/IM1TJQwvs2q98ZdegPe4X87g
         tTGdz8euQK8eFfoyKHwqI2nlkb0Qou1qa0pRNjtLs4LCZ6ZrFkvDQn+5/oHog3X23rPB
         WMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243307; x=1794848107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glLlGfgYJChD8Lffm3hFkjvGlOWchXmtpUUAyQ5pkCg=;
        b=YT6T5uD2C0VfR5j/86ussC9I3OU3sfDkYW5zpxR71/cHwQ4mrlvNArH4LxijBJqlHV
         W2ClRS+sQpsqpqXToUyJdG94vG+G3KO04s3M8a1kPu5fXlZQHTARhB8feEVGusl9Xvsa
         x+6hucyWoErLykyfz2apA6ttpYZ75M38XqjEvujbfQtcGmR99MIaMyHwcBncePLH9CUN
         sbyoWNusLqWI3Wy4JBQCkCFlYsO1CQ0eNHe04/yU42m2mf/j5FlqwvgWgUnDTkoO+5gJ
         N3xZisYDq8p21X72XcGNo3Tc49uyZENaW+1mj17Vvju9vmXoslrjndispa0SRALM2rRi
         fvWg==
X-Forwarded-Encrypted: i=1; AL+hErFZ7craX+NWLcJ9uqxHqewsqKCs0ssUIeI0JaD7FmESO56vKGhHZ5TmpcMpY1V5M81jRyqjJSg8uoWJKMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wwl8hlP2Eb1UIR9RKe38i62GFxDMrx836Y8y79AjxZ66w902M
	Rkujs6+39NlypIr5/sqSzeIU21pCXtlR8QQ3qaxYv/CI+spUXzrTdjuc
X-Gm-Gg: AYBFou0zy8ZQt0TmNxxJEBsADk0CphesbAqCbktNN4eZ6ApXhXHHR/lDFAGu1ndOVxr
	/zdadcBOZq7ns9B42GxOprN9zltiOC2/IeZkuhmXy6A5D6C1YXwOaiPlNAiJd1q1vuCttuu1z1d
	c7vTHk2AZ0v/jG/McfNyhZvr+MCcGl0kSaX5pprfwZCgaZtwkok3jJL7cwB9WGbQs39XRql592N
	oPYtvXTFgRIa2ltXvdNcl822jtJruab5hcxiUFn0U/cb1iuxsIAEh+1PzV33MIVQ/tQ0Q+EMMwi
	xHQs166O2Zw8AZvsM8mxP3h/uwwuR3dV4j4TRTUIbUyUWdYw9hWSxZHHCaM6+RJww0gQ3cPWEKW
	ONWYt+rd0nnnDo9htLAi+ecgW+a2RQB33h4HrFFA58XCNDv4LLAko52l6/p8bTKuRb34BKiVCrY
	lkpuvpK7AeGV/hJWpu5JUNkVr/PniOEpSnf/BB9tP8PzcE9HEPU4LX4S9kdLOU9JMLENGHWNKay
	jCu871SJoahHoDA5ltAj3FVvuRCcWcfpjl90HjbwP/yGnq75IcJpp8qY+/YzC+Xsk+dlyOE5tJ/
	1U7o8zi84Ye/uA/TQp9NJ1Rk7MH9qBJggPpZFPslJ7UslpMtAnw7uz4gQEqOP5erCheU
X-Received: by 2002:a5d:5d87:0:b0:497:bd30:8df5 with SMTP id ffacd0b85a97d-4982b28ab00mr190380f8f.2.1794243307284;
        Mon, 09 Nov 2026 08:55:07 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:06 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v2 bpf-next 14/18] bpf: Require the JIT for fmod_ret programs on found 64-bit targets
Date: Mon,  9 Nov 2026 17:05:34 +0000
Message-ID: <20261109170550.141443-15-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

The interpreter returns only the low 32 bits of the return value of a
program, while the trampoline passes all 64 bits to the caller of the
function. If an fmod_ret program on a found target which returns long
is interpreted, then a valid return value like -14 reaches the caller
as 4294967282. This value is not 0, so the function is skipped, and it
is not an error either.

Require the JIT for such programs, as for other features which the
interpreter does not support. The caller of a function which returns int
reads only the low 32 bits, so nothing changes for it.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 kernel/bpf/verifier.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index f3476b12c58a..5045d9fa68b9 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -23875,6 +23875,9 @@ static int fmodret_retval_init(struct bpf_verifier_env *env, u32 btf_id,
 
 	aux->fmodret_retvals = retvals;
 	aux->fmodret_retval_cnt = cnt;
+	/* The interpreter returns only 32 bits */
+	if (size == 8)
+		env->prog->jit_required = 1;
 	return 0;
 
 invalid:
-- 
2.43.0

