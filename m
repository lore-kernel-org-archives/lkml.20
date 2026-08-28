Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3313326939
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929080; cv=none; b=poBck2uRC6FeaY2OoOPTq3IPbvmyL2ebky8VPlgdaJ51th+FxPAV/3RG5LijRYpMhjT5ZiYzZxrRh3vOm/O/hPxKcbX9g/YY0Ysmj3Yzer4cgbW6NF3rcs4CB5SQz701Hny24Hn/DCl05zybgs6HXvEm1ufbztxz1gWfG1xzXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929080; c=relaxed/simple;
	bh=zb4f0TOM1edy2nxAfvHRTgjaq3Y7gM76Vog/0hLTNX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lk/U/cvx3Ll8duZWs97Yngr2xHIUX7ySEUnraEoEBC8grQS9D7XZmEN6DoXCh2AaWTZJymcI25mY9XBPSVTb6Ik0zAIBE7YqVk+JhCk0VMmfNPDJvwzniXnViZ/Ysrs+7BLqt+0ioPlwrmJLUbuF4zHn7Zk2LqLiOcrYHLCJA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLgBdYtr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLgBdYtr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38f620399a0so1102315a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929078; x=1788533878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bg0cMSBx6jvoo6FdRRB69kyQY8hrlgEg3jHHCFAWJo=;
        b=dLgBdYtrpnmy2aYKdcZmWQq/JyF2Z05degWdmz7WyKOAMUeWiDdPAeiOXfBBf1CdPY
         WcZvvO45LlKn1A+snuxNT9Hk7HqgyXZ53Tu3MShXVY1kMmYxrGpbpVWSv1LwdGMysX3T
         kZcpIORSn5OdhH9kIhG1Jiis2QT4AIxgxWgb64go6KVNiMRtrZ7anW8z2b0Uk58dAd4b
         +v0DdiRHR2sAjAkldyQgJUsmkms2Ku0XOhwFdFf1kdzgYelK32NyQOnmb554Z6E+/AxM
         WL1uyr+EoVHGG6hL9uZVyd+VLkfVgPur438hO5zWZOffg0u8jEkYfgFs0DWAWOKUEK4E
         Fk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929078; x=1788533878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bg0cMSBx6jvoo6FdRRB69kyQY8hrlgEg3jHHCFAWJo=;
        b=rOpYRrSh/KN4YhkYgl2XgSj8v8fz5nIRnykgbvrTJtllAhdCnCfUN5XLNWMgf/63e+
         zep8uxS8fsOrMaZtsUuZ0isuwU923Md6slBMGYJCp+wlhJUD5GXE/f6ul4qEAhw8JNBt
         WzkJJllXnsvsGm1iOVjdT8aXYany2SfOgdk5lxVqWpv9el/MdwSZ9pbcrslfx28syIBR
         s6VJ7bQqBpdxEmZiyhPDFIbKStTk3uVIESy8ddR5SShZ+TPUYYz88OtftHNfJuwYwwDe
         2eHM0/oISkwani2ui9MsdwzjgFR6ansMd3yz6+k8azjxTocGKMqYSMm9oYVonCUOsn0B
         W2bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqH9CxnMmcEDwAaA7LiKTXL22EJohX3J0vgQ28f3OPhTKcqfLc1p8KZqdLNorCJJ4PeMikusNT+lItGTho=@vger.kernel.org
X-Gm-Message-State: AFuF++lyY5gBWD+hpJvexPm8FrpI+u+7G6qFzh9SuTheuMegb+HRDBsI
	JvgGn0LAGyh4DRu4sR8faCjD4sWHt3pQt1fgI4TVLRID3Jkuuxszqulf
X-Gm-Gg: AR+sD13bF7hGVyYD5gHZFuJ4zVIKh3mUCzYedTGnL2vii++4Zx1MLCtNOcbAz6W14MP
	hmIGQdZHRGbOeVva3D5Lc1p13aUklg0MMuakAeqDyrq9Ktg5Y38de97cZZZBIEDvmpN6F1xcSXj
	85Dpixn7jYWocFsu9Bn3IJ7vshtDyL/+9gf5EQL5+OwW5NPm8Cu2VPEzuPCIF6RQjw3/Zq5sG5A
	3lKdZ5lMrhWOKvYMuc7yUyE8cCq1shFNLa5Q8Pp2KniUMLA05CkYhceXlkCghIxOOfYu9G9Jnsj
	zwf6KxEYWnDZZfZQpofUo2E8NZvFnKUrGjzFISRVNp/6cLBNfjEpqSHRoMCVCFq2LnAGf7QMn5F
	6xXVnC2kLKzfbK233dFzxQFgmLtQGHnPDaph/nuA8odOv4/erDJJZOiRqoC4QV5117h0RMHG6T/
	6pZ+IyeldUlPcHblTRZcvKpbyIkPVyId+ZcqB3WVF1ou95FZ7cMeHfvuejxqhuXx/kF+MgxFaQm
	/vapbtonAA0Qg9cyYaW28pyOnpTk4RKnzLa70T/pF3XwlzJUg0mTJvc7gaOfsdhGVizFRDtw0PG
	JVwn0MeiF8fSbQ==
X-Received: by 2002:a17:90b:1d04:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-396d0f75f2fmr16305656a91.11.1787929078047;
        Fri, 28 Aug 2026 07:57:58 -0700 (PDT)
Received: from linux-dev-rtx6000.zfl.local (HEVEN-AEROT.bar4.Portland1.Level3.net. [4.19.244.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm2894396a91.0.2026.08.28.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:57:57 -0700 (PDT)
From: Rickey Bartlett <subtexel@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Rickey Bartlett <subtexel@gmail.com>
Subject: [PATCH v2] platform/x86/dell: alienware-wmi-wmax: add Alienware Area-51 AAT2250
Date: Fri, 28 Aug 2026 07:57:56 -0700
Message-ID: <20260828145756.341733-1-subtexel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Alienware Area-51 (2025 desktop, model AAT2250) to the AWCC DMI
table. G-Mode is not applicable to this desktop, so generic_quirks is
used. The full product name is matched to avoid colliding with the
"Alienware Area-51m" and "Alienware 16/18 Area-51" laptop entries.

Tested on hardware with BIOS 1.6.0: loading with
force_platform_profile=1 force_hwmon=1 exposes a working platform
profile (quiet/balanced/balanced-performance/custom) and a fully
functional hwmon interface (6 fans - CPU, 3 top, 2 front - with fan
boost control and temperature sensors).

Signed-off-by: Rickey Bartlett <subtexel@gmail.com>
---
v2:
 - Reorder commit message paragraphs (Kurt)
 - Cc everyone reported by get_maintainer.pl
 - Send with git send-email; v1's indentation was mangled by the mail
   client

 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index d1b4df9..2b0ffcb 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -121,6 +121,14 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		},
 		.driver_data = &g_series_quirks,
 	},
+	{
+		.ident = "Alienware Area-51 AAT2250",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware Area-51 AAT2250"),
+		},
+		.driver_data = &generic_quirks,
+	},
 	{
 		.ident = "Alienware Area-51m",
 		.matches = {
-- 
2.53.0

