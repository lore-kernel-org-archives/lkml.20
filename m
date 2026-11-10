Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308121;
	b=okW0guk/y53ER0Td4NNS5z5iaTb+LG8dlK252n7xX3701MnG2LTnHH0O56SO+QpoEdiN
	 A3wmcm/VLU2G5A2W+uwNL1CXUNWWihjpEa5BPBIXPI3ig0tHx7JTN2LzFOML7R1Ag+den
	 T6kjItwXcaKv/MUqq6EleeEWiW30p0xBknyuWpDiF7nTdDod0Lnyk/n04zOiGOonhtefP
	 MkCUrJ4VE4/Qb2ntcIrgEA40pwSjniLnk/rp4YAjZSoFz3mDAT6gCUsmQOrqqjUc8toKq
	 mRpLduLSbJl/t+tv7RFFE/a0x0gmThDiWR3xriNNKU322e/M80IWMHlSg0SYdqGb8wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zm0AvIJOmifRUI1enIfd/m/5IgggtCc9iLAPgeXHvVs=;
	b=wDm2ltiPKK+ilNE2gvLA7hFt17r2uwI7TkeDDuEb36NoJ4W8wUvlx6iAUqrdLqr8D7i9
	 CwGEIvWWT/wrs01uDSBtEnDVuoUfVGlvCd6UW059axUnTF5Jfu+oNSPKXP9jKL+lVr5Lu
	 K5Tqwv2Ss/fVE8gFEhUlEguTcJwBaauFryBQO7+2w1MFOPppj/ke78cc0O6dcLtfm8Ctl
	 tIss2xvZq7rcMSj77COO8oYbl5z9PTCvovkAGrrGVtxmVSJLWKj2EbzvP/9oP84/DU1NA
	 M392S6dg0m4rINepaFVSFCSr39+ACowQT7RCXsFM+ut6quvH505sqPFeQnH3LVcVdmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M136hZAl;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9375260A260F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9375260A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M136hZAl
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so3314397eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308121; x=1794912921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zm0AvIJOmifRUI1enIfd/m/5IgggtCc9iLAPgeXHvVs=;
        b=M136hZAlbjy3s7YeZo1K7+86Ec8kn8yxcbu1/dOGL1CUN7tX534EL7MuqNB3LkbOQU
         ZYV1mKhMazwV+tyVUu8xfIr7durTHTJSnf8L40VUlERTQ04eFnZXV1q31Fys5o02I8FL
         ybyP0HuaJPZavSsEutaRWMOGTVGHQwi4ISjB+ahMZtFbbGiO98kllAmBh8f2rMSki7rT
         UfKbfWeIvYEgsX5R8BHuiJ6fM4DCOAUT+4nqFlmYpbw1HMZ4thpTDQBlDJunkHghpmC2
         s0X6fZ9dG2jcR602sAewdaELfL+gbRiCLz5vvNh/FjmhMqMyJFfTLiv8GK7zhNNx5sUi
         jbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308121; x=1794912921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zm0AvIJOmifRUI1enIfd/m/5IgggtCc9iLAPgeXHvVs=;
        b=WjozX7076xpkmf4Xo8e7wiA1ClMAWO8jhP6PBV9f3DpXSW4Iy0KhN1jtQhqB1WYtRD
         +DyXRavhsFG9SIXTXcBb9X4Yrg4MbR30mz5VZGzZVLmnwJuvQ3BgizWfzaivLjUcsY0p
         B/IsilEKnzqNInhF24AIWlUeYKY0pJzCk/Fln3e8t7aPAiVw6yAyvMgk1FPduYs1zW7C
         PjfsfGVmSYfsZZCVE41qRmtPtxaiJQW2iFu8XZgJw/+yp4Hssn80beNy2mk/2j6C1abe
         YCz0/A9KFjRTuz1xq+n675wYbI4Xy6HzM3vfgAhoqogvb0juwDCH1tRevHRrlFBqymdh
         GXlg==
X-Forwarded-Encrypted: i=1; AL+hErFNx79fiYJMQD4ZxC9VcVppTcQmD/R61arhD5q7tprDCHcC3qCxiU9sbDBFDMxF0TnwkCq745sdjME1mV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R6X+CfG9mxRyffYw8eRcGqTZPM5yqws5cOESpqdYyrMLfPCcM
	EWG/gIuTgdtbYo+ZDYmuj3aaKDxqLLwk8orLassuG+Osppv0WlBTYlV0
X-Gm-Gg: AYBFou2vXF6pzOW0tvoh16Mj8P2PvT5gipGtUcF1uMopYojfyiXOZQGHYGWC4aOUGuU
	73xLaBrD4pRPBxRLFfw/nOljZi30GYQFCWN7C3phxCv/oyzwa/vSTgSoiLCYDKleazz4NqG8z5Y
	MatDw7tJ8xo6UG+bDaZPYUyOgaXyh18UH49BV29XMBMLjmKBvUTDHO2Qt7AnY72rKdHr7J26unT
	WUUfbAQ9hZ+IPiacich62aEeBpbkRj2RqT1+DZIAL4xe5h55xgnaPQe9qsXbLKojyHjfh857Iq/
	7Pt9tDS9hOjTFr0zzQUEOCAZl2A0UFyAZoC8+/J6UWO8/tirsx3kRV6YRouhBgtWaQX+JEDscbT
	BIsTbEb2lpvGyTwa+Fd/ivPiB9r411NXgUfril/+zVJsJ0fY+aA6u0qd1pZZuUM2CJXIet6FFaQ
	lHV4K5NdDlq20+/jym2eNRaodfeelmnT3n6hTFb48nwv0NihEYcqrW7BEFU8Svv7EGk4AQllaw2
	OGe61wwMPEmFzn5QMYyquUXj4pwIXEPmXeCohxhzbowSyjmH73T1zsdrROQAMXXGjp7bfHoPumQ
	mRMjKRhp0PxMPJKf3BaCCDVJ6aHoc4HDn/kpHJY1Yk99pjs5
X-Received: by 2002:a05:7300:d20d:b0:369:f9da:a70f with SMTP id 5a478bee46e88-37520120294mr3038993eec.17.1794308120201;
        Tue, 10 Nov 2026 02:55:20 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm6358690eec.15.2026.11.10.02.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:55:19 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] intel_th: msu: drain the window-switch work on removal
Date: Tue, 10 Nov 2026 19:55:11 +0900
Message-ID: <20261110105511.2488300-1-hj351016@gmail.com>
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

msc->work (msc_work) is scheduled from intel_th_msc_interrupt() when the
next window is locked and the trace has to be stopped from process
context; the handler dereferences msc and calls intel_th_msc_deactivate().

msc is allocated with devm_kzalloc(), so devres frees it after
intel_th_msc_remove() returns. remove() deactivates the trace (so no new
work is queued) but never drains a msc->work that the interrupt has
already queued. That pending work can then run after msc has been freed
and dereference freed memory (msc->buf_mutex) -- a use-after-free.

Cancel the work in intel_th_msc_remove(), after the trace is deactivated
so it cannot be re-queued, before the device is torn down.

Found by static analysis; not runtime-reproduced (needs an Intel Trace Hub
with the MSU in stop-on-full mode and a window-full interrupt racing
removal).

Fixes: 615c164da0eb ("intel_th: msu: Introduce buffer interface")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/hwtracing/intel_th/msu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 84d99d7..902e7d2 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -2174,6 +2174,14 @@ static void intel_th_msc_remove(struct intel_th_device *thdev)
 	intel_th_msc_deactivate(thdev);

 	/*
+	 * msc->work (msc_work) is scheduled from the window-switch interrupt
+	 * when stop_on_full is set and dereferences msc; deactivate has stopped
+	 * the trace so no new work is queued, drain a pending one before the
+	 * devm-allocated msc is freed.
+	 */
+	cancel_work_sync(&msc->work);
+
+	/*
 	 * Buffers should not be used at this point except if the
 	 * output character device is still open and the parent
 	 * device gets detached from its bus, which is a FIXME.
--
2.43.0
