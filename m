Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022775;
	b=eCtLS/Wnd093rd7cWBXGqi+GkB77UacbY/CBZ2ewPaEXBmk4vYTFJBpuSAc73XSAVWhq
	 HRS1r0B+kHXfIo5RU8gXfLIxcKSH3t7QnQw/39MwmBIyHDBBx8RahAo15QoKsmZxpwCME
	 xgappsV44mkD7IgL4EKLq0UvoN6687bOdsjyyKhWOJvCTYTipvUS326+M4NLETQm1p2zt
	 2m3YuV1E3M4KrNEfVBsnwjSDKk3C3N41BbpOZrW3S0JYjQfhxE8nju38/0Y81kKOrZq72
	 WJ19pxtjdBwnl30LCw0dw+QDjx1zDCYm8diT7s7X5S8Uvwavf3p6q5WXbuJoi3TjHeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sde4rWYPzlk+BjvGEtm/0bEjWk4rqiDVQzGqAxbKKl8=;
	b=a6XHH5HH7hB8NISl7MkQAkhRtLqdOGoMJktnVslc2JeTylqIfaToKqZT1cNlEDOMcjL2
	 /nY6BuFP+vHWfRSL9p1VhuH2dQOln62YbIUqCU3rP1RWiEGkliKWiHZXJR8l5GBgnMC0G
	 mkRkm3mdujcwJUf6dRCWoOscUoOLZ0gIa7nDAOkVWQEtcJgeQVShuMV4gpMVw1X39SnOZ
	 1Q05yJjnGJxXVTKSIkfrMJIp5gjt8LMQCnwAxBcdfNX+Svo5TANBTbs/OAsLiYDKHDKBT
	 WKkqQNEfxNSDVeeMCW7UnUaLSltNLkcJRUG4Lgb+MfNZxgyT/XO3ycubyw0wqGPnMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvtMkzgz;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D06606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D06606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvtMkzgz
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1946558eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794022775; x=1794627575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sde4rWYPzlk+BjvGEtm/0bEjWk4rqiDVQzGqAxbKKl8=;
        b=DvtMkzgzjLMcaDQoyNjMQKjUQqxyzlLBiQUkoif9cFrK4HXhCvPfUWH4F4+h+8f5HW
         +NYmIIMExeqOloneuyGJPB53Xjg+3mlvtFzXNhw+1Mhg/Ay/fE8H1TazVpzMYFLmGp8U
         IoOIkP6qV4Mybf2IeOVuYOXhvi2F7j4ej16WFry6WxxSRSOCo68sMiZIstPgpuYCh0Mj
         J4NuXpfR2jhLFwL09bkvkL/gW76a+/8SP7X9ysVqq/y+2J509YDGFZZ6x/BQGQ+sauim
         l5/Aatx7kFufP396rJ3KVLrv5uwLI9zyY7c/NMYY8oTc/QDMUreCN/46UrKltJeyzqP1
         tgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022775; x=1794627575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sde4rWYPzlk+BjvGEtm/0bEjWk4rqiDVQzGqAxbKKl8=;
        b=tYHW6TJ9dtnIb5VxzbmnlF0W01DpAIuFSdU2tImW9Tpjpk7C8gGLo6LKf5KmzYVzmI
         dPF1tXFiNqnIoHjcgQs6zH+O+qKQj7GxDtF+6VnaTIurYAUCf1OoVGh56xApYCG1LYpe
         i/byTvr7D3rQaPV2GTBWVZnGg2bCmxiTkwJnz0UHH8JbEEjITYWowMf2DUm9r+ccAxg3
         5aA+HNT+IChklj1gsRlQs+zSczsi0c2QZf3dNZquE7Q1dUen8S+fMuVftxtmgXjGfeyo
         DKHu/65mByUM/2+vCd0HkKH2FsYM0Y3Td8H6F2UayudskipBweG1hcxOkAGUJxHakmNC
         WgBQ==
X-Forwarded-Encrypted: i=1; AL+hErH/5y9mRjmwXaLsLY1VKDMIOggBcv9PWd7tvaD2eHr/3gEZfeZu8rCSSCQ0sLhXVInklsOi6aP+WFpZJfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VNa6Rw3I/lz318SyS3Mkw8v2nwrmRCsVS1QonON9EmpS23TnK
	GUEJ7loc6ijRhZLte0GfDJCUrLBnetKzbJHkRZwHejwiZW4LkZ3mURzP
X-Gm-Gg: AYBFou3OLNkiIx5kOcC3fRN+1Fa34JZWop+OfMZhR3DucuJORDOwt0QnfjxGaCLuC2p
	eTOr2e+ZpdIMvFmgt5UrNVOgioMKo5Hva5qwMQp93KzgJiqdvmCP3LwIIsd7uLpph+BdFx/HUKj
	35dZogT5lHfAXwFBvSPX68ZYUcbkS4expwIp764masnhi5uhVDPxEK2rNja0sFlOS0KJH9IVJJY
	JYpQ3kwXEg3U/5p4A1r/sMftHcbGi/EqkPUP8LIFZsuGPVBfcX8og7ydwYUQ86ECk+bWhLu72BJ
	1d+Ps12Ls1Qw4+3GMu4tej8ewn+3ttG5E+BSvFIawhRkd42Qu+HtlKueV/YCmasXyP1q+BHe2AU
	kGdWMirsap/zYWiHkqm5WPO+4VsiLoM7CEvMHMWfdlUpeUr9dltgyLDJM6adrNnLRmyjAFAxg3+
	7KJD8RHhI9GSmnOZeSsQncEOY1yyWQ8nN1K+IU3m3mgqDH3a9V5oVUwLmOfI/TISkGHjUX3Br37
	h4LbymQj1vehDd5HI8eWo33ITJxB22nlpUwUafNFY9ldQdlnToQxTzoKRbnLWUy11dyj5GLs5Yy
	l07aO+8J73Z7Xun3/9Mxfyfb40ojQOcndLBIw4m5ArHtTHIWxPZtAodctTE=
X-Received: by 2002:a05:7300:10c:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-36f7710a6e3mr5903376eec.38.1794022774554;
        Fri, 06 Nov 2026 19:39:34 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:e335:1852:72d2:7bdd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm13790821eec.10.2026.11.06.19.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 19:39:33 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	alx@kernel.org,
	shlomojune6@gmail.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v4] media: siano: Replace strlcat() with scnprintf() in sms_ir_init()
Date: Fri,  6 Nov 2026 19:39:28 -0800
Message-ID: <20261107033928.13891-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1], replace
the strscpy() and strlcat() calls with a single bounded scnprintf()
call to construct the IR device path.

This preserves the original NUL-terminated output, including partial
or omitted "/ir0" suffixes when the 32-byte buffer is too small.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
Changes in v4:
- Replace seq_buf with scnprintf(), as suggested by David Laight
  and Kees Cook.
- Remove the unused seq_buf include and local variable.

Changes in v3:
- Replace snprintf() with seq_buf operations after reproducing
  the GCC -Wformat-truncation warning noted by David Laight.
- Drop the previous Reviewed-by tags due to the implementation change.

Changes in v2:
- No code changes.
- Remove the statement about buffer capacities from the commit message.
- Add Reviewed-by tags from Alejandro Colomar and Shihuang Liu.

 drivers/media/common/siano/smsir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 283770d583d5..6952871c5816 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
 	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
 		 "SMS IR (%s)", sms_get_board(board_id)->name);
 
-	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
-	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
+	scnprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
+		  "%s/ir0", coredev->devpath);
 
 	dev->device_name = coredev->ir.name;
 	dev->input_phys = coredev->ir.phys;
-- 
2.43.0

