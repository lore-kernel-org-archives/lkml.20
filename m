Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A136E52B1DB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950941; cv=none; b=d1bzif/qkB+eGUOlw/7YIbshWsWxKs8zuDuCuniVgtbLNH6CER1fUsueiZLL34mOeiCGxwa7UuJhWeKnUdJ7ef2fqRODf5mgoxUvVCYoeZzL+oaHDhw+e/efJnRwIHpHq1jT1IegxuNLfAYLqkvxzRQAFMN5k7BZinWalH2dvFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950941; c=relaxed/simple;
	bh=5PUqG+SJgWEA66zGGIWlpzsJipY79JOYTfO+xVztXVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttzyuCck87yjM9sARcIHMh9LtKJQ3Wwdl9SHaXRR1AbeM/2J+UDBjMGETle5C4CmBgwrS0OxLKWf/cVxVbPjS29xFnof8boYKWG0LeejBvax233txBsw98mHa93UCmgUzENfNrDVozf7FBYg0Vg1eDDbTxG68I1mig6csEKPA6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh0+QMI2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh0+QMI2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so46013a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950939; x=1789555739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFSttXHxqg3STxl4CZFUp5gfrywYxhL9Y0vz5R35gLc=;
        b=Kh0+QMI2etKw3t0rLmgnA56w0J+VMy0q676xryop26wVwQcGgumL66uouz/xFTthPq
         C/5M5Z2K2sccDD9V0q7DcqqyqPZFwTVE9l+HO08PPQfkfm/2K2USnJoJKLmt1NLevmbW
         heIDg3+3HiKq4cfRMZs+p1rQ91nm9UwkbWwE416Ua7ZdwracR1jM/MS8wKclMTMH1XS5
         rYNQcoaZCopci7GlFjrSQt7fq3fwYUu67v1t7OPzMCLTnaKk8FvXpvBCrijoHfqyGbE6
         2O1Ek4GABmg/6ff5wU0pDel7MGCk+FzyCqECY0/oPo+0kzbwwBT7k6B7Xf4wjlkNvMCK
         +DoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950939; x=1789555739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFSttXHxqg3STxl4CZFUp5gfrywYxhL9Y0vz5R35gLc=;
        b=Nf5lgk8xEie2VBE5k9ybXAQdBcFX61p40XS6tISyVnTc2ujcBEG9G97cW77BUPL8Ei
         ePtaWxMMt8avWJ763RsYfRE9Wz3A/3Ps6iCEM4WFKq7XFE0rr8Sy8voaWzH7UygIS1xz
         BHsKdkDWhk7R8sC4Y+xXtccRh0y0LTaP4Nhkrqo3oOit3ddfsC7G/7SIwVsumC1B65et
         f6ngkst/oR84w54b6HTdL5tlhhCCFiWZt/JQ67+ULcnRGtAHf+qA/qYXowcsXkMij1gz
         uU6rzopH557kGQjZvUiXd0QxRmnrtZP2daVXgtpQC+uOAiQvco9hm3zjq355aeU1/QeU
         ipjQ==
X-Forwarded-Encrypted: i=1; AKwUvByCmkMchuBmlmMj7pMGM2b2bqzHtOuoOSArNX5nSwB7BJQq3Mq5PVsxcfT/UCkOPC5q0FlDcVqAJBI6CFg=@vger.kernel.org
X-Gm-Message-State: AFuF++k1BfWotF1z2pM83do9GJwKvDQJEVq6GK3nzn1/bdwJitJ3m2kT
	earjgAxhfgxBlFScV848wALuTE5X11hdTCwpErcQH5G9N7cE2QYBdqXTo1JMVts+Tf4=
X-Gm-Gg: AYBFou2cea1qsV+fj+uJ+gTmW3qZzjyxEXp8s5sXOhIL08ygrOEvd6+vkURTPVSgJrf
	HbXt7EerpaoYX8f3LmqV//FpYDTuDAUc12Wdwzjos2ZZIP1gFTfne8f6CjnJ3ybd/oQ4wdqOVsp
	Ipsym5cKwLMKIM7BYAh3W3WCKa4ozCt8kuFjQsWgUM3fsnvx2IL1Sl5GWLxP5aiUwr+xL/p7QDU
	xfXWf4IyS+tFvKD5SwdjSqRWUYM0T+LBU+m9XjHtzlVAqoq+q42DelyQjiH1FJIwxZ2/tBnb7/S
	8HxsIz4MoyiNW0V9mVV3Yl00ZjZmVs/ZOsW9l3rCBcmNnnKYwXXWFlQXkqENFFqs26b75kIY+HS
	ng54/kcWRVdwHzquXTl0rwxy5JgX9NHT2oMS78Vltr1BtuQ1Hqqe3hxu7lL9Wcsqv3v5hshUYX5
	Kay7nVD4ZzC38qYGTYrpweyvW44qZXEHdluLY4HTzZf6IDQR9kOjl3v5DH+QxDxYWU7Y6v9tU0W
	IUj+G7115O0u8lGfO/TI2Ju
X-Received: by 2002:a17:90b:390d:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39d70a4f874mr68741a91.9.1788950938698;
        Wed, 09 Sep 2026 03:48:58 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm12026723eec.29.2026.09.09.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:48:58 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+690d666eb12fca6e1e61@syzkaller.appspotmail.com
Subject: [PATCH 0/6] comedi: validate the IRQ numbers supplied by userspace
Date: Wed,  9 Sep 2026 16:18:41 +0530
Message-ID: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

comedi boards are configured through the COMEDI_DEVCONFIG ioctl, which
lets userspace pick the interrupt line for ISA-style boards. Fourteen
drivers hand that value to request_irq(); eight bound it to the
interrupts the board can actually assert first, six do not.

On x86 an unbounded value can name an interrupt that belongs to the
IO-APIC GSI domain of a PCI device. request_irq() succeeds and
register_handler_proc() creates /proc/irq/<n>/<board>. When that PCI
device is later unbound, mp_unmap_irq() drops mp_chip_data->count to
zero and frees the descriptor from under the still-installed comedi
handler:

	remove_proc_entry: removing non-empty directory 'irq/20', leaking at least 'comedi_parport'
	WARNING: fs/proc/generic.c:747 at remove_proc_entry+0x4e7/0x610 fs/proc/generic.c:747
	Call Trace:
	 <TASK>
	 unregister_irq_proc+0x206/0x2a0 kernel/irq/proc.c:406
	 free_desc+0x89/0x330 kernel/irq/irqdesc.c:482
	 irq_free_descs+0x84/0xc0 kernel/irq/irqdesc.c:865
	 irq_domain_free_irqs+0x46a/0x5c0 kernel/irq/irqdomain.c:1917
	 mp_unmap_irq+0xf8/0x130 arch/x86/kernel/apic/io_apic.c:1061
	 acpi_unregister_gsi_ioapic+0x40/0x60 arch/x86/kernel/acpi/boot.c:722
	 acpi_pci_irq_disable+0x275/0x360 drivers/acpi/pci_irq.c:517
	 pci_disable_device+0x130/0x270 drivers/pci/pci.c:2206
	 pci_device_remove+0xb2/0x1d0 drivers/pci/pci-driver.c:512
	 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
	 unbind_store+0xf8/0x110 drivers/base/bus.c:244
	 </TASK>

The leaked /proc entry the warning names is the mild part.
mp_chip_data->count tracks GSI mappings rather than request_irq() users,
and __setup_irq() takes no reference on the descriptor, so the irq_desc
is freed with the comedi irqaction still attached to it.

Restricting the value to the ISA range is enough to close this:
mp_chip_data->isa_irq is set only by alloc_isa_irq_from_domain(), and
mp_unmap_irq() returns early when it is set, so a legacy interrupt can
never be freed out from under a requester. It also costs nothing real,
since every affected driver is for an ISA or PC/104 board.

Each patch bounds one driver, following the check das16m1.c already has.
Where the driver documents which interrupts its board can assert, that
set is used; otherwise the bound is the plain 1-15 ISA range. As in
das16m1.c an out-of-range value is ignored rather than rejected, so the
board still attaches without interrupt support -- the same thing that
happens today when request_irq() fails.

syzbot found this through comedi_parport, fixed by patch 1. The other
five are the same bug reachable the same way; I have no reproducer for
those, they came out of auditing the callers.

I have none of this hardware, so the change is by inspection only.

Reported-by: syzbot+690d666eb12fca6e1e61@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=690d666eb12fca6e1e61

Yogesh Gaur (6):
  comedi: comedi_parport: validate the IRQ supplied by userspace
  comedi: ni_atmio16d: validate the IRQ supplied by userspace
  comedi: dt2814: validate the IRQ supplied by userspace
  comedi: dmm32at: validate the IRQ supplied by userspace
  comedi: pcmmio: validate the IRQ supplied by userspace
  comedi: pcmuio: validate the IRQs supplied by userspace

 drivers/comedi/drivers/comedi_parport.c | 3 ++-
 drivers/comedi/drivers/dmm32at.c        | 3 ++-
 drivers/comedi/drivers/dt2814.c         | 3 ++-
 drivers/comedi/drivers/ni_atmio16d.c    | 4 +++-
 drivers/comedi/drivers/pcmmio.c         | 3 ++-
 drivers/comedi/drivers/pcmuio.c         | 5 +++--
 6 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.55.0.windows.5

