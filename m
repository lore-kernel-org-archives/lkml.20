Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792949745;
	b=SA/MQ4ubYwSNRhqvFZvtrS7M/7jhnFmwI83YiGulOQ1sxMVihS0sl52RY9FmeE5QLHNL
	 agjsjBvH6nSJnwlA4uVZiIwDMJbTICOPN+YfVlB5NujszSjHqP/WNYhQrZKIN3UIXZSKj
	 f/xJsuJJV7q5z6PpDLbRovV4loXc1rEFcLYOLyGPWpoYm9O0QAQQAzXE9d1GgLJiTkwmQ
	 ULBi2y4gdQMtvvBxqKeWnfRBLychMLvMLc9Xy5sz5waBOiTvkPHonJCuyZ62gdE16CEyw
	 Sl7/0AKS3SRBxHwZem3OyBgMHZPhIsfc3JZbzzKPI4o2oc/HeJgNX4MxhG2tnVMqcmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792949745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FPp5aDGJYBPNBlpjfaSZ4eY2TIeatM+DHjVLUX8oeUw=;
	b=yUvvlYzpjamiCWqulTESDNqpeoYjKGEQ4b2lGyktKWspMgUTbuRw5+znVeir2C1/tDty
	 +nWg7zK6xG60XEDGozMoZhyQeUX/xAqf6eF8nf5KBkICGT9o7Gns0H+CmU59f3GYkujEA
	 AA+yz/bxNcC6H0MIx/TK41y3zHO9ZLbb8MyHDBAIYWCZBDlWrdG/u5lwDPFJaxCYwM+e+
	 4fZPMR/aBPweRcm0MMAQEEg8sx215u6iGGvYrdS2je7kvOmAI2PU9JuxGU47TlYUnejEr
	 KGyZ279WXD81mCdgjxtyDIZbS+gQZbDDVhVLjRHTitiyY9Z6q9C6Vyfmfc/MRXQ1PCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BDBiTDGh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3870606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3870606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BDBiTDGh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9867965e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949743; x=1793554543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPp5aDGJYBPNBlpjfaSZ4eY2TIeatM+DHjVLUX8oeUw=;
        b=BDBiTDGhnT0TKGV10WD9+rpuzcQ6WzkABR2dKuZpyN7697g7r4hsCW/D886S6H+oJy
         zzEVVWKsPkQS1f4cDyXMA/Ylz0p1tcObYnXt596uSqDyYA3ccrcNiniCeklo6aMrWv3C
         qUkptRb5y3aJ004cX7jjHzUpZQa4J5uYP61Kuae5pM9MIkDgmhrLOiM0irL1AZmHLVue
         Zfe7nGtQ1bFKggmwYtgzWF95IXgcmnXnG0uK8Bw4dXdvpWEELdxBW93Kg6vPnGqmd7mQ
         unisXSTCq4c5u4orIZHuDnaQoGXNBF0sVl4pDVG2T4xCVfDd7FdKMY+wjyp1nQfofP1O
         1rBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949743; x=1793554543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPp5aDGJYBPNBlpjfaSZ4eY2TIeatM+DHjVLUX8oeUw=;
        b=xtAl+hT1WK0J1mlJKsHu8w8Ftg6IvlIQWLkJjrvY1TVC8bYsqv6YG5SeP+roFs9Fd4
         K4wenAkzGPZr/cSCYmhCikZh8eTXDc5HLQJCXdGTIglOSmyK/kDuI0xaRpFwXnNX9QtJ
         OIsyfOz810Hk/czednzASB7WJBI9omiHYL2oXzzNkr8autzEU3mbujEIKMAbQNI/3HGa
         6hQYknoGM/Y8mvECgXszvyuHgP3228rtcOafeOIB9z3vIVhhgtTuVhuz3XiIxUiT/420
         xeaLCPsBL4NjlxPjvMyYxqELtZEIYWFjTJjAggB2lcHqV7veRDcyVWZAsoo86lxDS72Q
         YR0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjy/3CVFvBLU+FOS5gjNOd2TM7G68djeIfMqPVIAOH4Kjd5wRrwrxqYT87ZS/3jzvQdo6B9oHW2l+5uys=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMDO2aa4xJBhKyXJwgsF/tF49J7lXOdNTkfyjGyQAcSQ8VA3mJ
	nEGsNGrb4thlX1sJZRERSK5FTnuNHnEJAtNuSB2ALNowS+BHezPshHxSx5kCE/Fw/i0=
X-Gm-Gg: AYBFou27tqhGXdDlo480DIEBrzfKE43vkxyrKAh6fZTe3K6DGNvjllXM9bHDqnr4WOv
	MXjZwIZD5FU6YTFSNjdc4MbFczRImYaVf36wcF+f3zaGuOyCB7LMoBh9p8caAglZMPmUryzB2PV
	reOh3KTaoEK8/k2y9fydlUB6KfOCY1VLJp2ZIc2RxH9IMzp+essOWYWHY7N8DMWOSNwDh12x4h+
	kNL47Bm5Yxxn9Z/Likb/RMSVs8fRn7GuwPzqNNxY3JujA+Df/xAiZgBBcW9Zp8Bh1YgTw1vrYKy
	KmOCtwyUc0qZ+6X+jCA3Keu68hatSyzO+lYd6VpIj0d2uC04ZQ0n+IjjDFuJvVJBQWzs1b2gK14
	JaJE7oBJhTxSeOjSHW5HZb0v0aNNWS4MgNEggXcgyCSIoFNUOKRZaU/cX2TVC/cTk+Bp0m5yPLr
	7LANKqVZw6LHZZwQ9D2soBVKJFe45ogSg0fRhiG315SLzgrjozpHGVbfa+cSGlzIwRAHr01Mh2D
	olruJWYgXOXhRxGPS7oice+boYxJIW5dJC7iV8tcRK6iiDFzhLc0seZyORocEioUv32Yg7UhPms
	ouoYwrat5by6D9diXVK2d+1bDuml+glqtm4w2CGI0QbbOWc7k/ZUDs5bggE5ZOwJGk47EcuwEGk
	KYLAGMmUXj05xEnlvjSX55SiBJky0jOJM9U6H06SZo5ia/fR46mNZTZQexsxPqyW+QRopnnGDEu
	Mk5Uf3Hyxq
X-Received: by 2002:a05:600c:a013:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4a35acb3e07mr86950245e9.23.1792949742997;
        Sun, 25 Oct 2026 10:35:42 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-ce3d-9b69-45b1-5da5.rev.sfr.net. [2a02:8434:fda5:4201:ce3d:9b69:45b1:5da5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm10234070f8f.22.2026.10.25.10.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:35:41 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] tools/bootconfig: Fix histogram filters and variable names
Date: Sun, 25 Oct 2026 18:35:22 +0100
Message-ID: <cover.1792949723.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <undine-1792936915899334889-d965251e73c20670@undined.local>
References: <undine-1792936915899334889-d965251e73c20670@undined.local>
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

Hi Masami,

Thanks for the review. I've combined the two fixes into a series and
used the two sed expressions you suggested.

The first patch keeps filters when exporting event triggers. The second
handles underscores in histogram variable names, so the exporter keeps
histograms that depend on them.

Changes in v2:
- Send the two previously separate patches as one series.
- Use separate sed -e expressions for [active] and [paused], avoiding
  GNU sed's alternation extension in patch 1.
- No code changes to patch 2.

The original submissions are here:
https://lore.kernel.org/all/20261023084947.3264289-1-edumucelli@gmail.com/
https://lore.kernel.org/all/20261024110837.696216-1-edumucelli@gmail.com/

Feedback is welcome.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (2):
  tools/bootconfig: Preserve event trigger filters in ftrace2bconf.sh
  tools/bootconfig: Recognize underscores in histogram variables

 tools/bootconfig/scripts/ftrace2bconf.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)


base-commit: e28458ef30ad66ce7cd2299ec5ee8a8a016d67ff
-- 
2.53.0

