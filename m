Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAFA2EEE84
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791757362; cv=none; b=okjlriSyIsPIUawel7HD11X4Fcgyslc7uXQkg6qg3nVsf9yzfky7jg1/VOSYtGMocQKl62L1PA5AHYV19G4Cp2oFR9WBEweIfrieragBL9VWmkv31EO5zCQFCgL6L78w7PaI+1MFh6vZzNhaMzRf6TU4Dgtja3ROvpP7dE9tYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791757362; c=relaxed/simple;
	bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UzfqGx4snj41ghW06OXq8JrDkYlZPOErOtmv5uZJvL5jE6+2LT3Z+g4mfxl8qK4eGsjHwPhK84Zt8IZDJhQs2XPSdCDRH54OoWZq2MECtxFx5JK2AQEKPZ5I3BEH6QBMu2PanuAlBOHWrS0lBFgYv6RijCVrYc512HDEvRO/pAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug0LVC7V; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug0LVC7V"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5339173489eso15155051cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757360; x=1792362160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=Ug0LVC7VrOFkDNMiNM3DBXVcXAhg1cX8nD9c5vpSvhrvN81EFH9qWNfhIc09Fr9jPt
         +0Knqf8guwmKwqzFUPk0C3WXzEq7Zx2MGnX8u/RDnrC2+9dwz9Bjr9TEAJQeZyfXXyOr
         nIs9ebbdOtEthAR1LlL6di0CtrZMG1QphZkhQkbisEdXFa+Ab+LV/RF9tr1fOssrdGZu
         pcf2GBSHsCx3siTyuOB2Le/S2leeT1bXflXMaLexIKs3886CG9Pd+hgtzMRQJ2jtkUDc
         2YcITx7fSoKMT92qCCoo2RJVqfwmQfTJ6tTzRa6jRIuMVEDIALERhrUHNYYjwFDuXYZ/
         mTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757360; x=1792362160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=La/ieZ/qKYYhg+oZ2bYf67tabUsqBJwoXJKV7HlkPKS9LOqOkvWYNZPypRJLwJ5ADH
         uw+vnAvzIQwsbQLOWkBUuTu9cnYQs91uisExirIZ2jmuJOtnjBKjIxB/cmLeiTNjYj4A
         ywYvEjehf/UI9zdLwu333jjX1KrPOubHywrfh3Wt1TEkXvPU/8ZV6GzFrK7MBNuvfylt
         E4tw7vErLm+j1E/givemcreuXWEhWzxPk6BlW8kPeh1eb+Byr3kSDHRcnsTJL3ktKIL2
         /qHR2LGWhjzSVrLu0Ph0XBdnxMnFlXbxB9ozJkL7UItuSjknVfTPhHwhG8BJwwFeYJZ8
         K1Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxih0v1laJTtOz25OcvzZBkgW/XLY0sUucUWo5VUpQBmWXRYy3CT+JtMsgDDNfqlWU5ZObMiFMHDPFNNs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkXNeK5T2dz9SXacPbeiPi7+dsuG36ULF+DZxsB5GKVr1HNYSO
	d0jKpCxqtColj6DQhnJypQoApTPfSzP/B+SROypwjn7oKRtOEkbonD4=
X-Gm-Gg: AYBFou0O75BgLMfphoFCP2LWualthUDwq558JQzlmi0q3oUinlZZmaXbIQvIAQH0yFV
	xUwseLafCd8xWO6r2PRC1XRZVZcujTcvjjxu0dTJkVxAwohw0LYqbjMOueU5GZ3OOaAagaH3MTS
	sCFe0fjBVk+lNru0WnE6YKb8bn09dNy+DO8fbZCLnKmwMPs4n+CnODkOgBapXzkzCqsLhZH7Yxa
	T5zAEXEKn9XqcbBo9AaaaAFZoeQsJ1e7NDiNeKjSL8DIrSZV8sazDokXR9qvKP+FKZRciizALmY
	YcG8/Q9RATH3dfI5iD4OYvGT8WPFQd37M/Vm0ZnQaSzS8J0AraalLFd2CRRbndatH/WlhEahkgi
	TgoeuZb7eXLMV0fswD/D+aJsAlmHQg/LVQKn+ocic9sQF+VSL74IiCzaehwERmrPnaE/pVR8oT2
	LarnR35YHQUZ9stxSMAl9Foqg+dsiVNFDS6NOZOXWhlyHdD3u2R5Lc06kDA5tDVDwFnyyATFWRP
	q2vsbJoWP7Yj7VPNlZ7a9Mb8zQJuaUVj57ggVC4eOWACRUquBZV94RLcF8qQK4m9Q2GEVxKy7UE
	ZWH/En7Cf17YN/1h+ZGCOeEX3c+IzWjtMj/WAmw=
X-Received: by 2002:a05:622a:610f:b0:535:52c:a2e7 with SMTP id d75a77b69052e-5359fb8f85fmr135936341cf.44.1791757360176;
        Sun, 11 Oct 2026 15:22:40 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
Date: Sun, 11 Oct 2026 18:22:31 -0400
Message-ID: <20261011222234.2098904-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The AFE IRQ handlers access regmap and PCM state. Register each handler
after its inputs exist and release it before the final remove callback
or managed component teardown releases those inputs. The mt8186 patch
also balances IRQ wake settings on probe failure and removal.

Compile-tested with Clang 22.1.2, W=1 (arm64).
Base: 238650ef6c7c7cca08e032527329424c9fbd70e5

1. ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
2. ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
3. ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime

Assisted-by: LLM
