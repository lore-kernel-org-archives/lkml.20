Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB075448BE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179990; cv=none; b=WkeEF+gDOJ40vuRhAelEdtIwYquCjT57324XvWLIIKQTAa7lTkJz3qGx1o905vMcXhGsbsWdIvVKhw/JHciCGU9lIxntLjJt4v6G4kUzkhoCir+OuicxRy3iaTPHu/eHj4ycUkB6ccsKu4DknfPhj9ewV2PyAHZeHJalVBlMIHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179990; c=relaxed/simple;
	bh=1g0BHNHVwJMI7+P5OfhufmxEK7GftIxxvTr1NNSUwak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bliGw1w/pM1P2+OI6JBH69pN8ymSKhRaCj7SAieMmOwXqlMx9OkMfk8gYV12GZoM71E8dfnOjMgik+8ZtQajZ+ofiWkhTXwDjyzMTgavS1qu1pCgqdwTTCAaLonc4xvbGGMm93LztmDyJrM9wrRquMh5WUdHqrPm5dKrEDy/Pm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkAANFO/; arc=none smtp.client-ip=74.125.229.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkAANFO/"
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so1283678c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179987; x=1790784787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUIXWjLbTey+d3P92W9cG28EMxJiRiFjR+QNnEvmF1I=;
        b=EkAANFO/6XSeDq3iLh8+j/G7YMFsD6YjxMq+ek/ncBvPEOlyfOcXwPvSx81Xqj/86J
         Ts4PEVq6+48b7iuCdltQ0DKfQRt8uW7TlKgnt/0mIVCes6wjT9XJqay0w65vopGCZ3e/
         0L4g62UUh5/mSJt3lXdnkCjIZ2n/lh8G6lZLzscTTp7NyDCPUaI+zFjrXMVx6/g85kwK
         g8R4CUgX/GUOEhz5hgtvDBmXJVBESTo+wGRYJfnZ9ZxDstsWIy8axc7TFXDh+3edbzzz
         j+mpFicJEg/fddTlgSl99enlJjFSu90ZSLop1rGyyiDCDjCsywRVP1hlKrVL/phJs+OX
         ejtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179987; x=1790784787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUIXWjLbTey+d3P92W9cG28EMxJiRiFjR+QNnEvmF1I=;
        b=UbpSUYq9Fc2SdtP9L+RMWREr2PHiBsbGqpJ9HsFHMjEphW0Ubp1jDxFw3X/DWloZK+
         f4P0vUy6SUfFoac5Gy+xBGCyjbqItUuIrEEKPwpmfdsLM7G6ovRGn0nXaWG9IawHyzgV
         zD9LslrfryZCISocBAR5X4fgRQB4OGf0eWD8gBz4iXSk4rllvsx9XWQXCq6chsBwwqb2
         z5yLxPbiCiHS0X2goTy7BG+ZNQZGic4F2yp+eXRp92dcQd8npxKIJ1JuosGFpN3B3qjI
         amcL/V2fN8l6NVe6uW3Gx2wEgy38evRFs/7aSKzBbdnwjcldQqrileGsn3PZ47JGc/rw
         6IXw==
X-Forwarded-Encrypted: i=1; AKwUvBzL1RC9M5ZyzOulkhdeF5728JIXXeISUKd27BaB+oTIG0uXOTJPoSPm1cxeItRjV6cHJ+grAqGfucPU9tA=@vger.kernel.org
X-Gm-Message-State: AFuF++kYtkQ+HlF1Iw9MxeUxoP76MTs+zkhbthwW3esAQzZTHIwMmjds
	8Q+vxxLsWU9b8IY9AeGFVkUmT267eNUXAbd1baIoaVI7zD4PqLWFZd1t
X-Gm-Gg: AYBFou1JxCCHlddDKGuf2zIf8IAwFWwQoWG1DoA2XP7BqFQmLycm1IvVkYofIaUHvIz
	azYHUrm6R3WwgEwphaaFqOX2TB3LkaIEZkYD46TOjioxp7byFgZyBfvpWtrqnZxRuyXrvcruOOb
	ITBsBxM+HlukPpTlY+p1WwLy5i+ELpgtgu3al7Lyo86QPqF5/iDCXYavu5wC8Jj388YnzBf741s
	NUU0AseiVhLAKB7N7sLlj9Q0Uvm3Ez9x+LMeXvtuATx+7hPF1kpooO2JF7HdMnvIQ8B08IWnWg7
	1IUM/1ceegWk8cQytgD7xLb2TTAM35swcAj2CEWDPjY5m1i/8qY5fE0P+AUSb6PZewBujVAbNFQ
	ZZ0HvmDqmMsrmyA7ANIbGUQbOBkfZ6mhC2QquS+3Egs19XtbsKY+Azyqcp1/PuRGoY0YelRDbAo
	5b06218Pf4TLs6GlFxTSK9wUEbQeJ9RqbCfIW9ZThqXoQT66EP72diT/00gSJH4K1mgNKhwetXJ
	g==
X-Received: by 2002:a05:701b:20de:20b0:145:152:b54c with SMTP id a92af1059eb24-1450152b7ecmr819023c88.23.1790179987346;
        Wed, 23 Sep 2026 09:13:07 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14501794269sm992777c88.8.2026.09.23.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:13:06 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/amdgpu: fix ATOM parameter space index bounds check
Date: Wed, 23 Sep 2026 13:12:52 -0300
Message-ID: <20260923161252.1363895-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atom_get_src_int() and atom_put_dst() use idx as a dword index into
the uint32_t *ps array (ctx->ps[idx]), but compare it against
ctx->ps_size which is in bytes. A malformed ATOM table operand with
idx between ps_size/4 and ps_size-1 passes the bounds check but
accesses up to 3 dwords (12 bytes) beyond the stack-allocated
parameter buffer.

For example with ps_size = 16 bytes (4 dwords), idx = 5 passes
the check (5 < 16) but ctx->ps[5] reads/writes the 6th dword at
byte offset 20, 4 bytes past the allocation.

Divide ps_size by 4 in both comparisons to match the dword indexing.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add coordinate ATOMBIOS table support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260923163157.1354872-1-qwe.aldo@gmail.com?part=1
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e0e585f..d0a45f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -232,7 +232,7 @@ static uint32_t atom_get_src_int(atom_exec_context *ctx, uint8_t attr,
 		(*ptr)++;
 		/* get_unaligned_le32 avoids unaligned accesses from atombios
 		 * tables, noticed on a DEC Alpha. */
-		if (idx < ctx->ps_size)
+		if (idx < ctx->ps_size / 4)
 			val = get_unaligned_le32((u32 *)&ctx->ps[idx]);
 		else
 			pr_info("PS index out of range: %i > %i\n", idx, ctx->ps_size);
@@ -510,7 +510,7 @@ static void atom_put_dst(atom_exec_context *ctx, int arg, uint8_t attr,
 		idx = U8(*ptr);
 		(*ptr)++;
 		DEBUG("PS[0x%02X]", idx);
-		if (idx >= ctx->ps_size) {
+		if (idx >= ctx->ps_size / 4) {
 			pr_info("PS index out of range: %i > %i\n", idx, ctx->ps_size);
 			return;
 		}
-- 
2.43.0
