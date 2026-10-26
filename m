Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009078;
	b=yD40EbH/DqepNCPM+5PmniIe2CEZTOiXFvhgHkWQQs6uqvy9JLM2qnZhjmEHxs04e/2U
	 q7Q4OMvByxjyWSusIp6WZoP2BUgx4B/9/Dwh7HG5hzRU50Q0UxwA8zx/iwYyY55SvJSnE
	 QIejW+fsk7ObdAisIBTYcX2mos0IRN0dd7sHzvertkBLtMbjTBrXAxq0Sl9Rruv2+dlje
	 k+za1QKqrzpxfRalpPje/7Oo/HDs+S9JDZUEGWlCJ2CxSI26DwYqrcQ/UXSjYFMWK3BCE
	 NZKkZF9c3hPfhzG5K6SBOkxL6J34kDt0k9aQKP9vJ98IYYiOpmNVd+BhcKiJjJWtatA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rDp7+2O7MU6X785H/wA9kb/1vBQL6oD+1K7g8ImgNt4=;
	b=XAJs7R3pUnnLBsK38/HoZ8ghEEwfq7IuuuLcxZRRtfE8v6m6Vl5dwjri03RVANDd1yNn
	 QbeP49IXk4Irwj4rl7rHroXIBxIySxJMkuXKev7v9bSjg5H1sZiUVycYpHYlPPK743wfA
	 meSactgeYuipdj1zI2T3GCwp4b4Zn7xE7VaK0G/z//eZELUFZIDrg1rtf/XPtiBE7CTJS
	 i4gcsjm4XHH+jV3z7YilpOrl21+2VehTCGPPvaK3u7p87oglA36i+lgk3QDYId5Z5cl05
	 k98DpHtp9qJXwxGaizF+HS6XfR7A1VefjZD+kOQCBPOGIGp4wEfKA1oKQ9tsy9iiDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="UI/H7fym";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB28A606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB28A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UI/H7fym
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1953117a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009077; x=1793613877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDp7+2O7MU6X785H/wA9kb/1vBQL6oD+1K7g8ImgNt4=;
        b=UI/H7fymCCV5R8hXtpI07lGH3/oPJ2lwNaDRFtBfJ2Z98WNqgB7BIhhNR5neQc+sBC
         3iXk3PsFzag2MjYDv0EDhjpGZzt3CyIa1WiUO+EpXrjVAgEltLNFy5lE71bluKr8Hbq+
         4xbrzmUYbRrihK6YHm6FZUTZLrCDfh49FpFjYlpA42yU8QmoUrHEDCfMu2qwaPuJ66sv
         qXKUcSu4j9N7ZTUZK7xMA7IPIesrntAfupirllGS5Krn3vDBELoAzBValbjdnSBotsYF
         Dl7WY9NeVBWjP0eP7ROQJYqD4jfFXAEyey686yMiA/LXm4elu3hwqyuz7+U8v6L8ESMJ
         +cSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009077; x=1793613877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDp7+2O7MU6X785H/wA9kb/1vBQL6oD+1K7g8ImgNt4=;
        b=UJ803yerXukjBOALF/dbvmN8abXY8J+snsL/K/faUO2jFKuV+Ke501sYdo1j83kqHk
         2ANw986RyhP4koiWM9bZuCgOq7sjvrbRR1VUpHBP0SBuNTRNWSo5y8SZ96nEcqA9T/aY
         5oI883rXwvceQFJsq0COeoZAbWFt4hV3joaPZMc5Qj046BOEVb8yISEQGGO27RFT5RkJ
         K4bq9mO694EAXjtL/Oi1aGpdrTT1ikselJNdsG0wwDn7HvOj2nXiJny63aFfzo/NzqH1
         /cI9XXjyeQQwUa7V8OrZ6q9eQOWeJh/8IZd8cXaOEYVcmhj+dvS43AY3W5kVPmFrB1+S
         x92A==
X-Forwarded-Encrypted: i=1; AKwUvBx77QBxC5aZADhRKNSTL+xmK4P8oZ5Zxla6RhGxycjHjXQyh4zHSmnFy9jkMp0vp1vqjyFeYtxOS2XxnWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYILGrSKqJdXBJ6fzQkHnmDdJuSvTzxH/4i+5j+i3hupDvY8Byxh
	TuW8LiGYiWKFjJRukk+P/tqD6W4MAIsbyP6Wb9dbD61ngKgxWS9C5eQMlMUfdCLSKn0=
X-Gm-Gg: AYBFou27h6Bp17v3f+dl+/TEYaCy4siHbmMV2nMTutrYPH/xdSr4uEproBH0XOd+Ukx
	FMIj4qmCOQ/UTRaXhUVWTQEP+5eXfSRqfYRVUXdaqBj4ikodWl7qSU552vC+tVQFE8DeW1b2qwP
	dv0drpa/X8Nv/JPcOoW10RxFILXiqk5LWmpEPX6qZIip+eqq3Zs0F1XzkBrkN37CoysTWdi/+D4
	e1PFCvBwnRZoBWr3DnNKY7LqZXqZjsEveCnqzWfjchauuN9iU/mdzDenMoAd6T1g7L+b1DN3Rgr
	Sx2s4Mk/CmSgm03Emu6XZJoP4FfkHnfg8/b0IxPKDt8xo/PZegv7p8M8xdxqPTH+YoA8SWamZsK
	jpNy4gZsvnUM3wT/D6zgI83O/iMiWgM8unmC4XhWvJgnZotnobS1hMdlAJaDI0Fc6FD07WGNnE1
	lJydUmfsOILge8zLuAz/CsgzV6LakEC7cPxEYJ1cwmZPR2YmWJ7PwrJr5yZYSrE4HxQBHb9KwYQ
	Eg5oJ/L6txsawqjOjj32DU/kOMpGUJi7bHit7XW+KADjL7FWU1qfdiJdm5gRiu4wxFMsy2Ebv5S
	vfTHsj4pTJqIDhfHDXNIn3bEKcOasmEotTjIH85UadVt2Ap/4qiixB9+BnQT2rMSqRJe57pCUjV
	3sf8u+9QIhPJryzHM/y1SXOEctDSq
X-Received: by 2002:a17:90b:2d86:b0:3ad:ce18:50ad with SMTP id 98e67ed59e1d1-3adead57bfbmr5784240a91.22.1793009077115;
        Mon, 26 Oct 2026 03:04:37 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebac408asm7912647a91.0.2026.10.26.03.04.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 03:04:36 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] rpmsg: char: take ept_lock in the SET_INCOMING_FLOWCONTROL ioctl
Date: Mon, 26 Oct 2026 20:03:06 +1000
Message-ID: <20261026100306.68019-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

rpmsg_eptdev_ioctl() handles RPMSG_SET_INCOMING_FLOWCONTROL by calling
rpmsg_set_flow_control(eptdev->ept, ...) without holding eptdev->ept_lock
and without checking eptdev->ept for NULL. rpmsg_set_flow_control()
dereferences ept->ops, so this is the only eptdev->ept user that does not
honour the ept_lock discipline.

eptdev->ept is torn down under ept_lock: rpmsg_chrdev_eptdev_destroy()
(reached via RPMSG_DESTROY_EPT_IOCTL on a second fd, or when the rpmsg
device is removed) and rpmsg_eptdev_release() both do

	mutex_lock(&eptdev->ept_lock);
	rpmsg_destroy_ept(eptdev->ept);
	eptdev->ept = NULL;
	mutex_unlock(&eptdev->ept_lock);

and rpmsg_destroy_ept() drops the endpoint's last reference and frees it.
A SET_INCOMING_FLOWCONTROL ioctl running concurrently can therefore read
eptdev->ept just as it is freed and dereference ept->ops -> use-after-free
(or a NULL dereference once ept has been cleared).

The other eptdev->ept users get this right: rpmsg_eptdev_write_iter() and
rpmsg_eptdev_poll() take ept_lock and re-check eptdev->ept before use. Do
the same in the ioctl. Lock only this case: RPMSG_DESTROY_EPT_IOCTL calls
rpmsg_chrdev_eptdev_destroy(), which takes ept_lock itself, so the switch
as a whole must not hold it.

Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/rpmsg/rpmsg_char.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 550fda2..49c0784 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -343,7 +343,15 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 			break;
 		}
 		set = !!arg;
-		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
+		ret = mutex_lock_interruptible(&eptdev->ept_lock);
+		if (ret)
+			break;
+		if (eptdev->ept)
+			ret = rpmsg_set_flow_control(eptdev->ept, set,
+						     eptdev->chinfo.dst);
+		else
+			ret = -EPIPE;
+		mutex_unlock(&eptdev->ept_lock);
 		break;
 	case RPMSG_DESTROY_EPT_IOCTL:
 		/* Don't allow to destroy a default endpoint. */
-- 
2.43.0

