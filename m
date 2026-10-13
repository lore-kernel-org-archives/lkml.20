Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B1F53CA7F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918960; cv=none; b=nJGt4m8u85S3FTxgGRqgLj6A43gi6GoNqHkAeXDU63NON8Y4bfi2J8eW5R6wQtG4d/qa9HxcFwjB84zI01HgVvsCxMc+yZ1zJMDiE5dAvRh1XBGHrr7EoktKCvC/DtUsljk6z4tu0OGGvbxKTF/VQh/Gi8wwB2Y+5xOY8lM5Lrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918960; c=relaxed/simple;
	bh=YqIFBD0cMGaqBJVTPfg5GHhAEe9OSyYJzacDjggqHpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbaETuRk9gJAUJRfLGXJ4lTUXwyreKndfe/6L3gFuHIerFIO59eHyqbnyjal1VdszQsIRhkB42Tt6c70PwR5kSk89PqHBsunvtx7+VKQzNXE5U7YhfF7f5QsadpeGg8ThY799sdoCxJIeL5KskYJEH23DPYMSW9Wdy8bZlrLZ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5yQ+Lk4; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5yQ+Lk4"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a1963cf318so3536415e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918956; x=1792523756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAiWr2qQ//z0iBACrzomuihaSPDdArLye5ron8Ml9Ro=;
        b=G5yQ+Lk4nW42hdYfeeo+H5t5g3mnehl71V5hX3APP9rWB6W9Kb2Y30hcFqh0vvy6Rf
         ntLpRwhmZMlC+uweQpNrr/f0JbopPoicLo+4wJ1HfugDVcoKIsCx6dg+owF3g5vrBu+y
         sfg4Ip11oVOhy4QWs1GvX20txUZOdyqwTGKHxBONuTe7TOZSys2jcTSr5dDD7gGV0SKP
         7k2mgGogvkNhPUgXMKGc6pWfaI7XjxES+SC+zAU9MSFOJrBS2QoNb/CmhtDjNgt7nNOv
         NwK6iecicQ6ezoeL3kQ17aW5cFn1JRKjbzEuJh65pbnUKdKXbJEE8f4Aj22qXk2CrRgk
         9L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918956; x=1792523756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAiWr2qQ//z0iBACrzomuihaSPDdArLye5ron8Ml9Ro=;
        b=m7zAm9JCzxar3L1c1HLuuji0Gf7SOO0JdGjM3CGKK27dG7sxxX6O/kkUNqBAuQvSgk
         FyA5I38UrUKtDPaPuxq3B2Rnk18MOyDcq3guIY1hNgo46RGTV3TqIuPGFlt5942JDZ1d
         U/W+RB4TaZESg5+8yyaye463uYyhB78YEwOZlVfIH1XWWucl+t/tIHB9RAlNDPa14CqN
         sZRKzEQtC7IBIL+Io4VE74WvEAufQ96kzrFR78BX/VmqucnQmmOLqwH8kSunSMGD68ET
         +3zPoi5sLURMvDpH3ww3AruKRQtN0H79tSJRld+aSBChmardju7IVpssC9oeWCK7aNY3
         MBIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7Le4cRIiPCTEHWSe1InUemSUNfe5AVn1xbXGSno3ash5uXlhngi9UpsuGZOeyaACSykBrQbVraZqhb1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlTT8ZxTU/ddQz0u7C/AIue7ga26AizaSWGbCdnKOMizK80UrN
	FNPaWQNC0yyMDtTERPBZpqhXLh3CB+bdaz1/Vcu6dMRoeEYSFEXPTFnx
X-Gm-Gg: AYBFou3qsDHyiMlg8XjEJwwuoLwU9all4SWo5sNskA9eD2xS6HjQW6YOoYv4Pd1CdoR
	T2/NQtSy1JcAdyNv0Xa2cglRn2fi3CSlQ5FGSkygxHRqcf5GoU1DvetNqdMTr+QzlfyraonIc7w
	xQ2vgLBCSr0hSzFguwddqdwxBKKs44OYb66L7FL8FuGnJK7r+RoDwIEzXOc1Cwz7fvUuTVnfYva
	l/pSPmAMcq+BtewZ5wT0gSFnpxyxkwANhvM4d0rxcpUob0vKqUtALPGS+D/qhTZMIKk1OC+Emke
	TI27wKToecMBGAvtlqyjOYnQ0FePEnBjGQljOPjxd2dc0hh+RP2aw/d+Z8qbBgNrmSClMtoC74c
	yD6RIYM1QQHUgt16LX4ocuaZW1WXM2yEZKGkJDDf0NEuN9HWOH63h7HwEXPG/0DssXXOMEPFf9z
	Psi8RuzIOY8005uEY5W0HMUVvLWVirZagMFfGdzZilsGOVjW5R47x2aSbhJqTiT1U7thzJmgbiK
	A0UcJWA
X-Received: by 2002:a05:600c:c3cc:10b0:4a1:a7f8:c12b with SMTP id 5b1f17b1804b1-4a1a7f8c219mr58730485e9.19.1791918955848;
        Tue, 13 Oct 2026 12:15:55 -0700 (PDT)
Received: from fedora41 ([37.168.42.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2fc4724sm7229275e9.2.2026.10.13.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:15:55 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	guojy.bj@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v5 0/2] staging: rtl8723bs: clean up phy status structs and casts
Date: Tue, 13 Oct 2026 21:15:01 +0200
Message-ID: <20261013191503.152056-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Now,

This patch series splits the v3 patch into a 2-part series as requested,
separating the struct renaming from the cast mess unwinding.

Changes in v5:
- Rebased against the latest staging/staging-testing branch.
- Resolved minor merge conflicts in odm_HWConfig.c.

Changes in v4:
- Split monolithic patch into 2-part series.
- Removed dead struct phy_stat and unused prototype
rtl8723b_query_rx_phy_status().

Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through
the call chain to remove u8 * casting.

Regarding your question about the existence of struct phy_stat,
I discovered it was dead code; no function actually used it. Furthermore,
the rtl8723b_query_rx_phy_status() function prototype referencing
it was also unused, and was removed.

Patch 1 renames struct phy_status_rpt_8192cd_t
to rtl8723bs_phy_status_rpt.

Patch 2 unwinds the cast mess and propagates
the real struct type all the way through
the call chain, and removes the unused phy_stat struct
and ghost function prototype.

Timo Joannin (2):
  staging: rtl8723bs: rename struct phy_status_rpt_8192cd_t to
    rtl8723bs_phy_status_rpt.
  staging: rtl8723bs: unwind cast mess and remove phy_stat struct

 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  | 215 +++++++++++-------
 .../staging/rtl8723bs/include/rtl8192c_recv.h |  18 --
 .../staging/rtl8723bs/include/rtl8723b_recv.h |   1 -
 3 files changed, 134 insertions(+), 100 deletions(-)

-- 
2.56.0

