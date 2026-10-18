Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2645E3CD8D4
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295506; cv=none; b=kLhE3Tp+DAB6s5IRIF3r9HMhdQ2fcnwsTheaYtzC8cvaDyHgNOQ77aMs6VIDj6ledAuzIMyd/a5FDNr7Twt9+KhcI9L7ktSsj2bdVUPdJqc9PSel1TBbjN3t4A9MSlRzpNamK7vyauJC3a8avCHwOkQzgTmRmPPWfC8RLOltK8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295506; c=relaxed/simple;
	bh=AjrjMTpYbeAK4JI6FtEtzk9rlqw3yHKLbp/+E2qvah0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inUro9aJPmippIppfk/S3NdvF7qzJKHQi2k6sSdvfLLc1FXMCMtp7oSzA4TABR8FDMpw2dHi8DUzzWyrBsh7I//Dz1YPJgc6N0VI494QYPGWLxq4kBd3D2uUJdkUjSUri+aU/0nezwyLySPhWw9RHfAxaNS+SUMWIKU+1I30S6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gug9Z7fY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gug9Z7fY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so668199a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295504; x=1792900304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekUzfSCWNq1Ng7vt6OtO+4tAJn/2muvIGZQLxicYOuQ=;
        b=Gug9Z7fYiSYFNRtfK7/NLd8PDq1jT2Ts9fntBs5WtxGFqx204injzyrJqMQUpkMtRZ
         90JeuuE6hiEDpU6b29n4zdMR9GVaJ/ytfTv6G0k5iHi7U4lxsRmoW9rOvhEEKR108u1w
         nFSUWI3a3IOKPewg6DvAlWA3Kg2rUBaDSg7HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295504; x=1792900304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekUzfSCWNq1Ng7vt6OtO+4tAJn/2muvIGZQLxicYOuQ=;
        b=0aOZ1GAd9PUB8k9SxEwlMTV3Mllk2LSyJKUZDIGngVloHnTVY2QkZR8vUCRXJLs/A/
         ViTTP6uUgZf8O7/775lvRSM61WMvOzirataAtKZZIeYtlMmBepfhQI24EGxMpsBqIE2w
         uqFMQAh/tUvq44wnQkdJCHtrYSTQ8VNOsONhgcyHsHlvt0QjbYT/ps0PJtWYtFh2I1vn
         REJj7Fl3ic3c48RQnwk0YeljJXlxYJkd3uClczNBu+oBCAPXs73OwnN90L/3+EZm4xHx
         Tz1UF1AciS/DR7lwMKdjTc+GGjyOA8vMnQtUsC+buFdQ3PIwl9dYmA1unOVv9aYEVES3
         WLfw==
X-Forwarded-Encrypted: i=1; AKwUvByk3/MSAHWREHbDeBGMhwFDQDx57fg0ODEwsQ3t7RJUNd73lt/wkXcJ8PeuD5c/s//JrOewMEEY0KFXt6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUrf01GJfKXTT1QXswXQdHSB9ALBOceVruxaZNZW/DAorumBUN
	gLMXa3OKMG8WOZFAhHcFte/upIWQ+Ex5Hud9lnm5bL+YNjB9US7jM8Ga16BP0tTpSQ==
X-Gm-Gg: AYBFou10/yqrW32pe8RtWfP6SCJypmvH/lEQUnkBlOBa8cWKbUT22AG8qr4whK+jEfE
	5Wnqu9XFPXW7+C6/c1GunTdXjhLY7+ogCvaPFF+5OBGJ7mfgTeX0w+B+ex3n4lvT28XwEWhisuY
	lbdv0t8NMBujxX2sSzb63RpBNhSRZJnfA3TqOgo8Jmwhe4CpmNAB/0ZzaZ/16wfskurkHhrJko9
	hXTdJ86OKQ38b/IltQI1SCrRSRXHa9jb55Em3DJHi1sDfTCqX61rt8R9xJiyXUDUqPMcwM2c3Xo
	5iJKOkXki0tKKH3Kcbe/dvh4MsGSp4JphjREp3mELJP/YeTvPW1vDct3i6D7YmRo6/rebB5zCug
	zw0p5EueE8xar6pw2X5PxexORbAKi6DN3BoVBxX0PbMUxTWS6kyPt6dxRMnXc/0NUbKsq01jghH
	KfHttbtOVbvlGD5Bob6Gd3bfTjSLK3xhNFG1TurvV+LZ2UXwSlFy4pmdm1hpV3QL62E6t2NpniV
	SaOGhMujptb7jVbO139GEacg1L7UgZdQpYpTFEyf/XaAmE8kvlbUXwM8e80TdutK6eiSp0LnA4=
X-Received: by 2002:a17:90b:50c4:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3acef5960fbmr4275858a91.49.1792295504422;
        Sat, 17 Oct 2026 20:51:44 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:44 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v5 03/13] zram: zstd: do not allocate empty C/D-dictionaries
Date: Sun, 18 Oct 2026 12:51:05 +0900
Message-ID: <20261018035125.3120704-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not zstd_create_cdict_byreference() / zstd_create_ddict_byreference()
C/D dictionaries when no dictionary was provided in the first place,
because zstd still allocates internal memory for such calls (~96 KB at
default level 3, and ~160 KB at levels 9+ on x86_64).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 127976b5455b..b367049f131d 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -76,6 +76,9 @@ static int zstd_setup_params(struct zcomp_params *params)
 	prm = zstd_get_cparams(params->level, PAGE_SIZE,
 			       params->dict_sz);
 
+	if (!params->dict || !params->dict_sz)
+		return 0;
+
 	zp->cdict = zstd_create_cdict_byreference(params->dict,
 						  params->dict_sz,
 						  prm,
-- 
2.56.0.176.g3575e65682-goog

