Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5240488221;
	Tue, 22 Sep 2026 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100853; cv=none; b=e1htJm3rXQB744uHGSEyAm4m1oJluvM6GmAgqQgV9wYF8fkddHFxBtgkYvnUht2/6TiNIh7CwSX3b8yyVvHuN7OtNzKv3S+y2SSHu2Dc5fZe6K3msV9BY60meBlRuQUJGIn+GbKR1D2M+F2bqZWIXoEyyMKeDCHploFZzmT/IJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100853; c=relaxed/simple;
	bh=WUd4KVd80yiwpQpxuo9OM6auCztcxLvO5pUi7gz8JNU=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=sTu7HKTBOOFiPtbERcm+DbyUNJcSQfk0K8wicrqywvIyoZ/45HpSnHB66PxJYCVrpfh9/2dUXpwT2KjeS2adfrEuMABoN8oDu+bBht3ez22DEmyneTGTvZ/ZJZwoLSQ9Vs+ojyrQ+9G6KCXNf1Ev7VaXuqOfKm6gqmvmmyFjjeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AFkxH+X2; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AFkxH+X2"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hq7XB3RwvzKmHM;
	Tue, 22 Sep 2026 20:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790100842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Td77s0ZeSOepE8kUVlcSMXxvitrVVTnHFEysvtGYzX0=;
	b=AFkxH+X2Q0RyHZIBJJe941Mz/zPT4QdeZHWedrD2FvnM7KY0BAAP9KeFqlsNYoitqvQ1+8
	jHwxca9MtzYP4QDHme3+Z3VlKrtAeob2plfs45DHw1cmU6EUerTQJ2mEQGtMB42TWMywoo
	LyxAccWpCsJ/fcEm0xyxhXRSaokrLeBD4NHzd5JK54kjExkfFkf87OTTs615Whsdsp7WAv
	O8JuzUoKuPKpu4Pa+G04w7wF2RtNK52qbXZisc2iDSU/BbjODewGbFM1JpA4ehqTxKrjsO
	xjtvULqVC3Rv7WTNhXg6lxSd5UvUiOqncPKnOmD4vM2wZ4mJaGJJfQc8iBjtMw==
Message-ID: <1ccf42a99c89502a7a5e7038ed2ab2aa5a24dd7a.camel@mailbox.org>
Subject: [built failure] aicdb.h / __udivdi3
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Tue, 22 Sep 2026 20:13:59 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: be1991918be3378897b
X-MBO-RS-META: 9bko7qzhbm13n375jrsqmh6k3fwe4qac

Hi,

I did some built testing with randconf and got some build errors.

First error is:

> $ make KCFLAGS=3D-Werror -j8 > make_output.txt
> aicasm_symbol.c:47:10: fatal error: aicdb.h: No such file or directory
>    47 | #include "aicdb.h"
>       |          ^~~~~~~~~

This could be fixed by installing libdb-devel.
But than I got this error with the same configuration:

> $ make KCFLAGS=3D-Werror -j8 > make_output.txt
> date
> drivers/scsi/aic7xxx/aicasm/aicasm: 880 instructions used
> drivers/scsi/aic7xxx/aicasm/aicasm: 25 of 37 register definitions used
> /usr/bin/ld.bfd: fs/exfat/super.o: in function `exfat_set_vol_flags.isra.=
0':
> super.c:(.text+0x622): undefined reference to `__udivdi3'
> make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
> make[1]: *** [/home/manuel/skripts/next/Makefile:1390: vmlinux] Error 2
> make: *** [Makefile:248: __sub-make] Error 2

What can I do about it?
Is it me/ my system or the kernel?

Thanks
 Manuel=20
