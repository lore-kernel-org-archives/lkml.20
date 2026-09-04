Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB79481649
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522457; cv=none; b=L2we2M0OVXZMWJmXUznCJwsRuSKkJfiHxiRjNkFvJkxals4XQGDxsK4+v/Smy1GCQPE9t4b7xJ6T7adDQXymO6pId80zhReuR4MGta4ybrcOqGloTgcS12g+l5mJhzUWNl0+YgncxX+MY4rklxR+n30b2xZFw27z7B0KqdNjBUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522457; c=relaxed/simple;
	bh=iB68G608M5544MxTODhl9G55WJV6BkwwETG+cXIq0bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdAOaBgSkUqw734LrcZ7oz8iIr2cjrw434nNSbmTfg+kx2AFKgv/ji/UaValjc7FSljNarmztsmM5mtwzoYuWPz2P5wmld/Biy1n2Hh7iB4CpdgLvnnAN5b3+j0Jdhqfrw84FTe8raQS1VOv2KQJE++4qr7ahDBJy8NUzGqWePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7zDeFZu; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7zDeFZu"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so572668a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522455; x=1789127255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkP9NftzEX0Ficlnnu4eHVjyAkgFD6uNrnuDsL2+R7s=;
        b=A7zDeFZufnvSjxZ6SatO+LGPZLuS/A2E+eYysvAaSOy0RkynphrhSuEsj5BJk92dqd
         dpSfYlXl++lqCWbnIj0ngwt5+bWpiHORyiHFC/tJWQ7PH77jumZ3mDuMTFDHPx/2SXpT
         u8exJxcADcAXWbDC7dqKOvoSqiaBFtUxKhFPiSm2ELWVODwKAHdbAZ0tw+/m49R/SnBZ
         vVOE1nYMEjf68afkrulLEWdQgp/ByfAHzcB97EzbzBGmd1jm0N8M1KOC9GSK0LEGsPtw
         6fEkP+JIFqTreyRYScUQnbuHN3LKeCT39zp1ev3rTPM7QVCz+49FQluJKK9gug72bXEX
         +hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522455; x=1789127255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkP9NftzEX0Ficlnnu4eHVjyAkgFD6uNrnuDsL2+R7s=;
        b=dazfmi5TAXDjGaJFVwEvPE991wtNnSAEWSFpiwhVDNVo7saNk613fm5wyivz0nrKzn
         5f8PLYQdmmRkQDmjvFljN0a5y0k3MN60ZoD9pdh/4QBcU/n8X2amkRktgk/0yEo/oowH
         SVtUQL9QGI3qXbm+drDdrrFjUhefq6LC9l1hKOJbZcCoqU2LvyhKa6c2Ctx+mIdKndxM
         uRhqH4TeMZCf2SMlzs3NQcZyOR5SsJ6zNXWUnlLYoe2xoBzFqLnR8GvW+cXMcQgSg3fn
         eUypGrot0JgsBCoEbaB+FqKtp3bVRZJMVU+6xkX45W9712kGs14Icr/0aNxpRtIpY0yY
         xBDA==
X-Gm-Message-State: AFuF++m1RhTX5zY1ANcujpOnJwCB5Dfqqve2WYuAHRvfWv1K0uWazeiw
	JcZpFtDPbMb+GQLIYfhQ5qyzLXmIGQWKWj19NO4xwrqd5eECOt25/9yY
X-Gm-Gg: AYBFou1PYo+bgDmdGXRHoho5xz0+krM5NPMVwg92uaOexWNpg93IgfQp6D2PrFTbC2K
	6NdtFa+W06oTLSknCG/vs7ClF6RUPbW/LhW2UovcT8qXVLwfBrThgs+qwyho1nruhGxUYJpAN2n
	g8ZeBp7iz6BuNU5ByXs30AjlNfQe+H3RK6yCZWdRtqFC9nI4mBuPdAci+SmMaBdrfUfcdu0rnjE
	3vc0JgCyK/FOjJd1CDH5gYAodavmqQ9zPsS+56f6W+JOAcCYgOeZEygbanow1lD9iAC5B1O9M6+
	9o72k0x6snb493Y5VyJ62RNh7I0FstcmigEPtZgQEudE6ttcTtB4l6UeJRG4AOAFUuS12A2JTtH
	fK3eiR9AZDQO3Xyzy9yno7J+YENJIYpaKt6CVXmd46jboqrjc/6WI4/Wdexzpi+CFObXT7kOOd5
	+rLxH2tW8D3PoaY1IAv5nsp5YBVzU/dJz4RKH9HweZ75euG99HxWN2O/jTeQ1tMqx6WFeJFWP0c
	vK5nnW9dKnguP0=
X-Received: by 2002:a05:6820:814:b0:6b0:4fbc:aecf with SMTP id 006d021491bc7-6b6fcbd5788mr4026803eaf.24.1788522454723;
        Fri, 04 Sep 2026 04:47:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339c0ec914sm6950891eec.31.2026.09.04.04.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:47:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH 2/2] wifi: iwlwifi: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:17:22 +0530
Message-ID: <20260904114724.32518-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114724.32518-1-hemanth.selam@gmail.com>
References: <20260904114724.32518-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/dvm/lib.c      | 2 +-
 drivers/net/wireless/intel/iwlwifi/fw/api/power.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/lib.c b/drivers/net/wireless/intel/iwlwifi/dvm/lib.c
index 2e16799818e4..186dc7aad159 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/lib.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/lib.c
@@ -931,7 +931,7 @@ static void iwlagn_wowlan_program_keys(struct ieee80211_hw *hw,
 
 		/*
 		 * For non-QoS this relies on the fact that both the uCode and
-		 * mac80211 use TID 0 (as they need to to avoid replay attacks)
+		 * mac80211 use TID 0 (as they need to avoid replay attacks)
 		 * for checking the IV in the frames.
 		 */
 		for (i = 0; i < IWLAGN_NUM_RSC; i++) {
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/api/power.h b/drivers/net/wireless/intel/iwlwifi/fw/api/power.h
index 115e65ba19f8..5ba89e31aaae 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/api/power.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/api/power.h
@@ -727,7 +727,7 @@ struct iwl_sar_offset_mapping_cmd {
  *      regardless of whether its temperature has been changed.
  * @bf_enable_beacon_filter: 1, beacon filtering is enabled; 0, disabled.
  * @bf_debug_flag: beacon filtering debug configuration
- * @bf_escape_timer: Send beacons to to driver if no beacons were passed
+ * @bf_escape_timer: Send beacons to driver if no beacons were passed
  *      for a specific period of time. Units: Beacons.
  * @ba_escape_timer: Fully receive and parse beacon if no beacons were passed
  *      for a longer period of time then this escape-timeout. Units: Beacons.
-- 
2.48.1

