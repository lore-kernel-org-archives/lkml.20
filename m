Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347791;
	b=SuiC961E3NmYRURiUun6cDJUNrc43Aro5Opqf+focm4SOb28FfFcozRdQhAQTQnA45PC
	 So3PFTvW0IGmfEptfv0siIG2Y45iUogyieHYodpoyijPNnbA62PGwqZUu59jJdUh9kM35
	 nOoDllHWLRVGl86o7odC8lXmNVqZDkZPYjA0muRno3jn/P6jvPYirNLo62yYDznurp4BG
	 lE+qh0hEgA1pP0AhZDMiG9vvcjqQKvEd1uVm/gGbdgFbGaJJAe5ug7eGmk0PJBcGEiD+7
	 9AFMIXgKWUrQFHn30tWA4CvRtQlt30yonOCudxJrg1r6Vy/YtCRedK4RSvkSqm3N/Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
	b=37LnXVlI+VUvVGrLsfr8ARJQ3pfLliyhWvW0C+KzVz7t8Sy13V7sPKtC93xlrlAnVhUb
	 mQm1z/+aJD9ngjWyEP9e/8/ZuOPURx8wkxCCOKYlRUJWDpM8tA5G2ILVQ1atjTe+f8/nm
	 zETY2nAyRLBy18l00gx8vSHUGaNQIs2Zrpb1xGm4KzyhZbK6cuJ19g+BA/OTWqcSgjP/3
	 8OSVwEg4nIbPF4G7E7m1T0qppE1NSI/2ZEtRuoW0LZGgInDDISVwbAQ+JSZ3gc3m7AQ7f
	 O4VyOrBLR0TTJxKGTujEbu9T4iR/vXpr3f1+O+Cd7+P8hBhtqojbNDWrWUCblNiVuTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lo3MmjzD;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37677606C994
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37677606C994
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lo3MmjzD
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-497614c95f0so1361259f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347788; x=1794952588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
        b=Lo3MmjzD66xIMCjGFcAGJ5+d8S2RjC3BmJp5rNdyYHSxnlCbGgcHfa2ALiNjxfGiei
         oR0U/eXV+jZXK+8lACQiknvMzXQALqXZoO5VITTOZGQ2ZU/7DxgqPwwGRcr4xGv6IwDc
         ah6dloCteuJhuC3cH4aevOtGmenjGl4Q3FGaWpVJ/8WB+iisQ7CS8mS9LBPpyYyyvEd6
         Ohdt7sbBS55p13esU5pAm1KaF57n9PLDMvNc53iKX1c78XslXnLg0c+x+NdtZj8zcv9z
         BlyPRF+CDmhlp5xE/4wuhWCt9F02kasBmhajDC4z7bifupMcWClnRbkUDqNzSEKoWk/D
         gxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347788; x=1794952588;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ra3QtoJe+wCuwUEfgDTPeqd7lp/+YO3cFy9zYknvbsM=;
        b=eIxb+tyf9lt7IuDneZhgsPTWGYrVkpll2AtaBBFZCdq8HC9Mz//wxfmzOhORjSd3ZB
         DtvizlNhuZUNCi2H3v2mQIk74fkQczdX16olFeUHlFg/vePN4wD3CTRkwXYfQZ8yFB4p
         w1kuUFYhSZ/qRka2M4N28p6lhpItlJec+ZBNULZsX/x+TETytgM/IzNr2BYIrWRPQAap
         v9I6imRu/wz7n+YIRsfqgXITpEBem4mAZ3zkaPh1HFZNX1B1UrOHLFEybD8/+HOIXmPs
         KG/WcQYQi6/fywq9QnK8C21M1zIfR2J0cMWvdH1/IZ38DgTbJguWvg42rcRZgArxGP8d
         tTug==
X-Forwarded-Encrypted: i=1; AL+hErGpsH7iF1xXhRwxhEOvCTZkHjan8IvEKdNAwbi2n/HMbODqx3DEei6nj04pvpya/lBQaoEdn66e1cSG0pY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FvMC+DeJxtXNYAvRnbPVK4zIAyzoyDIMScpAZ7gRK4kOTJiTC
	hRu8vQF3CbeURStyu7Ath4Ag4Zbup123GnrKj6fpvR4mOJKAXBq5eFug
X-Gm-Gg: AYBFou3AXHEt5Fffog8rk6bfufmbU7UOMD6P8UDqhLlVZechPh/SA9nHkuvGp9ZMGfk
	GCXPUeU7UJF0qNU1rNSDunSNBtKb22fGwBpwjXrjRPjcv4zjrlbp6LLiLgwHmPQz3lpEVi4fU22
	jGv272D1OplM5j/HQ8TjQrmTGRXaO86hQd23paIX8nhjgSI2BnseeMlsKZ0Z52vS1oLxva0eaqz
	RoxKlk3LzuHNKCwz+YiJDuVBpVPZCYOut933rrFeqRLfAi8PpYIgW3K8zOBY8WyLcR3rd4Y04r7
	HSYhk2gJHTMnbU1K5YIFfHDLj3ODDNwZSdbHQg47ip59698L0SxM7yxgzVSpr3rN89eVw+ABe2D
	jUL7q5+bxQT8xs23pGKCzR009WSA7VCLiCb8fn5+00MjoVGc/JjX6l6TKwrtDKvoy0g/eudjlG4
	MaGXeCqNQ1uf934ZcUi4RT520BGzQm4AqjT4jpXTB7xXlcPeLb65P4v2H2UaYzxt4tUlxrrwvd5
	kEhdsCm2ddG2PV1Pe3E8EFIv6DWMqHkuTMYxArAXaALk7HcvQXtZiP604cWP/fQg63xOgHv0D0W
	KUFtFkdcGg/RCUPPg5TVEZjYtG4wuUmDO+n+WYrRYHgzB3Di
X-Received: by 2002:a5d:584d:0:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-499c7a25644mr419632f8f.25.1794347788659;
        Tue, 10 Nov 2026 13:56:28 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c4e07sm6762009f8f.49.2026.11.10.13.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mac80211_hwsim: remove extra trailing semicolon from a statements
Date: Tue, 10 Nov 2026 21:56:27 +0000
Message-ID: <20261110215627.947448-1-colin.i.king@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a statement that is terminated with ;; - fix this by removing
the extra redundant semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/virtual/mac80211_hwsim_nan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_nan.c b/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
index 6f90856099e8..21330850754d 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_nan.c
@@ -278,7 +278,7 @@ void mac80211_hwsim_nan_rx(struct ieee80211_hw *hw,
 
 	/* And deal with the lack of mac time stamp */
 	if ((rx_status.flag & RX_FLAG_MACTIME) != RX_FLAG_MACTIME_START) {
-		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);;
+		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);
 
 		/* In that case there should be no timestamp */
 		WARN_ON_ONCE(rx_status.flag & RX_FLAG_MACTIME);
-- 
2.55.0

