Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6140D4FE2C9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861861; cv=none; b=GWWXlqjgifY5FHtzJr4h1AuxqVay2GzlISK+MmxKQ0I3rY6VXWoalACYDiq7gLBCYvUwFy9SnEHOjEhKg4pIk8Qlx3l92/91SzJywdFZwPl1mJ/XtqxRuB6eZVYNfoSgczXDXpdDKaAPxmY76TiRHuyHioGnM8qq4OUlYFMLdFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861861; c=relaxed/simple;
	bh=kZai7cDOlZ0+l6zlb8MOoVY8sOR0vPM3UXr16XTNIpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdlBykeQa/QJPkXwuWNJPjmooVrQ2EwSzWSp+LB4iMxyCPblVXlJrx/BCnwH2/OEk8lWQkQ5MWLk0TQPIH7/mZ8N4Yg/HfYl3JZ7+fzbZd7uBNW8PqDlWJFavB7EjlRCiBGBbus1gcq/y4+Y3a9xIcvvo8mdjM0MPvtsygp5YLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2/Sdgrr; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2/Sdgrr"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4e9fbcc60so653425a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861857; x=1791466657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=U2/SdgrrYmurfY3l8SGcgO07WYtuf+WHUF2IpJUeDYWVktnCu5PMgBuHV5p69GFBcw
         gbq1Vj9iext+9TBETpcqXY+vwdEpLxF5vEJ1T6ie/ULGbDTZsTmnfvydjmyRly2gFDCo
         pbr/SiI15kg7sEN1Fsnu6ay1XIJ6Z8V5o/Ey5VyYrBCwii7qZKQCHb1U7aTQJxLuKOtv
         ufJDS4cHIRzgszhi5L4PNQTdjZSoXoknpWWKY0PYMJoXBkQTJsFgd8fptmTsOwmc2iD4
         MK3O8WeJ71pRO06dWARbjDZORK0IXfxrFB7u5YI5VPNEyuNvf7ZR8gmZbpQOotfvdTp3
         ZVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861857; x=1791466657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=XLB+DXOqb6e6SCuiDoyJcp7Em4N8WAO8U2bZRevpvF8hj2wNq6rUSDlmr0VWCxzVKX
         D06hOViqT3VY4CycA8uu8mbNBkQoa8V+bIrR2NLkVHx6dbu5Bc99BXIDlmY38CogfO4b
         03KIDgu7t+vvkOx7pCBC5C8c5pQvmtObkf+pUgYlhUb+67peVlmToLorv0s/6cwvl3r9
         ci1xjgcrOujceu36X6Z4il141ifoFlVlEuIWQ7SxxXRCPbP9BDG/3FChH6RQoWBX6O3a
         sfCvE+o/vcNTvxN/j9EmzKdsXwTjqHNKx/3gCkMd1w/tmzGCE5sNT3LIkHkLNmj+QdZT
         6DKQ==
X-Forwarded-Encrypted: i=1; AKwUvByTG1b2LqTeEJ+6r81GoFuSEC4Y51UC8gjfbCsUxMiIqFMasHfZ6pNp7wjKcfMvXpZp2OGt5kc9lx1sFF0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA6ig8+JwMUaT3KM89395v/Q7ONFqMaEh8Kpz6MxfJWs/ei0XF
	wO05YaHLEluJeoFur8O1wW1DTh2gNCWDYDPNhS6K3ekOZGeCfr9PzwE6
X-Gm-Gg: AYBFou1RctNh/Hwo1v+n8bLw9yjOGlDihYm4/EmZnd6W2+yhUsEeyJ7pCXO4JJwPkLS
	ELyMRO4tqjrWD+4blj88405M1prgeukFDwab0ystG+SjXBstMu/675PYEFkCc0OdSWqruc+qmSX
	quCEZs56Cf12mQ8vIE284VCsy0ljuMnRVoezdr58G9TBNSx9EOTQ6mzjXExwDRfYYVsT9APjdjU
	7nAzyyTFEdynkUgfmmGmxTW5nDKY72v2XAwXpo0iIS9T3T5ESptqCFB80Wihp0iHfvttRxdOMGM
	42HZMyNmC6vHAPY6cHXSQ9KDkITMnNyl84hfgaOXpRNLJrVp3CvkaGWcnCdvhH40dNuQOVfZtAc
	ERd5w5zT30QmM5yLOhYyGs6qcQtOFWI6Ncj/4/jjFqY/8W8eUFo1NB6CC2436jPlBOfMNY7Ezp+
	8Wc/H/1uDrgOUHBFo5ZkSslQZZMGD/jirCh+Ev7lZkFnIc1sXfjs5Ibb3qRFGSEDnCgEp6OJg=
X-Received: by 2002:a17:90b:3849:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3a4d0f02250mr4016440a91.9.1790861856840;
        Thu, 01 Oct 2026 06:37:36 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm4715737a91.6.2026.10.01.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:37:36 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v9 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  1 Oct 2026 21:37:03 +0800
Message-ID: <20261001133705.69244-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001133705.69244-1-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a6978d14b975..93a519b96189 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

