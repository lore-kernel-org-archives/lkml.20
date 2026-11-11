Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371175;
	b=0Y/cjty97ZjCelskmkFEujcPTbw+hBX0VduI2Eb6iB9abZ2hJoN8W7iyEWWYPdc5j+Ol
	 VlgSWoJAU8wcGXVWO0qYLKREGniIIhQi0yeKzcgJQikZ4l2CABCLEQ6wnU1y0Jc80b+fS
	 3nurP4glT2AHERFm5wiVvOpHDdEdUo/2OaNH/g5V6q54P770m0aDvUmWxkiHUPLhh+Dvx
	 u2dVYBkQaNYB8MgQ3R/BbGtDlePC+yb2gFt+nKIp2M71LBjGKY/v5cwoojuDdZFEmkNWQ
	 lrZBNLnVU6fewp68RC83dxmq7oJSB3NjqqbPv8MLRt7YoZMo3YLtV1iXDidAixgJR0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
	b=QeZCd8ochROoEaFAmHmSmiMS2z8vmRIF41SRpzuKP70z69gTKltpQIp7WD42zbw0GTpl
	 hUqcYpOL7XJwK+GW9x3DcoOi1s0UaBHRGs584meWAIvgKJopIe08QJvoAOX5Qpr6aLojk
	 2p7kVI448MM0jxVRbV8R330epAx+zvqGfm6G4orOuG5F2tw9uHonShh6IrNfZ9Rhqtf9R
	 wboOn34aSlixasgPRbI+ekq/sFhr5Uyjk2tKX4PgcXOXAddrx5aUeP1UmjLWuM+dTRgFW
	 DpZcRPD03vou0EgR/lXFSc0ref0nvK5fvY4AjcMmPIKoEQvOuXZgXHlSaXNfouutD7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be7IxUIO;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AE260A260F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AE260A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Be7IxUIO
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1570763a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371174; x=1794975974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
        b=Be7IxUIOwCtNlM4TvJ6SDhyoy8xUr/Qt+/vRN4RxU9t5865ONBmWcRDs43/OaovLbo
         fnyp3WZ4hG9Rk9ze8KhEjrJW0YHtl16HoOAn71N4zPSgk2Pxi+nhiAYfizgxNvibfLuT
         xzq9e62b4phF+XDx8ZdVuoDnM8Ijhrguut6hYc9Pf864RJ2BVWX7RYBnRE3Td00wPgyZ
         jNR7slRnKbOEcOL0+XEh971XVbcxU3sMCVv7uRGX8HVkDWNeRie1M0LSe1V60dJLg0A1
         ZbqbtlgLpxlMdsQjqfzvp3UiX6FhVNQXbvEcUHHjqdSHTnd3ZnrTcY6y9DAZU+IGW12x
         hmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371174; x=1794975974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
        b=XidxY9DAngIhLe6nUXRlvAMnq4+UkEr+LBv9MlVe9pqheVy8ntrm/n/XVFcNg7N7Lh
         Zy5DjkgtnVsYHfVGaljkUrXumaYlkuo3NLiWBdVMiYIiZl0sR7AfyXmS0Eivhndx9ELl
         Oi5G1d/7THymEWvwQ6tm4IT40weWNeEe14utX7kG4h+a9jt9wtUhqtDKHtVPYi7VCm2a
         2LLPThbnxT0q55EB0ET7O7tlUTKc7P1AKrLz1/AE/r5k/K2ExfiARCXj2nvuOl/Rk6Wi
         I9Ssw2/9b4KQyM1ObXjIqptpJYaA6NaVHLbozO7OzzhXTG8fdWW7m+OnJNm1FLLiCmEu
         5nQA==
X-Forwarded-Encrypted: i=1; AL+hErHe+VNzRkmy4c9PtVubk5CpSaRSDmLXJ1b1jvibygWi4k+X22a2DQ8UkfS9C2zqaMsWrXE1v0DkrBBz5fQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MICPlN0gQQgYajPaS7V5KOXw9sE9JQ08YgucCtnL39zR5QSur
	ibVWywU3GpF0oIoHCAg+wnGlDdk/+gCh1AJcm9p7KK4Jz/yarOFzjTRro4m+ophR
X-Gm-Gg: AYBFou1sfOky3W3NC0j70/Dhp5zce6XPh4k7scaHmF6I2w9pEhkqO/RNcttHPspfkmc
	VFmLnmVe10bPm+/TBpKxV97mqbZzwRdE0Hy5WWp3MtlMS4Kjw6VfQ7ihvI2KZiAKoSnqAmNpk4H
	k77JMDH2gjJg0xSxVFRPFoVMtI7mzIcGIKchPkUN0fLtGQig1UIoV9et/ZdJf93Vrk59bgPA5DY
	tirBq+jJqZrGxl0kO0OZqM52m5HPKSxr/bCkCJV+NvQ0Q0BK7E2bywNxslceVgr9I8vSmiVQ2Ii
	ZO4b3rEEjCMFHEoX9/NvY24ru+XTmKJmyEEuCF8vTsA1lKmJDeRxU7+1xJsrYTjMz6BOU6co4dA
	lhifFr4TXQ8V+x6ttdVC3SwIXDcQBqeTBVYBHwg5HCc+60oKvLEgQrft75SFh5IAUVNLSqJ5LTD
	tiufM0xktQiiWdzlT7Z/3ROgF4g7GWyM5TlTA0OEMyXblSPoFPshjXdJCBpdr07jrm7vzRvz1ol
	OJxaGJ1v+zdvksZcxLOgVTGTU3RDJu8vdzXrSKrBtxpHVvHCbu/7BI6mjDmGIQsaGELGAvSb7Hl
	0KO3RtZIHmL/gGGzS45ZrPqXOcl2J0H3L3TQ7OX4/u+/1oMKSAJlSF6PUxgbO1h+gPsCAepEswS
	He68scIUOwIC1ZF+eIoY4CpxPQ+8DsFbPxMUDKhFaM62GBGFEszppR2ZfXMtk9avLr0JKO9OXHR
	/n1A==
X-Received: by 2002:a17:90b:3c44:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b182efb65bmr1197810a91.21.1794371174078;
        Tue, 10 Nov 2026 20:26:14 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 10 Nov 2026 20:25:49 -0800
Message-ID: <20261111042554.232998-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111042554.232998-1-rosenp@gmail.com>
References: <20261111042554.232998-1-rosenp@gmail.com>
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

Replace the separately allocated module callback array with a
directly embedded fixed-size array in struct brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 --------
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 3834f2da5aa7..ed022fd2613e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->modulecb);
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
@@ -464,13 +463,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->modulecb =
-		kzalloc_objs(struct modulecb, BRCMS_MAXMODULES, GFP_ATOMIC);
-	if (wlc->modulecb == NULL) {
-		*err = 1009;
-		goto fail;
-	}
-
 	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
 	if (wlc->default_bss == NULL) {
 		*err = 1010;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 425c867964e9..8af883e40876 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -517,7 +517,7 @@ struct brcms_c_info {
 
 	struct brcms_bss_cfg *bsscfg;
 
-	struct modulecb *modulecb;
+	struct modulecb modulecb[BRCMS_MAXMODULES];
 
 	u8 mimoft;
 	s8 cck_40txbw;
-- 
2.56.0

