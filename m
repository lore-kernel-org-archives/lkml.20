Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7083B4A33F6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636042; cv=none; b=Wad8hp3I6/uBFhLALK1Jct0zr4LYjmWAOIMQwkDKt27r4Vlc70G74HUC8kjytrkm2l3W9IVvq2Gx+DGf2ZiS4Qi++UKBZMi8PO1ge0Pn5WolETE1UUbUCwFc7gJchNQsYkMckwUq2jk2wZbHBsBxs2i8uZl4iAW1KIcsatfyWbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636042; c=relaxed/simple;
	bh=4VYAgGnCoLccnThsi6FGyu7dWH9CoLPORdAqvgX6CSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t0ZVu6g2SxyUVV71oOMaWtYbDInqn1SF3k/ukxzLhATpOZHf/2VcnPckbpqlNdsQPPwIkD2S8RJZ4/0uyGldaq7FEGo+DdRTF1QW7xkgusCavrMCoxgeEbVHzwdi+NjQWp2bOY/JP1S900/cyasyg6VzPaG/ua/mZbp3CgJe5AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0r4xj3Q; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0r4xj3Q"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so882870a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789636038; x=1790240838; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=11XG6GHVaKbsTYUnnB/fk0WT0cIpei9Z8XfJe+BSC78=;
        b=A0r4xj3QNwAAw62cs9wWPGv7Oa1AR6vFxFL1JZ/AW4UM8QE1jqJrJrGujM4kbFtZVM
         Hr/PRDs3Sgwh55dfNItyEGYJmsmAVEjV9ssdmpNJp1TTCMkM0VYtwP5b3L3ISwy5k7OF
         0I969s2KAVqA8swHFBHVqykZyOPfhEXg71Sw+Ca0XQBdakhZfviAdFolwVnq5D28akod
         GybY1gWkdmbN5+IAhHitrzNw35+SRZSv4/iUUJND7zZY9SKTHMG0rx0ROMsHrQXD91MZ
         fGWF6GhJN9Gd5wgadMF/CP6BT/hJ59pPX4F02aGAjmbDOk3q0c+grJkpi1h6phzn3UPL
         JNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636038; x=1790240838;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=11XG6GHVaKbsTYUnnB/fk0WT0cIpei9Z8XfJe+BSC78=;
        b=re3BILArpD5gjhlA/d6d6kZ5hXXIDhNhcKcaHZVjPnFrIK+/Fgq9rNgr4Fv0/1166Q
         7wkOQ9dZCJyD3UTYui7nNAe4SijN0417W4J2S3VEdnQGuRRc7l3/uwMlWH1G4pteyRrv
         Lp7bMX8sTFs8g0i67WuF28rrbNWiW8Av3UTLGLYjyX1HjoYk7reflRUxNPYUB0YijDpr
         zppx4PsLFxmN2hibPYldIWlHk/awAlvP1omx31vXMYv+vdXA+8Fl3eaKY1Ak5+BeuLT6
         vukauDXmIDWJ5jQUH3DSaL70QDCFkt8Jeuyt8O+IvYevhCOqCQbmLzmOVXKgxZfhudOP
         CVmg==
X-Forwarded-Encrypted: i=1; AKwUvBwgktFZnqmH9GDsZzNSQJoS0O2y/mZhRyDU6q0QSHiFzWFI06Um9QPwzPaVzs+40vN9VSwKa9FIxTQvOXM=@vger.kernel.org
X-Gm-Message-State: AFuF++nLf3P9+HFFoNJArrqektv53OjQG9xOzu6PN3jAQ49ASx0zvKzA
	mUv4OM3Jjw90rag3vL6YA0ODC8G3USZ2ZSXlm68SU7+9/Ob78PSbnLjmCHXv73Et
X-Gm-Gg: AYBFou3AjcXXe2b+XPfJ+m3RMiOHtBXqYfwQTA+2OeUfBRtN3mqfA4S/sJLAOGjapsr
	G07R+5da19Y70jdmVEsNbs4/7HKSoFSb8N2MKQQNVW6mD9xkYPCbzolU8BAtFfH9l9YyG5GAPCs
	FAycFlkvsgiJ6G2ctNt+Nlc90gj4EkBVGOpoBQAZPXGurrnZlBU3og7zGVR3uI56KH4/AKr4AuU
	wyoe+bexSMGpOjKkP9VGb4ZGWTdflUv71hZprO0UjsPdNlLuBxa/o1w7EHkjxmwvCvI/sThBcR8
	v7GIEOEMe7nVtkKMOzfDa3Llj30CsEVby45swX7UcAeu0Vf2IKa2GJBEme78O//FYou3UyparUL
	/3FDabgQ36iNOO/7RKDl8UL3PZoRnMzo7ZLkOTyx4pSP4TiVPVECzU8NuYgtZQVnK/LS8ljfx2J
	ev9YdHfA8M2c2CELmqTELS9nJsk841LcTWZHGaYRH93NoRErs1tdl2iFJ0X4AwaU53B7FJzR35K
	HRTK/Vr9AJ4QChMWdsIy40KIcBXqUANisgRq6Xuy6Pneb2KgIfKyQBcg/VBabiWRze11OuO
X-Received: by 2002:a05:6402:52d6:b0:6a9:ae73:2b59 with SMTP id 4fb4d7f45d1cf-6aa224041a1mr7540556a12.13.1789636038039;
        Thu, 17 Sep 2026 02:07:18 -0700 (PDT)
Received: from [127.0.0.2] (0x3ec686fb.mobile.telia.dk. [62.198.134.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2ab4ebsm3286953a12.30.2026.09.17.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:07:16 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Thu, 17 Sep 2026 11:07:13 +0200
Subject: [PATCH] rnull: configfs: add power to configfs features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-upstream-v7-3-rc3-v1-1-d0b620bf82c9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMCtq2oC/yXMTQqDQAxA4atI1gZGhyrTqxQX85NqBK0kKoJ4d
 6ft8lu8d4KSMCk8ixOEdlb+zBlVWUAc/NwTcsqG2tSNcVWL26KrkJ9wb9GiRIsmhUfjXPLBGsj
 dIvTm4/d8dX/rFkaK63cE13UDOZh5a3UAAAA=
X-Change-ID: 20260917-upstream-v7-3-rc3-0db5699dab30
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636035; l=1119;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=4VYAgGnCoLccnThsi6FGyu7dWH9CoLPORdAqvgX6CSE=;
 b=L3IqiNeupBg1A7BEFeHM7SaRg1I52yfOds1Jaj3LJfHoEFNA1x5jLDRU03mrjIZbe1BAvnwfl
 v3I6WrIC9pFASH5OI3K+kUjNBgOK90ezsjrhRRa1iLXHJikIuJQ+9CY
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

features displayed by configfs for rnull was inconsistent with the
actual features available. This correctly exposes `power` as a feature,
which is also consistent with the C null_blk driver.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 drivers/block/rnull/configfs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 32c10c3f4d0fd..5f1cdd54cf48a 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -35,7 +35,7 @@ impl AttributeOperations<0> for Config {
 
     fn show(_this: &Config, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
         let mut writer = kernel::str::Formatter::new(page);
-        writer.write_str("blocksize,size,rotational,irqmode\n")?;
+        writer.write_str("blocksize,size,rotational,irqmode,power\n")?;
         Ok(writer.bytes_written())
     }
 }

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-upstream-v7-3-rc3-0db5699dab30

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

