Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900956;
	b=or/ZnIN93hfWDS81PsT4NYRlOyac8zwNkGmvO1XKiiAcCo+HYBO0qoaLw2tnQdibiSNc
	 u9k39pZ9WXtgTSweLffNropipEAggLigl3zSrNr3BdQmxQYadiiUgEhy1KAPfXyftrAa8
	 kYvrdv0sIrw53c7tOMKDRCMnNtbz8Aq8ZQ0Bs/VNTJ+nZanXLkY5lKCZoHnnSp8hS/PLF
	 YLVF3TycoteNkuEPTa8WB/TJi1OAu+D+AAfJMu5fLDQW+vBz452w55+i1ip6C+iPAPQ5k
	 HKYiXb/ozclyhgl3IWJk1YFuwT0l+ogzr+fs2BI14EMHyPyYTTfPWQjodnw0qmAIv+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=osKiCGgvhu8yMTzDeDh9QImzUzGTyVINpwGdXaYWlN8=;
	b=KE+9akzccKOV8U6eOvViL4ldnib/tuBJSBB7P6HqXMvgHYngo35E8Hndsm/0e6MeIrLh
	 mTZuHKJG4ayCG0xt4W5XTj+kXwQdufydAaT//77tJC1XH5tX/FWeU4r2mb4OTE7+C/qiO
	 AIlIw108OCo6tVgm7qUErijYtS3Ieglmqh8G9chIYAFEFNfUF22AjAA0A9+JXTbHIHdCA
	 2Z4Eb+Dotd9kMjOyGQmvvLQ7lcYq/MVsp0F+u5f/xhU9bbAk4R86oNoC3Hz2rvIiAkrEM
	 bSqDa34vZ/rH2YvAKqi+86Z+uFdMuU0igLfWC2DnvygZtHv8hMOu7g/AvTuvlIQuVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KpwzWuSt;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE092606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE092606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KpwzWuSt
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so3433368c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900955; x=1793505755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osKiCGgvhu8yMTzDeDh9QImzUzGTyVINpwGdXaYWlN8=;
        b=KpwzWuSt9n8WGO32G+YWj0LJ4cjjH9gIvlqJaV/l1g3jWAHaMiCSeVl3ctLoDHUZPr
         v4jX5VvSfynhWrgTOaz83SVbBEMXyUy88uz1q376hvcyF73n5TkR8jjGqx6WETsB10bh
         KfYNGMy9xwnoNGhT8kKvlV8BQha8ZF3x/7Y3OF6eiyjnuOaMDNpFj3suP45WsshBB6aR
         Pq7ekQe0cY8xDIGJsm/WpoBDtKTDcyb+/qDfJfXi6vBSTfOD+JoQUfva2z+avQ2inYgh
         aO5BFlYNp2hJunbaPjfI/DAJdzo5URyvsEqCV2+KHO2YswNOp6f2YubZ24ZEZzlFKipU
         oFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900955; x=1793505755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=osKiCGgvhu8yMTzDeDh9QImzUzGTyVINpwGdXaYWlN8=;
        b=dHMpfGNLMKwAyEmTTiDnTvs7Fq8yM+OHzjFk+9YMNgsQrNA9DVJcDkrkKDmWgjWwKD
         EnIGKypNOYgycrBd6vsruLu1yMyA7rPTPA4Z1wpNZdjMu7cWlReiqruMI+wdslHjSpr+
         MPvrsQN1vId2pBJFYoig2uyjjnfYmoFyLI0wGBJKmsWoyHOGLMWG3Cuso4poMUeNGd/e
         wfDLBzX+qtmcYjptgF3HcTwyjmIdj+Z3xwp/fo7tt4fyOHqWjmcr/PjZ/LgwDgabmovg
         T+fs/5uCpxYXDeU4miaoje9c0P+eMVo/fsWayuvTvotbv1qx/HN+SW07zLzi2n0dx7L1
         W7gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzro49pknI4/F6pX1tzHZsL+SmAX7NaxHhBr+qvkUeGfV6EbPxU18ZtKcWfYhvHawXPMDzW8K3/oseafh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBHMhzgOnbS0KjRTLfpEc7V/32TkZsXIiWeqFKqwoBwuE6Pwiv
	9DRmlleoMk6S9rWZuu874lhZPedkdUk1B8TGg6DzQwkKOA7Vu7Bo0HQ=
X-Gm-Gg: AYBFou0JfXC0Z8a5XwcE9wB6+AUJwktAhQFSQR4CgmSAuo8AFvuD+BRxf8yqGoAYccO
	uVKeoyBL3wZHl5m+iAQT+aFebqpvD7XqePM7jgDatY5agLctZgEksdVja8u+fIn2zOnAnaAcRlR
	EJF7SD3EEyv4b8UjMRp/QLHGmgAr5/oBET7fhhVqvnVf17ylolb+EQQk2e3VGnMOFNcKFmtElnW
	Z+dDKryiV7jcqeZ/5wzOS9Ea7NvULCCEJbvv8AyahNxXGeMO353QCXtx8ULrWCyALEkOF0CUlm8
	IqP3514Lf9NgMamNFm/Qwlq229hq1ZNuoHewMJXRHKXXxwL1dfO500OHBGouNAR9Se8lSAAvuWq
	GK/xi9cnYynKp3PrebpzE9wYvNzXCArN4Mj40+WCitb3U3MgD2zNSbehInUBbEzN8KPnK+4hAbF
	1eoY+Xj454zewpHgSVxO1iYmwRC5Tmf5HZ+KxOdEDzZlMv7IEZCz32Vjlv7SMVKE2DB6xuW8FQT
	YXQLu6MphQ1R2y0EvWOvJ0VVQ9f34XO8phICCFoDEbKJKdSMheZ1SNqvdzaCmipeQi06gvaLpfk
	GgjQc0iZOmC0RJ5u
X-Received: by 2002:a05:701b:465c:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-19a9a93cdbbmr3658412c88.13.1792900954786;
        Sat, 24 Oct 2026 21:02:34 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:02:34 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
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
Subject: [PATCH 05/13] platform/apple-gmux: Write switch state to EFI on MMIO devices
Date: Sat, 24 Oct 2026 23:59:41 -0400
Message-ID: <20261025040046.1602-6-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
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

On T2 devices (MMIO), the T2 coprocessor reads gpu-active efi
variable, and macOS seems to write it, so to properly communciate
to the T2 coprocessor, we write gpu-active.

Co-developed: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/platform/x86/Kconfig      |  1 +
 drivers/platform/x86/apple-gmux.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c37e76066..01895d511 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -217,6 +217,7 @@ config APPLE_GMUX
 	depends on ACPI && PCI
 	depends on PNP
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on EFI
 	help
 	  This driver provides support for the gmux device found on many
 	  Apple laptops, which controls the display mux for the hybrid
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index bef87a57a..637b3b216 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -27,6 +27,7 @@
 #include <linux/dmi.h>
 #include <linux/workqueue.h>
 #include <linux/pm_runtime.h>
+#include <linux/efi.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -494,6 +495,31 @@ static void gmux_write_switch_state(struct apple_gmux_data *gmux_data)
 		gmux_write8(gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 3);
 }
 
+#define APPLE_GPU_VARS_GUID EFI_GUID(0xfa4ce28d, 0xb62f, 0x4c99, \
+				     0x9c, 0xc3, 0x68, 0x15, 0x68, 0x6e, 0x30, 0xf9)
+
+static efi_char16_t gmux_gpu_active_name[] = L"gpu-active";
+
+static void gmux_write_switch_state_efi(struct apple_gmux_data *gmux_data)
+{
+	efi_guid_t guid = APPLE_GPU_VARS_GUID;
+	u32 active = gmux_data->switch_state_display == VGA_SWITCHEROO_IGD;
+	efi_status_t status;
+
+	if (!efivar_is_available())
+		return;
+
+	status = efivar_set_variable(gmux_gpu_active_name, &guid,
+				     EFI_VARIABLE_NON_VOLATILE |
+				     EFI_VARIABLE_BOOTSERVICE_ACCESS |
+				     EFI_VARIABLE_RUNTIME_ACCESS,
+				     sizeof(active), &active);
+	if (status != EFI_SUCCESS)
+		pr_warn("writing gpu-active failed: 0x%lx\n", status);
+	else
+		pr_debug("gpu-active: %u\n", active);
+}
+
 static int gmux_switchto(enum vga_switcheroo_client_id id)
 {
 	apple_gmux_data->switch_state_ddc = id;
@@ -502,6 +528,8 @@ static int gmux_switchto(enum vga_switcheroo_client_id id)
 		apple_gmux_data->switch_state_external = id;
 
 	gmux_write_switch_state(apple_gmux_data);
+	if (apple_gmux_data->type == APPLE_GMUX_TYPE_MMIO)
+		gmux_write_switch_state_efi(apple_gmux_data);
 
 	return 0;
 }
@@ -1283,3 +1311,4 @@ MODULE_AUTHOR("Seth Forshee <seth.forshee@canonical.com>");
 MODULE_DESCRIPTION("Apple Gmux Driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(pnp, gmux_device_ids);
+MODULE_IMPORT_NS("EFIVAR");
-- 
2.55.0

