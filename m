Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AF2F532F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180581; cv=none; b=L7qmJzMDL6qKBWJqqw2miYkszmMFBKt1f3IDlwzx0VHUH7AYNcWo/9IZppkwSevcxQNCttCW5+TslVYYeuY0/LmvgL1PsxK184lCgkJlgAKIgZmjiW1Y0Z4nZdU9Syvt2Otuxn5uEMeKdoArKYlcFLCOt719EAkgWaGCU0XBYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180581; c=relaxed/simple;
	bh=VVIM94Wfr6ZD48vItyeNxjOfk3dCFOFp46+YgqOejOc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PbxlTLFHXSO9R9uDt3fjXSAxwTnctx8Bu3SklfbeSrWtjGM/3haDOEq0Y61dlRvfD+QV0BinWffeS37Dii8pfn93CAtIMwQHsvNpuy5wZr7ZrceUp6EocLqHnOonytyVveXt4ah/wt3cquwPaCaukhXDi8RKtNtJmpscVet2v1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNhov94+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNhov94+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so34527265e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180576; x=1788785376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=mNhov94+e6xJRU/2pOpRwGjZNlPgCvWQeEECRryth436MqqMHNVBKjKhW64et8zSRM
         XJjnzzrB4rS1cYg+AquWFNFoBwnzrznazvdt2QDGCRoRql3TGCDMsADItjShLSlzd/8g
         VmLfSVIPjHgsV6lKI78e2Gwcv3FkisoJfsSHc1eqF2c3/LvuhMZ2yahUCxHviLygiH9A
         t6dv7DmVS33F3AHcqcaMcuH6BL8obFSfrcLwT3beuJFLyWaqeyC96DbTHjaUWqM8aG3w
         i9szZz/MWiLqTffqi5xg5gXFUyjuHadzIwXpzxWBzOXTLPedu0kPni5ySGbYsGPFMyI0
         Becg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180576; x=1788785376;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=oLQF7fe+5uOpbZ+WYIQSUsqRz7XV1hyq34e5xyjZbYyL+OMStR9PE1vn5wy4VxS8Cf
         uZ2FBXT2AITx22F4+LSdD687qlGh6umBdmETKfX9nT+TPJJ+ieKVUWMySt8fMv1Anojz
         6sxISWtuzPccSHf72AMBEx/WZpvH+J4BqHGLVOIUFmhbE76za8oQWL7pUnTNPZTLlv2s
         yTViVJjxh/00haK2NsQCw4waWDSBKYCtPc2E6wFC9+lMaygiJOD4S2Rz2HZYEpmiH0ke
         7iGy8RBMS3hMJfa5AsnPp8GIDEms2ypLdad5eHGHs14BPDpxU/tSXfa+z99DI1L7WuK0
         WM4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqqnbcRcq44A6ILmqpxG6rH6VPm/BuQnjzDlgZHXMT+q8QJM3d7+x43MsanwM8WNZug4QuQaTgWSOL/9L4=@vger.kernel.org
X-Gm-Message-State: AFuF++n85DB/06yB/L2/zhDQMA28PnH4Hm/WR+6akXgxAKbbQ9UTareZ
	Kg7S2rq9LZLbwqVNy+ER+63RbH4uaGpLjoX0N9+YvhoeNoKQC/BPZXL1WTVnL96ZpHw=
X-Gm-Gg: AR+sD12pLjtXoj4TGoemh0bvVucLb7jDr+WhL/d8Bwz6hbEnG0rr9Z2tBF8YKYB3J/Y
	S13aDmotGY75Fe2Ly2h8PQfGhH78b21GHpAuo8WKDaTB5AApUEIf1uVUU5SCRTH3L+xCe9iIHsb
	j1JeYjmWhRvi2mjH45YdjkCMUP86AWvlm2waCq9ruTf7bzqMAOxs4exguIjH5PVnD9g2HIwOOJA
	3DoMItC3RYir8GByFC3xHteyRb5MBKhQ0qq+K1Sa1QzZRfc+qo3y4NL8l+a7u7sfiyoR38q+fRV
	9R1Hj1Immi8DoizgmldUfEUQJyskVy9Tk3n810X5FPlSgclZmG7i5HXl4Ookv3DGVdOeWfycAVq
	f0+mv5NmwkAJWB/tjIqJuCRmIKc65g0pfkoCgyN+6ialikohPpEV0xwUQ0u60vIr1qXOoEyh4Lg
	n8j4Bk7z8RHuTcQGQ8AzIlgBe2c6EnfwgDZ2XyNV2aAeL8qaqFess8Ih+AnEo23z0E7BA5poOco
	Xv75xUbHA==
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr203606555e9.16.1788180576048;
        Mon, 31 Aug 2026 05:49:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm164736385e9.3.2026.08.31.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:49:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Replace spaces indentation with
 tabs
Message-Id: <178818057398.2326859.6686364977974372286.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:49:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sat, 29 Aug 2026 21:39:40 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[1/1] arm64: dts: amlogic: Replace spaces indentation with tabs
      https://git.kernel.org/amlogic/c/6b59171d0fe541438da68c19541cd2f31c60ac04

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

