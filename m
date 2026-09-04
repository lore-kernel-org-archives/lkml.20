Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACB48B38A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525406; cv=none; b=NmMcPLYFmwS3UYUZBbJCAwMWL+zIlQ1Ax8ofWyN6JB8oeN/XKyUhES4fqslaqIzDfKdKCqJASHaxSrskyXrz1mAQu7Lrh0Yvm+svqMpyT4/OJaELBolTClTEQWrOOAsW94a507fPy66YWkbMKkvXiM5brsZSGi4Ajql72OPLuf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525406; c=relaxed/simple;
	bh=khisnwFFvN/2OJ2FVddAOC2MAXCpJGTfJKAU4o+fUSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZtYoOLQCJq8fz6IRsI4s8BR0/aXvyDCxruyYynTeKKVUAY4H3nM4qVq0VhcqPRUOL+axR6/xZ9m+l76sr/7xnDCKFUEOuXa3/3pfjULDWnwgiIBsSOR6vnNkTt3oB1od6SLRd6AjEDyDj0OYInCfrppZK7b8LZiVToNICdxADjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWv/XYCD; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWv/XYCD"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aca0f482e5so928699eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525403; x=1789130203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDcVHRiCcWITb5IJ0zmLWKIunogWiUsp5pyOEBRgLns=;
        b=FWv/XYCDTi2pJO23fuwwwUHKAafFGTh7KjHSoeeLXZN5ky06zxvfC1E6HFNDp5hRT4
         LvP4Duea1HH//tR1Ya/dHiEArbc+tja03zLW32uCjg7Wlt7OEMUBE7vDTFT4aHIIeU5U
         jq+bkSmcdloEaWjweU5xnzPI6DKbNwrtG7dv1MtKrD1UIB+TTdvNYf/VX67K3WxnGYaG
         usT1nVk8yW77gUlBamHXkO8UKvM5E1yciU9ecx1syBBfCRnbjGdwXf9TdSr+vSS4dE/M
         RwmPz9J7pR6rejCOV2KiMHWI0SGEoZ/E3lFVNgsRqFRSQegI7aA5uCxtbkl4odbT155Z
         775A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525403; x=1789130203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDcVHRiCcWITb5IJ0zmLWKIunogWiUsp5pyOEBRgLns=;
        b=ETU5Wa9rOA1Ii8Oy0qSiaSEKQbicUzBLQIdL4Qa9WRXbwYP4GPUxEkcJcoN4KpEEI9
         6pFjlGi2v54ysY2FnzEtoqYkgVJgC0/LguKaQWBMBFCaHcQIdc6LeboxPl+PVxoOWZVh
         5cHLhusOJhYpbqLnYyQFJapt67GYob1GyJTxQIyZNinWmbuEyRRMk6tZi8HiL8RWZV0D
         YgXtChGz84fgfEf0bhL3cxeZTSs+cUo+yHWBCbLafJ/yRN56iLtsfR5Dr+6GeN8sry93
         WqG8kKe073LCNBOjPhfWuWOjboA67XkPJrpOEMFrilbXtw2TERXMxjNIqoYsgDiQS3IB
         CLVA==
X-Gm-Message-State: AFuF++kvOL74AYkUfRbcy3EuSbY1wJfAE9mPzrZ+6VE4+SiU9dO+Ac6E
	laiPLAhgNjEQqJN7s2Dr/Z05r4aNhANhJ+gzTFeim1D5BXlevTUE6AOx
X-Gm-Gg: AYBFou2MbQZUayAbBSPtKMK9tpTfWBqRnIn6fafDzi30LaTpkB6Pjmq5WuhpHKE3Dkt
	HKNE7lNp4ZrCR22MR1Yz9HB5joFBv02rDvM6CgezyMGL+S+7nWB3OJ/PwrQZiO/AGp/mtZzVfNb
	Ys3OKrm50lRT5oCDTwBI65h3UamruKqi45lVd6lVArjI0Ahmcg7Q1SYXwSa7mfsge2eAF7MWAtj
	XkRpZ7fckL72kw2zqFgS9psP0yncMiYXKN+OnKAlD72B4TPWmI9jDFVvGcxKNHGLQkwYblY7uwe
	E6V/8YrGFC9/27R1fmJcck943ehEucJZqpFYkGnZy+4IYnjsrdZlD1Y5n5OEoipFPRgO4fbWznr
	4k9gSyVCB41kFfQToIIutCKgMZg9BlIID3uy3BjE/Gipk1jE1jDFGcicURgOa+8uIiVVkz9jVTo
	8diyMqlVR3eJ09z2YCLbMhVKOIGhznQK76EG42dIogNbWYCaIF5B9aB09HfdicF5IvRFR/dNWXX
	/YwwmtN03Fk4HU=
X-Received: by 2002:a05:6820:340c:20b0:6b7:8415:d79a with SMTP id 006d021491bc7-6b78415d92bmr1050204eaf.69.1788525403582;
        Fri, 04 Sep 2026 05:36:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6480730c88.10.2026.09.04.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:36:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chas Williams <3chas3@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org
Subject: [PATCH] atm: fix typo "protcol" in comment
Date: Fri,  4 Sep 2026 18:06:37 +0530
Message-ID: <20260904123638.39273-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "protcol" to "protocol", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/atm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/atm.h b/include/uapi/linux/atm.h
index 95ebdcf4fe88..7a3789f39f52 100644
--- a/include/uapi/linux/atm.h
+++ b/include/uapi/linux/atm.h
@@ -39,7 +39,7 @@
 #define ATM_MAX_VCI		 65535	/* maximum VCI */
 
 
-/* "protcol" values for the socket system call */
+/* "protocol" values for the socket system call */
 #define ATM_NO_AAL	0		/* AAL not specified */
 #define ATM_AAL0	13		/* "raw" ATM cells */
 #define ATM_AAL1	1		/* AAL1 (CBR) */
-- 
2.48.1

