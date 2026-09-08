Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A4A242D89
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835089; cv=none; b=Ks9dyqyZulth7Yyq5HNb0lT3oG65N4prNcTL23AEA/4CZ6ArDhHDVV0Bchbw1xfUTe5tM9DjSY9DFuT8LbJf4iEeFcHt8Q8LOfVRfg6bT1CDFynbJW6NnihWMI7Mk54cAz82k8h0FuO8LqMwnpeXEv4hUaSHQ+6lenZP4Nu4O0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835089; c=relaxed/simple;
	bh=ZO6BWUTrK4OLb/xzZYvpizxM1kZOMQ5Q2JarAiiVMsA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WekRCmQUhQQBmrCTZEti6edv+YMB8K/YNX0T/R3sbq7MYb7YWDmStXbKwFOIU7jvIxHU757duCTrdZnsC7rvyoGBKQthXS/Tzo4CE9xljMbHANwdrUSS+i4ACh7iS6adY6vXQ29HO0BSbZl0yZuDIm3kfEQ1HqSFWENuhCNs2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uTPULx+T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uTPULx+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617D11F00A3A;
	Tue,  8 Sep 2026 02:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788835087;
	bh=efZgJABcoG5ggDnZhAKLlrjhxD8FD9hOCVM7mhQeFpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uTPULx+T8gxPX+bbiKHFilFF9EHAF5AWTvUS7p8r95JPYvApttPFOFq1Q9LEjEnAj
	 szCy4LqZA05c07jaZhRlFjp7TftqHtTtWLy7c9Z364JLL/EmNXQ1q6NF5z0FAU9IqE
	 g2oS/XYfXxYGZxjyaluL3wXd8edItcIwC69DoRZQ=
Date: Mon, 7 Sep 2026 19:38:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com>
Cc: baohua@kernel.org, baoquan.he@linux.dev, chrisl@kernel.org,
 kasong@tencent.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 nphamcs@gmail.com, shikemeng@huaweicloud.com,
 syzkaller-bugs@googlegroups.com, youngjun.park@lge.com
Subject: Re: [syzbot] [mm?] WARNING in swap_put_entries_direct
Message-Id: <20260907193806.3f562237942e4156c3d4d53e@linux-foundation.org>
In-Reply-To: <6a9f6350.6e6c5f9e.28f11f.0005.GAE@google.com>
References: <6a9f6350.6e6c5f9e.28f11f.0005.GAE@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 18:22:24 -0700 syzbot <syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8ab1afb2eb24 Merge tag 'for-7.3/dm-fixes' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1034a125580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
> dashboard link: https://syzkaller.appspot.com/bug?extid=23b25ba3c6bf971f9c57
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-8ab1afb2.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4767b33b6704/vmlinux-8ab1afb2.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/aa0bdf390bbc/bzImage-8ab1afb2.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
> 
> get_swap_device: Bad swap file entry 7c00000000000002

hm, thanks.

https://syzkaller.appspot.com/x/log.txt?x=1034a125580000 reveals a huge
storm of I/O errors:

[ 1175.396574][ T1132] ata2: SATA link down (SStatus 0 SControl 300)
[ 1175.417415][ T1123] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 1175.421618][ T1123] ata1.00: configured for UDMA/100
[ 1175.447991][ T1137] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[ 1175.456823][ T1137] ata3.00: configured for UDMA/100
[ 1175.614247][ T5836] usb usb50-port1: unable to enumerate USB device
[ 1175.647906][ T5108] Aborting journal on device sda1-8.
[ 1175.651011][T12337] buffer_io_error: 18 callbacks suppressed
[ 1175.651033][T12337] Buffer I/O error on dev sda1, logical block 131072, lost sync page write
[ 1175.657294][T20237] EXT4-fs error (device sda1): ext4_journal_check_start:94: comm syz.5.3709: Detected aborted journal
[ 1175.665579][ T5108] JBD2: I/O error when updating journal superblock for sda1-8.
[ 1175.673842][T20239] EXT4-fs error (device sda1): ext4_journal_check_start:94: comm syz.6.3710: Detected aborted journal
[ 1175.721163][ T5923] Buffer I/O error on dev sda1, logical block 0, lost sync page write
[ 1175.723567][T20239] EXT4-fs (sda1): previous I/O error to superblock detected
[ 1175.730930][ T5923] Buffer I/O error on dev sda1, logical block 0, lost sync page write
[ 1175.731190][T20239] EXT4-fs (sda1): I/O error while writing superblock
[ 1175.731223][T20239] EXT4-fs (sda1): Remounting filesystem read-only
[ 1175.791874][T11112] Read-error on swap-device (8:0:516182)
[ 1175.863539][T10850] Read-error on swap-device (8:0:364134)
[ 1175.888507][T20241] EXT4-fs (sda1): shut down requested (2)
[ 1175.908145][ T5726] Read-error on swap-device (8:0:332990)
[ 1175.908919][ T5923] Read-error on swap-device (8:0:333014)
[ 1175.909235][ T5923] Read-error on swap-device (8:0:313854)
[ 1175.939843][T11112] Read-error on swap-device (8:0:356918)
[ 1175.967225][ T5148] Read-error on swap-device (8:0:364766)
[ 1175.979645][ T5724] Read-error on sw


So I suspect something's wrong with shmem/swap error handling.  ie, the
code which doesn't get tested :(

> ------------[ cut here ]------------
> !si
> WARNING: mm/swapfile.c:2130 at swap_put_entries_direct+0x17d/0x1b0 mm/swapfile.c:2130, CPU#1: udevd/13167

