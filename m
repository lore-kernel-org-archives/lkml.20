Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn [202.108.3.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223DC49E5F9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471497; cv=none; b=FvckGXNZvEEDV+oOzftQMJ705S/7bOehdigp6yP/Mgmp4/jJnCLVXHaxexxNK63USLyiagN6Xy6oWre8AwN6ltNiFaqtbLT/6q3qMEh0qk2SEm/tcv5ExTUKct8VCTx74kk0sI2QSH0h35iRM4Fvmx/vKsnU28mvi3BhJJL662U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471497; c=relaxed/simple;
	bh=Dti+p8VHxUrZODJIimmCAAxWTOZmacvEdqHwPL3bnvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQp/EI/3vbk/nhKIeTTNDdXpv8+yvZjC7M4t9+J9bx2ifBwrjcgIxhxYmxB1vvhE+yXtB9KLj2zxmJEQZNfCc2SRXK1qPOiZixa2gctQCV3kw6UBGMmA01zBChfyqTpClkdve0S3jhQBxfTYO6+cjNSntojcaMW0Q2HYsVOXyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=P96qVGMY; arc=none smtp.client-ip=202.108.3.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="P96qVGMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789471492;
	bh=MIloadkf9dTQiLI/RVicD1kwkMrF0IAmayjKsncjtTo=;
	h=From:Subject:Date:Message-ID;
	b=P96qVGMYus/UxmvFQyzFNY99CS6r3MPG1BqsakLF0BdkDCuu9+8kIXNixD81HQMAW
	 CluoJfATrkUA51IixmmNprpKqqPFhV/z2UERn85rtsuMrkug7VSoahhp3YtE61vfxt
	 HW7VtL6DTo9NP+qTas57PSy3to1otb9HQW4iKbuc=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AA92AD600005CFB; Tue, 15 Sep 2026 19:24:09 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6518046685421
X-SMAIL-UIID: 21038084D9DF4C2E95FAFAF845121A89-20260915-192409-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in bus_uevent_store
Date: Tue, 15 Sep 2026 19:24:06 +0800
Message-ID: <20260915112406.920101-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
References: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 50d05c7c76c9

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index cd5bb0f9fee6..a63130d18680 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -228,10 +228,12 @@ static const struct kernfs_ops sysfs_file_kfops_ro = {
 };
 
 static const struct kernfs_ops sysfs_file_kfops_wo = {
+	.atomic_write_len	= PAGE_SIZE,
 	.write		= sysfs_kf_write,
 };
 
 static const struct kernfs_ops sysfs_file_kfops_rw = {
+	.atomic_write_len	= PAGE_SIZE,
 	.seq_show	= sysfs_kf_seq_show,
 	.write		= sysfs_kf_write,
 };
