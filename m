Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938262;
	b=o1hyGEjxZw6v06Uetk/LR9t1v3OceBUzP8zrcGbo5bZzchSyWXbcUTJNOyKoQPmvZvLd
	 AQZoj8SPhkFWAQ54wha/SiqbvM+zkISUHhO2C5nDdWiszFVD2Q54mimxUsodUZ3SIhnJE
	 NvDt6Rw9UaHB52RorRVoxQnm4yJSFVUL9xRUtkv+UGpSJiJbCGh6AC9Yb3onthUB18qvQ
	 a8uoWvzl9EM2MMBN1uzkfC8E8mZ8ciKNSA30+Q68jHuB+GdsJ+MqlO9jIZJbyUIQ/xTvW
	 0zWNxPltdVVqPHCN/A6EfbejsDryb8MZq77dNIs/N4aR2rOeiJHcqQInW9Mvupu535g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
	b=erzhwsq2sL0rZA3qF1N3CO8KOX9Xva9P7udJ1bvHf5IbMfAzNgQtHriOpSrWLSBOeffo
	 DE3fsUKQiJDUyjCqP8qTpINO61ub2q+DzirZXeRFLFEhxfswbS+MgcX6qA42jY6G8DKNr
	 LmhG0jdhEM9JoMtDlsDM1wrmZ10h3Z4Y/jxPN1d8ndVCe3WG9D4SoYqfcmp5ylGhYrCXw
	 hA3DonY9L01WfSc7pHBkPGxxz+jEsaypsPuVghzGZYSgVJNlqxEWF13gPGYhUuAUggw2C
	 uR4iU/NcVsrNNt7aD2iqAqQ8cJiOfHPZ5J8oPcq7hC15/Hc8kzkeBRHcbV+RQRICCjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj7AoADT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E055606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E055606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj7AoADT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4961925e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938260; x=1793543060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=dj7AoADTnEBgdCyYS0JghCvO6BccdqmC5lzxKqs1Zhzg645SPfsLFi1zmZAndrh5iN
         MHAU5cyNTNepv3G802hUXihBqAVYe+fJKebXuBynMSeauFl4lBw2Si5WzsAIluxEWOH6
         mQmcCyzvI5Lnmqw9ks1ZYZcA0XYcNZj+mra42vq64B5y/P9HfQwkMxJKqcxlSQp538Vw
         TWOWx5Ggi+fNxBqeO+KD3RHOCK5fvcUQPuupzsWb0gQ5kImt1tn0QO9JHNWqaJIf/BOw
         VYfndGweeXhDp4g/L9JHTAAqZfOInNehTUy0POg2+Ri7+OLVw0cjmv5SMt8+eUiOBmrA
         0Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938260; x=1793543060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=W4gZ2RV2m2Ls6pIColSPQ6s/JZ6hLRgiDQIFUNFP12dQ6jyXTANu3pMwgvR4MtKsB3
         rjxMG+sZVsxT91VxMOFdXtB0SWpuQFHenUTxsHzmxn/+pfXN08PTX9/5aK0JWKUYVlYB
         Y3Hh6bBouEWVeGFBAHTnOrlA/DNAGUU3ws50iGbkXOXuT0LWexLxTaxmwDm5eSt1GbQl
         lnO/ZjAzUuvOhsTRowJoMVX7aw1YZpBVd1rLTwQkZHZe0tE0K4+UwHinmlsgel9VhEZw
         8K0hyQx/9H2c5WzgF9AW/gIFMDmMnaDhmkzRkiIlg+4T7hx0FUnEEjiP1SfAemASyiBF
         WzTw==
X-Forwarded-Encrypted: i=1; AKwUvBx3pvGSy3ZvJaR918XzqSOFNlFlqsIw9Y7VQttq8OWjiK+K7ssFMT0afPfgtnlSj9L+AhKH4ODlhU+1MFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrNfqzSwj5zqYbscmdrCfy9OZlgcNeUI22pmwBH5m+HeQDLFHp
	WvJsGrkssbG08hg3PTXeAOjAy1MV9qBhF2Ye8M+7h1mWiTXeYrgzWP7/
X-Gm-Gg: AYBFou00GnoHn2J6n25oUfK1mJEQWfIEHIhCqkcF8ulDvnTkoCfue7lenM2UeRtPsbd
	Ukx68ROWXitX49LNlAArIJ0F4f4Ygh6Z7svJcT55LaQ9tlqdCo8CTGbRlBmvDYC4+ymRjQykqLK
	/U24z6f6M/lEOzorzKFAq7tAB1DDbKK3yUEuVCVNltIJ7Oii/5bRuC+3jj9sKmv3CrT/1wJpcMh
	mmZAY6932dHuqGIwgaDKvfY2TcfsTgDCkaLAisLrt+mSz/bxCxCp4uZNhLJWLQvcNuNCNH95hK2
	K/4obiJleVqzXdV9M/2OCjrvUGZy0DWqmVFRhlSMLQ6yZeTD6vq0s4kokDhBrEFqjxGGeGoGegI
	Us2huiwKD2m57igOT9NShlqZ05CB4Hv3a6vUNj6sAXXbHP3xEYhHmMmBIyuTj2gAW/fQx1fSPW4
	NUnbVYP2zCZJy2m9rrOHzFzeI8fGVWh0QHddRMVmELPzLOrhODCdfo/M84VSWjVxSJ0SXuelFsO
	DFazBCOf604O3Ph5zD1wFdsQLiZYY8hpQoIAgT/FxTClY6kJ13WRgeAgdkW5mq+friiRS/DKvpr
	qHYYXgaTWdb3fw==
X-Received: by 2002:a05:600c:3b2a:b0:4a2:148b:c890 with SMTP id 5b1f17b1804b1-4a35ac45770mr72563585e9.1.1792938260396;
        Sun, 25 Oct 2026 07:24:20 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:19 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:09 +0000
Message-ID: <20261025142412.112216-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

