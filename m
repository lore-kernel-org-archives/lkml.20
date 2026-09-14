Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062C3CFF44
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426394; cv=none; b=COVNavfwWZGGsmxlhzh3ax81LNm4RUXR15q8Je3knMCQnB4ODA6AlJQ8JGDe6v3HomZpU5m/bc+FUJVt4LxnKXc0gzqrtT1xSUftZpy8lxf9lZg51aTf/zytHVvVPPJujtf341Ge+s4FFE2riaIssYPFBi65zcgFAGJ9DH7VAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426394; c=relaxed/simple;
	bh=BiHA2LT7VXF4lmqoIJBRziOH8CBF0C2zrU9LI3lG4Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLEW9zF6/8fEnxFUChOHZGehkh4nwFR8HNbUdbEFmS+trjVwC1jR7+Ia2FcH1MdBdlqRh/y9pUkIGihVucgdmI8lV+zQdB/NM5qkIRJKImfzNj1zqHg5yJlYEMAnruIczNq8gEjTIQ4eDBY0kJa8th4uaeTCsj9TlcJ3cS1JsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Du2cWIiF; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Du2cWIiF"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso1779582a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426392; x=1790031192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1HiEFknvKCDeWKiMrML1PicHIEUqaWiAMUs85FKMew=;
        b=Du2cWIiFsr4HicHADRWDlAtd9D8PjVL9lUtzdW28DrgZabvAPYG42IodBGVI82I7YD
         9exlAMfIm1Smf0GskSm13WkEAb5Ztn+2VcexeQJTeD3xbz2yAYjSuPseX6xW2hSMsXLe
         qONYSKEtvH7ZONJjPtq89+lyKhI3bGfddD+Bb4UQncz/+TlmlApvo9S5pTAuGHXsrVwJ
         mUSK71amq4K+lxI5C3kep+BQmBzow8h3HeaXQH5o6KwzWO8snT7z7bkbxCha2YmZcP8v
         MMo9+2A2fevRuxr6dI24aNTwQSdvHsSZTZBqTQo7TVM+X9EicScmv+LdmCBaWmOFjsLW
         S2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426392; x=1790031192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1HiEFknvKCDeWKiMrML1PicHIEUqaWiAMUs85FKMew=;
        b=fvTyI0dJclDaMVIuHC5xJgcPZ6W2nXcumYq47AuNIzXv4vtAT6Kwl7js06RsNnyUVg
         pZycmX64ClasG4ui85E5FbGNHd8bzwNSrbxvvj4M1QyTB3e2buxcfGzbv50w1KIZmq1S
         VogACKhnh8ARWHVsxi/2eqQ3+arGh63bpDmYv5p1m+/DdpAGBChdVrT2TUWcp+8Dfsrn
         nvU4IP8vA4YNXaCCKTig4go1UvthjuuUN9wDabG1lu+UqOi+QnEHxRl+lZ3WUUAkJJZ6
         jp5bm26Rz5lKXnbhR0qC48TIFUzkJjix34dy8dbz1wgwitBraKyyzFkvEgDn/yyLvHrq
         Ziug==
X-Forwarded-Encrypted: i=1; AKwUvByThjacSlJtDrn3xOgd7fCWPFp/5gN9ddkeYrm5mvMPCuSDDnPOiGwS5c0yMqHqb+VKW6dcx/IoLlVyqJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++lSMc7mzOz8r7HQVuJ5Q3XypYsRW0XgRfa9Ha69HpBt+60MsrH0
	jQpZ3UD+VOCeLgKVsLtHX/mVL2TfKy0NzFcu3HdRLq5ApZWCehyaolFd
X-Gm-Gg: AYBFou2KC3npLdWfynyr2sfqLcB4p+UleN9nhufGwQ+7fD7cJf/YmtU2icTghP+iTr/
	3Gs8ugV8ciaZEdqVEub1YDNPhgLZg5GHVPVcZiF3Bjzx0oHXsz9luj00dhW6sAkGApNusGow4bF
	XAb1jfUVyrUjMUH0wDAmAfSrOVJc41sXJrr5tvux7O/Q4PAbl1IddC0LUh3XHK7B037Fhqm3BN/
	t0PzUEpENIzLp+AJ97kiMuBPRUhgHzI371baSdcOmCuayawcLz+LTU3RS1bxK8e6wcW01qHoydL
	8KLqf9VJhsOFgS1HpL3ZNGySmg7NZJRAEDbKFOieXc/qHla5ks5Z5jEPAzZGCmM33+WaUKzX5YP
	KstoqJ2xP0BqatIRMD6+wkLWcWfkEBPz3MdzY/SRsHbeTeMFwu4uxNlwEloPDTqmIIfKQzy5Cmg
	25o67JpXaUybZjdWON19r/sywwKnwWT8Xa8fKYdZzBmWlLrHbeeGsT+12pG0n3ugYa0nU0uoT24
	P6+JqmlZvmOusbRub0ZTYo6curUw5XESiaYYy5H02lTJO4+6FEg
X-Received: by 2002:a05:6a21:b94:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3db405220aemr10555230637.17.1789426392490;
        Mon, 14 Sep 2026 15:53:12 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm14924296eec.27.2026.09.14.15.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 15:53:11 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH 04/10] HID: hid-lenovo-go-s: Use pm_ptr for reset_resume callback
Date: Mon, 14 Sep 2026 15:52:57 -0700
Message-ID: <20260914225303.868569-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914225303.868569-1-derekjohn.clark@gmail.com>
References: <20260914225303.868569-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds missing pm_ptr to the .reset_resume callback for hid-lenovo-go-s

Fixes: 3524900cc571bd922a ("HID: hid-lenovo-go-s: restore OS_TYPE after resume from s2idle")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 8b16fc7d151e..b6850cf2c029 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1556,7 +1556,7 @@ static struct hid_driver hid_lenovo_go_s = {
 	.probe = hid_gos_probe,
 	.remove = hid_gos_remove,
 	.raw_event = hid_gos_raw_event,
-	.reset_resume = hid_gos_reset_resume,
+	.reset_resume = pm_ptr(hid_gos_reset_resume),
 };
 module_hid_driver(hid_lenovo_go_s);
 
-- 
2.55.0

