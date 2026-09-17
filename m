Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437203546DE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624272; cv=none; b=ZyWE6LTqZKRA+rKjGL9Ez5tTZ4N5TU/AKmc3Zw2wvb9kXncpueCMH+uPUjM0cynvcy8pmovGz7h446VTF65geO30EkTFEOgBtQpZQifrh/tyfQpppL0MmQoG9+Pr2jPfqg8TCoDjwg8/Sun66vdVRFD4FPpQPI+u5cRbzHRxxCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624272; c=relaxed/simple;
	bh=ppv+Sgafr3loNJvxzuwfqSbXSx0RgqC3IJk1DMm42yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gu4UVOvELjbOFkzHX7xVZR/v/7b3zKzCi2Hu/Oiaz3JOKR+HQATc9vch7JLfbS4WZIriSkJF+h6Wo6wU2qp09wBJJLXryhUR4wTltCgF5Hj8wUQjYNgupsETTIPEj9egBKyC/7T2N+D1V0mWlzQMRRyg8ii5An7gHduqzRQIcuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=XXiS9mqU; arc=none smtp.client-ip=202.108.3.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="XXiS9mqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789624267;
	bh=+CA91Pn5+13sJshTQjpT97C1vsx+F2oOZ3wA6D+LYIc=;
	h=From:Subject:Date:Message-ID;
	b=XXiS9mqUFYgalvm6xfouiRzOy2YPiloVIyUJbADZDZX4zWeMuHlWrJrpR+uEby/5l
	 E5qXfnqJN/y7ACM3/A3uKHtba3cV0YXeiBvZ7k5mxa+UAVIQQn5Vs3llwP3vnYiLJy
	 uontEAan1hTxqlUF3bJ6Va5PW/tUDhMZG+X8uTFA=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.32) with ESMTP
	id 6AAB7FB700000849; Thu, 17 Sep 2026 13:50:57 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2083764456970
X-SMAIL-UIID: 4BE362624A994727AB109689DB38E72B-20260917-135057-1
From: Hillf Danton <hdanton@sina.com>
To: jchuang26@m.fudan.edu.cn
Cc: syzbot <syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: Forwarded: [PATCH] WARNING: ODEBUG bug in vub300_disconnect
Date: Thu, 17 Sep 2026 13:50:36 +0800
Message-ID: <20260917055037.132-1-hdanton@sina.com>
In-Reply-To: <6aab4219.87c06881.1db2b3.0004.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> For archival purposes, forwarding an incoming command email to
> linux-kernel@vger.kernel.org.
> 
> ***
> 
> Subject: [PATCH] WARNING: ODEBUG bug in vub300_disconnect
> Author: jchuang26@m.fudan.edu.cn

Huang, can you correctly fill up your Cc list to avoid wasting minutes and
net bandwidth like this one.
