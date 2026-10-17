Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAEB383984
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201218; cv=none; b=cXptMqKL38AdsUJTgdGsP746wmpPE/HSh8a1x8fsQm5GOsKKmkSekIuHYbEpaRKtg0RXRliTdV+VDuWzWcdw6cpxe30ID98jDhNUxOAPp/hbOhfWUjxBv8qg0rLHM4ftUNYh743i7UQIp09uZPY9LSSP5f7ew7mw8QO2NrujdSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201218; c=relaxed/simple;
	bh=ap9ePz+9PV6ufOeUJx8Qbab0l1IL7Xz3NBboXApR0a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkQpTGz8OGPSC+uzxv66eLoO3yWSmRlOazqYQ8vGyCOWQupiuPmb9pkA4Q7ZtxqF2Tk3K31rnJnIHG8pncIdh5umr/46pks5SKZauvF7hOV+gDpMvuTpzi1Kcxl42r54DgY+C/pUEEalHbEDGLqM7c6v98HgbeC/JfvCgP3CIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVgy+QxN; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVgy+QxN"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15756f82e8aso1083156c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201211; x=1792806011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bYkTuU5A/bCkZlXHIgBMm3vkDI/xApJANJAk++gOls=;
        b=kVgy+QxNeQmUtop95axvQfj9JtvdNkQNSr56P38igpKUNLY9MU7LIxxzD3T3zrY8Ro
         LOB7ziT/q75pokly/OVycnJseXOkdde2Dc0ZbxJW0qekoP4+TwEF97SuR/oj2LnogUDd
         nK5Wcy47Zj86PVNviIWpytGU074Uqz4+S7ll6Rq2w2idx+SKWT6iZDVpl26Zybbh9Sb5
         r+XEGjWQeGZjs5l+sNhP5FUkq8JOLj+kn5yBOfM91OYlH9ZG9gVvKs7aSmjb5tWaby9w
         FGvjFLCO4F4GEYIjnDZfRVqVp6QYjZEBJDxWwWFqh1i/yDB68ME1ySXEkrUbuLhjh0Hh
         aAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201211; x=1792806011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bYkTuU5A/bCkZlXHIgBMm3vkDI/xApJANJAk++gOls=;
        b=K7H9QmXdlOGVok22ori/ft3yKZzKcs9u3oqnwAwJymKTGdZqjIzE379WkyRpyvpgwV
         UGc7vG7dBO4d+HVYSGI4Y2xkt6yM9nrGamYFNvj2dqA1UeL/2PnJCGHCHGOimKPgK1ll
         f2/lkRpyIKgdPsniEDAf6SpHpJi2+R+bNGHilA7zvbHY4kbMlr2/MmaqtK3AfWtkOmIu
         R3lMq5jok6wJqIzglbum37gy4bxWwbJwP2KozrOGsjIYk2Z0LaczWKuPoGvLRicZkc1F
         LBPiGtul6UnwZAlpWN811XhS9HtCto8UaJBrIl5ZGUwQSrF3kSyzjskqZZmJ4tEdcGP1
         7PuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwz97rPIvipfEgn4OYPe8czihAi5FjlOuVjfKs8RLrRQxCUxINBUtycw3liZy0PsWKj76wUHsQ8gG/J0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwj0ODlQMAoBN5+s0DTeE80ds79vzkoNLGvKoGQ5YNffBIWqiv
	u1R5p3Z1A+SYZZEdiLQAUx1Ry96ukkY7gKnp4W6MpDFRrnaptK05hy1T
X-Gm-Gg: AYBFou2W6nDpB/pmB2B1i8beR3qPl46n0f/+BgKIn6X76MRpE3O5zlR9o6FnatAutGo
	emnPnj7SUk+CX68O3bNk991OG3V9mdDpPSrA+lJbPMqPcLizAqF81C4IlVKKNek+V/ndAmDCphD
	xut1k1Glf9MDy35Og817AjU393fADzsW3oHsm/xBMTGYL6rCHjsnYh41wi+4/MTEq+irjW0FW3Q
	7QXhO2OSjccg5PqwgowRaqz4xMBHJUIwTufhBv++Sz9ltfRP9WP2xpKteU3YxFsZsq/HngfbEbX
	uTZmvhJ0t7juM2lN434vHjZCIoD61Kcgeo6eFGKq2xllZbespUUTPmtSoJJAIrGgMn0i30weXO2
	xdxdztpVUsBOnxkyFQuEwV3g1u4LbCGyJkG3IYPN5VVAtOG7qEpFPuQ/v5YcBPqbcrVDDFJpCwd
	7uh+KB+rtPoGIFZGTofBPBq1Pbw0+N8UbHLe6LuF+qzQZpDWnwSKir0e0A0deUEXmqBAHS55GHl
	LEW1awM2Xq4oJod44bi1oUciMCZBR4CheRgvQKL6bYi/EKoknuSPeiA+Fr0BncwCmmyDDtB+8GH
X-Received: by 2002:a05:7022:b043:20b0:14c:c588:ac21 with SMTP id a92af1059eb24-1851069db0fmr1875193c88.9.1792201211295;
        Fri, 16 Oct 2026 18:40:11 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:10 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH v2 04/11] HID: hid-lenovo-go-s: Use pm_ptr for reset_resume callback
Date: Fri, 16 Oct 2026 18:39:49 -0700
Message-ID: <20261017013956.2440130-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
References: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
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
index b27e82ec9b76..a16733edad5d 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1560,7 +1560,7 @@ static struct hid_driver hid_lenovo_go_s = {
 	.probe = hid_gos_probe,
 	.remove = hid_gos_remove,
 	.raw_event = hid_gos_raw_event,
-	.reset_resume = hid_gos_reset_resume,
+	.reset_resume = pm_ptr(hid_gos_reset_resume),
 };
 module_hid_driver(hid_lenovo_go_s);
 
-- 
2.55.0

