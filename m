Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04337F303
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933696; cv=none; b=eF1eOmjVmSYw5H0KlOM9EyU0NxUkOWPvIXqc+dpJIzaLUmol/gj5nFHXiEJNG6iM28nC1f/XfD2KoxP8bYFm8Prb3um+QU/YrwrZCne1GxrzHB8xsrCwPfr+s0VvZ5Pb0ptIqt2fBjm7YQkDpZaYzdiPotocE4Mi6eEJlbZxrMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933696; c=relaxed/simple;
	bh=d9mdZdI8mE+Rq+cniY8y+BlJXYiRYQNFyxTIXRZPaHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pz61dw7tcz+SzufnV4mEgfq2AhZYpXIwW1btgi71UR1bHH2XCWacFZGU0rXPsJlxAveTtBb7ewC3rxxE081IuEFi6lhyivbekGiw6SvYJhlfme1qkNz3wVTm5rF8sUZHfNSa9BVu/m2V0UnJT0rb6ZjhVOuBWF8Y6OI5Cx6VhEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnOQJ0YU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnOQJ0YU"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so1863830a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933693; x=1788538493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ga8LNRiX5i3NUDso3oFwMVOMM4tp2kZF02NR17rC2nY=;
        b=FnOQJ0YU82Q5xX6Cii+PHJGBnkCyvv9V+tzS4W0miQ7Ty7y5KDVgyCVL/HWUWKFa8H
         nsVWpRssu0w6TPpaRPKSPFMoky5kbNxm/r9VLbRWFVkNw36FiALqXFWrh+I4bTwC2G45
         4Vt3dqZH3W5tDuWJ+cE2sdeTd/No8hvurovZn8fMHqXrmkFwtFqiR5F7Nb+gGifx6Dvu
         A85gYbTfxIzfModvU8hM64UaFoJp/6xxa4jdFI+0ByFu44C34n5bxrdsh+JQliLJxcwO
         6JIOD3+DoArsEkSB0p/9XunGlXJnjYR+6Z5956amLSlSJtjkg+IJdsYTrvtfBA97I1nq
         a7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933693; x=1788538493;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ga8LNRiX5i3NUDso3oFwMVOMM4tp2kZF02NR17rC2nY=;
        b=iBw3jG8DpGqWKWgg6C/+n+oiZeO++CCdsk+LWgF3oQYT/kBKsVfp43sELgsvzRNt5L
         8DzbHmH78oCaMQhVx7TSjsynlxX8kwRGZmtwVnS+AbOQt33fZAK/d43VClLXC/1IAlxD
         TucDYahQrTwL8vgv7UH6eiiXHNu13eICg8WMgLLIxCYdj1oCZciCeARMuF3X/W2+ct0G
         86cOoll4Dwp4UQlBhdLX3r07dnuhPUuaokhmp4cMjaAxWtDR+1fxt1m3Gy1p3vwmq8yY
         Kr+EQzTE7Gcy3QbeLCd84adwuXFweVegdw+psKfbwGGWuoeAvgFZAMWLmC76YoFkS+5x
         Vj6w==
X-Forwarded-Encrypted: i=1; AHgh+RoN3IaMPEvk5dQiTRint3Hlzm8NDZ34YHmVTqxxuvdCmmDXa5wreIEV5BFtnVVV2KpWAw+Q6+0sIUib9AM=@vger.kernel.org
X-Gm-Message-State: AFuF++khX06SnnunAnLJYgDNcUOJwZzQQH8TMOuOOpBHToeKus6PT4NJ
	GMY0yr13VWUTj/gqdkfysd1mjWanZQOb6aOeMQkuLduBH7XJX7bdl714VR2B
X-Gm-Gg: AR+sD11kmXDAmFSBPXNJ0FdC/s6zqEj4tG3jeu8NfGhPjlSHNSBRwjIDYbADlhwH63L
	MuPHiY4Eq5E4kLC0JdUrhks/xHrIBQ8Zsgs2AJ29OrWD6qCyFK86rmwLWkHeJfGxIbssYyN/7Vr
	tS5tu7yruY8VSpTTfMiV49EFjvEY1mvBydDxyq8Wwix9zC5VUN6Ssn0mqR8hgMmNVxY1WwcNGYR
	fBkMfvZ98kIgmeilnLlQAD9GBcMEj+Cnm606mhrt+shRXhuRV6mZpp/Fasw/gDk7g0U2Gj4ksqD
	Sta4dXKEhUBFiazm+oOen/1WJNI8lrxtEE2FxF6ZF1NkZAiOjIYfU6kw63SP37NydJ0MpLN/rEa
	ivkbS32W0HuyjKarSK26+NdvqnxIkSr10eKjgcLsAIqqG5kY3rd1dgYLKpBkmwtstE6+2/Bnw7a
	rCcFO7fy6ZRbn9FU0pNewbWwTf5kVkIW8MtETwhHfJSD+c9sDC9zzOSqmbLCzISBk2ejw6A15u+
	7H2lieZxQuTAYAU8mQagg8UIcW/0K52xEVhHxMOZussnj6C5sGrjtRCBNL6eup2ek3YY6jgp0PX
	EBM/
X-Received: by 2002:a05:6402:c285:b0:6a5:c47e:8d6d with SMTP id 4fb4d7f45d1cf-6a5f4fef749mr7587362a12.9.1787933692579;
        Fri, 28 Aug 2026 09:14:52 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c572sm667210a12.4.2026.08.28.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:14:51 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Oleksij Rempel <linux@rempel-privat.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
Date: Fri, 28 Aug 2026 19:14:07 +0300
Message-ID: <20260828161407.1030798-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_reg_rmw_buffer() sizes the WMI command with struct register_write
when it sends a buffer that has filled up, but the buffer holds struct
register_rmw entries, which are 12 bytes rather than 8. The firmware is
handed 120 bytes instead of 180 and applies only the first ten of the
fifteen queued read-modify-writes, silently dropping the rest.
ath9k_reg_rmw_flush() right below it already uses the correct type.

No caller is known to queue the full fifteen entries today, the closest
being ath9k_hw_4k_set_gain() at fourteen, so this is a latent bug rather
than an observed failure.

Fixes: 8badb50cfab6 ("ath9k_htc: add new WMI_REG_RMW_CMDID command")
Cc: stable@vger.kernel.org
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 6de78ae85726..0b49d2cc99f0 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -405,7 +405,7 @@ static void ath9k_reg_rmw_buffer(void *hw_priv,
 	if (priv->wmi->multi_rmw_idx == MAX_RMW_CMD_NUMBER) {
 		r = ath9k_wmi_cmd(priv->wmi, WMI_REG_RMW_CMDID,
 			  (u8 *) &priv->wmi->multi_rmw,
-			  sizeof(struct register_write) * priv->wmi->multi_rmw_idx,
+			  sizeof(struct register_rmw) * priv->wmi->multi_rmw_idx,
 			  (u8 *) &rsp_status, sizeof(rsp_status),
 			  100);
 		if (unlikely(r)) {
-- 
2.55.0

