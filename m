Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC4453A29
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604852; cv=none; b=uFgxsom6cFA3Mh3jKUEs1kqUJ0rdqTgUvP90RQ4U4Ryc9b20vS+aBwlGiAk8q6V26nbqAH8bEMXvtWWLJB0A7Des/gF0mAAc05Ip+LKuAckUXu9hsSgBeaaPHGqozc064MGW/EuF7bOXmREpyG2H4xKdQOV0lehc3PH/gyxT6Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604852; c=relaxed/simple;
	bh=n8MTfmk5Bk8TVq5h3Z9+kGFuVYYk9uNwVRtMjpHyoJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U3Kf1INLJsq5gqoJ7f7be/+Ljfw6lKAKVRsobJ/k6LRj4JdjygpopZN/kDSgcMY7G8esEWh5PVFJIzTf7zLVBE3XR9f6N0ddg+UtyetUZTyT4snH6/6AiOL9b1qcMFJdmK/4gASPZmMRLv5vABnfSjBlUbA9ZrGQoSdof8241EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSWSaThX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSWSaThX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cace91f112so16016605ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604839; x=1789209639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVuDGeu2dCqMa2YzjKmQgs1Ad/SNgUGsVx/sRuRzCYI=;
        b=qSWSaThXjq0Cpo/rbmOXc2yuwovwO1tkCkjo7OXIrMytgvOsHjavlgyOgeIBlzANzI
         Mta6WZvDlyMVDdiJJw9WPeUFrY6ZBHowir3vy9RzrC2pbCQRUs84j+1IToJK5olefKci
         lIvXf0oX5mjcfEYDSieuWTco9boGiJ+6B1RfQrvyCkdzr1XTfcg1l7rL6hjOTH70Pobs
         9rhtwGfYY0MV+K8kHpz5L78GEDiteix+SjaSmWZT5zpoq8DOs/+9LsykNXfg83KuNLMK
         tu/cBIU+oiKtohJKlvnWUYAOzP9ncxs8FBw5+tlXaFA01A1uUcBh2Y5LfswEiydNJexB
         4MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604839; x=1789209639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVuDGeu2dCqMa2YzjKmQgs1Ad/SNgUGsVx/sRuRzCYI=;
        b=hGzxiEePZj24MraFxnOq0isyJq8fr/i0PyRr/+1HFI6b04L1eaAS0aZVeEbGk+X3uu
         9Z1bhokVu9psI2jsR6ABqB/zOkNpkB5obGg167r/JCPe38XEiP7WpQZmEgPcfa69wA4I
         XvksM6EMSlVp4OledlMaEgB488TemITpmziDfhiUAmWS/A2UM1BnM1D70Trk4mlQj+H7
         3kkTC2ATtoOSjn1Qtnhht1bx4gSYv9KE+c+sXGeYaE1hEWhJSHd/O3ScjJU6HWiI2vpr
         7yLeGEpqdP6alDRNLfbfmQb67wZVukC9JHIzxi3CJsTgQ3PCcfcIkjEGUrLTOpQxWvzX
         JW7g==
X-Forwarded-Encrypted: i=1; AKwUvBxFPYjGNGy7wzpjaz0uMcvV4X9FzbedS1KvsnEmlnDgGDR+vNPMWmBgkbMGFoZS5zM7k5G413hBj9+xZf4=@vger.kernel.org
X-Gm-Message-State: AFuF++lG4qTSjHEtHI5RwF0ygrPyYl3jAnPeBhEcyill8q+WeaZY98DR
	IkNSKHp0iu2daWauIvL3kOkOy1MZaSwV+64AblmRlsVLZTRNydE2SIRE
X-Gm-Gg: AYBFou3jF8ZARHvEjnBPsnTzxjHEczX685hygZcmXKqM3Sny3tjFDud+fckUNx/hf4U
	BWTSWUuaKyVqTNGdKAAbLMIDHIhfG3ORx6UZHAxiWuXdM7Oas6bj/gdix0+Mi9cnXZWE7v8AAli
	RvuoLVEFXc6UgNYtyh20wg1MFjDmRk/6iYDuNAAxbnBGBbRAQ51E+m0nt4q09G5BCN5zV6HrGwC
	4USJZpFOg2aiOAGP7KvCoZ2VN8bsUR04mvOWe2Aqm7zrSZMkQaYe7FvgAJPcanncV8d38cV8ECW
	KpB892mIeCHTc1LybOry56VQfopzIirPgooc1JTdIY/VNf0vCtCyveCiuBP3arKduhyZY7+To2b
	BnH8dSf1D6PAWsdDGzWDxmL2mFVfzG15MqmAjBFe78kZUXV88YFzcPlOvJ9ElmsJUheVzxcch7f
	ViOrjKr85pK30wMRopeiOSEH4uhICuWsIv7vcUFx9m3707BKoXz+mQHiYXdh693+Uv
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr17247807a91.9.1788604838921;
        Sat, 05 Sep 2026 03:40:38 -0700 (PDT)
Received: from houminxi ([154.197.57.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm13559776eec.19.2026.09.05.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:40:38 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next 0/4] selftests: openvswitch: pylint cleanup of ovs-dpctl.py
Date: Sat,  5 Sep 2026 06:40:22 -0400
Message-ID: <20260905104026.3776396-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the ovs-dpctl.py selftest utility to pass pylint.  All
changes are mechanical style fixes with no behavior change; the full
openvswitch.sh selftest suite passes (17/17) on this tree.

The series fixes all pylint warnings except 10 remaining C0301
line-too-long warnings (81-89 columns) on f-string constructions
that match the surrounding style, bringing the score from 7.66/10
to 9.93/10:

  patch 1: convert %-formatting to f-strings (C0209)
  patch 2: fix miscellaneous warnings (unused imports/variables,
           bare except, superfluous parens, etc.)
  patch 3: add missing module/class/method docstrings
           (C0114/C0115/C0116)
  patch 4: suppress framework-inherent complexity warnings

Minxi Hou (4):
  selftests: openvswitch: convert %-formatting to f-strings
  selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
  selftests: openvswitch: add missing docstrings in ovs-dpctl.py
  selftests: openvswitch: suppress pylint complexity warnings

 .../selftests/net/openvswitch/ovs-dpctl.py    | 425 ++++++++++--------
 1 file changed, 245 insertions(+), 180 deletions(-)


base-commit: 9eab111e765729e93087ff86a2ec9b2ae42d0fa5
-- 
2.55.0

