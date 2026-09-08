Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748B3290A5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863897; cv=none; b=QB58pBWa4YDamgwUxolECPuN1ikYOEfLTpn/r4Mw3XBIKcroLGvbNMlqg0Ht9VxhG9LVCuGeWX//Ib8Cqa9I1OXLZYK3rAATGrg53/uHL9BR4H7PdpiKZ51TUIuUkrIpBpbL1vSTPpDFsN0Gz+5TlZbR2mvVYaTDlOoUJHXx4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863897; c=relaxed/simple;
	bh=8gLXvaSYLYpDC9uFHcMqs71R0J2f8tuoOsQBThbcHAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvy97cl+8alB+wjrggOUB2vIItZhl7LZxJDrQ9RmASVgTG///XyzRFdHo+8eSS16YZ4BW0I3+Wfeht5+lnUYvs0fIgW6HMbquvvI1EbDeeHBIMMxICfyPXdaFLE168QbuQafg7uBwN+fo1Bu2/2Kig7OL723Bwj63Oc186iE+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=FgrC6zwZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="FgrC6zwZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435ae9ca4so482783f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1788863892; x=1789468692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/597x7avr9R9d/AGqdMiXK7ieWif8trpuxmdH2SsIM=;
        b=FgrC6zwZh9rv9zamjY0l4j82ieSQtxehIPqCA//H6sALzN2l82kDdMLjo8RGV1OslE
         GjnIMy1vJS4tobSiQDl9ulNf0185q+QfgNJQrkn28nVhN+ZNFNP7NLkIr+FygI5aEWkQ
         +nYbhwHMKMVSLPrjInu4lkSpHE0WY5oe3EEAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863892; x=1789468692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/597x7avr9R9d/AGqdMiXK7ieWif8trpuxmdH2SsIM=;
        b=BnDaAAnED/O83iA11LPtRNXnuVgRE/N/sifxPLvTyj0CAKa6M508jE3aCag0lYRAMM
         Ip0yWucj/UClisPdGg4o1umBuT1v3waY9gz7dJIhmykI8tgsm98KufmkktWuJVQD3USr
         FW4/y9m+eO/B/Ts2l5eZ6rJlb3eL34BSI8xvP7RjxfJai5EJIxahdDiyMKCVCG9WmU8/
         dIg/e0zceMMiDgo/9bcgvD5KrM32YLWwqXWyz7U3bVC8Zz9x4Q0xIuHb14v+4QtY5p/x
         GLSV5HtXObKG1IQdkvrgYdxUknQOSe+vZRHvfoXqrYRzpMm0sT4cwM8ZSloK/L8jesY/
         Yinw==
X-Forwarded-Encrypted: i=1; AKwUvBzA7hCY+jmD0sum0hD0Y6Z2/gAm3I80b5vKFGZKkNryE61Qb7M/DkmlCJzSFXX5XaY1LLa25V51E8TCR1I=@vger.kernel.org
X-Gm-Message-State: AFuF++l/fML22PgBeGV7P3uSm98ODge1krMozYt4SJUVsa2donVkGRjp
	hB308em+FmR+531r6W9D/7ur7W7ZDZ1OooM9RPxTioqTx4/pV10D48ZOCtfo2we74g==
X-Gm-Gg: AYBFou1/xc1tcHvM08RbiVAW7my89nWdP5sWiSEBfV3sm/l0yT+WjDk/ePfBsCkR0lG
	A9ag0U4Qr8nYWj4+4P1MIWbqc3oxuUUvv9amm3KQD45tBQ6SLKri65sTBtvBEKN8wIMYAL6CkHq
	J2+q9bOYF9Suhde1ITnVz765nv3q1EifuKikirGBOnTsVYlfuDCWmjyDbchdZwPfydpZ7MphTo8
	fLpewjvqOKsl/9wKxmjmozUFCBZb5ZDMrkKlbdQ2oOrrjjFQk9ZSuTbvSojDrVi2SR3rCy+oZ79
	evJ7HEQdC1Jlcz/hKDFBB/BW/KxOr89VNoYmhhlNUXzhHXjSDFhtEObGxBkTCpcxrzbZe629Tak
	P/90A5f1ZQ865ogGTm7IjXmXx8ZfrBsXAWWhOIOeI1U8m/o5zoP13TRzzjGhvg+Y/4VjufeHdrU
	XcKfDAcG3x4ZffHRnMTdnEgWqTovP76UyZVoGNes9YFx38asQtU9kD90dQBJHtyHAMZS0cZuthS
	xnTD1exYI88B2kn7PXhHsn4Dw==
X-Received: by 2002:a05:600c:35cb:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49d1da4515bmr11452885e9.1.1788863891717;
        Tue, 08 Sep 2026 03:38:11 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm37697594f8f.24.2026.09.08.03.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:38:11 -0700 (PDT)
From: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
To: edumazet@google.com
Cc: ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Subject: [PATCH v2 0/2] tcp: exclude old ACKs from fast path
Date: Tue,  8 Sep 2026 13:37:13 +0300
Message-ID: <20260908103715.1402788-1-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il>
References: <20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude ACKs outside [SND.UNA, SND.NXT] from TCP header prediction so
that they fall through to the slow path, where ACK
validation is applied.

Add a packetdrill test for a data segment carrying an
excessively old ACK. The test fails on the unpatched kernel and passes
with the fix.

Changes in v2:

- Exclude all ACKs before SND.UNA from header prediction instead of
  duplicating old-ACK validation in the fast path.
- Cover pure ACKs as well as data-carrying segments.
- Let the existing slow path handle validation and challenge ACKs.
- Remove the packetdrill reproducer from the commit message; add the
  packetdrill test separately.

Inbal Schussheim (2):
  tcp: exclude old ACKs from tcp fast path
  selftests: net: packetdrill: test exclusion of old ACK from TCP fast
    path

 net/ipv4/tcp_input.c                          |  2 +-
 .../tcp_rfc5961_reject-old-ack.pkt            | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt

-- 
2.43.0

