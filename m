Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292946;
	b=nYzgfK0IOf7Cd8OLNEuSEbCkCEtrWkFGLviJHh5dGVCEmIDmbF50VvoWWFvtn3UPbFO+
	 SvQLjBZVZMjZmJsY/aS3YndkvMSjgXpn7jRjsK+z6UNMIMKbELL38i78VNKJNLJs+yb9A
	 kQZXJJuEUaizSUwe8uHOFRGBiZ4a+DNtoGLatSAbDXhXNyPVicEjfcllSUD72CxPTaWHX
	 48TezF5FhBd9faH335ERd8sOLmEUwvek2lzRiyoVGni9dCr/DgbM9eYsnhpxTeXM1oFjI
	 ARgMd0fD48Dc5wdBOYNIYT75nUuCQpKFYNm8+PLuqDJwj0qiDT07ZMs2hIArWx3m2gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292946;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JVKbRrmcqF+XZphLx23cX6LZTMbNEx5Jzuveh3sesII=;
	b=spqjOJYRHeX8FxHBjQ5o5p9cfE5wwpZHiJ2iQuPGJT5svBXCjKYxOzTQFIIBfEUgGy3+
	 /MaxSmjruo0Esw9EdNnSr7HGhtGAGY4CtW6xrr3mnsfYy9ZElczhzDfYGHsCQ5f/PGgsc
	 zg079IvVd0ey9kipuwHrxmHfp1lWrAXDSQo9HVrPANSMJMzDbzyS9g2oe+7VgjLXrFqWt
	 O5y+uJ0hMQqszxr1IYPdFlB2wo9LaSxECwvddBGYq2prFEZLTgc175NCPDUWM0+G3dRP0
	 sWuCVXWOYXvq/Nfz/DlvhkpPrxIGpJqBd0BRrt3v/L6g7J0CBH7MrDSjdGfXRk4rY2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=A0vkmO8s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFA1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=A0vkmO8s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FEE1F01826;
	Thu, 29 Oct 2026 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793292945;
	bh=JVKbRrmcqF+XZphLx23cX6LZTMbNEx5Jzuveh3sesII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=A0vkmO8sB8aqxn9M7dBIoSgBJm8pTe0eQQR/sy0hla2/IJ+Ld2IJ4mt/QmiM61NSO
	 PHdT9BK9PlDh2ymgueWGYxBO30QD02bw54fi1HgMjGSdMWToik9/mPYf0W0kfLgrnK
	 cauXBB1XuIod4s4a8Uo3UisuWnARXmFezN8r2yPo=
Date: Thu, 29 Oct 2026 09:55:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, Manfred Spraul <manfred@colorfullife.com>,
 Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 05/44] ipc/msg: Fix saturation of percpu counts in
 msgctl_info()
Message-Id: <20261029095544.06f396cf1a298d7eba11b557@linux-foundation.org>
In-Reply-To: <20261029094543.34076789@pumpkin>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
	<20251119224140.8616-6-david.laight.linux@gmail.com>
	<20261028181502.484379c56878a872899c0f94@linux-foundation.org>
	<20261028210454.7ff0d43fd57f3546547e0416@linux-foundation.org>
	<20261029094543.34076789@pumpkin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 09:45:43 +0000 David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 28 Oct 2026 21:04:54 -0700
> Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Wed, 28 Oct 2026 18:15:02 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> > 
> > > > diff --git a/ipc/msg.c b/ipc/msg.c
> > > > index ee6af4fe52bf..34e607add006 100644
> > > > --- a/ipc/msg.c
> > > > +++ b/ipc/msg.c
> > > > @@ -501,11 +501,9 @@ static int msgctl_info(struct ipc_namespace *ns, int msqid,
> > > >  	max_idx = ipc_get_maxidx(&msg_ids(ns));
> > > >  	up_read(&msg_ids(ns).rwsem);
> > > >  	if (cmd == MSG_INFO) {
> > > > -		msginfo->msgmap = min_t(int,
> > > > -				     percpu_counter_sum(&ns->percpu_msg_hdrs),
> > > > +		msginfo->msgmap = min(percpu_counter_sum(&ns->percpu_msg_hdrs),
> > > >  				     INT_MAX);
> > > > -		msginfo->msgtql = min_t(int,
> > > > -		                     percpu_counter_sum(&ns->percpu_msg_bytes),
> > > > +		msginfo->msgtql = min(percpu_counter_sum(&ns->percpu_msg_bytes),
> > > >  				     INT_MAX);
> > > >  	} else {
> > > >  		msginfo->msgmap = MSGMAP;  
> > > 
> > > Added, thanks.
> > >   
> > 
> > LLM found another bug in there.  Please review:
> 
> Seems reasonable, if unlikely to ever happen.
> Description is overlong ...
> 
> Might be worth doing a scan of all uses of percpu_counter_sum(),
> I can imagine it is a common problem.

I had LLM do a scan:

: The scan found four similar reporting problems:
: 
: - Ceph: metrics_file_show() in fs/ceph/debugfs.c prints the raw
:   opened-inode count as signed. ceph_mdsc_send_metrics() in
:   fs/ceph/metric.c converts it to unsigned for the MDS. An open/close
:   pair on different CPUs can yield -1, appearing as a negative count
:   in debugfs or U64_MAX in the metric.
: 
: - ext4: ext4_attr_show() in fs/ext4/sysfs.c uses the raw dirty-cluster
:   count for delayed_allocation_blocks. Reserving and then consuming
:   or releasing a reservation on different CPUs can produce a
:   negative sample. With one block per cluster, -1 is reported as
:   U64_MAX blocks.
: 
: - BPF: htab_map_mem_usage() in kernel/bpf/hashtab.c converts the raw
:   entry count to unsigned before calculating memory usage. This
:   affects nonpreallocated hash maps using per-CPU counters. An
:   insert/delete pair can yield -1 entries and an incorrect memory
:   estimate, including less than the empty-map overhead.
: 
: - tmpfs: shmem_statfs() in mm/shmem.c subtracts the raw used-block
:   count from the block limit. An allocation/free pair can yield -1
:   used blocks, reporting more free blocks than total blocks. Tools
:   calculating used space as total minus free can consequently
:   report negative usage.
: 
: These are source-level findings, not runtime reproductions.  No
: corruption or resource-limit bypass was established.
: 
: Other callers already floor negative samples, count cumulative events,
: check accounting after teardown, or use deliberately signed values. 
: Drain checks and some XFS statistics still need further investigation. 
: This should not be a blanket conversion, and flooring negative samples
: does not make the statistics an atomic snapshot.

> Oh and the code could use clamp(per_cpu_counter_sum(...), 0, INT_MAX);
> which is exactly the same but maybe clearer?

Sounds good.  How does the below look?


From: Andrew Morton <akpm@linux-foundation.org>
Subject: ipc/msg: clamp negative MSG_INFO usage counts
Date: Thu, 29 Oct 2026 01:43:24 +0000

MSG_INFO can report negative usage during ordinary queue traffic.  For
example, ipcs -q -u prints negative header counts and converts negative
byte counts into enormous unsigned used-space values.

percpu_counter_sum() can sample the sending CPU before an enqueue and the
receiving CPU after the matching dequeue, yielding a negative total. 
Clamp both counts to [0, INT_MAX] before converting to int.  The
statistics remain an approximate, non-atomic snapshot.

Fixes: 72d1e611082e ("ipc/msg: mitigate the lock contention with percpu counter")
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Manfred Spraul <manfred@colorfullife.com>
Cc: <stable@vger.kernel.org>
---

 ipc/msg.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/ipc/msg.c~ipc-msg-clamp-negative-msg_info-usage-counts
+++ a/ipc/msg.c
@@ -501,10 +501,10 @@ static int msgctl_info(struct ipc_namesp
 	max_idx = ipc_get_maxidx(&msg_ids(ns));
 	up_read(&msg_ids(ns).rwsem);
 	if (cmd == MSG_INFO) {
-		msginfo->msgmap = min(percpu_counter_sum(&ns->percpu_msg_hdrs),
-				     INT_MAX);
-		msginfo->msgtql = min(percpu_counter_sum(&ns->percpu_msg_bytes),
-				     INT_MAX);
+		msginfo->msgmap = clamp(percpu_counter_sum(&ns->percpu_msg_hdrs),
+					0, INT_MAX);
+		msginfo->msgtql = clamp(percpu_counter_sum(&ns->percpu_msg_bytes),
+					0, INT_MAX);
 	} else {
 		msginfo->msgmap = MSGMAP;
 		msginfo->msgpool = MSGPOOL;
_

