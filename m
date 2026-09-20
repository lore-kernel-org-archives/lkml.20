Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B793C3C0E;
	Sun, 20 Sep 2026 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789872853; cv=none; b=qoHDWhCq7dFB26OtQb+nvBn+NK2/t3K8Quf3ARye7Nu94MlAZAgJP9NtABSX7YqP464VC/SMhUPzeDK85DQfO8Eh3uNSXq2xiO/RRReOzLMkdd1qHu62zg30ov99ofLxOUKZ64an1i7xjkT3iu6+oBAmw+uCXe+BP2BVnDXUo/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789872853; c=relaxed/simple;
	bh=Ygd8mqBtO686mcux/rW6QmDvGLHBgqfYP/o58srjY0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rm3YVtzTZxMTUqpn1z6JtGdfjuQ+aAtekKvUN8USF84a5lgDtVTOCiT16nWWXTh7TldDRcwwd8KrJnN4QXjc02OxgozizZy62kp1XLGlm3q8CtUC+u9egz2wfA4XHeQU7CXkjiZNDoOIey+AWwa2GRoZTWpfC+KDRDH7uw0+3f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aa130zpR; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aa130zpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=18
	oqH9f+oHiRWywSgSOAkQ2UH8VirGYmfiB7j2Qvd3I=; b=aa130zpR1DGx81nBcQ
	LRVELi2u5BQfiNekEjUD3lHRNVnFz4SCafqhgF31vOm+gdsiq2RARud22sIFSD6k
	ncdyG0yRuckFiPRkJGvsHy7t5bsNQWVlOqP6CRD62czdB+lovjPRMIAeUqK5/DyJ
	Yp01VJdMHrixj33QguPJVVadU=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD33aGZSq9qsaQrBg--.118S2;
	Sun, 20 Sep 2026 10:53:17 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	Kees Cook <kees@kernel.org>,
	Nikhil Solanke <nikhilsolanke5@gmail.com>,
	Thorsten Blum <blum@kernel.org>,
	Kean Ren <rh_king@163.com>
Subject: [PATCH 0/2] usb: fix ASM3242 reporting SuperSpeed for a Gen 2x2 link
Date: Sun, 20 Sep 2026 10:52:41 +0800
Message-ID: <20260920025308.2358862-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33aGZSq9qsaQrBg--.118S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW7GFyDWw17AFyxCr4DJwb_yoW8Xr4rpa
	y3JFZxGrs5KrWSqw1fua1UXa1rZF4fJFW7Ga42q348CFW5J34kJFyj9393uF9FvFWIyFy0
	qa48J3y8Ga4kArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRGsUtUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC3x1A7mqvSp1pMAAA3n

The ASMedia ASM3242 (1b21:3242) reports the SuperSpeed speed ID together
with two active lanes for a link that is actually running at USB 3.2
Gen 2x2 after a cold boot.  Linux therefore classifies the device as
USB 3.0 SuperSpeed and reports 5000M/x2, although the measured
throughput is 1.49-1.60 GB/s (11.9-12.8 Gbps), which is above the
physical ceiling of a 10 Gbps link (~1.25 GB/s).

  Patch 1 is a generic correctness fix: get_port_ssp_rate() currently
  cannot recognise USB 3.2 Gen 1x2 at all, because it rejects any
  matching sublink entry whose link protocol is not SuperSpeedPlus
  before it looks at the number of active lanes.

  Patch 2 adds a controller quirk so that this hardware reports the
  Gen 2x2 speed ID.  The raw extended port status, the measured
  throughput and the list of resets that do and do not restore the
  correct report are all in the patch description.

The wrong report is 100% reproducible after every reboot and is only
cleared by an S3 suspend/resume.  Raw data (lsusb -v, lspci -vv, sysfs
and BOS dumps, kernel log) is available on request.

Kean Ren (2):
  usb: core: hub: recognise two-lane SuperSpeed sublinks as Gen 1x2
  xhci: fix ASM3242 port speed report for Gen 2x2 links after cold boot

 drivers/usb/core/hub.c      | 30 ++++++++++++++++++++----------
 drivers/usb/host/xhci-hub.c | 17 +++++++++++++++--
 drivers/usb/host/xhci-pci.c |  4 ++++
 drivers/usb/host/xhci.h     |  1 +
 4 files changed, 40 insertions(+), 12 deletions(-)

