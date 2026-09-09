Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF45B52D2C8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950951; cv=none; b=X34aHeMfocmEBWvR4tLtgl7B5nHg8x11tBRpRtpPZQ8NLYmS1snJpKC0vfSB3d5znPAnNrzCjdA+ZNm+6WWeshjzQ+3iQCjzdmDj84fyub8ljGFQNC4Qo5rSc2CXufBLwFhwP5LS6RTFh4vi03TGyxlfwiSjGBNCPURvH3Q76MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950951; c=relaxed/simple;
	bh=EqVQzSbQ8FxQSn7HL+wfusLM5qWOzg38zdmSWfOhHUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tWFhnT8N37I3PecsXTGP9pd0K4Iaxz8ohTpfFRAN1P+h1fqHIOl2+UoVYrYV9OVY49qx8hac6JyAaE8MnjXGXT6mpnfkoa3v5LmPmBq1VhPfty3q4pcebh57tYuZg/1xk2iGjMdoSW+acSsXqE2luu1/1mCTSvQBjkR4FQlXCeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ml/UEum8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ml/UEum8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d944747d41so62253225ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950949; x=1789555749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6H9r9Y1iiMNm6s2u3z5FmxhhAAJmyha2D2o8ORi1TPw=;
        b=Ml/UEum8R4ZKXjkdby6fhTbE+sMmeCfFWIaNITnU1zG9lRW3hGVawkvNLgk4StC89i
         wTxXroAocW7J4f//U3XZtN0i3um9HzKp2g0GQVas1ibQfftjCihliPckttmcV6ddEeiG
         QOQZLVuAyLifXyK2264AWk2ZX+jF7Z6jbq59QYa0jkLfKdgqe96N8PQ75Uock2s6l7Wy
         fSs2QTpt8DooACv7/O0zbC0KWur4yIDNrEyJ7meh5UbCdt68MHe9VfXsnKm9sZAEVcXO
         wksv92EBwBvbrDplLGDKNJTzwh2X0YbaoO5NjJJqku5C/S+Qrbl2F1jbnj/6j3u3S1pn
         cdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950949; x=1789555749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6H9r9Y1iiMNm6s2u3z5FmxhhAAJmyha2D2o8ORi1TPw=;
        b=V1xNgrc6ZZplPw3VIt/BoMpq/Xwzydo9gGj79GPJzlZobTcf+dFlVNieXr3rkVvtEI
         c433zhmM6lsJZ4rjA8YsDUotGdhykdswUwAyHaurk7E4titWrD27mZTdJLHVnfD/eOL2
         +ArovKmFz5L9VhE4dYezU/0cBM3n0mRwLYaHYfry3als+frl/F1ep99g6rOepKA+C8VE
         Pf1LClCMKn29GzyP18nG3tARWNEnvLAu2ChcpPkyEh8jcYLsa63Eq5fREg42QDeMQRSg
         d6G+hxrWUZYRmp7jitYlZvryv0oKObietSaULoCvn2tJBwyxYOfcBPh0R9e6Hm9G4A1N
         FTsg==
X-Forwarded-Encrypted: i=1; AKwUvBxRZyw+xlYn/Qn7NwU2pxyZ2zypaDcOInGIn9NNF5jQxdw6a+c7TSNl679PB6e1WG1XKq5SCB6/JDJcV6c=@vger.kernel.org
X-Gm-Message-State: AFuF++mhEIZ2iBi17qUH5j2kpk383bzDtpz+EKFel9d9wwd4XOKr9RrV
	ZmS/KRb+J5eUyaVowBKAQOr1fQmXed0tD5eD2jnZsyCjr0nx/VC9mOOB
X-Gm-Gg: AYBFou2MLZ96PClZxh2lrtr24OF449U4558Vq9ZLVwvko5qZ1X7N+uAaXIRm83dlvHf
	UjW70v1nzaSKRpVmKFt9KTTD2ZryDXQphy0iCmMglJV5CX+ooxNWc4+/ma0hLcs/h6Spb+vksgY
	GL9a+lhzCgGxr8y1a/47gUSK7DM0deAy+XT+UQsTVlO4j6nWtPZM0SOfGJAfpQsXfl84sJOm3r7
	GaI6QV0AsfD3xUGIlX4Ttm7DwvdkcjrS23myuhCXUD1ayOteQK5GfQG6S+PYA50gjC51h2j/1fT
	HFc5OVU5pdD4laCk/YLP0+5Nu70PwqJNsIsrtM62rb3rpxAlN0uGuo39E0lho9b7q/ui1CwYYk9
	MD+ruks4AiaeFT7gYpEHXi9n/LtYB7ESfqhcF+CA3Uu60nnwYO+DvB8j/A989hdx0qgZVgqCHSY
	/wlQk0DK5nq67hDxVCxKlmTimUG4V/jNOKwKkRhFQPHTxAHs0Mu2NF1z0pdR6Bt6ChOzpVzfIif
	3JO+iBiiGymLkI+LGC0FiUT
X-Received: by 2002:a17:90b:3fd0:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-39b262981a2mr49484550a91.25.1788950948959;
        Wed, 09 Sep 2026 03:49:08 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm12026723eec.29.2026.09.09.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:49:08 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+690d666eb12fca6e1e61@syzkaller.appspotmail.com
Subject: [PATCH 1/6] comedi: comedi_parport: validate the IRQ supplied by userspace
Date: Wed,  9 Sep 2026 16:18:42 +0530
Message-ID: <20260909104848.1763-2-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
References: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

comedi boards are configured through the COMEDI_DEVCONFIG ioctl, so
it->options[1] is a number chosen by userspace. comedi_parport passes it to
request_irq() without checking it first, which lets an interrupt owned by
another irqdomain -- a PCI device's IO-APIC GSI, for instance -- be
claimed for this board. When the owner of that interrupt is later
released the descriptor is freed while this driver's handler is still
installed on it.

A parallel port asserts a legacy ISA interrupt, so the ISA range is the
right bound; it is also sufficient, because mp_chip_data->isa_irq is set
only by alloc_isa_irq_from_domain() and mp_unmap_irq() returns early when
it is set.

syzbot hit this one:

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

Bound the value before requesting it, as das16m1.c already does. An
out-of-range value is ignored rather than rejected, so the board still
attaches without interrupt support, exactly as it does today when
request_irq() fails.

Fixes: 241ab6ad7108 ("Staging: comedi: add comedi_parport driver")
Reported-by: syzbot+690d666eb12fca6e1e61@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=690d666eb12fca6e1e61
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/comedi/drivers/comedi_parport.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/comedi_parport.c b/drivers/comedi/drivers/comedi_parport.c
index 57ee3f9dfba2..94284ff157ac 100644
--- a/drivers/comedi/drivers/comedi_parport.c
+++ b/drivers/comedi/drivers/comedi_parport.c
@@ -243,7 +243,8 @@ static int parport_attach(struct comedi_device *dev,
 	outb(0, dev->iobase + PARPORT_DATA_REG);
 	outb(0, dev->iobase + PARPORT_CTRL_REG);
 
-	if (it->options[1]) {
+	/* only ISA interrupts are valid on a parallel port */
+	if (it->options[1] >= 1 && it->options[1] <= 15) {
 		ret = request_irq(it->options[1], parport_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.55.0.windows.5

