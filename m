Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230822;
	b=n2j1/99t2ZoLntzXHMHOe9/TOOCyiqq8i+8QbWkKNHHGYz+d3i2/2MH1NS6RdSkYfDQB
	 zAMbi/VKSHUaoFzgJqiX/E4QKUTLGPa2zb5r3/fLrrgAIUA+Z9GyB5klYiH3fUryfNXoA
	 83AG2079u8OLWTfeVHXSZ/qgVCnM+EN8sSU6kyidz/ig5MnChAjFCZdi/wqFfZBqwsOfr
	 eSVlwMibcOqzSMQO4vP9XzTvIDo+HyFletKIORhXqUjX8zqnVaMRLYr+GJOapZO40TmOx
	 LiyIopXI81+eJa4CtUrWJnDCYmPWHgMXHsWbXBNhBw7K31tXlOLVP+4wEzawuX114kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fIn4mkSNdY/hxwoGUrWw1hPa5UFbAE2sAhOFZhD431c=;
	b=W2mGx/DA2aa7GjEpOO7Iz1CJe9aXdKJcELbbBX+Y8sVVx9PCseTn6edXHwnH+Tw3/lxD
	 WH4LSRmyIKS6YSRX7QrQjCnqugZsSjuYtqtLVw8fZdY3PvdCi7zglHJKx//oQZZMN7I4I
	 Qqr9DWna0rPyaidmN5ChZZ4ixpZEpl2tzgsVtmJt9zHE0mh119iWS71uR/tWDm5f7vXqk
	 2pX3j5RqmhsnAqaHopNUH1zZGUjMmVPgwZHq3bwouMtH6kHplMan+QbCBLpVtwRFdc2p0
	 LDxPDug5x8wj97Hlcq8UZdGftC0jsju53z6sdW8iKv9QGXdrQ4yVeFk7z0lRoG54XyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZT4zOJa;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1E606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E1E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZT4zOJa
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso306584a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230821; x=1794835621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIn4mkSNdY/hxwoGUrWw1hPa5UFbAE2sAhOFZhD431c=;
        b=mZT4zOJa3/7ArBrrRCxYPNgWLvl7ph7aKv8nFwGeFoewMgtOzpuc6CHXKWj2ih9pCp
         a15Rw47RPdvfYsoX8zx68HtsSYbCRTWO+j46lSWTWrg8EQW0x8jrGTGJv6rz9mNkWxwk
         ZJd4kGW7vF89JqJdnkiSWUH61/PEZyvKdhHLNApscgE2euKeZOl1Qlr4ltXeyZCwLpqv
         Cf4Mj+uLVtmBCxqwJrqnIl04WQpUI91FmyF/plAfCpS5+U8ZHgcLAyy01r7CJDEyH42D
         QvaRUZ94d1BbPAIWbSIpkgSBhDfwgwc2Cuzc6GC9pwUiCc3RF5GxPQfeO0MjcFXxDkfP
         7dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230821; x=1794835621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIn4mkSNdY/hxwoGUrWw1hPa5UFbAE2sAhOFZhD431c=;
        b=CY6xQGJ6+NgaUC9TkJkmpTeRTCCXxqIVRTYGWKhKO26o5a2Xqy/ACFFg/7IaApAEP5
         u6mqZo77M5qxI1DgtMxM+Yzc4U/D9L3oQedIIf0ceND9Oa1ZcmTVusoyaUehR+OYOENj
         BSLFMigfIcTV8nss5ZZLvSC9HYcuy5Jo9Q0NPrd0uGEfy+snniSdzrCnss+Qoesp35mG
         2d2UPBwOOlAIXxYr3aNW+ByuK2m/T2SezMvAgYigil0EptaIjpdUgXZI9/yoSc38xqrv
         KszaZLpbAmGwStX199wPjuf9XRfFMFDerdMF3WOKnjZRCKITHlg1Uqpfk+yWe1ESCpja
         utug==
X-Forwarded-Encrypted: i=1; AL+hErGWT0887BfZWwmmrYPVAQbESeitYAkzH7OM7W1Ofb7yyOkmhQGWnbP87gAJ6Y2JJX9aFyXgmB7gU89qxWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XWL48V6keYg258MJWHWz2ws3Dm0T6SfXd+wKxCP263+fh7WhT
	rWQJCSHxwe+8zIwQh1nBf2T20V4QWq3XIGdV15WcUJhVPVvsMI053Um0
X-Gm-Gg: AYBFou1YllWZuWT6NFPQ56urD/YSXiaj3uX3XvOhrieBJaz+bR1MTsRVu40tPKpwHzW
	l06K2cp92C4ILO1TRoD71ba6Yt38spA2gdtM3MUXP3qzFtTTy2JA1VbBMFvHuIteO7Ta2NWUC5P
	fIo3gzTybcQkH1Id6ESv82U/lftNTvrK4y2qjXP3kgU87gCM7iLAg+Vq9fdibNz9mdYgIb6xJnB
	pKhq69NFqIWRTrukw5FC0i/Yb4kwQbbkMc6L0y4nofTer+wGXnnObKLJ/eACvhrE46VzPCuzxIF
	2a0Vze+7PhQORHS6EsDymNAhI8kh4j9idz2ZwclEJABLW7HPKQ4QTncdKfUGL0RjCfwePTjoqF/
	E/g162PjveSclgBBNdY+hZ589bHhJZPN6kwtRzpbak9h2adRBZQi2mWaXqgqOJIbjNNg+HhfcNe
	T6ifgABdXB0gyg+k+MO5oVpFJ8JaiZQLpTRRGhiFAZkDUSaBlveZl23tCj5u2ugfVsI9nKFquvr
	6kSSFdGqx4owqH4Rq6IgRVKJQnFVBQn56s7OP2iFL3pS7UmGxS0MAbq2RCp7wZ+I5oq/5DvKHUH
	Tnp1r+qrJ21mtPaLNZ5SaRqls9Ky+ASUu7UpIHC849pC38a9mPOKFkhvYeQxtQQ=
X-Received: by 2002:a17:90b:47:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b12d105c47mr3658009a91.1.1794230821078;
        Mon, 09 Nov 2026 05:27:01 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:27:00 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 5/6] fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
Date: Mon,  9 Nov 2026 21:26:20 +0800
Message-ID: <20261109132621.3862497-6-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

The MBA software controller lowers the maximum bandwidth control when
the measured bandwidth is above the value the user writes to the
schemata file. It relies on the hardware enforcing that maximum.

A maximum bandwidth control can be implemented as a hard limit, where
requests above the maximum are not serviced, or as a soft limit, where
requests above the maximum are serviced when no other request is
waiting. With only the soft limit, a group that has no competing
traffic keeps using bandwidth above the maximum and the controller
cannot meet the target. MPAM reports this in MPAMF_MBW_IDR.MAX_LIM.

Add resctrl_membw::max_is_soft_limit for architectures whose maximum
control implements only the soft limit, and refuse to mount with the
mba_MBps option when it is set. Architectures that do not set the flag
keep the previous behavior.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst | 6 +++++-
 fs/resctrl/rdtgroup.c                 | 7 ++++++-
 include/linux/resctrl.h               | 5 +++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index d70aec6f7096..d2dacb00a848 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -47,7 +47,11 @@ mount options are:
 	Enable code/data prioritization in L2 cache allocations.
 "mba_MBps":
 	Enable the MBA Software Controller(mba_sc) to specify MBA
-	bandwidth in MiBps
+	bandwidth in MiBps. Refused when the maximum bandwidth control is
+	only a soft limit: requests above the maximum are then still
+	serviced when no other request is waiting, so the software
+	controller cannot keep the bandwidth below the value written to
+	the schemata file.
 "debug":
 	Make debug files accessible. Available debug files are annotated with
 	"Available only with debug option".
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 957a3df7af83..572b3d9c79e5 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2614,6 +2614,10 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
  * With assignable counters that is only guaranteed when the architecture
  * uses a fixed assignment mode and assigns counters automatically; keep
  * that assignment enabled while the controller is in use.
+ *
+ * The maximum control must also be enforced by the hardware: a soft limit
+ * still services requests above the maximum when no other request is
+ * waiting, so the controller cannot keep bandwidth below a target.
  */
 static bool supports_mba_mbps(void)
 {
@@ -2623,6 +2627,7 @@ static bool supports_mba_mbps(void)
 	return (resctrl_is_mbm_enabled() &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
+		!r->membw.max_is_soft_limit &&
 		(!rmbm->mon.mbm_cntr_assignable ||
 		 rmbm->mon.mbm_cntr_assign_fixed));
 }
@@ -3375,7 +3380,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->enable_cdpl2 = true;
 		return 0;
 	case Opt_mba_mbps:
-		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
+		msg = "mba_MBps requires MBM, linear scale MBA at L3 scope and an enforced maximum";
 		if (!supports_mba_mbps())
 			return invalfc(fc, msg);
 		ctx->enable_mba_mbps = true;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca7f4bf..d1f989554031 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -250,6 +250,10 @@ enum membw_throttle_mode {
  * @bw_gran:		Granularity at which the memory bandwidth is allocated
  * @delay_linear:	True if memory B/W delay is in linear scale
  * @arch_needs_linear:	True if we can't configure non-linear resources
+ * @max_is_soft_limit:	True if the maximum control only marks traffic as low
+ *			priority. Requests above the maximum are then still
+ *			serviced when no other request is waiting, so the software
+ *			controller cannot keep bandwidth below a target.
  * @throttle_mode:	Bandwidth throttling mode when threads request
  *			different memory bandwidths
  * @mba_sc:		True if MBA software controller(mba_sc) is enabled
@@ -261,6 +265,7 @@ struct resctrl_membw {
 	u32				bw_gran;
 	u32				delay_linear;
 	bool				arch_needs_linear;
+	bool				max_is_soft_limit;
 	enum membw_throttle_mode	throttle_mode;
 	bool				mba_sc;
 	u32				*mb_map;
-- 
2.43.0

