Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E9264612
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473239; cv=none; b=c7t04tgc8S8RIYxWkIl1a3fuQeG3hHtAT9fJcrOWkc8OGL7VU/J0oSk27vpV17GnVJLL6ncZwFkkWee3IDCD+p95xurgVrIXdP8lun4U+cyoNjCC/dvObXaIM90lG+zO0CmnLfmIse5DtCxMjHovmgAQO9RRxsnvhJlvf0PXKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473239; c=relaxed/simple;
	bh=sn9KxYz/2BdaKnu+Jhkc59jJONIG3fW5WlAbi6N1UCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wm6fd6n179MrzZF0/5cZ4ah6CFEc20jLNWagGFve6EzHMFBcyY6RwjB3GX/vtUvXvF8++3XenZCZLu9GhpAPRKHTLhYXxpZ8NsVn3utXhPHJdYs1xNBzTa3sAMRRjYWa7wzEfH8ZHdUIDAJMGTuRWVCemHnmT0qLjWwjqVhxVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh2HeTQt; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh2HeTQt"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48881a62e09so960360f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473236; x=1791078036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VyCHyAe/qKsy76Ruxzse7e5Pw3SyDcowOYYvNkiQsc=;
        b=Hh2HeTQtaa+bvhEgRWPmvqd6vnVrl3mrdqHckSKllQFLtsswGcOcKg+8MKYzIjb1aA
         2+cn9z1MmGkJREudzeOCASS+xRiAnX3wDXyARo1NTGO4bnaAe1Bqtw6NzuUaHXDdAIGv
         4aN/R78wnR7/Mb1G/He/AoGsSEmcHKkY4lFWvDLotwVjWz2akgTqtlYS2w0ac/YRf8gx
         WfOabypBJHqrRwnAmodrd7Cq3oS42HwTB2kyQLIRhZvMRp798TwsxZzLqs9i4Vpqirqb
         6gTmA20aIeO1wU+16j/qzSZ7mo0b5i2YJ6ltABSIxzGUHzYILwhGC8oFJOhyJYulg60H
         Ri5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473236; x=1791078036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VyCHyAe/qKsy76Ruxzse7e5Pw3SyDcowOYYvNkiQsc=;
        b=DGWy+Ly/wRRKzOMSw0gvGU2OJwBOzwrCfkh5ShHGdQHuW8HMbmnLowdQX9QydwhWsp
         CU1sd66dY0Q0cTdvFie0b0MKvbIZsTRm3Vzhzbg1y0KqA6k3Rg7FFUInKbOl8SV6qbwj
         FcnhdfjrVdn5Y4hlJ82VBGbk5TvWDuPKBraJ6ZVjRy0p+h3EWj4XqqoubUIEUlfdr+Bt
         +qeDkFHnUlLu620foVNExniZuHeHVhofvUOihd0QznJvEGBGGrBbs26lG+6mHsG5xYWu
         Gr+nPVy4Xd3PmWSC96VApTxJYqrvJUcsioMjgAz89QIQvlxyB57Aj/3WOJoWIgulji9h
         Itkg==
X-Forwarded-Encrypted: i=1; AKwUvBwideGbytni9IqJOR91xKSEhMPmzay71CAqtJvLRoX4Txk6r2Tpt7aiGYqXXkxkE9jMMjqhI45vnEAyOyg=@vger.kernel.org
X-Gm-Message-State: AFuF++mnlf8j78xcv3gV6Vt86nxwfh2v2aA4QC9SSxppzeYb8NP2W5/7
	3+PJ7yoCgKZ9Gp7O+2iJw56rC68ddgixenx3jHanzb6varqUlHvhe/c2
X-Gm-Gg: AYBFou1rDUw5JX8XbXOmUmtpa03QlDZ83Kv5XDjgVPdVryItC8fhlEHZOpr5xJPV0Ag
	AfoL90np77BsKJ+6dqgWI49zy78t0NAwC1nlyync32uqd0vEv3YzfZSYQDjc8jYxpGhh/iXqIKz
	FxYjTQFKOkzD+262TJftk29rzqnq6Hxiza9t80k74sbVZEalTlvXBCeZOLaa27juRmkhvTiJFC9
	dzy5aFE9dExzaog/Mt6FxtSuHE20bju4Ke2lAwMepc0bGk9uRFQfADrOz/FvZJ0+VEeRWVYR5Ss
	PwCkthdcfJtfdxDZuY3lkSdgf/Zw3aRyyxP2ih+tYNWqqelo1EcKiMFH/C6iMvnHbnaSFJOWuL9
	W4QWabGUzPZvKR1ILizIzo4MuXF0FSeN5fGeCrNoorjhNzZHsWBeYtCEtN7SGMfRsAgf6QERMxY
	bDugebwHar0+vk8WegdhfsRk3Vz5VZ5c0DiRrsI87y3Xogd7QBsZAxQfb+msq2G8Q64z9S69Poq
	vBjV0ZFN3HmZRNIMpekPw==
X-Received: by 2002:a05:600c:4ec7:b0:49f:ff6b:bc82 with SMTP id 5b1f17b1804b1-49fff6bc143mr26410215e9.20.1790473235760;
        Sat, 26 Sep 2026 18:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm114736595e9.1.2026.09.26.18.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:40:35 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v2 1/2] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
Date: Sun, 27 Sep 2026 02:40:30 +0100
Message-ID: <20260927014031.3465252-2-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927014031.3465252-1-amad3v@gmail.com>
References: <20260927014031.3465252-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
existing entry does not match it. Use the Stellaris 16 Gen7 AMD feature
set.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
---
Changes in v2:
- Use the existing Stellaris 16 Gen7 AMD feature set (charging profiles)
  instead of a separate descriptor with the percentage charge limit.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index eeead0159..7d39e97fa 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -3268,6 +3268,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &tux_featureset_4_nvidia_descriptor,
 	},
+	{
+		.ident = "PCSpecialist Recoil 16 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
+		},
+		.driver_data = &tux_featureset_4_nvidia_descriptor,
+	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
 		.matches = {
-- 
2.55.0

