Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723647;
	b=Kt2G6HfBAC6FiDncsrvro8HZigKZvtONrqDRB07Hsvu3KAlSlChX4V52E3MZxwH9Gd14
	 sU1n9j/XJ36giW2E1qCWTctMI8ayV8anfQbc80pPDvW0fg+NbgxdL0LdGJnQlJmqBqczY
	 sCrxPEvSaSgewIngkHhffGTmSCNwgsYftge/PIRlQabwrA2PSfrRJS0jSwoJbBTFmgQ36
	 lYFUPDZVy1vB0j/Yjww6NP8dkbYpxZkeki1c6a6AKAk/1uCnd6wgYLZtOUAqtHPUaoivQ
	 jHEdvtNq6tveiTSgOY4mBs1NiYn8NPcig1bqkRigWF/nJsMUiXA9D+uVqAmhUC6xidg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6qaLtvzC6UICSfOes+skEdzD7NBdy8kYVosT81ZxCIc=;
	b=BoZVSYAzp2FRxuvfTVX7BzBsWjpv+OtHkTcr1a9lAWOguMnDAgM98HX/n1XfWTR8nr9q
	 7pG1ier3Hqu7w+cSoSs9e8Xn8Y3TqrO5RECybKlJqle+KWVHmyk+fCbsqWmdSMdX0yMO/
	 eoK9qnuL66I0pX6nW/d/6Z2h0f14oWkDKuuTuQulmiLw5NnyIKvqIgCpia2epyG8/pF09
	 IlW6HRCz8x+YOvelFFyhgfZnUmf+/B5678xmhqeNLciity+4Qnsx5gq2F6IMA6LqHJ53U
	 Wa6hzB4UrpnpgYDBECh7W6ntPa/9wmH/0f7m5YzPTfghXZnu7FtT2Cz1SPpKFWHkmpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aK0ONcxg;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A53606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aK0ONcxg
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2558448a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723646; x=1794328446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qaLtvzC6UICSfOes+skEdzD7NBdy8kYVosT81ZxCIc=;
        b=aK0ONcxg3HDfWKnBeaFc8HG/CJe96O7oWEbiemsnNzIt/w8P1AtCT3IvWCUT5Q2etU
         fxTYYMjwSKZBEXXy1clQDuMHtZQNzGKyModiWoP0ktD9JESxNXYfTa82QLxncAGaMiUh
         UGS126Gqa5qtNDhJ7Uxvl/pyWACcNd54hAP2679Iift4qmfuIEYM3u12Lk0mPObmU7Se
         toEPWdm/UDYO1M6nhu0vZScVdmKAI0ij55m+nM/7SdKSqPc0lO8gz/XMxQfBTTjpKChz
         1RkSuOvwddcgSX1ebvH180mRVf5Mp1ZAxGpb86sJe3s/9aqnqwWK7Q1Mqxt5/5pME80Q
         ANHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723646; x=1794328446;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qaLtvzC6UICSfOes+skEdzD7NBdy8kYVosT81ZxCIc=;
        b=yBzQsNvmpLnmMG5k46yHobFicYSA3f5UEHwZCB8mJMqf6IVV+/ZmswCUO1E6RIrR3V
         crAaoPwuSKwbnqXyISx9BHMq8dLy8I1xfJyhP6jFSc9zaxMBO1YCW4XNrymECWAxH7OL
         9mUU71KuTQMOFoavOydjZ/iDjiuJwV1SXNjm3Va5qL6Vyx15wICSCPfWxigvNmIzvGAh
         ESsZSiU7ZQpmkvbIbq4oP9UzaipmBBjARHivKzMZx0tTWeYKhQwV/ybBiRZ6/Hv5mNxE
         4SqG+vu9eqf/qjc8LMTBHY9w7PJae36QpS0KdGZUf7kBIZsxFCkkktxo9dl91g5YiZ2B
         3ucQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3O9GYjsnKqEhZtiAmZEvEYxMk8/aH/VrXB9n9iYIxuvn7YDxz0TYh1bpltGF1KAfuCo2Xr9uLkVfaBsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PXaozJTre7mBHsMOawT6j2UdtKVnHDfpchd8wqaJd6E/RqnKx
	Y6DiWpo/DuFQf+erEu1Ty3k9S1Vafjc4J5lRLuuJfO/l1kvQ/n6GxHI6e3sv9bB3EvcTb0co1gs
	zV98ATFzKBaBup9rkZRSYivxlEQ==
X-Received: from pgu28.prod.google.com ([2002:a63:145c:0:b0:cdb:1c92:d2df])
 (user=rosaliefang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f84:b0:3e0:c346:734c with SMTP id adf61e73a8af0-3e929042a8dmr9818206637.89.1793723646036;
 Tue, 03 Nov 2026 08:34:06 -0800 (PST)
Date: Tue,  3 Nov 2026 16:34:04 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103163404.159582-1-rosaliefang@google.com>
Subject: [PATCH] lib/base64: fix -Wconstant-conversion warning in INIT_1()
From: Rosalie Fang <rosaliefang@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>
Cc: David Laight <david.laight.linux@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Greg Thelen <gthelen@google.com>, Yi Zhu <chuyee@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rosalie Fang <rosaliefang@google.com>
Content-Type: text/plain; charset="UTF-8"

When expanding BASE64_REV_INIT() for v in 0x7c..0x7f (124..127), the
unselected ternary branch (v) - '0' + 52 evaluates to 128..131, which
exceeds SCHAR_MAX (127). Recent Clang versions diagnose implicit integer
constant conversions in unevaluated ternary arms when initializing the
s8 lookup tables:

  lib/base64.c:58:18: error: implicit conversion from 'int' to 's8'
  (aka 'signed char') changes value from 131 to -125
  [-Werror,-Wconstant-conversion]
     58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
  lib/base64.c:34:42: note: expanded from macro 'INIT_1'
     34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
        |                                              ~~~~~~~~~~^~~~

Explicitly cast the digit-branch expression to s8 to silence the
warning.

Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
Assisted-by: LLM
Signed-off-by: Rosalie Fang <rosaliefang@google.com>
---
 lib/base64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/base64.c b/lib/base64.c
index 325c7332b049..1489c048b1fd 100644
--- a/lib/base64.c
+++ b/lib/base64.c
@@ -31,7 +31,7 @@ static const char base64_tables[][65] = {
 #define INIT_1(v, ch_62, ch_63) \
 	[v] = (v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
 		: (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
-		: (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
+		: (v) >= '0' && (v) <= '9' ? (s8)((v) - '0' + 52) \
 		: (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1
 
 /*
-- 
2.56.0.385.gac671c819a-goog

