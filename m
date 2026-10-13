Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D87E496D50
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917296; cv=none; b=QL2m83cweu9PXpFhpZJ+GanOkgJModSWmDptTzYq/yQm7Ma1foOwZOuaIj5LCijiRcAb+OhPKknLhoxOmdTnvpyHl677GeyGPyFjk24iiXJTf9OgpnXBXoMAnH5LYQ5sxgU94pZKUcfUr9pRsGYNA/mtQ6J+Wi2eo9b6n2sZQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917296; c=relaxed/simple;
	bh=J+0QPYCcRwTh4UYvHGaLsdQFGbhW1sqFMApyfCXwqb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlysRCA6oYV2JSz2RvGgYzTN6W2YnGQ8OEfgrIYG4VIYi0oOMYHWSg2w1u1gLPw9VLs4cZlzkpab/6/YDa2GZlEN4fLVXOsH+G7zBMWkl0zszbAIMmRcKDw6GSs3e0dHOUR5M5dO/XccpAtsmhKa6L3EK9rzjcM/fMfpIpodzdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhG8nsVp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhG8nsVp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a061a13884so28834805e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917293; x=1792522093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIqYrMuloEwPib2kZeX80Inb7mZQzxZxPFnf5xtNveM=;
        b=KhG8nsVpmWfUbigfLYbVm3vtmrMEEDbcV/DmCzu76zREtAG/lTDgPO1m6u/f8w39Zb
         UmNz5QGMon+aiCJ999d/jLSlARBnvqdspjCf9wvkNXKU4lHpfYmtd3Zhs3tT25L9F9F2
         O1Ul51QjdDk3yoEMUeUR6MZKWm3eTzvnSRt2VEfbhOb+WeBJks0LSJQUEGBsqWZEUAuF
         JJxlVdeByXEi/wimwyNmboD5bq+fz92x4FoD9iR0UWlS/qqzEdaiVbk/s23RvKbZBnsC
         iDj0hbK8Tq4jVxrXAl+3n5vI5zNoILvQrUgNUrxoApXoRBz+ou13ImT1vgTKzHGuRxIo
         sF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917293; x=1792522093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIqYrMuloEwPib2kZeX80Inb7mZQzxZxPFnf5xtNveM=;
        b=kC5BTuQ/p8b7afeHfQXNbub8R0SE5ro0uC19XfkW1AYS0xTpS9297iH6C/n+TybkXY
         l23lQyYYkGbEWdYV+Nk3dpAIDy1HY0oocJnAAtlTwx35xo9mAuPwdoqc2+17zB1DH8BS
         lK3adfjz1LQn9EvVodXqrSzIPM0HAxabGFuch5QjToQa2mgdsKEeC8JaW79ikdqpERCL
         hIjukXiqTa8uxqt0rC0N/0HAs7HkKY+5Nu68K3vMgixm8gOV1jb1am47EQsroZDsbVXB
         iFmq2alJ4Etqgz4UqzqC4EXyk86eH+qUUIBKsLbUJBmnBWmn2crfBrWfp9b3rDAQYGwf
         RARg==
X-Forwarded-Encrypted: i=1; AKwUvBxZM2+3dVdDvcpZNt+yKvVFptONRy7PraKN4HEofe+sQRAdFp91HtOHlnNhtRQXQjGkInV+1e6yOcZvnAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn4LfexTu7tVKuyDY1cbu9khDcCifp1q2sSl3Yy/Qfr2jOYaK6
	Gki3EpuwIJkCDdGj9yybeLUX5yBAN34YmSXFNvmR1qbRL5W5rTLVYZr8
X-Gm-Gg: AYBFou2V3bJu+CCu9dXA/ag3NUJxZvlUjrbCi1RuaWHYsd1B7zNzqgQpEimgRFqnE5+
	Zpi3HUvAjcPWp7KbylpkxJAmtxvvG4e8ji84stf6E88kqqJGhFD3VuySpWaIhz4Nh16W1oztLkX
	luM3l3bkkCbRDDAkcSASN0aGMwqnP6TCijj3lxYJKM7NUrXXvbV47IIO+OmGl3fbxS6ZnzdvWGu
	6g1nTKsATMopWExBBJMCcz9LRQDPXRwbUe+yOpSWll+OnXpFTa0LjiqrGjClbpWKO+2o20qlC6v
	t46KxIqPdM6qtzO2RKcGNFndVxTd0NRE4VpBilzg3gk3dJLIkrHAibWvT8MSFCi6WtZT/6crbSW
	Q5n7q9nhdxo272cHRgIHxgo/R7qeWaDSzkbCAUAuGoWZHti37AZK1XEKdOx+5GgjVUjANE04QwM
	BXu3864CO1yqEilB8UuQHzThsGuu7FXAqiRA9mL3eqvpEchitjox8JJ8flU2ODFUWUnCZS60JRr
	LVpMlGZI24SZTQQXV8=
X-Received: by 2002:a05:600c:1e0f:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18e4adcbamr256259815e9.22.1791917292758;
        Tue, 13 Oct 2026 11:48:12 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm690557595e9.9.2026.10.13.11.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:48:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 13 Oct 2026 21:47:51 +0300
Message-ID: <20261013184755.530392-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

Resending since previous attempt seems to be malformed.

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/sound/asus,tf201-dsp.yaml        |   80 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

