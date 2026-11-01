Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530082;
	b=oFxO2+N1CEDpIv/trnpodvt7JfIJr9lBFrZikrsjv2AfUaWzinpySZBJjjVlxWKwAOml
	 y3xRXJMZa3MXrXZK8wRbIkBd5DQmSTDw2+YXgeKQ3BZPTv84TZF4+12SMRWq6Efb4NWOv
	 V4wdUrTBBWfxuS7AzMt7+X4hZYE2rMfUljGJjdTh7XIA08HcWfKgzVh7XOyCcq+y2rQ0z
	 Ologkr4ASQ/KjjfAqTPXddiurkLLbEDG4ncbgbRbHakqdvcKapEmevgMSyqBcgDsZXuWv
	 QZf7zJ6Mxum6/A+usrsQBH66Ne+X3SvvMCzXF56QB+FtBaRLDrZB9N2cp+JkZtgHhOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+aTVbnkfZYsolInJM1P7mrXF8suFhh3kNR1fi3nP4Y4=;
	b=f8j4Mq+gEC2UUi7xjsYEyoTcpFbfnFmRM1obCMR8bSuOEn7GmFCHi/UxFkb8rTouPgUo
	 2k29n+wdPZp7zB7LEfUmN+Nx2FLVTkWenLCkShj44yeRjE5LkZ4kmKYGVnMYlzt+sFXGH
	 eTEpvJNPPI3i1UAfAdFpRVwhoY6mIGaudn1cUC73EBDYOLT0VvnzrbXga1X87WjY9PzQ0
	 FxG+L6pYi4V1K39nqpW4aRPyYt4qDgZzLOoB5qzmeNr81Q2F5qX7LUR4DeXT/lQ1dFDdx
	 1wL0X1ssr5HXZmpwWuiP28CWRnGlZhu0bA7KHJKbp+GIKqm8UDfl+O0uHHVWjIdu3Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArGvw231;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542D606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B542D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArGvw231
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so2705799eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530081; x=1794134881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aTVbnkfZYsolInJM1P7mrXF8suFhh3kNR1fi3nP4Y4=;
        b=ArGvw231XoqRyBrdmphtmMh0jf5vLrYSIZozoPBHRwlQJhEyeQzdTV6b4OcTSB0bB7
         lzj9hEcqSkEgJVoczhxGB5PuSE4g38pj+WZqNrFKb/+m1gLnTR6r5cefFFxrQYodBtVp
         5OLqyGCxZ1py7gqt16Ng9RKInBicJun0UrPV7EIUe1bkiPImKeDxV/dmq2DnAeLwFv9+
         35Ft2DDV4jxWuvo1xKCAHqzYB6UmwLT22xBkk9NfcRqBSGPkeSv8f+e9klOJbbKPehs7
         /uR+wMoA7tRGdRf9FMgdQVkYAS8xLEsnrX3u3etd4ZPQDbo++NUjFq7W1b7CgoG26p8w
         6SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530081; x=1794134881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aTVbnkfZYsolInJM1P7mrXF8suFhh3kNR1fi3nP4Y4=;
        b=D9rK/3mYseKtx6AZyYFlaE81WeQpJJMcabQWlBYA+dUhjIVHT/LuI6r+pOYPTfOfUp
         NDQ/vYdE6dQXVj88jssBjPXoWtzm8Wb/m41Fjcfz5YDb/5L0B9iU9V3crK+JyPzUo4NM
         TwdylHZC/kweaQNm+sk9oESqiImtKNLPXdB8B8ZlTIHCuGMSmzJ8mS57vB2O/ODjTEto
         REF8tvtbiCb+nvW8GX9XwCQQBvNjdZwROnakSKxu4YrpCZXFfC6ETLFuKSWzFBAb5N6R
         x8sTbRLrKrhqQGMERllJ6A2RuonkUB7e74iXAPWDd+VhgHGMrYO7stbONteBtkXiz0dy
         M6Uw==
X-Forwarded-Encrypted: i=1; AKwUvBz3NLVEsIZzBea7cI2an86T2MrOkJ97BGTixr664b9hwkDV1PJIhwwfqS/QFeSYa005HJhcQHDCkTfmpeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYINxoIWxhb5vxRslZ8NL++aRwrc1REr02o9dhNNKEEdlzn1z3B2
	YPKiCxKOk6DTsiZrZ9ObYdNblNTIkUku2TAjiSakASrnKqQtDRci1n0V
X-Gm-Gg: AYBFou25Z+nRD0RkC1UHanNJ/6Ga2oV7v5kf4hwv3NzVhAywH+u9dN2UBousEVpmEgO
	6XcVPGeOe0NuhyMtEk9GdHt9JfaWidhVnJ2eFHdUcKOekiSuiJxsoPJtWipL0ba4USuNv8AooRL
	Xt8b4rDeNUQ9qahN9o9UloslGgxgpnJgH8nWO7x80vAmgTC83vARocRk5XrtVeVUoF6Ip4rZ+pQ
	A96tNE9Vxa9zO8biHY+DyaJb914bu4wZYOoVYfe4DGW082lydeZkWRxZn72uLaGCQjpBObwKjfx
	u6/ObtYQXAoz1QXe1njEXaUhfqZqsZr3SUX1yhMem/33chkx06BUNDh3VltpU872sQ8mbNR1C1R
	scpQfvZuPTr3yPx+hZJ4HZbDXTOi2lumBfTWKLhNLk9ztxN2Hjpnd/+wyUUVNuJPSxif8mDL2tp
	qlPtVED08q1EJEOtRi931sU8JY/2zsexoslQ2Vxvf36+iPMp+mkwrpCR7H/8NZWvd1Mr6/k4KEm
	G/tKpLQQ0WkAroLZ3b/7zmXx963WpVtgM+vxeUAmxt2YGJLo1NFZAwkuIQIVId4xrq4sd11QKLD
	uPe+x3nyrpfqIRDd/g9wheR+reku
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id a92af1059eb24-1ac5c555078mr11436993c88.35.1793530080785;
        Sun, 01 Nov 2026 02:48:00 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:e7f6:4b7d:197f:48c0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm23334554c88.14.2026.11.01.02.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:48:00 -0800 (PST)
From: mdshahid03@gmail.com
To: austin.zheng@amd.com,
	jun.lei@amd.com
Cc: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] drm/amd/display: fix USR retraining support check
Date: Sun,  1 Nov 2026 16:17:27 +0530
Message-ID: <20261101104727.141852-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The USR retraining support check tests the address of
USRRetrainingSupport[j] instead of its Boolean value.

Since the address of the array element is non-NULL,the
condition can always true, even when USR retraining is
required but not supported.

This issue is reported by script test_addr.cocci.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c b/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
index a8519f547dce..74cb65687a50 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c
@@ -412,7 +412,7 @@ void dml_print_mode_support(struct display_mode_lib_st *mode_lib, dml_uint_t j)
 	dml_print("DML: MODE SUPPORT:     Host VM or Immediate Flip Supported        : %s\n", ((mode_lib->ms.cache_display_cfg.plane.HostVMEnable == false && !mode_lib->scratch.dml_core_mode_support_locals.ImmediateFlipRequiredFinal) || mode_lib->ms.support.ImmediateFlipSupportedForState[j]) ? "Supported" : "NOT Supported");
 	dml_print("DML: MODE SUPPORT:     dram clock change support                  : %s\n", mode_lib->scratch.dml_core_mode_support_locals.dram_clock_change_support == true ? "Supported" : "NOT Supported");
 	dml_print("DML: MODE SUPPORT:     f_clock change support                     : %s\n", mode_lib->scratch.dml_core_mode_support_locals.f_clock_change_support == true ? "Supported" : "NOT Supported");
-	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || &mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
+	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
 	dml_print("DML: MODE SUPPORT: ===============================================\n");
 }
 
-- 
2.43.0

