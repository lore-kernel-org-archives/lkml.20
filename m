Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178578;
	b=idoC2nDdoJjcoVdSV8OmvunMOInUJ+V666RO4ivZbu2aH/82+HvxjtNBCRP8epSLITlc
	 gTunehw1QAvclTq1CTLheLD81i1lUVySlRYDbLPNksO2eOrGQh0LtVGw207s4ELGHyz3X
	 mf/PLo+OiPcNB9Yvzqf0RfntPcfu1PCIwGS6hTOnWGw6A9TkQLAGeqWjr2r2Gzljv34zO
	 lIrGjm6cDnIup+xf7Sc6dDoHXfhgKuBgVFN8Jg2PdQbAiDVgtD1MwrHsF43NJcKoarTVN
	 Rp+BhFOLSEmHamtSKEgUty1l/c3o1A/zlzfhHlNgeh73ppry8eEt71FfpTJyLBA9i7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BewjTbyX3GEekMLgNvf6as21C5aN5VYwWHiBIc+A60E=;
	b=l1U0gld7VtIpqrn9Z5dKYn0ws0xVrwvlBU/6AHLiX34FOQNlooPgpYzZ/TugcxqW2Xs3
	 BcbJY5Rf+J/uHo3gj3mIGk5FpX+/NUNvnNbaMu8JBucWXbNWToGId6ALvWpIW+Wn+/3ot
	 4b9KmiHjTPtzbnm9+9A+8BfTNx+W8xNecZtJGL+U+faVHkTOljst9UuTTEUvED+JWgI54
	 7OsZI+qew7rWc5rHRy25HfCoXWiModfeDmZJI4voeU9B4MsAKgzaCD570/gkCcBVmmf2+
	 LGaWvF//vppEOHlCSbMMaAVqwglB+TBFTw+7lck61vLU1tXOxBfNep/HLowHVFjIFXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MwN1gjyP;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82297606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82297606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MwN1gjyP
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4697404c2bso94968866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793178576; x=1793783376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BewjTbyX3GEekMLgNvf6as21C5aN5VYwWHiBIc+A60E=;
        b=MwN1gjyPXmcKspCiirgv9z7mzgTu1AbED+GSMblLS6sWnpNAerbqESfh2M46TQ0K85
         MBZ7c1ISvIniI60bpIjWX/eF+F0tyd74e62ftAn9C7dZQBWB1ElKj7h0EeN6VpAm4Ebp
         9KKcS5QBg3JxtUIcV0FuJPy+ukE4gbw9qpiew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178576; x=1793783376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BewjTbyX3GEekMLgNvf6as21C5aN5VYwWHiBIc+A60E=;
        b=jZzbfDtzXmB3Ei+nckHQlf2a1X7xym5qxGENp03ZV6+eDM+QcngHM2Jb7kFT+ih39W
         V+xSqo4MicLADTbTCiGbURR/Wd+vWCFyWpqMpZ7gDkoII/wHoASFfxDTOiSRZ0eqmKu4
         L14iWGcsCBzxK8Ft9KByOy9zFosa55CFiFggvnTT0cVBcUIaTHvqDGT5WMYxGatgWWzd
         lSHjSVugKw6wRVOnb2Pymwy3+GkPkkWbTMZ8kEgO7P6kZegF8ACFWhiKPAN7gW02hAeO
         vdcN4qAVcZ6DXkIm26ebUwYgizAx4mcjgE8ANVHTJHVkBwRqGAD+a9IIoavHWh9M5I6E
         TPig==
X-Forwarded-Encrypted: i=1; AKwUvBwYlKzADLYJmhFGQsKRr5QJhWJfvX7zDlRoW+YJ9ymW3xgXrw9sbBOMR21Us4AC8mh3c8OQUwVgsX1DDT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfwjxQnNsWUv+Q7zfYIfhvZ/9pQrTE6Tc2cDS3+66sUbw0svvx
	8yr+F2kn1Kep9ld9JWjIvOKVSC4SagpCyVg5O1ZoLK5ckTgjqWKvN3d1/OuQ6jWQZg==
X-Gm-Gg: AYBFou0Ij6D2WU4smFGfdijd7gQ0Ykr4+h45v38fDZDAiMgKd1cih8PMu4NdKYcWwkp
	tQvxXfuprdVLaxMxpvvZyYb7d2yHwzJ2HtcM17MNtBOv8j1XjYszg6C0bMafxx96Sua6gaI/h3d
	r5HeYzgaGDQfjajjTX2yM0VAzP0ek96S5/esnPUoLYwqJxMMWOgsekhk6OxRNiPMBly/Kr5KDTo
	6nhRHir0kBN+CwmgH9cfEu0o+tIENc9oJbVmpfcKk1h80cw2D15jJKpDS3erXCdA/aO8Lr9gJsf
	iv8NetbAsSvE1FGKIoyiUj1SfxcbIaJexE0J+Mg/2AjPM399XZGt1L+jr2VMmwRPeS+vIPEvhdY
	paRbQvtVO/oZ+UjXHujdo1hBYSaljcpuvKtx00Wz0p4E+bOfAKf4U0+IxH7fbx2e3Mp8HSss2KB
	4jF219OjSBI+vzpl6GX6qLgtoliWNYmDBSxtia2bQra9vnk9Y3P7txMYvSECHcmnHw+oNkV45r7
	DLPfVKTsL+dgNifZQfsgC2RramwieLFsv+d/xszgRoTp2Nrp4K0BQdhTU3bs1NjKlZdUEl1OpiO
	xWyhK79KKLv3Pt38KjPm9Kx/s6ZwVvNnNoB9RDB8iK2jXSeUpLfkx92bfqP8FD2GzZddP6Xs7f2
	WJ/4JRR+E4Zm57TrPVg==
X-Received: by 2002:a17:907:9c05:b0:c2d:d408:5d9c with SMTP id a640c23a62f3a-c49be1b40ccmr129905566b.48.1793178575888;
        Wed, 28 Oct 2026 02:09:35 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c49a50c434asm257577666b.5.2026.10.28.02.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:09:35 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 0/2] USB Type-C mode selection
Date: Wed, 28 Oct 2026 09:09:30 +0000
Message-ID: <20261028090932.27053-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

This patch series introduces priority-based alternate mode selection
support for cros_ec_typec. 
The base patch series and UCSI support was submitted here:
https://lore.kernel.org/all/20260119131824.2529334-1-akuchynski@chromium.org/

When AP-driven alternate mode selection is active, the driver enforces the
mode_selection bit for each registered Alternate Mode. This blocks
individual altmode drivers from self-activating. Once registration
completes, the driver evaluates USB4 capability. If USB4 is unsupported,
it falls back to priority-based negotiation via typec_mode_selection_start.

Additionally, we swap the registration sequence of the port's alternate
modes. Registering DisplayPort after Thunderbolt correctly ensures DP is
prioritized.

Changes in v3:
- Replaced delay/timeout consts with macros.
- Downgraded USB4/mode selection error logs to dev_warn().
- Fixed comment formatting and added comment for DP/TBT order.
Changes in v2:
- Added this cover letter.
- Rebased on top of the latest platform-chrome tree.
- Tested on Redrix with Linux Fedora 7.3.0-rc5+.
v1 Link:
https://lore.kernel.org/all/20260129131928.794768-1-akuchynski@chromium.org/

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection
  platform/chrome: cros_ec_typec: Reorder altmode registration

 drivers/platform/chrome/cros_ec_typec.c      | 65 ++++++++++++++++----
 drivers/platform/chrome/cros_typec_altmode.c |  8 ++-
 2 files changed, 60 insertions(+), 13 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

