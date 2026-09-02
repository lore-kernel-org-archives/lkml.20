Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360A3515F4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313735; cv=none; b=Pvhsg2T9G7A5Ez2x06exDPmqdwQswcu2azJimThxvJcBjI0j6HMfIU9KVKvlvRH4z4Jvrtr6IKWJcpc/1BRbxvK2l2mjgMTPjYISVOAsg0hQQKuH3uugmRX0jw2X9qBhd1sMf/iTnLZikSLBHQHbGAIpzSL9ImUfMfF4e6PLj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313735; c=relaxed/simple;
	bh=765FEkqjqfncj2e8tNjNINC9WzEJSkP54Gvf2N8P1k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMrN4W4ugrC600zC0gJ7OC+r56U008F+SYGqVp+CKkGlFqMrmMm/shGxdFiX6vC2J4mEbblPmkoDKWrFv6a6b7yjAHh+2F6XFth9ywmitIAwNM4HUWVDiT/ZF0cyJTTZM4xo+JI4K/+Zh8+ilsU+tChYGDFoh5mXiK6spS7zNmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjsUZ/wH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjsUZ/wH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so563677a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788313727; x=1788918527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUpOiVvuBNOuviz0gomL/IYfiXGNzacKn2pjup1W4dQ=;
        b=PjsUZ/wH+Qq+GO3WJBXI5iLJaAiLEpAVRUSu052Hy6+3A07B7PMdaVe4k+/cosf9hs
         zinSsnidAc4woYP4aGBoXsNgNuYkDufGXu09R02IhxNeHRDHeTVfsnxfT7xLLQMS81c/
         dPY02KywmSeVLw93c2aC2Tq1nmFlmBqEIM5BIRRUzWOx6PAHSe7/T1xndGfBn6UbXcg6
         0dgOMgRmriuvv+FiZ/anLtBIBLHYWqfR5FiRiQ20NDSEEvn3OiJBrGMTTOMWSORD8HqE
         G3pPJ73tGXUkOZaRkXyymNYJ0fzP5bIGK0SZbkoQ6ISCX56WtgSlUUVSkpTmVZEABiYh
         c8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313727; x=1788918527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUpOiVvuBNOuviz0gomL/IYfiXGNzacKn2pjup1W4dQ=;
        b=g9EAPw104b4ObX8HQLbnRDNZY9EEiVGiAxzZRpAHXrk67GWukQJBn6D7Ax1+GF/raz
         H7gMbR9QQ5Ql+Tsrro1Y2SOpYiEhpDzYYg2cwmtFjSo29925COdMmvu98WN/QYcl/NPo
         EL5ZEFOd2Olq/g5MIsK1KdCMh8jWYVWVPgYEMkh83rX5W6L5yFVpoXcEUXgGslKHN1fZ
         NMgzif2vN5m2Lcj1ZWqrUwpyOL7Mt37y8qkceemGt/bwLBW5t5i5Bl+yWItGHNPtAsRW
         GEzicT8wWXqFrlLz1/mfqWQTMICQnUmeJEJX2FpA10csav2xCsrpepvYrjqBG/u56XDy
         In5w==
X-Forwarded-Encrypted: i=1; AKwUvBxw/63ik708VgoBxvN5J0VTbHxsF36Ktoevq3U9oaHQwrAXtDWAbTDvfXc0/clvEpKiLR4xyNe4GNXXjHk=@vger.kernel.org
X-Gm-Message-State: AFuF++l/suIXnEtdkD4Ny207h+FpDZqFwBv+VQL7rW8yz1Mx0AFBbANE
	L2g0YfJ3n37rnS0mzm0M6xOu0SlBrdQ21d0AaDM0TAynoePO07x9AH8M
X-Gm-Gg: AYBFou39XGda+LETHWBS6gRD0CQqa/ARKSC1iiRYeZuoqC9f4WF1Tn970JxJxmKmF/w
	+67APvsCIxZvC6sCL4t+tlJ/MZ/rnTgmn/I9/1ZE0Hl3YHnlvCXmV4uq/PJAlZQWzzMJH35bIQT
	2/wPOlXzLSxig5FtGM69YXSerTmYbjnSXzNAMf/CKdBMLns/8aauAVseBjeKSZPbMVQH2ZPpu9U
	Vw/t9cpuh2uzVNCPhNAVdW0MuqCaEiaqSFl39L2YkkQ+ww2qZp6c1kEu/qmoILKXNcKPen/dVHJ
	nH2+O0hWmlZAVAsMDtABZwD1jwSdiE5vZtW1F+mH1Hkv7QlftQvAWoAksr0f5i9pYceuFbgQHo3
	1Ngwdl+h0DeNTAvuK0QdRlycomcM6bqMgQ5uVmCz+hmo/6oEpYLQQux1ZwG1wtpfHji9I2bD6xJ
	NdCBam2LtSp1spYYxvEu6CK+JF+uqX+u42JCjHae2XFctCcyKO5Tj0SA==
X-Received: by 2002:a17:90b:6cc:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39aee0eafb9mr1919630a91.20.1788313726853;
        Tue, 01 Sep 2026 18:48:46 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d76463csm8477285a91.9.2026.09.01.18.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:48:46 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: define EEPROM_DEFAULT_DIFF as -2 directly
Date: Tue,  1 Sep 2026 19:48:32 -0600
Message-ID: <20260902014832.17625-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817210507.26168-1-skunkolee@gmail.com>
References: <20260817210507.26168-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EEPROM_DEFAULT_DIFF is defined as the bare integer literal 0xFE
(254) but is only ever assigned into s8 (signed char) fields used
to store signed TX power calibration offsets. The value -2 is the
intended default offset; expressing it as -2 directly instead of
0xFE avoids relying on implicit truncation of an unsigned-looking
hex literal into a signed field.

No functional change.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2: express the value as -2 directly instead of casting 0xFE to s8,
    per Dan Carpenter's suggestion
v3: rebase against staging-testing
---
 drivers/staging/rtl8723bs/include/hal_pg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 32e66fe451b0..6f8c8307eaa7 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -38,7 +38,7 @@
 
 #define	EEPROM_RF_BOARD_OPTION_8723B		0xC1
 #define	EEPROM_RF_BT_SETTING_8723B		0xC3
-#define EEPROM_DEFAULT_DIFF			0XFE
+#define EEPROM_DEFAULT_DIFF			-2
 
 /* RTL8723BS */
 #define	EEPROM_MAC_ADDR_8723BS			0x11A
-- 
2.55.0

