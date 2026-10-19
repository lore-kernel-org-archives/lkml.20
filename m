Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4424E4C36
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414017; cv=none; b=Tpp34m8JBaXUmEfPhTCNRxBYReiN8Ixbaw1tu0e5OcBhMcvb6gj3drk25G3d5UNfoP34X6IjO8Imp59Dw8HM27nDZiEJrkUsjQlFGuagwfe6rHCUq99MVo311QX6hREvjV7Du9phTWEMIgBE3V+wGxSoXky56ZUYsNfTN1V3nG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414017; c=relaxed/simple;
	bh=Jov0+Simi3I3FOHtjQcK34fUjAhjZvkzg9NeiGjSMJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YrMsLvpjVhG/ezCmJZOj849S60yPo9rEKLqfVNhpUD3MXy+yypASceXwBjJ2955lQfM94TKmKxOEDMyWIKp/Y6MTbS+rKoROG7G1NKMyHoEw0C4vMAV4WAJ4KXVnNX+EDqg/WexPkesyAejqFBKlXJ7oGZ3KYgTW5Jhc/Fz+5Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koKyZ6aQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koKyZ6aQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1711935a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414016; x=1793018816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T4dpTCgBomTD6eEwaA8Ybu6I7bQ2brZD+Mi2z7v1XE=;
        b=koKyZ6aQWV5lYMb5emBBvcmJhGYW9Cms9bOchIlGLV1Gu5fLzbiZ42bLlsCAVNVhZu
         5nqohDiRyf9ilDsHB2hQpsujAZi/ak7MdKzMp2Mep76ncfam6Iw0L+1tBTSsTORUMiuR
         5Ew8Y8UvCIVAWa5YjUC3BdkteRdWHHZFscsPXwcvC85nSvKei5oudi/i1h2n7foJdl1v
         HN5C25lh0VR5JuujeMyWmP49Bc3tHbgGIha89FU/uS8iSJsnRgQTblJugAk3eInJlWPq
         S+HqkWE/3s7p57pUpfJ20Ow+cLiezSm6RUxctGwkXfoFlLfIGyu5/ZPDLmMjuvfQUvrL
         5WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414016; x=1793018816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T4dpTCgBomTD6eEwaA8Ybu6I7bQ2brZD+Mi2z7v1XE=;
        b=UZg0Wxb3JC765H/UfMPkXswuNKh0T8xKBHIbQAyJ/4cisNKUzjeLtTzmnxEnI0ZtLl
         koDBgJmpOqzXdP2AplHlqPBDO9AWPOUYyJoD97wI+yuhT+qKwVH1UpwiqQRPO71t+eTK
         nmJefMxOqWj+pFCWlmn0EmiNDYEAAUgeWH4V+TPCXrR8AWBj7t/S+jp9UN8RZO2qoUyQ
         pb+D3sAX5aRHar+QGUbfQ4pcGESaGJINjdsLOGAc7IfClNELlLODPCKNVzDg0cSrxuGL
         UJ/QzrHG/L0NCWJvRUVWW0+0HyWIlWzPhoc8Ea0zN6MYrgYD00TMwpt7avdwboo/tuvm
         RkdA==
X-Gm-Message-State: AFq9FYLqepkUJFHzUm56/9x9ZrBmCJaaduiokfd3HTxMnHsJ8xYrTzb5
	/kvivYOGTwB6mvFz9C1N/xCBIRvHwP9fV4Y9jnxC3iF+5+FBimb1CbhJ7/EpZQ==
X-Gm-Gg: AYBFou2boi66Ho3tv7h27F/kJP0W6WTSVHln3Rx+GEXu7E/NpFym5QbrpH/+TMNUdR8
	BhPhEPNpa78OYyHxtsBda07T6rPeIluVoK8AYuiSPJkNedUuo5xcKoiRa0fgUDX4cNWEmgxSSZj
	siQTnQvXzfROeJOeAoz64q3SAfvohyBFU0h9ZB2N7iDY+i+FjMA5kAY2AeM6jdMnG8aLPIHXrmo
	SsHiKA3Qc3RQG1dtfRaoqC0Nf30UqV6aMmaL/F2Lz8z1TrBdEXoGfH/xWWDm129btFn1newKtvX
	0njFXcXr6nb81qnfmxUeG8yrE7Cho8SKApfTO5AUGyR0tONHioHuUwHbs3TkAPYrWp+6IW1BshV
	ERqhZQqW+uO2XY8Z71w1yioCZ1BH0ZcuotNcUrIMgO7V3rDloA/7tLZgqELQAzr74/b6MxfPWIk
	FhjOmTfE7CLNO7c4nadbsrBlc7Vv0MVk6vOixAhJ0cXAfzvPOykBOKPiCWAH7QoSE545f1rTTOo
	Zg=
X-Received: by 2002:a17:90b:5487:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3acef0c8743mr7123863a91.31.1792414015871;
        Mon, 19 Oct 2026 05:46:55 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad48dc2f1bsm1729020a91.4.2026.10.19.05.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:46:55 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Do not access MPAMF_ESR on MSCs that do not have it
Date: Mon, 19 Oct 2026 20:46:12 +0800
Message-Id: <20261019124612.134035-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mpam_msc_clear_esr() and mpam_msc_read_esr() read MPAMF_ESR
unconditionally, but the MPAM architecture only provides this
register when MPAMF_IDR.HAS_ESR is set. On an implementation without
ESR these accesses reach unimplemented register space.

Read HAS_ESR from the IDR during probe, make clear_esr() a no-op on
such MSCs, and have read_esr() return -ENODEV as the register
cannot be read.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c  | 7 +++++++
 drivers/resctrl/mpam_internal.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..a473b2872183 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -388,6 +388,9 @@ static int mpam_msc_clear_esr(struct mpam_msc *msc)
 	u32 esr_low;
 	int ret;
 
+	if (!msc->has_esr)
+		return 0;
+
 	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
 	if (ret)
 		return ret;
@@ -415,6 +418,9 @@ static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
 	u32 esr_high, esr_low;
 	int ret;
 
+	if (!msc->has_esr)
+		return -ENODEV;
+
 	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
 	if (ret)
 		return ret;
@@ -1205,6 +1211,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 		pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
 		msc->partid_max = min(msc->partid_max, partid_max);
 		msc->pmg_max = min(msc->pmg_max, pmg_max);
+		msc->has_esr = FIELD_GET(MPAMF_IDR_HAS_ESR, idr);
 		msc->has_extd_esr = FIELD_GET(MPAMF_IDR_HAS_EXTD_ESR, idr);
 
 		scoped_guard(mutex, &mpam_list_lock) {
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..b648c006e102 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -80,6 +80,7 @@ struct mpam_msc {
 	int			fb_id;
 	u32			nrdy_usec;
 	cpumask_t		accessibility;
+	bool			has_esr;
 	bool			has_extd_esr;
 
 	int				reenable_error_ppi;

base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.34.1

