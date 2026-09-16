Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BBA4EA37A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554165; cv=none; b=ml6qljpzQX+ezJJ8DD8CZCCxzjWCdrLzh6z1Nl8Id9tdsqiQLPs2GanqAxu1epo2fqV9dzyyIsQrJYfE4cDe3gZvlw5TkGvHetnXc+/7g3We2o36EEh9TzJKuE6V0iJx/R0Mg2sXgB61Qg8z7ESzdjSmZ3r2mKdUlHSMLjCXVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554165; c=relaxed/simple;
	bh=LaWqsRsY7lwyGYS9zC4kuEQHn/PDtAfdYiNfTA8uRno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmzBG28Oxw9/h0bJs93hjc/8s77zRAuPhM5pVwCD1LHZc879ApTzax6rmcWrWKoSn5G/rGpxDrCT9wM1NjIkz2OWyv08BQve4xoAW7j8dVFQi/3BxexFOzHgCIdHuUg5W2i/CQrjh3v5L80aKXmHOSizwebV0hq0yXoQnD1GeYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=JEa6cG0A; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="JEa6cG0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789554132;
	bh=LYiYZd2BkCMNuO+KpS0oBAcTyuKwxRkARJdKFXdNRZY=;
	h=From:Subject:Date:Message-ID;
	b=JEa6cG0AjNHreCcz/OLFJ8OTV80VISziYBXBrnBO04jKBoSThkJewR1Q8Kot1tQIQ
	 /wtraHKgvAqkhLvOVpxn/vMsIJ86+1gAL4XmgX7ppUl5rbDZKxX9qdupLx6HdR2iwl
	 LJMWKe0d8VYlfrRLzHcXfgqNZCA5lVojAEnInmo8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AAA6D3200001432; Wed, 16 Sep 2026 18:19:32 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8922956292237
X-SMAIL-UIID: 380486D655394534ABB8D63D88346873-20260916-181932-1
From: Edward Adam Davis <eadavis@sina.com>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	eadavis@sina.com,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] sysfs: prevent writing excessively large files
Date: Wed, 16 Sep 2026 18:19:30 +0800
Message-ID: <20260916101930.962961-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091606-distant-paltry-a3f1@gregkh>
References: <2026091606-distant-paltry-a3f1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

On Wed, 16 Sep 2026 09:17:56 +0200, Greg KH wrote:
> > Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
> > file write via sysfs_kf_write() may result in an out-of-bounds read when
> > checking for the null terminator of a string element in the kobject_actions
> > array within kobject_action_type(), potentially hitting:
> 
> What sysfs file are you hitting this on?
Regular sysfs files.
> 
> >
> > BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
> > BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
> > Call Trace:
> >  kobject_action_type lib/kobject_uevent.c:86 [inline]
> >  kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> >  bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
> >  bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
> >  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> >  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> >  new_sync_write fs/read_write.c:595 [inline]
> >  vfs_write+0x6af/0x1050 fs/read_write.c:687
> >
> > Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
> > properly.
> >
> > Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")
> 
> What changed to suddenly cause this to show up now if this has been
> present for decades?
This issue has always existed. It remained undetected simply because the
buffer lengths typically passed when writing to `/sys/bus/acpi/uevent`
happened to be reasonably appropriate.

cheers,
Edward
