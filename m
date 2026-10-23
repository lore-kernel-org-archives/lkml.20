Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766943;
	b=rYre/A5J2IXw984alz9LjlnPIaSAfzPySv7yWfIC1enLFHBOkPqVof8BVxs71zmsEITK
	 NJ0PZLXkCtLHzERccTAZyOm19Tx9xn1tmHeHEU20z5m/btqp+35II2tZdPEnkQJyfWne4
	 iPu+NbviVCLNUokf9ZvxN0pTdIF+GdzHdOlLqFCsU4r3v0Bel2I7V+ohl1PIZajLoaNNg
	 Mv/y2TfIm6duaPqVviZWwswzmjYsS0cGy7UMwV6V1xGMO3aHUFuTLW2to+y0+O46JercN
	 WxuI4/Y+ctS0RUlfU1iiE16q9IwNscy5bboBMwx34TdW3N5ZLCsG1QDqoTYOQU25Rhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IdkYUYs5y4Iem1sFLDu3Lx/OAa6FaPFzLzgcEXfMeNg=;
	b=k362Y7mwuonYxKshZeOOXxdn7ys+frGMUxyz3+RFAi5ptJnqNU5k8AqjAXsMTIc1RsSs
	 LanSZigCNXfdn83xr2GQGBuCNar8dIu+cTTkoKIH+5B56EkCIC3lqgeHxtwWNM9wBCS0O
	 Xp5qBloZbzYFCwC948fX7BbvlLUIrWZSIIGILT6JZ548B5oVQy0ZP+wsOf9dAZvsxp99U
	 y48fljqhM6fgSldN117zj/mZuIwwxuMj2gHzag5Y5BGiB46CfGYPkg8RkciVefaTGGoqx
	 rj677zbjlmcaUOIsZjq6Z6khpmWGQnI+fS5juEi90wsiSd21MnaE9AXTTqhG31TdAlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YXD04Pwg;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67160606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67160606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YXD04Pwg
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1581888eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792766942; x=1793371742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IdkYUYs5y4Iem1sFLDu3Lx/OAa6FaPFzLzgcEXfMeNg=;
        b=YXD04PwgJIUnWVI3+Us5F++1Z8xF9uWnHTMdz9fwzV5731xAQjIJcoQgt/ECTJnPxr
         NhA1Ld0/hPQZ5Xc0vW1ixvNSN2rvJNXunjtY3cV5dLf7KzMyFXM6nkxCczJAoSChB8Mr
         QrwVTqA5NVP2THwPamoWc8AdIFY87tLuIIrutezTZD8QrDx/v/LaT82q/Eaad7C/0mOZ
         vQ4kRT8QOQo45L/Zpz3VIgIFPkMI9FdtTDPMa3ZSKSEdkpVRo13TUJyI+qGfV6SbOH8k
         lPPPngMwFziJUqKUFltYHA+Nc+Tew4IP4I0UWNS4b5EIcMSSGRZZlJyelfWTWrv8vim6
         tDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766942; x=1793371742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdkYUYs5y4Iem1sFLDu3Lx/OAa6FaPFzLzgcEXfMeNg=;
        b=cVb9llWdUvQw9lG54EaOv2IfhiaFh8QwegAHR8OnU+Kl31Qd4i3pG9yXAfFfAUaAS/
         ozE7REhNECPn/G+fGAAcnRYG5Wg0qZRaSPA38PhCB9SriLyIWHUe5640AssmaeN9wkT3
         VhoeZw4sjugepjSRE8RF2vbg2/RE6Z9ThiFV8wVa+zmhLFhO71yM0f9nNc6h3obsThZg
         l6YDcmz3oDpj7yvC9rRGS0QHyvmoMcDtTyRZny4B5PaL0pfpCfVU2QIp3uAU//uToZqY
         TjLLv9Ulno5TL0c0aUplWnDbD0SkCQokZ2qTkQqgowHesCd19S9a+CzA+bkT1kv6fPBF
         SggA==
X-Forwarded-Encrypted: i=1; AKwUvBxLFCjRlNrE7ymNquCE8b9BI8ro7YO23X2EtsWkxiZUFoqLDBLOlcbfxonBEXmlbjIXlqKA2P3pdhPty5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkkqM5koRtirGued13iy6qAKXyhE2DeIxEAGjM6Mje04Aovdff
	96rC534zhKFjTbMb96ufs9teOg+WdyenE2RPDpUKaEndxQZD11Ru+DqY
X-Gm-Gg: AYBFou2flzTSmM9qQEnnniWZAVGhs03isjwyzJYZ6WtPOrvjEqutn05JA80RblgvWTw
	L5g2hRZqucrm32K0Ykf3aQ9Y9lQzfglYgS393ArQFDlrZ9v1L3FEoTMaYBfvRxhvkwLGZgh38Fq
	dLoN5wySo1yerAIgjNMADy7q4FXPXeOgn0qnG/XVqe+D1KtQAjNeeghJDo9PLtoODsl4wwlyo8P
	ia9WogPGN+MiUpwSZTPvIbcx+s/6kUEr9QpaExMRljAGOqqPtQoTZjiFvnEofa0U4UrpogRsy0X
	USmq7OnWTPsCrFVhezUQ95aDcVmdQCFQsX2JAzUuxhADfaie5rhddMFRGB/JhofHHoEEGSxpKpe
	XJP7HtPa1B8i3U/aaEAGBn4xUuk3teWAlsysbn5BJ2uSsmq4Nx58Y0EfCQirvUMVxhYjc2ExXI1
	ZCaOVZnwU8QeXppOdgiOAfZtmt2C7JJbpMGsNs3hyD+0rBga00ksBJgXNJ6MKGeIQD/0w1t+oBE
	bUvUJ3dcV2V4s2fj76jhQVoHV7cV44+rUHaLxjuq7lr/gldlARgNqDT0aWBlW5Ex1zSmryUa/n+
	OanZP2riIA==
X-Received: by 2002:a05:693c:811a:b0:35c:7d45:c6ea with SMTP id 5a478bee46e88-369d973b2cbmr3142150eec.19.1792766942375;
        Fri, 23 Oct 2026 07:49:02 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:4145:da00:43b2:a151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6db0d87sm338792eec.4.2026.10.23.07.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:49:01 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v3] staging: greybus: loopback: Use fsleep() for delay
Date: Fri, 23 Oct 2026 20:18:51 +0530
Message-ID: <20261023144851.51019-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Replace the existing usleep_range() and msleep() calls with
a single call to fsleep(), simplifying the code and letting
fsleep() select the appropriate delay method based on the
requested time.

For short delays, fsleep() allows up to 25% extra time instead
of the fixed 100 microseconds. For longer delays, the old code
rounds the requested time down to whole milliseconds, while
fsleep() rounds it up when using msleep().

These changes may affect the time between loopback operations
and the reported performance.

Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
v3:
- Clarify the reason for using fsleep() in the commit message

v2:
- Add more details about how fsleep() affects delays.
- Update the subject to include the loopback module.

v1: https://lore.kernel.org/outreachy/c482704b-903e-413d-ba7b-5bf31c0a6104@riscstar.com/T/#t
---
 drivers/staging/greybus/loopback.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..2fe845eaef29 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		if (us_wait)
+			fsleep(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-- 
2.43.0

