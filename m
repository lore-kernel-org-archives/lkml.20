Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735194;
	b=A02a38NqTEEvIFg+ey5pxV3/uAM8lkgo5pCpxVG4wLFuhmSj5YcXOikRaVyohgoP7TIm
	 W4aGBhaxePHlSPCLeucUKUVMVET78ZNKje02u6FHS0v/yK69mKGH65atqfWc4sptGfbLZ
	 Gb6lLYBgAybnAYjgKCvzoIfu2FYaBdcRGCL33J3vCt2DlQSUVyf0zbZl4VBwAN7wEu1zW
	 2LYPlrD1E0mBOt1/XMRdv3Qi2X71KR5iyTwhX6gb/1dRcxck0q3cXygiycx5tCqfZ6dIh
	 Z8IDbtgLmgJPIS/VH8QXPiOcchNs/ywnEe5mokwDuf8BFhIpH9rKANSrsMVkmj01ghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
	b=OFj6lkhXhkblue4BV9AH/1waXfqDJmjE/ZYjm+Ixy299WYbOzcj1psX8vuomd59v3iSj
	 +H5rdQ4SpRgV+Hv5Xm8PK7SPG3zsJ6ygL03wHu4ICdURpYFndjJtpFteER9504clE9s2M
	 LqzFX9IZSltwqFCxCpgNTYsGiOik0lN8Z4/SGX6qmVafFBnD5iuv8gsTQkkAjHj77e0MH
	 Zh1DtqBal0XpzitBvW9fXI0/X7lthn32MY+Me72tDLSBw6dzEotRLUgLUIUckWfHzqNTL
	 Sa7+MReEQHsKJE1yX9Q+e485cxYyJ+IXkU+wcmUYef15BphbRHjyK3g4Ff8xWv5/TRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Zdb+e/m7";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434E606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A434E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zdb+e/m7
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df7f544919so2084434eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735192; x=1795339992; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
        b=Zdb+e/m7WUnnamoKHXqxBf+AsLeq65dwpdG8qXqHS6iNoVGn6swRNaDDiiDqUuCvsb
         t1ZI1ODUdPNp8hEy3BuZoBlVew2AUqwjUH/B4WkOJDwZfrBQVFdo1QBPDJ3urn2dnerT
         ZDDenP9Z6FQoyy5tjBjb6KKwEqZG74Cong5Y4J0g+KmFL/X0fZudI7Ro+Is9IaapiztA
         O1kx2WwRDAtX/0MU2C6RdZOWL8Ozj3Zbsbnp8qnYJXulygA0NjBn96plRfJDYeVVg2VM
         x++x+3UuDWs+bTVCHk5kFBzCyYmErOjRRfBRVQiGLhQSsST4K6FcO04d4malaqYVbNsp
         vbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735192; x=1795339992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
        b=S//CUVmVyMNMi9mlhkbotEvBodPnDcnVBQ+G68sENO/ZMrc3/uAneFhPIda0Dz7t6G
         MebpnZnZ+ATeTqTHtBU06nfSeP9KxYswUoJX+6VhFFJnFEaHTlv8REPNUiEjG30wKdvw
         9p94IX3pCtTuJh8yBqSNHY9aHGR767KVCc48VvepHb5uEm2ZVMVOwID9pKRdp3IlQIXf
         /7X7k4TnOxFokCDstmapV+bZfdp3XbSrb0rSg4cDMHPETj70FbGGJCZDvdF25KrXrl/d
         j3PzDFYqPfvEA9o3U7exGBGZxGbdEKQDRF7WjihQVisdqMWGkVVXKJ/1DkZUlan2tqA5
         j46g==
X-Forwarded-Encrypted: i=1; AL+hErE1eOxh0lJkh7nNyHGKifeCi+9/0z3RLE/DaJFhms4HLm6xSLwxzURMrxHlRxjsehr1v81tNYunmmGq648=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mdc1HGtCuxHou1wHB2bwJFyGCU/cEsm4hV4+pn+s31rV15SEZ
	Zqe+5AcyWpn34HMMCJLk4STNLY2jfnVZa3ezl43K+oG5cFj6xxtiqsSO
X-Gm-Gg: AYBFou1Q4R3jno9tMvUQ5W4wwBDQBn/cgvR9+zv4Hbw4movwMRs3M2oYN/uOK4drvLW
	7TogVD58EQkg52UQdmkFSWG5CnXVXofHsUjPPXqsXNBRQCH85EVPaLsVLoWG/qbmQOo2bRjILHH
	que++fgHdChdJhwU2jGlcznnVrpMlfZO0l06R/6tct2l9/e0gpMSlZuKGJ6GKyGA7Wtqu6QTbH0
	vklUsz6J8gKHHHkuYB6IVPk01huBLvmBSbuRGTKiZRnKo3/JIAWQghPAmlX7wsstheKmPa1i9Bg
	6IRkG5+6Vyd0d1JmQ2lyNyFNlvcGFf0I53nmdNA6DlDO3Z+b0YAjIuTyf41FS9tQSmxs+vjFbmA
	87PL5ShqhDP9acqbZKMYfot66XZmJQGtUHhF6zF9M62WfzaacWgWNGmeIs/LcsYmuC5aktB6tUi
	yROvWMVDJERJMxIvTI4aIKufScKTpo9GTQi6NhXugSIcoKSbIMRi0XB07yeNUEYgtf67YfX8Z8X
	k2eHPb6XUI3jl7nLaKI+0N7XGQsmeOATuIh3IMv6Zq6xxzi8JAYXUU8zD3p8U1k9ShfCvA5jMSI
	5BEm8pk9Deooh5ltJmQQaoJFnlfmFvFhwFuizDrQ1nQghcn2wDuqHQUadem0cg4d67JJe9U2le0
	joZ2uimbQa2JhHWijSCMhleSMm5Vmj7guDjLfieOSpXjfUxv0HlQa7/3Ou4j75QEg+N4+UzCvOA
	9qU8R4B+d8gLhRGdGoTQCCOrE3bE2NnV8euEhj0u9jIQ1d//aezCA=
X-Received: by 2002:a05:6820:617:b0:71a:e82c:1eb8 with SMTP id 006d021491bc7-71ae82c267cmr724986eaf.7.1794735192405;
        Sun, 15 Nov 2026 01:33:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/9] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Sun, 15 Nov 2026 02:32:48 -0700
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQzW4cIQwA4FdZzblUBoyBPfU9qhwMmCxVZredm
 awSRfvudSY9dHtqJCRkyf788zatsgxZp+PhbVrkOtZxOWuAXw5TPfH5UcxoGk8OHFlwzqzPZR6
 bfmcaps1snkaXbcxizvKymas1wVdvQ+qY0E7q/Fykj5e9x/eHj1iRH1K3d/hPxiK/nrX59pE2F
 V7F1MusrY4HIpckNqxUXKip2dStxyCeHTRnk8vMEgV3ird60pmPh0Y+J8RIGJmhlQIQShBqynA
 mIXTSOdF9VadYbU8ttSxgsVYK0F33yiSdAz1UX2Is91XoI2AB9UqkmLlx6EAlh8wBLCCE6BEyT
 +/7n8a6XZbX/eRXu6/7ievqA6NmCp0S1ty/Pc48nr7qsXb96v4W/f+ITsWq68ZaEUtP/4r+06J
 XUbrlWqBIpDvxdrv9Bqn1lJV2AgAA
X-Change-ID: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

Correct interrupt routing and serialize physical-channel ownership across
allocation, completion, pause and termination. Keep paused virtual channels
off the allocator, drain completion callbacks before releasing resources,
and associate cyclic state with the descriptor that owns it.

The first patch carries Hongling Zeng's physical-channel indexing fix [0],
adapted to the configurable interrupt-bank size introduced for A733. The
second handles partially populated banks, including H3's twelve channels.
The ownership work is split into lock ordering, physical-channel locking,
completed-descriptor retirement and interrupt cleanup. Pause bookkeeping,
callback synchronization and per-descriptor cyclic state follow separately.

Based on DMAengine next at 6628e7d4c6b, with the posted IRQ-safe locking
fix [1], channel pause-bit fix [2], and shared virt-dma synchronization
helper [3] applied first. The synchronization patch uses that helper for
the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Explain that reading the pause register flushes the MMIO request
  before returning to the client, following Frank's review.
- Collect Frank's Reviewed-by tags on the interrupt-bank, lock-ordering,
  ownership, completion, interrupt-retirement, synchronization and
  cyclic-mode patches.
- Rebase onto current DMAengine next, retaining the upstream residue
  snapshot and NULL-descriptor fixes.
- Use the standalone shared virt-dma helper from MediaTek synchronization
  v3 as a prerequisite.
- Link to v3: https://patch.msgid.link/20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com

Changes in v3:
- Split the ownership patch into four commits covering lock ordering,
  physical-channel locking, completed-descriptor retirement and interrupt
  cleanup, following Frank Li's review.
- Document why virt-dma still takes vc.lock independently of sdev->lock.
- Check pending interrupt status first in the per-bank loop condition.
- Link to v2: https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

Changes in v2:
- Clear the active descriptor pointer before handing finite completion to
  virt-dma, replacing the completed-descriptor pointer.
- Release completed physical channels while their virtual channels remain
  paused, and clear the hardware pause request before reassignment.
- Keep the ownership changes in patch 3 and the pause policy in patch 4.
- Link to v1: https://lore.kernel.org/r/20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <mripard@kernel.org>
To: Jens Kuske <jenskuske@gmail.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (8):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: take the device lock before the virtual channel lock
      dmaengine: sun6i: serialize physical channel ownership
      dmaengine: sun6i: detach completed descriptors before invoking callbacks
      dmaengine: sun6i: retire interrupt state before reusing physical channels
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 184 ++++++++++++++++++++++++++++--------------------
 1 file changed, 107 insertions(+), 77 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 43704b0efab7679ada5f06b959a501040573409a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

