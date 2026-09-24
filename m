Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43FE480357
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286553; cv=pass; b=TP+odRNgLMJyGRZQTaF9fBaEqS98iTdVnV5iq7az/tZNcF/2XARyWPSz8va/TWMhSXEFiN7bsO4BEsik++hcYRtcKT27eWY2UHi6VPYoGyF9TCWtaSAtSC6RL8QwCIHxzHvyX0Tikndi54+n8BbCixmcKD96hF5L6D9E+1PtoR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286553; c=relaxed/simple;
	bh=TCCbAICDWR19TnUzl01zmd9m7fi4SdDKlnltiF2/v7w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CxWt5tv3X1Jn9r4aVuD7mbqVLdB9RkjQuf1KBqChO2GRRLlJMORsG8jBNFEcdLwSeuv5Ew8jgvJnW9YL6C/4YvCIS9FvKDbIMPnXYVX/hSQ2kMpNjPmnpKqTPqqXPVQyRk3tvjG/v5bTXOV5cx98KXym4xDFkrquHWuUe1NQ3uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ipwh7OT8; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ipwh7OT8"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so43967966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286550; cv=none;
        d=google.com; s=arc-20260327;
        b=IpC9GnW73mmtdRwIKwTjN7B4kHxQLarqqXDbyTTYslkHnFWL21NI6gak7ItfSmhsUQ
         7zln7U3KGWVIuVwsrXwrJBzZ6weF1XgBdwNVvhpJOkTEbjrMRW+7xO+8pTKJM628dhSU
         phw4FvGm+8HdWJF/p4Kjpa7vPnKSKOMZCM9UHUnlxlKkjWPArJcFBGftqPiKqis9MgvZ
         ExcmoyU29TpH9Ix7SboDy6Rx/0LBpVNMQdXqMOWQ7NHZAgHcWGjOC03/jLelqWRXUDKo
         HiO2SYnku+qDWAhQ0AMiPlQrtiDAp52fq31TPtkLCY2fRIF9e6EcrRle07O8xFM0uwjp
         I1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=d+iT0ll470CyEirfOqyWHR0qj8lIbwjV9NYAht2tV/g=;
        fh=HBZ/f7nMP9AfStZOk0aA94rOsIlpKOHFFFVETvg/X0U=;
        b=OsVQ2qDEJN1uXyY97D13XXrv7bpoAVFa603ZKyB4V3H+gu5ezAgDEOtdTec7vlb7Nz
         CuUyX72/rrzM3SvoPCxhyPzjFFp7PkYQ/Ow7xZQzPU2b53ax6Oem8oBQk/fcpRcybMnb
         EpaZsIX9M/Hbe9ZP0YaOQ3DqatEzlr9TpZ9f9FkDqXmuCAcUTZ3oogLpKfqmFXH2iTSo
         hXhic5r7QjgRjPJ3oez2losQHRFoJMRoarpWeOt9lEB8k8cfrzGyzgl7+iefX8ai0JcQ
         ig0mWK73cjbOxtHnMDYG8TWHzHvCbkMmBPwaH4iMp2ovlWlHQxcNRv3EfH+sEZiePC6Z
         0x9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286550; x=1790891350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+iT0ll470CyEirfOqyWHR0qj8lIbwjV9NYAht2tV/g=;
        b=Ipwh7OT8X5p1zNbtTYrFOv8mssPaXUVA8oNG7rxZtSbkBCnlbyEKsxrrIK1acYPRtR
         30Kg6pfq2BNOqN01DtP0x9qFiFNtWVmJXHl9WXfN8tZLc5tDS7khpIA1fEHYEvIX1csb
         5wlrt83z77anyWBZkUGFMO3ese6zHgbgMscTBD8h3Xm0Unqsp9mzGHg0BbKl9b1eItM8
         hO7kqds3Mbp5QFVXnPsvNL9AkI7DxxK7AAS6d5icV3pefOvAn4VRhrDT+eu7at+2IGk9
         vEWfo5uCmlnbC/A31a8BPTSZrMUSEBjSB9vRgg0uy/N6k04/bk3618PPmaAsvLH49oXw
         63KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286550; x=1790891350;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d+iT0ll470CyEirfOqyWHR0qj8lIbwjV9NYAht2tV/g=;
        b=bcwL29jUvfql5i1vJ1nGv5WQ2qJg8uTSvzRVDJHqNzpcppqRkojCFF+SQNo2Yqb9oS
         nyZGZUkOBBeAisa17CdalgOsuZ4U+wOgzvZgTRKem73UIBSuGhg7xTh2OkyhKEjy/3Ho
         NklfOHmPrNWnWnVTgvGpxFFr6flj+4ivJbkIGNLCE/Rj5xQPuBjf2rbOWSVHPcaTUd4a
         aMhmxaS0mgvQNx0MmsoE7Lkx3X3WhJq9zoyKosLDpeDrJ2rRjeepQpWw/nVpWwTlcxi7
         BR9BzMkodMJ72/cr/GPG/gQP7dHJ4bamj+uwQgpw2QRn2dCmdXGUvLyatf4pOLVPwHu+
         MjZw==
X-Forwarded-Encrypted: i=1; AKwUvBy3JvJWakMwJt+LJBSCNB4CZgFz6XR4WhaGECjBdaHDJ3/0L0H83vXTAFYIDQduieSHpFnQqY8HT8eA/RE=@vger.kernel.org
X-Gm-Message-State: AFuF++lRgPGApZ85CN2Y8EgINvTrcfp2cGdJ3MPJyaTqB/C7+cjAcS6X
	awx8nsbkWTI4LMSYaR04oPPNIwLK6uGni/YnJntZDwlQHU6zQYwG+8+7yjWJGzNM8Q5OS4nXCw3
	E6yz9bwPiHQ9p3Zzrg+N67moqF36MNw==
X-Gm-Gg: AYBFou3Bhf/lEW1GNbiRkr3ESdNOpC5AqC0MbltoyLtv1ALeTTDYgzVRtWL/2RwQcJX
	nQkXD9ykj/QyTQhGX0p5ZduXBvm7DPNoneHTxmhb7LneizJT8Yg+IdUnDOzrz0qa7Gvup9E0Vrv
	TKIFJC4uE+h+OEs9+3dCiBlyc85hAT8Fu4Hw4TIgAJWg4QpwD857I0bWXDTc9TA7/bBgrpUKO2j
	sqHV40FOwoMfLcysPKVXuCSbfwJHsguP4nApP5VpYg5GMUZY6xjoXfCzNlKKuw46+CZ/nP1f7pN
	PrTa2mDNGdHPgDz6kv1rVA6m2o9Ht7EzuuHjp3paI8zJyfwUI2/hET/yy45RtEsHqZWjmQe3x1d
	6ENFy+sg+QVR+/QsdQRCKs+1WPYOoIEiXlaZfbxB3ZA2r+UQrhTsptmS8LxZA2b+N
X-Received: by 2002:a17:906:730e:b0:c29:f5d5:5a91 with SMTP id
 a640c23a62f3a-c2ac23ec161mr338520866b.27.1790286549925; Thu, 24 Sep 2026
 14:49:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 14:49:08 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 14:49:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 14:49:08 -0700
X-Gm-Features: AclHuK-ifE8Wx3X7PnhgGIrI4SsuY9g5qXNEZVUc3M1mKA7E9YdCoPUOmRTEtYI
Message-ID: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
Subject: [PATCH v2 0/2] media: amphion: fix VPU core lifetime during teardown
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vpu_core_unregister() releases the message FIFO buffer and VPU reference
before draining queued message work. An open video instance can also keep
a pointer to devm-allocated core state while sysfs unbind removes the core
or its parent.

The first patch drains message work before releasing core state. The
second prevents manual unbind on both platform drivers and warns if core
removal encounters a live instance.

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

-- 
2.53.0
