Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965389;
	b=Wdk8Tc61t5iC6vURDJXhE04y52H1a9JoDBp9coayutMmiRXdfdXRmHVwTf/yp4kw6Q8W
	 bfCm0pODamWo4wrINs26L7C8rLvUm4Ad7+ejpOa4jsii3nDllD1NiOWUNXCp5cR1WR65i
	 0pc/hczLKBCTXE2Z/lFeqtuABCNdxGP5ra47HVkgn6TFqTGe9h+7pgbyDRS9y0cKEsu1e
	 JGsro9+P7hjUpwelE4BPPY9nYzbIyYWYJe9bOLbfOf1TxRcYvUowF5wYuhjiRsctoOlWu
	 CngMFPL4NhCZ2flArBmY6uojrRjZ5AS6QL8qg6pwJXAAOpvhC6Qq6WyFJPNHkaw+QEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jmeqz7ThXoYjgNQNs/BH69z8JNkAj1VbRCWi7gnmfKU=;
	b=Hq/yuAUYk7DTDiRo9shEyCnJwAI0Q0XQW20QgkWcDA90LtClMjhXes6tMXRfHKFTefmh
	 rhxytfDD6EpDLYrsYAzfR+LolxOlg9HNtcF7tmaIBTKrdSQs6iXLfhLu0cB4tIadY2B/D
	 IzsIWi+5YFg3YOC0hMyTmWuJw5IWd29YHTXLamjE9ngk0uPZUHQu6GLienxAsQA3HMoeG
	 jESuFXPJB+GlBp1F1oqhOImkqUuMrhQq1X68L6q4nJMZXRHKtDhWjpoPJdSlNbDLhnrv3
	 9CmSCirxbF28lHa04a0yIRu3ClZfwZfcqMA+CEcUVv/sJWDMcbO1vNQPc5eupwOqKmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=L72Qd1f8;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B84606BD41
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B84606BD41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=L72Qd1f8
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso941716a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965387; x=1794570187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jmeqz7ThXoYjgNQNs/BH69z8JNkAj1VbRCWi7gnmfKU=;
        b=L72Qd1f8s8gEBjZGCDBGGLvrag5LZMvHh/SASFvbSA1Nob80vfanySWiYM8sfoYBb2
         KWd2PBYiVYPIT8KQlq/U7emnRK6E3voeig60taWTHuGC8mJoBA9ssPwSz2NaXYuxU2XE
         KlBucOXx2yj2qHRWW6jsnQ0ypVVfVX2tGHaWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965387; x=1794570187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jmeqz7ThXoYjgNQNs/BH69z8JNkAj1VbRCWi7gnmfKU=;
        b=ZaMuCWLfeoEEP1SAu7Vcc+VEbwKYhHKMTcrRgbK3PzwtuBwvFuUJwBmoi3DANzQI3z
         HQfq8u3NEayv30ELVhb/TZ46RoZHtllTeyiQpaI66yhCvLuhzFzJYfAH6JQ3f/xRsNJU
         oVXm7ksNGN2Bd0VBCc2/OPIH0iXSXwURvd5w8o6Aspb2aCkw4uXPKqW94LmXTeVDpDy7
         u3/26r3XQ2281+PDy+MSsLWbxKg5W9oVVMxQbR0+ayQux5wFG/1/LAeJwdyNYUMJRaDa
         6nR5Mi2B+6ZbgGfOf/t5d/EkvrVazOMrFSNihrEMKnVqBNPqhoZqHLUhIYGKA58DapB5
         L3ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxu/3xQsk79Ejag1NVCCe5nfS5h0H9jgF5SlPFTeW/HDYsDSs9p3SMS14XplQQHMIBvvCAFeyRlbmcHgW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9auxMnyXmAU3DN6s0Gj0dI3acZeI9lA8jRub5Ycu5zV8aeRqQV
	tOwnr20l0Q13vbieQxfZExbHT9F24ihvcW/sO/sRt25cxJAqz6f9a12yaacSsAR0mbo=
X-Gm-Gg: AYBFou0gNbMdvQCMUMfEBgFYp7NT3XNhshfuSPxD/yvsnQb13m2f5dTJKUhRcLgJJsE
	yDXJOjP4ooNlHvnlrs4WBpmcmLC3bmKjgMds3/7dYnW9NptRng+osqokX4FG9QjVfZRUuMi32VY
	hdeFBJS6b0Me7kL5Bav16xgzOhix0MA1vWSEovem/99g3atTHn0iaTt9rx3woiugv20aG+8xNaD
	izIostxnTupx0qyc9PkO6jYCKFYqEip1NCuNHXpPFAYk5Ycg/tXqBb20nAi4kJ30ySFCbEB5np/
	Y1ogECUCfPXuv8rnnRKOtxgOc7Php0MfgOJcgkcX8JOKsYnirCJj6ezOoi+/k1dpgSbK+TJ87ct
	BTbU4vGEcfGzyERdeLuYQNVzj7VAgVsjfA8ZC56s+5DrICrAfxuiHtgWYmNBSthWr/v8JPkJr+4
	OV12kkmgX48eNf09DrEOgQaWDRctwdES+VSpF616w/w+r9mSsIfxfxtLlerXU7v+LDkep+KMXAp
	gV5I7HbC+5zgbdzuzbe9p0fHZsD4/Y9g5KB9clOlL+36FWI4ODV9iwUFlG1NydswNzkqo4Jhim8
	k/C7vIWJ+Ym4vecMJJpzd3M4EveUkvHXV+lkwbtfTFM7yo0=
X-Received: by 2002:a17:907:97c3:b0:c46:5973:2a1c with SMTP id a640c23a62f3a-c4d354f2af0mr203412466b.37.1793965386960;
        Fri, 06 Nov 2026 03:43:06 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:06 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 1/4] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Fri,  6 Nov 2026 12:42:57 +0100
Message-ID: <20261106114300.936782-2-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106114300.936782-1-chris@miget.com>
References: <20261106114300.936782-1-chris@miget.com>
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

bitland_mifs_wmi_suspend() returns the laptop_profile_get() error to
the PM core, which aborts the whole system suspend. This happens on any
machine whose firmware reports a SystemPerMode value that is missing
from its profile table, and on such a laptop with the lid closed logind
keeps retrying the suspend, so the machine stays awake and drains its
battery.

bitland_mifs_wmi_resume() likewise returns any error other than
-EOPNOTSUPP from restoring the profile, so the resume is reported as
failed although the machine is fully usable.

Saving and restoring the platform profile is best effort. Warn and
continue instead of failing the system transition, and skip the restore
when nothing was saved, so resume does not write a stale or default
profile.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Unchanged since v3. Moved to the front, as it does not depend on the
    other patches.

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a431d3fef774..d092dc696293 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -213,6 +213,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -383,10 +384,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 		return 0;
 
 	ret = laptop_profile_get(data->pp_dev, &profile);
-	if (ret == 0)
-		data->saved_profile = profile;
+	data->profile_saved = !ret;
+	if (ret) {
+		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
+		return 0;
+	}
 
-	return ret;
+	data->saved_profile = profile;
+
+	return 0;
 }
 
 static int bitland_mifs_wmi_resume(struct device *dev)
@@ -394,8 +400,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -411,8 +417,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 		}
 	}
 
-	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return ret;
+	if (ret)
+		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
+
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

