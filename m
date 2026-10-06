Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE42D2394
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266968; cv=none; b=lEMfn3Fr/SK/zefjaUrVIwZ9bMmAA2wdZ1MG1k9qVCy9PIalfGevC7ZGdcQZRJb9FRYu203qaP4wbfrot5O7Fk4+KmgbPvnRwU8igJanrwYMccyrFXQxrtIg0nRW5tAL8AzLeuRFGe8UQp26b0kWv6QxXut45D+H5Hlow9B3EYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266968; c=relaxed/simple;
	bh=HVFg8oUhgiZyRBPen6DfaYlVMgTFIxBKy+NDbwY6uBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZu+79d5PHy5yQTJk/svsszsUScop4QiZez8qgOS4GqPq3VzUEfY3ozjk6UTixrsKXfU+3KnysjlcUtpbRuTJIm4bJ9Di1NcU+hx6NU6COxoVRIWaI39m13yiBkZdQcCh++nUmoUn3JqgEjwyfqo/sGer7T9EHx/rFeGs8MYKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHSOrWNb; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHSOrWNb"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917a97b39e8so4003256d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266966; x=1791871766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIXWXKVD7GsrdCHKFaXi1XwMsOECWaVXag6r6s+wajM=;
        b=KHSOrWNbB2KzPTIk+VMeSbVIE49AXQJxVYlBLy7OuRUgTuoi9d7QgrcYH7xrBix8qp
         TjbJzsktclrwFnhWt/AHaMAK7S1jjSqPaybn4+BqaXl4FPa8yn1gzpZtV7Y5sPqGdkrn
         YXtpUP81CJxzEr+KhCUY2oxJme+555qmyawP2Sdn+XSNSGvvUTKDAaIpDX8vdHcnvA+1
         3WbOzbKxZRsd3fBlwzcvLL+GvE8DtejvyvWuuivLsCUqPDmje15+Z0TebG2VnJpteBDY
         GmLt2/btAloJ4g4qIEHNhRRkX21acqmNxO/CFXLvtC0s7N90yxlki/COzoWW+lGOjKDr
         d8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266966; x=1791871766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIXWXKVD7GsrdCHKFaXi1XwMsOECWaVXag6r6s+wajM=;
        b=H0yeWcrQC84aSxm4nuiXVvgAZyT7XUehLg0X7X/3OUiHx2F+T1SFQ+/001AaCSIett
         RhgJ2j0m7h3kzhmcKPN6vWESOo+8brMnwCnbx4TwOG5qNvH86I1XkM1aqSlCk9vO5Pw5
         4p00XUpdwT11XvpXRAoo6sM4tZza3+zukF3SX+TQjYrbn6MuJxbuOILCUrKdpG90y9Lu
         7qzUCZPOHpsZjxLEH2eDgZnsCJp5FTvpRJPMK7zMCNkAt2v5yyAOvzgPdVfHXSfh+jkZ
         YjflmwDxk0Nh6/AZu0qir0HrLL4Pw/PwQLxHmQXLiPpFoDfca12Zugjx1nLeMfEbGXkx
         /m1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxghJn8fr4AHx7bAzuqObz6BgRY1u7sLEQapaODqV2Mso6D/DltIQS4e6gtY1sx3+Ks0KSlJRWU6gG+Yko=@vger.kernel.org
X-Gm-Message-State: AFuF++lLpBGPLq8CRLPNyJJEHsjTw7xCyOi5LtTJCDes7bPIKdBMdc+9
	wOcMW0Ty30MtfApz0TRmFQAh9rTXOhN9i4If4CXZ7OGtAeXYBjhOkOGMIgO2TaLp
X-Gm-Gg: AYBFou2IJz27RieU7ql/4Nd02vha3G57968mZQnGPB4lsGL4byDvPQfAs6wTrchsflN
	ublQd/tQlnoSBMdCLcnvWkPQjYFalWeo2vhFu6rYXXJjZ9Gxz+7PrtsfRcLtdlCkTJEohmo4WXo
	kBK8SbUMA6jxcdsFsDZes4h1LgwZVnytcQXVJwGvAkrSfUch9ZE/t9bIz7OruryQJ6mIAZeSiVN
	qfZbjkZXqjdgxsiiROaelW2RMoViokLPDTgrgsmQFaLzOhbMHQFpKbrxJeAOX421CmkuO2CV251
	vDbC3YSAOfCB6eo/1YgI8JIgcBMUFewRml6i3rrQU+/UxVMrjUXjIJTXpvUSnlN/SxfILvFM7Sc
	/tlNfW6E38p1y6JVH/Fj5wBN2q7BalTxjAyPgPHCK/bMytCwiCf1WMZqtSydwNJ+7tIRIv5uyLL
	XJu7xmh1nq2t7fmr8YuFTOd7+dfI6q6Dnx4LaYftDlMAK6u/qIv9MYypsNwk/plvFVSQd8cO1vx
	bo/JIIGOkhsdhzqjT4c3Z8s
X-Received: by 2002:a05:693c:639c:10b0:351:1272:e21f with SMTP id 5a478bee46e88-3514e2b0177mr353517eec.28.1791266514578;
        Mon, 05 Oct 2026 23:01:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f73fcsm4442054eec.10.2026.10.05.23.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: tegra: fix typo "fuction" in comment
Date: Tue,  6 Oct 2026 11:31:48 +0530
Message-ID: <20261006060149.44677-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in a comment, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only a comment is touched,
there is no code change.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split the single "ARM: fix typos in comments" patch up per platform,
       so that each one can be picked up by its own maintainer.
    
    v1: https://lore.kernel.org/all/20260907064849.23086-1-hemanth.selam@gmail.com/

 arch/arm/mach-tegra/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index b21f51b8e19e..d7bc21bdb519 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -257,7 +257,7 @@ static int tegra_sleep_core(unsigned long v2p)
  * tegra_lp1_iram_hook
  *
  * Hooking the address of LP1 reset vector and SDRAM self-refresh code in
- * SDRAM. These codes not be copied to IRAM in this fuction. We need to
+ * SDRAM. These codes not be copied to IRAM in this function. We need to
  * copy these code to IRAM before LP0/LP1 suspend and restore the content
  * of IRAM after resume.
  */
-- 
2.47.3

