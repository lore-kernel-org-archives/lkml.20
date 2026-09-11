Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B503DB970
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094847; cv=none; b=U6vHcze5/3B4Wz4KmggarGVwRPJ4eMnNjTMkrcCgdjqbtyCsIDbYrLjpjZ2PP7VIq5RmYxdka6vONKYMjZ+h8HlLIq/OUSEDsAK6hu2uxw0VGhCNUpsqSLyDlciWvi+68C6PQreqQtjXc5BGKKnowjjasF5UY56ds+GQ5NkdUi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094847; c=relaxed/simple;
	bh=bN0dm5+ZIHeXEI3H26Swv4CSrnyWa1h/NCfi1db6JJE=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=QYwxNGQkmGVpH/LLKPz0OUA/KzFlJZYa7wOry7H8ch0HRFrCEb9CwkoxoaPGtWErllj2+hNrVvsNqt/3h5Npu9c8FYffW6y797+pvjL4HhJ1bQ93QTGxjac94KAY/ITYFuhoffCZMkWYA0DZRa3dhNRyLeiYlWWf1yXbzh2iom4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hgzTw1N8Gz5BNRf;
	Fri, 11 Sep 2026 10:47:16 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68B2l7ge014254;
	Fri, 11 Sep 2026 10:47:07 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 11 Sep 2026 10:47:08 +0800 (CST)
X-Zmail-TransId: 2afa6aa36baccc5-afeb9
X-Mailer: Zmail v1.0
Message-ID: <20260911104708495mqMlpf35iUZHINWhnesfL@zte.com.cn>
In-Reply-To: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
References: 20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn
Date: Fri, 11 Sep 2026 10:47:08 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>
Cc: <mikey@neuling.org>, <jiangfeng@kylinos.cn>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <zhang.yue5@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcmlzY3Y6IGxpYjogRml4IFpCQiBzdHJubGVuIHdyYXAtYXJvdW5kIHJlZ3Jlc3Npb24gb24gaHVnZSBjb3VudHM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68B2l7ge014254
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 11 Sep 2026 10:47:16 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA36BB4.000/4hgzTw1N8Gz5BNRf

Hi Paul,

Friendly ping on this one - just checking whether there are any comments,
or if it needs any changes before it can be picked up.

Quick recap: commit 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading
past count boundary"), released in v7.1.10/7.2, introduced a regression
where strnlen(s, SIZE_MAX) returns 8 for any 8+-byte aligned string:
the wrap-around boundary (s + count - 1) & ~7 folds back to s - 8, so
the pre-loop guard always passes.  This truncates names built through
FORTIFY strcat/strlcat - e.g. device-mapper's sysfs name "live-base"
becomes "live-bas", which broke blivet/anaconda installs on RISC-V.

The fix stays entirely inside the ZBB path - no fallback, just 2 extra
instructions - by saturating the boundary instead of letting it wrap.
Normal counts are unaffected.

Verified with a dedicated test module (all cases pass) and a 6098-case
semantic simulation comparing the original/current/fixed variants
(0 failures, 0 faults).  Happy to rebase onto riscv fixes if preferred.

Thanks,
Shao Mingyin
