Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12544BE444
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276045; cv=none; b=No7VoqE36XbpRcSQzxU9scqutqaBkHTmjmHorP/NTTT1SglnjO7o45Bgel2ouAgJHRfFLgaTEf1rYJUNKE+VziunSORdd9dnOFEiyxiDE0ClHvVeFBktj00X6IO4gTkvRPJGxs6TitJxaf7f4JkL7DoWP1lhR9qoa/BY2lweHBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276045; c=relaxed/simple;
	bh=zFkMOllcHrS6pEnX9XO0Vwq/OY+p3PIw5QAvu5BrTDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1HffiROr7fDfBEmdBpjirlNn29QqqRsy9iH8wde2mHRteMdwDPrWbTdUWctaxqowAYLxrEMk22JvDw+iG8W/3BG613clkIuliWoJCrxN/F/scNV74Yfucjcn4031RuhYJ7Xf5C0qZFjX+5BfSOycvUEJUfTzAY42/WHLN4ylTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGa71Dmg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGa71Dmg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so1025645e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790276038; x=1790880838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Br6bJ2Gt35fGfFnxQNY46odJs2rrBpY5wuK/cZ+VUbM=;
        b=sGa71Dmg8SjJjPB/o9ItbSDl1qcA6WIYem55gGX+dh+5DO0+Xn0KO6c7aQ8bW7UMeG
         dIZa0oKBYUPGw2s1410tFOrt8gHCIml00TvpM92tIzHvos/16TT/VvxxGGm7lUXaO6JE
         6m6o7fCOUbxEy50hH9BYGFuDyIG2b6dJQTv8kPMj/gCFHCOAyEUU6ufn8mfPhAB5t8eX
         fFuz7HmhGk8Byphi2HzV/caMY9qwko0SQsgEGIKs5s3VtoTay5Ix28RRto9bwtf/zStZ
         RzNxxZkhWFj9avZYxn0KM75niic6sT0/bKbx0yZiOp7GJDiDRKZQrtjg17AveSrv9WSV
         SC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276038; x=1790880838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Br6bJ2Gt35fGfFnxQNY46odJs2rrBpY5wuK/cZ+VUbM=;
        b=CAItktx2BWKQHS1yjOqKp0YDx6OXPwCIAiP/zMO+fdN993KbTJyKKI+M0s2mCQDl8z
         1SU9OoR+H/0ug2ELY5L5Qc42FfhcUZuKzRavppT3IEsQ+GAZMMCq9hwvhCRUOD512k1T
         2saF+ZeGAXo6OctfJtCWDEYONfgqCeeGIga0vQ2rLMrW9S1aFtd3rRbObKo8wT3+Vukp
         7ZgCN6AD0s9RJbNpi7FWZPXNBwVLb+gxmANnqwaXYBt9EIwnVZ6ek311uE6aVZecnN9j
         Y0aTHB/s8JjKzBNXsyGbb4EhYOuw6lwWWfMsAQhbWi1msz9+qv6aSQrkWE68SzbDwU2j
         Ou8w==
X-Forwarded-Encrypted: i=1; AKwUvBzEWR+PNOfkYNJYerr6TKQzRIl9u4pIJ/IqyPha+8VaAS0gFy3ZcouaeJfDplaRghTxYuvDa1bLiwxwGfA=@vger.kernel.org
X-Gm-Message-State: AFuF++mU0M9FkelzDvzTqTobIWpq/G+0ZKtz1CIB8BEBYMiSAyLlgN+Y
	4YKEYADU/ZCe8So8KaXfom/rfKYUfJISTSYMSFeZWDiiXMcKWT+9gkS0HyVxCw==
X-Gm-Gg: AYBFou26VCYjAht+S6XlwDPZ35H/d+uq9+umOYgkxIYasPe73S+s3pW5qGW3ZT+Fab0
	4YnZe82eKtd/BmJlWhehAqkJlhPpjgUPFmza55gZtGLwvbGNJDCl1XhQxISc+YlDWItFFeGCgxF
	hnYbka0j09ETQFTyDptXlW2VfPXRR0ZmuIGqz9Dq9uoo2s7WK/crMr72HNz7Yhwq9L1wawIWMf5
	iNpmE0pCAF5LLLTvm6GHvO1ZQSF6eyIc3R6f/xviDGR1kSzCSbcv8zdUras6j4b73Yw2B3nrZSO
	V3ns0tE/8hrGnI1XcLskseI+le1s7A5jIzYqcSwsjap9rTUsdT8eFi2FEii8WYpSAEV3FpuIE+u
	tJ0SiOwYlHgjTMzUX7Qx7TTKulVLBymh6U/CUUg9Z8GcZz9MajfixCeWKqtQBhp8EHlyz8/svrP
	OeNUt73MEScz6yhe0qT4llnFRIJESyqRqEji3M6TPEbOnx5JdkiJc6qm4nuKc0M7RGZqApCA==
X-Received: by 2002:a05:600c:4f86:b0:49e:84bf:6110 with SMTP id 5b1f17b1804b1-49fe66bdf47mr56579105e9.6.1790276037988;
        Thu, 24 Sep 2026 11:53:57 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef605cc5sm958245e9.4.2026.09.24.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:53:57 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH] staging: rtl8723bs: remove unused variable 'phal'
Date: Thu, 24 Sep 2026 21:53:49 +0300
Message-ID: <20260924185350.42180-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtl8723bs_init_xmit_priv() the variable 'phal' is assigned via
GET_HAL_DATA() but never actually read.

This triggers a -Wunused-but-set-variable compiler warning when
building the driver with W=1. I removed the unused variable and its
assignment to clean up the code and silence the warning.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..0441e84ea87d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.55.0

