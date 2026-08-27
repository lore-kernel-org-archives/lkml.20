Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567F41B8F2;
	Thu, 27 Aug 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822284; cv=none; b=vBYeIlOtJ2w+CsJh6XOPKQ/NS+srLWlrM8t1bf++1dS+xSsnhJ9w+Aaxvbm/rM2RSbTR75lytOSiLYLQqjpJpJ60t7rtiMBDH06o/0IuO62Iw7Ff5OMPMVC4QWvxNBUGLvdj8byP5KXlC7OVpan+8b2H3ARTUjqTogicaz1I2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822284; c=relaxed/simple;
	bh=Cg4ZAfNGf8KMVQQMDraUIAQ9gerTtCCxcaHKDN+YbJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBtJRYFQNrMJG2Y0A0zcbn+GLpzzN17vNH9/JBUx985zQSNIpp6iT+13h0Y8a6DTxKsFQHhjaKCCywlwtKzx9FbVG1wWkQJkitvNvFKL3JGWMf3beqfDA7a8EORYCgZXsiXskO6QgJARHfdvbW+xFQ3DfcBtX4a/LkA6XcWiQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=oNZRIGE6; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="oNZRIGE6"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7YjgYte16FbuTVIo1F9PguT6oBSfTv5aoq2XAbKuJjA=;
	b=oNZRIGE61Q826VNXogMGk/Jyv70fx+SL+Ho2CDKx1J8Iqe0nchaXV/IrcMEQIHDLA9PUgSRz7
	s0IeYitybJUJEap6AR2WZi3Gtim+jchX/bWgQs/2tc3QW75Wn8HPjKKVVyPd/ubaH8pfUgfvu0O
	CqNsidq7RhTtFdJJlE58aTA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hVwd160W6zRhQt;
	Thu, 27 Aug 2026 17:07:01 +0800 (CST)
Received: from kwepemk300012.china.huawei.com (unknown [7.202.194.175])
	by mail.maildlp.com (Postfix) with ESMTPS id 247C62025F;
	Thu, 27 Aug 2026 17:17:46 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemk300012.china.huawei.com (7.202.194.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 17:17:45 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <hejunhao3@h-partners.com>
CC: <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mchehab+huawei@kernel.org>,
	<shijujose2008@gmail.com>, <tanxiaofei@huawei.com>, <tony.luck@intel.com>,
	<xieyuanbin1@huawei.com>, <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH] rasdaemon: ras-events: Adapt to kernel v6.19 memory-failure trace event directory change
Date: Thu, 27 Aug 2026 17:17:15 +0800
Message-ID: <20260827091715.62022-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827040641.25143-1-hejunhao3@h-partners.com>
References: <20260827040641.25143-1-hejunhao3@h-partners.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk300012.china.huawei.com (7.202.194.175)

On Thu, 27 Aug 2026 12:06:41 +0800, Junhao He wrote:
> Kernel v6.19 moves memory_failure_event from the "ras" trace event
> group to a separate "memory_failure" group, as the event's
> TRACE_SYSTEM changed from "ras" to "memory_failure". This changes
> the tracefs path from events/ras/memory_failure_event to
> events/memory_failure/memory_failure_event.
>
> Add get_memory_failure_group_name() to dynamically detect which
> path exists, ensuring backward compatibility with older kernels
> that still use the "ras" group.
>
> kernel commit:
>     https://lore.kernel.org/all/20251119095943.67125-1-xieyuanbin1@huawei.com/

Can this patch solve your problem?
Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e57d6e9e20b551e4910d7a6331a81775c3ad6693
