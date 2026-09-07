Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD14AE12B;
	Mon,  7 Sep 2026 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784942; cv=none; b=hai1SHGWnG7VmmIG6mk24zKqnsKR6vlW/XLQHo+asvOQa6NxlIL0Bd/x6zYl8C4BOGwmNaNWLBPTIa3k3OVhOgVisEH6FGD12HGWtZSrpVj89sT6dZ4d4iXb4R5cbZ5T6cn7qLwU41vr5kUhsInefmFOVoKv8IuHW1owUNUnoQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784942; c=relaxed/simple;
	bh=Rat/dAoF9j7svsdbdzA3LzOGTYZWJyDWoSGDnb1UTr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TgPQCCJselKoTGnoyh3MOUdJP0mpoMZmKK1MoTbkRutZWp5JhCKMC/8KUnK/Q5AnyliGI/+v5tC/8gELxlVbQNOGDIwC9ZmgYVfUG4aMfkTwpgEZngEN3qZnV8pB0Sh+7nzBETjPLJrp0JjW2boyUXRFhoiRPErgWJq2qXSgY6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmdRGjnz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmdRGjnz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176D91F00A3D;
	Mon,  7 Sep 2026 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784934;
	bh=I+fazVSKeieT+RSfj5phLBdQ+Z5d7HkFj1K8cmugocg=;
	h=Date:From:To:Cc:Subject;
	b=LmdRGjnzv5oCJJrGwuU/0ekOVJdQL4ECzROC+lEGREesbW/vORbcyuG59wM+I+Ked
	 h8/0RfXvRZTPwSTSXsgC/zDZX1Si2vGjaS70Noq6S/3gnFX7o9c7ky0h4k7rMhkdbL
	 qM3hx/HdJ7qXu4oF3byiYBsUe40tj81CcZkFFEyOyMBE8LrlNZpV5NOsEw+uXebgSc
	 jOFNvxmQ6da0Y9eiV+Pq468uFL8/ySrRKvw81Fkac5uMiUU/nYMXgRuvm4uc3XVYGf
	 6XKbF2VwreAwkNWS/CnWp8dweIvwXQi68FB8QjkUQfyCxkZ5gew7ANMAZkQs3eO6qj
	 7CXSAXqhCb46g==
Date: Mon, 7 Sep 2026 13:42:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@kylinos.cn>,
	Gael Blivet <gael.blivet@gmail.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ksmbd tree with the origin tree
Message-ID: <ap6xIoiM_pN8RO_E@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4sO73/SSnMM9vRvx"
Content-Disposition: inline


--4sO73/SSnMM9vRvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ksmbd tree got a conflict in:

  fs/smb/server/smb2pdu.c

between commit:

  3a2c4d55e32ad ("treewide: refresh kmalloc_obj() conversions")

=66rom the origin tree and commits:

  596450ed188db ("smb/server: support compound fid in notify requests")
  ccdae1bdbd85f ("ksmbd: refactor smb2_notify() to a blocking wait")

=66rom the ksmbd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/smb/server/smb2pdu.c
index b7ce670946260,e7c965e7b0684..0000000000000
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@@ -58,10 -58,6 +58,6 @@@ static void __wbuf(struct ksmbd_work *w
  	}
  }
 =20
- static struct ksmbd_work *smb2_notify_cancel_claim(void **argv);
- static void smb2_notify_cancel_fn(void **argv);
- static void smb2_complete_notify_cancel(struct ksmbd_work *in_work);
-=20
  #define WORK_BUFFERS(w, rq, rs)	__wbuf((w), (void **)&(rq), (void **)&(rs=
))
 =20
  #define SMB2_CREATE_FILE_ATTRIBUTE_MASK \
@@@ -1245,6 -1241,7 +1241,7 @@@ void smb2_send_interim_resp(struct ksmb
  {
  	struct smb2_hdr *rsp_hdr;
  	struct ksmbd_work *in_work =3D ksmbd_alloc_work_struct();
+ 	u16 command;
 =20
  	if (!in_work)
  		return;
@@@ -1268,6 -1265,23 +1265,23 @@@
  	smb2_set_err_rsp(in_work);
  	rsp_hdr->Status =3D status;
 =20
+ 	/*
+ 	 * Async interim responses are unsigned, but final responses must
+ 	 * follow the normal signing rules. The synthetic work has no
+ 	 * request buffer, so use the original work for request signing
+ 	 * checks and the response header for SMB3 command selection.
+ 	 */
+ 	command =3D work->conn->ops->get_cmd_val(work);
+ 	if (status !=3D STATUS_PENDING && !work->encrypted && work->sess &&
+ 	    work->conn->ops->set_sign_rsp &&
+ 	    (work->sess->sign ||
+ 	     (work->conn->ops->is_sign_req &&
+ 	      work->conn->ops->is_sign_req(work, command)))) {
+ 		in_work->sess =3D work->sess;
+ 		work->conn->ops->set_sign_rsp(in_work);
+ 		in_work->sess =3D NULL;
+ 	}
+=20
  	if (smb2_send_interim_work(in_work, work, true))
  		ksmbd_debug(SMB, "failed to send interim response\n");
  	ksmbd_free_work_struct(in_work);
@@@ -9699,7 -9713,6 +9713,6 @@@ int smb2_cancel(struct ksmbd_work *work
  	struct smb2_hdr *hdr =3D smb_get_msg(work->request_buf);
  	struct smb2_hdr *chdr;
  	struct ksmbd_work *iter;
- 	struct ksmbd_work *cancelled_notify =3D NULL;
  	struct list_head *command_list;
 =20
  	if (work->next_smb2_rcv_hdr_off)
@@@ -9737,23 -9750,11 +9750,11 @@@
  				    "smb2 with AsyncId %llu cancelled command =3D 0x%x\n",
  				    le64_to_cpu(hdr->Id.AsyncId),
  				    le16_to_cpu(chdr->Command));
- 			if (iter->cancel_fn =3D=3D smb2_notify_cancel_fn)
- 				cancelled_notify =3D
- 					smb2_notify_cancel_claim(iter->cancel_argv);
- 			else if (iter->cancel_fn)
+ 			if (iter->cancel_fn)
  				iter->cancel_fn(iter->cancel_argv);
  			break;
  		}
  		spin_unlock(&conn->request_lock);
-=20
- 		/*
- 		 * Complete a cancelled notify before this CANCEL handler returns.
- 		 * Deferring it to the system workqueue lets a following request and
- 		 * its response overtake STATUS_CANCELLED, leaving clients waiting
- 		 * for the original notify even though the cancellation was accepted.
- 		 */
- 		if (cancelled_notify)
- 			smb2_complete_notify_cancel(cancelled_notify);
  	} else {
  		command_list =3D &conn->requests;
 =20
@@@ -11710,137 -11711,26 +11711,26 @@@ int smb2_oplock_break(struct ksmbd_w=
or
  	return 0;
  }
 =20
- /*
-  * Cancel handler for a deferred CHANGE_NOTIFY. Races against
-  * __ksmbd_close_fd()'s notify_pendings drain (vfs_cache.c), which can run
-  * concurrently on a different connection closing the same handle -- only
-  * one of the two may claim and free in_work, so both sides check
-  * list_empty() under fp->f_lock before touching it (list_del_init()
-  * leaves a node empty, so whichever side removes it first is the owner;
-  * the loser must not touch in_work again, since the winner may already be
-  * freeing it).
-  *
-  * smb2_cancel() holds conn->request_lock (a spinlock) for the entire
-  * time it walks conn->async_requests and calls this function -- so this
-  * runs with preemption disabled and must not sleep or re-acquire that
-  * same lock. release_async_work() does both (it takes conn->request_lock
-  * itself, and frees things that can involve sleeping paths), so calling
-  * it from here would self-deadlock the very thread processing the
-  * client's CANCEL command. ksmbd_conn_write() can also sleep (it takes
-  * conn's write mutex). So: do only the non-sleeping, no-relock cleanup
-  * inline here. smb2_cancel() sends and frees the claimed notify after it
-  * drops request_lock, preserving response order for a client CANCEL. The
-  * connection teardown caller has no such post-unlock path, so its wrapper
-  * defers the send and free to a workqueue.
-  */
- struct notify_cancel_ctx {
- 	struct work_struct	work;
- 	struct ksmbd_work	*in_work;
+ struct ksmbd_notify_req {
+ 	wait_queue_head_t wait;
  };
 =20
- static void smb2_send_notify_cancelled(struct ksmbd_work *work)
+ /*
+  * Cancel handler for a pending CHANGE_NOTIFY. Called either by
+  * smb2_cancel() (conn->request_lock held, work->state already set to
+  * KSMBD_WORK_CANCELLED by the caller) or by
+  * set_close_state_blocked_works() (vfs_cache.c, fp->f_lock held,
+  * work->state already set to KSMBD_WORK_CLOSED by the caller) -- both
+  * callers hold a spinlock across this call, so it must not sleep.
+  * wake_up() only wakes the waiter in smb2_notify(); it does not touch
+  * fp->blocked_works itself, matching smb2_remove_blocked_lock()'s same
+  * non-mutating style for the equivalent byte-range-lock wait.
+  */
+ static void smb2_notify_cancel(void **argv)
  {
- 	struct smb2_hdr *hdr =3D smb_get_msg(work->response_buf);
- 	struct ksmbd_conn *conn =3D work->conn;
- 	struct ksmbd_session *sess;
+ 	struct ksmbd_notify_req *notify_req =3D argv[0];
 =20
- 	sess =3D ksmbd_session_lookup(conn, le64_to_cpu(hdr->SessionId));
- 	if (sess) {
- 		work->sess =3D sess;
- 		if (work->encrypted && sess->enc && conn->ops->encrypt_resp) {
- 			conn->ops->encrypt_resp(work);
- 		} else if (conn->ops->is_sign_req && conn->ops->set_sign_rsp &&
- 			   conn->ops->is_sign_req(work,
- 						 conn->ops->get_cmd_val(work))) {
- 			conn->ops->set_sign_rsp(work);
- 		}
- 	}
-=20
- 	ksmbd_conn_write(work);
- 	if (sess) {
- 		ksmbd_user_session_put(sess);
- 		work->sess =3D NULL;
- 	}
- }
-=20
- static void smb2_notify_cancel_deferred(struct work_struct *w)
- {
- 	struct notify_cancel_ctx *ctx =3D
- 		container_of(w, struct notify_cancel_ctx, work);
- 	struct ksmbd_conn *conn =3D ctx->in_work->conn;
-=20
- 	smb2_complete_notify_cancel(ctx->in_work);
- 	kfree(ctx);
- 	/*
- 	 * The connection teardown waits for r_count before destroying
- 	 * connection sessions and their proc entries.
- 	 */
- 	ksmbd_conn_r_count_dec(conn);
- }
-=20
- static struct ksmbd_work *smb2_notify_cancel_claim(void **argv)
- {
- 	struct ksmbd_work *in_work =3D (struct ksmbd_work *)argv[0];
- 	struct ksmbd_file *fp =3D (struct ksmbd_file *)argv[1];
- 	bool claimed;
-=20
- 	spin_lock(&fp->f_lock);
- 	claimed =3D !list_empty(&in_work->notify_entry);
- 	if (claimed)
- 		list_del_init(&in_work->notify_entry);
- 	spin_unlock(&fp->f_lock);
-=20
- 	if (!claimed)
- 		return NULL;
-=20
- 	/* conn->request_lock is held by smb2_cancel() or connection teardown. */
- 	in_work->cancel_fn =3D NULL;
- 	kfree(in_work->cancel_argv);
- 	in_work->cancel_argv =3D NULL;
- 	return in_work;
- }
-=20
- static void smb2_complete_notify_cancel(struct ksmbd_work *in_work)
- {
- 	struct smb2_hdr *in_hdr =3D smb_get_msg(in_work->response_buf);
-=20
- 	in_hdr->Status =3D STATUS_CANCELLED;
- 	smb2_send_notify_cancelled(in_work);
- 	release_async_work(in_work);
- 	ksmbd_free_work_struct(in_work);
- }
-=20
- static void smb2_notify_cancel_fn(void **argv)
- {
- 	struct ksmbd_work *in_work =3D smb2_notify_cancel_claim(argv);
- 	struct ksmbd_conn *conn;
- 	struct notify_cancel_ctx *ctx;
-=20
- 	if (!in_work)
- 		return;
- 	conn =3D in_work->conn;
-=20
- 	ctx =3D kmalloc_obj(*ctx, GFP_ATOMIC);
- 	if (!ctx) {
- 		/* Can't defer the response -- free without sending one. */
- 		list_del_init(&in_work->async_request_entry);
- 		in_work->asynchronous =3D false;
- 		if (in_work->async_id) {
- 			ksmbd_release_id(&conn->async_ida, in_work->async_id);
- 			in_work->async_id =3D 0;
- 		}
- 		ksmbd_free_work_struct(in_work);
- 		return;
- 	}
- 	ctx->in_work =3D in_work;
- 	INIT_WORK(&ctx->work, smb2_notify_cancel_deferred);
- 	/*
- 	 * This deferred work can outlive the connection handler's receive loop.
- 	 * Keep teardown from destroying the connection's sessions until the
- 	 * deferred response has finished using them.
- 	 */
- 	ksmbd_conn_r_count_inc(conn);
- 	schedule_work(&ctx->work);
+ 	wake_up(&notify_req->wait);
  }
 =20
  /**
@@@ -11853,9 -11743,11 +11743,11 @@@ int smb2_notify(struct ksmbd_work *work
  {
  	struct smb2_change_notify_req *req;
  	struct smb2_change_notify_rsp *rsp;
- 	struct ksmbd_work *in_work;
- 	struct smb2_hdr *in_hdr;
- 	struct ksmbd_file *fp;
+ 	struct ksmbd_notify_req notify_req;
+ 	struct ksmbd_file *fp =3D NULL;
+ 	void **argv =3D NULL;
+ 	bool async_work =3D false;
+ 	int err =3D 0;
 =20
  	ksmbd_debug(SMB, "Received smb2 notify\n");
 =20
@@@ -11866,164 -11758,83 +11758,83 @@@
 =20
  	if (work->next_smb2_rcv_hdr_off && req->hdr.NextCommand) {
  		rsp->hdr.Status =3D STATUS_INTERNAL_ERROR;
- 		smb2_set_err_rsp(work);
- 		return -EIO;
+ 		err =3D -EIO;
+ 		goto out;
  	}
 =20
- 	/*
- 	 * macOS backupd sends CHANGE_NOTIFY with FileId=3DFFFF...FFFF (share-ro=
ot
- 	 * sentinel) to watch for changes on the share root without holding an
- 	 * open handle. Respond STATUS_PENDING + STATUS_NOTIFY_CLEANUP immediate=
ly;
- 	 * without this, backupd aborts Time Machine setup on STATUS_FILE_CLOSED.
- 	 */
- 	if (req->VolatileFileId =3D=3D SMB2_NO_FID &&
- 	    req->PersistentFileId =3D=3D SMB2_NO_FID) {
- 		in_work =3D ksmbd_alloc_work_struct();
- 		if (!in_work || allocate_interim_rsp_buf(in_work)) {
- 			if (in_work)
- 				ksmbd_free_work_struct(in_work);
- 			rsp->hdr.Status =3D STATUS_INSUFFICIENT_RESOURCES;
- 			smb2_set_err_rsp(work);
- 			return 0;
- 		}
- 		if (setup_async_work(work, NULL, NULL)) {
- 			ksmbd_free_work_struct(in_work);
- 			rsp->hdr.Status =3D STATUS_INSUFFICIENT_RESOURCES;
- 			smb2_set_err_rsp(work);
- 			return 0;
- 		}
- 		smb2_send_interim_resp(work, STATUS_PENDING);
- 		in_work->conn =3D work->conn;
- 		in_hdr =3D smb_get_msg(in_work->response_buf);
- 		memcpy(in_hdr, ksmbd_resp_buf_next(work),
- 		       __SMB2_HEADER_STRUCTURE_SIZE);
- 		in_hdr->Flags |=3D SMB2_FLAGS_ASYNC_COMMAND;
- 		in_hdr->Id.AsyncId =3D cpu_to_le64(work->async_id);
- 		smb2_set_err_rsp(in_work);
- 		in_hdr->Status =3D STATUS_NOTIFY_CLEANUP;
- 		in_work->async_id =3D work->async_id;
- 		work->async_id =3D 0;
- 		release_async_work(work);
- 		if (smb2_send_interim_work(in_work, work, false))
- 			ksmbd_debug(SMB, "failed to send notify cleanup\n");
- 		ksmbd_free_work_struct(in_work);
- 		work->send_no_response =3D 1;
- 		return 0;
- 	}
-=20
- 	/*
- 	 * KSMBD does not implement a real change-notification backend.
- 	 * Genuine SMB2 servers (and macOS smbfs) never complete a
- 	 * CHANGE_NOTIFY spontaneously: it is satisfied only by a real
- 	 * directory change, or with STATUS_NOTIFY_CLEANUP when the watched
- 	 * handle is closed. Completing it early (e.g. on a timer) makes
- 	 * Finder treat the cleanup as "directory changed" and re-enumerate
- 	 * the directory forever, leaving items unopenable. Returning
- 	 * STATUS_NOT_IMPLEMENTED here (like stock ksmbd) makes macOS smbfs
- 	 * hard-freeze on unmount, so this must stay deferred.
- 	 */
  	fp =3D ksmbd_lookup_fd_slow(work, req->VolatileFileId, req->PersistentFi=
leId);
  	if (!fp) {
  		rsp->hdr.Status =3D STATUS_FILE_CLOSED;
- 		smb2_set_err_rsp(work);
- 		return 0;
+ 		err =3D -ENOENT;
+ 		goto out;
  	}
 =20
- 	in_work =3D ksmbd_alloc_work_struct();
- 	if (!in_work || allocate_interim_rsp_buf(in_work)) {
- 		if (in_work)
- 			ksmbd_free_work_struct(in_work);
- 		ksmbd_fd_put(work, fp);
+ 	argv =3D kmalloc(sizeof(void *), KSMBD_DEFAULT_GFP);
+ 	if (!argv) {
  		rsp->hdr.Status =3D STATUS_INSUFFICIENT_RESOURCES;
- 		smb2_set_err_rsp(work);
- 		return 0;
+ 		err =3D -ENOMEM;
+ 		goto out;
  	}
+ 	init_waitqueue_head(&notify_req.wait);
+ 	argv[0] =3D &notify_req;
+=20
+ 	err =3D setup_async_work(work, smb2_notify_cancel, argv);
+ 	if (err) {
+ 		rsp->hdr.Status =3D STATUS_INSUFFICIENT_RESOURCES;
+ 		goto out;
+ 	}
+ 	async_work =3D true;
+=20
  	/*
- 	 * in_work is synthetic (not from the normal request-receiving
- 	 * pipeline), so it has no request_buf of its own. It gets registered
- 	 * into conn->async_requests below, and smb2_cancel() unconditionally
- 	 * computes smb_get_msg(iter->request_buf) for every entry in that
- 	 * list while searching for a match -- give it its own small buffer
- 	 * (not an alias of response_buf: ksmbd_free_work_struct() kvfree()s
- 	 * both separately, so aliasing them would double-free) so that stays
- 	 * a harmless read instead of a near-NULL dereference.
+ 	 * Handle close holds the file-table write lock while it marks the
+ 	 * handle closed and walks blocked_works.  Hold the matching read lock
+ 	 * across the state check and registration so close cannot finish its
+ 	 * walk between the lookup above and this list insertion.
  	 */
- 	in_work->request_buf =3D kzalloc(MAX_CIFS_SMALL_BUFFER_SIZE, KSMBD_DEFAU=
LT_GFP);
- 	if (!in_work->request_buf) {
- 		ksmbd_free_work_struct(in_work);
- 		ksmbd_fd_put(work, fp);
- 		rsp->hdr.Status =3D STATUS_INSUFFICIENT_RESOURCES;
- 		smb2_set_err_rsp(work);
- 		return 0;
- 	}
- 	memcpy(smb_get_msg(in_work->request_buf), req,
- 	       __SMB2_HEADER_STRUCTURE_SIZE);
-=20
- 	if (setup_async_work(work, NULL, NULL)) {
- 		ksmbd_free_work_struct(in_work);
- 		ksmbd_fd_put(work, fp);
- 		rsp->hdr.Status =3D STATUS_INSUFFICIENT_RESOURCES;
- 		smb2_set_err_rsp(work);
- 		return 0;
+ 	read_lock(&work->sess->file_table.lock);
+ 	if (fp->f_state !=3D FP_INITED) {
+ 		read_unlock(&work->sess->file_table.lock);
+ 		rsp->hdr.Status =3D STATUS_NOTIFY_CLEANUP;
+ 		err =3D -ENOENT;
+ 		goto out;
  	}
+ 	spin_lock(&fp->f_lock);
+ 	list_add_tail(&work->fp_entry, &fp->blocked_works);
+ 	spin_unlock(&fp->f_lock);
+ 	read_unlock(&work->sess->file_table.lock);
 =20
  	smb2_send_interim_resp(work, STATUS_PENDING);
 =20
- 	/* Keep the async IDA alive until the deferred work is released. */
- 	in_work->conn =3D ksmbd_conn_get(work->conn);
- 	in_work->owns_conn_ref =3D true;
- 	in_work->encrypted =3D work->encrypted;
- 	in_hdr =3D smb_get_msg(in_work->response_buf);
- 	memcpy(in_hdr, ksmbd_resp_buf_next(work), __SMB2_HEADER_STRUCTURE_SIZE);
- 	in_hdr->Flags |=3D SMB2_FLAGS_ASYNC_COMMAND;
- 	in_hdr->Id.AsyncId =3D cpu_to_le64(work->async_id);
- 	smb2_set_err_rsp(in_work);
- 	in_hdr->Status =3D STATUS_NOTIFY_CLEANUP;
-=20
- 	/*
- 	 * Transfer ownership of the async id to in_work; it stays reserved
- 	 * until in_work is freed after the deferred response is sent on
- 	 * close, so it can't be reused for an unrelated async response.
- 	 */
- 	in_work->async_id =3D work->async_id;
- 	work->async_id =3D 0;
- 	release_async_work(work);
-=20
- 	/*
- 	 * work itself is about to be recycled by the normal request-processing
- 	 * pipeline, so it can't stay the target of a future CANCEL -- register
- 	 * in_work instead, reusing the same async_id, so a client-sent CANCEL
- 	 * for this notify actually finds something to cancel instead of
- 	 * silently doing nothing until the handle eventually closes.
- 	 */
- 	in_work->asynchronous =3D true;
- 	in_work->cancel_argv =3D kmalloc_array(2, sizeof(void *), KSMBD_DEFAULT_=
GFP);
- 	if (in_work->cancel_argv) {
- 		in_work->cancel_argv[0] =3D in_work;
- 		in_work->cancel_argv[1] =3D fp;
- 		in_work->cancel_fn =3D smb2_notify_cancel_fn;
- 	}
-=20
- 	if (!ksmbd_conn_link_async_request(work->conn, in_work)) {
- 		kfree(in_work->cancel_argv);
- 		in_work->cancel_argv =3D NULL;
- 		in_work->cancel_fn =3D NULL;
- 		in_work->asynchronous =3D false;
- 		ksmbd_fd_put(work, fp);
- 		if (smb2_send_interim_work(in_work, work, false))
- 			ksmbd_debug(SMB, "failed to send notify cleanup\n");
- 		ksmbd_free_work_struct(in_work);
- 		work->send_no_response =3D 1;
- 		return 0;
+ 	err =3D wait_event_interruptible(notify_req.wait,
+ 				       READ_ONCE(work->state) !=3D KSMBD_WORK_ACTIVE);
+ 	if (err && READ_ONCE(work->state) =3D=3D KSMBD_WORK_ACTIVE) {
+ 		/*
+ 		 * Woken by a signal, not a real cancel/close. There is no
+ 		 * notification backend yet to report anything else against,
+ 		 * so treat this the same as a client-side cancel.
+ 		 */
+ 		WRITE_ONCE(work->state, KSMBD_WORK_CANCELLED);
  	}
 =20
  	spin_lock(&fp->f_lock);
- 	list_add_tail(&in_work->notify_entry, &fp->notify_pendings);
+ 	list_del_init(&work->fp_entry);
  	spin_unlock(&fp->f_lock);
 =20
- 	ksmbd_fd_put(work, fp);
+ 	rsp->hdr.Status =3D work->state =3D=3D KSMBD_WORK_CLOSED ?
+ 			  STATUS_NOTIFY_CLEANUP : STATUS_CANCELLED;
+ 	smb2_send_interim_resp(work, rsp->hdr.Status);
  	work->send_no_response =3D 1;
- 	return 0;
+=20
+ out:
+ 	if (rsp->hdr.Status !=3D STATUS_SUCCESS && !work->send_no_response)
+ 		smb2_set_err_rsp(work);
+ 	if (async_work)
+ 		release_async_work(work);
+ 	else
+ 		kfree(argv);
+ 	if (fp)
+ 		ksmbd_fd_put(work, fp);
+ 	return err;
  }
 =20
  /**
@@@ -12218,11 -12029,12 +12029,12 @@@ void smb3_set_sign_rsp(struct ksmbd_w=
or
  	struct channel *chann;
  	char signature[SMB2_CMACAES_SIZE];
  	struct kvec *iov;
- 	u16 command =3D conn->ops->get_cmd_val(work);
+ 	u16 command;
  	int n_vec;
  	char *signing_key;
 =20
  	hdr =3D ksmbd_resp_buf_curr(work);
+ 	command =3D le16_to_cpu(hdr->Command);
 =20
  	if (command =3D=3D SMB2_SESSION_SETUP_HE &&
  	    (!conn->binding || hdr->Status !=3D STATUS_SUCCESS)) {

--4sO73/SSnMM9vRvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqesSEACgkQJNaLcl1U
h9D2Jgf9HD3s5UWGwaN/xe1qXZ3TYYuzUxZF9MYEds3ovztqjXJqJLtIfVw9wH4G
U/OQzCMirAiNL5ztIFSwNTn2TafpqW8y/qlPwzt03CVcB3SMq7KmAWZFFaWgWpfd
6olHoz8MyqaNSo+hnparHYr2LIcfE3tnu4DJ1QyOkXeyMllOg9zVzxkq67+CRl+Y
Ud4sAIPItMTB9MxybAiMoCys7BS1kBT13XELFawaag4BXRPEqgu+HendIp9yXWFA
tHpgLjV52AJeX0Njw8nRRD7bAwc7rDPY+IvUQucF85HRRqM06qYCnZmjj659UYWb
T0MVNZPAmq3PAVjRsDPEfqDsDdxQPw==
=tcH1
-----END PGP SIGNATURE-----

--4sO73/SSnMM9vRvx--
