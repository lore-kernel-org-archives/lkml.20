Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886041C6A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124116; cv=none; b=IwmXnTOtzmPccSngEiQxw2l3qt6MfOLDVglakm7SRaMCP9nypg593Tbrs4fLiipV/0l/r7UQJMBdLjpO6DtSKBr5/+zgr5t6IXsGZjG9wh7imHI+bS+pc7QWeSa2MEWMx+NkscPsKGqB0yJszHoroRiVYJLN04LRWSAsQwmqghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124116; c=relaxed/simple;
	bh=jRRPpcydWK1Nh6x7ID45tWL+SSWHXsE1Zkq+srsRrI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Osk+KBVLdwvEstCM3PGFj27OhQiP2qVswVJ5bYolh9x26hvM0jR5VLvVw58SgGldFogwcElojYMZJv0kIkOenSXurj5aiFnYWXHnm95xH65hSAUBrN2787J1hgoCR02ZZFycxD7HoC/sk+6BPUlcDpaZI/7fb/GdSh/TrEyniQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJAOH1XZ; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJAOH1XZ"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f3f52143cdso807794a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789124112; x=1789728912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1No2H2enpWYRkMqmMl17Jmk4Fevgd1ISE1R76jzAfM=;
        b=oJAOH1XZuglrQK8JVmyFvCovC/KOOMCAzob64ygy0eJ7v7exSBaz386WlwnzlGoZHv
         JbzMFsqNvjRuQIBaGGBcEQoo8Q/mHJiH8iZftSI5jfMsjYoAWEuMb/Ib6Gq/eFqVl2kO
         S+kLMeirYlVfnhSmd4JwKI2zUdPvtIt4pYNEFy08zYHKEADRMAAF5MaS1rBaIpRaJT7p
         hu7XFJUsN+1+xRtowsnKzOrof+qjYy85rtjmgZEOr24loIb+++UDfXY2oehwmGQP0PEX
         ZBacHav5fCNIccvYo9taSngwD8i2OZLPIzX+TcQitaES+oKe4TH2da8aANaXd+T6pJXT
         OCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124112; x=1789728912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1No2H2enpWYRkMqmMl17Jmk4Fevgd1ISE1R76jzAfM=;
        b=iYeumLsiIMQesg3BQSPN6y7qbw2ptZ+gfuKp3BewOmFnvMetlB/tie+tBINgdCxnwl
         gZ+MvHEHPPLQhfkqW4bWUOPVDiGXk+2dD34yx0zVtfmxtuUF5nlwogsI68uWUiSefbaB
         Qx5EHreuJVaS2aJ1/PqiGu/7dItgbbuYy5Pvx/m84PY/AZa/MMH4LdVbXAPVk0J3L2zl
         iCl33iVhDmjw324FzLicoGqCcpF0t5QeRnDpAmDDIfFCafP7A0aOfs2VMvY9aWQQh63m
         FQoDL0gzthMMrkFVUZ0uIq/5/0gR51pnZ5jbKtXcYeRzTLKV1tQ33qZkMMDqRoEBN8tY
         wwQg==
X-Forwarded-Encrypted: i=1; AKwUvByY9BTrc59l3oS8BcaF2dgtydvXCJuGnAxatYG/RvpdvcZ6sfwHfYfGlSta+Ilxu0G591xxmBIdxD8ykHw=@vger.kernel.org
X-Gm-Message-State: AFuF++k5+8VJ3iFTHJv5v/Qoef2xHiq7SZbq0xlxkflCkzNEb0Zz9B1g
	n/4t20wlHdI8MMy1Th7duVHJPzb0NdN0e81oSF6fbZ9J8LuOdkKxQgDL
X-Gm-Gg: AYBFou0WHEKhmmpHbkCuMP7nsAceBIlZZYOK3oPIW+YB+T5RzDOtOQ6953BeIh3b915
	VjclMT5QMVeblPu3U6ezt/s3W6F2kQKuXL4pP1Lsi6+8rBwaEdi9WTcbUljcqsHVMcBfVOcAJdJ
	orsnzh4nQSvcu9isDHM9oiLITX/RawT/PaCe024eYL3KR5+5EQaW9sj89SWz+SMoFRiFqXLPDhN
	RNERdPmQwteXRrntHxMDl8TWsxVci7VipfQAaQdzSBT2OuRzymCDLla4jGqdEvYhpQOzLOWEopZ
	cfJsyPuAYyPPOr3qIs3SkjYeiXuHOHx72svAiMHAbbSI+vjaopYa0waabxV6LEeN99uqsW0sStH
	RefblE3ZAEYHmgVRBP7NaPGkmKtPYKyP/em5hMWswLQboXvPErRKpfEjN+kOoBKiwYgCvGgM4eg
	NQJgStXBRgQrKQ+OFqSVrYeWZCNrGnyxaGqgZDGKuqbKkhZ9YsMykhgT9opOCpTK6DDJ9Vd0lVj
	8gEu8Y9rM9pTQLDV0XhSexT3tvQcgaN87s=
X-Received: by 2002:a05:6820:615:b0:6b1:4fa4:76c5 with SMTP id 006d021491bc7-6c0b985e1e0mr2414649eaf.4.1789124111904;
        Fri, 11 Sep 2026 03:55:11 -0700 (PDT)
Received: from pop-os.. ([2806:2f0:5681:fad6:450b:4440:1d9e:e823])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0990cc05fsm2305646eaf.3.2026.09.11.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:55:11 -0700 (PDT)
From: Oscar Priego Verdugo <oscar.priegov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oscar Priego Verdugo <oscar.priegov@gmail.com>
Subject: [PATCH] HID: kye: fix inverted Manticore open/close condition
Date: Fri, 11 Sep 2026 04:54:38 -0600
Message-Id: <20260911105438.1862810-1-oscar.priegov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Manticore workaround is intended to open each HID interface once and
immediately close it, which is required for the keyboard to become fully
functional.

hid_hw_open() returns zero on success, so the current condition is
inverted: successful opens are left outstanding, while hid_hw_close() is
called after a failed open.

Negate the condition so the interface is closed only after a successful
open. This restores the sequence intended by the original workaround while
preserving its best-effort behavior when opening fails.

Fixes: 8a396321e210 ("HID: kye: fix unresponsive keyboard")
Signed-off-by: Oscar Priego Verdugo <oscar.priegov@gmail.com>
---
 drivers/hid/hid-kye.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-kye.c b/drivers/hid/hid-kye.c
index bd96bfa7af70..ed1588e2bfb3 100644
--- a/drivers/hid/hid-kye.c
+++ b/drivers/hid/hid-kye.c
@@ -594,7 +594,7 @@ static int kye_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		 * The manticore keyboard needs to have all the interfaces
 		 * opened at least once to be fully functional.
 		 */
-		if (hid_hw_open(hdev))
+		if (!hid_hw_open(hdev))
 			hid_hw_close(hdev);
 		break;
 	case USB_DEVICE_ID_KYE_EASYPEN_M406:
-- 
2.34.1

