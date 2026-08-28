Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3AC3B4E8F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910221; cv=none; b=cOZcjEj0yOD6UvU33OXk74WOyPZGBDg2tC8K5lZcnUNrzCCWYE2xF9XALpRfpQWoiPXEIAXNoZgHRd7M1nE39DIvk8Agh4dTxUTBSIjS8WTie0fPn5vul01H5JoBcWJqC225b3IemXFHny1Cp9Y9g0tricno6H+L+FsApkwck1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910221; c=relaxed/simple;
	bh=aDfN8/s4zfX+U+oRqYBBi69jelTKiu7EYm8vL0GKwxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwzhKqxPRYJWtvdeZ21iICFTPOTLvFXy9whQBPmVOGwqTrQ18hGxEbjkoGXNsA9RuhsiMpptMx9DSig7Hi7Fky27ggIFqI2gcSmMqNfoe/Vw0jIcYJWRJ9ozL24xbP19OeidsZiGKWPr6WddPpnMtjXXClxFDlPmPNeywxO933Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktYJreBj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktYJreBj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso314611f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787910218; x=1788515018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDfN8/s4zfX+U+oRqYBBi69jelTKiu7EYm8vL0GKwxM=;
        b=ktYJreBjllJYeKNt31EFkq9XZevAIFUb111wjQBuXJP4bnlQuU5g1KUqT28GxZK6Cm
         ZW7dSBQo5rTbV/HVlKLLO82NFYJF1W32CfkgU39S7WDmXHcXff77JsxD7wML4PEzeeWG
         Xramb9MM/YvVqCZ3HQC2DpIn4u4T3eUEw3oUuiQQEZmXFen+5meQcw4lYpYo/arh3052
         hTdoYsC7hsweTYu0OHleSX2m4GHBlK8Kde6q/c3JliNoAq/98migsT79Vg0h5GoCucSd
         dPZsbnCeJZh4VE5CMllOKU7gbiWJPCcGC3hLA4/1Ml7cLzgezJK5/L99e+RlPqtnWNR8
         S57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910218; x=1788515018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDfN8/s4zfX+U+oRqYBBi69jelTKiu7EYm8vL0GKwxM=;
        b=RqqfPwos6MntinkEzaSEc9rCj/f0ZsI/96fHq2ebF/BEWB7UYyFXIDKymZgW99tJEW
         /nHawiwoigbOy4sXYt6cs/7vt05+7fjDalZpUJVUY0YNNuCkCKaaBuCk+wRl9mH/Eg8H
         Ul85smujSVxbeMnZlQ8Ruql382V99vzb+A6KQB9RnXqzfkVRYSZeP2HgyOz/Vw88i978
         fBUvvznmk+yyT2oEmioXLFwgTR5bh9SjQ03K3TFPerg/pB19PbTuCfXoVs1DbLEZyGJl
         G294C1xqMPtKI5xVBeFkcwrltAhum2vThiPPpPc5l2Gg/kM1NqyPU7CX/IC8wj0xWXc0
         2v0w==
X-Gm-Message-State: AFuF++k5OAzbaELJmEj9fxIctgbFYxAbKXt7kM60TykqzxTgtCurG0Js
	8ij6bYnPOvBPP3K2P660pQPQXor6XLO/fdv2BKOE5ok8ZFMRuJLK6lnxqHFIg1tL
X-Gm-Gg: AR+sD105xpWxFwtxz3/E1eXDcFU1xXtD/5/bEsXfi0kBygbHXInfDGwm60UUhxQ+mXo
	ixDXg7HCk/w+GOyg5TdtpkBiD0e3EmKI1OQ5Zj/qpVv/s8b8yaTF1gHjFZV+gihRiTldaVYQ22n
	S7BpJgdpQ5Y2HJjJKuOXWY7Yw6AlCuO83Cdvs/2bJXKMnIf+rZJGvoZBVvYAnGooNnGx7WRsd2/
	rlU5/sMegBwkW9mRmNNkIOnkwBPGWmi5/YfzQmr1ovlr6ZyqQh5X7fu/56Ouci+W+5th3x4oU5c
	O0lkhH+s31WCkdIqgCj0cPQWxvfdaI34qwlhCp4kwTzec9kSNZ0qMadggLu/bTTOycP0FNLzh0r
	8MLq2DilryfFw+A8I3Hd6P9UK76BFHWHW5wpNVz8H0jdTS8lmAY4JN4Ma6PS+a0AuLp8GtgZSOX
	ZCP+L0zssFEnu+lul7cBjjjZDaz1JrfczHmgYbkVFfhj5s2tERhCQtdT5BFdRhL6s=
X-Received: by 2002:a5d:64c5:0:b0:47f:f3d4:26da with SMTP id ffacd0b85a97d-482f79c1888mr6743142f8f.11.1787910218168;
        Fri, 28 Aug 2026 02:43:38 -0700 (PDT)
Received: from xerxes ([2001:8a0:ee6f:5800:65bf:d008:6bb6:cf89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb28492sm2633696f8f.31.2026.08.28.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:37 -0700 (PDT)
From: Romeu Gomes <asm.artisan256@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in ioctl_cfg80211.c
Date: Fri, 28 Aug 2026 10:43:36 +0100
Message-ID: <20260828094336.13299-1-asm.artisan256@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082812-award-service-889d@gregkh>
References: <2026082812-award-service-889d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks. I will resend this with my full name.

Thanks,
Romeu Gomes
