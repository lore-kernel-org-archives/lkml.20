Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429331;
	b=5WmY9SQcLR8bRsun3ggU7mFUDTV9jW7u9e2ngt0M3Rb3bJ0fVVpTQT0S0e8tJy6+4JkB
	 2/uIVSOu+P70YWsXaV/jqyfdfj5LsqlUU8uAkyfXCAiQmbpYnJDb6fVz6UJUmizoJNNom
	 Iw0eBfQQPAgvvy7R4NqtWLWoBeWCcy20R4rti7v26YMFVLgq7jBEx2RzIbzcoU42IhLqF
	 72QLsQnPKPszXLjfdecMiKe+fja2IxiAkjBNeTAxFuj8XGfsxHA33EFiaHQf4aY+dZTE+
	 G40cQYQYBCzcPd0EAOvraN2hGn8sVxDJOKfOIhU85grNygKO98dlJY2VEp7GesMunCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
	b=Oy96xXbb8YPP+hPZOgsvFmOYYmyqDjE0WBFVK0xAlU5Ga7mhuWKPS5iXh9ZaYIroRLk8
	 H0Wu6bbHX7hg9t93TsRFjKyes3DQuDK11Aj5HcO0F++FlWjxbnvgexbj1EQp8oI/Sbtah
	 akZg1m5nAELZ48K7Y9FGxG/AGRO0jRUPJKAdiZUwHYQmlhsSJeQ2s+i0jACnJR/Q4Bb8x
	 A3dKa56cE6gTbuLsKJgG1e8FU+QFmhcE69wSMnkJiOZUo/6M7ikmdNRncEh2N7Zj7rdWA
	 v/SyzUcGim3hcGOcq7JbS+2d8lcmwGlvSO3HE1NSpt3wNVBuTIP/W/8JuxtcsTN8ycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ocTiixAb;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7CE60A260F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E7CE60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ocTiixAb
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1610804a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429330; x=1793034130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
        b=ocTiixAbjoYtkjRsCv9M0YKgBpnrHWSeHIIkjyjbhquGpkRsl8UMyaFPwDR7MLhJsQ
         Sr7aMcUBEUqnEuXDZTr7qAlCFByQllvPI+WpqNSCaiRl1DMGhpyMv1xvzCx3lm4S9H5X
         lCoj6ec881I7WQBMs/cbTgGDwU+qt489uMT1RAWSppIEAofBa45rbSW9lH88afJ8CqqN
         4icg5rnrzIQuuc0CLuBpCSU2k6nnQ9YyrmGVy88bXEMqBuXHNKU7Xw2NPF5mSiO93LKI
         8lNQ/zcr+7p9S76HCBrrrKEV/XlQWo7Zvdck/r68ni4/VmUdZz9qdso13pocoPYfNRwR
         n27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429330; x=1793034130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
        b=PGIo26/KoyGkSQMAw7FnkMxpF2Lo2Jkn8rJNR85pRsxSgffkPLmn3iCgrI9bt7t5Ul
         KoaSLaZjBwhm3RdiMqKQ73NV6eIeLHiFp93wW+dPVeeKo0gktWBf0MuOTv/s482FXaRy
         HHDV+owguAGS829qoQYlj7HrMXOblVRXZKd+7NziVNEdYjQvkLD5AkUioMA6Wf0gea0z
         sCWVhIEfkR8FvCqw98NWZwtI7k02yEyuFkI6Dua4pLumQSO0PqftKLC9UiLuuIS52o8t
         KFJsdB1GbkecHW5Rivr7TMj81X9bB6roF0vp1megzM6QVo85YxzxsaVNNDUa9OfDs06p
         m6eg==
X-Forwarded-Encrypted: i=1; AKwUvBwKkHS90B+DcxJm1puvgj4OjISbLQfJIBxpSHUC80pix/C5ujTdJzoWlCR5y6hp7JGVdtM9+o3vg5A8NLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT+wNnRkMyaUB74N6G7a5BHx0kxiskpoMdovvSMwazimJQUwbB
	XT3hgArdmFJEIphXDmTD8090SzT93mm2xS8NsexXUczTBaEBL2gvDcTn
X-Gm-Gg: AYBFou3L73vIZu/BJR2iu8g2mE52VY/c/Eu0wLgv7sgGhhC4mLaGvZI+vaEqsL0dCVU
	mBLCZrvAFKMc4egNY2Hf74C5sRLkPSn11pCg2kVLS7K9e8VML3lur0RBSBHaqpbYt93WPCDfJ9x
	JuuwRva79QH2RAiWM5UaJSh8lV3xSHIFiOVFxOnm/Qe8fV9+Q2w1pRG1J/d9AmWFn6SUMolMWn4
	pLsB6VCBJ3gkh0npkhMesRwOfuKHCBTN3wytsFxOkqx9uO9WqsaJi0L3WK7QtDmAf6s43DU6LgF
	nYWcyz6Fo56hh9SnKTQ0ja2S8Tx9nHVpDGAX9JfFUvgV+e+l7do1CzhDj20RDDSHMMKCOSHHzhG
	G+pwHgtRHzbS6lSmfXZSNPJH9o/RdZCnVYhnDwA7HW5+ddwV+wBHGjF6tjzu1WR4Wg8CWLNjBLE
	KfBUShyNXuZqEcqfwL9cGM4gn1o6qX5Ye2MjjpGmIYmCOsTYANCKSZT4okUZlso1YNtN29sgUUN
	KosYXjdM/f2bE4NzFtY7gJqVz1SiWfGaTiI4xiNPQy+M3xkBYEkpqmrp3L97oNOtkrjgbol
X-Received: by 2002:a17:90b:28c8:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3acef5f1ccdmr7554752a91.56.1792429330017;
        Mon, 19 Oct 2026 10:02:10 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm4317511a12.17.2026.10.19.10.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:02:08 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soundwire: roll back failed master registration
Date: Tue, 20 Oct 2026 02:02:01 +0900
Message-ID: <20261019170203.2533974-1-pocj8ur4in@gmail.com>
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

A failed master registration can leave partial port allocations in the
SoundWire core. The Qualcomm driver also ignores registration errors and
can retain reservations from a failed attempt, so hw_params may report
success with incomplete master registration.

Patch 1 makes core master port allocation atomic and restores the state
changed by failed configuration. Patch 2 depends on patch 1 and restores
the Qualcomm port bitmap before propagating the registration error.
Please apply the patches in this order.

Tested with ARM64 QEMU KUnit through real SoundWire registration APIs,
Qualcomm hw_params and the ASoC wrapper, using synthetic devices and
task-scoped allocation failure injection. The baseline and a return-only
alternative each pass 2 of 8 tests; the complete series passes all 8.
KASAN and lockdep were enabled. Product-only ARM64 LLVM W=1 SoundWire
object builds and strict checkpatch also pass. No physical Qualcomm
SoundWire hardware or audio playback/capture was tested.

Baek Kyu, Kim (2):
  soundwire: stream: roll back failed master registration
  soundwire: qcom: restore port reservations on registration failure

drivers/soundwire/qcom.c   | 26 ++++++++++++++------------
 drivers/soundwire/stream.c | 35 +++++++++++++++++++++++++++++------
 2 files changed, 43 insertions(+), 18 deletions(-)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
