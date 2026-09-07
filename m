Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56153914FA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761666; cv=none; b=bnrCof0mEW+MM0mk6iwOqcvLE5hTz8qplvP2ljLU6a4uOGDYXJg0j0jB5rztdDxBju870m0+BExQNuZZbcCg8x018pMC0EbXBH4jL8t7H9g2p6uT9kyCAhlQkG/lOw9Sxiqa2TQHNxyYqsVTqNpsR71jRJ8JtBVhBJ9uSc2HeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761666; c=relaxed/simple;
	bh=Fd3P1dgr7wQ4Uz/yLG3viISNuNuMK6wTA0WCicIl5Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txyQs3rbVV+x3qjZTkknwlwJRFXJeOjD0ROCZCYeO1zxCmLhokwVKg/MWYc/zFPNqaZg6lwKRitzaa4oW+9pXfcGBICASiwi/Lqhy75lxudiMOypwwYAPpchfCJDWDJUnhsqRzrTuL3Gr16KYakK92zfPl8+Bz1OinVGqVwRplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhLkEQ2p; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhLkEQ2p"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-85c9a79590aso3039604b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761664; x=1789366464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irXdSsh6Co0+5VYMlno13lKGi+GgmUVy6SM30AaIntQ=;
        b=IhLkEQ2p8EmxEmZwE9txZ7Kor3UbtjhpGNyrOKvk+q7htXn/TWhdgtuWwyXI3RfGZ4
         +Pk6RkDCC6nhaj+jNLb3TPScVWuD9zzkI4klwQP+vMcr5UDDtYqeDzZpBtxiZLr/6eIh
         Q3CtQNXAeFqhg+5/whXl4EMwRfy1zEvg4KzMejLIJFkBZJZtJjadWamWS+YnncP4apoB
         4l6O2oq5QebdARWSH9crJVClUh3fPJMXP1bAFTl6wKZ/w9hsDfYDinIVSD5DLZn7IVP5
         gLCP8M/QWoTif7MOzZYCWTHcTSL8Yk8EhCAG3F6zFND2pwvRPgpG59gf2t4PM/THdnGM
         lnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761664; x=1789366464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=irXdSsh6Co0+5VYMlno13lKGi+GgmUVy6SM30AaIntQ=;
        b=OsY5zqfqDI1djUNMR91ZqQ81np/WVm44rKM4Yn2Mp52bBGcCKy2UtgGhgOuWKJ4I7M
         WJr4lWPAGFj+RwzGABuPZ8cpWjPqrR29zILfNPC6PZYPfE4RknHPth+1jW28s73MEbit
         at+hUnfMSyFUMboqYhp+GJq7K6QgINTNq2hMSk9AYhzW0W3m+d86RwS2pkU6AKPR6st8
         WRQsszgU2iEAQ0JJAA1bIrNKGq2m1HzT0itApJZeW/He6kR612ObaYEbCZdX9v/yWYJ0
         xWKs0jVY4bvG93LxOdO8+CPJFBC+2Qr5vDWfLscHqESQEMBdggXats0bsyUWRP5SYI6D
         LjfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJpHHijbdgmdXuSRWGZ1yUxJzIqeTJkbOhQ3GTCoXLMAfK46YyJ2b5dz8LHbPKGVdOP9xnvBxRgNm/wPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l5vh8tky7fv1sB0NGYHbcusB/00A0yhe9qabtG94p4OH/O4Hmz
	Rk5z8Dacn+PebhbfeTCr9HrquT+1hZzN5kk1jF/qDp6LqoCjkw1hRRtd
X-Gm-Gg: AYBFou0D9fq5Ha7x23dMebqU8isTn1OloD5cwlkEOu0cuOeqr0D9Ay5lyHxwBzwhpQl
	Gp+M9iSmGX2eMN2kQ1TMNP0w4aqNJTkb3sx5doFq2DDo0VnAHEgyier/nUXMOcHYMxPXZaCrfji
	yqjAL5HTHSstXR+BVMfhUV71J3NxWB8JM4ZvgNjPe3+AswaQEQD5/XUvR28cqk1Zm3TtxZotX6v
	OjaojK7lggMM9MJvCiv1ge6V6zPaD7xbe1RionqNqn1OpATp5NFXjJJAmvBmzE1zLPcBWRRJbyB
	NNfeX/J3/Owz9IneN4H/6kzX1Qnn/cy/RbCugCcuUr/hMn1NG+H/HPI6bo1yeV2n2BP/HS06Ajf
	otXQkLVODh+kxfWvMnvPXpeyKPhZC0fPEFj2TrY/+0xaKXKdtv8kXFCi6LoSLQdhL+xiUh0hnhG
	yDQdQCHyovGV1etznWwtqmbPlalXL/JUa+EqgF8PsAIlk/PEVeYWe8FYp9y57WFeJEsksUArfsz
	TlW7NB1lhtO/A==
X-Received: by 2002:a05:6a20:7284:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3da39ec3ef2mr29142831637.10.1788761664052;
        Sun, 06 Sep 2026 23:14:24 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm4651595c88.9.2026.09.06.23.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:14:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] net: mac80211: fix typos in comments
Date: Mon,  7 Sep 2026 11:44:16 +0530
Message-ID: <20260907061417.33729-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907061417.33729-1-hemanth.selam@gmail.com>
References: <20260907061417.33729-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/nl80211-vnd-intel.h | 2 +-
 include/uapi/linux/wireless.h          | 6 +++---
 net/mac80211/cfg.c                     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/nl80211-vnd-intel.h b/include/uapi/linux/nl80211-vnd-intel.h
index 79ccc9401d50..602862503c2a 100644
--- a/include/uapi/linux/nl80211-vnd-intel.h
+++ b/include/uapi/linux/nl80211-vnd-intel.h
@@ -37,7 +37,7 @@
  *	8) The CSME firmware grants ownership
  *	9) iwlmei tells iwlwifi to lift the RFKILL
  *	10) RFKILL OFF is reported to user space
- *	11) The host boots the device, loads the firwmare, and connects to a
+ *	11) The host boots the device, loads the firmware, and connects to a
  *	    specific BSSID without scanning including IP as fast as it can
  *	12) The host reports to the CSME firmware that there is a connection
  *	13) The TCP connection is preserved and the host has connectivity
diff --git a/include/uapi/linux/wireless.h b/include/uapi/linux/wireless.h
index 3c2ad5fae17f..28ae6bb0d5e3 100644
--- a/include/uapi/linux/wireless.h
+++ b/include/uapi/linux/wireless.h
@@ -301,7 +301,7 @@
 #define SIOCSIWPOWER	0x8B2C		/* set Power Management settings */
 #define SIOCGIWPOWER	0x8B2D		/* get Power Management settings */
 
-/* WPA : Generic IEEE 802.11 informatiom element (e.g., for WPA/RSN/WMM).
+/* WPA : Generic IEEE 802.11 information element (e.g., for WPA/RSN/WMM).
  * This ioctl uses struct iw_point and data buffer that includes IE id and len
  * fields. More than one IE may be included in the request. Setting the generic
  * IE to empty buffer (len=0) removes the generic IE from the driver. Drivers
@@ -681,7 +681,7 @@ struct iw_param {
   __s32		value;		/* The value of the parameter itself */
   __u8		fixed;		/* Hardware should not use auto select */
   __u8		disabled;	/* Disable the feature */
-  __u16		flags;		/* Various specifc flags (if any) */
+  __u16		flags;		/* Various specific flags (if any) */
 };
 
 /*
@@ -1083,7 +1083,7 @@ struct iw_event {
 	union iwreq_data	u;		/* IOCTL fixed payload */
 };
 
-/* Size of the Event prefix (including padding and alignement junk) */
+/* Size of the Event prefix (including padding and alignment junk) */
 #define IW_EV_LCP_LEN	(sizeof(struct iw_event) - sizeof(union iwreq_data))
 /* Size of the various events */
 #define IW_EV_CHAR_LEN	(IW_EV_LCP_LEN + IFNAMSIZ)
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 23f4f9ec86d0..0ce7a7ab769c 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2870,7 +2870,7 @@ static int ieee80211_change_station(struct wiphy *wiphy,
 		}
 	}
 
-	/* NAN capabilties should not change */
+	/* NAN capabilities should not change */
 	if (statype == CFG80211_STA_NAN_DATA &&
 	    sta->deflink.pub->ht_cap.ht_supported &&
 	    (params->link_sta_params.ht_capa ||
-- 
2.48.1

