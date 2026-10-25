Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900969;
	b=oAJ1NJZefCYoKhWpD08s1qbx/s2oZz3oHV4RLVeg3EYG69s9BQZ7r4gH+zNruGWk8dYw
	 qattJoJQvewytVk9T5m+/zLhVhtdD8bjKnyM2MvUsvcTpZAXJw0kSTnhkHxWCja5CnPwb
	 DehewpiMayxW2Tt1XrCsnBPnfMavA9U1eBDbBdh7vraGKDMmz31FhsgDXWcdxih5tzQlP
	 d29AN+gUuRRxcD3wW1CeOX7FdLqqousE6TOFufb1Z5yDIoQ8pT1ElpElaVLyYzAiMqbz7
	 3UfH350EUwTHOYKpAPsglQ42OpuuVbnrV4w08xsQR+A+jjlkpd7VkiKVpqIwQiBGz1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kIWFjWx6bY2aMzP1Dlox6FZiyYw6gduqI5+MEIlEj5E=;
	b=IHqnjWuukPmDMOVV5eJ+Ax+qK8kW4zayWev/iDTAqxqFb+ZCjhlnipbVvkARwg/CFtCM
	 dizzdlrjVV+xmU3fJChJOVwXc2rOePRvqU1rEYB1APjFT90OtqLFnOq5LV4uzeYbZplFI
	 ELaiuE3SOz8tQNpwWEu4lg9vWQu7/NhJYdhyAMuEhCRLC7JmAKLY3tp5rZgOsb35waf4o
	 O2ZQTSzcl/o8wL0ch6V8QxrFWsyCsUxEJIHBFTiU8EcrkRtcJ8IqKlXi7sKVTY/y88TRd
	 9SXB35UzSyF5AN65M+29zcU0OMTiwhp/RbBa57Hun6YziAvwUWnonamACW0AQGkFkOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDBnovbH;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB1606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BB1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDBnovbH
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so3242098eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900968; x=1793505768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIWFjWx6bY2aMzP1Dlox6FZiyYw6gduqI5+MEIlEj5E=;
        b=WDBnovbHpvOpjdqqRAZCqZ/d1ZGckJZx8Ecb+LplBowbPWF38i1otc7fHClqk3vswU
         6p6p2KhpZKXDiP7533kfVkOVMDVmV/JlYmIGBxfwc3YeW/jvJC08/E8XPOCiZeXhc7TI
         Fkk93D9W8429SPchCLu8sJxpRx3ZJaSoPBBAQNOIpmV1LJqggboW65XMg8dchAkLoyl1
         zQKW8WShzk3zOYZ9UEyiIVpANUVK+0RSGiefC6FU64TSO/2uFPFoHgBA8F6cfhXTpqHn
         1ogASV07H0M7oWHiVdWJJiI4Avuq/7XYHbKjP0ntYPUrSd1R4GgA/BNiPG76sK79nXJ0
         EA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900968; x=1793505768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIWFjWx6bY2aMzP1Dlox6FZiyYw6gduqI5+MEIlEj5E=;
        b=WPGeuroSUvwGYIwe9625EeuFI7FFO4sp/PNFktFp54gEZIVO+MM7aHxwMzFsN0t+Or
         ijxTUYJfZ9GHsebfYiZxBggtMj4xv4oTt2JSGNcmgfwEMvUtUsiFwP1389zINtfQlZXc
         bJecUieiNwFsVZffi/ICRDxW1xOOx9ZY7BB0uuD6JZyjI/ItEwMYL9TDbaIX52Tkcnse
         ILoQ2R4YgckMZfZfpwCwKXEdLZGD0TBO+IWy4iJ6buIOqS6eAM+KHyjEwiBtYtrv6E4Y
         2v67FV+eLfaPMDnBAHhJFzFf09zwSa6Wjc29XfnAvmLaGKN4HJpHAamMITRlK5tOkfL5
         Jy9A==
X-Forwarded-Encrypted: i=1; AKwUvBwaft8oSYOEgDC+ZDVvt1Q5xA+svPz4SIn5ITZd+xIig8GX/y4AXRuBObPMwIrLeHraVGMc4XD1Ucqe6bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuZX3ZTtJgEhSfvb15yQJJZFcqeQy8f/lQ01sudjOtl/WEmcPd
	D/jM34lQhGFKmHXTAEqMLgbWWr2sibmumzyW9n5ZJUU5EIvE8Vo+9L4=
X-Gm-Gg: AYBFou1Mi5jeX2TRB/8b2uIy1rOtbZlbzfEF6Dd9LmA4DelHkXJ/2+rJAFu4ZMEMTxw
	I22npJmpEhxt45aHD8Dr+7PwTgW/igV1yxHSBBaxoQHg8zsyKAgXZXxfZ6uNvVYPI3+JZrUPuv6
	7QARJU7ckrAn2FQnMik206gl30POYIc+OtmRytJBd99mgtdnc7LG8No6cxZYbo3VD7ePdyfJtmB
	qERcqB5QAGZ9oKxzJ1caiCDR5qDnxsqHbzrdiqHxdp7EaBA596Ot3cpsNqYo6c5Ri8ft64u5V/l
	4EmzGhDuO6xmUaBneE4w/lPKaXH2I1SXABQrpsEBvG8AE3kQc5Fh8Jy3Y/Kd4JMGFEkGzz6NcgL
	RiBdqfVgtnfk0BsRCTt3ybxx//n1Jv3cM8EGb2bfHI3iqTM4XuVHHQxXmolkl/To08Hi9BSqGxw
	BeoAndmQhQUj5oIsnQjoi2DXCdhGy8teqZBLiKg+MF/lE3XHzg35xvImIE2TiunG0J3KteR5IhB
	4bWC8LM06wgq3teZFI4dHzGG7N9ATTRf3pWvJh9XMSrutqS4cVrbFO3JhnOtuwJZvYhybxK28CU
	2FYO7l+Q0GY/cYMg
X-Received: by 2002:a05:701a:ca0b:b0:17d:7b45:f91f with SMTP id a92af1059eb24-1993580fcd2mr5442774c88.32.1792900968114;
        Sat, 24 Oct 2026 21:02:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:02:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
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
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 06/13] platform/apple-gmux: Add parameter to configure boot gpu
Date: Sat, 24 Oct 2026 23:59:42 -0400
Message-ID: <20261025040046.1602-7-atharvatiwarilinuxdev@gmail.com>
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

Currently on Indexed and MMIO systems, the system can't change
GPU's on runtime, as the display is not trained on the secondary
GPU, to combat this, we add a module parameter to configure the boot
GPU, so users can change to iGPU or dGPU via reboot.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 637b3b216..6a9580f27 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -109,6 +109,10 @@ struct apple_gmux_config {
 	char *name;
 };
 
+static int boot_gpu = -1;
+module_param(boot_gpu, int, 0);
+MODULE_PARM_DESC(boot_gpu, "Configure the boot gpu (-1 = auto, 0 = iGPU, 1 = dGPU)");
+
 #define GMUX_INTERRUPT_ENABLE		0xff
 #define GMUX_INTERRUPT_DISABLE		0x00
 
@@ -1215,6 +1219,11 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	gmux_enable_interrupts(gmux_data, 1);
 	gmux_read_switch_state(gmux_data);
 
+	if (boot_gpu == 0)
+		gmux_switchto(VGA_SWITCHEROO_IGD);
+	else if (boot_gpu == 1)
+		gmux_switchto(VGA_SWITCHEROO_DIS);
+
 	/*
 	 * Retina MacBook Pros cannot switch the panel's AUX separately
 	 * and need eDP pre-calibration. They are distinguishable from
-- 
2.55.0

