Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC235F8C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187566; cv=none; b=s+IRYtLO1aktI5QvYTohoRLX44tatS7tP9uVnzbkEZRfCsH2xuxpgMSKrSbg7lnmTmUs9J68fvU34mPfcQRszVA7kaqQWM4v3M+lgv2G7dt1en9/dZaKVETP3LPDJHXo+lsq3NTq3OBQRQ1wDF/WQJPIthNZaOCMETMmVvqqcCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187566; c=relaxed/simple;
	bh=A5txglQ4iZT/juDqzcBtdepUMip1daW3tLa4YrE6PeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZPLlMOCnTn3HwJI3ACfD8tqDEfxLBYYqDnJsMC5dRrkKlAN6jc2BuhJfe+kU9qC8TW9R9WA+4HrZHNcQo/PSztcbQEn37lCqDhKCFf8yzBBbTa1MyWjaSmWjX89FNDI+lQibr4en4MI9qECftjXGHz+xws9fyZLu1DmLWyap0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQM8u/Wd; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQM8u/Wd"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384c94c9423so424011a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187564; x=1788792364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=fQM8u/WdCWlbVZ8LVE0vxPF00JcmSEBPZfGYY0YWBSpLsgEFyPF68PRQ631vkqjEh1
         Hpi+2LO1NGn5r6wHVLFn1wtBOv/5gAs/g52842aLWwhEUUWUI9YVZRzAIco/lDzoAviO
         J+m9iuNkSPzSteF6HZYOTX+zrB/oIe29albZr+z0j9W5y84dr2xBkbcr0xlGzcurjDo+
         9ZH4NLQ59HC0Ljaq+vb76ImdKj6dDfJD9J2DUza0lhEyDhOMh7d4jxBzuexE2S/OPyaG
         KqBxjluA61+rp4kQa36xL+67JwPNPTzGLy3JPF3zQUBI8yqKtDT4m9zKFXCzROL6/p9O
         fBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187565; x=1788792365;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uu+HvTyoamB1lNH1BNuzgtxk99beZfuZqlFooUQxZqY=;
        b=YCpzPqATk/6xmKsz7Gwp3WhmddkoaMzNBZalpskvUVcchYfUl9g7YIsWKUQr7SPZTc
         LZVmJ6tAekhA7Rpp6fcxiRrDPHD5bNeDSppprYpQ+C6UGzS7bL5xDsMZV1mPHkZSUw7b
         Z+qvevTzQboMpknRI6CQtBniLaSx4jZWtsDRsXRVQvABeycFjreAJI13kC75simY4q+9
         VeKTIQy2v3a7W0fsw5fENiwzt1C3cj4rYzDj4iAIaImYH+9P1+Zw5fkJzKQADO1msZAh
         1/vxYFFVNcGTQgxNTl3tb/KmGxN8lWKCsQNvEXh/Kty9wP2/Bj3Sx+vjkgDB5rPs/IDL
         doZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpH/hMPzm/AhhMPpxwxbnc89m4muI/+53DxS+05kc+CC5FtEVITLf9pBNoyIG/rMfblABuYoN+vj0mqYU=@vger.kernel.org
X-Gm-Message-State: AFuF++m4PagWqzpIZoKodTCKXqiIw3uLD/VwV9gqnDUyU36Myy5KUuT+
	GtBW0/p2C/PaZf1S2k1ongsooR2A2bOwdevhZwN3FOP9EqbTzq3i6Dd4
X-Gm-Gg: AYBFou0K8xEsejV4UoXBYexq3fO+KLS+z33UxG8oKDfQKBeUSvtQs2yBKI9L7h9ha5N
	mqO/3zDFUu0oVttBfAjfKBxxrheZDAmkjIEID83GWUf133CQf7XDbfWRJFibqlc2r6xIfCJ4Dww
	sGoaJ4llXVrl80/F92L50W7/dqkUE66KvBAGAJWsFJEX5dK/uyfPGSVPGTpczkVOADpOMj4mQPO
	HctrVgmhmG5iZVfxw90wDvX9HJ8n2VUIcRWfsmEERT2yqemD2TpnuEgaxua8u6Z3kj/kQtTWNTR
	7oEFp/pgBL/0zpzwQvIued+kF+gaxRPQY9q7wymujalqHfNZMtKoyfNUTcQKuNTtE3cptaS5nFn
	P32/UTwYh3MtjkAZiidd5DVH2dj5ttTb9zkzkxanqUkwY2e4GNWaxT73iFA5DD5TuQN10QZpxQR
	2cBy7wZoJ5p2UfT8OkfC02kN+Y3HT1HZ3Z8Aj+ad7AO3JgktwDuI4bboA1T+o7JBDALxoQSik=
X-Received: by 2002:a17:90b:17c3:b0:398:bada:832b with SMTP id 98e67ed59e1d1-398bada8463mr13042007a91.6.1788187564330;
        Mon, 31 Aug 2026 07:46:04 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Mon, 31 Aug 2026 20:15:33 +0530
Message-Id: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIAzA8VcxnK2h4HDz5HsYDwhlI+7DwEJcl
 r27bKcdjMd/0/46s0jBU2TXw8wCJR/90OeQxwMzje5rAm9zM8GF4iVKGD28aIrj0BNYSmYMLSg
 6VwKFI1lYli/fgZz/bOr9kbvxeT9M25OE6/S/lxAQlONalxdbaVfe6k779mSGjq1eEntD/TYEc
 Cj0EwmlwcLg3liW5QssVIWW+gAAAA==
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=1832;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=A5txglQ4iZT/juDqzcBtdepUMip1daW3tLa4YrE6PeI=;
 b=5uAF3LTjxwbIRorl7/hnCp7yFyq96RIEgs7RuXrtj+raAjTecfJX+WAM7jZuoYQBJFYRLlgxl
 N1rT/BPZrX/DPWg29wTgWzLZjONyX8XsbRKmfhqszWfkPSXbw+mVYO/
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Rebased to latest mailine 7.3-rc1
- Removed note in patch 2 as dependency is already merged into mainline
  and there are no more warnings.
- Link to v2: https://lore.kernel.org/r/20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com

Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +--
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 100 insertions(+), 35 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

