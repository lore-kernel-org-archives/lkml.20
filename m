Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145113;
	b=S/MHuSF56npegBs4NEJHDxIivVkBTIAneAz6E9p/BdliTIZjvpyZBAzB9X5qv9Ihi6UP
	 xb6jWsrz616xTBQ5gW8VZuztQCH1BEO69ty7vSsQEFvAcH/LkAZ2wAHUrfcUnwXAc2Kri
	 0HyFc3QeG66xMbjM9uPGmDHZ6n5DmDIFFjL1vI8XIc3uTz/MnJ7HJDmKtUxxe9EzKT9M/
	 zmga7n/K5EoMEzXNWmvb2m8/6e1Xy+cbvGCajfDYSYiSCsDaurz2rzu4dTOSUoIiCHaDn
	 QCXrL5aVXdqWSpIVJrt0+K5l9QOrmEtJUtB/LCNuAxB1Vq7yTlskB3buiG1MI+s69Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OxFXA2A8vf97MLqDI2dXStFoDohf1oeX4s7Z28iiyTE=;
	b=l7gUObJxlgyTvup89J4yOVmjt92DVKDerLhUaYlrPvX4yNGHs54qy6Mc8p6bgpIlSRbq
	 u/V90/K8i2fyJydUIdGewyQHDI+/u5Vh77OyibcRyyph3LSyaNTbrEhoHblONHYkv09zl
	 T8cJuGR1BRVwAX56grhoZfsdWNfqQmJYsO48vI0G/RadC8T1jkS5Z7lJdHIwh4mXs1IGh
	 AhBN0+f5aLKa2TcTJlSgNxGVuFmv+Wyz89bXM1LdsfjUdGBf3AiLzfphoavfwSSU6Hl/M
	 Jq3wIo6jMzk7O21x4teN/rBZKQD7iWYjZYGTvyXDNRm6PRuxVxOvl6aVP+uYVcmOZ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OndAluFL;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01340606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01340606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OndAluFL
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so180399c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794145112; x=1794749912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxFXA2A8vf97MLqDI2dXStFoDohf1oeX4s7Z28iiyTE=;
        b=OndAluFLYQ0ImKAKq1jHnVrqGsXubi2j/NdImWBrrb5hYsZFLTPTaGF3DKFkO/tcoS
         t2DV+AWof8yg+skrFd5sosrJQe/T3NtDsYBQdeg9ivuLcShfR6LGmS93ycc7SvKPKFqk
         vkVtgwCZJKSPUFnUvCIKh7O8Skj5BgOCOcp+BgEtbhXACxwMgwt0KfdjBuWKqcOy2TkJ
         9vVupA1eEDOOuOCOm9dtdIhGZef+5X9gFVBrCdXv7Rvb8y0hH/BhAlQGfxop7xAEPHR/
         wVQvoDCqUZGPEiEzvRXXJ+oVxWrDA1ODwzL8XCbUjZHdHwwMcfbuyHYSq8Hb//WEkqsM
         aAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145112; x=1794749912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxFXA2A8vf97MLqDI2dXStFoDohf1oeX4s7Z28iiyTE=;
        b=lFOR1Zxj4CD8QNirMPIu/E+tHeYRC20uspuoSZtObTncGqaxT25mqSSPtEQ2CGpwhn
         9w0CQiMpUaPaRAYMkbbd+lgkTlA9JOB9Qgn2c8sI/Ese++uLSaL4aTfYEV9y6h0RXKfj
         +RLGRdsvNXg0SgnciRQRWepQceIQEO4VL1Ba0MdxesCCvWzBfRUDHEuywDjgxYIYPsc4
         99yqSwcdyTKLBh2+MhHC+hOt9seTw9JlBQTeq9Typg3GBZVpLV2QHrCGjWfUqls4fqvi
         elFOOdfprnMpkuPx+sW+n4R6Xfn/52dwI4olMYF8ltlEfjMgDlgXseQag2/BdO1jesIA
         XHfQ==
X-Forwarded-Encrypted: i=1; AL+hErHE/WD4B9RtOk3qVseM7Vfm3EhSmWa0ti/I7CW2IEadNNHro548rjpXdM1aVil8U6HvB/1vt3BT3cfs6UA=@vger.kernel.org
X-Gm-Message-State: APuU4Z88S6ocA/auTDGi5Ez7CJ9dYACJRbjTHV3lC2R4MdqanDVOoHWZ
	uNAzjCiAByU7IcoAMCO5dy2pxkwixYC4mVrPOZAsFI4VdoPN2QyOD25dUvoTaxOJ
X-Gm-Gg: AYBFou2i0pUl96N5/OMxvfFar34J0RvD4CpksPn6yq/6FaiOAkWLYV/l1ZwOzoSFKQ9
	FdwQQpuKO0JOg7ak2gT4PVm408raf1pNcg0lY1BJBcwJJxR/aQ1eYQcP0Tw7+oQztYn8QEjTUDe
	VU5FZPBukJjvRRS2F6tMonf9R8deAJ/DTp5MJwYjQ+/aXJqD2bUqrjdLF55Kxi27Ghicwg+L1mk
	ZrkYaWrzFiz9tepu3866Z7yyukTfUYX+tB4haQee1Tl537vSigC4pyuGnbchoA8mZvWZqhKrBi6
	+q27hH3hnfi8ciV6QXQ2t3fHzTsALSzHc25vyH2Z1Hb0p7qWyqWGu0HUjKWp7pwbunAtmQb8GUQ
	bQ44+16iXeXIj0rNpn4gORY2w9Kuge1voYFm58iL68oD2hxaNr3LOCGhG4a5mt5FRS1/XaiPTjk
	sf0rfjKnr4H05x+1NWYQxdIEAtU06IivjvedzzYFjJ/uT7T5eq/U07cYDRLLFdAKJRrV+eth5D5
	LUwHgTl8ar2JBd2j0cC9XISvPTps/2D18qICK/qcDgs2EkUVDriHIbGFA5kIFYhmZ1BeIaoleMe
	7Qan2hClKwjzV8GrOKFf7a2IEtND8H1UmkjvzM5us7gcfrhMaYU6eT+BW/6E0yiLbpf38g==
X-Received: by 2002:a05:7022:5f1b:b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b39fea9b18mr2244971c88.31.1794145111975;
        Sun, 08 Nov 2026 05:38:31 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm5515696c88.12.2026.11.08.05.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:38:30 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] HID: microsoft: cancel ff_worker on remove to avoid use-after-free
Date: Sun,  8 Nov 2026 22:38:21 +0900
Message-ID: <20261108133821.535139-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

ms_play_effect() schedules ms->ff_worker to send the force-feedback
report. ms is devm-allocated, so it is freed only after ms_remove()
returns. Commit 1cfc77a64b71 ("HID: microsoft: move FF initialization
to .input_configured()") dropped the cancel_work_sync(&ms->ff_worker)
call that the remove path previously had, so an ff_worker scheduled just
before the device goes away can still run after ms (and ms->hdev,
ms->output_report_dmabuf) has been freed -- a use-after-free.

Cancel ff_worker before hid_hw_stop() in ms_remove(), restoring the
teardown the driver had before the FF-init rework (and matching
hid-bigbenff). cancel_work_sync() is safe even if ff_worker was never
initialized: ms is zero-allocated, so the work reads as idle.

Fixes: 1cfc77a64b71 ("HID: microsoft: move FF initialization to .input_configured()")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/hid/hid-microsoft.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index a7d3493..462fdaf 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -384,6 +384,9 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 }
 static void ms_remove(struct hid_device *hdev)
 {
+	struct ms_data *ms = hid_get_drvdata(hdev);
+
+	cancel_work_sync(&ms->ff_worker);
 	hid_hw_stop(hdev);
 }
 
-- 
2.43.0

