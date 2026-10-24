Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830964;
	b=11mLgq1ZXRt2vksmp//Z6fAl1QEMyD4r4+LXKRA/z71pVeKnIceYPwTNQQZhMS1v/Ss1
	 XPhDoVSRpa9a2smRRMJJQ0REe2sklGbwmOVqQBbqzL9ibREhgjRZCvtPJ4QBR7VLRXpge
	 CBuPBTG/6Au868SYkX7ITwIKs/btf8fFSHnW+ipT6Ar6KAcQvQwrPI8Y265fCts7XLVPF
	 WaMQ/IQNfpRuJthLNYC91O4ZR8uvFusH4qtHnmp8GqeikVQJ/iQat0etXaki2NTgORNFM
	 yz+6TxIHReJJumXJ7S2l2lb+lhAVjEFEVynwRu8O2x789vUKkkYmuTuAfAeRASBdPdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830964;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CSCL5CWSQw3qoFOn0Dd294AF8Lzi0nwEBXNidP0LLUw=;
	b=SJTm3darlmCz/PrhUKNTf8CBprhxpq3n0r4u8dA03RB6IRXI6cYoQVW5Dn/k/F9pmFsJ
	 d0yyeKRIEyKw0YlOx7B/B/vpsHFHg4WA5AMOB0rCKxy3/WncVBDcQykkJvAr8bv/GvB/Q
	 0qeGG2gLyt6dq7D4SfJMbB2U9v8YKb9TUfnnNUosZ0hu6hrpGH59H+OhatIodSKod4O75
	 un22KGI0GXBfB5+ZihBlZy8iM6O0+nfmNQwivydPIECTcw+1tA+4MRx6EJ6KRXOmgmKy5
	 hp/zyOYZ0jqVxZrEBTy51adTwEwDVIAEtsS1OVr6j4HZbqX97H6F0p0NDyhe4PY7wvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="SPlRTOW/";
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248A2606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 248A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=SPlRTOW/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792830959; bh=CSCL5CWSQw3qoFOn0Dd294AF8Lzi0nwEBXNidP0LLUw=;
	h=From:To:Cc:Subject:Date;
	b=SPlRTOW/glXR5YWrzSEYc1IcsUta9O+WZDtwsI8DKVUX2ZdVkPCMdQ/9LA2Yl4HBs
	 CgRieQ5SCedI4ED+QNw5tb0nOH5m1dJ6VHHOPqFbFlEQ9ibXqVw0BjgeB+yM9LCHs+
	 4d4wzsLid6eeDOcTE9b45F7mzEC+CXNz4uMoGWxg=
Received: from [172.18.4.77] ([111.31.227.58])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 8F902A78; Sat, 24 Oct 2026 16:35:57 +0800
X-QQ-mid: xmsmtpt1792830957ta3kbunfk
Message-ID: <tencent_78459DA7B67FAB8F9039619AAE4699FB680A@qq.com>
X-QQ-XMAILINFO: NtksVjXir1Sbkmt9IMA0eZy7A3neQp/Xox36KtFUWJOi6spmDTCxEHm7jly9/s
	 JwcMAlkuUN+Q+TJAxVTpvFHM/izodEgZqgV5WZkbwMIlzagJxgt7KT21Y5mFGhdX4sBvGcSzrERV
	 Wa/86+3MJVgSYpepWyn8k3seayboC1gb8UXB3dFQHfUjiEBsRJApw4NYhc5T8svbFwuuFq5GK1gG
	 CedWQMYI5ggYA37LRjD8AURs/xDg8WkfDDiPvVSov2FIyWkBICN51mq+a3zFZGXn/Zm9RsGjjEj8
	 7jXqUcUtqBJLE6O5WgbgovawuvNPxMb3papUyGCjsypRhaZYsXL1c7pCFbWo0cp00MWYyL8NegWq
	 PepR7sr8zraLFEvo9WcBChbGNsY+0s2rYTzcBhq4jOVJ6chLoUEsM3jzpi33dMj6nIeRSWEPE2OX
	 PUvRDWGxe9z+mc0TY3OeTOclRbKrFuC1emVQktiUuiWHGS9fNCLFXbXQu57jiIAhHl4REzUkqY+c
	 Oq+SEJ9hxyOoAEDwHi/rWHp5d4Xw6PBh8e/EI8HKQE3gCFY/cd2SNotuTwINKA50stACuWtsmgk/
	 4OO3efHY8alCl3fzfGxTI++ns7e8CA6fBJ7Os/l+2f+zucYsB/JLlyM7MNn9dsN4ghj7xf4pLblP
	 TT1JnfL9dg+L1CBGIitnkPOfIB+Z/nf64vYwu6SEAnkRFV+JMC3k1qScEiBJckAmqP/eGYfxe+48
	 O/uOJUHaQUKqQuws2BcmbnYnvhAwhl6DG5dXzWuzUhBeT1JsjvPqGv7XpcfVbvKDKjqQ563/4pge
	 FW0V5NwLGXSAhQPwnmPuoTqLz0o9R3Lrb8dN4HcLKqrc6zueHtyjH3SPcZWvuOSr8ijOw59dphAC
	 jtDE3B3neu/Fevoos1CPxZIN47F8GNAqxt9s98W62CibeSHMkWwaavnrUhR2oTvQ5DmpULQ9V1zI
	 nmozkXCiz7BBXWD0K4I7cczIROm0LJGhyivgFONGoA279Lx9U7AkyMKylM7siK7F2pnt8+pqswng
	 dPfLwRRi6wGCuwEDnCRsG5P51amDa2DU8E9uJCInQ2VUdGFb9rhteOot6PeuuUAus31dMBOjkJ2U
	 oOOjzH
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Guikun Yang <yangguikun19@qq.com>
To: Amit Shah <amit@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [BUG] virtio_console: port_fops_write() dereferences port->portdev without any lock
Date: Sat, 24 Oct 2026 16:35:55 +0800
X-OQ-MSGID: <20261024163555.70576-virtio-console-yangguikun19@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Amit,

port_fops_write() dereferences port->portdev->vdev to allocate the
output buffer, but by the time that line runs the port can already have
been hot-unplugged, which sets port->portdev to NULL.  The result is a
NULL pointer dereference on a plain write() to a virtio console port
whose device was removed concurrently.

The write path:

	port = filp->private_data;

	nonblock = filp->f_flags & O_NONBLOCK;

	ret = wait_port_writable(port, nonblock);
	if (ret < 0)
		return ret;

	count = min((size_t)(32 * 1024), count);

	buf = alloc_buf(port->portdev->vdev, count, 0, GFP_KERNEL);

wait_port_writable() ends with:

	/* Port got hot-unplugged. */
	if (!port->guest_connected)
		return -ENODEV;

That check reads guest_connected without any lock, and the code after
it (including the alloc_buf() argument evaluation) runs without a lock
either.

The unplug path (unplug_port(), running from the control workqueue on
VIRTIO_CONSOLE_PORT_REMOVE):

	spin_lock_irq(&port->inbuf_lock);
	if (port->guest_connected) {
		send_sigio_to_port(port);
		port->guest_connected = false;
		port->host_connected = false;
		wake_up_interruptible(&port->waitqueue);
	}
	spin_unlock_irq(&port->inbuf_lock);
	...
	spin_lock_irq(&port->outvq_lock);
	port->portdev = NULL;
	spin_unlock_irq(&port->outvq_lock);

	guest_connected is cleared under inbuf_lock, and portdev is cleared
under outvq_lock afterwards.  A writer that passed the guest_connected
check in wait_port_writable() can then reach alloc_buf() after the
unplug has cleared portdev, and port->portdev->vdev dereferences NULL.

The code itself shows the authors were aware of this hazard:
__send_to_port() checks portdev under outvq_lock and bails out when
NULL ("Null out portdev under outvq_lock so that __send_to_port()
cannot race").  port_fops_write() and the other file-operations paths
that read port->portdev outside that lock were left unprotected.  The
unprotected dereferences are:

	line 860: port_fops_write():
		buf = alloc_buf(port->portdev->vdev, count, 0, GFP_KERNEL);
	line 968: port_fops_splice_write():
		buf = alloc_buf(port->portdev->vdev, 0, occupancy, GFP_KERNEL);

Both run after wait_port_writable() with no lock held; a concurrent
unplug clears portdev in between and the next statement dereferences
NULL.  port_fops_splice_write() additionally reads port->out_vq->vdev
at its start (line 955) with no lock either.

Note on lifetime: this is a NULL dereference, not a use-after-free of
the port itself.  The fd holds a reference on the port, so the port
object survives; only port->portdev is nulled by the unplug.  cdev_del()
in unplug_port() only prevents new opens; already-open fds keep
returning data from the stale port structure.

Trigger: any KVM/kata-style guest with a virtio console port opened by
userspace while the host (or the virtio device) removes the port.
Hot-unplug of console ports is a normal operation, so the window does
not require a malicious setup, only timing.

I checked linux-next (2026-10-24, drivers/char/virtio_console.c as of
today): port_fops_write() still reads port->portdev->vdev unprotected,
and so does the read path at line 968.

Related work: Hari Mishal's series earlier this year added a kref to
find_port_by_vq() (upstream commit 18dd0b4e489e, now in stable), which
fixed the in_intr()/out_intr() use-after-free of the port object.  That
fix addresses a different lifetime problem (the interrupt paths racing
the kref_put in unplug_port()); this report is about the userspace
write/read paths dereferencing port->portdev, which that series did not
touch.

Suggested fix direction: read portdev once with READ_ONCE() after
wait_port_writable() and bail with -ENODEV when NULL, or take
outvq_lock around the alloc for consistency with __send_to_port()'s
existing convention.  port_fops_splice_write() needs the same
treatment (and its out_vq read at line 955 needs a look as well).

I do not have a reproducer program for this one; the race is the same
shape as the unplugged-port races already fixed in this file, and the
window is the gap between the unlocked guest_connected check and the
alloc_buf() call.

Best,
Guikun Yang

