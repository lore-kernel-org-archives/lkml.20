Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158906;
	b=4Qx/T3aTSB+lz1wNiiNRgnoko3I/fIHMWIk3iTttlg3QjeyefkTDpL9GC+zKwXvm2Ae1
	 U2XWVlvaEyumkd+lMMUvm+OnHnMk8XLC56BYFjE1/BNL+CVtwKGy2zDIJWwtu9sKmRoEU
	 d5h8w5zB6FmjK2uQlO34Y1beYB70FajWgIU0Qq2cyLATcP9QqVExPgpDf0OlfS3zdkbI2
	 4nnkKPRGLOWMGGugXL3P2hfTMLt8Nv0ozGm/Do1guAx0CBXjqtWb/TdNLGKQseP1uG4Z1
	 TWgN30+t9mFZlXX421EjKW72gwpJsyrGV8ulFHI532TERVuJUw8FAUL/2lbvF77VD/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158906;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=m9WFVVcVt3yvlXt/JtM/pL2nGB4Zb08JLQVF0juD9tY=;
	b=sc1qlz+2tCn7PU16YdDDF7Wb3sZMTKhSrROP1mVDOQsVxilhgKBq0LqcXzrtN1Nzq7JM
	 CQ9beqD3jMPA5ZwncixunMIaxdS+TDX3BCXVZ09WLp5oeVpO5/3MyWI8ZM/cUuQldC+TB
	 wTrVuCdm/EGjmZX9x1s59nadqIywrAdZtkyjL2oXwkiPI+TC+zVlxjOFZ9ccf4pVbYg53
	 d4yOuT8KblWvOJAbD9De1eKQkFNWI4oEaIikorXlvJCE+iv5BmBZelUEAHGgU4w5xl0LL
	 NcOBal3cZy6zmFBWE/OdU/lTU3nFasICk89SGA5PA3CJ7V1bu33KZW7fPLCVij89dGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2030C606A325;
	Wed, 28 Oct 2026 03:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2030C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMA2Xnf0buFq5eBgAA--.63329S2;
	Wed, 28 Oct 2026 11:41:40 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXkDvubuFql1YAAA--.815S2;
	Wed, 28 Oct 2026 11:41:37 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] docs/zh_CN: align translation paths and update guides
Date: Wed, 28 Oct 2026 11:41:25 +0800
Message-ID: <20261028034134.4144660-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMA2Xnf0buFq5eBgAA--.63329S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZrWrJFy5Zr1DGFyrGF13XFb_yoW7JrWrpa
	4kKryfK3WxAF1UCw48Gr47JF15Ca4xW398Kry7XwnYqr9Yyr4Fyry5try2g3sagryIqa45
	Xr4fKrWUu3y2yrJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH0b7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0MxRDUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Several Chinese translations are no longer at the same relative paths as
their English originals, and some Original fields are stale. This series
moves the translations to matching paths, adjusts their indexes, and
removes stale Original fields. It also updates selected translations to
newer English commits.

v1->v2:
- Drop the unused top-level readme_zh label from the translated
  admin-guide README.

Dongliang Mu (9):
  docs/zh_CN: update admin-guide/index.rst translation
  docs/zh_CN: update admin-guide/README.rst translation
  docs/zh_CN: add media administrator guide translations
  docs/zh_CN: reorganize process debugging guides
  docs/zh_CN: update magic-number to match upstream
  docs/zh_CN: reorganize media driver API translations
  docs/zh_CN: move GFS2 translations into filesystems/gfs2
  docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
  docs/zh_CN: remove stale Original fields from SCSI and IPE
    translations

 .../translations/zh_CN/admin-guide/README.rst |  87 +-
 .../translations/zh_CN/admin-guide/index.rst  |  12 +-
 .../zh_CN/admin-guide/media/index.rst         |  54 +
 .../zh_CN/admin-guide/media/omap3isp.rst      |  95 ++
 .../zh_CN/admin-guide/media/v4l-drivers.rst   |  44 +
 .../translations/zh_CN/dev-tools/index.rst    |  37 +-
 .../translations/zh_CN/driver-api/index.rst   | 232 +++--
 .../zh_CN/driver-api/media/index.rst          |  52 +
 .../zh_CN/driver-api/media/v4l2-core.rst      |  36 +
 .../zh_CN/driver-api/media/v4l2-dev.rst       | 286 ++++++
 .../zh_CN/driver-api/media/v4l2-device.rst    | 127 +++
 .../zh_CN/driver-api/media/v4l2-event.rst     | 124 +++
 .../zh_CN/driver-api/media/v4l2-fh.rst        | 123 +++
 .../zh_CN/driver-api/media/v4l2-intro.rst     |  75 ++
 .../zh_CN/driver-api/media/v4l2-subdev.rst    | 491 +++++++++
 .../{gfs2-glocks.rst => gfs2/glocks.rst}      |   4 +-
 .../filesystems/{gfs2.rst => gfs2/index.rst}  |  18 +-
 .../{gfs2-uevents.rst => gfs2/uevents.rst}    |   4 +-
 .../translations/zh_CN/filesystems/index.rst  | 112 +-
 .../translations/zh_CN/networking/index.rst   | 238 +++--
 .../zh_CN/networking/xfrm/index.rst           |  20 +
 .../zh_CN/networking/{ => xfrm}/xfrm_proc.rst |   4 +-
 .../zh_CN/process/applying-patches.rst        |   2 +
 .../debugging}/gdb-kernel-debugging.rst       |  15 +-
 .../zh_CN/process/debugging/index.rst         |  62 ++
 .../translations/zh_CN/process/index.rst      | 111 +-
 .../translations/zh_CN/scsi/wd719x.rst        |   2 -
 .../translations/zh_CN/security/ipe.rst       |   2 -
 .../translations/zh_CN/staging/index.rst      |   6 +-
 .../{process => staging}/magic-number.rst     |  35 +-
 .../zh_CN/video4linux/omap3isp.txt            | 277 -----
 .../zh_CN/video4linux/v4l2-framework.txt      | 958 ------------------
 32 files changed, 2132 insertions(+), 1613 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/omap3isp.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/v4l-drivers.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/index.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-core.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-dev.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-device.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-event.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-fh.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-intro.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-subdev.rst
 rename Documentation/translations/zh_CN/filesystems/{gfs2-glocks.rst => gfs2/glocks.rst} (99%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2.rst => gfs2/index.rst} (93%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2-uevents.rst => gfs2/uevents.rst} (97%)
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm/index.rst
 rename Documentation/translations/zh_CN/networking/{ => xfrm}/xfrm_proc.rst (96%)
 rename Documentation/translations/zh_CN/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (93%)
 create mode 100644 Documentation/translations/zh_CN/process/debugging/index.rst
 rename Documentation/translations/zh_CN/{process => staging}/magic-number.rst (58%)
 delete mode 100644 Documentation/translations/zh_CN/video4linux/omap3isp.txt
 delete mode 100644 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt

-- 
2.51.0

