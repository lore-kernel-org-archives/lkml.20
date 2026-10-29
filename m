Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277884;
	b=FTiQGbeR98Fv/6kedgxOqBpRAYsKPWjxBlye2/ISaUpx4QupAdoiJSVjSxV8iyuQplO3
	 aW+XPdNGLJFNi/XZxYOYufIyMVjurE3Eim9dMYILFUG6C7rWv1HRt9jdM33HQpRTiDJJL
	 tMmBuu9LLu2niLdGUaDvpmIV6nM8R5nDWzikwNjnkf598mbkC52EtwJJtC3+pVrg288hw
	 FI/lP1ZppoY255dWU2Z5p3x7XFZgm1Qj1XB2fc4Tuii1RPsF9knuUV0z4KyajAgqLtfUA
	 kmL14uiBncVcJPTTjcQba8VjVUll0+y1qVNOo++EeUqVRH+t82KhkZKQL6Eo12nRpqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277884;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=eI8ZZd8en3QYfvcjzqp+JkGFuEmQHXuaCy1AyC6sb3c=;
	b=I5ZPxnMWpRxV8qSLaDDywZ7RVQgA1Q5r4Q2uYt0LkJHhk5SBnFeUep4xDXJghBuaXBra
	 6NwF3PtRVVcjHzISzsRaJdhqQ3DfhnqH9jfXF5cDwRp4ycFdJ9unqA3ExNwn0TgtqylIT
	 C12aKadwlBhahqA0yayLUZZ5dlvyGYAe4+GWuOWtJeJI1mZaXUP2/OyhwXJBOFYiFuoYK
	 DRraCGNmRwW2PMfcFMrG56Lbi1VYoihy6WVPPL8xX7Bv0I0x6YT15EpKynSoK9DDQiTt3
	 9MmPP12NMyXP74x8Pqfnpo2NdGlSBz+7Tob5kmygljz4vOo/k6/HY2RK+a1MEPmNFwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25B8606A31D;
	Thu, 29 Oct 2026 12:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAGS6GxP+Nqqh1KAQ--.58917S2;
	Thu, 29 Oct 2026 20:44:33 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDn7zetP+NqnGIEAA--.8789S2;
	Thu, 29 Oct 2026 20:44:31 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] docs/zh_CN: align translation paths and update guides
Date: Thu, 29 Oct 2026 20:44:20 +0800
Message-ID: <20261029124429.294868-1-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMAGS6GxP+Nqqh1KAQ--.58917S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvPXoW5ArWUtw43Jw4xXFyktw1Dp5X_Ary3GoZxKw
	45uwsrCF17JF4kGr48Ar17XFsxCrZYqw45Aryqg34Yg3W8Ww15Xw15A39093y5C3srXry8
	Ww4rJFZ5A3Wrn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3AaLa
	J3UjIYCTnIWjp_UUUOG7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUAV
	WUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bxv3nUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Several Chinese translations are no longer at the same relative paths as
their English originals, and some Original fields are stale. This series
moves the translations to matching paths, adjusts their indexes, and
removes stale Original fields. It also updates selected translations to
newer English commits.

v2->v3:
- Remove unused top-level labels from the translated V4L driver index,
  process index, and magic-number guide.
- Update the zh_TW admin-guide README reference to the relocated zh_CN
  GDB debugging guide.

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
 .../zh_CN/admin-guide/media/v4l-drivers.rst   |  42 +
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
 .../translations/zh_CN/process/index.rst      | 109 +-
 .../translations/zh_CN/scsi/wd719x.rst        |   2 -
 .../translations/zh_CN/security/ipe.rst       |   2 -
 .../translations/zh_CN/staging/index.rst      |   6 +-
 .../{process => staging}/magic-number.rst     |  33 +-
 .../zh_CN/video4linux/omap3isp.txt            | 277 -----
 .../zh_CN/video4linux/v4l2-framework.txt      | 958 ------------------
 .../translations/zh_TW/admin-guide/README.rst |   2 +-
 33 files changed, 2127 insertions(+), 1614 deletions(-)
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

