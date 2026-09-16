Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61433C5DC3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580924; cv=none; b=VnxW45kNHxOxUSOzKln0laax3X4t04YR2IVN7zNN21Zbzf7KpyaIxr7HCpLh+uTu0hxwAtVSYd3Bxepp1mWRGnU3il4JU3aE7coiy/O5BUH89nURvQ9jaFPGugaVUnzM/+pGmxv3j/oNwZ7o3zDYUPj8gKc+M7thqdJ1XL26Pj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580924; c=relaxed/simple;
	bh=+vIwzo4msujugsXFCGy5QX5SHs48k4fQUJ7xFketJDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tsMBevADTbfFbPHQuAcwYu4ietV4zC/cjFCfjlnzFXQaQU5Z0tcj/fY0T/l5a5LDXNRdaiq2S8WI2CleIJGtSkGcv0Ij3ZSbqeEdKqrUfsTQ1GcI0aelxmPc44C077ScZXGkxs5K9H2ER0guk7JRh2tjh2uhIM30ibinkr5WupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLFbC/L4; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLFbC/L4"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso9993415ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580912; x=1790185712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ciw62Au4z3cCL9AXn9xKBi9eQI9V21YCaEIEbyMxkvg=;
        b=CLFbC/L4GkshXKRiw3qFCOnuiMhpPTdln72fCI8bSjmTBMT+TlGk1AEcxZbHm7oOG7
         A+YoegdPAlbNbiA/Wj1fBPyaTf9kkzt3CyVIhqRmugYGmLLaFqUOvEc5lZ23/blRs6wG
         htMcIHdJClDUJ5U8v4+eD9ls78J2+BGc/tdiPg6lsPP1qY/JDL+HCC3JrrMReUC37wRM
         sosUjlvZOmWI1S2KOhn9TBExlxjYUs2qx3ngg70wXqfEcSt3lfLBCfIB3iAQ9F1MRKRG
         4rklX2vq0l9HFks5NOZO1I3DFK+J13fCbX62OjAk3Xp9Jnu/1d1BOyXrQ5Dae7DTrjhG
         et5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580912; x=1790185712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ciw62Au4z3cCL9AXn9xKBi9eQI9V21YCaEIEbyMxkvg=;
        b=txCLoKp256jREaxxNKKuT9E+v6D6lwCeKArLvaSDBhmvpOz/fTeqExRGFvFGWb/Cse
         plKQ3kU4OflyHB3NZqh9J8ahh6IfgwQ6IdvHDtvwYk/JkGc4O+KJsPW8L2BUliw4wLzA
         UOW5UZ5zt8mG8VrK9Pk67tOlmVfAW/2rJgpMDkrLcUk7Shh6mW329eVfnLw/KkqxdPRb
         JK4y9cKJ20F3LEuKz61837y54IHYNALzZVUpqOF8ta3q+SQHi3OYGZLkN0jSCsgE1etd
         wi/QFmeYjDtYQXxsMucMSqDJ5jj9nVOaEGhxgVhBqtwmkEWnfHEnpI09sjL5uYcDvduv
         A3bw==
X-Forwarded-Encrypted: i=1; AKwUvByAu8UA/jl3mHbi6HYgzbx9inUkW46j3vCTaJHzt/OIBrrtNC4UAFVbvQriQaQ+lEpI0TXFUY1nQH2BhNE=@vger.kernel.org
X-Gm-Message-State: AFuF++mnDvBI6VIUSoUKIutY/qK+S9vh4PEsU/P3+8dDd1kQQTf5IK6q
	rHhfe3O1fvmWG508BvbaGC8XV3WFinJHAlx0lAz9QspCArqef/JlWeZF
X-Gm-Gg: AYBFou0vwGVN9CuEdw3T4hbbKIK5TlZrNX7Y4mlWpk9OsulBANEOgFQVZbRvVV5CXqk
	UpukejbyNZplHzBYWyVqppMSVwHurgNOH/SRO9LNzicCQNhHieFmTeh+vE00vB4UbrIdfFlnc3W
	/upnDCVP3IfwN9dYzoMmc9no+WGU5CjXUPmzAOtInPtz2NsCdadJD7I/Sxsk05H9hPB3mkAFOa8
	MD4Qh+aaKda/XCpGv8WWxFxIvjys2AaFr+esChWUT9WLqt8v0g3LA/oeQGXZ5TK9LozjmFfIcJL
	SNdGORWz8mSObPhLmqhHwPXAdowAK1LsfaXTWAn+XMs5i9K1mTlSbYmn2iwhngbwy0y1z94hjaV
	W1FB+iCNkz1lep/5xUQWN80U5CsMA4rbpGSeejOHJ72eyBhVc4Ds41VzKekhbuL3aA+rePcy6mj
	VeYOdxgVeMb1v8kutl+H1zbtEwoX1JGsdnML/18HJ1Hkwm7TmRSbN8mYswB8aWX1S1yFdNZtdet
	X2E
X-Received: by 2002:a17:902:e54d:b0:2dd:76b1:3509 with SMTP id d9443c01a7336-2dd8e4109f0mr73936685ad.14.1789580911662;
        Wed, 16 Sep 2026 10:48:31 -0700 (PDT)
Received: from arch ([2401:4900:ccd2:8875:9d19:1309:9e6d:8926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89edef89sm15916075ad.49.2026.09.16.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:48:31 -0700 (PDT)
From: Daasaradhi Mannava <daasaradhimannava@gmail.com>
To: Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daasaradhi Mannava <daasaradhimannava@gmail.com>
Subject: [PATCH] platform/x86: msi-ec: Report valid charge thresholds when unset
Date: Wed, 16 Sep 2026 17:48:12 +0000
Message-ID: <20260916174812.11496-1-daasaradhimannava@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The charge thresholds are computed by subtracting a fixed offset from
the raw EC value. When no charge limit has been set, the EC can hold a
value below range_min (0x80 on an MSI GL65 Leopard 9SCXK), and reading
the sysfs attributes returns nonsense:

  charge_control_start_threshold: -10
  charge_control_end_threshold:   0

Both attributes are documented to be within 0 - 100, and an end
threshold of 0 wrongly suggests that charging is disabled.

The store path already rejects values outside range_min..range_max.
Apply the same range to the show path and report the maximum threshold
for any value outside of it.

Tested on an MSI GL65 Leopard 9SCXK (EC firmware 16U8EMS2.100) with
the EC holding 0x80: the attributes now read 90 and 100.

Fixes: 392cacf2aa10 ("platform/x86: Add new msi-ec driver")
Assisted-by: LLM
Signed-off-by: Daasaradhi Mannava <daasaradhimannava@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 566dfc73c..1762551e0 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -1279,6 +1279,15 @@ static ssize_t charge_control_threshold_show(u8 offset,
 	if (result < 0)
 		return result;
 
+	/*
+	 * The EC may hold an out-of-range value (e.g. 0x80) when no charge
+	 * limit has been set. Report the maximum threshold instead of a
+	 * meaningless (possibly negative) percentage.
+	 */
+	if (rdata < conf.charge_control.range_min ||
+	    rdata > conf.charge_control.range_max)
+		rdata = conf.charge_control.range_max;
+
 	return sysfs_emit(buf, "%i\n", rdata - offset);
 }
 
-- 
2.55.0

