Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C74F0545
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413496; cv=none; b=TmnMRCm3HDlHKssnl+eGDAkxgzpUrnYtpSPuWIEkZpyrL8WrjSH9fJCP+kDrBuDP11k6sBrRCB8nsl+veinJfGDnuftBhaqri9//5YMtKYsPAH227OIEpexDIQ30ezw6vnmvzBadRRd8HHUq2HCmZfLAzUfthaYw0y6D/iAwOds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413496; c=relaxed/simple;
	bh=a1RIJ/bMmJNxSAKekcWOeb0aocNYtYHTHwsGPOtVJgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2Wb7mDsDHsjeKV9fJMk2+vRfygu5R7YtpvDcG4WBZz2wNwMGCEDxBDENST5XNDwb+up1//LEYr5SDNU6ZDPuZtE066bSWCoGZob/xJKXn5siNlXvJ9RXZ4e+Henr2zE+wobgRui4S3RUtZUQ8S+OMSHefLMV9tTP7oOOM9JdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYgeeVNb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYgeeVNb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1525713a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413485; x=1793018285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1RIJ/bMmJNxSAKekcWOeb0aocNYtYHTHwsGPOtVJgM=;
        b=aYgeeVNb0jyF0nsnwPwRzpdfZ4zXWVOQRUBCCDWo13ZNVkM0FynTh2gQ59lIUn+8gl
         YehwNlUH+zbBA/FrBP4MIla26b4lzw4Jg8SF+uMPHyPEIiFkG6j78Ru6AKc5w3nt/Ngg
         UAr8CMboyEQcGdE6uE4Q2zsWZQMi+chFlDDJF8qlCtfXBmU4qwkpzZ6bGNwoIUnDetSa
         15V205ZrbN+B0lOUmA5gGNI5Ptpf20XzvBlIAr4t+3EgEjEf8BRfgslkQWnwwtijbvSf
         xSi6NQDV9wG1XfaCkTNVci8xY9XoF637xJo6wj6EX3FoL/n+3fiXb1NoHHSR6NXvLTSK
         VupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413485; x=1793018285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1RIJ/bMmJNxSAKekcWOeb0aocNYtYHTHwsGPOtVJgM=;
        b=ofJh41gNwof/hT4Rq41kyMUPoAIzoFMXFtFi9v5a4uxYz2ulalvIeftbTywKHsslM6
         Fzmirw+bx5TI+gmC6/xKY6zhAzdh5Kocahg+0dXlg5vQ6+x9Ud+2ojTEil3zhqUMbQON
         U625QAbxIaDiL5zwLHszCIMkrdEMuVtnxywQiOFPkaH1q+NFZo/3wMD0p04d39wNbyJx
         Wg+1dUEsctsb0c9fMMewfjq8W0YICM0QFFU9C9VUzyw3DsTA5BGwrkOTZXB73EXG2mwH
         uUvKVhMIsAK4irJDuHAPSN+oIDutHBAkeOfm2/Kw8bYNaa6lYT/TrybNlRum54tJJWf7
         NAKw==
X-Forwarded-Encrypted: i=1; AKwUvBwh3A4gZXur5GgasICXoPUKsQfHLMCLccnY+Yj2T51HUX1mchh1zNCD68SkxLUJ78TLHNgMfZiBaxXa6uw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRO6kl2CJDEw5/w4Id7OMKLiRnGPVl5CqeeKkHS6gYicc/6I+A
	nuHEemZDeCVceOvsWBGqTLqKA/Xh0NZ/xbmfB7cujS7WuOSu+tuXoz2l
X-Gm-Gg: AYBFou2CWH4JB3m/Vxpn6AqzGqSaejT7OLzhUJ24d5XxI15oxrrp+tq9GjOpntLcMDI
	EiC44NrYAkIK6UbtZ6lfNUYnfW5En640YW0c2MgyDORGatXKRP3KZx4uuTmBng8Cnypf27Yo87j
	qYQWdxtV0xJb33yUOKw4fYcUO7CXtwcVtetxF2butwdADU8BDdbh4G+d4xFB1T8o4eJ8VskpT7o
	TKQehnlZtDAObovYtB6deYDwtF8bAJtPv6D8oqLy3RGvC6wLjvZCwcZHxTgUlK6QKqqp+FSXAO1
	GMHB9kifyis+iU00KSdpSCTpyti+uiCS3tiCjXSi4ftGZyW1lt34q/1WQNOb9jXsaVjDGBsITbn
	Ftmv/4w4Yn1JKa80rdyv7XBX9SvXMacNsXF9TB+I7IsRDNtW7zWwfqJ3GnAKGfmhzyB1r8zR05K
	B7ZHvs5MYe/Vu60HeWHqMoL8atK02BpsqZrlzx3G/USQY0c4yAL5454YHBC55iL5xVA2+Sv3/BP
	2t6BL7pghwT9rzheJWGt7VLO588xugDBerWkxrzImpCNzOaBaYs68sOFnV3XcRkbRT4mXX98AJe
	/A==
X-Received: by 2002:a17:90b:4ac6:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3acee277119mr6899551a91.6.1792413485432;
        Mon, 19 Oct 2026 05:38:05 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a15c57sm3902419a12.25.2026.10.19.05.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:38:04 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Warn about controls whose register fields overlap
Date: Mon, 19 Oct 2026 21:38:00 +0900
Message-ID: <20261019123800.3410554-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atXh3Br+fuH83S0q@opensource.cirrus.com>
References: <atXh3Br+fuH83S0q@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Charles,

Thank you for looking at this, and for the explanation. That makes
sense to me. If it is all right with you, I would be glad to send the
patch myself. I will Cc you on it, and I would be grateful for a review
when you have a moment.

Best regards,
HyeongJun
