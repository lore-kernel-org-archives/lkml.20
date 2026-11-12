Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500314;
	b=fPmGK96P4w2I8LQg+Np/B4YXvNeQYUouOqtw9xyjw+6BbaRJTm+L29FUZCusa9OzYBYf
	 boTfsINzgrRFUr15Bs6GJ0JWJKs1hGD2ck6iRIMu1wbeM1z7iXsD2fxSX7eOySsXtTeE7
	 NHaiLWAZd+s+ZOcUrO0P5x/I0MNyguDi7uG/nqsnsv9+2x2OJFTnxUuNkcaCims3s7LZB
	 TGSPUhQEB5jF90FbLFEFzIgCR9YNIbdZs78XmmP0NykOlobB77PoSK7GxProB/H5Uy/7p
	 IYNEofhHbTFCyp4/r6/V3IbKqGXMiRaeEDuYW4wTZI5OReVTD3zgkcv0jDNIVXnwGnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HBl3rmjqTJ1pLrzM666SXKTzJ5qZqJJlIpCM3zMhhDQ=;
	b=xfEKTNTZwndbdeSftSVo9DibZPtkhF2XTfaj4zGyz47hnlcEeFQRj7JW8WnyWqn/khqu
	 LDYgvIKMMNTEMb5Ut5BA94U5NuAkbQu25kvvQO0KVOd0DnR3BPOj7moS6CmsdFxq0CpVh
	 UcZADurBBxpuK49yrCjI5ZIyxHimWlNTOgVouPM4OuLjuuOZFVxSYJy9pRAj85MYXSDdq
	 u1Sa2lk6yZhUTM4P0aP00JaPR8G8niP9BEIUH4pK0ilDfyfFokbklWS1yHS1ML5fQZcdX
	 tOMYTrEVoPG/jR237mvafp+SAv1iU3JBlSjX7+U6jv9KA+1iNQluNrDenkBdzMTPcdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z72d6AsH;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DDE606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DDE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z72d6AsH
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso17949e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500313; x=1795105113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HBl3rmjqTJ1pLrzM666SXKTzJ5qZqJJlIpCM3zMhhDQ=;
        b=z72d6AsHoetvxZs0kY/LmIstMNq7SYLMeWF+6gACDlZFDf2g5kMC1qfWHrXYVRddhX
         EOLy5fmEMgCyWxPO/XcWF88Fs82xqqmWwg2EEMR6/iy+Kw4Cvy6KYgGV2JAi43cxet5V
         +cfl7L/nSVUtMvnuX+mdKzpWFqk3/bVy3i3FutDWXEsdWjfwML82OStf5y3vK44MLch3
         P4ZNXnK0GWEiB2+LWTQcrlSalB4JWgMBuT1ruZQ1LiSTXR/BaqWqN9pSsekLZSObkSeK
         w+r688OJ4zLlMpobG1PCrrXvE0LsTsAC0IDpg3z3fWQaLxSi7HsMujxkKV6doUqFyW+y
         5fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500313; x=1795105113;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HBl3rmjqTJ1pLrzM666SXKTzJ5qZqJJlIpCM3zMhhDQ=;
        b=szB7bR8vVPjEVz90P2WhlCYcvsYY/T4zFds3jKcLAdtYDP6IqwWXrQg16btmj18XUA
         KwFbtBjeVLTFJR8HnGylUU31kz03XsYP//5T4qYFr9dqj1pUP4zgKkeUkyH1KswU9lew
         hmu8K2tKGm+sqhqLO/cZkU5Bb8JupD+h6UU9fgcMY/B3oeAjMmylNZiOJ6LwOyM6K+lE
         8W8oUhfSunOpRPQwOI1FSYXU8RGtMkPFXNZPi/tkIuZiyop4QTdncFbsVP+FNR7phWT5
         7/G5c/IDAFQvY/C8VYZmnbq/6StnhOEiky/uUBaEPAk3zVFLwGb4zgSkQHSMuM/VqZ+s
         uUjQ==
X-Forwarded-Encrypted: i=1; AL+hErHzS9A44ek6FAN5vBgBK9kDeJ8BgxNVS0B0jQXwub6lsrWQMKnZQT/9hTm+p/ZkvMcRcQLHmJza0gbXeCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A826QkDrMMgIwzvG9pmMBVw1ijZkGUKWovkGn7TxrGFP/ZfQy
	p2hT24N9dAdTq7l/FiABQWrlqbAcMO9hk+rAGlOverF6LSwhDa+UdjNeEgX6Tw==
X-Gm-Gg: AYBFou0wKIIrb8/u2AsGs/xNtgHvv88kqFfPAIgsvt0VwOOc37JjkNIu7vMfattYnt7
	MNhC9LpOSZBKAxeEVxyma3q6G8+gRuh7V1tgfcV2XePC7kZ/9w86P/XhTcQM4id6vPEffTqBbog
	BXO1zReMFgq0G3DFCl55aNNh2wGwe9NHG3W4cL+DCw0tcXFElC2QaxoPLbf3mFrhNTE56wOkpIK
	g6vbFioqxmzMKyE39eZnJjI/vzi1Gko1v62hv8cw2YrZ8+CufpLDn6qkaeieWD7GcDbEI1awiN5
	z/e0ujv14p0jY7317pCtbMPJsjxG1sNPl7edcdsXn8tBnesca+N/55nOeYxYHKLoTNJl0/oOJXe
	Tz7zt1tcQiJKaQGxkd9P36to1IuCzBP+3wivcQq/WP65zhJTptdOgd3lcfJePWlIiC84vw7pBBF
	lza8LWCd1vVfPt49DSyLKa2k8zco2gOCuYL/zrTqj8BwIDLN8ViTvG7zxjQzpCwKoY2d5i8GhLH
	h1tjtLqV1q5gSvcVXYFm3Sizu8V76UlYk6bSo0Vq3t61/fVUACYI6iTgmsJV8CemtaITF11Rozy
	vTVBikUPxqxEweyxGD84Qz/YimZ8HxVzmFnMQg==
X-Received: by 2002:a05:6122:e170:b0:5ee:13ad:6c8e with SMTP id 71dfb90a1353d-5ee1c4674bemr2919303e0c.17.1794500313185;
        Thu, 12 Nov 2026 08:18:33 -0800 (PST)
Received: from [192.168.0.8] ([2a09:bac1:6b40:8::11:213])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3243e30fsm229079e0c.9.2026.11.12.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:18:32 -0800 (PST)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Date: Thu, 12 Nov 2026 10:18:19 -0600
Subject: [PATCH] mm/page_reporting: document @order parameter in
 page_reporting_notify_free()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261112-page-reporting-doc-v1-1-593af69f3801@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqAMAwFr1KyttCPCHoVcVHbqNm0JRURxLsbX
 M4b3jzQkAkbTOoBxosalSxgOwXxCHlHTUkYnHGDtdbpGmRjrIVPyrtOJWrvjdh+NcPoQY6VcaP
 7j87L+34ZdnPPZAAAAA==
X-Change-ID: 20261112-page-reporting-doc-3300264b0693
To: Vlastimil Babka <vbabka@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794500311; l=934;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=6pVvo1FtuWeaNndmTIHTk1UU3WZn4EgP4JaT3+y2FF0=;
 b=y0Ho9xggReuos+SOKw11KbTHPvmVrg7Lb2eMHGBJNPPyBfhX+APJLVm9Ia5mQJ0RIehQIJOzi
 7VTAE/JM8e8ALDHYxfNl6JVhqY9NGlFUsEhWjx8L4wcCaTKfWffc37L
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=

Add missing kernel-doc description for @order to fix a kernel-doc warning.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 mm/page_reporting.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/page_reporting.h b/mm/page_reporting.h
index c51dbc228b94..2dffdcf02658 100644
--- a/mm/page_reporting.h
+++ b/mm/page_reporting.h
@@ -23,6 +23,7 @@ static inline bool page_reported(struct page *page)
 
 /**
  * page_reporting_notify_free - Free page notification to start page processing
+ * @order: allocation order of the freed pages
  *
  * This function is meant to act as a screener for __page_reporting_notify
  * which will determine if a give zone has crossed over the high-water mark

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-page-reporting-doc-3300264b0693

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

