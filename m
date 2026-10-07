Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC853A2E2B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374050; cv=none; b=Ntg5wJ/ug5c8nrebl1looz9xx4PLQq7L9PLBKQtORJ+CWSEw38WywjIB0/I5LMMhbPRbxB51ZsG3GWB7qCVPNyEuC2s0LH4MlwSh0cpGrD1nUzAwxxsgpQ4mLSLSr/I30KPgYIIV6ah2zbagwooz2S1s8Mk+k9GybTNavzWcO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374050; c=relaxed/simple;
	bh=L730BvsnUN7X2H9iAeghApsz2LI/6U4Th3EHl8jAshY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjHC3gAQqBZoi6iJ1JOF/5uoUmZ9Id1XlG5ky9ZZFyXjNe5PHeW3+FQKNtyUQeYMmNxOX5N0V/9vtKBPXn+i1HHEsC1yCBFEn6awJqMNuJhpAPhhBJ0EpTzGMq0AdVHacFOSYp3H5C34LYnvqHEftCpQa12tVGgOv681Mo0xG0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmq0LG8n; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmq0LG8n"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1272768a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374039; x=1791978839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJbpfBkccqJoniFuHsFOxhzsQjjxrm9zX2bl47R+6yY=;
        b=cmq0LG8nNBO2NGJj27h2ibdkLcrlwUwzbH13fPY1IDcjEKwpKKqOJE1uBWF56v/PQj
         /SqXSYo/LrMTOG9ki9nU+8QyqOqPkc7mxvUKourTjsfq7OETm094qoEGYECbmznBjfIG
         Rdxa3U+W9W1C7RhoB0wjGSXej6WeqnJ+Uh1ZLTrfWgevGFJxqa1fY1dWyAimuRAghY5s
         P2UGsbRQQE8pdSa/Y9gyiZpwD+7C1DW9ZIginuYVLFQZh1ydLQ/+/mQjL9LlGpWQU2sI
         qltx9lnD/kerUGJRtQd2TDdlA6P+0UigvWV6Wpn7WqEyRbCw/xcTX6FqCInVyx3acsse
         jskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374039; x=1791978839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJbpfBkccqJoniFuHsFOxhzsQjjxrm9zX2bl47R+6yY=;
        b=qSjERoKsORQwhX928SVOcq8oTM40lOSnFs4ILE1hZUDDfjKzAGK5YFvO5NmJ9A5e5G
         ZdXaB8D8RqQNs3lpR423A3HJ7CCtDVboPZgT9xbiRD/C+NGITZE6bfWajpJZIljqjTO1
         ut50oBuqxbIN6vtd5oZ3ZKLydoS0zKX5/KTUtQp+KW5FQLeKvimTSntcoVjrb0CGgxJh
         mrxi4cPB/XLSxBuQkitjsjVIRjBOnfLra0H877M7WQNQ0tcIVnNHSLpCIzAlqfvbj6f3
         9jraMlRXSMNnH/HtS7iSvByqkC+lbKFG/OR2fS7gS14o9jkGAaRY/BRqTrZ/+9Fhiglf
         FcLA==
X-Forwarded-Encrypted: i=1; AKwUvBzVN3ijeQtPLoR89eONsR05felErWMsrzsnVWGKEmrRJHADqn2hsn/cNKL6Ij30VxL0On+T+dmUA6SM61w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc49W3fN2qbwmf0XBWypJ3uIoz2Gdteoo2d6l6KswjRkBlhAXU
	4DJq+wYL9EU3UHKBBRZvvs/ekxE0IysqjnxZ+khxD67uPnX7jX0OD/C5
X-Gm-Gg: AYBFou3ppA0L0fPMvTzLX7CV26+vE2IaUK5JxgZ531JZ+PMa3X4lC9v2YayxTeddJ3a
	lBql/Z8BTDPK5hix2H+5uTyvo7F5ZQffwTgcqM+10uNSuTkIN0FB6TbMqyfpCIxABTBFUH7xzyk
	EA+OGh4WUU4vcaPbftuJOE1dhMgrSIpsxWd2r75u/v7si5fl6kdwmbKwDn0Kdy0DmkKd4zQqtLG
	Yl9jFYgrISZNRWq02tFmazJ23oyDgeKpcyIZULI0JNU/pj3GB7Hoo4n/rM6kV9E/bXTcit5ncxu
	wcQPZx30hhByWBSb7katJ5cnAv1U0NxxeS4N5TkL6UIMv3D7LC7QGaPQ95GPMWbhVRKlrlZoqOd
	jAh9wrBaM5C/QdbLnnqoqShv2Ztd0s6nZw3KjNRv1cdY1XPCz4RI8qBFeHDHkBAxiloZ45K4+mH
	7z43kO1JExqxSlZqakfEpypHfKueJAEAXGORYHuHe7672AquSMMwA7s+AY5hAkqwWQxgKHJXYI4
	w==
X-Received: by 2002:a17:90a:d646:b0:3a7:9afb:78c5 with SMTP id 98e67ed59e1d1-3a8a0ba243amr1222490a91.30.1791374039155;
        Wed, 07 Oct 2026 04:53:59 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:53:58 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 0/6] staging: rtl8723bs: explicitly type variables in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:36 +0530
Message-ID: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v3 series focuses exclusively on explicitly typing the non-standard
'uint' variables in rtw_security.c.

Per Greg's feedback on v2, I have split the explicit sizing of variables
into 6 granular, logical commits to ensure rigorous bisectability and
ease of review:

- Patch 1: Matches packet lengths to struct definitions.
- Patch 2: Converts integer flags to standard booleans and updates 1/0 assignments.
- Patch 3: Explicitly sizes frame types to u8 based on bitmasks.
- Patches 4-6: Explicitly types computed variables, iterators, and helper
  lengths to safely handle math operations.

Changes in v3:
- Split rtw_security.c changes into 6 logical patches (one concept per patch).
- Replaced 1/0 assignments with true/false for boolean flags.
- Dropped hal_intf.c from this series entirely (will address separately).

Link: https://lore.kernel.org/linux-staging/20261006200751.819332-1-contact.pranavdesai@gmail.com/ 

Pranav Desai (6):
  staging: rtl8723bs: use explicit types for lengths in rtw_security.c
  staging: rtl8723bs: use bool for flags in rtw_security.c
  staging: rtl8723bs: use u8 for frame types in rtw_security.c
  staging: rtl8723bs: use explicit types for math variables and
    iterators
  staging: rtl8723bs: use u32 for payload_length in rtw_security.c
  staging: rtl8723bs: use u32 for length variables in rtw_BIP_verify()

 drivers/staging/rtl8723bs/core/rtw_security.c | 68 ++++++++++---------
 1 file changed, 37 insertions(+), 31 deletions(-)

-- 
2.55.0

