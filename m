Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361767;
	b=WBo0x0E4wKU1AQ6Qa5uhxZUlQUbUSate3mCKd3X6KCoHKGdUVtJ/Sc/9+oCMxq7LrNkn
	 DNPrPp7fX4E/9TiQQNMcQuvIjpCoPenq5zZqP5IBNxhGqelnv39CEQq67pK3zzcqdto7U
	 JQyB1QxLVJDa5ffvmXYX9o/MxenFF6NKIdgP6wfGLW9e58fEYu7rH3e412fNpmPImJJiO
	 eaABuHR5Zcx9j0c98e0gd++nA5QiO7PJXG8HuwfJJP8IaZmaXiDTdHeNLGUMAyEtgD6mg
	 KAlR0CmJYLqlIZNZ6tyxt1DKtqqeyoiUiPA2D+Jm99ocT3ObrOBsIEs/mA8Eul+x9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1PqmSpniIkR3UNsRisiiNe9YBl0Z5BurrhZSnr/D9fs=;
	b=1D182iZf6aIzZ/PByhIbY1Cu0uACAwG7e8Xi0U47iclazyfXFjnIj9P+dPX/DeL5YjFH
	 Y3atW/wSFDKy089+N3YrMQkAeE0OSqEFHpkOw/wNSqacP2qUKsleo8fvB/bmNcPxr+XKR
	 zvsqmwdgWXRqK4tgi/B5tHdSH9bhK6JFiFDPJ4WOb0vpcbnfAtt4f7sv3s0DQQ+WyLJPR
	 S2QBPpi380P7kVS8v1Q43ImoO+l2u2Ey4SO/cuUVSfJid9PBRAjrKAl+lLrXAGeIEEHFu
	 C3spDT/T9bRR1MxQK0FujJ1WikwcNJhi2vsqItMuc8UvLAl84UD4VwWJKUKr8SZ5l8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udEfknn1;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E1F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udEfknn1
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c169ae1cb26so279890466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361765; x=1793966565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1PqmSpniIkR3UNsRisiiNe9YBl0Z5BurrhZSnr/D9fs=;
        b=udEfknn1wJlB4xqoV0bydy4/81nYxIWfqqbG17NL2t82auW2v8g1Ck1GV1KAHqtoi3
         iPE1/vyGkYTFwx1DhqoW7/DrivEJFt/4R64Or8hlx7cBKdidrcjhqd85nsQkbOC9bm5L
         PKxE58oyVBXtjwzRWgg2dMI0FDol7SvtTMlXeCuIjSeBxJl1poq6V6uiqPazByzqVinG
         ITfK6mA9i2Ap/6jUmxhaqrMxN+g8Cr8baVjzt0C/xcypAOJW3kxM/8ajiJZtJDXxcY8F
         59RvhutyWZaV1IgayYOB2XuxDXbnczkLrW/rDrBe7vjGvQRCJ4ny/39LlLeZ+SQVYBZ7
         gZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361765; x=1793966565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PqmSpniIkR3UNsRisiiNe9YBl0Z5BurrhZSnr/D9fs=;
        b=Ojy/ktXDxfFVfn5+hUSCLG6wFut27+M0tQRd06ZpQdWH8r6Y+00X2Jq6500/rquEbO
         Xb/1bV3h8qJDc/cfOXmVbe4AEvgrTEjd0KGit2vejYz8OQ+D4eLTN20/Ld6SF2O8dSqD
         sW7EaUsRfmZEOony3f4AUapcc7X16klnwMuvhiYejuMqIwptghvuU9eC19/0RdVjaTBQ
         LHNsQzjK60gT9QDr31ina5Z353mP5WB3XM1+8aoGigDj+cSxaxdZrBowbwAF9cP40Vch
         Jc33HDuvKTzRicGVvPaLLEyCovrRsfApT/4hZN++36D4tegbdFoNHxx6RXMuVB9CAucV
         NCow==
X-Gm-Message-State: AFq9FYLca4PEV3nCGCfdPL8feXjJec1G6GAO9lhEUCe0dtrE4JNehaKV
	bPGi/siuYVNGYvx2yNLw5u7dQeESeYrdePFVS8Boricls6mDzrQGw5KohzLxHGlt
X-Gm-Gg: AYBFou2BmfpJtCxtTCHZtsdOzvGohv6UgelUF1Q+z3HjWt+frd3AytovQel1vF3jep6
	IbeyRcsBcuiJAzksahYk+xg0TARM+fqfn2Y5lYCXE2TbIX44IjQdA917NzavXBWfhDLqr/Ym5D0
	PbvR9BKPAd0mZLEI+gDszouW3p685Nl8Izkw8InfaIO0OUahYt/iwOWuGe6XlxaLAbkYZ3eWRAC
	A2iZCdzgyM3EGq9WSf8QYBBilEOBarj+5BYnBl/uUwsK9fKzYWReih9x4c3gTAkyzONxFu4dmc9
	c5Ox92rzSWMqthzhJdTYOtPUd0ilx9C/hq5O5ngKphydoP22dn1pWlIApatbsZdQPxgV5YT5PVM
	GSnQpBi4jT9iXocff424LOU4+Bwk6B1Tf3+kqqjgPqJrkPZ8RIGKKRDqogdNlDOFajuNd1ZhuFy
	XmMEVE6S6akFJ+edcROvexPNAKATg5qb4aDuS4ob1Lslk1V9Z9msqR/HWywVoqyjK6dGGOGUIBd
	rDqzUwr0kYjleRaaJjxuoEaFGrjdrthT28fZKzJGx+sJmp8UGYAull6dRNxfO06Rjuztp8Bzt1z
	6yYApxmf0FgWN6sfgjZ7SzOi2rxb+6UcwYWg
X-Received: by 2002:a17:907:d489:b0:c41:4512:a3b4 with SMTP id a640c23a62f3a-c49d13b6aa3mr501078466b.20.1793361764836;
        Fri, 30 Oct 2026 05:02:44 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:5a44:fb2c:3845:1154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm2807786f8f.22.2026.10.30.05.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:02:44 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] gnss: sirf: keep wakeup IRQ enabled on failed suspend
Date: Fri, 30 Oct 2026 14:02:42 +0200
Message-ID: <20261030120241.2313517-2-thnkslprpt@gmail.com>
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

sirf_suspend() disables the wakeup IRQ even if
sirf_runtime_suspend() fails. The PM core does not call
sirf_resume() when this device's suspend callback fails,
leaving the IRQ disabled.

Only disable the wakeup IRQ after a successful runtime suspend.

Fixes: d2efbbd18b1e2 ("gnss: add driver for sirfstar-based receivers")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/gnss/sirf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index 79375d14bbb67..2ce96598bd4fe 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -354,7 +354,7 @@ static int __maybe_unused sirf_suspend(struct device *dev)
 	if (!pm_runtime_suspended(dev))
 		ret = sirf_runtime_suspend(dev);
 
-	if (data->wakeup)
+	if (!ret && data->wakeup)
 		disable_irq(data->irq);
 
 	return ret;

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0

