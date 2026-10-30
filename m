Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.10.93.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359527;
	b=5Q92Ekf0TCroxAsQo3axg2iVsL+oALJnYeTnOVYN0h8cJQLAwNnnFS0L3vIfDBC01w+g
	 RfJwtTtBH+F4lek+Adg7eeGN1sgsoujZ1IT+LuchQFK/pIDU8dnLLL0fVaTCBLoumlHeL
	 zd0QxIZc4V4lFDiU/WPC7zsa6jdT56aUWskWUf9A6JFB96DqUEILKk65d+pIAOjU/Xiu4
	 kEHntoQVyeuP0xPFIDen1J3oG/8S2o9Iu9vr2nuhP9KiG14ZVMzavp/AqC3Om2BqKa9ln
	 jocj0zQ6wKeFDdiqXY/FWPDcG0TsDB4DPYmwMuyFamZaZVPBDpNFoqqzJLk25fR1RJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359527;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=GYxzBfV8nb382eo52z1jeyt/BLYppy/OrUDjVytaEig=;
	b=3vGnDxwUlnfNky62ErhAXs2yWVJ/QraYcp4Us1qy6a68Mpq32k7bU+8P32EPpuyVMDZE
	 4VYHwa1Pg05E+FZbWrQ/phiyhlP4MKK7AqHl6d9AX8eCEQrDww1kDtrICX34fGaKt7Sh1
	 W9DvlZEsDrYSaYz+Pu16TakpiKXz+5om9RP+EaDPcCD+dpzCWmix9zwbytxeJE+A1Ug0d
	 Wv8XqAtRgdJeXE1kid2JQwmtr0KZjBBMHRe8CfQZ6E8M+YaeqKbG1QECUHW9rxJ6yZcoJ
	 uloCzACXPy2686sUy5CRpAMfjFC/BKb3rNTHExbPc2/QAzBD6hSWgssSb9iuJ7JxnWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberprotect.ru;
	spf=pass smtp.mailfrom=cyberprotect.ru;
	dkim=pass header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=rsa-sha256 header.s=dkim-r header.b=QuS4jBxd;
	dkim=pass header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=ed25519-sha256 header.s=dkim header.b=Y57LJXjr;
	arc=none smtp.remote-ip=176.10.93.31
Received: from mx2.cyberprotect.ru (mx2.cyberprotect.ru [176.10.93.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5972606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5972606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=rsa-sha256 header.s=dkim-r header.b=QuS4jBxd;
	dkim=pass header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=ed25519-sha256 header.s=dkim header.b=Y57LJXjr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=GYxzBfV8nb382eo52z1jeyt/BLYppy/OrUDjVytaEig=; b=QuS4jBxdw067+NggE0xgNIi8NR
	GuFsxheNmzKidZcHFzLR6rklV79nUeAKdwEl2Has80OZ51/nlEyDjM/2unzONzZ/eRgTGV8OVy25q
	nKFDx7YXV1PsM+4fLfdiiCZpq+9RI6eQ22MzpYZuhmgr/DnX7w0p+5r/AG40UrTJCoQl4llqYijnF
	AAerwV/iRLirm+/QyxdiAfhgHVq/CB2Ki/HDEo9b4W2UlqUsHtDF5MKfo39m43zdIZ+Tl0jRl0etb
	tIaRCfHcofVGKeRkrhNdFjdYleRsoLlfQ+eexmXZgMMfAEt8adg3WPDVVUeIUYCtT1tHI1PDYMM1p
	4Ui85Whg==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=GYxzBfV8nb382eo52z1jeyt/BLYppy/OrUDjVytaEig=; b=Y57LJXjrCWbPUhFtq0k5kFusQu
	lfaamp727G7T/y5l642QXtWPv5y31FuA9aYzqRD2dHtPKSqXI5/fb7TsNzBA==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Oswald
 Buddenhagen <oswald.buddenhagen@gmx.de>, Mehul Rao <mehulrao@gmail.com>,
	Ji'an Zhou <eilaimemedsnaimel@gmail.com>, Norbert Szetei
	<norbert@doyensec.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Dmitriy
 Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
Subject: [PATCH] ALSA: pcm: Don't WARN on NULL dma_area in the default mmap fault handler
Date: Fri, 30 Oct 2026 14:25:02 +0300
Message-ID: <20261030112502.22227-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
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
Content-Type: text/plain
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-1.aip.ooo
 (10.77.28.101)

During fuzz testing, the following issue was discovered.

WARNING: CPU: 2 PID: 1734 at sound/core/pcm_native.c:3835 
snd_pcm_mmap_data_fault+0x47f/0x530 sound/core/pcm_native.c:3835

Modules linked in:
CPU: 2 PID: 1734 Comm: syz.1.352 Not tainted 6.1.187-syzkaller-00593-g063a81552262 #0
RIP: 0010:snd_pcm_mmap_data_fault+0x47f/0x530 sound/core/pcm_native.c:3835

Call Trace:
 <TASK>
 __do_fault+0x10d/0x480 mm/memory.c:4280
 do_cow_fault mm/memory.c:4661 [inline]
 do_fault+0xa7a/0x1100 mm/memory.c:4762
 handle_pte_fault mm/memory.c:5031 [inline]
 __handle_mm_fault+0xdf3/0x2e40 mm/memory.c:5173
 handle_mm_fault+0x2da/0xa60 mm/memory.c:5294
 do_user_addr_fault+0x4aa/0x1050 arch/x86/mm/fault.c:1338
 handle_page_fault arch/x86/mm/fault.c:1429 [inline]
 exc_page_fault+0x98/0x1b0 arch/x86/mm/fault.c:1482
 asm_exc_page_fault+0x22/0x30 arch/x86/include/asm/idtentry.h:608

snd_pcm_mmap_data_fault() guards the default RAM-buffer path with
WARN_ON_ONCE(!runtime->dma_area). As commit d2913a07d903 notes, a driver
may allow mmap before dma_area is set up, so this state is reachable from
user space: mmap the PCM data region and fault it while the buffer is not
allocated. The WARN then fires on a user-triggerable path and panics a
kernel with panic_on_warn.

Drop the WARN; the NULL check and VM_FAULT_SIGBUS return stay, which is
the correct silent handling.

Fixes: d2913a07d903 ("ALSA: pcm: Add sanity NULL check for the default mmap fault handler")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index fcb5f176f0df..dd640d90f6a3 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3832,7 +3832,7 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
 	if (substream->ops->page)
 		page = substream->ops->page(substream, offset);
 	else if (!snd_pcm_get_dma_buf(substream)) {
-		if (WARN_ON_ONCE(!runtime->dma_area))
+		if (!runtime->dma_area)
 			return VM_FAULT_SIGBUS;
 		page = virt_to_page(runtime->dma_area + offset);
 	} else
-- 
2.49.0

