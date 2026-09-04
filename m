Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2321740099B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521697; cv=none; b=Jd86nf8bJQNKXAdabX7eLW67IfA1Zz/BO9yO2LrOIs1w9TemC8yvaAzXEh8ap8utkOiAtHia645Ag/H5Bl/nxQ0hE/+2+N0WmCoNN+WXmysVKn0gNygbfZntnfWo4F/PZwK/+BbD9OFoQVxkguM+BxS9CiAg9QmBS8RqvtAjqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521697; c=relaxed/simple;
	bh=8nTYfAcd2ST1hp9O608pcfQAmbYkYhD0R0e9hwboxsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEkxpo4ckgoBx2qpf61z1fke/xaIaCid8zbb0SuOhlP18U4W7J+yQ3+gNaBCyRccBSbYGTpbbWxoWiPgSI//r7t6ldzeNl1XMkKwgzIbDeycoH+8Nyk7384YBTyTnQfQBGoEFd9Nsr7j/uo3ep1n/CVcT6kAnZtiZkMJ5Ent/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBJQ21oS; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBJQ21oS"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb6573bd52so941998a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521695; x=1789126495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLoYBfY0wfOAGpSNCqGysKXGELddvDZ9oGBQRdtl5uQ=;
        b=rBJQ21oSOr55leDpLNkkNxRtvXM88rJ6xCbkt4u510kpkbfyd245ZvU1tgU39Cqu59
         y+4Y6TbGMgCJWgWEQHyQPhCFhJwOxtrhQHIUhmfU+JsY2HhyeTSYpk6y1CLfw/LDpXc8
         EoVhNRlCARuHp1viQNEBDUVGMJ9T4k7Ye+FwSALcsEdLNx3eAcNO/6g/1Cz22cGgErNE
         c0xiCZAuDzP6o48PiFEaCls/yZHXmCNw1KczuERf4mAiF7XNXdvGx6L72TeTjphAGeoJ
         128DyFy24dJSih+Hp5xTkOW/Wpijx06l/PlYsKxkWZQj1NofYw5wi5C4SdVlakJW0+FZ
         vONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521695; x=1789126495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLoYBfY0wfOAGpSNCqGysKXGELddvDZ9oGBQRdtl5uQ=;
        b=WnQgbnCwanPmXF2NQtsuQKz/8qvaJbCizpaOtfj9fY+dCmOgNMeRFqr3BlYOsojC8r
         J+07+oJMLv7UC+wldrfBLmSRJa4/a2yzcoV2ot8C2FLW709uXatJH/+XGd+E6JYBorka
         Kbz2bhO1ob0L3lD9mipu9DV728M08+DwCRWVfah773nQw2jEm2Yjbiv/NXdSf/3ZpcZE
         n1qaYaQWylewL/uP0//sLKT8OxndtRCFLyO6cC/SzEvDjWBmLz7lUQb70VbEVhGhgoxS
         +HtFc8xXrYY5fw5Uzqw33uBD+sGfcEG0BoEguoL27IdXh43HuWu9UEpYbflJUdFBQXxv
         I3SA==
X-Gm-Message-State: AFuF++ncnH4bJbyvdd7mAETQWtxSFKv0RH0QHR7gnLrZPVNWGFMktHUT
	4ef0A6ToafsWh8eo/bzfBqkZ83eOaIXDuXKJSy39XdrfjRk+wRvKpxSA
X-Gm-Gg: AYBFou0Dndf5pF5MVnsPRIeN/jbYcNhDPmZz/8O0I53d9xKSoUokDdsY5bxUkNrF6f3
	cnYsZDltP0z3r0Yy8vTONh7q9vexJfGkbd1fLSKFn/dqYVWfYJ/gq1/zymgk0Mge5aP0SM+Fl52
	6pbGu9wCr4tS/re1Bq+JvuS0B08l+h1lf7gEwzuw/oCghEGh9gV2a9mi0UzAdP1Qst7pQijkv8+
	yMEktIyOv/7Bfwr0V4EPf9uhv+ODOkQu4tarrzue9mc3myB+UCjLBrizU1Loo5itGMmxXl9r4/m
	ogA8Nbf0rN85WcGMMR7EwH9SsUFswJhoIsuQ0EbASCPbIMSzkyh0kpSEJCCyK2ntzcfDuWEs3/Y
	vKtjkswv6JO8FtrCSv16cII/XyvuD92KnvwgATXQzYa4vSF7aEncM6y+OR6G1lqbtNCYmR6Squp
	LE7Et75flIlKRVvT/6w3lZEQCdYE7QNS98B5C6uIldQ3RngCSMymVXOGfchDs9T34Tcup/7wZ8H
	DQ5i2stT7sfu2w=
X-Received: by 2002:a05:6820:162a:b0:6b3:6444:46e with SMTP id 006d021491bc7-6b6facde170mr3929160eaf.8.1788521694939;
        Fri, 04 Sep 2026 04:34:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6054536c88.10.2026.09.04.04.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:34:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] media: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:04:41 +0530
Message-ID: <20260904113450.15838-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings and repeated words in comments.  Each is a
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

Hemanth Selam (3):
  media: fix typos in comments
  media: fix repeated words in comments
  media: pci: fix repeated word in log message

 drivers/media/dvb-frontends/drxd_map_firm.h                   | 4 ++--
 drivers/media/i2c/adv7175.c                                   | 2 +-
 drivers/media/i2c/ccs/ccs-data.h                              | 4 ++--
 drivers/media/i2c/hi847.c                                     | 2 +-
 drivers/media/i2c/ov772x.c                                    | 2 +-
 drivers/media/i2c/wm8739.c                                    | 2 +-
 drivers/media/pci/cx18/cx23418.h                              | 2 +-
 drivers/media/pci/saa7146/mxb.c                               | 4 ++--
 drivers/media/pci/saa7164/saa7164-core.c                      | 2 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h             | 2 +-
 drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h | 4 ++--
 drivers/media/platform/renesas/rcar_drif.c                    | 2 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c                 | 2 +-
 drivers/media/radio/si4713/si4713.c                           | 2 +-
 drivers/media/usb/dvb-usb/dib0700_core.c                      | 2 +-
 drivers/media/usb/gspca/ov519.c                               | 2 +-
 drivers/media/usb/gspca/w996Xcf.c                             | 2 +-
 .../atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h    | 4 ++--
 drivers/staging/media/av7110/av7110.c                         | 2 +-
 19 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.48.1

