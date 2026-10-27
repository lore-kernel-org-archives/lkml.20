Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096769;
	b=lFsgp3eN19ED75rovhBJnqQuKxbjtO5iBQX/5ssP7SDUPNVQcoJ4qk7MFSFLMRWeiKFw
	 x8abzzTquXCHdHqDQe50s6PGn69RjD02uzELb8YbQaN1/6yp4zXO+D8ZiuEHsLW0ZOwN7
	 XCsobvgnQipipbDOqf3hfqVAJMLR/Hmmj/a+52F9461LhU5V/Bc/8N0frA1uX9MTDUy6x
	 qoHHYsZS4ogQJXAYUZOSGfeniAecFSRRtpb2xm+Ol+zOlBq6QcAC31ud5K++kxSE3Gx77
	 lJNfNRmBnAGuN2lAS+tNyiKPx2Xs4ywlPJPyvBBIB5stdRLyl8UCUV+t/KK2geP+YRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096769;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=yCzviHRtrUZ0YXLgZijIqRDy9BndmZGNi93gIcBU+34=;
	b=G/V4RBb9qfAS9Z0UnZp9gOG/BqmmnLsvV+Rf5cvsIEuVSoIdvebJUxAnuMSthCanh71n
	 NlOrgXDpBZDNB9gYHbsLAvmZQTIQuNABU6U227uzVndrleB4NxR9He4c9qV5QGqhYH39o
	 ZbGeT244cvPSLR9cTnvVn2WNO7+SYM4mspS8h/d13WMZtWIUK3CIHz0XZs4MV8csk90WN
	 gaFEeJwVffNNztF5+CNzISCWS2QbpGqpzqEjiIXEorIReaQRiZ2XQTZStZaMr61UdRKDX
	 qwPdlHkqNe6ELIZptMUlwFgGrycXHJ20C/z2c2lMNkP0YUnkCLV42j/vQGE5X7WvA1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A179D606A31A;
	Tue, 27 Oct 2026 10:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A179D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_nc1fOBqDTZfAA--.51539S2;
	Tue, 27 Oct 2026 18:25:57 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S2;
	Tue, 27 Oct 2026 18:25:55 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] docs/zh_CN: align translation paths and update guides
Date: Tue, 27 Oct 2026 18:25:43 +0800
Message-ID: <20261027102552.3801595-1-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMDW_nc1fOBqDTZfAA--.51539S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1fJF18Xw1DtF45KFyDKFg_yoW7Gr4kpa
	s5KryfK3WxAF1UCw48GF47JF15Ca4xW398Kry7XwnYqr90yr4Fyry5try2q3sagryIqa4Y
	qr4fKrWUu3y2yrJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUvYsjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Some Chinese translations remain at older paths after their English
sources moved. Align the affected files with the matching English RST
paths and update their index entries. Remove two stale :Original: fields
that point to unrelated English documents.

The series moves the GDB debugging, magic-number, GFS2, and XFRM
translations. It also replaces legacy video4linux text with media
administrator and V4L2 driver API RST pages, and refreshes selected
guides and indexes to track newer English commits.

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

 .../translations/zh_CN/admin-guide/README.rst |  89 +-
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
 32 files changed, 2134 insertions(+), 1613 deletions(-)
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

