Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801677;
	b=41/ejkcFQ1afWvu6QOksu9MHMN+PDbMnRJ1jTdsy6FatdPk2QPfE4u7cmS3HjDDAnKYC
	 pQQ6FWCUESVwyHxUgLlijjLR6MmNYv/Jp+0aj+rgKM9rABmD71uJpG3i8qWiwsrNOTAlG
	 7NeSgbh++1crvQZRxa6eC3jmC6m6E575cv7JNNI470zxantBh4QvTBLtqa/z555SUtT1q
	 aA/pXOi22t9ckJxQxJNoa5/6KWGcrf4YrQrVwTIaW3h8yPcYcsI4KCz71W7mHBenXcQgU
	 0J3Kg1/ah16Qj2zJ0S2rsHMCanjQA263eNQHndYzUFgHLWnLiQcx8uaniatNXDsqq6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801677;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Xdo5bZLY2DoZii/U1MJc2OANsOKPXfKKQYL29ZUsrbc=;
	b=5CKaK80MpHtSA/wRboP/+o7Z9ZY7QJrx8CZHMkTilpf4kejAQfcPJZAMrMC/P7MdQBI3
	 +7flS++7mHq5EkyP2DONmK8Bba0ZUnV+6EX74NnGT7yN2u2YL5tfKY9LX0FAOPi0527bT
	 8J+aKEF35zLw9SdxfuBGuouizS/ZVuxX7DLQV+9Bm8JYIIofU2OWiDMx4uDLlVCniPp+6
	 lvuIWSoWcil/GjYim0Ci8ut4h4XaKUmGx/LbINjWSTkWz38fhaJA5oOySm8ye/uKkg9ox
	 GdpG44tGFeMxLz2vtyyQAr7XX0xdWTmb8OfvMAhGyryJf0O/+e/IVuA2FScSTK8ZKGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dyWpXNgl;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10CD606A895;
	Mon, 16 Nov 2026 04:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10CD606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dyWpXNgl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=Xdo5bZLY2D
	oZii/U1MJc2OANsOKPXfKKQYL29ZUsrbc=; b=dyWpXNglU6ujCSGDJjNRncR79W
	+WX53//HGoGn6+vqAxH59h/naj6AgtR+1e7eEtyh3wFNAGNvbjFBvTZzsKhkvwKO
	wMiaksBiaWAAelB38kjJLrvSXs724CxrRNN/1paqUutKNYr94Ca6NxdsFQtlVBYu
	ssX0sA9IRZuURNR4A=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.186.145])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBH0UXxf_pq+23FAA--.2556S2;
	Mon, 16 Nov 2026 12:00:49 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] pstore/ram: refuse zones overlapping the initrd
Date: Mon, 16 Nov 2026 12:00:47 +0800
Message-ID: <20261116040049.434247-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:3pYKCgBH0UXxf_pq+23FAA--.2556S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4UJFWUtr1DAFy7uw1DAwb_yoW8Kw1fpF
	ZxKw45Xr1vkFWfC343W3W2q34fAws3Jw45XF17G348Zw1Y9r10vrW7tw15WF9rJws3Ga4U
	tFZ8Xr9ruFy5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
	xUyKL9DUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREKB2r2E9lQAwA6si

On this board the bootloader hands the kernel the initrd buffer at a
physical address it picks itself, and it has no way to know about the
reservations described in the device tree: those only exist in the
kernel.  When the buffer lands inside a ramoops zone, the zone is
registered a few milliseconds later, the console zone starts writing to
it, and the initrd is destroyed before it is unpacked:

  printk: legacy console [ramoops-1] enabled
  ...
  Initramfs unpacking failed: invalid magic at start of compressed archive

The fix is to refuse to register a zone that overlaps the initrd, and to
say which one was dropped.  The zone is skipped for this boot only:
nothing stops the memory from being reused once the initrd is gone, and
the same configuration boots fine if the firmware happens to place the
buffer elsewhere.

Patch 1 adds a helper that reports the physical range of the initrd,
patch 2 uses it in the ramoops driver.

The check can only see an overlap while the initrd still exists.  The
built-in driver probes at postcore_initcall(), well before the initramfs
is unpacked, so the normal case is covered; a module loaded later cannot
tell, and gets no protection.  This is documented in the code.

Testing: reproduced on an arm64 device and under QEMU, in both cases by
placing a ramoops zone over the initrd buffer:

  - QEMU (-M virt, initrd=... pinned by phys address): without the change
    the unpack fails with the message above; with it, the console zone is
    dropped, the initrd unpacks and the machine boots into init.
  - arm64 device (UEFI -> GRUB -> 64 MB initrd landing at
    0xc1ab0000-0xc584a5e0, i.e. covering an 8 MB ramoops at 0xc2000000):
    without the change the boot dies before unpacking; with it, dmesg
    shows the three zones being skipped, the initrd unpacks and userspace
    starts.

Kees, Tony, Guilherme: I did not Cc stable, since this needs a bootloader
and a device tree that actually disagree about the memory, which is
unusual outside of Qualcomm boards; happy to add a Cc: stable if you
think it belongs there.

Qianhui Xu (2):
  init: initrd: add initrd_phys_range()
  pstore/ram: skip zones overlapping the initrd

 fs/pstore/ram.c        | 114 ++++++++++++++++++++++++++++++++---------
 include/linux/initrd.h |   7 +++
 init/initramfs.c       |  28 ++++++++++
 3 files changed, 125 insertions(+), 24 deletions(-)


base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
-- 
2.53.0

