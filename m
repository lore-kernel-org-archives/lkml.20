Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852820;
	b=dK4x5N29L4INu95TDdFtKTcfhYOZb3rCqPd5qg7a+Dni4xiYtLe09B+4udk8lDjLFpR8
	 WsCWhIqcgJ6pn46CmRSVTg/L8R/J1CjRE2UU3I9fKQhzCHUX70O1pujlnI7JSIz+bDZtk
	 VnF5K68rQNKxKchLS9nWvwTskz7vAncYperAshXsOmwbG0Pm+4XjRqyJ30DLvDMX6E12E
	 Dx46g2VQVq4FgAJ5rnuEJHquk5c9ge3YgUQtr4rXZTlAdhZDEZtm6q6G/7xw0Aq93jCCc
	 4GvJbcyYkrdTIaYOLXoW+JLdIfpPTva8hcdVhJqF+aF1Vb4NEcypt6JXFOkPUKNGFaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Dx9GlhWSYYSjKrkLodD2g0q9NIvhIS/VlB9UxsGFr0=;
	b=cmOPYkW2/m3D0yQTRQiNzCQ40wm8kz1LjN7ozYFXSOyf81LDwRdQyeZfceyD/h4a+015
	 iHZveSy4m8EmZ8SRGUJvPhbE4IwlgO6tua6bUcROnykEmehdtKrJF9e/vnCGD2KT0A2UQ
	 r2RqBkY47thc20wd7w8K9ENEGrwddlThihclQ7hylkQW1xV55BE+YM3rnBb/CJSM0ekI/
	 Rv7cLTmmfUeyIQc8bYOKEQ4qSVbZYN1NAgokVyp/+AHKA2CXhc7WJs06nNV0EawBMBPKJ
	 3daaptpGaPZCn98ol+TyIl0cfhXOsIaQ29VgmWnwmQiqv4P6sX7NPsNoPuPqVMcCjEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHAH4Mpa;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F32606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F32606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHAH4Mpa
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1453716c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793852819; x=1794457619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Dx9GlhWSYYSjKrkLodD2g0q9NIvhIS/VlB9UxsGFr0=;
        b=mHAH4Mpad64UJiZp5ruoCr59wzblMsRYZTtIuYxJvK2sy90W600cldVglwDrg5IuXe
         DhdGmi3PraSVBjy8GTEHDNTMSktut754GjoIvoGR2QOerY9k9bG5QdXtsIEwY5e8nTfb
         ETXdl1fQ+tILXuBOa/qzy/Ve0ZIIAzb3ioZ+AwWMD+n50KYSxr+xyxo+9mxR0trd541m
         oVe2U3Sk8+KRG8nccZxt/Q8mvO81BoJQWksoG7g47ctyiyGntGURexdOHql6IGD8K2lT
         CiqaAIBu9tt05b/81TVS1gnILr6lfRm5giaqVJvIaWPPmE/ogtze4qVn+wf9lTutoQM7
         BayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793852819; x=1794457619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Dx9GlhWSYYSjKrkLodD2g0q9NIvhIS/VlB9UxsGFr0=;
        b=Bx/RC40CrxqQZNDdtG8zfvXzs18xsfiwrMf2SU2Cb3AUQxbOwrBOB/lZrSijxs73dx
         vTJ+uBCXMzV1TMNMOVwwerMak7+DZ6Ngr6McojpPAaoHOznezNFBuNBrdiwWyQm/iqU1
         Gw+AS+jD1MuAAzXH5H7veKuJs4x+CCwBoSmvev/fnfJILXQ1fayC3EMKuYHyW1hdoiXR
         njwEVRtXj2Zhfj0ywrqVOsfpvuBIe0xYzMqJTjK0vHDKCM3XzNGkFT93rrm2YgQUUoyg
         fZ0QWxRwzltLiiLMAXrfyKrvUUovBAoApIalYnAbNzHaS2D2OKueRWydlPo0whvjQsqB
         DFHg==
X-Forwarded-Encrypted: i=1; AKwUvBwyNEq4U8j6OtJf2esvuvXFKGpBn0qN+pzJWqkm3wOzu9mRs9Hxh5mmETp2VXu0XaMQ/8akqUuvO//PoyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vrhD9SUvZVc0ODAJM6dRlz8VDxycP6V6dDTPXi4tFUcplTG3k
	YvZO+uA+zz4VCQkErlt2wPMvDGVsbIEZdbdhNCPQuK8ZdihZXPv4AMF6
X-Gm-Gg: AYBFou2XlvdRrp4L8tm/V07lzEPlakomI9S9GhSlPoh8o5iM+7xE/IJC6VTZdEbQnhl
	vzdUucNZqizHWl9lL0IKwLY1RxRhoboyuZMzNBNcUAIvUOkdfABsxE0zPpvLu6eXmRwyKEgnYX8
	LPOESjqchlWvUEJb1WXpAGaMYkP/gQsYtSIbcgTR1g+z8S3QaF356yHdkRVTSOV/iXbaJRrnzSX
	iColHx1RyE8aK2UidEFKcz381pIFvv/NZ+tPxv38HdD4OABI6K9xWiH6MoYEQ33yD5pXYCB0ZQ1
	yTFELtOA+AxY8GCbyA9uVv/puR7tvOG0HRHMLRvSGyHRK87f+TGMlWGSpnkdqRnBR7IubXpN+5K
	/DryHywIoLvm9v7lFPL1mZz0EddATaSO7ytKhz7ZCt21PDV+ATbEaFMUl8/9vngJBSpDPylhGMA
	Efb2ouSOZXzt94Fl5uew3hZUxuBbSt3SHRds86fNb1zaQY/BvZJJoEETMKnZxzMJdVeSzbXJpY4
	2XIBzMjw/S5Ii6PhVzcryHKuPtFq6+xUSs4n0LC6ts9EHVA1SEXep8H2OeAOG+UzLz+YSTCa/1i
	OkDqk0C0laTkmqzjV+/X+fIZskgDGhJnK27zQfFvL2VHhOT2lCI2f8GUKJzkES/cn6tS
X-Received: by 2002:a05:693c:894f:20b0:369:d992:e3 with SMTP id 5a478bee46e88-36a4242b2ebmr25756867eec.32.1793852819028;
        Wed, 04 Nov 2026 20:26:59 -0800 (PST)
Received: from localhost ([2409:40c4:1ac:755d:6be:3eb8:a598:dec5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm11383276eec.17.2026.11.04.20.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:26:58 -0800 (PST)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH] Input: synaptics - make InterTouch quirks table driven
Date: Thu,  5 Nov 2026 09:56:14 +0530
Message-ID: <20261105042614.688312-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Move the device specific InterTouch quirk into a dedicated table to
simplify exempting more devices in future.

Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/input/mouse/synaptics.c | 50 ++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 1ed9261bff2b..748ade2004c3 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -213,6 +213,23 @@ static const char * const forcepad_pnp_ids[] = {
 	NULL
 };
 
+struct synaptics_intertouch_quirk {
+	u32 board_id;
+	const char *pnp_id;
+};
+
+/*
+ * List of devices with broken board revisions.
+ */
+static const struct synaptics_intertouch_quirk
+synaptics_intertouch_blocklist[] = {
+	{
+		/* ThinkPad T440p */
+		.board_id = 2722,
+		.pnp_id = "LEN0036",
+	},
+};
+
 /*
  * Send a command to the synaptics touchpad by special commands
  */
@@ -1814,6 +1831,33 @@ static int synaptics_create_intertouch(struct psmouse *psmouse,
 				  leave_breadcrumbs);
 }
 
+/*
+ * synaptics_intertouch_disabled - check if InterTouch should be disabled
+ * for a given touchpad based on its board revision.
+ *
+ * Returns true if the touchpad's board ID and PNP ID match a known broken
+ * entry in the synaptics_intertouch_blocklist table.
+ */
+static bool synaptics_intertouch_disabled(struct psmouse *psmouse,
+					  const struct synaptics_device_info *info)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(synaptics_intertouch_blocklist); i++) {
+		const struct synaptics_intertouch_quirk *quirk =
+			&synaptics_intertouch_blocklist[i];
+
+		if (info->board_id == quirk->board_id &&
+		    psmouse_matches_pnp_id(psmouse,
+					   (const char * const []) {
+						   quirk->pnp_id, NULL
+					   }))
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * synaptics_setup_intertouch - called once the PS/2 devices are enumerated
  * and decides to instantiate a SMBus InterTouch device.
@@ -1840,10 +1884,8 @@ static int synaptics_setup_intertouch(struct psmouse *psmouse,
 			return -ENXIO;
 		}
 
-		/* Disable intertouch on known-broken T440p board revisions */
-		if (info->board_id == 2722 &&
-		    psmouse_matches_pnp_id(psmouse,
-					   (const char * const []){"LEN0036", NULL})) {
+		/* Disable intertouch on known-broken board revisions */
+		if (synaptics_intertouch_disabled(psmouse, info)) {
 			psmouse_info(psmouse,
 				     "Disabling intertouch for board id %u\n",
 				     info->board_id);
-- 
2.56.0

