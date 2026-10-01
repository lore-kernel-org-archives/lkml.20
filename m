Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7652B1F3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877323; cv=none; b=Ot5RkPkCOIPTnbzwet2ahB+mkj95v1AUa+gbTD2xfodyKkbXGj9gHHUvmVFobu5SMGfxng8yj8GqEnktN2tZpWIz4gkoWgyCavTF+fpimLn3X0hNtsgbD32xuXeIv0/NLOrlzxZhdV/Prf9RIcQ277Og7ky7qccJk4jdh4tXdlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877323; c=relaxed/simple;
	bh=DSpR+eIPRBF54SbKN9yo7UEYapSBpiuM6wm8TWPC1+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dv+ZxkKEQm91spThULEnhaH93ZIT7He88kwipmOrObBBZxiutwgK/Dlppzfie4JK79XRkYAWJKtvgZXpk5dpPKZg76JUHf95VL7itZpseCCigcSL75GocToDiWAAU4eEbNNimeqfkkwgw2p1Es0TV50P0YcLSmxzAK6CG5J9Ces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7Id13UQ; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Id13UQ"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91400f92ae8so51072746d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877309; x=1791482109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uHw2NWjMi2sZfkej/m/I7q1/1oXqeNZYUpECWxq6vI=;
        b=E7Id13UQomuPL9aWkapua+tmuQRYbj0dThURePlTxw8/TeZ7Cd+OPua3QkrTXge67F
         eu/ayh5Odq656jVhBR84uic7znNkWW6o5Tp27K6yKPOAgyoRWOKj8CfNU6C9oV6KCU/g
         4TNaC/DhfARHEn3hhuG05fnvAMUs527VXLVlD/pHw+Rb1nJ2m+bLxbgBprlWZ4sCXMTf
         bzHWCxW3c4W5J86oq0KbGlU9wfZZIpKMv5oIc5p0h4dklZsduRiEQyWIfW/wtBfMALc0
         cddu+EmN//Jz87YQZsrjRPJzzmxqq+EiPsxCHZgcma/a2zibgSyoOGJ8xUFvI2q5UAyy
         eiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877309; x=1791482109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uHw2NWjMi2sZfkej/m/I7q1/1oXqeNZYUpECWxq6vI=;
        b=OdfbyX0C5JCDf/dH+m9IjbFMnVmiUwfzHtHDtXuRcat0ejP06DuVzL/mawwqKeP6TS
         nNXcQsL3/cJCenk58LQOyu8yTGwyg4Qaw6Adzb1IzWJtNLJi/Tph1Tq7gJp8ZrUyEOOu
         ZdRMmGneQXhBGFHKWvrkkFISFUzkgI/iOAc+wXeLl6WgKbOGzOF22ueQmcRlrnh+vsWR
         fiTQuHhC2m3wJRlTtRClYSTK8wbtU2Uz1fuiCAYbd5hL8ewiYUO9Jqk1wIICWg2I6AII
         21NzOb6PXPJHYTZDhhGXfdYYh5xRkLfEcuRZ8IqoBpS0S6tDv5696KVqtIQcqMIh5aoZ
         vgOA==
X-Forwarded-Encrypted: i=1; AKwUvBxWfxQ+LNNakIAESGvhIXgN+5VzynbyHYidaFCgaP/Z47ZEQoljcB4xq1a22zAxW+8fOqLFTbVIKAIcYbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeGMf3mnHAOvaV0ARnYEtdK0N70F8I3KT3MaubB8tU28l+IaBz
	P1vMqZ3Moq4hDYLHt4S0Gd+y2cyONFENVA78eXV7B2eF4MMxmbnug0s=
X-Gm-Gg: AYBFou1wGViFAPIiqpXHJvwfpMAy/LX3w9sxXHyJJjzhstJLaRVW/d1TsncqrAIEsZv
	D6DIbaq4/UcAHICpu3hsEU0j1ju8LgRDtQ2TNoSzze7y9RRdwh0QYvSZ+ws2dydtWzg8SbDjFRS
	GUTuEcKHLYaJfcaNoirfPS3vEYJ6935nQfnbfJQ6ga8tNkq0Y6TZsxlr84AhnqeDsP1sPVwY872
	3BKKnjoXU2V2nVPysv5h+3bX45bkKxIEeH5ewWSuo4eHIbhYzEqaGDWRyw/HAVmY3rZjcEHLbGy
	MSkG+KzqjjLUCyNKWZUOEo+xB6XJoil/EwMjaU2DBAACeBt2KouHzSM/DUTNIkcw6KgtNSqbP3x
	BytBhSc9eEupwaJCh44k748ElUXNi/3lekkGddTnvVeshsL+sAED0CSO9lju8LcX2bHwaXQF1PY
	NA9CmoeY6uaUJD8UuqazgYpqA/setYTvnSD2RGTFuwqxa0TZ00bTB43HO2cca18sa9DodN67obb
	UbpTuBbw1neleQIZ3fi9+dzQzcCoeRIQZLUGK9aP8GkU2QVw4uOtzy5Q3VW0Su4zpmylmHPuwji
	SoM8rzZ2+fQNUJcoF9D3L97Dnxe3
X-Received: by 2002:a05:6214:458b:b0:917:a1f9:252c with SMTP id 6a1803df08f44-917c018f4d7mr4051756d6.26.1790877309360;
        Thu, 01 Oct 2026 10:55:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: mhun512@gmail.com,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 2/2] media: venus: disable recovery work before HFI teardown
Date: Thu,  1 Oct 2026 13:55:02 -0400
Message-ID: <20261001175502.4045853-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175502.4045853-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
 <20261001175502.4045853-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7087af32060f..6e495bc04691 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0

