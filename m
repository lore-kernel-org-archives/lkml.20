Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998338;
	b=C871fcCAZIfi7A46zSsh9KeKivHCDs1QC6DZdf8MvHo4UxjW1oT/tNLyLUeQCxMWyr+M
	 Ks9kan6tZEJvx2/gPzaxH463DUcO9WYvFzHbRIjSM7snrI/BFksNNC4+NaBF6JKpCLaYF
	 2Lkqtiudlg07nDDaRFQEaGSVi996pzY/FGQHt08qis0Q8ba4laMorxOFizr7tFMRDs/Pk
	 DWHKwZ2FBU77igPq/0IFQsNLaCLq1RpQzn9NpKkIGGRcNef4GDd8/N034nVuwvn4ww4PN
	 6YkLqCoCp+2kkUKftSpT5LazJIFj2einPBvz//5Z1npRLl/z0hnSefLS//k1DP7x9iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vv1IExS2I935n9pBlgYspHhjFGtUkBZ9r8CEJg3UIms=;
	b=F8/x/bFnJGGe4spHhDazorB8HhuP82fbhw9U/dbgRvYnwlmkd28lqmSZ61dMxMT5QYEb
	 0AGynUP5Ow6thZXwuXZFVeTx1ImBUNWHgIk4QSv0XsPvcAuasuL07eZH48tkd3IUSYbMh
	 UFGPqSWZBjjMiN5y5O0uekBMrcJP/9S8sh9chrLnyX0aPPSfSjKDIDUTn+pxpdsPSm14K
	 +XkSGcZquzaDMyYVaM39x67NUhHX2cggfV3/llSFkJMObU7b/ZKZCSkKkmxRYSv5xph3a
	 VmPoGPSY7CwksBynCoS407jIMORvck+Ond+lPrVZzlaUVLeqxyic+As+26MwNthfouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgUIY9+B;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE676082BC5
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE676082BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgUIY9+B
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so211715e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998336; x=1794603136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vv1IExS2I935n9pBlgYspHhjFGtUkBZ9r8CEJg3UIms=;
        b=fgUIY9+B5lAK57Op/dDKd1d7PVapAOA9K2gT2X5qVUVOEWAuXLXE5vsCiVVuroFUs+
         d27F7fic9fg9HuB3kdy/dyCTUuUfB4N7+03mLGO6LVTU2uSE1zoBdGBamxedYvCPGmbc
         GTNeUqYnorfV2x6AqlFAX//dcg6+fnkARXptcSxaKgxVARtQ7Ejl06y4AuemZOcQSyH1
         zETBgn4HpjH0ck3mRMYaMhOKkVF6ce3LHXh6IMTCv8WRwGqTqDQvyP62DMnniwYzlN3N
         kcyudc9A0BeSgGDeg9mbawPfJ0S8xohAQgG3m/pVRZTJ/M2+8k3qeIxpGhd+EKf+Lnow
         iWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998336; x=1794603136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vv1IExS2I935n9pBlgYspHhjFGtUkBZ9r8CEJg3UIms=;
        b=rxfwlOrfVKBMKD8Bj3qw/lkdu8U6zvg33TJDaerS45Nhf65czAY1gTDg7LripbVZFW
         hijTT6la3uF8nZGW9SwDFSy7leW9GXXP+GdKIkA1Z+KJDMLSSM/LJyilomMQMlSDwgSO
         mbM7rr4b8icQB9Polr3vnhcD4/e+onugEADaJHV9/Wa7II2vWPevqnGlWXyQGysUsIj3
         l29OKPYW02Iv3eoP3JrAO7ap6KTFT4/7Gabh8KjWvXBaSkENYxiNhZg7PuUDyZiMZsnI
         WLTVuoVYj4U0fqIywgk5dN4k3m7S4TXun/kP+x9GNlstC710ROF7D4TPQhiS9Cj0ayez
         5ASA==
X-Forwarded-Encrypted: i=1; AKwUvBzipEwVXv4qHNzazh99EjnGJQ1ySK2AdXkTnphBtqhhfTqBkuLOVkjED9ISVws0Ei+O5pvp/Xx5rw0K8mc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yk3BIzvsgEjv7UXSU1BWCT8EUejg+L/00eDnEulHwMTJamn9t
	sbTASQVM7VIsWXTHrCbaY81zqsZHxBxAv+mX13x7JgUOPEusscDwY5Cs
X-Gm-Gg: AYBFou1Zm+j8PUJbK9B0SrG1xT5ZK0O7W9XUsMf0tbYBgpjZT7CrsmhD1o6wiAHpRJQ
	1JJi6Y4hlTg8KHuzJhutlrWaTqGYX0OBPuiftLvgd9y4FLGRfGKbQz5wF6zwqoPMjui40Tqe3dA
	UOmP0uBRNIxh1qNBBlFFs/wdERvJvl4BemC4E6zwEmQ8haljq8omRqC7ck9/nKe1ZMEnCoMUmKi
	CUD4dzFAVXUfhJhC5AhePz8ENGbb+aF4tjNrYwLeLypJddXX5S/0L1Y7qtUYc779ztejKH17EeJ
	3Cc0vJakV/T9MFm2WHL0Ad78KXgiRYDrb5UMMOab6ptl36h3rPrAm79725Xh6G69p4ny1KPuNX6
	zoD1C+a+B/AvOGYH5Lgk1CK73jDOUbusATXdg4zPRW3rzFCglqypm74WBKD5U0t8HOPxtK6T/xb
	WgQIJuwtbXT8Msly2+vT1r37YbspnWkNHeqMVQw2iNKX2uMxWNRuyy6fTa9w/DI/DQmg9xmRNKs
	GAn6NP1VuEGTlIE8l4rD0BYqm5cflf3VtuopZedGjL/whcDzsO8cRTCVSDcJ3Vpowzpdjd7cPRg
	A1He7IMo3u93ZWdlvBvZsnfW1qnAep0ap/s/PT+J06l4878=
X-Received: by 2002:a05:600c:8b8c:b0:4b2:4b5e:8141 with SMTP id 5b1f17b1804b1-4b8190faf23mr2512415e9.9.1793998336255;
        Fri, 06 Nov 2026 12:52:16 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:15 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 14/18] bpf: Require the JIT for fmod_ret programs on found 64-bit targets
Date: Fri,  6 Nov 2026 21:03:03 +0000
Message-ID: <20261106210314.1767267-14-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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
index a9da29a11963..0448a33085fb 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -22996,6 +22996,9 @@ static int fmodret_retval_init(struct bpf_verifier_env *env, u32 btf_id,
 
 	aux->fmodret_retvals = retvals;
 	aux->fmodret_retval_cnt = cnt;
+	/* The interpreter returns only 32 bits */
+	if (size == 8)
+		env->prog->jit_required = 1;
 	return 0;
 
 invalid:
-- 
2.43.0

