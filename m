Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE9F33D503
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337063; cv=none; b=JHEd3O8RkGrZ0w6KkBjHQd9cpqqSggOOCC8xmoexowsaKLXCPWEoCwTfEVA3P/TsMmi0onUVHZup3D+PMSfdV6ki4hRshdMN6AWdX5HPyUGN2bwjEN0+knKs0lG3AaylJhcUMKN2o0qr0rvIaU5ZzAzQ4WkI1xCkqF54eH3xvdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337063; c=relaxed/simple;
	bh=hRjfKFXXRRxS3ds77GOO8EDnyRQdjhfK6DdZ0IAeJOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXK3j+K0cYeZczW/K8A1ymA9o4Ag+yF+PUAyZ0ofZQ14A5pSvq1k4yS1klQz3XT3F4Aw4wbjPDGZMZqmN0tjtpZFP22eqf3Gd5U/tVKHSTqu2nSN63RTxu/vXtZ9gHoKT/XdkYjM/jru/vLo20yxSGmgpPCGFN/JO3V4m316t3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSdnEuC7; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSdnEuC7"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-499f20c7054so693398fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337061; x=1791941861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y0wy5r/a8wSdsmPA4swctu0ZijkSM7bFUGt/MLOHIyo=;
        b=HSdnEuC7/varPnxrsVc56A2nb1utk5zVknc3IlDCR8cA/ZKKqdAbzHc1N7fEBoAkYT
         lTOG+kIuCcGSh/5qd3mZBmGrIyt+qIh8oqP6EZW4C/2COrH+ISfa7AWLHO3FcskfGGVc
         NtyMVgINT3WGYP3Z8C8hR7anoR2kRY803zuu7yNcM5Ea5jKOa2F4RuSgLgHD9uS6Gfwy
         nG95faMjX7WDYUuEtbiDzXyKpotb2Sn7Y3URp+qppOgplF7wDDtnHUClJs5fUzWQzN3G
         soRyR308QafDawEM+saWVDaF4LCcQtbB5PYRKD52e4RYHCJBR9/4tgp1g4n/GQLNGnGp
         4A5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337061; x=1791941861;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0wy5r/a8wSdsmPA4swctu0ZijkSM7bFUGt/MLOHIyo=;
        b=q+DE8xgqx54wAQuUV3dLGNGNIGwlEyHwq8DMW9WCCz55jt+vCwvf1QR+GNRN5A5FsX
         hk3EsaUbqGWfjNp7Ley8sRgY2/kfTa9VawoOokzjcVoCHo32JpfEDBmT+9qUeyhGjbtp
         uemmJkHCKLZrcRfoyRk/LehkF8NhvO5f3f1/euIwskXsSZLMKoHIwpwR9f7M6Gk4hnly
         5SURn7Wf+WmtDg7KwV0+Ra2EVCPokz+TuiMMFsL+8TIW1LgEjXBLCdbRvjpd6BDDADKy
         TeSgVz3P8xrWqqbtg2ar8XGMRGREzu2O9vnWQE65kPKbp1IVLXFfVMSOFNrzGsHqD9ph
         +F3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwW6UDN147RY7khkjT5v2dCwc/EobTUujmawCdsHiUtNzGvNbOfTodNTxBxCxf8U6UJEu5cQh/jwYDDoQs=@vger.kernel.org
X-Gm-Message-State: AFuF++nqnZWq+1PRYMznuzBb8VO+91WhkrC+j5eCSE0T0KO/tzxEDje/
	iNkG+oSsPmZQpygzQhbvAC1wgQRaQrQLa8ZcsOxFoe0UXoqqpUTxIo54
X-Gm-Gg: AYBFou2rbTU+UzIHMkZXqO2xTAWkrtZaQ2737zf+VPdMIfoikepCSgGI7l9HoraKR6n
	Vp0r5tWit7joJXgawVKwSMAP1vHwJfWHWE103PKCyMp85TWh0MBJSjEFKvYR/ADMU0rCGzMAJQP
	sVO37WJv6QdJ6Hg3xLuVFK5F3yDzWD+A3pYvcD/6y1XaaKteKvl5CbcRnrlci/31ixTS4V2/hAO
	S2VR3hhRFl2onJkCRDkrOn5nOwdQJMg4ot1mSxOTQzu8KppwAXjn5mU0P+6aHcORi/9W64gQUSN
	qXmQTu9vSzKfihSwiplRutVV2ZHbfJqwJVkuGyYf4TGQs/qIjGRKgcU/5TIKCKmCmLw+USfW1Xf
	hb5NOvXvpNyJstwkzFlrTvcM8RY8Uw5zBXsQjLyvHqpDOFBeYsul020cD7DaDZ6uVOrZrB+OE88
	ud/kpltRNapgwdNPS1I/VNrQ3fVxwSzUxQbXc+VVuvptQJFfBnyhXWIB5YmEz2KJQWSGQzGQ6V2
	0A3H6CO6hkXi3JJ87BNjcI=
X-Received: by 2002:a05:6871:c8e9:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4a25942acfamr984499fac.10.1791337060915;
        Tue, 06 Oct 2026 18:37:40 -0700 (PDT)
Received: from Arch ([201.110.174.1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25728fad1sm966520fac.18.2026.10.06.18.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:37:40 -0700 (PDT)
From: =?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused PCI ASPM OSC definitions
Date: Tue,  6 Oct 2026 19:35:22 -0600
Message-ID: <8b372e2037cff170950c0dc0b94d7cdd78ba4c80.1791312824.git.inakisobera8@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0c4bc57c3034233f330f620eeb03fd7d8f8de457.1791312824.git.inakisobera8@gmail.com>
References: <0c4bc57c3034233f330f620eeb03fd7d8f8de457.1791312824.git.inakisobera8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RT_PCI_ASPM_OSC_IGNORE, RT_PCI_ASPM_OSC_ENABLE and
RT_PCI_ASPM_OSC_DISABLE describe how PCI ASPM is arbitrated between the
OS and the driver. This driver is SDIO only, it depends on MMC, and the
macros are not referenced anywhere in the tree. Drop them along with
their comment.

No functional change intended.

Signed-off-by: Iñaki Sobera Sotomayor <inakisobera8@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c308fcedd63..60fbd9637b9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -84,11 +84,6 @@ enum rt_rf_power_state {
 #define	RT_CLEAR_PS_LEVEL(ppsc, _PS_FLAG)	(ppsc->cur_ps_level &= (~(_PS_FLAG)))
 #define	RT_SET_PS_LEVEL(ppsc, _PS_FLAG)		(ppsc->cur_ps_level |= _PS_FLAG)
 
-/*  ASPM OSC Control bit, added by Roger, 2013.03.29. */
-#define	RT_PCI_ASPM_OSC_IGNORE		0	 /*  PCI ASPM ignore OSC control in default */
-#define	RT_PCI_ASPM_OSC_ENABLE		BIT(0) /*  PCI ASPM controlled by OS according to ACPI Spec 5.0 */
-#define	RT_PCI_ASPM_OSC_DISABLE		BIT(1) /*  PCI ASPM controlled by driver or BIOS, i.e., force enable ASPM */
-
 enum {
 	PSBBREG_RF0 = 0,
 	PSBBREG_RF1,
-- 
2.56.0

