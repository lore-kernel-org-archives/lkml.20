Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4985304D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178252; cv=none; b=MhOgfeVHX10UWqG52FsRzOY98wbHxDeTwgOZluYfnNfiuX0dKgnDO3Esh7Y1Fey+WXcWOUqi+FF88//3EDXJWcDmkC7hOB5k3RqiXecAi7D7tpnyfZEzZL2L5CIgzN7Vff40JGhTzjnLOxPG67vLK8ENhxBqtAbyXOtZ+hnxzQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178252; c=relaxed/simple;
	bh=dEsuichCM0C4hCd03bd1KgU+6bKSG+a5n+EmuwGO5YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+IANsgoXURzaSfHGru0nfR/O2PjBJruY5LBukSOL1eMpOO1xDtLZcDz+BR/cW3I0mYn+CWyTv7DCK6y/CFfvwC4FX83iy6e7NT5MFs2fGL+Xqsh7eYYnc4sDxmEMG8+SEMCWdCRVJvtT1YSeGf63ecHET652A8hpw3iQJdmulg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0ACg9Gb; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0ACg9Gb"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c83be8db39so706963e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178250; x=1790783050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HtKgKYLrxm3x6UJBU1QmDCl4UFfcngUzG8by9J5Mp4=;
        b=K0ACg9GbRkf2d2CqOgjxb6McIJi3fYYkRKp4+otdQ49rbixq16AjG5B02Kpmy1ba/S
         VxxTRZ/7GNuBl3KKRYMA8fKKxNKwzFZW/T18y9bEQOxj94YuKgrYHIcpwxG6vo0COwyX
         2Vo/3pMZN9GH1ixwaFXBFjMJA5fLf/+VM0mbHsSImNwwyXYZfwqaqWQIR8DvMLtQi2W0
         q1LEfXCpP5q40xcog22v2Hu26pqWG24XI7c41HEVcVd73+j6mI3BqsxwKwsFTPrdGn6b
         IeaO2VnMOWdj7v9N83GxPRpflVADb6Na8cjhNrBcNB2jaC2Z30lVHwFXhU26pL1RGjEQ
         xJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178250; x=1790783050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HtKgKYLrxm3x6UJBU1QmDCl4UFfcngUzG8by9J5Mp4=;
        b=Lo7V/VoeBXz73iqf7O1KWMgsSUaI+O6I4YDVTTk5VbzcctuEh5JWdoX89wMD3B4Ov1
         FkGJ/x8mROcDY2mBgSrSS6DIvx2KiQ2nzb5eJbDCqt/QYpqeAe1QLGNdDT+m3gIM5NlD
         m2nzTkqKwB67iIvYW3DSohZcW5LSqnk5ige8dror+ip0J3u3hKoPhaDHj8UNnFf5nBhm
         ohnd63IDqlVraYNvQPCYYkip4AQPxpWqUsAZ0lxG9cBqhL9R80aFn04wVczV48T8fhWb
         mOFtakSt9ioX96kSbFcNnxb+n5KOE5noWgb+ZPlD+YH/Sb2+VXHMVWwSDc5Oaghz10e+
         e6aA==
X-Forwarded-Encrypted: i=1; AKwUvBznW1L73QGXMObgiPv2T0J2MMEclPH+rlytMbv6VhuGcLyrvKcXDtcInpVMbfpgsSzAPJE1Q8WcjVhlkl4=@vger.kernel.org
X-Gm-Message-State: AFuF++k/rUgLVI9IbdC7/i3PaVOv4Wl0I6PMpJoutuWSb4tKa19IkgFC
	ec+4X+K/KqyAyoD/ztCueQPuGIYzheyV2NIGl7HwtpMDO4rL936YIVbV
X-Gm-Gg: AYBFou2FyjfPTbChHySDbEDfReQJQEQwJ9euwpnDe1hikyNHcVShlAUgDuOB6lpV/5+
	QxS+UDd9s6WoodWeBmFCRZuSTMPc4gX0eWfc0hHXw0iQkhPfuY5WRWQMsqKb15hp1//s1cXrbbJ
	IBIWbQNzcy/taUyxr/HG3qoxEYhkbePOXsbmlHLkzMrXRhOGfbtCzxkAMnK7hzzR9aXaLBCKiC5
	RlYhVTbsrgLj6YJw4EFfy7W0VJy0MO7jqbDiSbP865UwMrD897vhZtuZiz/tWquCMARQ3fe6qia
	nM8c6Cw6g6q3gxLX1rAWnXZkhgbGDXnY4XY3VAkUkkkY/czVAvRC5OapT3Sq9e+vsWbd2sFkom6
	fueVFDYx0/wAIfPMa7S9YDVfGv/PCHLx6oONlxhYfUY/Ou9SPH/VfL73Y+lxGhaRVhtljRhb1Zo
	rgiUIbHunsrIYETIKAGXHqHjZBwS7dBQhtM7AfBTOJvC380rf3tcEuNZKwPYVW2vSriUrWGNA8Y
	x0A45MV2ra4
X-Received: by 2002:a05:6122:400c:b0:5c9:a60c:273f with SMTP id 71dfb90a1353d-5c9f16b901cmr3577780e0c.23.1790178249808;
        Wed, 23 Sep 2026 08:44:09 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f02bfsm3437129e0c.7.2026.09.23.08.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:44:09 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3] drm/amdgpu: prevent parameter-space underflow in nested ATOM table calls
Date: Wed, 23 Sep 2026 12:43:57 -0300
Message-ID: <20260923154357.1319689-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923152912.1296884-1-qwe.aldo@gmail.com>
References: <20260923152912.1296884-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atom_op_calltable() invokes a child ATOM table, forwarding the
parent's parameter space with an offset:

    amdgpu_atom_execute_table_locked(ctx->ctx, idx,
        ctx->ps + ctx->ps_shift,
        ctx->ps_size - ctx->ps_shift);

ctx->ps_shift is in dwords (set to ps / 4 in
amdgpu_atom_execute_table_locked()), while ctx->ps_size is the
remaining capacity in bytes. The subtraction therefore mixes units:
a child table requesting 60 bytes (ps_shift = 15 dwords) with only
16 bytes remaining would compute 16 - 15 = 1 instead of the correct
16 - 60 = underflow.

Convert ps_shift to bytes (ps_shift * 4) in both the guard and the
subtraction so the units are consistent. Abort the interpreter when
the request exceeds the available space so the parent table does not
continue with stale or uninitialized data.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add coordinate ATOMBIOS table support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v3: abort the interpreter (ctx->abort = true + return) when the
    child table's parameter space exceeds the parent's remaining
    capacity, instead of silently skipping execution (found by
    Sashiko AI review on v2).
v2: convert ps_shift to bytes (ps_shift * 4) before comparing with
    ps_size, fixing the unit mismatch (found by Sashiko AI review).

 drivers/gpu/drm/amd/amdgpu/atom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e0e585f..af283cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -646,8 +646,13 @@ static void atom_op_calltable(atom_exec_context *ctx, int *ptr, int arg)
 		SDEBUG("   table: %d (%s)\n", idx, atom_table_names[idx]);
 	else
 		SDEBUG("   table: %d\n", idx);
-	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx))
-		r = amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx->ps + ctx->ps_shift, ctx->ps_size - ctx->ps_shift);
+	if (U16(ctx->ctx->cmd_table + 4 + 2 * idx)) {
+		if (ctx->ps_shift * 4 > ctx->ps_size) {
+			ctx->abort = true;
+			return;
+		}
+		r = amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx->ps + ctx->ps_shift, ctx->ps_size - ctx->ps_shift * 4);
+	}
 	if (r) {
 		ctx->abort = true;
 	}
-- 
2.43.0
