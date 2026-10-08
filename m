Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A044A4984
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466864; cv=none; b=kws8vF1MU2KkEyDSWPjaoqoL2O40p+sZ0k2XUGPXfN/E6PBzoloh+uLT6mHBf3wWyHKLR0nIG8SjGNMlRJe03y9MhirRxDOAxrQup+41/Nkhb9IW1OL5QBRLV6/SL2u20WVSB9Z7x7n8rZOATfMxtkvefSpW4NFMFrKatkTT2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466864; c=relaxed/simple;
	bh=tGHlnuHJTeWYIp3qu8tuwMZO4/6oaJM9tZydKrag+ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzIN+Hb5w5/84fV6ZLPFMQbO03bSUd7SWAtmnuL/S9n9ICtsgTRQ1B4ZZVUagmG/WzAeqOzOFJs1Ui+FjytvLbnfzpT8+zep/w9ZQ0heEXbbkk8l0E2tfWVS8CtMRKQu1KnVWR+4RM8g/0Z3U2F/i30YdrrnLPyI1O/tOjocJos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UOHop8Og; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOHop8Og"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e5d08214dso752979266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791466860; x=1792071660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sO6hhrGRCVa8MIRnUWaS8QVh61+fWOXs6meIqTfPD3c=;
        b=UOHop8Og9IO/cfTdq7iITP6GisAk/jSd70X+wPXDTvQ+JT/G6hv3hcFGF3JqQ0foRj
         6SuOPVIkGhjl9jvAPS6YW76rzPGyXVM3GITVGr1AHPmWpGgEB59Xhv3tp730Ex4j78Mu
         qOroxwqHzs7O287XUrb8H0IyOaMrFQH/2E/RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466860; x=1792071660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO6hhrGRCVa8MIRnUWaS8QVh61+fWOXs6meIqTfPD3c=;
        b=Fxp1k/aK1zHzXyZXkU5vUDzBlylFQkqj6Dx7H7e8RuGO/FBS5ZSIz+unvjWWNN9W9q
         Ah1+WbBao69o7Lq8/Tu0XyaT+/+W9RODgcM6p96McketdAQo2HuWmrewtHiscWYwGVPp
         G4SNqK9T/0HCHXJpnbDIKlhx/4CT8YN07FsbsR/H/jBCR1hN3w50eo23pVOpvE4tMkoX
         5+543MLC5sj7O8dKFOvaTcPY7JyjpdI8qaF5KwJXw1vJYAdW2oHiDfxcnJOxKeUBrNRm
         amv3KCK0cfvl1ZPU6mT0Ax7NXXL0R5FOZIXayXLm9fTNzWB/kJD8mVT52XxstpkL1Z5j
         zQGA==
X-Forwarded-Encrypted: i=1; AKwUvBw0LdyY9Xp6Nggq7R+fGuPpMiUuToeXnQfTQHc81F6fJFLXswGIkJVCSCXEVq5u3x4Haj716fwxsxQO/LY=@vger.kernel.org
X-Gm-Message-State: AFuF++nZWRUDyAMr1MMpKpIVVp+aMxsDO2Z0k6c+TmRWVECIyg9nqFxF
	2WhwlUYvD2WODYgtc/Cq2vfR4ygS5eIqop0HscwYMGgg9a1HtM6RWd6RDxgtFySfZA==
X-Gm-Gg: AYBFou2hQJfBGC6dipwbkrbmU9JqDec785nTN4qdM7JvGwEijkEH6DWQYI1mRXSfDB7
	JRAYyJIWTCmJQnClZGLPhfEy2F+oa9qe+jBGilwRvBRZUcgABkkz7b2Y9r30h946N3ff1AzWEu4
	Np//6CZTmktk6F163Lmwy11RVeBLsVj/T/3JHy6wUT/cX7Nts+HsiIj2c/Y9yPy5yBOSicGrJLd
	QtgZpuFYE1CXlKX1xxPOdZRFR/vVawqKWqLAyI/ple+wCq0387AOBCXD5/zVszN25dhUG9BRss+
	DtoAv/Kb9lzP5a5rb3i7xPgSGdeDhSyDA9752jZjpsxTwvQIFri1RKzMltMnBIASrdJvx20OTTG
	C1WBnnVQ62DFDqzWbE0gSNlnBrk58j/R14qEJ+1WQcnUUpaVeSurPp6fMpk5m8l4eZ2gRghZn9+
	5ly253xE5Eac9XtUli87OuLJXKsnTK8uZQheUNhch/Zr7cvANfTDsakDkJmveBrXbg2kikE4rye
	nNSDfhX993idWXpf9vzAUHgmQA8IHLgnV5dIMbeIA==
X-Received: by 2002:a17:907:3cc9:b0:c2e:7da9:6e6 with SMTP id a640c23a62f3a-c317bda03f5mr518485166b.11.1791466859972;
        Thu, 08 Oct 2026 06:40:59 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c31a0f4a144sm1035166b.35.2026.10.08.06.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:40:59 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/2] USB Type-C mode selection
Date: Thu,  8 Oct 2026 13:40:54 +0000
Message-ID: <20261008134056.3816556-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Changes in v2:
- Added this cover letter.
- Rebased on top of the latest platform-chrome tree.
- Tested on Redrix with Linux Fedora 7.3.0-rc5+.
v1 Link:
https://lore.kernel.org/all/20260129131928.794768-1-akuchynski@chromium.org/

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection
  platform/chrome: cros_ec_typec: Reorder altmode registration

 drivers/platform/chrome/cros_ec_typec.c      | 61 ++++++++++++++++----
 drivers/platform/chrome/cros_typec_altmode.c |  8 ++-
 2 files changed, 55 insertions(+), 14 deletions(-)

-- 
2.56.0.360.g66cac248cb-goog

