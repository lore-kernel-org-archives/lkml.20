Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782227;
	b=090agWkm4VDElQFgw/f6DWAU4Cy1d8lgz5J7WaBOATLxF13qpbG9C5Bvt/dr0OiPRGcQ
	 55ORAuPuCP6w2G6ggJyOhtDDqsVZlV8qSir6XsaWdi2mWdAXYudpyvGwQVXBPIOTxMg7k
	 WD86+S9dOoRK339Wbcbq3lJI9O0qQM2gyH1t+J5lysBD/cdf9Y9AaP9ifCwmRNyhaOhw/
	 l3BThquqz+6Thn9mSL9kToAkEwKkC6oMYKILedE8WJzLZOn1f0SwC5PCIk+fG9EGDc0j/
	 HjaVTE2/pBuAown2ViUXp2gLmRWVlZ6zG1a4d0anqZpJ2Wqcg7BWr+NPEARf7y3vqQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
	b=pUiEE6eQ004Kc4AHD87bKWNVEEfBglRuI6zoryYm24aTKPVs8q+kIWK9UMRk+nnSdIu7
	 2Ux5pCG9du+hzbJ6GxOSDjJ275Y8+4iPbPANiNSAQ6Hkq3mlPDC8DVZRH0p86pqcxoqVH
	 tb35laViH9UHvjNZ3WZniCDQe4K0PBBc4Vyd0x6VfSykDirCFa+zkY7p0ghlwyuLeuqul
	 FU0d+PQjarPPCx4zJYPbpTxi1d6berrC0YZCpqsqfYVav/XWM8jvc074KjJYJAegnA4f0
	 ZnxDCM8NeoqRX6zkcGvE8CExy8ZwVipk8sC8LerVGejk6l+LDLclpLznpgdTD4CiHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UlDuhFVA;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAE2606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAE2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UlDuhFVA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so1526565e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794782226; x=1795387026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=UlDuhFVA3CdFgoQfxB4iU84iHeqvmwEESq4cx986ua/pBTS3EWqj6KqX0PpmQkOJI4
         OHtiHzrjN7pAcfIjoacVcsMqhpZaIWGAOSdU/idkYFVN2qohv139gauH7V8ApbwjZjRA
         WT/H3CnkC7iaa/RNm1ZLRh3getD0dXTO7EeN3QGvjqkihCdqX3yG+cCdtLT2UJxVs0dt
         zI7ViMwkdtP63K1MLIKIowVHzJT6O9UiYMIBXutePOnDx+mPSm30dmxLYovM6Uq+ItlG
         LYVOEGIFk1pszczHHKYbwf4D/12onUBwL+9eGEBPgAcCjCHWMh5f4QJN/udvtfNeqfUE
         U5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782226; x=1795387026;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=f+wembd00/A93NlZNOqtYtMzNnE8/JDFtqzBmqHt2OXPRtIf+Q9G1VfbZNPzrFrael
         CfXS4+dqenUtAKHKdn7BXcYa11LAL1ox0ZdDg8tl55CAaglxbzWfv71dDtBg9XmHHFxc
         X3ntIPon+dVDmVv/sO/nVpfcNXlL0e2sHL7InhU7sg6dRvCOTrya0XeNumHVYI7uL0LJ
         aez/a8VvRr1quEFkJ+th+CA3DA+0yoRYJZGzmNL98nvR2mbgH/+wdoXAUUKPYpxfE82/
         Gd+nVi1d/gxa5q0gjfQMI/z0vP3jIGbTsDNh9Cfatax2SpDzMVjVtpNKZWY+Bv2Ekw17
         SlCw==
X-Forwarded-Encrypted: i=1; AL+hErHeKyfr0g2lEFZ1rYCWNKbw66sLJS7mnwblslM5e6OMkDyrdnizn02F+ZHmoivltgbplHxNY3YyhsCLKPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z89+DRdmM1L3f6lc84+iguuKkgWTKN71NCoEh8lVAHitC9W2N4I
	Gd2EO9iJ4gAHqMr8U2ZhamQEiw9UTbKquoz7dVpQcQ0S5Wod1urG6X1LSbNPf+8ztyPqxEUQLuh
	B+47S
X-Gm-Gg: AYBFou2SGpC/5zJVTceh16nR1O3e8Egk8EaBCY8+2JTWF2bFNVBhMAy4DhdFZI4xlzJ
	fdlNpbWWtrT9BzUTEGBqJ4nEY0nx3Gwlpp+cuIAXE6NeflfZp2U0u0G82j6/gajC7x+5rxGs+Py
	M7K0CKeDNxewApPrRI5BOQeZ1bL3LO9TtZBdJSTH7CJBH2pTNirklRATLE0X64LUdmZdTYHm0gA
	eaf3U9Fep3g5T+3QR/fRlmg7A9Cu0AViPPI7mWnolPAeM1t+ZJPQMgftJ10mrdHYaI4Rwl4VYvK
	FbK3YTxfZma5RUBswAQ8dv+MxUr8FRdhzzp9h6KFuCUAFM+zEUqim+yvS4bGN8ulTAnHos0eZxX
	NHyloAfaX9NDCl6ZdH/bzbywxmd3AlxsRnkISV5ZropGLQsdxyQJniFjj3KX+Jp7co++ZnRMVok
	i6RyBjbCYFKgJbYIOtmG3PMBWMSFxsAbm6VICgCTuYOJZ55GvZysmyfCvIo/b0bWxm+/KuwxFVC
	vFdlOBltsjCemgSkNYUWdn1wTtF1GJ55AqMCdLl+9uRZRvQ1G5EA4nPYVNtzMzHpV9y+o5n5BWH
	EovVjI4IV38MoF9d0m2kXGxH7P4m2/d4Z/bLgnwtJQWDfMdu
X-Received: by 2002:a05:600c:3ba4:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb741d1220mr5026685e9.7.1794782225857;
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7292c04csm27506865e9.11.2026.11.15.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, yu.tu@amlogic.com, 
 christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
In-Reply-To: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v2] clk: meson: s4: keep the PWM clocks off vid_pll
Message-Id: <179478221481.13037.4595055180281805820.b4-ty@b4>
Date: Sun, 15 Nov 2026 23:36:54 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=190; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kSp2XHPUdyj9arJE5zFouPgC7s5Qz4HXMfZKSQrP6NE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/TAR2851bnrrGinOP65LEaV2sCwq3rzVcpp2+lemH4
 cwdh74xdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAip2Yz/NOYuTW49Gm/6ZoV
 G1YHrvFptfdZafT5u+2+fzdjbRtO1QUx/LOVE65sn/R3te9l1yuzrse/cNlz8cvRu/85nq/4eiJ
 RRYAZAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/1] clk: meson: s4: keep the PWM clocks off vid_pll
      https://git.kernel.org/clk/linux/c/cbff55924b87

Best regards,
--
Jerome

