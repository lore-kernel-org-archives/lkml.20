Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463655;
	b=R6TU3FhTW4a1OUmTculIUGYLPqRVy7rwvTj0QMVUONtrglxlx/YXcwzP2nUrSkJzV/0H
	 8vgi0b7HPd5d4bTTCnY/TZCg/pvY5TPXfVFenD92Xj4DjyrYO+gMdhA8BEuQYxPK3nX6K
	 fM6PVQ7r+C2i3+r93VOU5GLSusILNqoshHCChildRarnCZ9I6oYiZ5m4bN+q0a6mhcaRa
	 btxkPtbpvXA6vNX0DAOU/WtrsBXXRo6gHRNtuwV3iQun8BmEAMBT5ypa3dUNq2USb8qUy
	 cLqNvrxHqzhD3BPf6gqg8SoST8fX5pav3ohRsxRWoKt2UX4L8jc81117Hq6nTbUC+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=g2Cb/etac8wlDBIYU1jh+mLLXGwBxvgStF13Lf89Nr8=;
	b=vWZCXTAlCj9v9fFKnf5i74bi7t2Vu36qY8ARbhEYlX8nXR3yq5c3/8O/WGMiB4DHzMQk
	 CpKfPntuMdnOz2oDG/S3qfxr9sgnG3w1Bqx7UM5bWEcinrEywR57HRn7k3K7SQ3S4mns+
	 Y0ePTpigKj6DTZ04F3yod2pGqQXInc7Fucis56+H2yCq2rhM1ln2Ze8okTi7wVFdyTjO8
	 cDP779HOqKLBfMLVMPalUrYnSPWw77OLLcaVPfdI2EEWQFrcUmozosW/G7/msqjtTzqlc
	 h7xwdNk5VASoGduqWOUft1SseVeTV6SX0+wqYdBrTFUsQiTTJeG1VDgFhp8LVDNasvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=HrT8odet;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D716D606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D716D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=HrT8odet
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35829219da8so3265991eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793463654; x=1794068454; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g2Cb/etac8wlDBIYU1jh+mLLXGwBxvgStF13Lf89Nr8=;
        b=HrT8odetpVzlG6PT5VGs3+BpnPc2Mw2TCg6Mg62pOqMD2iaJtu7oyWTl5EWVNA/vn3
         j2caNx+/8+Lp3GNYaX+VceHd1d/e2KCUx5TAwUUR3FszFxX2XqWujosOgOT6cLdsae1h
         GfercsLgh5mw3Sj/8kik7Mwiwf+CGKobXIuS39BFjU9Q35YW2pkuv8oumVoMoepbEEkf
         O7PeYKOovuoZ725hkRHFAoQkXaW4gbxtx3yaE3Z9auJQ1DEDk2mJQY/lPKJjPy2vXXpa
         SL5X4EodUqmzJ7sd4vOrHJMev1V6isTUFdZ3hNMbTy0IJrLIUgsk/9vtlOWPnTqaSRNn
         cMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463654; x=1794068454;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2Cb/etac8wlDBIYU1jh+mLLXGwBxvgStF13Lf89Nr8=;
        b=wO7/Ih+nVgYrx1Dxs+pB6p5M/nBzZQSZ1K/nEpvidOuAkPtMwciaViPC5GtLemeccY
         SXCHL1o+JierVSH2bMm+OlKZUIJi3wIqlxYam0iGBYKeC2Bf4IMfGE7z65lG9oewkfFQ
         6d3Eh6zcVpmXYKtzcD1hb2yBk5ViVnc9AzloWwo+5TXqks4ZyD65Y35RhrV4gvUcdZdm
         7urIptWCsPBlhcqvceBWVlmNLweoefibvsyKg8VHEWCR08kBwEi+2zBgI4zFI3SO6RZy
         fugAggVAyrJ2UN7DhADRhUmx0fkQnxl0JEkplwF2oUHfRLcfbatX2+45QMC9c9eh0256
         c9Lg==
X-Forwarded-Encrypted: i=1; AKwUvBx+ETWFcHJhI43dgg0/pghhPPXd3RnOlcwG7yPtzT/M1b4B0/uyciAmIEMvj7Q7ABx85y9mcytunIwo8Vc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlWIH0QbgBzcXeiipZHCVFbl18ZiXTby9Kdn6I6yKcwlzL2Eo7
	RvPYzogPKUhR9Ybl65gvs56oQ3e5Gxiw0RqjE6ZvYqiUvhlAjW7ilLVsKTKwFMxq20nOt4WBLPo
	7cYroers=
X-Gm-Gg: AYBFou3iGMlOpofCnGrg/3HoK97HboqXDn2WMgIvkBXHptcDSL2lsC5mDX2SbPj86E4
	K7fchUsPF+U8CdWg7bdLmTtUHcdUxDQdXzwbwAS66LIThsKypz+m6T7vyFIlkXOXouWrl9moaAh
	YhKEABAl7rQgBdQVTc3iqy23aQbCP2f8B4pQ5si+1qunWU5Kh2EcvEh1RYIKpierX1njZN3//2c
	7HmbzamyjBgPLmcX1XgWSidwLQgY0nlbEAiDgCHrB9+BGqrjikdKvPNQcTpDOVGuklw1AuTvH1f
	oiUS+I0DsEjOl0tobT0dwp6o3ozpMrCOZ5qOvYtcJtUFpZQC1aOsXQMjvUmNl8EEBd6OoQZwIcK
	DFjkevig6ifO3w+x/bVFlhz6jRbqNSSF7s45nrGJcN+QeaLx4Jo/qTnNB6Ew4/Qx8JJzAtCTTfT
	hrsD4j3m27VtJU7EjEIdzQBzw0RRpn4NEcxYwofcFkeKxZ50cXbzMng58n9WDanUs4i6whJjwTo
	QjXxMQqT7TYqNJIuxehFO5W+7OERLqGsRydKSqDA2sn+MTWVMtqK9YhWPKdsoasVu5I8lu4F5ru
	KrIfRwU2KcDiCwvwQQ1bTb4JiCA6juOE
X-Received: by 2002:a05:7300:f40c:b0:351:606f:2832 with SMTP id 5a478bee46e88-36a42340896mr6792581eec.3.1793463653805;
        Sat, 31 Oct 2026 09:20:53 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm19185195eec.9.2026.10.31.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:20:53 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 0/2] nvmem: eeprom_93xx46: add Microchip 93LC86C
Date: Sat, 31 Oct 2026 09:20:49 -0700
Message-Id: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBREr0L+2pr2C7Rl5T0Mi1q+UqOUtEhqC
 He34AFcTV4yM2+BSMFRhKZYINDsovNDBjwUYHsz3Im5LjMgx5pr1IxoDP7F9Cmlss7xtKq2DMu
 Ka1l2SmkBeTsGurm0/17aH8f39UF22s62Ru/i5MNnF89i6/1zzIJxhhKlFsZYJavzQGnq/Xg0D
 tp1Xb8DFr00zQAAAA==
X-Change-ID: 20260929-eeprom-93xx46-93lc86c-2450974d8891
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793463652; l=1343;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=nQH7IYxjQWl0Uk02L/jrD7c/Gl/05Jhe9uifT8TFwR4=;
 b=72t8DT/c/usG2ziXfMJNTCYDejYOegwChuxjw1l7+aVoDTE31eqcHHFF2X6tlGJkQR6szJviN
 e6gOMH2iUOUBpikuY9Uqq+c+tHuCkJhLSP6UTvWXHr6h0keVBTxpgWS
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family, 2048 bytes. Like the
93LC46B it clocks an extra cycle out after the address during a read, so it
takes the same quirk.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- Rebased onto v7.3, where the driver moved to drivers/nvmem/; subject
  prefix changed from misc: to nvmem: accordingly. No code changes.
- Retargeted at the nvmem maintainer.
- Link to v1: https://patch.msgid.link/20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Cory Tusar <cory.tusar@pid1solutions.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abdurrahman Hussain (2):
      dt-bindings: eeprom: microchip,93lc46b: add Microchip 93LC86C
      nvmem: eeprom_93xx46: add Microchip 93LC86C

 .../devicetree/bindings/eeprom/microchip,93lc46b.yaml         |  1 +
 drivers/nvmem/eeprom_93xx46.c                                 | 11 +++++++++++
 2 files changed, 12 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260929-eeprom-93xx46-93lc86c-2450974d8891

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

