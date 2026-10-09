Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B03655EE;
	Fri,  9 Oct 2026 23:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791589586; cv=none; b=Nb9QKpOn2c+HjuFJ16sHCnimoolzjhA0NCwKcPrU44YP6XcVd1QrahcmWyP4eLpEcQrJQi1zoVjZq+NbU9c3E6GAcGxK4zmUR/3A666mpN2vL18dBq9PtdXv0kuAE6/Op1knVJgL8njCmvtArfF3WxefoXPDJIuv+YL81hCi59c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791589586; c=relaxed/simple;
	bh=rON0pjrLMjWMq361V10In2mrAAOSpX3AeA//Ypwt73w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1gZ6K/EzymEWLGWZOsC2omY5kQMQr0Bmja6XHy8Zlyz5fU+AV0O9IKBtNWn2wkYEMzQyVnKxzJ5ZY9kJ0/Hx7JdBw80ZMPmQgIJRCWcHRoCg1mdJDaFpSJ4aB3Q0XGg60h6wk0m6hb9vgSV+LL2TyLlhGBVC8xAxfiCibRellg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkUhi4wd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkUhi4wd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BC81F000FF;
	Fri,  9 Oct 2026 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791589584;
	bh=3WGZLs92kUr6S9vwzBkja0qV+USmvOkCcVKg0xbg/kM=;
	h=Date:From:To:Cc:Subject;
	b=KkUhi4wdTdZaUQ0OWWc8DARDgj5glOJgbzP53X+vONS2Gqmfu1hjSRuqV01xAFb89
	 CwqozN9Z7/PklC9OmlDaSMYMz2IugO2gnyvb+3ayRBfzUdDoS0+3Q8wvrE103T7nKl
	 CcMlBjR0+LqKxtCN3smKiwJs6hmQ3V/yLoA0vDCDZ2I7259eWw43oQHLrJIMVcj8/u
	 AI/vbJMjaINDO8xbIaRuIs3QVpS3ox3cfQ5RDTzBlKxdBCRZYT67GqCHWvAFjGkXIf
	 r4X+DH4HCNha7mVsEYEfjFCU6H4wEhK8Taux1ejCkbHOHY7FPzgP3Hqx9vyuaJiqji
	 T0juH1tlgUVxg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id DAE0B1AC57D0; Sat, 10 Oct 2026 00:46:21 +0100 (BST)
Date: Sat, 10 Oct 2026 01:46:21 +0200
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kapi tree with the vfs-brauner tree
Message-ID: <asl8zeoFuEbnQMhJ@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B+dJ6ZOGhk3KPags"
Content-Disposition: inline


--B+dJ6ZOGhk3KPags
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kapi tree got a conflict in:

  fs/open.c

between commit:

  2b256ebe82872 ("fs: add filp_close_sync()")

=66rom the vfs-brauner tree and commit:

  856d40153ab75 ("kernel/api: add API specification for sys_close")

=66rom the kapi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/open.c
index e43f02ff64acb,9f08c438f162a..0000000000000
--- a/fs/open.c
+++ b/fs/open.c
@@@ -1562,19 -1861,239 +1886,252 @@@ int filp_close(struct file *filp, fl_ow
  }
  EXPORT_SYMBOL(filp_close);
 =20
 +/* Like filp_close() but the last reference is put right here. */
 +int filp_close_sync(struct file *filp, fl_owner_t id)
 +{
 +	int retval;
 +
 +	/* Kernel threads must never put their final reference here. */
 +	VFS_WARN_ON_ONCE(current->flags & PF_KTHREAD);
 +	retval =3D filp_flush(filp, id);
 +	fput_close_sync(filp);
 +
 +	return retval;
 +}
 +
+ /**
+  * sys_close - Close a file descriptor
+  * @fd: The file descriptor to close
+  *
+  * long-desc: Terminates access to an open file descriptor, releasing the=
 file
+  *   descriptor for reuse by subsequent open(), dup(), or similar syscall=
s.
+  *
+  *   Traditional POSIX advisory record locks held by the process on the
+  *   associated file are released when any of its fds for that inode is
+  *   closed, not only the last one. OFD locks and flock locks are associa=
ted
+  *   with the open file description and are only released when the last
+  *   reference to that open file description is dropped.
+  *
+  *   Closing a file descriptor drops one reference to its open file
+  *   description. Other descriptors (dup(), fork(), SCM_RIGHTS messages in
+  *   flight) and operations still running on the file, such as a concurre=
nt
+  *   read(), also hold references. Only when the last reference is droppe=
d are
+  *   the associated resources freed. If the file was previously unlinked,=
 the
+  *   file itself is deleted when the last reference is dropped.
+  *
+  *   Except when close() fails with EBADF, the file descriptor is release=
d even
+  *   when close() returns an error, because it is released before the flu=
sh
+  *   that may fail. POSIX leaves the state of the descriptor unspecified =
after
+  *   EINTR. Retrying close() after an error may close an unrelated file
+  *   descriptor that another thread has since been given.
+  *
+  *   Errors returned from close() come only from the file's ->flush() met=
hod,
+  *   called by filp_flush(). Errors from ->release() are not reported.
+  *   Filesystems without a ->flush() method, such as ext4, xfs and btrfs,=
 never
+  *   report write errors from close(). Network filesystems such as NFS, C=
IFS and
+  *   FUSE implement ->flush() and report deferred write errors (EIO, ENOS=
PC,
+  *   EDQUOT) at close time. A successful return does not mean the data re=
ached
+  *   storage; call fsync() before close() for that.
+  *
+  *   On close, the following cleanup operations are performed: the ->flus=
h()
+  *   method is called if the file has one, POSIX advisory locks are remov=
ed,
+  *   dnotify registrations are cleaned up, and the file reference is rele=
ased.
+  *   If this was the last reference, additional cleanup includes: fsnotif=
y close
+  *   notification, epoll cleanup, OFD, flock and lease removal, FASYNC cl=
eanup,
+  *   the ->release() method, and the file structure deallocation.
+  *
+  * contexts: process, sleepable
+  *
+  * param: fd
+  *   type: fd, input
+  *   constraint-type: range(0, INT_MAX)
+  *   cdesc: Must be a valid, open file descriptor for the current process.
+  *     The value 0, 1, or 2 (stdin, stdout, stderr) may be closed like an=
y other
+  *     fd, though this is unusual and may cause issues with libraries tha=
t assume
+  *     these descriptors are valid. The parameter is unsigned int to matc=
h kernel
+  *     file descriptor table indexing. A value that is not open, includin=
g any
+  *     value at or above the current table size, fails with EBADF.
+  *
+  * return:
+  *   type: int
+  *   check-type: exact
+  *   success: 0
+  *   desc: Returns 0 on success. On error, returns a negative error code.=
 Except
+  *     for EBADF, the file descriptor is still closed when an error is re=
turned
+  *     and must not be used again. The error comes from the file's ->flus=
h()
+  *     method, not from the fd remaining open. With EBADF, nothing was re=
leased.
+  *
+  * error: EBADF, Bad file descriptor
+  *   desc: fd is at or above the file descriptor table size, has no file
+  *     assigned (including a slot reserved by a concurrent open() that ha=
s not
+  *     installed its file yet), or was already closed. This is the only e=
rror
+  *     for which no file descriptor was released.
+  *
+  * error: EINTR, Interrupted system call
+  *   desc: The flush operation was interrupted by a signal before complet=
ion.
+  *     This occurs when a driver's ->flush() method (for example wdm_flus=
h() in
+  *     drivers/usb/class/cdc-wdm.c) performs an interruptible wait that r=
eceives
+  *     a signal. The file descriptor is still released and must not be us=
ed
+  *     again. Kernel-internal restart codes (ERESTARTSYS,
+  *     ERESTARTNOINTR, ERESTARTNOHAND, ERESTART_RESTARTBLOCK) are convert=
ed to
+  *     EINTR because restarting the syscall would be incorrect once the f=
d is
+  *     freed.
+  *
+  * error: EIO, I/O error
+  *   desc: The file's ->flush() method reported an I/O error, typically a
+  *     deferred write error on a network filesystem such as NFS, CIFS or =
FUSE,
+  *     or an error from a driver's ->flush(). Previously buffered write d=
ata
+  *     may have been lost.
+  *
+  * error: ENOSPC, No space left on device
+  *   desc: The file's ->flush() method reported that there was insufficie=
nt
+  *     space to flush buffered writes, for example on NFS when the server=
 runs
+  *     out of space between write() and close().
+  *
+  * error: EDQUOT, Disk quota exceeded
+  *   desc: The file's ->flush() method reported that the user's disk quot=
a was
+  *     exceeded while flushing buffered writes, for example on NFS when t=
he
+  *     quota is exceeded between write() and close().
+  *
+  * lock: files->file_lock
+  *   type: spinlock
+  *   acquired: true
+  *   released: true
+  *   desc: Taken by file_close_fd() to look up and clear the fd slot atom=
ically,
+  *     so two concurrent close() calls on one fd cannot both obtain the s=
truct
+  *     file. Dropped before ->flush() and the final fput. From then on th=
e fd
+  *     number may be handed out again. An fd reserved by a concurrent ope=
n() but
+  *     not yet installed has a NULL slot, so close() returns EBADF.
+  *
+  * lock: file->f_lock
+  *   type: spinlock
+  *   acquired: true
+  *   released: true
+  *   desc: Taken from __fput() on the last reference, by eventpoll_releas=
e_file()
+  *     when the file is registered with epoll, and by fasync_remove_entry=
()
+  *     (through the ->fasync() method) when FASYNC is set. Protects the e=
poll
+  *     and fasync links of the file.
+  *
+  * lock: ep->mtx
+  *   type: mutex
+  *   acquired: true
+  *   released: true
+  *   desc: Acquired during epoll cleanup if the file was monitored by epo=
ll.
+  *     Used to safely remove the file from epoll interest lists.
+  *
+  * lock: flc_lock
+  *   type: spinlock
+  *   acquired: true
+  *   released: true
+  *   desc: File lock context spinlock. Taken by locks_remove_posix() from
+  *     filp_flush() on every close when the file has POSIX locks, and by
+  *     locks_remove_file() from __fput() on the last reference to remove =
OFD,
+  *     flock, and lease locks.
+  *
+  * signal: pending_signals
+  *   direction: receive
+  *   action: return
+  *   condition: When close-time flush performs interruptible wait
+  *   desc: If the close-time ->flush() method (for example wdm_flush() in
+  *     cdc-wdm) performs an interruptible wait and a signal is pending, t=
he wait
+  *     is interrupted. Any kernel restart codes are converted to EINTR si=
nce
+  *     close cannot be restarted after the fd is freed.
+  *   errno: -EINTR
+  *   timing: during
+  *   restartable: no
+  *
+  * side-effect: resource_destroy | irreversible
+  *   target: File descriptor table entry
+  *   desc: The file descriptor is removed from the process's file descrip=
tor
+  *     table, making the fd number available for reuse by subsequent open=
(),
+  *     dup(), or similar calls. This happens before the flush that may fa=
il, so
+  *     an error return does not undo it.
+  *   condition: Always (when fd is valid)
+  *   reversible: no
+  *
+  * side-effect: lock_release
+  *   target: POSIX advisory locks, OFD locks, flock locks
+  *   desc: POSIX locks held by this process on the inode are removed on e=
very
+  *     close via locks_remove_posix() in filp_flush(), except for O_PATH =
files.
+  *     OFD and flock locks are removed via locks_remove_file() in __fput(=
) only
+  *     when this is the last reference to the open file description.
+  *   condition: Any close of a non-O_PATH file for POSIX locks, last refe=
rence
+  *     for OFD and flock locks
+  *   reversible: no
+  *
+  * side-effect: resource_destroy
+  *   target: File leases
+  *   desc: Any file leases held on the file are removed during locks_remo=
ve_file()
+  *     when this is the last reference to the open file description.
+  *   condition: File had leases and this is the last reference
+  *   reversible: no
+  *
+  * side-effect: modify_state
+  *   target: dnotify registrations
+  *   desc: Directory notification (dnotify) registrations associated with=
 this
+  *     file are cleaned up via dnotify_flush(). This only applies to dire=
ctories.
+  *   condition: File is a directory with dnotify registrations
+  *   reversible: no
+  *
+  * side-effect: modify_state
+  *   target: epoll interest lists
+  *   desc: If the file was being monitored by epoll instances, it is remo=
ved
+  *     from those interest lists via eventpoll_release(), which runs from
+  *     __fput() only on the last reference. While other references remain=
, the
+  *     epoll registrations stay active.
+  *   condition: File was added to epoll instances and this is the last re=
ference
+  *   reversible: no
+  *
+  * side-effect: filesystem
+  *   target: Buffered data
+  *   desc: The file's ->flush() method runs before the file reference is
+  *     dropped (for example on NFS, CIFS and FUSE) and may return errors =
such as
+  *     EIO, ENOSPC or EDQUOT.
+  *   condition: The filesystem or driver provides a ->flush() method
+  *   reversible: no
+  *
+  * side-effect: free_memory
+  *   target: struct file and related structures
+  *   desc: When this is the last reference to the file, the file structur=
e is
+  *     freed and the dentry and mount references are released.
+  *   condition: This is the last reference to the file
+  *   reversible: no
+  *
+  * side-effect: filesystem
+  *   target: Unlinked file deletion
+  *   desc: If the file was previously unlinked (deleted) but kept open, c=
losing
+  *     the last reference causes the actual file data to be removed from =
the
+  *     filesystem and the inode to be freed.
+  *   condition: File was unlinked and this is the last reference
+  *   reversible: no
+  *
+  * state-trans: file_descriptor
+  *   from: open
+  *   to: closed/free
+  *   condition: Valid fd passed to close
+  *   desc: The file descriptor transitions from open (usable) to closed (=
invalid).
+  *     The fd number becomes available for reuse.
+  *
+  * state-trans: file_reference_count
+  *   from: n
+  *   to: n-1 (or freed if n was 1)
+  *   condition: Always on successful fd lookup
+  *   desc: The file's reference count is decremented. If this was the last
+  *     reference, the file is fully cleaned up and freed.
+  *
+  * examples: close(fd);  // Ignoring the result loses ->flush() errors
+  *   if (close(fd) =3D=3D -1) perror("close");  // Log errors for debuggi=
ng
+  *   fsync(fd); close(fd);  // Ensure data persistence before closing
+  *
+  * notes: close() drops its reference with fput_close_sync(), so when it =
is the last
+  *   reference __fput() runs synchronously in the calling task before clo=
se()
+  *   returns, instead of being deferred to task work.
+  *
+  *   Calling close() on a file descriptor while another thread is using it
+  *   (e.g., in a blocking read() or write()) does not interrupt the block=
ed
+  *   operation. The blocked operation continues on the underlying file and
+  *   may complete even after close() returns.
+  */
  /*
   * Careful here! We test whether the file pointer is NULL before
   * releasing the fd. This ensures that one clone task can't release

--B+dJ6ZOGhk3KPags
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasl8zQAKCRAv73Ows9A4
iXiKAQDHndm3iUZTUmFYwtmcrgIhruOY4v27ElGVRuD1Rco0QgD9G//1xzLWwe6d
a7MIY4ObZYvSKMUium99kGDukJ7Fug4=
=n7sN
-----END PGP SIGNATURE-----

--B+dJ6ZOGhk3KPags--
