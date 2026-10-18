Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B63D9667
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332456; cv=none; b=mSkU/4S6+7kjIMbFD9nFZV6fSr2rrplUFGqbSWr/nWdnn2a7Il7F7d6xM4NjBnl8cbyeiNLbis1PfO+Hg3zMCsKl9qoxGioIxf7NVRNJH/vWmB1FqfYq/aTber6atEGMLSIehxHXHEq6JoTdNNxOsH2EWHwViYWbuYxiBQqjAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332456; c=relaxed/simple;
	bh=sG/qybcCIt9sS1/40Xikj+LWoyMn9kRRL1Cm99G/VMg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V6PkMurkOiTQeFsIcWgHRkoNQji13XemaEX9o87Q74CwMk1jIshfrfMJ9U1qAyvuBCky8PIAk1JNc6AJXv6QrruaNvyjTr5N+nFI2IkvVnps2nmzHutTqao6lGkgVdAWoF0T95K/B5wuZxYaQtdlE9OArwXKCigEuSpK0OArlng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGfzfyUg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGfzfyUg"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38759bcd877so750629a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332454; x=1792937254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tfFDSaOe9URLyCJ1ZQlNv3ou9mFcHwS9Rjy/4jVGOr8=;
        b=LGfzfyUgD2cjvSpmXZpY9P+SIFamsB0YjQLq/QoSj9KqoMUmR6sqX94o2Z1UoZ/NBZ
         De+yZPAUUY2mR1reXjDaGmuEpQHqKGgbTFImxh9uMFjMYYUQgal0sYmp73lWZgcoAmU7
         Tzxizis69tPaKAATZ4RYYJuNgxF7XH4Lw+cVE1DSfLPFTYhH3lLkItR7+Uf+0o87lWwe
         aqmpRSradTXQCLLt/2eEFOr+fqKo5gNbyINJuxVRSOgPQ421fmHWOi3PvJTpOzD2foyE
         SUGoNJzgZZauNBu58rBPvigAsMtRfbyxewZnIosLCqdGlRnnr3aK1DvxokH2oVgEuXsO
         rfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332454; x=1792937254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfFDSaOe9URLyCJ1ZQlNv3ou9mFcHwS9Rjy/4jVGOr8=;
        b=PvBcsox4gQhUyP+ldofMa6PWcOD3ALbEzzKM74v9BOnXNTQer3M+CHdESsiA6RSNs1
         va465ruN7i/NACkTjTMhNxEyi6EfIBAmq4jm2nU9w67kzGpj0gUy+Ledz3pLV9bs2Ted
         1gabXVfML4WEQ6HWLviFRppMfveJtRyBBkpZPP/2nPHHoHZmBi03S3mTqJbLDf4olGiM
         +OP2blIfj+X4V3Pjow3Xe0sRlpFQy2vGsRiqft9n53VHibDquJeQZjiy7WKjceV66xJZ
         VMQCwWGR4kGGgW+E3PSIFqjZeIUsxYZvnkb7PTXcCrMpLmEB1gpcHxyAnlnhXgtE88EP
         f5eA==
X-Forwarded-Encrypted: i=1; AKwUvBxCszF+eZHafGccIpP0Afw6v8m/U1ppoPIDX9DUxdGmw8xqRl9a1nud1HKOkdjHYONuqjolbZM/ctblrb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLug4cwWFcL0rCERCnEl+1tfu75VKVaY6W1mGHQdL6g2uGvu9i8
	gbsbkZAz8UZWMpmjuraE/I+hnUtzJG93xHS5gwhJHz0VjMr6IQNOf2Xl
X-Gm-Gg: AYBFou0XwegOHPndnLPo5+48YKzptb+S3CG23C0C7jwEVj8f6eeX5Ol6n/HO2j3QyFx
	hj4yS2vm3FeOgiF/+0JUlulFc/gJH277auQ/w47VjaKdpDNyGKKqKY9tvsZvWKnDSu9JiVz8/19
	mn0FJzY5BQbfwp2hHpepECGSIAVY/nDAvdlsQ1E3s9GqPWcEaT18FmkScKI51+AFeZDG55HSnOj
	uU24xlJ5VAuoxPiSFyAhyJYvsuDMO6Ht0sk3axV/C/X7Emdn9nt5WlC9ov88g+ZSXMFi1oAPPaW
	GuWHoj4kJ9AfqyUNamSoGyOw5qJ3DPmegPFB3ehJq+0qvNJK83ueGH8m+W06w2sXngSzkrJT83v
	7b6kRkN2wpOc9JVYhcWw6KnXhqtgUhC/p8TqHBO2pEKwzIiqwjSAgBMXa8kx4EqemlfySi0ZIpm
	6tb7Y5tMUSP6U16Uh19ip4jFO7OuF7hSvmGLv4gKgkfGw2BSPYb1661HCnULv1iyj0HA==
X-Received: by 2002:a17:90b:380b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3acef14451fmr4653477a91.24.1792332454185;
        Sun, 18 Oct 2026 07:07:34 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acddc37958sm10149338a91.14.2026.10.18.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:07:33 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 0/2] ALSA: Fix OSS teardown lifetime handling
Date: Sun, 18 Oct 2026 22:07:25 +0800
Message-Id: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OSS module unload can race recursive proc entry registration and
notifier callbacks, leaving references to freed entries or unloaded
module code.

Keep the OSS PCM and mixer modules loaded until their objects are
torn down, and serialize notifier traversal and callback withdrawal.

---
Changes in v3:
- Split the PCM core unregister traversal lock into patch 1 and the OSS
  module lifecycle changes into patch 2, as requested by Takashi.
- Rename the PCM OSS boolean module_ref to registered; its lifetime still
  spans DISCONNECT until final unregister.
- Rebase onto current sound for-next; no additional code changes beyond the
  flag rename.

Changes in v2:
- Follow Takashi's suggestion to pin OSS modules until object teardown.
- Track successful PCM pins across disconnect and unregistered cleanup.
- Protect final PCM notifier traversal and mixer callback withdrawal across
  the last module reference drop.
- Keep card enumeration in the OSS module and prevent duplicate mixer
  REGISTER notifications from replacing a disconnected adapter.
- Leave partial HDA codec teardown for a separate fix.

Link to v1: https://lore.kernel.org/r/pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-26d66390a25fec9fad6c-v4-a7d8a5d3db28c5bca90a@gmail.com
