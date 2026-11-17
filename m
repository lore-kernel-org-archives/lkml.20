Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927855;
	b=Vgq2uFoLwvJi4aNrHg5NzK6M/9sVl0SEk+zeQqybYHXxj1WGnNr1OQG0h6sUB5L6bk9o
	 gfEndFduVcqQ0NX0O2/5he1HDHF+LU9sWT22QFRrVPraoaKa1xnYRkep4kJBoxQZ5u9A0
	 NNgAwD0VvpDFhSQWkUUJeC2mR0ZxqENjga6EywySFdEHaDDxlyhN+O/6Is4DYscd72OOk
	 vMaFQZT/1rdl9Hi/tJF0jhKzuNBoZ64lZuZKZb8PMdzxEnDNZUwebl0eqV9wL4PuPIPdg
	 OT+c3JSJmRkTf+3crJPSqG2lYjprcgjjY5EGoTWiJnwL8O84220OdqlcnpWAn4HkEcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927855;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=pzx1xyaW4sUUsdz2pDb9Y+wGAMP4JHlewv5IqeGTNg8=;
	b=Q1dgXp0VKBla70SEZgBuIOeTdrVC+TgoFZsUDYm06JDAuiM/mpspy8xJHzeifoZ7v9TE
	 lZf/M4Iw4ijYk1I9Oz5TJLzZ1Qd3F+lM8/xFO2Ly4nGfFR8kU0ZlmmQGuIt13H/b99oe3
	 NomyV6WIzEHAB1H4mzrkBpu+zNxvtsKhe1dZEnyc8EnQxz7v0/FEwnb/nG5s6qAvevzqR
	 dgxPMTUB1VHby/xSEd+Dh/sodzVmy2bFG4UQHhpiqRDPqT4U4G6z8yivC7EAMzDMrGNx/
	 DWrDu4pPumK2UAJ8yoqlj6nxD0eb0QeFy6D2fsO9CoI3GFLiZ9uMRozknNsDehV/c7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=logarcheon.com;
	spf=pass smtp.mailfrom=logarcheon.com;
	dkim=pass header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=aPCppup2;
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2F606A31C;
	Tue, 17 Nov 2026 15:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A2F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=aPCppup2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=logarcheon.com;
	s=protonmail3; t=1794927852; x=1795187052;
	bh=pzx1xyaW4sUUsdz2pDb9Y+wGAMP4JHlewv5IqeGTNg8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aPCppup2m+QXQC1pRIA5uYyoA9PaPgEM2u/Bljce4E2ZYSeBeHCgq8m6Y+kFY18mG
	 sUfxGxJrXdy0p2cIg3RZy5cwWFzxxJLIXpkeM13BW3m1KFRDxsI9hSMtYLa4XGSf9d
	 //uXe2xrNoswYBV/yz6eRw9ny0+l9ZpMBGkjcBPwCp5/oXCYuyZ3g+8THXJfGyYz/j
	 FDHu+nAesaXvctQMMc4jgTiZxE3DUDPUDTp5SWCOGwOXywaxX6Z5IBsnnBEfsEc7Ig
	 UwVHAOGkJuWKDZMII5+DX+3GmNpC11JsLDlb9JYkfstu2PtQRz26fHLR3RbdNC4jg7
	 J5R/SBbh4ndRA==
Date: Tue, 17 Nov 2026 15:04:06 +0000
To: Breno Leitao <leitao@debian.org>
From: William Chuang <founder@logarcheon.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+c75a7db5ca6ae96ed2d4@syzkaller.appspotmail.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] configfs: give the root directory inode its own lockdep class
Message-ID: <20261117150358.8149-1-founder@logarcheon.com>
In-Reply-To: <20261117065314.4309-1-founder@logarcheon.com>
References: <20261117065314.4309-1-founder@logarcheon.com>
Feedback-ID: 145408520:user:proton
X-Pm-Message-ID: 4a35432a783bbfda2261fff32445b853f8b7451a
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026, Sashiko AI review wrote:
> Does assigning a separate lockdep class to the configfs root inode's
> i_rwsem hide a real ABBA deadlock between renameat2() and mkdir()?

Yes, and the deadlock is real.  Please drop this patch.

My analysis missed rename(): lock_rename() locks both parent
directories before vfs_rename() finds that configfs has no ->rename(),
and when one parent is the configfs root, the root is locked first.
mkdir() of target/usb_gadget/naa.<wwn>/tpgt_1 runs with the naa.<wwn>
directory locked by the VFS, and usbg_make_tpg() then locks the root in
configfs_depend_item_unlocked().  The two orders are opposite.

Reproduced on mainline 666539eec without this patch, in QEMU (x86_64,
2 CPUs): one process loops mkdir/rmdir of tpgt_1, another loops

  rename("/sys/kernel/config/nonexistent",
         "/sys/kernel/config/target/usb_gadget/naa.<wwn>/nonexistent")

Both hang within about a second.  sysrq-w shows:

  mkdir:  down_write
          configfs_depend_item_unlocked
          usbg_make_tpg
          target_fabric_make_tpg
          configfs_mkdir
          vfs_mkdir

  rename: down_write_nested
          lock_two_directories
          __start_renaming
          filename_renameat2

A third process doing readdir() of the configfs root then blocks in
configfs_dir_open().  I ran the test as root; I have not checked how
much privilege the rename() side needs.

So the root lock that configfs_depend_item_unlocked() takes for a
target in another subsystem, when called from a ->make_group()
callback, can deadlock against rename() whatever the su_mutex chain in
the syzbot report.  I don't have a fix to propose yet.  Is the root
lock there only to keep the target subsystem from being unregistered
during the dependency, or does it protect more than that?

Thanks,
William

