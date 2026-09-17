Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010673033D8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631429; cv=none; b=gLN6pisRJvypZerRr2Bz+cCU/6QCBDH2ePRfUOmLnMLSy+4bseQzK3K7FGIt9MMQsrqa3gEs50fbj4Q1HtZd3HVUVk4QoWt13lXrfBmzoGxjn/8gOK0MTz6ErIIZrumfb2Tyb7eZsADhx0WjVBWX/woWZpG/K0WaPCK19KzUy2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631429; c=relaxed/simple;
	bh=JvmJSmcIpi61JUYXX2SSREEZE7UoMBYzmRbwBiQxDgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfmKXSGxkTBHjD9bEb+zHERLSgcvwvvjT6Mwr+jRqIannLFGvK0/50RfxFul+0IwG3qZIPz8THQqQi97Sm/xQVEZ4q+9cJW9e54EyqjmuPKBqVHTycmRL0zX1vCZiWJMogSHlphXUDIgTdarwRBQE91WGqAMEEXO4rbmQf5Bu1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LFvNGzoi; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LFvNGzoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fo
	sAeGOR7AXGO4PfO3CMoooq2gVzVdZ2o9cGkWX8ls4=; b=LFvNGzoi1fximF2a0Q
	TplBxJadG+Djpaf6zT8tsO926VE2paJ3goRHY4ZFbnMQ1JLNThIGwJxR7cgDgUj3
	TzI0eOPsDcpOaNrJzCnRKslmMmVJuKvs/b3MZkj5I+11Rbqpah89h2KHcPtm7ZnR
	0rgaeQLZFui+EC6d/MUupA9Ro=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3v5Cxm6tqUPnZBA--.15363S2;
	Thu, 17 Sep 2026 15:50:10 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	syzbot+7d1563afac6cb196a444@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] hpfs: reject dirents with an invalid length in hpfs_count_dnodes()
Date: Thu, 17 Sep 2026 15:50:10 +0800
Message-ID: <20260917075010.328328-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5b039133-96c2-6b51-a2f2-da1205234ed6@redhat.com>
References: <20260916073354.40306-1-quchaosheng000406@163.com> <5b039133-96c2-6b51-a2f2-da1205234ed6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5Cxm6tqUPnZBA--.15363S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4kGF15Ww1fGw4rAr4xZwb_yoW3Gwc_Jr
	1qyr1a9w1xJr48ZanrKF10qrZ7GF40kr43Zw18Xr12y3s2qF10qFZIvwn2yF1xGa90vrn8
	A3WFya17CFnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRE89NPUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDABKYDmqrm7I4agAA3+

Hi Mikulas,

Thanks for looking at it, and you are right. I checked the syzbot reproducer
and it mounts with

	eas=no,case=asis,check=none,

so this only reproduces with check=none, which is the documented behaviour:
"no fs checks - kernel may crash on corrupted filesystem". The check in
hpfs_map_dnode() does cover the dirent chain that hpfs_count_dnodes() walks
(from offset 20 up to first_free, which is exactly the range the walk covers),
so with the default check=normal the walk is already bounded.

I also should have added an "Assisted-by: LLM ..." tag to this submission per
Documentation/process/coding-assistants.rst, and did not. Sorry for the noise
and for the extra round trip.

Please drop the patch.

Thanks,
Quchaosheng

