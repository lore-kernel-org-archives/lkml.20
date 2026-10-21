Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616806;
	b=R4gHv5NMhDQljiscQzahB3CumZXtWBHCa83W+UZNWf3/t34+ghQo+GZKYbKpG+ZcEpGa
	 vqakZQfatf9WUt8EJmfLMU30GV+ZBZ1IKGZxxYQ6AnoO2z/uhjW49w6uGZJ5HAbeimx6k
	 6pxk6eQooDpKjVbLh4uUAdBdobmopCO3bJZwoS/ctoR4D/rH4hMAMwcJWwBZsGmBHqKRd
	 x25GJeew0xWPmimyrCFdBAqn0/iNbIS4WXgzJroiZSQ5y3NxWtHFEtBlHxPSbKuQ6hr1q
	 eQEVOeVilLtOqOU2gz+H7Uo9uLUGyoJ7+ZnQNWCLNQFNqd5ky5kb3iCZdSWSOJDNm9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
	b=cO8sXBKvhZReSQcIXcFjLBBik2P9CEzQ8oWesCzYm0L7/Ns0ApCfSls98jtGtiLVe7aV
	 +2QXVL6zIW5rHjcou3dPLEjWjC9QpkwtjxblBsAW57wWHiUmXPPrAnLg3iLEfhmockslJ
	 eFR3ONEEkHzjqSFOFTRBeZ7eU+PisByfjgP6AAgifnHGx+h8Vz8JTD0t7BR/nSQPwVch1
	 XJwf2pZZEcRnbG+LoI+PNfKp/hFXylUfi0Fcawv9voSju0i51VibfjQuu6vo2b6v64CGw
	 GkSI9v/vysrDtfolYHZey+dx8kqz+IkECnF33QE60FkZYwQDp47GM/d6WTuEZCs1nsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPDfOhhE;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4E8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC4E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPDfOhhE
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84a248254f4so741248a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616804; x=1793221604; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=SPDfOhhEl+TiGBdv0TUrraxxSzgweR9jfyy+x8DxEwxlbVs7GkJNsiTQxewh5RYIV4
         fq1v+4/l4bMnaTSRmoAodCrb5sY2p0qRAu7KZf6Dpr5d6yWPdAT2Scx1W+9vcWf5jaEg
         mimQsNyyotFRJg+OlwgTg5vgA09D45umNmkU1mV9efBg5TOm0k+Gj227kp8H2YbQ8+Wd
         Bm/ZPWE3c42h0VMk7m7D+0vnqOy4qnkKyD8zKPjSofU73SgdMU0u1BSC+g3kAvPgyLOL
         xa9Bs7PTXAWI5FaRCqpZC076oWQ8jwBjNXwMV4DQyzwHEiUkUi/jp/jzIrV5aPhSFgba
         QkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616804; x=1793221604;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxNhFdCnRx1TnZ/VZCHBg1thsLr/kiS3HyDFHely7YU=;
        b=Z6LTE9mi7Ym2qI5CNJHmhQOzpVB3pnWsqVcaR16bcyEroU5KynfcMjVNL9sGfLgyqD
         xHS9LcaZFVv2Jv5qplZprJdd6d3u+c5tPJgVnyuTx6hC4QwjzxLDsHONWADwzkcnC1PT
         a1jProfdiIuuuWMs+QmkOVAo5Ru+USI/9ElrhBCSVw3D4AKeT6HgEnrALFsaw4dSMfjF
         rfCzSEzn9Qik7BfZ+Zi8dyu63j79EaQBS7r0WqpHNtALhOrCJ8YvBolsL5tN/4VeJNyo
         TyJphoKWD0itBc7nEe9AAh5Q/QD3SYz6ldeK1O+Y93hV3zMDv+bFTH57ginjH3SDf8TT
         MADg==
X-Forwarded-Encrypted: i=1; AKwUvBz3J8stLZorZ7EKGBIQzG6lWHIoLCoHUZyJ9+p4ux59qI4LDOfa65gKSX6wfGMqKLaIsnvhThg0KHeyvIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIZHv827mEHzj+GT1Efizdq3pXWQ43MURfH7/WARwdYvAx2x2R
	y3Y8S94iABXPV+0Rt57/VYdrZCWSwPdR/wOeprMFsFmtrRBTN3NlfaIu
X-Gm-Gg: AYBFou2HXm1WGQe5yILIp3W3yqtEEcEXbOZxkACZJldzq8Za9euoZa+w/U7nVHA3RuU
	VBATa5utTKLvuCv+mcz9j7BampsEdAUklALOLV3/FX1Aix4vgDe5FXadFONgxHqWMpQPWLWsD85
	FuL3bl5R+OHc/Pf+x+eZcHSF73nb45pgPW9bTlNrVe+OtDc7M7y8uBgs6vY87EA/0lKd82XHYrk
	3Igz/nLSh5YUkfUnqduevdjCbPk4LSElQebq8bvOKdklRKBoq9iK4UeNEvoV2sXfeSKIruSe7jy
	Hrb4Cm5UWOs/jwEJQkNzx8cCkWHYfz326J5cklNP93aN9QdfkWFrs0hABF7axzRunCCDy80AGkG
	LPCMV8CEvT1IHzD4H4ZMmmXJaZWQF729qwidpaAZERruiZhpK4vlhnXEvP10rmBaa/OxVkim7ev
	Yil5cWp5502Pvyzc2ayeYfMvcG5zmCHTgpeWWjeoRQO3KDh2a5Tdd2RoQLiffp+OvPHzZz/rFsU
	Jk3dn7RQoIenxyBTZvy8tGnO0S3ZoE2qvnTfhLhTPslyp8WclQvQQ5gkAx5wI1AJK9o2SAx/QOd
	BQlejGkdYgS47mz4xPe33wFm2p9c4xIFu+eLk2kZnECfyNBjHACxacRDX9sBuKeFB2XnhmL3QUH
	Xk4sTFP9WkZOiNqpQyion+0LM2BQc7rrFji+AgI2pH9XX0Eg6iUNyhdLYA7eGKC0YZN+YxDYBnH
	WSzA==
X-Received: by 2002:a05:6830:3495:b0:81c:a8c5:633e with SMTP id 46e09a7af769-84d08afde73mr2463140a34.11.1792616804678;
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d04b5sm3466826a34.14.2026.10.21.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:06:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:06:33 -0600
Subject: [PATCH] dmaengine: sun6i: bound burst selection before shifting
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun6i-dma-burst-limit-v1-v1-1-41a7a476ef66@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0Q6CMAxFf4X02UY2CUR/xfCwjQo1Us02iAnh3
 +3k6ebctOdukCgyJbhVG0RaOfFbFMypgjA5GQl5UAZb29bU1mBa/MxZQ1rGYXbol5gyvri0q8G
 mo4u9dqbpDIFaPpEe/P0v3PuDVfGkkIu2XHiXCH10EqZSqZNkZKHz8bfvPyr+VHqlAAAA
X-Change-ID: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

find_burst_size() tests BIT(maxburst) before reducing the client's maximum
to a supported burst length. DesignWare UARTs request a maximum burst of
one quarter of their FIFO size, so a 256-byte FIFO supplies 64. Shifting
an unsigned long by 64 is undefined even on a 64-bit CPU. The fallback
loop can repeat the same invalid shift.

Limit the search to the highest burst represented in the controller's
nonzero capability mask before either shift. Larger client limits still
select the largest supported burst, while smaller limits retain the
existing power-of-two selection and the zero/default case is unchanged.

Fixes: 7178c3586ab4 ("dmaengine: sun6i: Choose appropriate burst length under maxburst")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..a8b12262b3c3 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -590,6 +590,9 @@ static u32 find_burst_size(const u32 burst_lengths, u32 maxburst)
 	if (!maxburst)
 		return 1;
 
+	/* maxburst is a transfer limit, not necessarily a valid bit index. */
+	maxburst = min_t(u32, maxburst, fls(burst_lengths) - 1);
+
 	if (BIT(maxburst) & burst_lengths)
 		return maxburst;
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

