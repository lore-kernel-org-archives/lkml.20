Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509880;
	b=eHsJ4m6/lRGCY7C1FTy8huc2m3FTeCTBcqueBeB+yZc+CTB8oafByN5z2JB0WO3D4V67
	 r20jnWRfkMqjYKwx0b+PCj5lG6i7vxtMI0PMtr0UivOouV4HTzaEIzk4xISa2HUMr7QhD
	 b4gqkAMsmZYrJy1IO2OFI24UMPPuuYlsWxOM4/1ZDIqIyypamGdsF2Wlq8QHrUm/3XYvU
	 WoLvyRHO+xHcx1imvGGkFFZmM4OmfwpZkTuYYhB4YXqMvF5dOQxC+PvCgPXpdPwyh+D45
	 krKV2bWLEMWIfeK0QDjrPw9L0Aoz0NlSZXU7Te3jpHPAmMH+LZPmj5ZM+nrxwL1Ps/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FFKFYTGpTq110qX3OBusAjjcUsko+0b14MxACIod3aE=;
	b=SDEHlUhCJ6WdTYbg4htTswajXqFfHCnQhSpREaHNTYnumzXT/JJJD5pPgQl771FbuXtP
	 1e/ubDLdr6bdL5+8ZrnfLrihXRQWq3tfSHZWgUlQFu/IzzeeSvZxZWJQxtmgMhF1E9Val
	 ikntg5UlR0DrUBGIZTRyN2PkaKsaBD7AORnNjuKtbL4Y+y2HYF8sIX6ON1ujyZLQi6xLL
	 WQ3K2ULdpV0P+ZiT7WrL5vOtz+bJGwya6H1vekB4JVigKZvvskTUcYFXjuUu6dhkOMAHA
	 KldtCrZmPDYB07t68ImxMmGOLOklPyd6OX9G4Tni5W6xb23ofe8mnKw/anps/h8iabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VlqAK4+O;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4191606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4191606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VlqAK4+O
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so143162966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509878; x=1793114678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFKFYTGpTq110qX3OBusAjjcUsko+0b14MxACIod3aE=;
        b=VlqAK4+O4fAoKvoSRcPhhIDlfI6ZETlAY1GhZGMpDgijp3VIjQBeYdZuvyteCw8E4O
         853q8UMeEao9ukn5oQwcsp3eowxyyzyoErFlCdXzlxweUWWBDJxJgFT9id2as/FHfuPs
         /dqRQLeo/+nY7v0F1DW8Y2HJA8B81gjWdXN6TNBYQi4kVT8cYSGTddJok78G18DXME3i
         fMqXM0C9yFsx2O0PbdeNgsvtyqwJjvLLGmjMaDAzeYqJM2KvYWT4e2qEdzW8ZEXFOX7y
         hU5r5JUNqRH9lQT4pfeEfvZVVCYrDOd7vdrTNwL7bSRcwEVeTNtof7rzFxu/LfOxVLRQ
         8/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509878; x=1793114678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFKFYTGpTq110qX3OBusAjjcUsko+0b14MxACIod3aE=;
        b=Qn4TIPAOA4LwPgprJkKmrCwQvP3Gfyh3L4OVEvV/Eu+EqTV7ZFgrVosru6Dq6RczWb
         PRMoytkVACsTwGqFKR0WYgjh/9rFes9NK5So1oS68jMTBX8L7phJwjdmfCKc3Fs2NbKc
         jCXwRO3IrWxxjFmaf2n1yDBQPvcbqNhsDvrrLt+qApkr/Z1xeaCxkcdGv/CN63EilF8E
         faWYrRJEUNJY75mU397L7qMB5QHQG5MEJssFx7zUgNoM2JTYp1g5YeKf3NUSxqO2YW5F
         zCIGJCjY4OyTEgn+RAqK4CXMFePliOPFGbyPUIHnr96d4W2FN3Dphi9DkR2p11FiHmzk
         41Sg==
X-Forwarded-Encrypted: i=1; AKwUvBz+trlLRLXT4hXXwer8ssoGdxrD12LbLWxEYehvL3JXpcxUHVGUrMRAKVjoP5B2tLl3K5exvFlEXLsbKBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs6E8uv+XAgEeOPO16ABI/GHH5Av4zOyWXUggXlTTBx8T7TqCg
	RVDl+mzICMCG6zRBp1LCt3Q2UxQVH77uaPuFk669r0gkYzmn5mZGLkFI
X-Gm-Gg: AYBFou2vEfPJiy6RlR65z6rT7it10M0f3EEEQqM3lNjW2Ioa29isUxGU4XXGsO6yc+v
	jqKm4hdTt9alAX3tbnXaTCT1Uy1QV+x8oiOJlKyvZj5881iWXUyBKGRrlIXCjpUhBAiVJQgY59w
	3PBkzlsxciQ0QEXXWCcO1AoBkizEpgnmr/9tfEVQfbPxKYczvRYtPXkaSzYvtWuERhwGiDuazBE
	8qGhb4Pw0BGn65d2HCKhL7jaGz/2xmx97hvWjoM8B4dL3mf+awh5ZTQUMdef9F44i0lXOMsM5cI
	uZIjtwazTxT5djzfxLF+gE3LIVcsLJCoguPxL8EgjB9/sdnJvWCeTtZs1H8QvSQ2Q5XqqDKdJBQ
	dqHHtuI2eLCdhvqs/yheS/sfq2rxyaov6cfREgrHFkVqaGi1lVyE60E0JpHqFq/GRX0YerctYIO
	Km1UYhWvKWVgRXy/hH8NIAKmJRc6pPHGywvoKx0QxmIMcerPx9EWuf797rbgReQecr7J7satckc
	ia1HvkjLYxlpLOgsKS7b9knDeMwi3wwa/v+/xMe0yLYu31i9b1MsDhIQGgXiu6w7y5AacMRuRA3
	CsMcz2T9zdPADtl7Mf9lOZ8dnUIHEVOMuQ==
X-Received: by 2002:a17:907:60d6:b0:c2e:616b:6763 with SMTP id a640c23a62f3a-c4600c87ff6mr231572266b.3.1792509877921;
        Tue, 20 Oct 2026 08:24:37 -0700 (PDT)
Received: from Martyna-s-A34.localdomain (ip-80-113-116-3.ip.prioritytelecom.net. [80.113.116.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bcfc5sm488110466b.59.2026.10.20.08.24.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 08:24:37 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mehmet Fide <mehmet.fide@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath9k: don't read past short WMI command responses
Date: Tue, 20 Oct 2026 17:24:11 +0200
Message-ID: <20261020152412.95560-2-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020152412.95560-1-mike.michalo@gmail.com>
References: <20261020152412.95560-1-mike.michalo@gmail.com>
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

ath9k_wmi_rsp_callback() copies cmd_rsp_len bytes from the response
without checking how many bytes the device sent. A short or empty
response makes it copy stale bytes from the uninitialised USB REG_IN
buffer into the caller's buffer, e.g. into the value returned by
ath9k_regread().

Commit 93ce8ea70451 ("wifi: ath9k: reject short WMI command responses")
failed such responses with -EMSGSIZE, but AR9271 firmware answers
commands that return nothing with an empty response, so that broke
normal operation and was reverted by commit 90201351a862 ("wifi: atk9k:
Revert "wifi: ath9k: reject short WMI command responses"").

Copy only the bytes that were received and zero the rest of the
caller's buffer instead. Empty responses keep completing successfully,
and callers no longer see bytes the device never sent.

Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 drivers/net/wireless/ath/ath9k/wmi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index 44e91815a1..76c8dfcc53 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -204,10 +204,20 @@ void ath9k_fatal_work(struct work_struct *work)
 
 static void ath9k_wmi_rsp_callback(struct wmi *wmi, struct sk_buff *skb)
 {
+	u32 len;
+
 	skb_pull(skb, sizeof(struct wmi_cmd_hdr));
 
-	if (wmi->cmd_rsp_buf != NULL && wmi->cmd_rsp_len != 0)
-		memcpy(wmi->cmd_rsp_buf, skb->data, wmi->cmd_rsp_len);
+	if (wmi->cmd_rsp_buf != NULL && wmi->cmd_rsp_len != 0) {
+		/*
+		 * The firmware may send a shorter (even empty) response than
+		 * the caller's buffer, e.g. for commands that return nothing.
+		 * Copy only what was received and zero the rest.
+		 */
+		len = min(skb->len, wmi->cmd_rsp_len);
+		memcpy(wmi->cmd_rsp_buf, skb->data, len);
+		memset(wmi->cmd_rsp_buf + len, 0, wmi->cmd_rsp_len - len);
+	}
 
 	complete(&wmi->cmd_wait);
 }
-- 
2.43.0

