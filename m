Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B06233947
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037779; cv=none; b=ftrlF8pXxRG/Lvkoc0NaY0BegMu49Q1rHUmbhKtQFUecg4PrZsuiS0F/cxiyxcXWA5fTR/OBsU76t8BgWclCqeNbumTv3lu4xIhlk3fZohQCvbVzhA0EBBtla4KAX91+X3sxKa0PtNqUNqw1wYCjYf5xnQV6GEQMn8ATca3nDN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037779; c=relaxed/simple;
	bh=x3qtrMaxlZV2XUClNz2Bf0GRdSf2AbVR9vfZ5ZvZwjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7RFFAKbru39aWJgVg1bvyPTdrAQsOFxKNtwQ3/cy6gmWk53xGR1T8ZEa7vauSVN5kmo44MlfMerayyJlZlgV5US2kuOwVX189UoumhK182rio6y+ScOHQVFEU1iPhKOC+dAqv4fMTaq00WROtR7HJwc/uMpJxC7UWgDviNwG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTvw0Nrl; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTvw0Nrl"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4a165f4fb8bso3837045e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791037775; x=1791642575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgc4T+XlrOyjsjU4zUHkky5gQ77fpbAgvSWADqVH9dU=;
        b=HTvw0NrlpAcSvBc2iGuZiDZSSTf+1toLZS2koGXU/GNbizTWI0AOXRyvoQ7KZCwmj7
         jxR1wHEeokPn/LIEQeEeP4tIsJau9nBrGKSB9PSI6I+U+nWYb+f0GNXf4L6BOjuSDT8n
         vJ18irQ/eIUluRWQWqBQM+yH8aS7Rm+WhwLPzye3fSn7ALjho+5PnwCyAeIrTS/F/V1j
         h63IzTyPLZRJIP0yZMTt+LePEXuv98PfK3i8bGJnJaiAsPKScD30K8kSVg/MgC0h/rVy
         mYAAiN+jtCerlQ6WF7Qy7R5M7Pw9uvhDEMf0NOB1VDEw8L8f7g41AT9uck39MHAn8fIH
         aHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791037775; x=1791642575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgc4T+XlrOyjsjU4zUHkky5gQ77fpbAgvSWADqVH9dU=;
        b=OZOTrAbZQkO25JMnhNEMX21GvlVDNy8RFAJxirzxYnUdCaIitLf/esy+OZPi06D+jC
         bQxC70psl9LnDwhg+SZSR8zYZxjY3BXVQZljnL2jGrPX797nFo4hPn77pQNX40x0H2gJ
         LnZcspFnCb+AiMwdPJ162UHsr/mrQ+hDScl1Kaz9UX6+YhqK+xTEC9m4xQjHHIHF5aG8
         RA1Brz4b9lMwNH6EBSqQX4nEHIC3sQ4kJ31beRLMSC3+jaM5r51IZZRlXm/VCKAX5wm7
         il0JhpC6Syphps9U7Gw7pFR8+afSWPdSat4nwoSbYTMZTuOmryfpEoA/gnYoosA6TXdx
         /4TA==
X-Forwarded-Encrypted: i=1; AKwUvBwT7CwMB5Bt6oHpA2f9L/3EwF221/syRMjuxG+LxsAKcTD6F4JRqs9TrsZyh1AnudNO1/qec91oG7M3lvE=@vger.kernel.org
X-Gm-Message-State: AFuF++nOHGu/nOrJQiZe9E520xlLaSMAfFzKBJHga/KwRB543KiB01Ph
	uLCRra8qEJOa3A2YVZ1pE+taUirGfK8jKGMAdEVacNtwH4ZJ100FJG8k
X-Gm-Gg: AYBFou0SWqacuatZ0/AoxkDzZaj+cjbXzifUNmCQsh74A1IFnBEXRTP+7vPu93eGNUd
	B03ZSx0eQ/AKZFncrEZRuDChgGNoZNBZLeFRAnWV48wQup0SyZDn5RK9jBsiiAZzNAM6M4ae+T1
	ZJTzocEyfXZXfnIkqBV4cbDrVO3oH/F9UAipHFLYihdYVGhqbdBGpmc7KjaT4FFjluEQgdv5HuC
	kjaIi3r1I4dzAx56jW2tSr3CqvuoNgdKpctDDteRLCo6GKDpcN/I/sN0C2MAQfy+63tAMcdGoAp
	3+cexlW4YVeXKr3zMbHa0xwaKu2UK1+SvB4EN7Ijv1CZUb44hLyM59+nk+m9BBBXkbaFfY4dJEU
	5OC/jCC4PllB+/MetPzId5soXcMtyjkBiG2EQxuWwLlXDum0c1uHAlS1rQhIWNZR/xeiGiHGInt
	7q6p5EFNgTvC049KZxVJE46VM1g96s818YRUv/9eXs6qgoHt3qoRrNbHX8haNRJ3GcQXin7vsb4
	7q3KARqAoM5ffQ=
X-Received: by 2002:a05:600c:4e42:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a027586525mr106946445e9.15.1791037775418;
        Sat, 03 Oct 2026 07:29:35 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm102612345e9.1.2026.10.03.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:29:34 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: israel.a.cepeda.lopez@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] usb: misc: usbio: Handle negative error code from usb_control_msg()
Date: Sat,  3 Oct 2026 17:28:38 +0300
Message-ID: <20261003142838.19019-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sizeof(*cpkt) is unsigned, so comparing "ret < sizeof(*cpkt)" promotes
"ret" to unsigned and negative error codes from usb_control_msg() are
not caught. Cast the sizeof to int so the error handling works.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Assisted-by: LLM
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found by smatch:
- drivers/usb/misc/usbio.c:187 usbio_ctrl_msg() warn: error code type promoted to positive: 'ret'

 drivers/usb/misc/usbio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index fe093e7760d5..3f73f7c3d68a 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -184,7 +184,7 @@ static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
 	dev_dbg(usbio->dev, "control in %d hdr %*phN data %*phN\n", ret,
 		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
 
-	if (ret < sizeof(*cpkt)) {
+	if (ret < (int)sizeof(*cpkt)) {
 		dev_err(usbio->dev, "USB control in failed: %d\n", ret);
 		return (ret < 0) ? ret : -EPROTO;
 	}
-- 
2.53.0

