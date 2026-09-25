Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56BD4E4321
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363832; cv=none; b=MxH5WPC2NvZUtph9113HvgTKzSKDymr0QQ5+xMXeRAN+d3GZG7MkJM9mFlpW5wVNJddO5XbPFV47FU8NYMxU5jBACA6AV1T3Un/ebU3KQEy43W3wUiY56o4J9DlmU3jead2J4/ARHaY33LaE+XB+oKMgv8V0Yd/4gJp0rCGogtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363832; c=relaxed/simple;
	bh=6ZjKEyBbmPcbe24qPTA+D/2bGCpH25Z30RUGitkCA6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDODRBcVyUI9eEPqusMjvw3n0JH+Hf/am6i0KWwZ9CW4jqTIVBAF/Mmg/JFSFmqlqCly/NbhWBiGWwN0pNWWP/ivGHU+VILPhTaPnPVs3+wo9MgQBTbo4oFTOZzzavI+i5T/IjQqxkPgHeDmpkl5dhLPGJewQyN3CUaqvW7owlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYsLgxpu; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYsLgxpu"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52fa9c055b5so23234101cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363829; x=1790968629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MuvE+f2YVwcbigtaxoSqblfNR1nt2DA6GS6SXj46zY4=;
        b=DYsLgxpugfgwtX4lWFNqmgFozhf24/11rHlYg4+pfRRXIWWal4HnxAfg3RlpFffaqF
         fnRs6DxFO0wgPEozj1TKS3DRCuEeCkpCd8lDnYZHGi83+KRkrAF9r5QYvJ1HTkDE0AI3
         WM+3ZJ3x2BkSOpyisrvO10G2FYTfolKN4Gbe9Uj+0U3GMr5d01nIxpjVyWE2XkwRLzKZ
         pJUgVN88ABtvHYXquAj1tFqmJhlD2JZ9hkG11IrI9v7WhdsthEGIZbPVm8DjXiT3liZU
         N/9v0q+tiPAbAAedpp13rz3dIdQlLZErstDBhr0RVvuwz6ERAwE/Qlia87u5ZpkfF6ai
         4iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363829; x=1790968629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuvE+f2YVwcbigtaxoSqblfNR1nt2DA6GS6SXj46zY4=;
        b=m0yyBkMpzOlNazNaLdQilxCIq5jFulyX/5mNj9DGggK683fzxuY6Ax8dQ2cL0AB20i
         LMOUTEwrUWNac97NQ2CqmvWi26WXUe5ULKpwSIxBLJ5zPLtnMyuqdsm8xkgbif36P0IA
         FAT+bDJQ95ObU9GtOl2JQt+dZCLWoyEyKPaD41HdKrzhX3wwMoojl1KGQMDHBICclZnk
         tgLEmTJ60BjnoMTGLcSvnFttYjDDkUr7vYVJxisIobUyhtiu34WjJHW8EDp0Fj7RMRSF
         6y8sxdel5a/Z76h6rmLLAxBWEWHLB5gtLIhRb58fvbN8xNDgL071j0ES/5TqbpSdn49+
         mLUA==
X-Forwarded-Encrypted: i=1; AKwUvBzIyJ5iRBHyRZfUX4byCN32U+Aaln57/80yQPFcMqk944cn9He6MvgMnJTmz/LpBPFvRgYtdEyaGecKVts=@vger.kernel.org
X-Gm-Message-State: AFuF++mdEI0TccPltw8+d4WuPqwDP7eil/xMU35AwN4z9isjVYEObTJE
	T78Vt4Y2LqDmi8/tKDNmwU8XOKwSEakANNGKn0mcysiBYuxvV1CsuZ8=
X-Gm-Gg: AYBFou0pTL+p/uO5rpyYE8BJShjAXo4g6KccBMFQdXxvqoLrUef9hvNQ+FRxaI7dFJ0
	2Na5UWTU//PCpNopHaeC/qFKfK7+xPhkZThccoq+znGn3Rv4uXwRqTRmjfNi8qdxBrG9AzWITgf
	iXhhwUqTT9f+a4pJgqXrEVkHiGLNZdpfLA+sv++vlre8a9A3NVDaDEJXnO7x4EP03CZDPSyAkDn
	OdMvXdfDNrnu1o0j+Dmk93zxcfMRIsYYQE3e7s5q8CWjfl6lEp2kl8hi0EUiotqsRnlfzVqbCMn
	GMGRXmMT9yRugfvRY65G6MEc33Mm1MVhiCJ8uiOlIZ89FjRyvlYky2omvvo9Otm1IW1QAoM0vOL
	IgpEXYP26jPII2Eq+p4j7RelpUYmhfFLIv3vkJAFKH2fUYpoP66xq6e/g6J2VIXJnbxYufYU4m+
	S2DyEvlMDkk8teMDqXkMk4cJxDXfigl2nzcWW0kUXBYyfCs+3kuIigf131inDow5yy69Tz/cz8z
	0t7qWbvYjoPDX4e7qgVsgBfEEr+T591pBQZmu08wDqXdLf0dyLak2W7Irczn5TvvCVP4yof7hbC
	oStIhv1XThT5Miykk41/AjDSCqgZ
X-Received: by 2002:ac8:5f8f:0:b0:532:9af3:638f with SMTP id d75a77b69052e-5330b6ba05fmr59591321cf.27.1790363829240;
        Fri, 25 Sep 2026 12:17:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm23521776d6.28.2026.09.25.12.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:17:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 0/2] media: amphion: fix VPU core lifetime during teardown
Date: Fri, 25 Sep 2026 15:17:04 -0400
Message-ID: <20260925191706.3144437-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() releases the message FIFO buffer and VPU reference
before draining queued message work. An open video instance can also keep
a pointer to devm-allocated core state while sysfs unbind removes the core
or its parent.

The first patch drains message work before releasing core state. The
second prevents manual unbind on both platform drivers and warns if core
removal encounters a live instance.

Changes in v4:
- Resend through git send-email after the v3 Gmail submission altered
  diff headers and whitespace in transit. No code changes.

Changes in v3:
- Resend with intact diff headers after the v2 mail submission wrapped
  the diff --git lines. No code changes.

Changes in v2:
- Move vpu_core_put_vpu() after the work drain.
- Keep runtime PM and mailbox teardown unchanged.
- Address sysfs unbind in a separate patch.

Myeonghun Pak (2):
  media: amphion: drain message work before releasing core state
  media: amphion: prevent unbind while video instances are open

 drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
 drivers/media/platform/amphion/vpu_drv.c  |  1 +
 2 files changed, 12 insertions(+), 7 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0
