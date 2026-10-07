Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB8B45FFDB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374073; cv=none; b=faxESkCUob1f7wTkDRjdpFDEND2KzoTV65K+EVOIeD2JPVVfAIROv7Cvw0oionpRSGw7j+ggJFL6u9XIvufgaEKrOaKWZGMZzQv3Mo/qs4hPhdCd1jRIHpBijlQbTcy1c0XTDHw5Zz+rxrUXtGG5o7CyCippNNfnKk0NtUgYqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374073; c=relaxed/simple;
	bh=xVxx9Xk+y+oMpzOya4bJLUnJqWc36DmAOrtCu4VXflU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXrmTww/Muf5da+Qjjnw38pTEInp+JXqm9GOr4JkwVoF2zBsjt9joR9Jp3wmN/Oo2nGiUOaxXf/REYc16ttyLftpWASOS/X0MH3EjE0em+QbnAwQ1jj12vYnB0WMN+8WfD8B5PWPFdaCcDl9+dsbE0gOleY+/i4YzSQTnzpdfI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYv56l+b; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYv56l+b"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc758830601so2576823a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374062; x=1791978862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpP9AbQSKQfCffKNT0Jus7Dcr8U9NfIAHEnMBeTFpJ4=;
        b=qYv56l+b5QFxMxzLUGL8XCRZcG3W2RF+XTX4up6lgYp7RLYjHTgzVEGzh3OSHlPQEC
         GX6BxwMfXudrEOv+ErjKul3MuRwbM3ZMHU0l2NPZJHUxX9FKg21T4zZQW4Ga/l3DaMVk
         sk3Rc/JPN0rW7cTON9LCprliHM3kq5+LNWtX8+e2CqUTi9yzTSp0CHCxF0St3Bk3dBfN
         VZ5yDAJJjxbmbvrKDDk2+fgyMpADMt8722fPn3lACKDFLjIqdNF51TiLjIXZpVojjjAG
         kd9ydzwODn03mhrWmCEDfeRNZjriMQbBbPgpKVOqTFCVq8s/ZJyjb7GEl0nLEaAujbjP
         va5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374062; x=1791978862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zpP9AbQSKQfCffKNT0Jus7Dcr8U9NfIAHEnMBeTFpJ4=;
        b=hK0NvJpNfFkJrVOo0Q8KiEgy1PeGgdCulO7A3srig3EBJWcIxfQKwm7/I6wkaua1+m
         qhp3qZBARFgvPbP84MjX/x9h1q6DLC3Wgitr0vFI4piUJZzxgKnmifV/Vx2xfbIXaiyy
         rVSx1j5E8ikKXQAJbrCeVRoqdHMokur+CtPt5rAfebCVFPAE+GxIu4SYTf8+77QGaARX
         LjrQrZn5KtyyzA+fM+T5n3srRFOKi0GWbQO077Glmn67tVXeLTjg+5SAFGco2tfFM9Bj
         VvbPViAmRLuTnJgneEQXC/gAFVeMNLz4QLIfx23Iq2Ey+VEzD1a4NdV5cvo8Owm0LyVy
         6IOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzneq5R/jbV3W00ujRWanwJGd8jX4Dyn4TwqN1ut/bCup8hc5cLuxvqyD8DgWL41DKo2qbpWyR/UTP7WAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzgLjbdL+zMJa7O3/EJGi2wRMjGCW6YGekX2F/YnbKLX5hMwnC
	gJRANLOL8UD21qZp4Sr1DqNbKMwuAi9H5QUl/OdwfpT4oMOJVzjOTPlw
X-Gm-Gg: AYBFou2QdaCO9cS25j3hAtW54QqM+GpJRLF3suyQoinAJ/kAGOU8sc/hfSYfVltMIag
	sEgVVKYQQTg8YlVM5TWW7BLBIxwv+mdPvA15VY8m2AcOnyGMf7gaDRN97Oyepzu4o+MilXYVAqK
	KIHl05ORUqd090WITZ7+yvketOrBAt9urKFNWha68Kc2zLpO88j8UmJhz44+UZqk3yq5WaAwOIk
	JoYZEJPMSF/IqrgaFAT/ApZtjpK3GRaBcCuYo8l2YKc9fF6FMhKQ3Y7LBQnWyu/JTffc1znRJ+4
	VHevnn/RJksLbv/1BY3U6dmtreniIikqhBPXUvGheezYpQwO+URFuxPDIP+Tzf1PpYbMtMgwNJX
	jRe0Rn1GYexARKBIOSMv6ek0UnsZw0MHWk5ya+CegpLzqVMZyrPpfY5R60l+tPiyvpwlzQpJ+yU
	Vloy11gPmxZ4E+fdHiehL5sriz5C+k+cm7ZjPcxEsdgQ3jnCwvhlEMPal3XGZzUaz32LnfF4zeX
	g==
X-Received: by 2002:a17:90b:3a47:b0:3a4:7d7c:1866 with SMTP id 98e67ed59e1d1-3a8a1be2736mr1737890a91.61.1791374062000;
        Wed, 07 Oct 2026 04:54:22 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:21 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 4/6] staging: rtl8723bs: use explicit types for math variables and iterators
Date: Wed,  7 Oct 2026 17:23:40 +0530
Message-ID: <20261007115342.1121742-5-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
References: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'uint' with explicit types for variables used in math operations
and loops inside the aes_cipher() and aes_decipher() functions:

- Change 'payload_remainder' to u8 because it is calculated as (plen % 16),
which guarantees a range of 0-15.
- Change 'payload_index' to u32 because it indexes into the payload, which
is bounded by plen (u32).
- Change 'num_blocks' to u32 since it is derived from 'plen' (u32).
- Change loop iterators (i, j) to standard 'unsigned int'.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 676587fabfe4..ff8af1a29b22 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -784,8 +784,10 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 			     u8 *pframe, u32 plen)
 {
 	bool qc_exists, a4_exists;
-	uint	i, j, payload_remainder,
-		num_blocks, payload_index;
+	u8 payload_remainder;
+	u32 payload_index;
+	u32 num_blocks;
+	unsigned int i, j;
 
 	u8 pn_vector[6];
 	u8 mic_iv[16] = {};
@@ -986,8 +988,10 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 {
 	static u8 message[MAX_MSG_SIZE];
 	bool qc_exists, a4_exists;
-	uint i, j, payload_remainder,
-			num_blocks, payload_index;
+	u8 payload_remainder;
+	u32 payload_index;
+	u32 num_blocks;
+	unsigned int i, j;
 	signed int res = _SUCCESS;
 	u8 pn_vector[6];
 	u8 mic_iv[16] = {};
-- 
2.55.0

