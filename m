Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A1A469855
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929952; cv=none; b=R7cvXNsWHUDfBklq5czQBl0xZtLG07tZT6y1kJHB74Co3/2jhgmXEVHvpz7BYkRL6ABOqFkxDEUFKdgSCqRAoEVd7msKawstlT0f+7g2g6p54QBDKdDLMbuB9LIC5SFUGqSG0yUGcMRZhcyB3CR2xj4AQD268ywSw139MxxBlQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929952; c=relaxed/simple;
	bh=zF76oz4WZP/X06K0KuuyliwnKkh6eH6J1UrreBkUc1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZ3UGmEvadLSrfhmQq4gee1g2vMw+XrPbMID/S3hxaUuRUGspOptDrdOlGH0YUHUUEWCzSiTR6d4ZMzbf3EDahcRoG4d6MumzuYJnWQF/+oQBUKAe8N2KJ9ETJq4F4YTd40np0mCtBLHOfhy94GHLPBs5Voc5Xd/GVzmj6b5H0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VhAXFi8a; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VhAXFi8a"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so55587165e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790929946; x=1791534746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ys5uWke9XBV3Ke8D3pwy0Lwn7XKjGlruZIy2p0X3uuk=;
        b=VhAXFi8ambzYBv9n69bMkNca7/NJ7sPb3NrTSVe8FVSpIht92qKmRTWr3tjSBTgiAa
         WEsXt8TnPQBCeLDTFhaciL/1AhWWGFe6ayK+7SOSdDRNa/PzqYvvcXpbwZ2l4Rg7sYLW
         ub83ANUrqJxByICIMfe9EvytuOhHA7VsAHZ970gA82BMzNqXu09AOys9CXWQMAA5dZt4
         D+MMNz9D23iBMBb7o9+YtCcjJOuH28IpKRGX/lgKEHdnz/oe0G4+7ETkTNoBGkf2yw72
         I4+J8aQXuY5lvnMaFAvK11UlQoSh8GupOYg1ItqU4LvGv+OdWKtV7Qo5NOt7M7nrF7Xj
         EzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929946; x=1791534746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ys5uWke9XBV3Ke8D3pwy0Lwn7XKjGlruZIy2p0X3uuk=;
        b=vkmqHvEMY2jBt/FLH+qs4oxClpXkYxuhq7qkgc8tppUpDyzh1lHcZhajZ+4NevMelO
         b8Bn7M3Mo0Jm87IibB/C25mfrVcLnj+X4g2gYkTTLEIdpOJQhKtgAFD9o+DuFrKwYVqI
         veCUGgqXD57Qo0mkGmHxi09RilfKHabwi2OfDt7fG6V1qJk2hX209BO9le+mmFG59ww+
         eyPJsaMCoBGCPXHgLLYVK8Bvw1p4SMplRNyRLQcXszPmynEwEfWQNjH8CpQ4htJfc/SJ
         yAJZFcyaVBh+LzvmYR0eRUjOwj6/K8iBb/RQyAUz+iTH/+ay2uXWsXw2lpiUET7yeiBl
         KEBg==
X-Forwarded-Encrypted: i=1; AKwUvBwARwLSEI/TULwFlGNwf1kZww3MCc4ZNGdhisOhZI25KBwFyiT6GyRbpSUCwwFK0yoNFOcN87FakB2iu8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m4Fxw8jbVa73FMYJTtfJpas5oXIHwnQJpzw+zbcfCi+xnkIQlQ
	iIU6xTx1L8KISwmoDwhhiqi1d5hIy1c+3ijtqPX5X335X2Z7jLYQU7NhrjsCLBpUWdA=
X-Gm-Gg: AYBFou072uNd/Rk4xd1u5SjaUAATdH8s96G0946aLdbxqtogY2SJN4gwEViI+L6bpDb
	fTBlRZRm1/zsSdeUFKgJROC/8rsq8hvLX8PhUbk4pMOdTKxw3TTTZ5Ar38sI4i0U5Bihx/5/wAM
	u3OTxLa8yIcZYfs4W1fCrb45IFC4odhAH4e4FhoXYFCsL7IqujrnWilDH785N/P3apkgweqlZ2s
	VBgK/hCaJH7ixSQLYySPIKZTX65ExWofsOcblOZAIMyvsi3Ezt8jwhZ46gWj91Knl/Z3sECuqrE
	dDGvn2HTyAduLZl75x3SSTrTS5JGCy5C+ooZQEXnb6OioALAU7WEI/tmgTzD5TczSpdVPLdLdJo
	1Mqn4wr7ex9j/Q7DVrZvbgqC2pLsPdU+KCXr6iYnVKUJ/bT4kCaSYR+aKGObN6i2+2ejq45ht76
	upHejrjzntCOfZ58bYojPXBxHAWO4WCtkX7yRTCMEP4csnXFeod5nWWYi1Zj5rF3P+VxE=
X-Received: by 2002:a05:600c:4307:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a0274569f9mr25694905e9.0.1790929945843;
        Fri, 02 Oct 2026 01:32:25 -0700 (PDT)
Received: from zovi.suse.cz ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm42507905e9.4.2026.10.02.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:32:25 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rudolf Marek <r.marek@assembler.cz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] module: Remove obsolete __MODULE_STRING()
Date: Fri,  2 Oct 2026 10:31:03 +0200
Message-ID: <20261002-module-string-v2-3-fc7438acaf4d@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
References: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

__MODULE_STRING() has been an alias for __stringify() since "[PATCH]
MODULE_PARM support for older modules" [1] in 2002-12. That change also
moved it to the graveyard section at the end of linux/module.h

Remove __MODULE_STRING() now that all remaining uses have been replaced
directly with __stringify().

Link: https://git.kernel.org/tglx/history/c/136839a1b4 [1]
Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index f6f90cd88f15..37de77340032 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -896,10 +896,6 @@ extern const struct kobj_type module_ktype;
 
 #define symbol_request(x) try_then_request_module(symbol_get(x), "symbol:" #x)
 
-/* BELOW HERE ALL THESE ARE OBSOLETE AND WILL VANISH */
-
-#define __MODULE_STRING(x) __stringify(x)
-
 #ifdef CONFIG_GENERIC_BUG
 void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
 			 struct module *);

-- 
2.55.0
