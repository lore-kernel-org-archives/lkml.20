Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E472C11E7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521470; cv=none; b=cFVeZZMXZBdTzkCpmYaURMrLgMT2Et2knqf9/PIkbK24SjwbL00CCWstBjBJC3pB18ioX9BsBbcR384Wbv6K5peG0ejl+QjzZC155ZWf6pEHmS27S2LCT+iEioA1zpNpfDGhOHMwtSlR6e6G2gKmqHoK9UO3kVMLisvWjI/aWtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521470; c=relaxed/simple;
	bh=sFdwaEqZlY9o+QGsDAhRmoyEFMLDkoTrT8jy+18Yc8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCTUrj1DRXxteEJabYjCD0MBBTlQ2nrk1GKxBbAb12KGSsIHjZspND181T1sjc9AdNb+zcE/+Nzbrr0aOE+6uotAIxh+k0PkhIaKix6zwVta8pbrWgfdtQIGwDwc+1CNHWS2aSHt0RpHptfI/LCXW/UYOnwb4wWHKgU9kTJyqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbUNDQz7; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbUNDQz7"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1bcd9e00bso666501eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521467; x=1789126267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9dGVyKQeYpFQ1MT/e23PPld4wZKTuH5aonjUAi+WMk=;
        b=fbUNDQz7vI0ERhpSK64lrIl5HlesNJign/B9eN1FugKUuDZHsmS/2ii+1l/qqBaN+L
         9tTRxwW+VU6ZhvIyrksagyA3gLqrOh0csxrKaVRhbonTmqK0Kyuy5AtuqO3IaPnJKSuW
         1BdaYVEW3L817XBOD3vZMUiosmjGFpkO1uw8LWlnJzYPwVBClhYBw4xuid98RP6R9XW0
         swRHSitASfOuADTf1qfszwo6x5uKCPjIaq+wBOxwVWFLjpZ8k+fOaloBfH4119whXUcU
         SzDlNg7EJkAQ4f47SwnLcqUm/skQidTjq44CtuRqY3Fm/r53tMVyKdTzT/hbR8bSqS9R
         6YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521467; x=1789126267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9dGVyKQeYpFQ1MT/e23PPld4wZKTuH5aonjUAi+WMk=;
        b=lWWHbRSCmAdh0gXPDQOHPU/Znjv5sCDrrUWikrSXrvVYCZrkRUfcs3Hv2QN/ugDCGQ
         /hdib8Pu8nQRoByIYlI0D7LnyLxGymCHZOOQ7jQdUN06v2LL2qM94ecmEtv/MsOjc9RR
         5qwsTPuv22wNonoNEo8k3c3Egib3eY+I2O7KmV3+ga+GXgkz9x+io3FRpAp79TjDtndW
         M5prGC7tO+H5T4wQa8FYNpAO47EuNxqzYsZ3r4JJD3+oIR+YpbWg0pD2qZNbSva8fnmb
         91QPZ+ihd5OkGTIQOmRirmPZorIuExTJiqAXCIU9CeXFyH/v3ua1dDQqpJgZXLoz0vLV
         Bm6g==
X-Gm-Message-State: AFuF++mRD6WHQLtzqq34Ck270Eta/l4MSrYYw6s2TxlZPGHl/R8+V4Ot
	HHrgtk6IbjnMBmilBC6EGy4asVZfBPbR4MIb4xmZRY+gEnvnh0SBC8BghlS9QOHk51Y=
X-Gm-Gg: AYBFou01SfAI90pIjEwXzsAqxD0y8BJqYefOSfoC9cXjOer5uhIcOIHWVzRbmv1wzGM
	6T3dCCmm3xhbSUkQEO47RT00XYSxD+GcKEfN38RMtMQvCddCkIYxJS7e2VJTYLVEV2QqTasx71l
	Iep+gwKe8r4abjYjEnmsklz4lyfPIpEoEd0rQZoJTbajRF9EQvWQFCDIMoKbOW8ljVav2yvqaQW
	9r8yVSdWLoloTsizp8e32fL+f60q8sGA5WWNgy2P650G3sPEqvvIr0WIyb4n6nbhKCXgIbquhEI
	x37/VFKSAPVdxBI3frTVGDsp4UwtVA4K9KueZfTJFJMbPhQEUMkjzFcgrjdHZiPA6RZhXMPnQUC
	MYnR4CAcODsuWAsN0kbTI10iEqes+CepuWhsXbvrxUNZBJVpfV2C6s7WA9454vKvJ91shZT3aJw
	lUAF0/Exh1J0TdtoPog7dlhBLo/TvXrniUK6VJboauHCfVxTt62KaVyHBqgyiEuLLIQtBySwF5z
	hFz2pxhm0Z9zWsqsUMuK5MILA==
X-Received: by 2002:a05:6820:1c93:b0:6b7:83c5:fde8 with SMTP id 006d021491bc7-6b783c6037emr1309760eaf.41.1788521466871;
        Fri, 04 Sep 2026 04:31:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6039922c88.13.2026.09.04.04.31.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:31:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] block: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:00:58 +0530
Message-ID: <20260904113103.10805-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  block: drbd: fix typos in comments
  block: fix repeated word 'is' in comment

 drivers/block/drbd/drbd_nl.c    | 2 +-
 drivers/block/drbd/drbd_req.c   | 4 ++--
 drivers/block/drbd/drbd_state.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.48.1

