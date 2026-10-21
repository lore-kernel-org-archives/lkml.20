Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550587;
	b=h9HJKdzmv1bI20vH1z6hqWVCTwPCpwrOUo1oZPCTdiozbeekzwKf98qxy10grjPh/U1I
	 5WQCfFbX+52KJ8ECC3k1GXGz0oVZSK5ndKRumj2mK/yRuoQJ33nO/FOfuJSddnrogh3Rh
	 /syeXusCJ+NV5TusO4fFvtaCM12RHTzIUjSYKn9ynytdmNQilK4iDtbiJoJ2fPkzEHrF0
	 0VcNdbTXD9rlmIBsKVF+p+V8zj5FLezKmpvQTOtjsesPlYb3ULA4LlOrJqDGVZ7WoPr6R
	 N6UxL1iW8OtNHfs76bvH5szkg9GcpXpA2vV3e7tHSfjcL/Mf2TzuJd4+Do2wuMfRzMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a7YBuhT5Z1iUOeQz6f7j9faCl7gkobBSFAHTtt1TvOg=;
	b=zgRqW1id07zIHUAOS5B/y0jJB55sabDPpOBNbqbDPnvzwfBdBq1neLbbc14Rojt8SUJ0
	 Yg7TStg0SgHQEC1cejEMNq0UGY8y4jAyeR68YjS4mfhz+P9b3aBi4zLRGIBrNwFHNm64P
	 BphIzgWMdbQOiV1jzOuY0RFSZ8ub2wacX9xZjGy24uCSBRsf+Ne90rTlUz6bvhQg/Nm7w
	 k/5ERLBJSJ+Pi9aVy9G9EAHB5a5a92sVWYiAATuYfvWtxCd58GmvKvdyfi+UP1QgmrJpU
	 Tj4lGEkXnPDxbfvNBbWHmS85BwP9zY10o43zmbVeXQS/3sD91n9p/2PyyRC+6EDF6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="KvrqfJX/";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1560A2615
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A1560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KvrqfJX/
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so347020c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550586; x=1793155386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7YBuhT5Z1iUOeQz6f7j9faCl7gkobBSFAHTtt1TvOg=;
        b=KvrqfJX/sF2Cbkpx9LIk+m7Vp5uQeIYPSDEoWSaBuFvPuzog2ZYazwNEI4OOFPzztw
         Y0v5chwMIpdkod+U7K4Y118sz55q0uDUefShxrTirtwCXV2wPFYxMtwmK+Y/DrVPhC+H
         WW1szNHbXBfNGZe+BdJQzWYa82rKM6g02KWX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550586; x=1793155386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7YBuhT5Z1iUOeQz6f7j9faCl7gkobBSFAHTtt1TvOg=;
        b=rC5n7/9L+aI/8v2cknYT3Kul+ZBPbur7hMHjI1IJUbDdNI4Jx7hlo+MHsHaXupgbR4
         /krHjJkZ0tN83dQxZLmdAnOOMFzzidyKqjDI01Tqk+K2ipwFnomjb0wRlQGHJv747JJk
         jfd0Cst4S4l94F1QOkT5ckaDhZgT+qOIhVeH2xQvqwk15fFJqbKZab6gAT2Rq2UffIb7
         Ll88hkqt8ZcRU0z9+dsgZtENJRWo2aBjnofYeNCis5/mlTTK7dDgmYIORVD+A2AOsw2S
         lKqDX9GmLezuP/gYBtvPW2cj3qr/tweSotQn8gZuW6ru9Qjrw0DAErNrdkKudDgB/P/1
         82fg==
X-Forwarded-Encrypted: i=1; AKwUvBxujIeMoM5bFOr2PuoC+1OPghG8KyvI6gEkd43NqN5BEkvVOgTBbkinA9mOm0vtH17+1IDsFSe2z3vwnUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBClieOnoholaubwQHaxbfGBPozzSe1We0sP+Uaupr/BeaxuSF
	7j7C7zqzWd/2Zb+sYIlbn0xMJ/ZY/dwJ6QWTgIbQMLzYu7X3HASXUxh8VDswM4CHAw==
X-Gm-Gg: AYBFou2w7oEV88YOL+8EydZENuICzrx577RLQV6DeXLGLE1p6Q0w5LTRHvFHxdgARD4
	RG6FIo+ysIU9xQNkTyagwhSMROj1bh6b9ce2De6lmDh4b52wb6liXmRZbM5Lc0qMABUE5/4jJAs
	Dzoke+H6L7v1FCy1uk1Cq35iXjj2jJNlaXKL00zKMsHHVJZ4Y6LScaU9lnGDztV3oZcPoeNdMjC
	xEWXCji+enQtGRMfeVduCZ2Ibo4W5dTteQ69gMHyyEVylDhcV9Swd9VpZcNm/MraagKbMDwYq93
	r3wLkzKXcFB2agfTjRRUi+bt3eFvpI6g3I/kHZEIEY8eph9q/tE/gr3rHmys4sG88krPk/vrctg
	URlUK9EsU82uShs1C9cMkO5L3wqa99uw6Cf0stC0p6Vcx37wezsXfDexDMkajocbdx5XR5IY3Ie
	tab0k/U04HdUG//1V32O48Zavd1fWHWplouv7D+nsMaJcLu1fjPN5Ow3Owg1G89Hqrkb02dBE/e
	L9ywpvc1UsG8w87NpM+VtZv6Y7wDX0yICOB/fdCfUvp8OsIYxihrRN4IgjCi//LsqibltzYYqSI
	ZKyZDbbL4NRy/ydkOY0wgyf/5PIpca7atXsaKNtlQKtG
X-Received: by 2002:a05:701b:2915:b0:166:29a2:f83f with SMTP id a92af1059eb24-1909f5c7e8fmr908136c88.5.1792550586245;
        Tue, 20 Oct 2026 19:43:06 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:43:05 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 08/13] zram: zstd: do not use kvzalloc() for zstd allocations
Date: Wed, 21 Oct 2026 11:42:18 +0900
Message-ID: <20261021024236.1787884-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
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

When a dictionary is configured, zstd allocates all of its memory (C/D
dictionaries, compression and decompression contexts and compression
workspaces) via zstd_custom_alloc().  zstd_custom_alloc() uses
kvzalloc(), which falls back to vmalloc() only when kmalloc() fails,
and kmalloc() rounds such sizes up to a power-of-two number of pages.

For example, on x86_64 with a 110K dictionary, switching from
kvzalloc() to __vmalloc() reduces allocations from:
- CDict (level 3):            512 KB -> 400 KB
- CDict (levels 12+):        2048 KB -> 1552 KB
- DCtx (per-CPU):             128 KB -> 96 KB
- CCtx workspace (level 3):   128 KB -> 84 KB (per-CPU)
- CCtx workspace (level 14+): 1024 KB -> 764 KB (per-CPU)

Use __vmalloc() for allocations larger than PAGE_SIZE (and kzalloc()
for smaller ones), which is also how zram allocates zstd workspaces
when no dictionary is configured.  zstd_custom_free() already uses
kvfree(), which handles both.

Acked-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index b367049f131d..7a8b5ff186f2 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -26,10 +26,17 @@ struct zstd_params {
 /*
  * For C/D dictionaries we need to provide zstd with zstd_custom_mem,
  * which zstd uses internally to allocate/free memory when needed.
+ *
+ * zstd allocations (C/D dictionaries and contexts) are large and
+ * long-lived.  Don't use kvzalloc() for them: when enough physically
+ * contiguous memory is available it serves them from kmalloc(), which
+ * rounds them up to a power-of-two number of pages.
  */
 static void *zstd_custom_alloc(void *opaque, size_t size)
 {
-	return kvzalloc(size, GFP_NOIO | __GFP_NOWARN);
+	if (size <= PAGE_SIZE)
+		return kzalloc(size, GFP_NOIO | __GFP_NOWARN);
+	return __vmalloc(size, GFP_NOIO | __GFP_NOWARN | __GFP_ZERO);
 }
 
 static void zstd_custom_free(void *opaque, void *address)
-- 
2.56.0.212.g129ede20d9-goog

