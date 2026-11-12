Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481288;
	b=MTgA1PKzYJbshXhvMPLA5I433HgUUpGmhURY/iGO+XFlVFqKCcokyCF9K2Srj/Prmi3a
	 t0ctQQSoxlSu6KU0ak1W50OxiGZFEMD7iTe6pU8S7Kh7RrMTvx7IePEJgCd/Pj0QuP4He
	 CFTALDumoi016sFh0qRMaB/y3H+LrRcCGt0oZTLeNFe/7NOm3nvdip0xy7900mjpy37JY
	 gofMFaE5blJGAJbDsIWw6fg7cK9v1c/uU9+WHodyiGmwhlI5JSiOGj+gVC9rdLLrEr6ya
	 3uj20P64niFB0nJeQ10Bkc9mgRR5jwsVjDOAMnrpVOhtxbzkIGs2sFUz3Q1hTK/2A3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
	b=4TxhN/hE/8/gpilPLGL9gjpKlmuTkMK7WsrpSm7+ECoXep61v8YxRXLFuVjUdlsE2oWe
	 d/oRmrMkFx7GLlleypsp0GM/+imSU7EBBYCS9N6eezOt5PhjPhcNQoJyp+E60/iw0XfwN
	 ZkNUp8o914eXX6X7Y/PjS7kmKicl4sQ6VegOqF3F/j/SKCzXl2PWqcPk2x6+BewNSgSt1
	 c+2xc39PbvlbqDUHjxLToJfLijzN7dUAR0+KOK/9z2XplsnaMz/kVrKXqRHKFrrIDZ+mI
	 WbHqiCCLcxvHYq6n4zZvkcIxSZ6ldKhj4FE4z5vhk0+fXajPWOR9JWActj0eR9yetCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nao+oSKD;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BD6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nao+oSKD
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so41053595e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481286; x=1795086086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
        b=Nao+oSKDv4eVOjcowbDzZDBW54xMogqN84QOYYLSuvIHO7jw99hIzeybnZENMt3amq
         taJANTQ7tudipdYp9f+7JUfWdxkfqPvDhcJ3RnZSe/nSQ8y8WkEKFON4SAgXOQ+lgp6j
         4GF7Pmcj4xmF6CezGdvYSU/rk3QA/OZJuyXobNPL1gPZK6+cdiiPsPjtJV0BQYXZ8NS7
         JAthdlWewyQpTvcHrSfOHGdi/4Ib0vXu6iKt7AB+FlAdxp7uzCGHl14A0nue0XdjuJ9N
         GEPa4FLD/idzzt0O3CLJRHKA/TvdGUMiH0HmLTGf8pBAzSXUR+417CAJM6k49YDPwfbg
         C1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481286; x=1795086086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
        b=R8EdLtocXhZdAYxld6RL7dCneGhtQV0nIYD/DVpB52YBNeDkO7det6EiSLcKU4tRRd
         sdmPiH//MApGF5Fq56pBF8HpYddXUK7/c72aBvWTmmkfgRi7DsTblzyxRvgjK5B1MMGc
         NaDiIbCy5UZW496+A/GXK05sXzqpQ5Iwh0tnESXvFe0vBD3Fzn28z/qO7nBZZuyR8euW
         u0jv4Vya7Yu73SDGq7rc45ZkxFsvHTAWyEh0gHCfWWAexZU9g3nGWS5uUoQiCaFxz9DN
         5nOmIGZh8mHLxgq7yMr+kDJ0onhjXoKEX8JfzYI1jG766uFsWBxKcWE1T2Dn18mBPI4Q
         fHVw==
X-Forwarded-Encrypted: i=1; AL+hErFMbLwZK+W3FJgBv5TCfsG3dI0kuE2QHZiRbffv8n36xBqUXKoskUGq4USNN0VJ8IrexgHAaKgHpnkdg74=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BG9ckv1G8da5kGY4Zrvd9m9U8bZZ4DSVVlj3hJ9LCRbx0BzY0
	Yns31FhpP86EjDRDmllQzTa5z1wBhHrzefYA6/BeCWn5TUgpgGiydja30b9u3vn5
X-Gm-Gg: AYBFou3tJSS79gD6MUcjR+9+1+GL6/PrpR0f/5eNYM7q0OtCngXPSwqkfyEMOtCNh4/
	efYs8tY8BiCF8OgDwgJqvjA70eSF0e3NMtBVdRyUk+gqPMDppz+0zZkq19toq5y8Uka4HK+ujuP
	sVgw0bhrcz9cPzeBuJsBk33TFX7mAQVXhsVq2QXNxZfEoCu3r3fhfE0ipar6l9E20EuiTS640Ks
	A7EgPwBAW6pvESJOOZZKO5S6ehiXqotMCMpj3H6LBD6zciRIygAkQ4XHa/5N9G5ixPY3CMbbi5K
	j939ZMu1Da1vr8F80HE3lyuv+LRsRLzLb2lN352jjKEEsLlt+/mHvWeuFI1ZLYAfy63F235iD7u
	tqPKqs4zwoiUwrasrOjIOWgpQ7pcg6U6HaWzeGu9asi/FvL+KLbUaysP6+kmRIHF06eSVJtlg/2
	JoHDFZzQqK+DC90/meIJnLMCK3as5hZBDy1IvZlcgfh+YFOZcqGkLk7nhzHR0vilAftWG8GvgNG
	F5ntyn/wk85eYgkm1f7pvoo3rW8H4uLChyGD+jk5Q5LAm4pENUT/BeNGsPcCdlo9A9P40SSGnzx
	jl6cjlMPJINgS+R4AUFM0SXllPVA8C/0YedHHeDZ8yt9ALIE40MA3KGVbxffB2t/sY4azLc/2wi
	Mnw==
X-Received: by 2002:a05:600d:82e4:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ba093cd6d3mr118257905e9.31.1794481286017;
        Thu, 12 Nov 2026 03:01:26 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm58546125e9.14.2026.11.12.03.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:01:25 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] wifi: ath12k: do not wait in resume for a reset that cannot finish there
Date: Thu, 12 Nov 2026 13:00:06 +0200
Message-ID: <20261112110008.1229-3-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
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

ath12k_core_resume() waits up to 20 s for restart_completed. When the
firmware crashes during the cold boot started by
ath12k_core_resume_early(), ath12k_core_reset() powers MHI down, which
destroys the MHI channel devices, and up again. The driver core does
not probe the new devices before the system resume is over
(device_block_probing()), so QMI cannot come up and the restart cannot
complete while ath12k_core_resume() is waiting for it:

  mhi mhi0: Wait for device to enter SBL or Mission mode
  ath12k_wifi7_pci 0000:01:00.0: timeout while waiting for restart complete
  ath12k_wifi7_pci 0000:01:00.0: failed to resume core: -110
  ath12k_wifi7_pci 0000:01:00.0: PM: dpm_run_callback(): pci_pm_resume returns -110
  PM: suspend exit
  ath12k_wifi7_pci 0000:01:00.0: fw_version 0x10097fff ...

The resume takes 20 s longer and fails.

Let ath12k_core_resume() go on as soon as a reset starts during the
resume. The restart then completes after the resume, as it does for a
crash at any other time.

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 6 ++++++
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 42a9cd28c652..b1d1247a0dc6 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -224,6 +224,7 @@ int ath12k_core_resume_early(struct ath12k_base *ab)
 		return ret;
 
 	reinit_completion(&ab->restart_completed);
+	WRITE_ONCE(ab->resuming, true);
 	ret = ath12k_hif_power_up(ab);
 	if (ret)
 		ath12k_warn(ab, "failed to power up hif during resume: %d\n", ret);
@@ -243,6 +244,7 @@ int ath12k_core_resume(struct ath12k_base *ab)
 
 	time_left = wait_for_completion_timeout(&ab->restart_completed,
 						ATH12K_RESET_TIMEOUT_HZ);
+	WRITE_ONCE(ab->resuming, false);
 	if (time_left == 0) {
 		ath12k_warn(ab, "timeout while waiting for restart complete");
 		return -ETIMEDOUT;
@@ -1727,6 +1729,10 @@ static void ath12k_core_reset(struct work_struct *work)
 	int reset_count, fail_cont_count, i;
 	long time_left;
 
+	/* The new MHI devices are probed only after the system resume */
+	if (READ_ONCE(ab->resuming))
+		complete(&ab->restart_completed);
+
 	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
 		ath12k_warn(ab, "ignore reset dev flags 0x%lx\n", ab->dev_flags);
 		return;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..2d8d91afb66f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1072,6 +1072,7 @@ struct ath12k_base {
 	atomic_t reset_count;
 	atomic_t recovery_count;
 	bool is_reset;
+	bool resuming;
 	struct completion reset_complete;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
-- 
2.43.0

