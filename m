Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E83515D6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982263; cv=none; b=XdLcUtWxedFS4qa4D/+0FdApssk/ck4BK4bZ1fsgN8FR9L6g3MkvaSfYKxqpz8n0r6ZdIp+KF7fdSjCfnFx0xNQUNZPRFjJ3QLi9GC0sPVUSi7wG/RxaKPjs2VeqUFWTRJACGrmRUkeskOykgtLvC5W6vLjxEqjYNs3u205sjos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982263; c=relaxed/simple;
	bh=dxgTuRXIg9MafPzhR81UeFG4+538SkbvTi0siu7dZuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKbWkdw/lTGTqL/9L7AzYNP9vbC8rlrBs34MdoaOmFh2FVm+J3H5RMYOZaorRZFTDHd6MzV76smWaTnavybgQs8wkqjAx+efKlLaXnRjtpPhPz6fQhNcS3N7+2ypwHa0W2xnuAp7vDToHwnFFQC/jotijuJzh32HeY8cHMnabRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=funJHjIM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="funJHjIM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so2039038e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982260; x=1788587060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UMmi9ENN2WjM1s9qjAy3S5/7V0uR4HETS3+LJLK/gWM=;
        b=funJHjIMlCps+wbJhrWDxzMm+mfvGAMqqON5iPV/kwemYytQ1L02+yFh5IvrKahdBX
         QKw6w+7dB7WXPqiHA+9nQUXv6ar0IfJZrMbBobyCquYIohZWv9x/fbcngh7jqp3UmuXi
         n0YrYH1SLCSzf0vQMPX7za+XyCocjeJ+wrIgtZiyzOiSCKYe+8vCtY+JHbaTVcB6bRud
         eK1kXSZ33xVeMQrlIqGWrwVl7g2MfixFc/3E9vikvdJJnyT80RrM9gI4r3cOYdJxOdET
         kkEMEmJmfphFlJOS6BRo4gNmP5PPyI1lODqf2dHQOOPxg1LvRo8hcrdsluM6KSOPmf0R
         99vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982260; x=1788587060;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMmi9ENN2WjM1s9qjAy3S5/7V0uR4HETS3+LJLK/gWM=;
        b=r/3X70G8Rcdt1iHCiPgjhOghlSPyRefIFuzURuDn0wX/6lXhko7HqX7bTPux8MqkVA
         4qCvGQNq5/xXIHIorKw7mI+Hf7lmPGk56O39H9UHXQDJgY4q42toLn/eauRpA1zT+VaB
         7HhafagtGJE3hjw00DZGbsN6m9/eUu/rrzbOVDJbdUGvYYRmec/8a8QIEMKdt562GItg
         72/z7BPccVwY1ed1ANGECAn54xSJF60VtMkjxZ+xOOnfMY0PveV2VHE/sD33WbBZ+HnR
         NwVoeQpp20BU7PXHG4Ikf4w3TPb0d0VYAR9jc99RC0SyclXYrCcUwnNT4NETUzHvqJSA
         rVZw==
X-Gm-Message-State: AFuF++lJNirwBrtmIYpxo+fjshRD/92ZWDSgA63Ecunf3coDhRwecdX1
	lgteEx4ZQCQXyWKDqvYNZhIQmbu3mSKatqTv//xb7XgFqsVDe+h/YJE=
X-Gm-Gg: AYBFou2x8zwvjXVRFh2lXaLHBgGqv45JvAiaifjduTKQifo8hHb0gCcjtlWGZ4Vql+g
	xAKB1gaJGf/gTl3BQWaM8e5/MfKi/nlmwmd6CNdMHowHBw3sF+UxoujXTgQEViI8L3rBRJE02so
	hvgywt9LFOIR6Wj05XeVmcoAjDH8xk2E60cRyUN1qP5cU7ohjQvqW5rMbMPWr9anRBS8K8fzl7S
	8t9QjLARdPeVPr2AU7mi9r+gpB3IwCkddSOIPjRGGOpzD+GObyscjnz46d5HA+E0HFUbqkhA4Pz
	qOiqpBXmTxnNs2AOnGmmQ1LjXfsfDYJMU44NjlGRrFM7NAomqtVCfvYR1B8f3MS4dPO0OB5QAS1
	iCJjYqmcmehOq1fkeh5YD6fipjlpj+aS4u8YQ1TE/8aTMhjXR5nuYdu+ZbyZTWhsNW51J+sGO/B
	6gf2JHUsOMwTDn6rSLj5FBAhoHMqtSEPTDK6CtFwbznHUi2DqeGkMo/+1P60KzNewN7IuHoaNVv
	+0EsbsnxvqT0Rf3l0zEeHYbQZwFXdWYx1SbTDL3YfkCeFQUV02XgT5pa+9yeEfA+V9je7vHHziQ
	AVOSvWbxU/n7Sjg=
X-Received: by 2002:a05:6512:33d5:b0:5ae:b5d7:7844 with SMTP id 2adb3069b0e04-5b5edba6aa3mr1113551e87.5.1787982259829;
        Fri, 28 Aug 2026 22:44:19 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b86sm803040e87.12.2026.08.28.22.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:44:18 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] wifi: ath9k: batch the read-modify-writes of a channel change
Date: Sat, 29 Aug 2026 08:44:00 +0300
Message-ID: <20260829054401.1198574-4-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829054401.1198574-1-nerijus.bendziunas@gmail.com>
References: <20260829054401.1198574-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ar5008_hw_set_delta_slope() and ath9k_hw_start_nfcal() both issue a run
of read-modify-writes with nothing between them that reads a register
back. Both run on every channel change, and on the USB devices each
REG_RMW is its own WMI command.

Wrap the two runs in the RMW buffer so the transport sends each as a
single command. PCI does not install the buffer callbacks, so
ENABLE_REG_RMW_BUFFER() and REG_RMW_BUFFER_FLUSH() are empty there and
the writes are issued exactly as before.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/ar5008_phy.c | 2 ++
 drivers/net/wireless/ath/ath9k/calib.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/ar5008_phy.c b/drivers/net/wireless/ath/ath9k/ar5008_phy.c
index 7a45f5f62826..af05dcf95a61 100644
--- a/drivers/net/wireless/ath/ath9k/ar5008_phy.c
+++ b/drivers/net/wireless/ath/ath9k/ar5008_phy.c
@@ -868,6 +868,7 @@ static void ar5008_hw_set_delta_slope(struct ath_hw *ah,
 	ath9k_hw_get_delta_slope_vals(ah, coef_scaled, &ds_coef_man,
 				      &ds_coef_exp);
 
+	ENABLE_REG_RMW_BUFFER(ah);
 	REG_RMW_FIELD(ah, AR_PHY_TIMING3,
 		      AR_PHY_TIMING3_DSC_MAN, ds_coef_man);
 	REG_RMW_FIELD(ah, AR_PHY_TIMING3,
@@ -882,6 +883,7 @@ static void ar5008_hw_set_delta_slope(struct ath_hw *ah,
 		      AR_PHY_HALFGI_DSC_MAN, ds_coef_man);
 	REG_RMW_FIELD(ah, AR_PHY_HALFGI,
 		      AR_PHY_HALFGI_DSC_EXP, ds_coef_exp);
+	REG_RMW_BUFFER_FLUSH(ah);
 }
 
 static bool ar5008_hw_rfbus_req(struct ath_hw *ah)
diff --git a/drivers/net/wireless/ath/ath9k/calib.c b/drivers/net/wireless/ath/ath9k/calib.c
index b4ab85bd7895..73c63ab32d53 100644
--- a/drivers/net/wireless/ath/ath9k/calib.c
+++ b/drivers/net/wireless/ath/ath9k/calib.c
@@ -224,6 +224,7 @@ void ath9k_hw_start_nfcal(struct ath_hw *ah, bool update)
 	if (ah->caldata)
 		set_bit(NFCAL_PENDING, &ah->caldata->cal_flags);
 
+	ENABLE_REG_RMW_BUFFER(ah);
 	REG_SET_BIT(ah, AR_PHY_AGC_CONTROL(ah),
 		    AR_PHY_AGC_CONTROL_ENABLE_NF);
 
@@ -235,6 +236,7 @@ void ath9k_hw_start_nfcal(struct ath_hw *ah, bool update)
 		    AR_PHY_AGC_CONTROL_NO_UPDATE_NF);
 
 	REG_SET_BIT(ah, AR_PHY_AGC_CONTROL(ah), AR_PHY_AGC_CONTROL_NF);
+	REG_RMW_BUFFER_FLUSH(ah);
 }
 
 int ath9k_hw_loadnf(struct ath_hw *ah, struct ath9k_channel *chan)
-- 
2.55.0

