Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900928;
	b=qs9j6n4Niyu7r771OHxT5cpVMiXDipykjrU5sLaMD9d3F8wgzvlCt0PZxKtJj+uLa1QX
	 lX/olk83zTYddwJS6i6QK+/Ty8LqzjTUCvlYgTYnmpFE2CDSs8bp0ILMkfHcdNiHE22N5
	 pmOMiI0pIjZWcIAZGIgodvy/JvDCBVl1Y6IzOsspB+FLGHIjc1h9YW6XN6JumCVuV80sz
	 o/Iloj1UhihJ0lEQjthozPfQAP1hfK+C4czE178/WkT5quttzxMUo6IRMOLHSuqQlkAXI
	 YqtB+9gY42WPuFGt8b7R4ldNrnIZh9XMNOolFzezTb4JvAY01hSDm5czXOLgg16+nbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VU2DAJ/OjJ6m6U2gn3WXwMpKFJKrCfikczSVMn3jkTE=;
	b=FkMteuPxyH0Lzt33gQTpIg2qSZsvzW8Whhg/PtQnObvVixBf5bIV6UmuGsYQULrJcq9j
	 d7gS4t7fjme//puY38DzG8rxbH+M68m3wkVKTqrCkfus9cGTUZWgiXctBu+vQtVIYcoPR
	 8Le3Wf7ixPsMzuuH/4ljJ+riNmIY1jNnJbJmTxuB4l8NyCEcoH3C9TbqVpht5l/WQcRsp
	 WJv7ncHX+4ykFCak+pUGLzgd0Ullh5QV4mJapbz2GN2a/Hhprji+AySzQMK3Wr+Q+PXfQ
	 dvqaQVirMPA/QYO20o/GAMEW6+HMJ82ssIciTfK3ZphPVylaHHpdrhIorPAiS1Mch5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmWNbLuv;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9212606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9212606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmWNbLuv
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-156cbe59524so1141019c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900927; x=1793505727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VU2DAJ/OjJ6m6U2gn3WXwMpKFJKrCfikczSVMn3jkTE=;
        b=bmWNbLuvN2IDDdStDByH+gvUY+b+HqEseTNkYtWYn9bthVjAv4m3AguUnxqYJoFX32
         VHQmNIAOYfKzpQw+7bxpzscBmUWHXcO2ebVGN9J3xLssF26lgSWX738roEJ9xaSsspvr
         aAomizoTdnldXnuN8HE1NkPZMUCI2v6yZjUUtS3ZAfSwxcbVNIQM5UBRSTgHIhVXKcjz
         l45RqVv2VQVoLODFAPEJemCyqCVCpzl/FZL++8hCz/q7btLV4L8SS3MHKuv5sodKD710
         tzj4KLClvVq30cqBzhWmEL8lLKkH4kGyvdxtdcK/xLvpjFRB2sOMSn22Rm3YT0B/48VF
         8kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900927; x=1793505727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VU2DAJ/OjJ6m6U2gn3WXwMpKFJKrCfikczSVMn3jkTE=;
        b=YyaX9KtYRY/WMDGC0Ho8r9XJ8XjmzJen/+lvNEzjpQzQA5eAH2jAZ1VwKhfzADmtU1
         PEVVDucOIZ/QsCKbi6LPaAWytsiu46CDE8uWe9phCCUMR1FscMTZ04FUXdoxrgn3uB9Y
         owSXloHakOr7p9djTqdXKWK1bGgrxpA4MCGo8GwnIQzjbMCRh8kmOIIIoD/vXrAL91wA
         yr6tJSr6tESpWnUwB0fV6wxLxyEiJ4KZr9eJMw6O63rca9rW96c9HaWuLpn86dpFl1T+
         xMLeU8XnNGxpFV/GJ2L3ZtMPoLWtMKEErGtUlZfEZItc4A2fpSwgrfFjNBuvdJtyR7Q6
         hBhw==
X-Forwarded-Encrypted: i=1; AKwUvBzPEB1i4WvyXWy95wRkzE8mGB74EgrzOJQQAEFhoG1zOctrdAgcFSQXizethUs8tWYr4iZXKV67+myqGY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcmKgc4HGQEW65QKIQn12kNLydJkc/czmlVrVuLqz+jbTsq1cU
	YGAU05KFWrM58/b7uLTIG7xm5/g1zfWlCfglwK+CslrsMsWmtZf8os8=
X-Gm-Gg: AYBFou04scbht5E5BmeEzqzOARGQa7d3Wfhv5XNSrLNkFyxLNDuF/6Y7w3olRspDY8Y
	76TPJgmCvNj7pA9XrurZhqpX4xA1rQOYLs24CwB5a3LIieoUFT38AFIz9hiwhe1OfSCkNVy6zvd
	pNPLtfE2zEhNXBOQ/L5DXwtv7+hcXW7oVXp9IKtgbi4RdLBV8/iKjPK2SySzjSov6bFr4434C9u
	IvHvNC37BCuVB043aOrK9IksjA4CZms+GrSIrM4QlHHASjvcqaWdvBdhJ6d7P4jgkcpUbL+Sf7h
	ieR2FG8WqyhZQf1rBPDFoy0bqT0rAccddae6kjEGBEMVz/8ZaMjNw0NaP79yNKFElclZMMqeNP1
	WsUbijeaxc2+Te41b09Odjw4KzQJojwKHb24hdpwPX/o4t9QJIcUz3ui/lyw8oqmmPjCi61/NNX
	MRx42Pz6KPLmllN17iuPK++8zgqAkxGt+86xAAnRFf1dq69++y+kv+OYX7i0DE2mwauZEEknNKj
	LUa3bhmzt7Wnvq63V1JXiUdrX05lZFZBdDmDAVUjZ33to7sbX95kBKG/K89S9hmYExb840KEgRi
	Pi++77xrvmZTsPA=
X-Received: by 2002:a05:7022:3d83:b0:194:23e7:b526 with SMTP id a92af1059eb24-19937024792mr4822317c88.27.1792900926860;
        Sat, 24 Oct 2026 21:02:06 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:02:06 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
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
Subject: [PATCH 03/13] platform/apple-gmux: Fix MMIO interface
Date: Sat, 24 Oct 2026 23:59:39 -0400
Message-ID: <20261025040046.1602-4-atharvatiwarilinuxdev@gmail.com>
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

This patch brings a lot of fixes to MMIO interface such as:
1. Using 1ms waits instead of 100us.
2. Checking if Timed out before reading and writing
3. Adding missing wait before gmux_mmio_write32

Co-developed-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 59 ++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 4e8786a5e..076ed7ba6 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -237,8 +237,8 @@ static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
 	u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
 
 	while (i && gwr) {
+		fsleep(1000);
 		gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-		udelay(100);
 		i--;
 	}
 
@@ -250,12 +250,14 @@ static u8 gmux_mmio_read8(struct apple_gmux_data *gmux_data, int port)
 	u8 val;
 
 	mutex_lock(&gmux_data->index_lock);
-	gmux_mmio_wait(gmux_data);
-	iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_READ | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-	gmux_mmio_wait(gmux_data);
-	val = ioread8(gmux_data->iomem_base);
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_READ | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+		if (!gmux_mmio_wait(gmux_data))
+			return 0;
+		val = ioread8(gmux_data->iomem_base);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 
 	return val;
@@ -265,14 +267,17 @@ static void gmux_mmio_write8(struct apple_gmux_data *gmux_data, int port,
 			      u8 val)
 {
 	mutex_lock(&gmux_data->index_lock);
-	gmux_mmio_wait(gmux_data);
-	iowrite8(val, gmux_data->iomem_base);
 
-	iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_WRITE | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite8(val, gmux_data->iomem_base);
 
-	gmux_mmio_wait(gmux_data);
+		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+
+		/* We already wrote the value there is no point to check if timeout */
+		gmux_mmio_wait(gmux_data);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 }
 
@@ -281,12 +286,16 @@ static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
 	u32 val;
 
 	mutex_lock(&gmux_data->index_lock);
-	gmux_mmio_wait(gmux_data);
-	iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_READ | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-	gmux_mmio_wait(gmux_data);
-	val = ioread32be(gmux_data->iomem_base);
+
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_READ | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+		if (!gmux_mmio_wait(gmux_data))
+			return 0;
+
+		val = ioread32be(gmux_data->iomem_base);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 
 	return val;
@@ -296,11 +305,13 @@ static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
 			       u32 val)
 {
 	mutex_lock(&gmux_data->index_lock);
-	iowrite32be(val, gmux_data->iomem_base);
-	iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_WRITE | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-	gmux_mmio_wait(gmux_data);
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite32be(val, gmux_data->iomem_base);
+		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+		gmux_mmio_wait(gmux_data);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 }
 
-- 
2.55.0

