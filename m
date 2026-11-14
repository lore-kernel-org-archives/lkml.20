Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672685;
	b=1u22WPYPuC72m+jRkIlijqYjJp0hVFwK2mCRU6vd61xk5znuqiyVp3odqixESfN+uhuc
	 F5yUbtonDItkgI0CKC4BAmjN7VHdBOWyWeIY2iCKy1MCgcd3jfxO+ufo6dlMIiSyq+oJ/
	 5pcxLI+CGyKE5R7vs06z372/pNCJF+Tk6au/V7mu0zvgyLtfV/qXEiWr7bQYg/RMATiKR
	 6vGoHs6EvreVGCSqn1HfGD8gA7y+1FbQ2MxLvHWYNwgaqHdDFAnwrwcZk/SRy49X4jicz
	 qSGU4jyvLItW9Q4GRTeNeccfDsqlkhGH3lPKodpM3lXZJ7KcUiGiMov4w1oqWO/by1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kYhEGps0UomI4ThdCaZM/6xhr977LUTH98N7MCn1AQg=;
	b=F5o8V1naljLNc7xsGlQc5Pg9TLmz6D1n7z3tzE8iH3/GthmDdLBgfMhWzY5GIndAc/F9
	 iipY7EawfX70/9Prn6EHeKZjc/VclSyy66ZjBLnluM8dBIxuTpw1gFlz2czXVDGBI/uM2
	 IJFIUfhkaxHb0ra+ZD+l591wf2lTk6y2lA9KziIY+6gU/vjy8a1JhkQAlEQgLAyBH7A2C
	 JypshMLi1TlQkoeLW9kEtiWe1WsvzQ+z3lW4NTTogeqSW0iHnU03zU2tcYVU+yIiyLoyq
	 TrNYlBPBMmqHDXszQQKYsIwdnvOEIgBsb2JNQIpIGRRUKW4qmBnVwMRf89YkI+cywww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=woZHVd2i;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AF3606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AF3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=woZHVd2i
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3783678eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672683; x=1795277483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYhEGps0UomI4ThdCaZM/6xhr977LUTH98N7MCn1AQg=;
        b=woZHVd2iT20k8onAr2nEkXQnRJzo+gE+XboKYFuhp+KmzrYT6SgzU1/w8CLaRyxH7W
         MG7hnoPZP1hoTDWDHF7hpqsnitZ7bgNjWJPRhDKjaswZGCPLZJTbE+SgOSioqSU56i8m
         KaPJgYraiHigKrQF2TJpzcvdZ7ubfJ1rUoVZ+CvWKGnTNEhjHVGk2NFp9sE9OBY+umOz
         6R+imaKPsGgejASGmM9w0fbxB3Ec6Z6TOitLqyHmr5StObSyx0wRx3uFLRFJrAg1pEmU
         tEEXbqpH9J7fHogpX2xqUr9KTuElLmDAhnv8DcF4GOeM6dILd93+CZ8fHQyJuMqi91Iq
         HJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672683; x=1795277483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYhEGps0UomI4ThdCaZM/6xhr977LUTH98N7MCn1AQg=;
        b=XR7Zg14trCKgwAIxdunjBZGm9knZj9EL2jsabGREvE0LL0zr4SzQdTLHDG0LB8l9E/
         T9ORfZ6YZtKGn01WbTp5Okm8Yk0dgoMb6VLsgYH/t61G5t32uoM8MyEtxK0rCkERtV7f
         sS3dlIxhl6cPIov71Qrrkfd/XErB+10P5cdFqpzKQCrkvtEQabNbTx2kRi+zvQuHZX1B
         OOYj4ZNzQ6ChFD73sPGy8J+fH1TUsswHrvA5IooZd/WqUST5rSL5fsr1WDAJ21A+/+CL
         SITdXriRJW/lLMdbHxAbh/J9osLvLdBzMsT6yzZBfmjgegC9FXXnrZ7Qgtmy1LuzK4cB
         0z1A==
X-Forwarded-Encrypted: i=1; AL+hErG6jblYoQ8OPADFUgGuKxSpFG0SkYy7XRG3GOOxDMKDrTh2BwjirHSimfEn8tsyH2bDrTg/QGODJRxxKaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BzQt1ZRakrYLdQPJgR7n6kp74OB6QHluzZeVxNS09fTxE4YFZ
	FOB+Cp/ux+tJvKtHmqSWhJcySQ3JL1dkcCiIgOsM1Rb3kJo0jZ97nzE=
X-Gm-Gg: AYBFou1u4Svk+zpGxZD4pp4f2cNXLgV+Kaebes01klMUoB5fYKPpdLKctoQIawiQTIC
	Wn49jgSbNPF+QX1G7LkY8HtoGHLKH6+TkF/9PTurglEG7Aa8TT0c+ZPxLj86a9Mm+dDbR2zkpX/
	uonMvSPwtLaKqJsyJNxqng5upPeAjV1Ukg4voDjEjh/ilXSqSVsJMxx9P/ZfvO1BHTsc4tIGkOE
	G7NalEF6gup4abw4Ym6Ywde02JzNUc5yr5TaGo4xAFPnxCDIyLhksjGC/L9QVgeiemWvyxhyrpJ
	mYIn4E58ENCYfi5s15D41SZistAp30JlQhYhWfGrKStyV0VqGyckoxTpboJzoKfjUEzrY/izc/C
	YSaQEyppTPHCwPMa3m1AxmvDA/NtIwuHkePukAaDZJRhL4xeBBBRfp0VZqbKMap8kWQJKaqm2uf
	KHyFimGY5bx4RlkDHDTjtXJzAdW84hnqo3Zd5vJq1wJkDYtjnwvGl/zL6wHPJRAeuHbVnaALZKf
	t54/LDrdGKYFxXKJRWsnTUcfecwhOtGj2QGptqDhqDCEWe8HfQPysQyQbm+e7qGHFuK/XOxNQs6
	8jnbLOM+U9uQ9pJ2qGztfoBqiBGjATZwo0ihPwPVoAGBzIKG1TnH7aTxFa0ya+CtZg==
X-Received: by 2002:a05:693c:8115:b0:36a:1008:5815 with SMTP id 5a478bee46e88-37963372d85mr5904580eec.5.1794672683015;
        Sat, 14 Nov 2026 08:11:23 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:11:22 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v2 12/12] drm/amd/display: Skip panel power savings on eDP links without a panel
Date: Sat, 14 Nov 2026 11:06:36 -0500
Message-ID: <20261114160731.3756-13-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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

From: Andre Eikmeyer <dev@deq.rocks>

When GMUX routes the internal panel to the integrated GPU, the eDP link
of the AMD GPU has no sink. It still exposed panel_power_savings, and
tuned writes it on every switch between AC and battery. Each write sends
a hotplug event and the following connector probe runtime resumes the
GPU that GMUX had powered off. Only create the attribute when the link
has a panel.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c    | 3 +++
 .../drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index 703d0617d..c8fbd2167 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -761,6 +761,9 @@ amdgpu_dm_should_create_sysfs(struct amdgpu_dm_connector *amdgpu_dm_connector)
 	if (amdgpu_dm_connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
 		return false;
 
+	if (!amdgpu_dm_connector->dc_link->edp_sink_present)
+		return false;
+
 	if (link->panel_type != PANEL_TYPE_LCD && !link->panel_config.cacp.cacp_supported)
 		return false;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index 7ca17f803..d71f5e5da 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -52,6 +52,7 @@ static void setup_test_connector(struct kunit *test,
 	fixture->aconnector->dc_link = fixture->link;
 	fixture->aconnector->base.dev = &fixture->adev->ddev;
 	fixture->link->connector_signal = signal;
+	fixture->link->edp_sink_present = true;
 }
 
 static void setup_test_dm_ddev(struct kunit *test, struct amdgpu_display_manager *dm)
-- 
2.55.0

