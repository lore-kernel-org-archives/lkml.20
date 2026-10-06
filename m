Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB976396D19
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266501; cv=none; b=PoDG9pF7/3TqCuTK+L9SbmKbXGDTYUOMdUSxz3oYO/RxE/yVS8vKOJ4rH0nY9N5QISKoUbxQPz/a+Y4YnZF1V2CI7NtwweS3MZ+iljKjA2Zs8Xd9ozxdaOGIGPMLe27+MSNz6cLrPut2TpkD+2j9aHWMy3Mb08vv39zOWvs6TqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266501; c=relaxed/simple;
	bh=TrTox7UJAfPLlLcucglObe+/FpBLBsP1DqhZV/QtubA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rd5bXhen6XJFk+NHWI6PS8Z/53qESeGidyHJo9QRyziNFDOX4Ji3ZwTE4j2ERQ3ci5pDAMVmMtBN8qTyjnMDAvi0mWZlI05vnyczmcgMRdx44DZzp8b+1hFCooVj1tqIJE5BNdicYT83NdLtrga9TKQcOVsFaUn+2jv5WtToyag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWRH9NDh; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWRH9NDh"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so279027c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266499; x=1791871299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SS1ERV4sWn7hoBzl0f2aOYvZXShJQi98daPhEwG/R1I=;
        b=rWRH9NDhEXCFgSQTedflp5DbEFL285p+uwPVBuruuZ/98nfpYqB+2yHILsdvOSpcdE
         1OHMT3zyWmTML8ZhgKKo45xMKyv1HKj7mi11PNgc7bFbexUsFTKzSc6qaMbePaxvDZeA
         xDRMVxqBzEMnJ9SZ67x4cX6ZzDHOhl2U+J/l7xiDkc2KDiP6/tRQ4+K1UA37o3CD14co
         tlH35RQnFxTmFd5igEpSxQv+ckn1CLfPmenhdHMjjdOl/6UuahRiCxoRMR1ymFQuqcs8
         iTPM5ecsHHPRzhmSOetwnsWjeXrcPyOSp/t70C5YiXMcT2xUfR0OCt+I9Sm6fiCu6lBL
         cLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266499; x=1791871299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SS1ERV4sWn7hoBzl0f2aOYvZXShJQi98daPhEwG/R1I=;
        b=yjDBUoVSuUDUx0uEYKn86oaWpbXlRyjTOTslx8PQqK35o4kXWH08GsAtx9udLYKIQK
         ovJaubBkjB0b5yjzpfHjXJzALs1ppsfOcEZmrY5b2DvysIn5YM+tE+9lcLwwhpIpVGaK
         9yaG0c4UX9DniDQVllwsIl7QEp+16VpqubVhbsGCCfHw6mctMGz+efWOufDlyEfj6Ou1
         DbzGBH/Sx4XYULEMYd+ouGmyHHkDPWSKIYGUrhDPjQiPHC8qgWOi+1KKt6+x1bacoV9K
         gVZNLZ17q24qF2l5eUCig4mxpySjyNlG1j3fYAwFjGDL6dkYKauPzj3WvJVLuIAxQmeW
         WcMg==
X-Forwarded-Encrypted: i=1; AKwUvBzuDoAlxPISce76u/wLFQ5jtGaM6OJMxEUvLxXvgckpdzYYCw/+h6OdrjgodtFjAa0ScwSTZmzZmnmXpTE=@vger.kernel.org
X-Gm-Message-State: AFuF++kx7dK7lRvuUU8rNc+6nHY+wX6AIa6vLqFfKkqdhlBokgyzTdHF
	qrqd4mWYrQXbNTTRTGkP9J5/QrlDx4aSRq2rOfyOClxN0A1DneTHtD5b
X-Gm-Gg: AYBFou3PX8F/aQxjSnFi/Er3C6/7EgtFPKPWDUH25ffK1J/ZBSqe+kzD21fWqmsI9Ai
	QJimvw4Snn90qVmnWuYuLEGawpscuJ1AysQKG1lpbpnPwSCaEem0cVekMxw2pDDZMlnQeFHBSbe
	D29M0pApCRJp4HxhEETKrMrINCvy0m2yuY2hBPfbyMwg/HQ6E1Mvx9ymodeajF/NCUC3SesJqAF
	cHPssrSZtcP2nHMVlSVCqIbmJUhQ/F0Uigj9oHzorZ0O2+hABoyezFqk4+2p3JU4zZkgtsHJDF+
	5x9sgfDo6VO8co4Kca24qxrzQ/Q0SRlWZW9dqx4i/Ao9JizaZHgqx+EOb9mtdoD6haKuBe1MMkg
	dUP+CsQtiUidhkGNdbwU2U4YThb7Zp/OkK4wcSo/MslN0I5Win00FGWHJ7EuOoqFritT+8PobuB
	XEMby7vVlSQLHZS6Oz/Ov6v9YGvHQ7oEInYmN0P0nEJtxY6ZScnL9zDCJECFpQCixhfT2JONl31
	Q2ew6zc8NQ42DRd4lGrkoSIwlW8C6Tusw==
X-Received: by 2002:a05:7022:f512:b0:143:8865:cca with SMTP id a92af1059eb24-15eca63fcd0mr601967c88.22.1791266498776;
        Mon, 05 Oct 2026 23:01:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbed6sm7682867c88.4.2026.10.05.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: imx: fix typo "interupt" in comment
Date: Tue,  6 Oct 2026 11:31:31 +0530
Message-ID: <20261006060133.43320-1-hemanth.selam@gmail.com>
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

 arch/arm/mach-imx/suspend-imx6.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend-imx6.S
index 63ccc2d0e920..3f8670296358 100644
--- a/arch/arm/mach-imx/suspend-imx6.S
+++ b/arch/arm/mach-imx/suspend-imx6.S
@@ -234,7 +234,7 @@ set_mmdc_io_lpm_done:
 	 * mask all GPC interrupts before
 	 * enabling the RBC counters to
 	 * avoid the counter starting too
-	 * early if an interupt is already
+	 * early if an interrupt is already
 	 * pending.
 	 */
 	ldr	r11, [r0, #PM_INFO_MX6Q_GPC_V_OFFSET]
-- 
2.47.3

