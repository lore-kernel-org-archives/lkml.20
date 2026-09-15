Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A592C282F1C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445402; cv=none; b=kPwPKnolqtRTFwUsPr7odiLXhhDbk423oe6BsTOChrW+u2LMPdg2KelNUobQYIcmxvNGAq8GcdlYWkuV/GrSSMkczbZfYLrJSK96jcohmKKSjT0ntOZMjrpTwbJvr4tqKDd3WsSlvFQcyw8tU7so4qyi2173Qm0/xyzYFcVn+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445402; c=relaxed/simple;
	bh=eycpq7ZGf9c0AnYvssHjHkaOZs7yH+Qf2uYDXQ+Yv/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nzocsYj+35MpU5eFwIDpDQuivpLvIStfAMEj5i5ao8ygIXLVCUwkS71TyV+O2pWMSGvAjiPthCfMbt12Y7/LO4ILZ3OYxUQ7QqUNm+22NflXdZchLHsPxCzgEFZE6P8Fb7q658I9MAkaU1eecX1an5RD4djk5bsy7+537JeDYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6asINI6; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6asINI6"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so1243151e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789445398; x=1790050198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7ZpgQuMw74S9FkdqF0b5yylYR5td4Wwe0O790DHV/I=;
        b=o6asINI6dORUyTMRKlhm6vqKyfmDxFqSlU/KmhnOzqD+NaQUYArY8RP53ykFJzshYK
         GZMK7fiA4prHKTxpus7o4tltbF5lu9FNPObqQmd4IGvowrk8il06c+mJ0JRSfWfPC4Yk
         v5tRH4UN+9McYIht61nQ7diIUJd2ieIn9SjQ9L25byN3yud4K0GYw9HS2VmVVud3WtGv
         GRsUDxlqt49PCmAlOKEUMLgXSuvO2t48MCFDzHPb3Ko7V8pWuVzgpiZkthFFw59va67d
         5w9TiaEVo3TZ1dzqt+VTG4sFPN+XAfO/fkvKY/a6npKcmZ4D9QeurkRrgs+8c0LFGYUJ
         E/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789445398; x=1790050198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7ZpgQuMw74S9FkdqF0b5yylYR5td4Wwe0O790DHV/I=;
        b=MbV7H2cNHnoCXJNvRcWle/wFgpcvI+5V/7w2gK8Bq0p9kNj8ZPN+X4Hlmigvd75pEW
         NJyfN8htSFdYlOCRLUqt07Np2O+nX08Y0QgewvJ8NMgaKMF1cdn/1WUgHIlx32I83ghZ
         QkHB+iWuNB/O/8g9qsKHU8Bh8hvav2y7afxoxskd+AWOvjSCTV5fdEF2mMRbI+CLEZxF
         1jMbTAsizOLbURyJDHwrE0TAGYtTWDpbUwA+pdQMOF9/rjFKFfn/ChlA3aGpuTTy1yob
         xu4mhRQomxz3QH+pthbVJ574Y4j7aM5fw3c69uxPzbfxAhRpcfpfJgUVR5JrdLv3cfvx
         jxqA==
X-Forwarded-Encrypted: i=1; AKwUvBzbLwdm7oL8AOPB7ZpzCdJnNU6OoPraK/g4Cam2G3NSDuNy/Ni3AJ8hdVnW9RQs6a5iEWtFuZmLOgHi3Xw=@vger.kernel.org
X-Gm-Message-State: AFuF++mpPi6+E9zjX1xOhM2EAWEpXRXChFv/sNvcm34GQkTrY3ytDipW
	8XTkUDA1uBzyoi1BIgYE9tI7EyDcWdKBE0aDAhMosReCtTAQdYTZ6inbMOpNgUlcSfNkSw==
X-Gm-Gg: AYBFou1IeV/mNF+brZpqfFT9448I97QaaxFD0I4odrsz7TsZE2zX78bVFJGXXUvgyjJ
	wn8DYwojKHnGai3Q5dTHEoM5ZoxT8ILtQ0vsqhX9mVm1UETJc+DNhXQDE60s7FMcQMnvNyU0hn7
	swlDtHntKyBnRTR24c797Odj21OkbaQprALJtp+qF0B3KuI4vGN+Vvu9N7Bf5Y7qmCjrisZd4CA
	XR888+tJ0T0rWTgltaJvT0Dhdh703Z4qsYBNg8rT/6HxprK0MX6L5UoZ+LVpjG6cFuvGVcJF09H
	EGmdLSafoWOdVyB+xr9WVOFX/iBNSm4FR/VkpOmCNTqRHv3u5U5jmgSlhcoPFnH6EzLMi7tOnfv
	WFBuyHC7/94tdHeQuMIAOMJXfIFGQNo/KeH/wJINlY2Ke7KpQjzu2tpQoEJWawzOXgO0D7b86XF
	9jBhOXKQ0XAYnYNduPzVj4LSReJLVlvgiFHpd/9BNP1KE9+NxGWksp+apvwXKEfJz2
X-Received: by 2002:a05:6122:616b:b0:5c6:5daf:52ea with SMTP id 71dfb90a1353d-5c9820dac02mr7036787e0c.6.1789445398559;
        Mon, 14 Sep 2026 21:09:58 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470e7ef4sm14496006e0c.9.2026.09.14.21.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 21:09:58 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Chris Mason <clm@meta.com>
Subject: [PATCH] usb: gadget: composite: pass the validated interface index
Date: Tue, 15 Sep 2026 01:09:47 -0300
Message-ID: <20260915040947.2426239-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

composite_setup() validates the low byte of wIndex as an interface
number, but passes the full 16-bit wIndex to the function's get_alt and
set_alt callbacks.  FunctionFS reverse-maps the low byte and then uses
the original callback argument to index its fixed-size cur_alt array.

Pass the decoded and validated interface number to the callbacks.  This
matches the callback contract and prevents an out-of-bounds cur_alt
access when the high byte of wIndex is nonzero.

Fixes: 2f550553e23c ("usb: gadget: f_fs: Add the missing get_alt callback")
Reported-by: Chris Mason <clm@meta.com>
Link: https://lore.kernel.org/r/3984c9bd-2ac8-424e-9390-7170fdab3c03@meta.com
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/usb/gadget/composite.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index df39e3487..2aa07eafc 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1930,7 +1930,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 			break;
 
 		spin_lock(&cdev->lock);
-		value = f->set_alt(f, w_index, w_value);
+		value = f->set_alt(f, intf, w_value);
 		if (value == USB_GADGET_DELAYED_STATUS) {
 			DBG(cdev,
 			 "%s: interface %d (%s) requested delayed status\n",
@@ -1950,7 +1950,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 		if (!f)
 			break;
 		/* lots of interfaces only need altsetting zero... */
-		value = f->get_alt ? f->get_alt(f, w_index) : 0;
+		value = f->get_alt ? f->get_alt(f, intf) : 0;
 		if (value < 0)
 			break;
 		*((u8 *)req->buf) = value;
-- 
2.43.0

