Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617467;
	b=BbEYH1YG2CS8RfSURVvaaBgYERE+F/MjehA2uIE7rh35A8AyRQ5vtUwlbt3ha87JJd1R
	 PZ1J6VrhySaWDYi7LNVGlRMbXw16kJwu0IW+30TeiZ5qTH/HE6qyaHdSPjV8UCJYP0g/4
	 3JY3AUKVbaelEBgRCJ883BG3XsCKZryUYR5qUmAhFHwrKwELBxJHsaOmJhcKU7kxIa11t
	 HUpmqzrTWW79yIcttiDne75sfpjDy/GIY6k7lo0w7DGTJD8bLJw1E6npBL/4iYo3zeyvC
	 xG+9GA0uBAEHgEkOqgca5m1YPfY+8h0FwlbbqpsURRYgzP2yT5UA6NsoPhU/PyqI5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rJsY6b2nntJPFyyqmGHLXQf3FyUG7wGWKhINtdlYFFk=;
	b=YPLjXsqUYqD6IPYGM+H8zTncAqYj4jLYrnieZLrJ3VHdkcjnXK1gLilH0Ba3qlb4LIQQ
	 NbOhYv+tZH6FCdSJdtsiOrVqN0cSad/8nwHRT8rf8pJ5/okYTa0l6NJ9KoPN+nko45cOW
	 WUamQMM4hrIzGkn0NQKQCb9Ld7y28pc0/XhxYHsFtGchMuCuoF0L58o6V7rrUJipu74I6
	 ZfGasiKQ95s/6MEjULjQLtgzqBDmbd6qqtHyn8D6gw6fwTGVmanBcWgJLM7NnLlFjIwge
	 91ttdrYDgNPQl0qSTN++myV3blLIa+xQ5qJ9OOQVgEcFm6VJEJJCYMPFjhZgCWWK3Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=js83rahe;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125A606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3125A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=js83rahe
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-366c279b454so2268875eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792617466; x=1793222266; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJsY6b2nntJPFyyqmGHLXQf3FyUG7wGWKhINtdlYFFk=;
        b=js83raheQ47fzQfPahCeYTtIg+wenLpUkgpQSNs7sEhbvC7++0B15Azd03ey8qXDQN
         qT0kDPRAoZhlYIxMURs/sH3vleJg470I9TMunf/9+cjg5B2xlJjzGpZwBQvb63VFfb7g
         SeSyOHTrnhTEZRSxG6PE36R6swH16Ne6b/8UBvPUYqmXyjKRC3jrjIHqpnQ7aNR3c3yf
         rW/TACuDV/5X6avrO1/4lfdb4DP5aaL+uGGlPm8MN2YDt+stggHqKk646Z/pGKrButRy
         VqAKFHvLfwpF3Ldy1cDwntNYtZgW2tqaS86P9WSDINuApevGNa8LhrOiS/yy13EXXquR
         gtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617466; x=1793222266;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJsY6b2nntJPFyyqmGHLXQf3FyUG7wGWKhINtdlYFFk=;
        b=Y4RMh20F17fhKJFPDTmAb9yZsJjev4uWkLG/yjcK/GmXFDOZPPg7We/5CbDstr9X3N
         f8/L54lKtWjA51yomOUkaBjD+Hr1T/c6c/5y2A7/q6iGxUbSnPpzJ7mqll6Mtjn3RaLx
         cXt/GcB/+2E8g0ze+0+c0W/9XAE4rztwhMCUh6cPbSUjWcfNhoXTBJX5rs+isOCB8Tqx
         Hiz0IGwWwrMUvD+eCaloagO4YrKxxaLTWe6RfDfxwWZPOvWikjR1Wn0BfSSaXD4LGciU
         CkuPdHA9Pr5pVyX6GCPAR4uMxZf9nLQ4v9EadpefrjIm1HMKIg9aZcijRwmCrLJXn6jn
         IAmw==
X-Forwarded-Encrypted: i=1; AKwUvBxSfjTbg9K20eskkv3j7nnq5HpNEX8t3sYTHcpSRP/my7rElbqSwxltZswvLJCohSZynEnlKs4Jw43H8WY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYfDhvEhtzNi/DHfQzoxK2uZWHwB4XNpzuIYN9VNp55Rgbb+9A
	qt3BVRZJ67sv83WRXPmI0YYSwxnp3ZeGh9iMnnHfXTJ1HsevZMEO4xVoFiYlnbnkaCoi5G9cuwo
	uaCzHdN9hiw==
X-Received: from dybvc23.prod.google.com ([2002:a05:7301:5157:b0:360:d3a8:ed70])
 (user=gthelen job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:619c:10b0:366:fbdb:2070
 with SMTP id 5a478bee46e88-3674d7574femr4601802eec.34.1792617465990; Wed, 21
 Oct 2026 14:17:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:17:44 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021211744.4047370-1-gthelen@google.com>
Subject: [PATCH] selftests/x86/ioperm: exit non-zero on child error
From: Greg Thelen <gthelen@google.com>
To: Shuah Khan <shuah@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

ioperm.c increments the file-scope nerrs counter when the forked child
dies or exits with a non-zero status, but main() unconditionally returns
0 at the end without inspecting nerrs. In addition to masking child test
failures, this triggers a Clang 23 warning:

  ioperm.c:25:12: error: variable 'nerrs' set but not used
  [-Werror,-Wunused-but-set-global]

Return 'nerrs ? 1 : 0' from main(), matching other x86 selftests such as
iopl.c and ldt_gdt.c.

Fixes: 0eb1d0fa6a68 ("selftests/x86: Add a basic selftest for ioperm")
Signed-off-by: Greg Thelen <gthelen@google.com>
---
 tools/testing/selftests/x86/ioperm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/x86/ioperm.c b/tools/testing/selftests/x86/ioperm.c
index 69d5fb7050c2..6c36e316de95 100644
--- a/tools/testing/selftests/x86/ioperm.c
+++ b/tools/testing/selftests/x86/ioperm.c
@@ -144,7 +144,7 @@ int main(void)
 	printf("\tDrop privileges\n");
 	if (setresuid(1, 1, 1) != 0) {
 		printf("[WARN]\tDropping privileges failed\n");
-		return 0;
+		return nerrs ? 1 : 0;
 	}
 
 	printf("[RUN]\tdisable 0x80\n");
@@ -160,5 +160,5 @@ int main(void)
 		return 1;
 	}
 	printf("[OK]\tit failed\n");
-	return 0;
+	return nerrs ? 1 : 0;
 }
-- 
2.56.0.218.g1ec904b173-goog

