Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488269;
	b=M1w8Npgtf8y7RQ6PJt74G6E5l99kNE5MIT9xmfyWLwwQuxSOaLu1MJdiClpTAHSn8uWa
	 0eOLm2htyflaqyiNke9KSwHPdu38MXcP4TIVyfOavK52oOFWfjJnrYDnFfI8KkmzshZpD
	 5LiLIZEphX/H+AeEJ6YnYIJzltBf/5Fp3JZU6CKz9QThVNg7UOfmKxXb4agRRLdXk2Jtw
	 5lcvpF1bIY5OSjwQriogc3WmtqY62KEo5+IxWyxuop60W8ePsBgyYw80j4tWK+63cyUzf
	 VhPT/xzcLFNn8tO8NsT/UU1XgbbSDeK3+7qXp+x2MfavxvOX+M2cAjRNlsx3PhKcXJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dVjbRfDBC6IhOA3xVvnHX/kj1Doa8q6i4SsVeUJtYdc=;
	b=H0HREXzgU5yDr6lr1GARoUqJZJDoQXcBU4fBtLMfoO8cWWLysAG18PtQqAARqRRZdldt
	 i+Tn/nF2fpsUr5hrUALZ3GdKrB10/jBHfM29C+MZU6ZiaKQS3cqKK1UGNXJleRQXigx4o
	 KNwRY3Kpae9Pvo1s0D1nIcng1+GkesbZndWYahRJqLYDdahIqSj4aAuGCTzQBqcxDc3qY
	 syvi4xGpsZrmMJZ37sfpD14++1dv3CynK+D6e/pC7DVBmX1igkHW9o1uAXuLcLy5OeRC8
	 vdvKJP02yOx7Gcy2lQSdyCwwp3FHXq2UaWL4a4UQLY+WqGESoRz6Zv+kmC351E4QGyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XoSspQxJ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE6606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBE6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XoSspQxJ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so5378565e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792488267; x=1793093067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVjbRfDBC6IhOA3xVvnHX/kj1Doa8q6i4SsVeUJtYdc=;
        b=XoSspQxJOZKWAjDyKhKqSgSK/Gg5Sc6cI2wXOnky0npA/YHyMWtGObjYHp0SX++sWi
         xJVzvkjg7QrcoDhgZ2HAYx+tYqGCmVZa9/3ZqdAsgTRlVy6plEZTeEG/bsU9kuOT0SOq
         KDLk3OF1Pi/uIPJOL7nB/sGVN4FCZ4ba2gvs3KbiH9Fv0AKORy1dfmLouhE+vbmPtojU
         W6rIl3r/6t+Rrgzou1begEUY5XB65+66i5FIczzAK/kuPC8pQnFIPbhMwS6lzgSgq2+4
         BTGERK7APFeABaXkSMZn0ijR+NyaEzPZJvbD7FS/IDI3tXWZW169MxXfHWk3uC5nf8U3
         SrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488267; x=1793093067;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVjbRfDBC6IhOA3xVvnHX/kj1Doa8q6i4SsVeUJtYdc=;
        b=2BNpa7neRQQD1ebDF6R5fHsuFKN36mRQeWBGZMtN4uZRGNRuwXOkLCoxVD/E9KNZ7f
         J58Uq2QlehLRWUh1WPFmbA4wV+UmqleDuFfyUk9UvtYDMBKGi8DGCvH+wdnN/c0L34oq
         EyqaqU8muFDbUYgVeqPkIu6jYUGqp2oTHtyMK3hu1eZia5w4W414aiw//8fgymUSAvc1
         VimOXHHb3n5gIz38U7Y3GGAAPa/KncLbA+kYsSdEJQlbbYj2WTLlxCQmkbleeRdc0eKy
         Q9T9mIhABvJfpYyFoVqfvlps7TMWAi8a1GYH/4YQsv/PIf5+t44LQCT/u0ktVXa7NH3O
         bF1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXYxf9MtgzdEOOgPNtLt2lPDRTuc6AsSQwmJBrZnAR50mfRU9n3MIU6GsaoEuzCQOdy2q+wtZ4JyDlT9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjkQnS6EmOVJDobJfnDM2kSsTwZPIx1UOCJLJUrRPDwGPFmxI4
	7QzCbKC6Jj6o0ltv/x9ouv7SKmlZTHLzKMbH+7ghrhe/sRfqfaZWQgT9
X-Gm-Gg: AYBFou0DU2tXWp9bD/mQCy+0kjyTdyeUHFgrAqNrRrFznk7DZUyshUpyk3o2Q+57iv8
	xZsoNA8UegKF5AT2pJF3gEuxCoz14eE72do34t6Aed1eGzRKzfH/U8ZqGslrdGFanyH9FLzqVSD
	ihXH/fpey7iYwszANO70gOK5cpyHYKNM9tbi8BvhfcpUxzSZ+KXSVT4TimTehVTNZhsPjHRmdLm
	gIfDWEOo+sHosYVuNrj6bwx33C3PQnNOcM23nab53WHNHPYtTqmxcp5gC87CbN9XpPrhGOi+y9c
	yDZ6AO2Xgq+d2nM6dHQuNhOwElwA+l2asRgqBtu0CL4ekQi1MqQ5tpNRkWTo/au6OW1850I5uIN
	jaN3GxEl46sbN30eqF0JJCRQaJ8eH7Oo8BALx+PueiDGZSLlowv1hR10zvV61LUmVtdKp0DVkOl
	IbYKJgWwR/QH4iOK8b1pb+n4UcVKKwbKhDHkm/5aNqiHbwRhQSOYGtPpn5E+SVGSTPlbJUWZjLD
	DVsZfYM/CZeXiBvDA2/m9y7VMmwaOD58/zN1RzvquwgJ7PHGS9Y/ueKTH7hOTxhKB8=
X-Received: by 2002:a05:600c:4455:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a1f50a260amr29984455e9.17.1792488267098;
        Tue, 20 Oct 2026 02:24:27 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:f99e:1a52:655b:681])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c242dcsm54873985e9.0.2026.10.20.02.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:24:26 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>,
	Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH v4 2/7] HID: asus: Add missing Zenbook Duo hotkeys
Date: Tue, 20 Oct 2026 11:24:12 +0200
Message-ID: <20261020092423.36380-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020092423.36380-1-p.pisati@gmail.com>
References: <20261020092423.36380-1-p.pisati@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joshua Leivenzon <hacker1024@users.sourceforge.net>

Map the Zenbook Duo "screen swap" hotkey (vendor usage 0x9c) to
KEY_F19, like the other ASUS vendor keys that have no dedicated
keycode, so that userspace can bind it.

Unlike the keys of devices with built-in keyboards, which can share
keycodes freely, this one has to stay unique: the Zenbook Duo keyboard
is a standard USB/Bluetooth device and can be connected to another ASUS
machine handled by this driver. Say so next to the mapping.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
[pisati: drop the MyASUS key (0x86) mapping, 2061075360182 ("HID:
 asus: support the Zenbook A16 (UX3607OA) keyboard") maps it to
 KEY_PROG1 like asus-nb-wmi does, and shorten the comment]
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
---
 drivers/hid/hid-asus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index c2ba2d825191..54f4d68eecc7 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1316,6 +1316,8 @@ static int asus_input_mapping(struct hid_device *hdev,
 		case 0xb3: asus_map_key_clear(KEY_PROG3);	break; /* Fn+Left next aura */
 		case 0x6a: asus_map_key_clear(KEY_F13);		break; /* Screenpad toggle */
 		case 0x4b: asus_map_key_clear(KEY_F14);		break; /* Arrows/Pg-Up/Dn toggle */
+		/* Keep unique: the Zenbook Duo keyboard also pairs with other laptops */
+		case 0x9c: asus_map_key_clear(KEY_F19);		break; /* Screen swap */
 		case 0xa5: asus_map_key_clear(KEY_F15);		break; /* ROG Ally left back */
 		case 0xa6: asus_map_key_clear(KEY_F16);		break; /* ROG Ally QAM button */
 		case 0xa7: asus_map_key_clear(KEY_F17);		break; /* ROG Ally ROG long-press */
-- 
2.43.0

