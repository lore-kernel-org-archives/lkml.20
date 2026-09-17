Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463F837C926
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610019; cv=none; b=lt8voQkrSmBew1ICdTj/ivQ952KDXD/374TfgVTbwYTl/CHzShkhlznVvl4wCgU5WlUxHR4y6B2unsPeCv/vlZaGb4tUgTuQjcR9kjVmxdwAgk1QXIZmfzll7XJOEMi3SvJEGAcvyc7xrkx80Q5yDl/ZuE3GCkh7c3heD4tqCUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610019; c=relaxed/simple;
	bh=EaVqbU292AuwFapuxfN5YLIJ2O/is7JX1+jkZo2tIEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNySsSOOkJ9z5NQ61OvBtlQ/SsXGFnvfXuYla4q+jggfRD4Op0ncae6vpiHVl2S04yPA5jQdiq/cPl2AcXFInCWmgk7n/z+T0gvAEUH0IEd4VmZ5G8pqk8IQYoUZqctSLjYM4bgtJ6PbqEf10uJwxOX8a1fgfnsxmxhHvfxzZjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=y5RDj7HQ; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="y5RDj7HQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789610014;
	bh=RPtoNEV3Z+3HyCcwmOrt2r9tq2v8XBZbH0LahDXUOg0=;
	h=From:Subject:Date:Message-ID;
	b=y5RDj7HQqJlFauDXKQbC49yHyzO0Jxq5vLoc71Qc043alrBCiAHrcGxKI1IFtovNK
	 IqWQkMLDlzMhM3VQ7uXu1wVuJzJ7jPQ8t8haiLDQG+ZGDsBa7FwmdpOIIBf569DUiw
	 3E04IPyMPTQnscCG9/i1aht2sTTS/63tLVksUgvQ=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AAB481200004D4E; Thu, 17 Sep 2026 09:53:24 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7947856291846
X-SMAIL-UIID: 094AA82588364CB7B8349FCABCB040D1-20260917-095324-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Date: Thu, 17 Sep 2026 09:53:17 +0800
Message-ID: <20260917015317.975430-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
References: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream f6e7b42bf05b

diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
index 6f88b507f927..6bf3e2da7bda 100644
--- a/security/keys/user_defined.c
+++ b/security/keys/user_defined.c
@@ -61,7 +61,8 @@ int user_preparse(struct key_preparsed_payload *prep)
 	struct user_key_payload *upayload;
 	size_t datalen = prep->datalen;
 
-	if (datalen == 0 || datalen > 32767 || !prep->data)
+	if (datalen == 0 || datalen > 32767 || datalen < sizeof(*upayload) ||
+	    !prep->data)
 		return -EINVAL;
 
 	upayload = kmalloc_flex(*upayload, data, datalen);
