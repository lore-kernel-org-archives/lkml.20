Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D73241C8C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066703; cv=none; b=mVdWn3aCNAbBOYrrxeL6UcHwc+7ntk6QsNqLiINfeCvRXGdGkbUtld0w+X0lnALvHFSLiNo2/StFt0rEPJTKohp3EqD9eLgVhST+Mv+zbIS8vRnpSN13PUJWfedH0B1JBjSeTUZJVRByZt1rCj8yFtFvyHVmHki6+x2VLMPyYDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066703; c=relaxed/simple;
	bh=uZQRom0gOEmB6fHbiq8k/VrJlHLoufkcYR/1mJZyD0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3NVlY6Fex+1FSDf404J8Rf1P9Zd5f+j1/k7hl8cMEv9t4m/6bLB6irxRtxDcHF3ijiMLmlGlawL4vqWraqlAN2maeMqvdAB90BA5cbVPnqE3WY25v6+LujbLjbgCoK3wXhWs98MztKBVedMOCUsMeHVK5TTFXTLSzp+vOMWUZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmlgfIYC; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmlgfIYC"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so12189413eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066701; x=1792671501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHThfDJt4B6WauVL/2Vr0/FHJJdXFFoLAtYeGFhagO4=;
        b=hmlgfIYCgBDhguES4sFFykBqL+VCzMoRFCyiafHXnGdO3rdWQBVJ/u7zRO/5405myF
         OMbf1gty42eYLUeqmnJ8SYSzNBr7k9QJk9DLKj1csrdvBLUiVcddH3bEebM44Y3aKMCK
         WC4byUDZ1O/5zMOrrxPlwrYoRJ8J5an4FFDDFovTti0nBgDHTTpc6xO0z0TK63RhD/iJ
         5kwSN6AzzCLALV7TBR/tRZ6we0Yy6MdScOsFYxPG4Vgf+d5pp7VoPcmu6AgsEMvAFRUl
         wuiWIB+Nbq9468kT0XwWpYLzZrMkD1/ck6C7IeCqoq0enYsUCzkYozUrSdsiOuB4sxJ8
         zaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066701; x=1792671501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHThfDJt4B6WauVL/2Vr0/FHJJdXFFoLAtYeGFhagO4=;
        b=PeSpbTLgev9ASBjzROLn23+7E36NIyxg55WnVeyQRE5cz5/Em3nVw/9R5pfFKsIug0
         c4k3VKgfeOfYd+0CQawyoLu0LjxKUEguxQ3GBrakglKDNu0u17wBlmahODX8R2rpuvmk
         Y1rGVyJW761usr6qNzewRrhlY494S/rxARr1gYMd95cZTUefSjezCq/gxOxKSQy/R3G4
         M24ExjMoaA+hD+568byIvbDI1J1ICVvFcsTlPJINf20oZwyKwROZ9wdquT/YTD8pYEa3
         FnV5UeaX4t7Ck3CyX1h1EwoIK3f1vgy10ZjTViNlVtZ7lxfgzyfw1eXID7DJhEn6UP1B
         V5Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzVmM4/qHkS5+COSHhRA2CiNCYQBotn2kgMF1Z1uMbOPZNp6rSrgh9kdd/13xwFlstTx7h3ktw0cDcNUro=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3FZe89MINOohFVbDmGAYCC3cxpIWh25R2VziKtp164ZZzYqPr
	pC55zby0i3ooduRIY5SvzKc6pI0wx6MdxjDDMUjcjadondPlA4tkcAXs
X-Gm-Gg: AYBFou0F8L3FBYXtT6UYuwHtmmyDlBHpj1mauaTQLVY6t3Dm84yz68NiPcYUhNBeFQ/
	GICt0Qb9Cg0xYxV0ZAxhUkQh2yvLCfxmU/yG6kEcZ0UrQWKGiqDO3JhioyJ2FaVcF7r5r/puqOA
	/o1zlhR7P0TvzNELydc3rN0wP4cRQ9c4uRQKxGYCzT01b8cGcSnoJz4iW2e8clH4MHMIFvgMcod
	bICHTDASDWvQhNFjSZQxLTem8inED2Fm973Gj9DAuIhytJX3Bx/Z3Z/zvGrvQaLdZNKwaRGOcN1
	ICkzJHMnyXRJS3LLhFbi4K7uWDWcg9MUt2eKyjyFepJakDkoNn+0FPbXActlDMq20mtOpWxHa4p
	jaSOOCaI5zQWa8W1BNSzIg1/PDpQSKvaxjIGvIsPZBBQPb0XgYzZhtvVvLFniGwdQ4Oe5FpuCxQ
	RNEpWb9IlIpneEC4oPOWaskT/MPTTdk+kR+sXFM9Zp00Poz1et3TiMaICqH2aqqH9oziMhDTq64
	A==
X-Received: by 2002:a05:7301:53c9:b0:359:d4c9:6081 with SMTP id 5a478bee46e88-359d4c96379mr17612443eec.12.1792066701355;
        Thu, 15 Oct 2026 05:18:21 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm61220790eec.30.2026.10.15.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:18:20 -0700 (PDT)
From: pdsj2807@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH v2] staging: gdm724x: make DEVICE_STRING array const
Date: Thu, 15 Oct 2026 17:48:06 +0530
Message-ID: <20261015121813.1130536-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015093128.1004956-1-pdsj2807@gmail.com>
References: <20261015093128.1004956-1-pdsj2807@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The DEVICE_STRING array contains pointers to string literals and is
never modified.

Declare it as 'const char * const' to improve const correctness and
prevent accidental modification.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
v2:
- Drop unrelated formatting changes
- Keep only the DEVICE_STRING const-correctness change
---
 drivers/staging/gdm724x/gdm_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..65c53811f099 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -31,7 +31,7 @@ static struct gdm *gdm_table[TTY_MAX_COUNT][GDM_TTY_MINOR];
 static DEFINE_MUTEX(gdm_table_lock);
 
 static const char *DRIVER_STRING[TTY_MAX_COUNT] = {"GCTATC", "GCTDM"};
-static char *DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
+static const char * const DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
 
 static void gdm_port_destruct(struct tty_port *port)
 {
-- 
2.34.1

