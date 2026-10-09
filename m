Received: from mail-108-mta58.mxroute.com (mail-108-mta58.mxroute.com [136.175.108.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1041D103
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558254; cv=none; b=HZxEsYhzAs8+fVPD3Mh2yoFjbPf8nSjMzLvH0KoYI/eqqXxGIpQGoM8tmsizoT/Lge4wxOWfVM1PUWJHCXITLgl+6dvKkkWO+MABVhiGQmM+lheRJYmybprPdvSViakviEYzTXWqi7hPhIQrL75mOlMtlpKFuIs1VCoN7Q/XSk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558254; c=relaxed/simple;
	bh=2lHbbukZNZUmKcVPjCEc6ORWQCcyLQX08dp2vWykOXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mpI/BQwi0L2Izg+/XHV0QfWwjj25gG+xqPAPeVllbjv/S49Uv9hOVW5FLif08udRyO19JZy068DJ7jBKgCu7rqfQfcilQizyyXAAGZmrb/pNtMJKBBJlhJueJF1dwO+Q/F7jZR8iJEK/3KCgyxmIKrzcjhXzsFjmmwrDavdh+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=sXhLU4AZ; arc=none smtp.client-ip=136.175.108.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="sXhLU4AZ"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta58.mxroute.com (ZoneMTA) with ESMTPSA id 1a1212cb9a300028b2.009
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 09 Oct 2026 14:59:01 +0000
X-Zone-Loop: 9ee6bfc1f27fc044bc47e2d3d23d6ac3c6cf9c380f02
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=ppjcGpEvrHxjx2Nr7a4lGYoWlI0lJqm2ZuVXqQIqgg0=; b=s
	XhLU4AZ3EUeI+1KmtuOHjbptHNPifXYNmt6Lp7s8+RKSBVn/k4zZZzvzbxXDXKaWsRzjcyyI1u7T/
	DuvIsQd7f1VAaGG4qpvPAl5DjdsCKLd8RC3RBzVYICiODrmrMuqPbQI7UtJGtsniumc2yGndGjE4w
	+hM7B11VRjXeuZ2QsTKywkZCu6HJmriCnc8BujvYtiNIQ+YTZaEWT7UvrlPcPGQYQsK4XSaxDyVFx
	39ZQruZ7+y/obU4ElqXs+0VyqdPNobN0zkgklNMN0ODFbn24XAOANjYnMrpoy/T4e5auo7sjqeu2K
	9jXUaO+fv22gHdbJKrsOTKHbt+p0TWIqQ==;
From: Richard Patel <ripatel@wii.dev>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Rubin <david@vortan.dev>,
	PJ Waskiewicz <pwaskiewicz@jumptrading.com>
Subject: [PATCH 0/2] genirq: fix use-after-free on abnormal IRQ thread exit
Date: Fri,  9 Oct 2026 14:58:40 +0000
Message-ID: <20261009145842.1616117-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

When a threaded IRQ handler oopses on x86, the IRQ thread jumps to a
function pointer read from freed stack memory. This turned a benign oops
(NULL dereference) into a wild jump on Panther Lake with FRED.

This series fixes two lifetime bugs in the abnormal exit path of IRQ
threads:

1) irq_thread() stores a 'struct callback_head' (for exit_task_work())
   on its stack, but the oops handler runs rewind_stack_and_make_dead()
   before exit_task_work() runs.

2) A concurrent free_irq() and threaded IRQ oops can result in
   free_irq() calling kfree(struct irqaction) before irq_thread_dtor()
   runs in exit_task_work().

Whether this stack use-after-free causes a loud crash (wild jump) or
not probably depends on kernel config and FRED, since callback_head
might not get clobbered always.

I have some evidence of these use-after-free in the wild going back to
Linux 4.20, these are all variations of double faults in an IRQ thread's
exit_task_work().

* 2026-09 (confirmed)
  * my Panther Lake laptop on recent x86 tip :-)
  * 7.3.0+: Second fault in task_work_run, wild jump, IBT violation
* 2026-06 (confirmed)
  * https://github.com/CachyOS/linux-cachyos/issues/882
  * https://lore.kernel.org/r/CAFb0CM1X8_rxdfJGM-1D6i0=KDtv9tbMbuWi+PKAhTSMT+5NnA@mail.gmail.com
  * 7.1.0-2-cachyos: Second fault in task_work_run, wild jump, IBT violation
  * 7.1.0-1-mainline: Second fault in task_work_run, wild jump, NX violation
* 2024-07 (confirmed)
  * https://bbs.archlinux.org/viewtopic.php?id=297634
  * 6.9.9-arch: Second fault in task_work_run, wild jump to middle of
                exit_shm, #PF
* 2024-05 (almost certain)
  * https://lore.kernel.org/r/cover.1714762038.git.namcao@linutronix.de
  * 6.8.6 (QEMU): Second fault in task_work_run, wild jump to NULL pointer
* 2023-01 (unsure)
  * https://bugzilla.kernel.org/show_bug.cgi?id=216865
  * 6.2-rc1 (Fedora): Second fault in irq_thread_dtor, GPF
* 2020-10 (likely)
  * https://lore.kernel.org/r/a45db8d2-6902-7ec7-cab2-1436209a15a6@gmail.com
  * 5.9.0: Second fault in task_work_run, wild jump to NULL pointer
* 2019-02 (unsure)
  * https://lore.kernel.org/r/524648a9-3fb9-1423-aa1a-376289fafc5d@gmail.com
  * 4.20.11 (Arch): Second fault in irq_thread_dtor, function call to NULL

And a few more which look sus but I'm too lazy to hand triage:
* https://github.com/CachyOS/linux-cachyos/issues/1027
  * "the fault recovery itself triggers a second, more severe oops
    (attempted execution of a non-executable page)"
* https://github.com/t2linux/T2-Debian-and-Ubuntu-Kernel/issues/215
  * double oops / page fault on IRQ thread exit
* https://github.com/Dasharo/dasharo-issues/issues/1849
  * wild jump on IRQ thread exit
* https://github.com/thesofproject/linux/issues/2676
  * double oops, task_work_run+0x6e jump to NULL
* https://github.com/thesofproject/linux/issues/820
  https://github.com/thesofproject/linux/issues/767
  * double oops, task_work_run jump to NULL
* https://github.com/libthinkpad/dockd/issues/3
  * double oops, task_work_run jump to heap address
* https://github.com/AMDESE/AMDSEV/issues/109
  * double oops, task_work_run jump to middle of do_exit, crash in a
    random mutex
* https://github.com/Askannz/optimus-manager/issues/176
  * double oops, task_work_run jump to middle of do_exit

Richard Patel (2):
  genirq: defer kfree(irqaction) until irq_thread_dtor() finishes
  genirq: move IRQ thread exit_work object to irqaction

 include/linux/interrupt.h |  2 ++
 kernel/irq/internals.h    |  2 ++
 kernel/irq/manage.c       | 30 +++++++++++++++++++++---------
 3 files changed, 25 insertions(+), 9 deletions(-)

-- 
2.52.0

