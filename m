Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27117348C6D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320399; cv=none; b=rWl+WIjtRvNgZXD0NZkKK4lmdb+Etgt05P92ncBwLvJuL4wZ95SwfTjLPR/X6sZy3XEJD0hJFpb5lNODA7rVKVJkhSYsEccbP0fI2NBMLQZJ/wCkXqTO59MKzCgDPA9faUy9vsB72h+iLdm2a6THX2ctX8MVhsLt0w7raDOa2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320399; c=relaxed/simple;
	bh=kbhP4xgKoVhLpHyGw3FQY82AhitXCtUAH9uXFDXIWCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkXEFdpSLyHXI8x6aJIdOUNBINhl7ZjEkS6yX/Ki8Gs+kKw/SyPkZ9P6yKsYomrkdtR0OXct4JyMvkX91re1uNhNIewMzb9IWivuGhFA4Xt22Uh0a4TPtqMYxMcrLTJXCzKC6ev5tL95/IdMKWeowT9H2AkoccdJQQFePHqzVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKJIA1ha; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKJIA1ha"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd623dfe420so969373a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320395; x=1792925195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOaSt3OidYEeIBYJx+qFc4OoZOMLXmzzOzrHvaHMKHY=;
        b=lKJIA1hat7wADIr5+wQf2dK+rhJ/C56DunyjSGVpTa6nTpVmtB4vYKc7XtKHfMcHTV
         qIRfH6CeQT5w9+xpJwhpdOvyFrzX32DmluKYhV2HOPYYzXn4vq1n9OsFjmqhIF9xsT58
         G6OhqVzgSgDQUcOKMKU00ujTxtqk46Wg8VLRrqG6FHowVZqFf+bx/JyaeFR/HjtDEnWY
         1oN2K+Cf6nQoPrPd7MNxMYnsWCJubQQ/T2Hf1D//pHGOLrfnoH8gkThkM5H/RB8p2+fq
         ef1Lh2UUEKoVVfEm2K6lF1sH/KBLnSoirTeT/B1HK6MuMQwAcE7MAPvO8M49JomKGH6C
         PbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320395; x=1792925195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOaSt3OidYEeIBYJx+qFc4OoZOMLXmzzOzrHvaHMKHY=;
        b=ahx283NPtmBmFA3YFpKtTPCe1eqq7p0k7AvcUVaAEvfA5V5I866icfS26Rg0cYmzaP
         bbRHnZqwtPj0lVCqSy/88AMyOhIK/56kRixBm6m60vhx+aIrmJImD2/9MSLer+86BtdI
         4uKAxuXqZT8iuK5+FEbD2vjWz5wm6kkwYsvdxwXcnM3hp0QtK3ITavevWLK8eFX6DHHg
         KXgeDj8mNjkYPpDV/2reIX6SKlv+guUCtlbNBXcKqNj+GLsxSiwsxl61+338SlK5UCaO
         3CIlvYtcgz4ebBV6xMB2tfEYTgoepfAMsIKClTtWeXKGHR9HNNcGTE6jd8p6DaLcohop
         cWrw==
X-Forwarded-Encrypted: i=1; AKwUvBzsVSbGeGSYNYI4uUv7ikIzHjcOrscYezk7bdljfyKRbIF6ycKn6vOlTu5IJtNzysMKEI+lUK3QlwE0BnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfRW7likpPkvmMB/M/wHhr8lAkNrcRGbIBrIY81bNPmXhPvLf4
	N1LKz88Nyw/hA2wtFDuFNmYD/qbdAGp8P3Euqom1eNQDnHzqyw2EcaMq
X-Gm-Gg: AYBFou0ag/4pS+EvApj+EMXMvMZMsH3Zp+VLGe3abExpT9/3Z8jRSpsTJ3+0ZEZiliZ
	aI1JIyCzchwoUetuMIVAXpkz72b1n3rSe+ReA/bqeZS1S03JVyB4LMCeezc57JzOruk9abu0Esf
	xFZsTSJA8y7NOizqBf8tQa3njeqtiwKKhNLODlQZxm3L+00RPvtAs5NiZmOQ7hLAG4oeGRW/3oB
	G/y/KtgpCkA/RenvqVcx2r50oykZXtiahKSvdLpyupxb3d8ybLHRVPQdZon9eMh8P7+VeiUGf/Z
	mKVsJQA9X+h+ATAJv11zDMmIrzKDHBohKe59B7yvyfrzl+89QxWKMDW4dwAEUZG6G/ZRgf9bTKY
	brUo0sLOaAW7z+VWrB9FHuit76lLGBnHqa2emwH9HxaSkf+WgrKD4wFUBuzUbIHVbz9ZYf9IAES
	gIxb+pa5La6FkMoba1gTDCC9HLXLnLaDJr2biBFywGtrpX+h9aD5IUvZ6cGicmcRkV3ELpBh9CF
	kHDlsCkb86aPw6DNntnqwk=
X-Received: by 2002:a17:90a:c110:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3acef0e4640mr3774371a91.37.1792320395329;
        Sun, 18 Oct 2026 03:46:35 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a33681sm2949085a12.29.2026.10.18.03.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:46:34 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	jinmo44.yang@gmail.com,
	"Claude Opus 4.6" <noreply@anthropic.com>
Subject: [PATCH v2 4/5] HID: wacom: add NULL input guards to wacom_intuos_bt_irq()
Date: Sun, 18 Oct 2026 19:46:16 +0900
Message-ID: <20261018104617.743771-5-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018104617.743771-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018104617.743771-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_intuos_bt_irq() dereferences wacom->pen_input in every switch
branch, both directly for dev_warn/dev_dbg and indirectly through
wacom_intuos_bt_process_data() which calls input_sync(pen_input).
pad_input is also used in wacom_intuos_bt_process_data().

Both can be NULL when the corresponding setup_*_input_capabilities()
returns -ENODEV during a successful probe. For INTUOS4WL, pen and pad
are always expected together, so guard both at function entry.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index acf24360d547..12a632ee1cbf 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1260,6 +1260,13 @@ static int wacom_intuos_bt_irq(struct wacom_wac *wacom, size_t len)
 	int i = 1;
 	unsigned power_raw, battery_capacity, bat_charging, ps_connected;
 
+	if (!wacom->pen_input || !wacom->pad_input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: expected pen and pad input devices\n",
+			      __func__);
+		return 0;
+	}
+
 	switch (data[0]) {
 	case 0x04:
 		if (len < 32) {
-- 
2.53.0

