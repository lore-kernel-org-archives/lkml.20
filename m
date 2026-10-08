Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53D4A4EE2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466871; cv=none; b=ZLR4hZKcwSFuc5vhtxm8JuwsnVdOr9qqjKLMAWjVP9u90E8ZXHSB6CaZkDWyXt0dNIDQH9C6yuHvGjefuYZLH1MSZR0nj32SOAx/tej4rsEP7Kbvu0aUrbLDdv9VpDM1HXL5LpcIZmtag1qP57cCVcbnnCYp1ush1bhToogeQ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466871; c=relaxed/simple;
	bh=zgp1/gGuTnwMghqlYV38OJy5VaKD7f7ReNmuyf/5cew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7UjWuLllbJAvclGG8Xpbkq8EZr02r+y7XcLcr/TdLuH1bnqkqQPJf4wYth8pOpOVfCvzrIYHuyNXQhxrsMrjYisVTyd13OC5nDoykEt3zre7DoYpHBhg69GDuIafQt+FkYmXilxNIvgY6K+90YhQXbMNmmT9UF9RL1FYatISok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IDDpSuE6; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IDDpSuE6"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so268197a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791466868; x=1792071668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l0t7dKLgwExUCHyyv4eA7VEw6sBlfJKEK03HM38Su0=;
        b=IDDpSuE6LTUHCPZ/3Kyet4wge0YZuYWexK9Km6ge889g7ZfUIdqaxzK7/vnOmv+0ga
         VUgdOf3unit0syUiMPvVKvpKI2yJML8XZL0Lgyd+gcgQ2Sc6zfDsyM9QUZsD+0KbyvTy
         mMalPhiUAIee1R2Py3ipadZB+EMCVxlLztztY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466868; x=1792071668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2l0t7dKLgwExUCHyyv4eA7VEw6sBlfJKEK03HM38Su0=;
        b=IFJLlqkAWXK66lFWeJ88VSoOlgy/1razxoSaABU6YBq5d/rUiQ5+IM+INHx/SPx+qi
         YqTC4YjPuCrJ7A9IvFBxlz8IMrb/WbG9AmPiMgJKj3AfpeD9zck0QohtomWLozoDkMOP
         eq0KkPqSoDq0EWsJB+XbXhSdnsge5D5LEqKKp6LVSClaZ3Pa5hmmouMt3cHWpSNT61rs
         +oT5csE0xI9boxvnLHjBySuyoSzI5l2Exr0Cx2BLnBk/x5egTA6aFoLeLMEmWR/5aj3a
         jjCo1KMzg+N6oItCTqN0+TmU3LuxJ3YFdk3JaDu10erkMcaO8M5gIFoqD6JLZqzQnAkH
         cbZw==
X-Forwarded-Encrypted: i=1; AKwUvBztjtBUp1R34PzbRv7wTkqlF7FD5eTyzLwpD+7BZTF+Hx2DqKHTOObKKJrrHQ7uF0gEQuHMOCfWwMpKTa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy98B4Of89aBvYBgwvyhPUhgC51fdGtRc/M+jALnIFlAC2C7/w
	rOZJ19lbG9dT6kHY1hI0Vi23b+myAa+p3OPpl8/lOThIGpo4l4j1OEVOniwSmLMv/A==
X-Gm-Gg: AYBFou0/0n7MakAAmwdgUu92RJ0rAB/jfMHTNCYuF2NePGdVGxe+iwvcLJuj19u4r4M
	cHFlpm3qlhUEB9FygA/QYuh13CcRmV2cM/zk6frpmTC9fHQb2gWTkVL6UCjntQm/19ruy1UpU26
	qBhDKhTW7QtGxrmGzplGbWmP+JP2zBJs88khaS1B1qkaaeTDmEtCFax6g5WkGVcnE2ocjJlzEwi
	NzoHmFBx4/FK9N1FO3DdA/NVHpM5VD/TdjS2pytJqsf5lS4Xu1KI+TIcL/AhZMUh3jqrs//RJHa
	Nxmsi9ffU3vfGcvM1LI3jQbjvr3cqe40iyIsFHO3Kpp7R25PiGNfQlZFQQ6qmlIGhqcHje3O+bi
	91uECkm1NcOfWHHP8aLp/OFtxENA2XJxiSlaqd+a20WtFQVdSD+DSHlY+YoOozIcOK7UBpROg1E
	+3x1frDEpx56DPdq4rScmj08Ih1cIh0aK3ZhFCtJTrKoegEXXpx35h6x1DrBYrQ/rJtYwUr04sK
	ByKwVJOA6tou4ps1LNj2AEEKRNmcLxPcFplJEqY/A==
X-Received: by 2002:a05:6402:27d1:b0:6ac:8dce:5a8a with SMTP id 4fb4d7f45d1cf-6aff397d37amr5410511a12.9.1791466867601;
        Thu, 08 Oct 2026 06:41:07 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6b00a921c67sm1407491a12.21.2026.10.08.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:41:07 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
Date: Thu,  8 Oct 2026 13:40:56 +0000
Message-ID: <20261008134056.3816556-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261008134056.3816556-1-akuchynski@chromium.org>
References: <20261008134056.3816556-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, alternate mode priorities are set in registration order, with
the last mode registered taking precedence. Changing the registration order
of alternate modes prioritizes DisplayPort over Thunderbolt.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 718d06fa24132..b1bcf2ffb4176 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -406,17 +406,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	struct typec_altmode_desc desc;
 	struct typec_altmode *amode;
 
-	/* All PD capable CrOS devices are assumed to support DP altmode. */
-	memset(&desc, 0, sizeof(desc));
-	desc.svid = USB_TYPEC_DP_SID;
-	desc.mode = USB_TYPEC_DP_MODE;
-	desc.vdo = DP_PORT_VDO;
-	amode = cros_typec_register_displayport(port, &desc,
-						typec->ap_driven_altmode);
-	if (IS_ERR(amode))
-		return PTR_ERR(amode);
-	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
-
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
 	 * if it doesn't support it and it will not enter automatically by
@@ -433,6 +422,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
 	}
 
+	/* All PD capable CrOS devices are assumed to support DP altmode. */
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_DP_SID;
+	desc.mode = USB_TYPEC_DP_MODE;
+	desc.vdo = DP_PORT_VDO;
+	amode = cros_typec_register_displayport(port, &desc,
+						typec->ap_driven_altmode);
+	if (IS_ERR(amode))
+		return PTR_ERR(amode);
+	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
 	port->state.data = NULL;
-- 
2.56.0.360.g66cac248cb-goog

