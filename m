Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0213EFFC3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116872; cv=none; b=Fpqfr663car6qV4N59EXlM8zmLiOt/H0Df2CJg2g+D2rlb/D4R+Pk56pZQuyq0MS3LD2HXRqV/NMivy0e4yVzODodv5Y1p5Tez0FnweDvdeCjCSvJxonmh5UzkBqvKAfToAtZCjHv9tqSQ+JcVbfr46YE/vPJUCkAfzz99lmxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116872; c=relaxed/simple;
	bh=6Nct8i659skTzVjhltD8xo2x9xQoSnQuTzazQ2wG9Jw=;
	h=References:Content-Type:To:Cc:Message-Id:From:Subject:
	 Mime-Version:Date:In-Reply-To; b=utCzkQScjL4bjRm5B3hwdK3c14YRL+XRZa0sF/vI+VEAF/QotQOgmOLdpBVTPIC2Yz/2LkPUVdTv1bR7bqN4+U9dNfOk88K6RtYpV2QW0rIQmhWP5z4uPZ6ShjOXosxaioV9mA3Jk5WKOSXD7UILKXxWYSCkemrIH2Lp2dTQRTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kbj+ZeOr; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kbj+ZeOr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789116859; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ll6mGsQ0NP/yiMN03dJvbR4RMY0hZg71ZwyOyHA0XNw=;
 b=kbj+ZeOr8Zky2fPkoD0pBRRkvfkcwZ08VVIV2G2+QMf0//Y5huajrCzOgEQZTeixqVYcTM
 G6rk8yBz4zIRZiOwiGgtiC7kdLWTZwrd0Doy8PqvpG5My2nk5A41XMc/QinJ7djOG10v2P
 UnVgtRkfY2B8WwfwwyM3ofrIa2gcZc7YECvKcXrkfJUNsnlfyFU4QgvHh1YO7Zl9up6rKT
 WxCdw+KT7alMlN06NijVDYQW32f938A9HXiqLTCWDqznyS8OxehaVBojIZG9kEvp7gmpC7
 wz3UdOgBHGGtwLzIb2sQH2zDQpfYyU9Jqedup21dV9jAE3Iu9YnThMhDowaacQ==
References: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
To: "Himanshu Chauhan" <himanshu.chauhan@oss.qualcomm.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<qingfang.deng@linux.dev>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<palmer@dabbelt.com>, <pjw@kernel.org>, <shuah@kernel.org>, 
	<thecharlesjenkins@gmail.com>, <jtaubepe@redhat.com>
Message-Id: <20260911085359.95227-2-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26aa3c1b9+b1e4b0+vger.kernel.org+qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware break/watchpoints
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 7bit
Date: Fri, 11 Sep 2026 16:54:00 +0800
In-Reply-To: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>

Hi Himanshu,

While testing this series on a platform exposing type-6 triggers, I hit a
failure that seems related to the mcontrol6 timing/hit semantics.

The current execute breakpoint path demuxes the event only by comparing
the programmed breakpoint address with regs->epc:

    if (bp->address == args->regs->epc)
        perf_bp_event(event, args->regs);

On our platform the execute trigger did fire, but the breakpoint
exception was reported with EPC pointing to the next instruction. For
example, the trigger was installed at 0x1062e, while the trap came in
with epc=0x10632. As a result the handler did not call perf_bp_event()
and the breakpoint selftest timed out.

This does not look like an instruction-size matching issue. The trigger
itself matched. The problem is that the kernel identifies the matching
execute trigger only by EPC equality.

For mcontrol6, I think the driver also needs to be careful about the
Sdtrig version exposed by tinfo. With tinfo.version > 0, bit 20 of
mcontrol6 is no longer the old timing bit, and hit1/hit0 encode the
fire timing. The series currently still defines/clears
RISCV_DBTR_MC6_TIMING_BIT and, for watchpoints, only checks
RISCV_DBTR_MC6_HIT_BIT. The execute path does not use hit information
at all.

Would it make sense to make the type-6 path version-aware, or otherwise
avoid relying solely on regs->epc == bp->address?

Thanks,
