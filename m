Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82766415B6B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797261; cv=none; b=eT5VmwrkKzfaOfwp/HsOVn8yHu14VpYtMFA4HHBr8Djlvurwlvu2xStWdxkpYJYo3P2UydubtBJMqHvpfp2qTdePK0Y6WfzaSwv9BBCpW1XB8FNJmMKJEidn0x0Ps2pieM+Kr1vArnZq+gwi/UILXQk6f02c0nEK509ZHZ29/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797261; c=relaxed/simple;
	bh=7yg7WgszV0u6qvYQzsbMXRSi0jgQj/GC+iPyvh5zAqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hN8DG7Yqvi7ApfUrfQYObDmXuCSiJff3X0L0d0scQBjAMyEJtraZ2Om6hIGaTW+qKL8+qXCr6UqTmCALjy0nOTGcE3RbiOMu5qbchfML5N6FnWqUcGDFBfmrb+2npAiRWjb1hoGQiuHPBAvLCd3JLA8z8epr9SSNXmtOUT2oj0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JeWX2P4S; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JeWX2P4S"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89a1740f0a0so569455b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791797260; x=1792402060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDXr90I4Mp/V2LyY9TJ2U43WGzZOgE+mNjJL1cCHqJA=;
        b=JeWX2P4SpS/G56Z4uyD2AsiLCkPOJtOgnX0d8onqJCsmTATcpng6vmg2ByaCbjoMgb
         DLn4QBrr7u62FM8zgoYL23dsxqowUhGKp/hQX+u8EEfphqxKOBAfEJyAzvj1NFomnHJG
         nN1t8ufbbLSOlRGalcSHtJ6RsCkItOcsQT+TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797260; x=1792402060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDXr90I4Mp/V2LyY9TJ2U43WGzZOgE+mNjJL1cCHqJA=;
        b=qVhS4i/zBeMZ7zQ2qhvHzfvJCx8ju3F6iOT+7S2XUYvdeCHQbl7Kjz8d4D718yEgDl
         dlHMcRxzvlnuKf1mqZ46o0jNNeoIDvGe4YEGVeZ2o+RZ1iwdDU0kLDRSvDVGg+4y2Y7W
         ST7zbimmPVlIHlw7U+MC2+p9QBhdQXgkgNtw75HFc4tjWihSPko/wW1G27Hn/xP95d6q
         78GB4jdVaVLqAJGidrm0VZ0hxEysEOepPthOZo4cdDZyIwDjts0Jw7kNpuWIo8oIFZrr
         FTEQXes700wsZV78LF7tzOZRESEHoHWv0aXW2007kvl3z8UsfcldRKiBsoJZW+5IW8Pb
         zObg==
X-Forwarded-Encrypted: i=1; AKwUvBw6tXeV/VSaC0DOmrYueTS5UQuQ9O87GuJHMiWsiT3o+Axs09Di8Ls5ZTOWTmva7JOocdGsNm5Z9F0dEhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXkkhJ1pZsvMD/UpLKswkLLQlwrQrHLX85oe09Na6gvWeHnwwR
	jw1XE34JW6yVTJFTYWBltMYKLMWvLlXYEVPz3QmqE4Ps+nuvNro7bUFWyhR1AMeHDQ==
X-Gm-Gg: AYBFou3dkUR0MmDRhYOj4GhfHaeODRuhyQHpfB09HONlZTDOLUGXjfVe2vffNNUd1lq
	0EgV+4jCTsl7Z0RBiLS7bTEth9XReYNPPvd31yYnbiVidiqFuojz2tP+Bdo/YVTTPlbZ7ANXBcH
	bkbQkCJtj8JYasdLOirZ+gZPH7FITL6ZLNAzhK+vGof+qQK4/nwROIPPVjJ+iCQbe0wEHf8Ln1/
	FYQgSqus/hZFLCrvjwW5Pq2Q8ez4kFETQwXZLxqiAHZ6ah78oCxaDghnCFtRldW7jZ7KvhkNzzl
	rlY9Ju6vz82gVewNNjQQ59ho9DzNQmoQnJZQwTj7oeHPPxYnoqidzhKsqzlaKsYzm28gebrZlmg
	SwKmqxNmA7ULFSnEDhcX6CN9muFOSaTIbRbsPu8SbH1ONlLMVDH9nMtNkqHjR5qN9shz2+VHhQU
	OEnKZRjOokFhG8Jynkep6BbGBCHym/3fkOkrzlft42YrqGw/7kJ2i9cllSnmNwWCpXe+mZ4Kpvj
	6BnZeaBaH/leZguasqxogzWLiZre3XDn+h6xJiatnnnaMQ8t2n00zQ=
X-Received: by 2002:a05:6a21:3418:b0:3de:583e:97ad with SMTP id adf61e73a8af0-3e16bf04c22mr6687300637.62.1791797259847;
        Mon, 12 Oct 2026 02:27:39 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:faa:a1f:d46f:934f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e53f8bsm4117869a12.24.2026.10.12.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:27:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v4] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Mon, 12 Oct 2026 17:27:24 +0800
Message-ID: <20261012092725.575885-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves |message|
set to the default "out of memory", which is somewhat misleading.

Set |message| to an error message that is more specific to this error
path instead of using the default "out of memory" message.

Assisted-by: LLM # local reviews
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Print custom error message directly and use generic error message for
  later, instead of using more stack space

Changes since v2:
- Simplify to just using a small buffer on the stack (Alan)

Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/

Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
was telling me that it won't work correctly if CONFIG_USB=m.
---
 drivers/usb/core/hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e929a4c9fa1..4c85fdf7a233 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1758,6 +1758,7 @@ static int hub_configure(struct usb_hub *hub,
 		if (ret < 0) {
 			dev_err(hub->intfdev,
 				"couldn't create port%d device.\n", i + 1);
+			message = "couldn't create port device";
 			break;
 		}
 	}
-- 
2.56.0.385.gd3acb90ef8-goog

