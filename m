Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA34349B6;
	Thu, 17 Sep 2026 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628176; cv=none; b=Fl5bJVm9AHoufmZv1/ksqPTv2tdk5bYu9tt5FnEQefNDON8lRWNaUxfvypx8rgm/HE9XmxHtihuj13dwgagouTTuPtSTbrgUzmhDjJImiCPKzgrdiWVw9qE1Q5U3zX7VApkqL/dg+wM5RJXOQ8VTNI35HY6tRkVGeXSODbWzQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628176; c=relaxed/simple;
	bh=0Za2lkAnzkGqgRO9rTZ+jPl7p2hJOwl9Twhs0pOpREU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=aJCA+pBgE0YryMLKyWZxkWAU/9yAZGFANcbP+6c3RxFru6hRyS6cwSlcZmnOChfSRT0K93mM//wj96tU+z3czNfFtRvXGw3k+8e6JiikBPQkU54yV1bUYwuxEQM6FhXFG0tfmZavbPjDijHrPIVmOTNAHK/bcQM+NbcPeV+W880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QlkL6Xoi; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QlkL6Xoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789628163; bh=/Gw4qlBm6AwOO9f3v1AjzWTUa+PP0TWvSh7qf0BcJ+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QlkL6XoiajoxE1YRt1P4cYPyUq15YiRaPMQlniQCnR7q2KpQabOe0aMHylFY6wW9a
	 hQmG+mnjn/DvxAMKFK63VgzPhOqwylLIXdU7X5HLxyHr5jTBJt8ZBt+uoRNrIrCHOa
	 SbHkwQECoJYZ22RxX4aRTUC67R8r/x0C72rcswlc=
Received: from XJSH01426.meizu.com ([210.13.72.171])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id E0103260; Thu, 17 Sep 2026 14:56:01 +0800
X-QQ-mid: xmsmtpt1789628161t6wm6c29w
Message-ID: <tencent_0490E1CAA4336214AB70F813325F3020A608@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5IDDSwlR44w363NKaPSXoFFztIYYIE9nq8IFqj6QiMqzVbvj+lM
	 lgaAUcXvi9S+FhsvJ3SfXcHAO7kPtrIdhsDch7GFjJar4SsVIPfKEbrgD2CAIQlfIh23Ck5R9GI3
	 fM4CFGa2shtVXEaG2byNsT+v0mu34w2bo2+oamvoK5n2e4yEV7683dy+btJY3nAPVckx5yJrc19g
	 xdhQ3Ze5UvVM8np4HtDfq4xUrnOCcRuVBVB+p284afZ5qeJ9RsqgBV4nuKW4sqekwYxzkIMVRVSM
	 ZVbLAtFZIpoIRY3lxWMb1bznnZQMR2L+9ioyoWkxLADyLIGmCiEP9PzF5wm0CEBYZtPZQ1BfzTy8
	 SnRWxaOODZQbgzt9uD4MvffoL1TXsxgtdiXdjLnquAv1tLT8o0728OyNbLE5M+Vj5mEIdaWnnp12
	 /UWxJiA8g05eghyytDrEKZmd44HgMj7JfK6gxHrKzxNry9vRtwFydBAl/9WeM+9qYDHj0F0t6Dyq
	 6pDCrb40cqzhLT+ewOvzpybp/sKgaHcrYr8ccQKlI/6C8seEPZsX0RXExNpd2syaKlmgz/0weWd4
	 aGyhUVc7+hJb3VYDlqrGaAI9a5yzFbk9WT8jVfb6EfX8EqLlDIkG1XeFd9tvxd18Y/EXg6FhHRbY
	 vDCOC80grqgDrClXJxQMJZw9D7IMbRpVIVv8wsLTeYMfFkTVYlvwTTTnEAeGzEirYbQ4WZklpXpv
	 YjGg0EPulTx/HLSag1//v4wgk7iyLuw9p+FmWGZ8yVU6V69jcVN1upCvNPiPW1NDHXFMXiszGo5t
	 W1GXurAXC5v4Lwzmi4Pkf7sdjgx8s4cU8bg8eGAsIjFP32iH4QMScnu9Ll1pBd+5acajSnJHypmv
	 Ib2qopG/K/TxGjfG1M4m7hc39Za+lmZDCOpxjJQt6TsbLmzJaeK8fTDplPAcw0CAB5d9us6lZ8uY
	 2BHjSfjwzDlBXdStd4CqVZROo4EjvJMLjbfdXlBjXl6uxa6F1MieMejqwcnI/q6TOGEGh9XGApyo
	 un33hB+mvWLnBRRiRlGi+aIgQbYF0dj2MUlSL1OLKq2FxMLkDPcXEBqqaZKk3Y6797lyX0IYGhAP
	 QTVD+MnTbJLvl6jK7y4W431VEWww==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] init, hugetlb: fix early parameter ordering
Date: Thu, 17 Sep 2026 14:55:55 +0800
X-OQ-MSGID: <20260917065600.564083-1-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917062837.558251-1-zhenghui.hao@qq.com>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hugetlb records its command line parameters from early_param()
handlers and consumes them later from hugetlb_bootmem_alloc().

Commit d49004c5f0c1 ("arch, mm: consolidate initialization of nodes,
zones and memory map") moved that consumer into mm_core_init_early(),
which runs before the generic parse_early_param() call in
start_kernel().  Architectures that call parse_early_param() from
setup_arch() are not affected, but on parisc the parameters are then
recorded after they have already been consumed and are silently
dropped.

Patch 1/2 moves parse_early_param() before mm_core_init_early(),
together with jump_label_init() and static_call_init() so that the
"parameters may set static keys" guarantee still holds.

Patch 2/2 makes this class of ordering problem non-silent.  It cannot
fire once 1/2 is applied; if you would rather take only the fix,
please drop 2/2.

Not tested on parisc hardware.

Zhenghui Hao (2):
  init: parse early parameters before memory initialization
  hugetlb: report cmdline parameters recorded too late

 init/main.c  |  8 ++++----
 mm/hugetlb.c | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)


base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.53.0

