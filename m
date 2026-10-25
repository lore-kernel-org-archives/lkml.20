Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900983;
	b=Z+875tubL+lKvSXGxXF8OXcIc408n21zp3Y7+NCL1wzYK1W75t24T90Ho7o3vPV+M5JN
	 JcHQIW6M7CiUtakDACRjXJz6eMb0ZHiMuKjRlE7tqq2FMam2KRZ3M40etbh4WRlnrygoK
	 XVEZIMKKPMzdOBwvXvW/99YK8/JeIG0s4mIW+0dhCFUu8ed9Ssr/KQikZ/OYoBuMVAJvZ
	 ZsAdWnlpYEQbJIkBNW6TtQ5O9G/csr0vjBFePWzNwv59rEjF6GrxBtLeW+bJ4UWHofvML
	 1NkA3gNuzqG8jaAQDcLcJbd2Rsb+39TjWGoqaLMpjTkxSG8Du1Hgrw2kqq2N+iPDHGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=788LSEJ/nQEllvwR1yiw9f56ICCRyDbD8OfNlkBC7CM=;
	b=xAIHeEGVx+lyktrDlvSn/jlgl+YMNmYTMEbXi/R3vkqK33hrh6KPMYbF0rnTVMFjskEd
	 c+HiTm6TNIY48fp2Jxodk3coj1CZp4Ef1iqG2/f9/EFcr2JSerGltUgPwXyHB2UOG532H
	 w85IF11FvIBY4E5AVOHtuXwzfm1eC1YUViDYht8UqMQr/gRWh7v6heBkqkbgDC7niN8CA
	 QriSgTnnDJrxD2VUKi4/2pl3IAm2D+PT3i5aQC9ZJibDpWmgnqVzCu+5WRoN2MEKiws36
	 HXfIEaQuBhQxaOaATR8pDmP88D76JRXHIBgtJtwCdQvANhrw7b2ACiOR0JSJ1Iu1wRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ixYEsRnk;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC45606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC45606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ixYEsRnk
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso3644637eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900982; x=1793505782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=788LSEJ/nQEllvwR1yiw9f56ICCRyDbD8OfNlkBC7CM=;
        b=ixYEsRnkcf+nLoavUDfr9s9yHU5Gk20w9A4fBE5XOc+c6F+uphlXnEjou9txBIaHPK
         N1pHduhAjECd8wN1ZDfifTirzhtl0RJiOEScOKQ/Yb0hM79ddp6gHUyHS+pOIh5B7pL2
         dJ2C/nOtWz+ZJQFGKwBuJ/XwAiW5aipTEt4fA7/idc+npvPg1Undt2Wwi8wnyEb2B+k6
         QyClQAahO8pmlx6DtjZynEMLHSnCtq95kJKJNKNmMtRYN44vrkXUZhBvW7vA0HkresgR
         ajH6+fk/yUaNVf0QWhXRZCsEoxAL1Q+bKVq49QhEOrnpYZOUIP/FQlRJm/NSwL+5GD4G
         6dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900982; x=1793505782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=788LSEJ/nQEllvwR1yiw9f56ICCRyDbD8OfNlkBC7CM=;
        b=csfJV16CpBB1BQbk4ZVAd2gmlHptX4G6Sg8jIKBu27Jc/1nPsyrSI8YXw+Z2aiC5H9
         mchCEeZwehxtJ5/1QQ/gFjn6IUL3V7skPPC6BMgvF7hiUQ1GFIm1pQwT+Sad91HnxL4R
         kHFsIB8TJoS9T6vb/3/xBYLzpSh0LWsnx1i91BbksmImkOJEvR2lN3oJj9AvsysRrjey
         uMKnVqyT7TgMZ43nSbF/tBv+TaOuHJmTdChIc0eITyYyOXIzCaLNdkCmufsyhvByQs+e
         RiPwH24dFG0s17TbcINDiZa4em+VCywHS4s/nKK17I/okL6BYGe+u84fy6FRSpbbB8k/
         H93Q==
X-Forwarded-Encrypted: i=1; AKwUvByXkNqBCvpLXo6bSeO6ZnO2tbnesV9z1wz6QilbvrKZZMu7had2XZ11cW93WCYVIjbymVQyzhecx4R2h00=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnleL5uiIjielLGZ04RL/HQYLWC4pfAnVahSIr1E9zdBui4PB2
	xP3mSLyD+DPouSSZd1QDS36fQdFsGKDadgVsR/gjSfoxtAi9owR5+6g=
X-Gm-Gg: AYBFou1mFwkjXnKItSq70li6Zu2++/4ODajwb93J0LFidVouy/ZYNzv4llIkV/9XDiL
	8mXsDaYPV38P8OAAl9ZDfnZTaq2sKQWrYmcxCMFXKq7BKAZyQr02CmMilw2Hygqf/ud5z8deCtv
	Iz6GqHNQrQo2NMqldI4N+3fhPfxzlOGfemAm5qKjEyaKTtZ39iV2yMcQjub6bJyS2Y47JcYf1QP
	EjnssPyOdkLzT+URb7abLXK7vZhDNs9cpI++r/zwq2eJddqiYgcAqDveQmqAC1s3QWkgYIjzD9y
	xSRt3oZujEy64pMLSXpHA9odqeMwux7ZzUR5j52KIxVqQXgVMWLMKX//fLhsMPHjhzH6jF1z76n
	9FIcLSjqQ9OH1bI1CWM6Y50H3EpZcAiF0veRjIGXcbuxxCPwQoCRDcVu3HdZ289N3+xBwiVAWKa
	DhMhrIMPy8avpBW+/+NbqKAaCiqOQ7BUVMKAdYvLUAFtTmYySlLpr4EA2Ehf8gSp8CcGiJZ1teJ
	Cgtq/1dynH/jH1Gr7DoZe9pzthCf9BsI94IGrij9VboY8kvr20vPWwQb21ChjIuUhrESqbFYVgZ
	4+YkWHjYX3OSY/8=
X-Received: by 2002:a05:701a:ca05:b0:14c:1f57:3e86 with SMTP id a92af1059eb24-1993f3f1d75mr5747943c88.47.1792900981958;
        Sat, 24 Oct 2026 21:03:01 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:03:01 -0700 (PDT)
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
Subject: [PATCH 07/13] platform/apple-gmux: Add check to detect FSS
Date: Sat, 24 Oct 2026 23:59:43 -0400
Message-ID: <20261025040046.1602-8-atharvatiwarilinuxdev@gmail.com>
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

On MMIO macs, there is feature called FSS, we assume its
a display syncing technology between internal links
(for example 5K iMacs).

We detect it and then warn the user about it, if its broken/unavailable.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 2 ++
 include/linux/apple-gmux.h        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 6a9580f27..dda281f2f 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -1224,6 +1224,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	else if (boot_gpu == 1)
 		gmux_switchto(VGA_SWITCHEROO_DIS);
 
+	if (type == APPLE_GMUX_TYPE_MMIO && gmux_read8(gmux_data, GMUX_PORT_FSS) & 1)
+		pr_warn("FSS Failure, display tearing expected\n");
 	/*
 	 * Retina MacBook Pros cannot switch the panel's AUX separately
 	 * and need eDP pre-calibration. They are distinguishable from
diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
index 206d97ffd..a4fa84500 100644
--- a/include/linux/apple-gmux.h
+++ b/include/linux/apple-gmux.h
@@ -22,6 +22,7 @@
 #define GMUX_PORT_VERSION_RELEASE	0x06
 #define GMUX_PORT_SWITCH_DISPLAY	0x10
 #define GMUX_PORT_SWITCH_GET_DISPLAY	0x11
+#define GMUX_PORT_FSS			0x12
 #define GMUX_PORT_INTERRUPT_ENABLE	0x14
 #define GMUX_PORT_INTERRUPT_STATUS	0x16
 #define GMUX_PORT_SWITCH_DDC		0x28
-- 
2.55.0

