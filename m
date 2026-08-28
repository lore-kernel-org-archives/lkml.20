Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E83CEB8A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900095; cv=none; b=CdrrrBb3NZAQxIfIOd+yi0QkyXNFjEco0/8ddNplwstNsx39g742PxpcOg9ZEEodeEdUYoeSHwTVvgyKGa9vB4SS55DEF3MsfrjdqhPTdkTm1w4F/N3MHItWBRf3L02Yckq0eRxjcKyw8bHpQg4gl4SN0vKniCjD1snFLxeyY0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900095; c=relaxed/simple;
	bh=v+lkXb0jOX4Nz5+t6fZ4Y1JjK3iIJmf2z4W2JLTwlzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nk84MTyV6RRZMzj4rfzFDRiw3U3Z9VMJ+gaUuisPagGgeC1zYKu8M369TEhei2sG41fEPURZ3sVJ0ezC91Zym3080ZN7GB1ZEWBYXRPDiroNm4TOp86EsHUdwNSrxQiO5zsB5knlZwVPxdA+JFao8zk97X+9ufRIA2r46n5EJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=E56oZajW; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="E56oZajW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787900088;
	bh=bXf7gpvd8LUCX5UP+01Ox78xxROwMzp7Q45hhzrKHy8=;
	h=From:Subject:Date:Message-ID;
	b=E56oZajWH1BdbYRSq4TwBvuFLLjtN/YG+ZeN5W4PVxUJJvMMRpmfEpX65jqQ6kyHy
	 +CoJJ0KmOsuBXF84VLiGziTeKkxb+fzQQUWlFCH4Ll3JmCeH6OEMWesUFTQo0besqs
	 xB6tvEteBwP14P7kgVc0ZSLUtb8PdZJ6gB4/3C3E=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6A91308700005E71; Fri, 28 Aug 2026 14:54:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4003594457393
X-SMAIL-UIID: 117969EAE04D4D14B89C86704733B9C5-20260828-145402-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+b5d7ab56d43de3fd5aac@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] possible deadlock in tasklet_action_common (2)
Date: Fri, 28 Aug 2026 14:53:46 +0800
Message-ID: <20260828065349.1876-1-hdanton@sina.com>
In-Reply-To: <6a655704.70955b6c.323240.0028.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Sat, 25 Jul 2026 17:38:28 -0700	[thread overview]
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=13d446b9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
> dashboard link: https://syzkaller.appspot.com/bug?extid=b5d7ab56d43de3fd5aac
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1310a232580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c3b2ea580000

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd
