Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008667;
	b=oSdavHSu7jw7YL187R5mYBMgnqJ8t6We7RGBK5ZoNzzKipQ//smJp6AbYhX+OKeXvAeP
	 /ruxVDv+iS6gDR9hjdvWduM2Xo5EMJdJ8NLLvqyXfaFmsOvd24CN7pSgn/l2cUHLKwBOD
	 d60JB3/rJ2Y3Bhbgr0g1B26tD4pluaTyL1NpktSUAcYfxTwr3vJYlVmzt6xKOiASAHN+K
	 yJeWTec7Y805kSqtD5xscUrQvmJkkjV+Vo03KQQFP1MxgzKpeCpqcmvGoTNeBJjoXs4of
	 kLtE8KYRwjRQS8kLjRKd5Y/t4KsVoMgvudp/d+nveSj8fvEBoiUk6UmjsSDA6+2Rteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
	b=glpbECATp8XCisg2CrLjuFx8xJ5qjo1OgS1voWdj3c7kYfTUjpLk87ROf1yn3bQFm08Z
	 y5s210alotx2G9v1BiuYCQrq6CN1Toxzcl+xhUbSopefD+lAusT40tnrzF7aJ0hi3Bakg
	 bGzcZAe/NjTjd1VC1fxzuR72iTKrfT2r7fesq4Ea+LXvxLrHoq5eERcIbRA9JLZ5MEo9d
	 qpTRagZtwPRQZbIWx+0qR+fJxrj25u28Cz9ngSFSzwVnfRcVs/ncrnM0BPM6HE5PfT/Zc
	 ZwgQNi0KsZhOEGhA6KLk7lobukPGF0lAr26jR+a0CP2g7fSOt4laYz97kYm4yAzLTBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaoQTefR;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365C606A9C7
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D365C606A9C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaoQTefR
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso21899715e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008665; x=1793613465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=PaoQTefRLtUqRWS8ESfbugPB3bhdgKfFyfJ0GDubySmYm84cECrY0snXnCHiefXyJC
         3YYlzreD7EQ0RdWXB9mntsLq5Z5v7mrAgt2eEeuSRJuNKpktqhtFjFVtmp7jp3CAu38l
         OTU2HF5Rue+QZFlmrYNM79QAmrNc9ygKTAqnMW3/iX4c7Dnn2tmDACPVLYZg2DDUMJay
         sw/5/vcIbvSY8zW8oQkYcsLQxyyh0yDTkrpJsrXTSslwI5e6hsCdeovmNuBORfBKzO0L
         BHlDj1Zn8l8/+cKbaihcPyRk+J9T3KoJ1uL0VGKZOi65Gab4oF1XG0V7rcIjk488qHLK
         EEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008665; x=1793613465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=JInOlNdW12obTXKPDk7Gn1p40/CeJ3wT4afjwah2cseiilksWLCuHhw+pZfg7cRdGR
         QxDuWotowoE1bGH9KoVuETT9EaePwLTbPeIr/pXuTlPHstaDElVaeHKm7LjJ3G3dpUNT
         nl8jWDCbiodTlbANkiFOuEPTvZIFhiFAmfjHO1/jdk4K9y0ffuehPSEBJgomMqlL8X9j
         zPLEid3Y8Q+c3uiLP+altq970rxvGVyuyn/Y2ydCOS8jLB/wIC/Ob/0CdhhtMbVYe1MV
         1UYfzXlVJ3PtNa9yAx+AqiufnnK2koh2ixwrWBhN2guOp1rSzDwhx8b2XNfRwvJFnEiZ
         glcg==
X-Forwarded-Encrypted: i=1; AKwUvByNgLPMnlQrjngr3Uf3SSuQjKdrDl1dCS3dZ4ZhP1aOvNNAOPQBRKvpcSD9a6rk6FS1dsL8p9GPI+2TsoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIolYhOJxrAkZNwPb4iIAHHygKXTAmX5YJ5mt4i0Ny44Qi4XJ5
	BLt741ng3VPOTYRwjfQWYz61BccFsdCQwSk86nq/u/oOg923srAT4uUvyd0oxA==
X-Gm-Gg: AYBFou3pfyvkCdqCJknW01HPnhxB0BVckA5rcSd6KbqUpG2TUy5Tk3kNN0HJ4I7FO8g
	aBFgtbSJQPxhmXov2qRWB+vyteiSWn+HAJclm+3rYJ1irF16QTX7BVqef1EZz+HAIn8HFGS0Rg5
	J2BNPNtZ3psQZ4m5y3CCk+UgrwMVfjpI8OO7fCnSrMiqBl+tJTqOTJ8Vpl7AZRDuVm5dLfP783w
	lViEEfm7FJT7qVzOLGu26IUwwtGUfl2MP2ey1ufEtpnk07Ky1x7t9f3JK/zWgDGkCR8BvyAhjwg
	p/hNS7amsM3JOYIQxhtHM8QXzd21UGEyJ8ujKb5xlqe4H91or2GoWz3YhnUzal0m7GbAKPm1/Fm
	eLbS016PQZrm/uIgFZA+cUPjP/EvP9yFp4QifiJJdsW9Rh1CPjVQT/YwHLXb9gqJaJxpt28IdUX
	vJVmM/oUpzvcGmc2k2a58GjdazDxfhBBYXbcUZ0aMvIQMsZiSN3pE9JOevROstbTPSdIfB5MUZT
	VsokbEldFPFZe8cn8LBpzfyumf4CPjWax4n8IYuS22lsZeQnOtzMak8PfIQxNj0LSzaulIVBYJZ
	e3M9eIdw5EGjfKTiYblX/HVmYR6sW/ORUYTvs0wnFCFNgqpNNR8ioZHy36oe
X-Received: by 2002:a05:600c:8114:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a35aca4ab5mr96619105e9.22.1793008665078;
        Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: airoha: en7581: add crypto node
Date: Mon, 26 Oct 2026 10:57:14 +0100
Message-ID: <20261026095727.31708-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add crypto node to support the integrated Inside Secure SafeXcel EIP93.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ee1633f01068..f214fa3a3e2b 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -470,6 +470,13 @@ fixed-link {
 			};
 		};
 
+		crypto@1fb70000 {
+			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		serial@1fbe1000 {
 			compatible = "airoha,an7581-hsuart";
 			reg = <0x0 0x1fbe1000 0x0 0x40>;
-- 
2.55.0

