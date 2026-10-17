Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D83A7F4D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261545; cv=none; b=eI6dOwaoZIwlCC3KkqZJhRyA/Ho/Cybt9uyF+1j1flhthPfPCL5GjeibhMmzDR8bU5LcFoE+cQ5cQUy1ttuXBNtHVJhe7Whc7HqosbJWTwj7EvIZ4gcya20RpgwnhqzbY4WHN7Gh/4VVa562WEuBBmqKlwVmB+O1i/yxkE173Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261545; c=relaxed/simple;
	bh=t94hsbrtkFucbaGDylnmE2KXa81VKRPfOEo7S50teV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gv0qhUDI+s8IXP3xrNKte8Z4t2mRpk+ZF72igN4w2jAox06xGFvEqu7+QP8/MkEgIrmlsxFjbmTItyEQCJ1yqxWyPkiFPeCDv23wrX+vp6Gs2cDlvHMvWvL9zzDifHvRa+uO92/9rZKQ7ysDdLujHJYCRmS70fNE1l1Hnc4cQ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2W/TEFa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2W/TEFa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e977109392so3508315ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261544; x=1792866344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e9nJ9wUb+VNUHZnaOg0k/Urr8dN7s/5sJvd32soOTw=;
        b=A2W/TEFaDcNkNh6Agn+ggZ7P6GW/BOrVBsy1zxMpzoo+feDiFgk9TjBtVTATUfRcv3
         R449u5723gkIKazJU7JsAiKoVeCQdROWimUy2RUWwj78n+cnbSnN4re8EhBPEca16sGp
         o6IE1WgmOqFxMAIMc0p8R1sA8UUPA0KXEeqdu8mgu5o8JtPxo/5yDBp0ICaBQ80RZpOy
         m2rKz0ur1NpZ+0/KKQ6cfqWalaExY6q4AGFifgHKlYB2JFJ+Ei1X44HNjQ1dV+UTlSoc
         OCJmRx9FkZFJwzvXjLVK9VTHBnIRPgdbO5Gyxcho25SAv1CFw3JdQp79AgyOVHGOMa+P
         Vy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261544; x=1792866344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e9nJ9wUb+VNUHZnaOg0k/Urr8dN7s/5sJvd32soOTw=;
        b=OOAilGXiL6iJOvZDOMJVQo1C1cL/HhW93arHfrRDvEVgcOrGS3rm4D3Pu3b3F0ape4
         Qd/sEo7JuBdlTLqmgYLzC2hqTiSbrG+QyBswUWK7uW6v0K/DLXkF8iF7zY0i8VD12/rb
         S8XOxOICGFtVaKjXosJdMKfdvgpIFUHc7fQgZxfofFYuIMqsRhiURGtAn1W1gzHJMBeq
         D4zw27DB+2i/+EGodiODfjc/FUHVGZXWH3T5wxa1j9egiJG6onMIUgIN0X7HQaLzjPf0
         Qu8La8dEkKQ+/+W9okDhTmkZjRBhtkzUYyE9hPgDzoX8Jit+NJzKLDC+QaYj/VOInoC+
         zutA==
X-Forwarded-Encrypted: i=1; AKwUvBwaVMB2p6oGcWMcr/tB4UKmUdmZsN3TG8RKAhiiMCEUIPxPeNccpPVTNzzWRflfqd2ZrT8GtZ0t01KKLtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaNsgnCyg2WUNGIxOfbdsSpf1KSYGucSCmnwdYoQT7aXTj1Hip
	/QYBaWx1sEy73AoGNfnBDGzePj6CCBnbbRoeZem25gbt4/laLVXo39yH
X-Gm-Gg: AYBFou0u/tqpcL02Ic4iS6wTD0+XWzJSTR3SIKhSxyUxSQIQ1UIpk3xpZnuIO0l1UbE
	QKv9c4DxpbY6aMPP2Z54Bm1QPXLKt7CEGVD5Fx4fOt8mPurOY280EHRwsM/WvMezQKTpDWFRCmp
	UgU25bS4g4WszFj//G3yCNUwhCwCJW72TK9ao5n9YcMf2y0yKG34YXoHM8j+8q1uiucXG4tgwls
	/avfkjaCzbJp33Po0nPz1voIcrIcHVAjrdFYQBhWv3AaSLs/yJwgjQ78konR24/Xanszk1ENwd2
	xbzkcxIDnevkAiQc3w2eOvbYjLWq1C2DUUVzoC3mj+JomxPvTZUooMZYGptWFqmyRXqJS7YnJjR
	0+9Il5Q8DneabIm9NCLnQ8eVNLkcmkmIBRiICBtq65ApQEZDRGlLwKkzDQ1i64KXR2XO1COk4Lg
	Iw7ztiC2/vgZtviCyTV1ffN54DwR+h2PEOW/U/Rc84DdFGFIfh2gUXA37tTVGMndRAP+HP3hWMu
	OUtnl7SqTvfgMPZUOIbN7pnBZ5+Ll43RK2Q6ShW+5iR4WpLEzJ24SZm6F9Z6yK7M34xTtH/DgEH
	bw==
X-Received: by 2002:a17:90b:17d1:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3acef5ea843mr3055404a91.63.1792261543994;
        Sat, 17 Oct 2026 11:25:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:43 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 1/2] kselftest/arm64: Report test failures in vec-syscfg's exit status
Date: Sat, 17 Oct 2026 12:24:53 -0600
Message-ID: <20261017182455.1884-2-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20261017182455.1884-1-aamsdoumani@gmail.com>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

vec-syscfg ends with ksft_exit_pass() whatever its tests reported, so it
exits 0 even when tests fail. The kselftest runner decides whether a
program passed from its exit status, so failures in vec-syscfg are only
visible in its TAP output and the run as a whole is reported as passing.

Use ksft_finished() so the exit status reflects the results. Unsupported
vector types are reported as skips, which ksft_finished() treats as
passing, so systems without SVE or SME are unaffected.

Fixes: 95cf3f23877b ("kselftest/arm64: Add tests for SVE vector configuration")
Assisted-by: LLM
Signed-off-by: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
---
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/vec-syscfg.c b/tools/testing/selftests/arm64/fp/vec-syscfg.c
index 8dd932f..2c8ccbe 100644
--- a/tools/testing/selftests/arm64/fp/vec-syscfg.c
+++ b/tools/testing/selftests/arm64/fp/vec-syscfg.c
@@ -792,5 +792,5 @@ int main(void)
 			ksft_test_result_skip("%s\n", all_types_tests[i].name);
 	}
 
-	ksft_exit_pass();
+	ksft_finished();
 }
-- 
2.49.0.windows.1

