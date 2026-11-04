Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804808;
	b=pjeFBV3ECM9EmPAE8kCsumYhgZlD/l+00MF2OoBDDta9QU9NJZ6K7Z56IYpb1ShMFpYD
	 ZNls9Abj3etQ/36K0puh4A8jhhLiEugwrqqHssRyB2qWX7Z5j8jXezaySs7l5VOBNL8pv
	 BCWkFx4ACGBWRqnrI9bYfGysntP7nIYmF5PZ5BuhX1fc/vlS8boU6DCjOSOC9Zj90OLZ0
	 VhKwLDqhLh8bhpE1o7M1Kpm2FiJQmT/Ee0eHVMS2pmBzhp23abXMqETbJ8L7kGKDU/ilX
	 34uUvsFTMiNULOjeLpgcdXo+aRMwyklwSlu4SLlRz8Y25Mcf6490wfYBaZTtrrywKCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=srOy3C5I/IQfUjrUYw7AbLY9/VnfU44F/qy2laTqkjs=;
	b=rlYPGc+AuBcYk3UkIvk08U6SRcFu9ID2rS/ghzVzvEHTlc5EXivZ54XiEdm/o97rpuB4
	 FrvrPeTvGXgGiA35yoxiEEptgzmMrffIjcaqVCipfSjqPvQzY2RPzzuAkIUZ74MT3fCC7
	 h+vQ5LmP6NUrXT779N2bOPWxNVShwmBDGJwkdLSfsC7t49HoRWA0qrPvI/0BN0zxFM7mt
	 w3KhG43sy1vj0pc8L/9RKuyfeoxMwcaFfDhPqF5OnWh64gLf9I+bGa39AMP84j5hDHYNl
	 /tgaEuZyeemU58CsSDGajPEuBYmp3XbLRa/i6nCHt+K6+bWpukD3kHzy9XCcGDlp8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpACuByE;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E101606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E101606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpACuByE
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a1947498bso1873744eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804807; x=1794409607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srOy3C5I/IQfUjrUYw7AbLY9/VnfU44F/qy2laTqkjs=;
        b=zpACuByEVWZgahr8jT6vYmCeyPR5imdu1MqxulE34X8zgdNbvokzHktvw7gUrSBW+h
         7M1B2y9e5dwRWi5AO0c5rzNp+DrgaRkg4QilRvxwZLw4EOUgaNRG+sXR8hiCSuAi7EnN
         CSk+YnDEXlrhJpYzYBrRSdUmdoXKYyLvWwTjtwRs4ds0LagNhV+zgqzZYqAfRmz/8NL/
         U6sX8fpza3UlT1iaLR8lQ8puCQIFR8Z+KMo59+6scmvKSoOWLM9k2ZFem9leF8O30T7u
         BGOOF/nCuFQwNIO4Qy1rgcXNXx2G9vsWByUpEUE5LO2avRnwC3r2Hb3GQOzD4tsCRp6E
         /zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804807; x=1794409607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srOy3C5I/IQfUjrUYw7AbLY9/VnfU44F/qy2laTqkjs=;
        b=p2MJoWYFE+Uugyy0MsB6LvkVU7/YUpISxUJTanoPh6xDG1V5jesw0QhqBLS3uD4026
         RBbYt2hhhpDBFT574WLyqE9R3lMU/qg42Tft/hQtDl9S9cR9ark014IlBfdPTXMrHafI
         UAA8yHX89vP1R8R5NbTt5lluSvTacscdc+YfbdsoAGuBa39YCJBLlnQCBRHCPDkHhKuL
         yASTfsTNn5QzGq3Zih8Nv1C7/sqTeFMX22y5TcdX7KSGc7ahf4Z11c1VpxtqJvMlaGU3
         2RxdxylJVumnTqJXoQkDLodh0iGs5bbwILwIYHi2uRsLkUwr9aHMJiNPAuurntRw73aN
         CrPw==
X-Forwarded-Encrypted: i=1; AKwUvBxYeMQFG4jisXeZwysr3QaQ/Z4YYs3idgmUkHOIw77HIBDGpXggt98BSHrtTNmB6ptEj16NflOo6Pb9gEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pguReAPAo3us5nabRLLV9NFv/0saS2I1wzxyLjXj3N3yVr/kR
	UUSDumFGLORikjBRqfamYDx9XhYM2tBxPc3maV7I4eXQQtrScsHZYPVzBAt/6KmU
X-Gm-Gg: AYBFou1KfJXZ4dCT+SUPoWSez3CBzsCEmdZJbjBDoTF9Wx/aA8ZyiSl0bpL9l6p16Ev
	pY+673mhRt5ycddyDCI0zmoCIgEXSQIX+M3frccQNQm03KpqFe5DZufpVpeCDZm00nWOFircJAJ
	QhcxEYN/KqjXFEEsa3Fb9LA+k8pcPdp1Uvvw1uKQjG9QdFjLmOU2eJlwRBEOFEBcZD8lJc2fdu3
	7N0IxpVf/wDaMPK739zlesE8JD2QryyzJmQ0Uvh7KOxnGN97LW0hCeyV3N5JuJhHljRX/pHpF0R
	BXPwY8huRW13qlR6BacsIlovwgXs6+S7daIbkNLH7nm6mEh36c4ZlGosV8F6qygdeo1rCyABl4y
	QJsfeKqPP89iIoLBo+B2rsGVOqf4vAohC9viI+5bUAWfwlV1VwKkNN+eL/a2w+UgD2Z26s3WOLw
	dvHyDS9Y/soWDNoKdk9Pzw3UtMyAndIa4S+lUsv1f5QYZ/HNJAp5AzlNE2am6eGGf107URwuK4W
	QZet+FIK7FkSUzAZyX7LiH2FgQtYIXbznPmy6Pc34Jiht/zgztoLYXEdRu2FBnec9t5MsbFAeST
	YL1OYV6W5WH5U/KyGwr6gjrwLr6P3cXnJNaeUl7V/bHKg0xhXM0pj8ZAqZgHvrNa6sacthJIlNy
	KF0jNhdMDRG73oR3mVHcQHFLS9hbL
X-Received: by 2002:a05:7301:4203:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-36a50f4ef92mr20087021eec.25.1793804807290;
        Wed, 04 Nov 2026 07:06:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm527287eec.10.2026.11.04.07.06.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:06:46 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 2/2] drm/amdgpu: use str_enable_disable() in amdgpu_ualink_set_irq_state()
Date: Wed,  4 Nov 2026 20:36:23 +0530
Message-ID: <20261104150632.33843-2-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261104150632.33843-1-sinha.aryan03@gmail.com>
References: <20261104150632.33843-1-sinha.aryan03@gmail.com>
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

Replace the open coded ternary with the helper from the string_choices.h.
Same output.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index f875209e5..a307d165a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -34,6 +34,7 @@
 #include <linux/math.h>
 #include <linux/sysfs.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 
 static void deactivate_accelerator(struct amdgpu_device *adev);
 static int amdgpu_ualink_remote_interrupt(struct amdgpu_device *adev,
@@ -6558,7 +6559,7 @@ static int amdgpu_ualink_set_irq_state(struct amdgpu_device *adev,
 	 * interrupt driver.
 	 */
 	dev_dbg(adev->dev, "ualink interrupt %s\n",
-		state == AMDGPU_IRQ_STATE_ENABLE ? "enable" : "disable");
+		str_enable_disable(state == AMDGPU_IRQ_STATE_ENABLE));
 	return 0;
 }
 
-- 
2.46.0

