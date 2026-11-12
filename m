Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507087;
	b=hTVg2vIWBgaODdHUz5F6Po3U8fZP+hI7wS83npyS9xoxbUCFLn7Ibyq7nMpJAnnRcMGK
	 UOEw6sVfP6feiAHLCptD0p7v9b+vmZsSXpmEHZJ+euTFbxo+iy4/bchqX7wg139opm/OB
	 JZgWFpwK8eWeinRz90HQwA0SM5torUXkMVwYSgY0nZg7Q6AS8PaxoUr6vt8t2ZnLZpTzO
	 Eb49QTLL69mkPyIfvQHnSO3TwGecxEkGWlihCl9LBP7lWHl65E5HR8TRGj2/7T2cXsXSU
	 ki9PNolkfWR4G71ZfWEWNCryHaTAI27ggFunXE/S0FKdDnm0uGoKBTxCBJ10oG8Y0Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5w6mqCTcKdMQ0+HIJVXoAnc5nRWigyCX9Zocs+ktwwg=;
	b=VWrN/LtNX/YwhSIQMZSZ4dhqBqf5vpNIlMSVYRXOH0VDJu2nFQ4Z23K3WCvMXc7cbbm0
	 w21HE/uEJGgY0lhklgF+XiocymdvCoGxyaPI5LBpWf1FwQZX2X1rpA3aqG348IM0HFQsA
	 UdBTmcsDmAHSDWWiMwWq/7BHx7qtroYiVWa2jwEfVWuqmw9SWCJzZ+iuVoUGjrzXn6L8v
	 yQGLsGuxtMBbxEQKOijOxuaSYCEWTrYs7tnblVbHhVoQg5sVt2k4m6R7skcf9O1S3ggW2
	 SpGOsXjxJnAJ+8+hQFMy8qSox3aNPC+DccN+pENwHfQwCNOCYdlvhrjqa2dbbRvTMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svauu2uo;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD4606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFD4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svauu2uo
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so6877947c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794507086; x=1795111886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5w6mqCTcKdMQ0+HIJVXoAnc5nRWigyCX9Zocs+ktwwg=;
        b=Svauu2uoxhiMPDBRZNt90WK4V5W/BE2SlB4TIRuDa97xUkqbp6gSpm3HPMMWTdl0NC
         Iv3BFnhhVZE4SmzoH2NKoe+rAjZqQ+94jo9VX+j1J1MUASZXW18MMAs9Y/oF3m4MRPOq
         eaMGSY+qnJVaNrFg2mIyZXLyJ7aYGYjDlryrjgll+hK3zuBNsUyAXRVbSKs1MxYAwz5K
         gZJnAwRFKcAKS6/MJ3TtFsil/yqw/fjrtXD0GFl/d1EIxRgSQRAU82/YkMeRuA4kEcD3
         ql8q9CS2zjxmyLQZOQmCXVH7JI3jOwEmSiCo4WZF5jyLNLViWktJhydEgb0pXJYVhZBX
         43Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507086; x=1795111886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5w6mqCTcKdMQ0+HIJVXoAnc5nRWigyCX9Zocs+ktwwg=;
        b=ZIhIozCPpWInXZcvmsncYhQt/NG3V72TXzso0YLfXeboUM7OMBNIQHG27SCDf+t/re
         70Ug9UkFKsa6/tL1na5s83NL3Ea2V//UDlpzRW9+lbYUWo1V+tKfKNxxGjFVAWuTf14H
         ZgTA/fluJrqIJ737tStYlrRjpT6VylY2MLwddQRD85VEgQTJKkhRaDagkTPSgroD2V6O
         fwo7ndugumA20d99k60MZHSakDWp7Qs6B+NI6oMNnUB4RZvmKIqphUdMVPQAjs8UA3lY
         v0I6eG+UykICYfFrb6m1pZfOXJzYgnJcbmzWPZF69oP0EZdJSLOPkBocB/EzT7HmA4Ur
         uojw==
X-Forwarded-Encrypted: i=1; AL+hErFwnj25+z1g8DYdthA3UPKTKUgGrdObxjjuGw3OsMkDDSZ6v5bwqrpAWwAsR/BLM8+XALt0lbb19dAvVOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tia9xP5sdNE5wKFb2t/Vtm6mPF37Is7pWeX2DMU3OR4jBZrK7
	vEnKd2U4cXqcKy94SnxFcp205TywF+SUK9+YRWo25oFxBEbXhynsHpjA
X-Gm-Gg: AYBFou2ZaLapd/KCZnw0D792QhzmAxxzYRyieGbsWh+Es2HC0ynzu95oRxfMihvc9zl
	pvNczcBhpZqSlygMPWQ3TnaT2qLnfXKeXlQFGFZZBgvH9ZPqkgU66MinkDiGJvJ+LrsRyXSg4g0
	nL1FiTuHG6o9m6//Vdn2EMhflNmPa/TJ36dtPaS1T9jVIWFBBOZLHnAjnW/R2/gA2v9FrlYXwDp
	s17wE3TRSsqloBC/rvIsEo/Cypr9izag1u2U84MFvDyaJDtUxyKD3vzQ2iuro9MLIBoBBmGIN9E
	Pt69choEM/d+oLtKf/Z3aRj48hifKVKgXJZV0CGsMIJgGdtSYfQh7c7pWlkHFdLjfJlWoPfwFQ3
	r49nULA+2ltviYEk8q8rHGHiskhUQaf/jDmWhehsksmsJlEV1UR7PiWrjuqlZdD+lkxZH+PQnQQ
	9NAEyZLuvP528HpLTgDYp2WBrI8/g0ZwGH+bGOnbZ0aSp1UemJ7Of3KS/eYt91T2iH9hlKv0mjq
	Qs+g32wi1dFMc8N2Xi1Kh5fGiJ2s7s4vzuqT0zj0vy7zKkflDHm91bTec+jk9jJGOFdYxTl86QJ
	rrRtvMeLvHqrTpvTpfbNZKgeKRih9jWXdoeFsl716Q==
X-Received: by 2002:a05:701b:454e:10b0:1b3:ac34:bd59 with SMTP id a92af1059eb24-1b50316df59mr233084c88.45.1794507085868;
        Thu, 12 Nov 2026 10:11:25 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm215678eec.4.2026.11.12.10.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:11:25 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH v2 1/2] i5000_edac: fix slot number passed to determine_mtr()
Date: Thu, 12 Nov 2026 10:11:20 -0800
Message-ID: <20261112181121.565824-2-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112181121.565824-1-andrew.luebke@gmail.com>
References: <20261112181121.565824-1-andrew.luebke@gmail.com>
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

From: Aristeu Rozanski <aris@redhat.com>

When the logic mapping branch/slot/channel was reworked back in
64e1fdaf55d6 ("i5000_edac: Fix the logic that retrieves memory information")
i5000_init_csrows() was not updated and kept passing twice the number
of slots to determine_mtr(), which leads to acessing past the end of
i5000_pvt.b1_mtr[]. This was found by KASAN.

Fixes: 64e1fdaf55d6 ("i5000_edac: Fix the logic that retrieves memory information")
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Signed-off-by: Aristeu Rozanski <aris@redhat.com>
Link: https://lore.kernel.org/all/20220921181009.oxytvicy6sry6it7@redhat.com/
Cc: stable@vger.kernel.org
Tested-by: Andrew Luebke <andrew.luebke@gmail.com>
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---
v2: no change

 drivers/edac/i5000_edac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index c0faf55f7812..342b69909600 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -1253,14 +1253,12 @@ static int i5000_init_csrows(struct mem_ctl_info *mci)
 	struct i5000_pvt *pvt;
 	struct dimm_info *dimm;
 	int empty;
-	int max_csrows;
 	int mtr;
 	int csrow_megs;
 	int channel;
 	int slot;
 
 	pvt = mci->pvt_info;
-	max_csrows = pvt->maxdimmperch * 2;
 
 	empty = 1;		/* Assume NO memory */
 
@@ -1271,7 +1269,7 @@ static int i5000_init_csrows(struct mem_ctl_info *mci)
 	 * to map the dimms. A good cleanup would be to remove this array,
 	 * and do a loop here with branch, channel, slot
 	 */
-	for (slot = 0; slot < max_csrows; slot++) {
+	for (slot = 0; slot < pvt->maxdimmperch; slot++) {
 		for (channel = 0; channel < pvt->maxch; channel++) {
 
 			mtr = determine_mtr(pvt, slot, channel);
-- 
2.47.3

