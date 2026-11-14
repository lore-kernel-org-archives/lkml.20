Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650545;
	b=XAKLBVBg0AL3rfgD+Ayzc6fELW66sEVJ1FLZoTRdpM9+VI8iFy/HcABz+ftRvCWw4jSd
	 OKiZqDotvpcPT+xw9pfxV+S7dXlUR7MXfMYO94gdA4/GEgGsQKk61CymfaBA4Y8p1xAk3
	 Tp1jp8JHaa2qBTbmPqlw4uUJP7hZ1YObVZCaU3VAxT/cfB8PC4fVLHSsnQ7fpTqPHYyTg
	 gKJq3kRNlyURBxOJbjzNbhp3khfxB/VSM4sz4S4Ef/Vx3Cjh/uxsP8e1NzkCggDeoGreO
	 cN46GPs6b7b3WJ/C4Lazo3w8ieyIxFDP0C+LLh3Kzsf5dlvWyhFy8+gQ45ksRb9kmZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XwFZMvB4uY9ceiCAZLjceweMYbxPpefUPYbylRB7SRs=;
	b=zpzUyPQG+EKeLMVnoG0gFx622boDKNQ5xybyPTjFPo/wN0h8PMejBKg5dWZgEvMivGk6
	 wgkimUNpkccDzYRskvajwAKAGUWIO7wQjFeKS64MzBEDCfMTcdlIIDaBHLaLElW4Iezbq
	 EdZN7MpPwFABky8qddEiuPY3zkxOresBtINEzRTBHYWfrf61npt/nfDYoIgr+TEsM/oYF
	 Y0GR+DdKHAdXlmtWo5npji1x836FRBf/2L7JSbC0cXBwJNnWB/9QPZwvjlzmD8YKn6xDv
	 f962b5tBduNo9ugETqDVmgiDg0wFDCsuFw/NLGf03MPSgzEL9j3jYSeIcjqPPt7dfBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Adsdm6ec;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA20606A338
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA20606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Adsdm6ec
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so2079425e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650542; x=1795255342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XwFZMvB4uY9ceiCAZLjceweMYbxPpefUPYbylRB7SRs=;
        b=Adsdm6ec/zmjbRKQ0f6KusGRFxW8VmYbzy+2DciYeCH6owdTVXMGNUofpTYCLto/dL
         huEoI687FjwKC2/FlpBQZIwrPGKSKj4Ihqsd785hKijZ01bpgH4mUo+LTCVX5nB18eYX
         xKivaAINrrdxiGqKs26PHwzxvX/1YjbMnocErnVO6Ve6+y9Cnccm3WpUsnWuqxfrDiv2
         OQ0U3KgbFCeB03ZOSDYi+3iiu75MfXNiJJmjjb4s39Mt7dbIDoPClvf7Z3YNK5NmHx4n
         0eQbufP3HVdyydDDTeeMXwh0IdiRKIquc4trFmJQ5WD2bb4TVlTBfzvftd9LUUbmVdRK
         7pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650542; x=1795255342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwFZMvB4uY9ceiCAZLjceweMYbxPpefUPYbylRB7SRs=;
        b=jrdnt7rTI/I2pXsLZUsiT8V9m6Hgp6bap3HqqVlcjQifWA8L06TAbyRHHWqoh/XjhO
         aEfxMZSfxnUGClJ3dy3KMErFekY13xDvxTOC6SLaeHob/KcaDgmFQVw4Rfg3n5XF6se1
         8EteV95vt0lRGBb2DNiMaKG+Ujyrd1MqNORg3h+myaqE/m34t4bUcaVqk0W5K1zyf46i
         KfW6RbVMcbwd80ctgqdBPLRCHXHAmL7B2FEqlh/iGZElaGK1iBdZlFZ3D89a0/zajEQA
         XjN4XQJlZ2k9N6sL633VpO2xiKWj0fKA0H3gLcBI3we09NlP7ksjRia+tBAFW6bac/Qv
         m3zA==
X-Forwarded-Encrypted: i=1; AL+hErEY6RXAROrMNE816/wJM8VNHG7KcNLbUoeZ3ArpLPPEtTWGBkwbpQiPhwJ9G2dOeG55ui2TYifvzCBQJig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pphFgOTohXl24VDHI1dy+UrBM8HzKDp7KQ+lMoB+gCAuHFLWl
	N+tnnG96wTy67bXH5w3lrlE8y8RwVxOPdZOnCtdr9564wdJDaE52yo2K
X-Gm-Gg: AYBFou267wuZc31kBGEE0EQTPNblvSsESZqiNPuTtetJeCwjHqGoURHo9abH+SbKbDv
	SKJAqqe4m8hkkz1s+F1GkV/xitR0C3XgDWgiUoqip6J59L7SuqTNj5mFtOaolXVXKMsv0Mc2nBp
	U623cvJ8H0wK4LikoKlOjeT6HxxJNHZPsFdZEi78V20ohYjPU2ACLzPitqnyjniOUOcB3arCvBr
	c510wtOWjEkAalirzWAr5i6OIL392GRPml6VxWLKMJoqqH/fDKxpXA3h2BmqzIjsAf9GNZnwRSC
	cL4FWumDwrcGEypKW5A+gWqnZxiqs7viX+PEeT0qcjgsnVgg/QzEodBTLWCP9xU9xyNOYtjk7RO
	kaYSqTiwl76rrDWblBQBild73xDD7ibNs+ozceQc3Ub4cJ+fY3pbWHu4MCkI1a8YN+z7GcHqppm
	mB2d80cFINvQM8dg28LTl69A4+TDiBuJ9+mqYuU3CkZSYGPE2CRrIJ1aq/eOQ/P2XihBT0youry
	N7oV0D69MBPbhDFP/YQgB+Q8T8tSpQe3fZyGs+IwuJHH8ARBMtgBUdnaYKejbOevu01s6GDjm5F
	UmRZoxCS+5CfH27YSE1bXmtYjyFgp3E9e77bf4IFBE4M6bLj4KWcaJk=
X-Received: by 2002:a05:600c:515:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb55a6a658mr71519865e9.27.1794650542390;
        Sat, 14 Nov 2026 02:02:22 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:21 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: sm750fb: Replace set_DAC macro with a static function
Date: Sat, 14 Nov 2026 13:02:05 +0300
Message-ID: <20261114100207.9124-2-shroot1337@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114100207.9124-1-shroot1337@gmail.com>
References: <20261114100207.9124-1-shroot1337@gmail.com>
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

Replace the set_DAC macro with a static function named set_dac().
The helper has only one caller, so keep it local to ddk750_display.c
and remove the macro from ddk750_power.h.

This provides parameter type checking and follows kernel naming
conventions without changing the register operation.

Signed-off-by: Ali Köse <shroot1337@gmail.com>
---
 drivers/staging/sm750fb/ddk750_display.c | 8 +++++++-
 drivers/staging/sm750fb/ddk750_power.h   | 5 -----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_display.c b/drivers/staging/sm750fb/ddk750_display.c
index 4e390541a507..d619e00fd88e 100644
--- a/drivers/staging/sm750fb/ddk750_display.c
+++ b/drivers/staging/sm750fb/ddk750_display.c
@@ -4,6 +4,12 @@
 #include "ddk750_display.h"
 #include "ddk750_power.h"
 
+static void set_dac(unsigned int off)
+{
+	poke32(MISC_CTRL,
+	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) | off);
+}
+
 static void set_display_control(int ctrl, int disp_state)
 {
 	/* state != 0 means turn on both timing & plane en_bit */
@@ -151,7 +157,7 @@ void ddk750_set_logical_disp_out(enum disp_output output)
 	}
 
 	if (output & DAC_USAGE)
-		set_DAC((output & DAC_MASK) >> DAC_OFFSET);
+		set_dac((output & DAC_MASK) >> DAC_OFFSET);
 
 	if (output & DPMS_USAGE)
 		ddk750_set_dpms((output & DPMS_MASK) >> DPMS_OFFSET);
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 0c4ab2120385..61f8608e59de 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -9,11 +9,6 @@ enum dpms {
 	CRT_DPMS_OFF = 0x3,
 };
 
-#define set_DAC(off) {							\
-	poke32(MISC_CTRL,						\
-	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) | (off)); \
-}
-
 void ddk750_set_dpms(enum dpms state);
 void sm750_set_power_mode(unsigned int mode);
 void sm750_set_current_gate(unsigned int gate);
-- 
2.53.0

