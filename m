Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8A4908AA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405129; cv=none; b=sij/RYx6/KZMgJGmXFPR3qIUBVAxV9IqeV3WqkM8OFw3yVsgN9T1EjM9DPFiJOvzUkM5XssJURWfYAbkk7SO98UOPvTSkRUOu4vRBQQc7r4lNTCobbM5N3GjZUfoFt0gZKDL5eZVepjtyky68lLn8w9cGy/ytFQlgQ2sW6P+ezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405129; c=relaxed/simple;
	bh=/pSpjJCf37a/GQTEC5bLaMzjYEnXYF8Wkh/lA6snC/g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kMstEcIhADoCftV0+6LTw/hE/VUMZAGHpmG7v5/lQjteS87IFZqxsYfHPZgoP59F9mWyuu0+bTqT1onz7Crmkuv8JIZzZb/8UsLNxjHFdhEvbJFKwtl3mgdKwtYj2n0H5HcAI+cZAMBBSPaav7S8+pAyytC/PhQPXvet9o2Qmm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPYEUzTx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPYEUzTx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1010284f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405126; x=1790009926; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rVlDR9iO9xzNSL/ayRFSNBQcAYg5eJCcJuC+js2w0wM=;
        b=RPYEUzTxoc9BlPgGesmFzAfdR5OfmU7eWBbw0ZsYTAIZNYSPU2B7SXxVGpyrRq+VhH
         /9SoO2XQ1tslzBKcatGZqQD5sAUqwm0dOnDzSO36O3bCdv8NgGNfTV/TX5l7GsdrT53a
         0zPTwiDpOXqa6UyjRkqeC59awg0AkaP+mX69Drpy9vChzIBCSXg6HhmomLEI75GHwe7/
         mlw7swvSA3yHHWiMrfNbk+8ceD0XfIvM/fR2vcswzS9rTqGG1ths+F9Hn/Bi+dbRdMdw
         RxsaRzfAwReJ1hZ1rmRZtjAwFqXiW13RLVXIfxZhCMnwan5IMpQ2r1uoJC3GPM7naykj
         nbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405126; x=1790009926;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rVlDR9iO9xzNSL/ayRFSNBQcAYg5eJCcJuC+js2w0wM=;
        b=TVIEdhNykVOiQ93qnzfT3LxEMuqzTEh29P0dzu5j6Sl7ehybNsHlExxh3yzuOkXIuV
         B/zrwfdAgELJWbHvhMLkx6KR+2JrQZwP11Yfrdu0ZFEDpaKLIrzEk2Hdrt6GS2ZPaffo
         oFyNR8/5+TEyj10paAqpWeA0nccvWdLx3Dc30Zp03yRU7X/Lrq7Y9CbENyeEhRc5Xx/d
         r+p246Eb+a7LJp8hUM+T0cR4vs5wpKiRBrdP1DR0e/+KRvlx4LhD6AMhSNziRp/lB2Xm
         aoMgVDFaRAaL9LKyfDfMFaCKBme5ZwKJcbHGZg7RRQMbRsV7MBmuqjRU3+94DvkkSyD+
         fkAw==
X-Forwarded-Encrypted: i=1; AKwUvBzvigXPphvhL/sGLCiXPIPQx4mNV6F6vBnfyfcQAqUb4p5e8YniL7MGREHKLKYi6UBZb/oYXKj+/BscTlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mz+X+8J8yZzmkgvYpM1lw2NLj+DZjZyvlCYUofN9rDbDmJOQxY
	feVP7Cr9Q6vFMCHpDb/2GKJaZHhos9CT+aWEOPWrc3bzD24kJr+wpfotlKfE3x30wI4=
X-Gm-Gg: AYBFou19PfXauio4Zx4GH+P+BP+8trCrhb7tPCWJxP83A+66vbVG98TyJzwwxeFwece
	8O2IFFjtyyxzhMLyulSMg4c8kM9kzNO1xj5YKt9uwDkffqj0tnZ+cTjuy4MIpXwma0tSPTSFY7S
	rfq91crxjpje1YZQ5vvsfGgz1nMzCqAxISzuAabzB74tuP0/Xrk6Ih1QmXTUU1lkVkuAgXzDsNf
	iXwQXTL5ykWEyJaVft8TxeAE7kO52gS7nAGID7gL0B+6itK0QfOofgaKcaYrvT3wXBSdphn0D9J
	K3+1yokwXXtZ9VSQZHWHAWT3j5POaBuQZneRDl/wYIne77pWG4o7eYWYI/uzJjiUHEVa2zWt7p8
	0gqBSHhzggwItZiu+dXIrUbFBAQ6SXsQE6SsHE4i2Jugjpibgdo0XfxLQxt42EJug0+tDaBrM8J
	7jGQmA1UJ0eqkc0Ydhtatj5CtGfoqcf+O8bRKXELalhWK47MKMkWmPQNXpPurzg3jeO5Y/ABUmd
	1GBlb7NybP5KGbydUROm4P3zm+oicWRQs+NX3WTdAGIK3vGWaO3niDzwC/Rcoo=
X-Received: by 2002:a05:6000:25f4:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48702b5b1efmr4480960f8f.41.1789405125646;
        Mon, 14 Sep 2026 09:58:45 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:45 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/2] Exynos850 ACPM SRAM devicetree node
Date: Mon, 14 Sep 2026 17:58:43 +0100
Message-Id: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMnqGoC/3XM0QqCMBiG4VuRHbfYfqfbOuo+ImLqrw5qiy1EE
 e+96UmFdPh98LwziRgsRnLKZhJwsNF6l4Y4ZKTujeuQ2iZtAgxKJnhOcZycj6pgtxjMg9aGA2O
 V1qiAJPQM2NpxC16uafc2vnyYtv7A1/dvauCUU9k2pqhkW8lGnO/WmeCPPnRkbQ3w8RL2Hiijt
 Ra6VFhAK2Dn828vdz5PXpUgjdBcKax//LIsb910RkwtAQAA
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Hi all,

this is a small series that adds sram node required for ACPM communication.
Bindings update adds new compatible "samsung,exynos850-acpm-sram" there and
excludes it from having child nodes and not required properties.
The node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
- extended/added a bit more explanation in the commit message of patch 1/2
  as Sam suggested;
- fixed size of sram apm node (thanks to Sam for noticing!);
- Link to v3: https://lore.kernel.org/r/20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org

Changes in v3:
- sram node moved to the beginning of SoC section in DT change,
  reg property updated to match section requirement address-cells=1;
- updated trailers;
- Link to v2: https://lore.kernel.org/r/20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org

Changes in v2:
- small update of the initial commit message
  "Add SRAM node" -> "Add acpm SRAM node"
- new commit, updates dt bindings to exclude sram node to have child nodes
  and related properties, this adds new compatible
  samsung,exynos850-acpm-sram
- Link to v1: https://lore.kernel.org/r/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org

---
Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      arm64: dts: exynos850: Add acpm SRAM node

 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
 2 files changed, 7 insertions(+)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

