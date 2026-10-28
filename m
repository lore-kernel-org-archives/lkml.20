Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184159;
	b=5e/UVKvnX3QMTPeGx1a6LLSLsiXnJ6aX4yiC9KPKN1yBB2HvuymgUkIWvTl9e1aXRZIj
	 lcpx22bGo1ETPYn3YRxogY5nURn1aapvNV1dEPPRD1UGNDMsRg41jk1FEkAMApTlZe6LT
	 p8VWdut+JE6Fh/TPfQ5DiqMK3juHyEyXg5M7O4cLrmPK8uIJ4qGTHXEwQW1cqw+/Wq9qy
	 BndERd/MgSJoKCOR4n7kgQ+VVEWEAgoMlA/I4VVO4GDgXuzdMek80rIq6u+PxbnZKzUwf
	 /kl06piKiAwYXbbs2usEWo+CqPVDanUL0k1OzesiIKro9Jv1FusZms5MUmxYcX25Eig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j5WXt17uDzq1S69vehK8pYv6NBrvwjOvlY+NLcQB8So=;
	b=EG9nleP6k4F10A3IkbETNsE1GQhbClgwJB2mx0cp7eaOLuF4NYzujrBhvEnrgds8tw26
	 UKEszQUTmCoUOrcM0YiLajTs1aFxyoaI/O1hkaMyCQPfKTPvXrSheXQjVeQz2oNZXI05L
	 3BQpLKgCGAHD2pGs4ysOKLUuSkR3MI71E/XsQ5R5Z9ewvvn02yvZrBKjsDkySJCpln0xl
	 hmNgWjG8FsmUOlKUvEbTOPR/18FP6D2a3w/JYgr3hnWadzonyR3M4jKe3rGq9UJbQQY23
	 a3fPfi4/p7cZzSA2AtOz56XhRnaOvwLlzWqed1rmXTC/KHxrXrjzEfZ5LTWYt5+7Fog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtWBCp0B;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF7F606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF7F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtWBCp0B
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso1193020eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184158; x=1793788958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5WXt17uDzq1S69vehK8pYv6NBrvwjOvlY+NLcQB8So=;
        b=jtWBCp0BJ76y8q1zrvKeCRWUioNxaauBwIE2cYcR2PiPZdq1IysgYV2kTZAT6eoVe0
         YjZAIFYpHUd/hgQN8MpALrsqTogiOqgAvBi2fAhQmOgpr69J1maFZBDWJhcxeul2zJ9f
         jJeGg9KsoMzwX1HkiOtmuv0elG+rWYyPdpFjfXEBhq7Sik6/d11nvOcUifQSbuRnS/Hq
         6nHorml8BEk/iZL6Y3+pbuO/c3dcFhrEy5DSGVNP19gizA/lqs54QNSm5nmKm2FiaxFz
         p0DM1eMZf9FbJmKs2Zy8pGvQUftNw85tuKikUJY5h/YnH+ibxHgfaJUiEPF+Udfj/RNj
         nCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184158; x=1793788958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5WXt17uDzq1S69vehK8pYv6NBrvwjOvlY+NLcQB8So=;
        b=qsQdq8cIhExZ+3034zafzpYOD5vktA2Uya+MjqQwI9JAMIO5sKLdxR4M+CIpX1Jrmr
         14Cf5cApsvYOlf4yNvqWfUitd+giLeuygz/cXQXAnQuCbrumJMHwOeoK1eZSKcB4Ptnu
         WDhq/HrQXcFXI4608LnDRJ3zxXAP3dFY8BGrIfHabQUyQcBGzxh+x3kJ9lVSXnQhdDV4
         S5l0pwMNAqb8QgDYfyZ1Fc7g2h3QM/dg9GJyFjxa1fhpaB47KEXbVkJc6RfCcDAE57Pc
         gjrQDKoUFI9WN3bAJht2uKH/pAgw02RtOoNOeBo9nAOrmZ/b3PNJX7EZa8SHGIrzLzRP
         2iuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk565qTA4J7oDbzemxqYjl7V0CKCdE0HXwZSUvSg5uyraikoY/RF6zpQQ2CxlaFCDdEegxVkqvmuSGU9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ5YQR549PIcikyutSSzwGUCPTDTPvjNFViTdpv0aCzpZ9WVof
	CpGGEP9PS/fD2PSbG2gH707jNGXo0BKqxmQz+AMC425/UnMS2X5T9OBy
X-Gm-Gg: AYBFou3Y8x1H50tY8yoj4qqKuV4Li40ysLhwYe0v8ZZfyGOsuZ/yQC4MqY5T1J/JYmh
	hc9QPua3O3uTm5gQskLJJTeiS/gRcYupFlc8YryxW2U4TWbu1DAfzsXCYgB7GEebVR7/h3rBBcy
	Cybw/RFf3N6J4PHeqrq6/3VHUtwU6BZgZf+2b/UbuShcW10J/cFmmNS9N/69m6GFS4/CUX848VX
	XUl553X5LjE17dOSxlxyJYrAc9UIr/Z3N4RJap3oHurpb9Evy0vey3XYJqwIINKkKfp1jtGnxZv
	uBbX2DvDrqvetQrryontJHyvL+AS0uGKVNfpGDl6ovAk2kW7qUJ45eKdwSYs9f76+8OJvv7ByeJ
	nlwk6abRk9D0yPGeiCA+jtMKc/yt7IqO8qRKlppvGMfNTzpnNruh8P1ePZoHl65PmmhjVPq/DSZ
	RHhWjzAxqnE6L6MsvRgsrvFVU/Uz+X/HuptDEk94zcCL5clihboKAkWVUQhGI7F3PEL9KV/x8+1
	7UuJDvJCcLSM4XoraePfb5WdGXHYcrMuLHd2XfSuZgI1PY5hv6vuIdeeFuFbOl7m25R+MKnal7Z
	t7uP96o5F09R0ozbUlM5BJfUy2uVBRpn3W39aJxc3cvnFnZK0hKg8nnfNwpZv1w24eAbVTia/Td
	9EA7iRyZwI2dKLbT3F+CH8zxTeARXYsUs5J/CCcHYwTQm47GFCWwxXHy4GnWWAX4CAQ==
X-Received: by 2002:a05:7301:6189:20b0:354:1db3:674e with SMTP id 5a478bee46e88-36a203cac0amr2845604eec.6.1793184157981;
        Wed, 28 Oct 2026 03:42:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7531469eec.8.2026.10.28.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: img: Fix clock leaks on probe failure
Date: Wed, 28 Oct 2026 17:42:21 +0700
Message-ID: <20261028104223.27007-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

These patches fix clock leaks in the IMG I2S input and 
SPDIF input drivers when probe fails.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: img: img-i2s-in: Fix clock leak on probe failure
  ASoC: img: img-spdif-in: Fix clock leak on probe failure

 sound/soc/img/img-i2s-in.c   |  8 ++++++--
 sound/soc/img/img-spdif-in.c | 11 +++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.43.0

