Received: from v5226.v57ae4e16.euw1.send.eu.mailgun.net (v5226.v57ae4e16.euw1.send.eu.mailgun.net [161.38.204.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED066431A3E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.38.204.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266567; cv=none; b=aeEtsLBFYwNzGA8ZEXqUGyd/pHaHVJzmXU4LNcdDCR0MFM5cJVOlcsC28awX37Eqf0hVtMgbGVwWNttluFrBJ7hh+6dcl/D0mfRY4/jMnL0SbsRuC3E/NqN0Vbh1UrxV1dZxbIiJB3LWRtSBjAUU8dmIhL1e2IITYiYGtXKbYHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266567; c=relaxed/simple;
	bh=3lSz34lBEh+wPnHUFzARMwW2Vkq29Jh+JGyBEYAa8zA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=h8tANroC6viQ0OmHC7/4B2u4GC6vYETYQgs1Td895mtMSMCtFF56JvLU4d9X0qlLx0WYLkmnTzJL8zZHcQhV1TIcR0HWVHhKztf0VT908Ij7skLVCxA4Oy9tfsk/tlgk5FHEK6aFOhsNzzBbfcLbRiHBZZaPK/ek8ENj0GjIe28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=puzl.cloud; spf=pass smtp.mailfrom=puzl.cloud; dkim=pass (1024-bit key) header.d=puzl.cloud header.i=@puzl.cloud header.b=zmUq5lCU; dkim=fail (0-bit key) header.d=puzl.ee header.i=@puzl.ee header.b=fxN/vBbm reason="unknown key version"; arc=none smtp.client-ip=161.38.204.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=puzl.cloud
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puzl.cloud
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=puzl.cloud header.i=@puzl.cloud header.b="zmUq5lCU";
	dkim=fail reason="unknown key version" (0-bit key) header.d=puzl.ee header.i=@puzl.ee header.b="fxN/vBbm"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=puzl.cloud; q=dns/txt; s=s1; t=1790266563; x=1790273763;
 h=To: To: Cc: Date: Message-Id: Subject: Subject: Mime-Version: Content-Transfer-Encoding: Content-Type: From: From: Sender: Sender;
 bh=dJxW40pPrhdijNEjIAhPEXLPM+hY1rBofmknsTTz61c=;
 b=zmUq5lCU8AuVkd8L/ilU6YrCzzHmHOiAxPYEjIdoVOxcC/5NJwVQhIZrQmJMq1NQf+cD/zgQxNdcf7JToGdTSGmz1mul0KlCuQqm7GutsiXwto5ezn/MjLQAklLma4gN7hFr44eCJTLwvBoJp72m6pME1yROqZxjhBm1cEtu2gY=
X-Mailgun-Sid: WyIyZTI3NCIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCJiYTQ3ZiJd
Received: from mail.puzl.ee (unknown [213.5.72.68]) by
 462fdbd92c4d6d337e195da261aee184c8b82c3825df12d3b502c1d94c0aebc1 with SMTP id
 6ab54cc297e77d9961523b74 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Thu, 24 Sep 2026 16:16:02 GMT
X-Mailgun-Sending-Ip: 161.38.204.226
Sender: monakhov@puzl.cloud
Received: from mail.puzl.ee (mail.puzl.ee [127.0.0.1])
	by mail.puzl.ee (Postfix) with ESMTP id 030C5501B2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:16:02 +0000 (UTC)
Authentication-Results: mail.puzl.ee (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=puzl.ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puzl.ee; h=
	x-mailer:to:date:date:message-id:subject:subject:mime-version
	:content-transfer-encoding:content-type:content-type:from:from;
	 s=dkim; t=1790266561; x=1792858562; bh=3lSz34lBEh+wPnHUFzARMwW2
	Vkq29Jh+JGyBEYAa8zA=; b=fxN/vBbmP3qESjvGfF/BVH1BK8Dt6jYW+DS/5Lyx
	4asHuc+91+/wYIYmXky9UcqsugIZlmIJQdA54XesvIoRmxXRLpRKlw344ekI/j3N
	fRW/vhb1dFLHqe2X3anE89A968ebzHnDJ84U8OjQBeXvz5LhiJea8z7rQFbl7dsJ
	4xg=
X-Virus-Scanned: Debian amavisd-new at mail.puzl.ee
Received: from mail.puzl.ee ([127.0.0.1])
	by mail.puzl.ee (mail.puzl.ee [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ipymsuzHoRAO for <linux-kernel@vger.kernel.org>;
	Thu, 24 Sep 2026 16:16:01 +0000 (UTC)
Received: from smtpclient.apple (62-8-190-90.sta.estpak.ee [90.190.8.62])
	by mail.puzl.ee (Postfix) with ESMTPSA id 3CE51501AD;
	Thu, 24 Sep 2026 16:15:46 +0000 (UTC)
From: Sergei Monakhov <monakhov@puzl.cloud>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: rbd/libceph: ceph-msgr/RBD workers blocked on con->mutex and
 osd->lock under load
Message-Id: <ED31993F-CDB1-4FDF-A1DF-93A12FF8B64D@puzl.cloud>
Date: Thu, 24 Sep 2026 19:15:35 +0300
Cc: linux-kernel@vger.kernel.org,
 idryomov@gmail.com,
 amarkuze@redhat.com,
 max.kellermann@ionos.com,
 carges@cloudflare.com
To: ceph-devel@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81)

Hi,

I'm debugging RBD stalls on a production workload. I don't have a small
reproducer yet, so this is not a clean benchmark report. The data below =
is from
bpftrace while the issue was happening naturally.

The affected host is on Ubuntu 6.14.0-35-generic. The path I captured is =
msgr1
/ ceph_con_v1_try_read().

At first I assumed this was some receive-side problem, but the off-CPU =
traces
don't really support that. In many samples the reply has already been =
received
and dispatched, and the ceph-msgr worker is sleeping inside the RBD =
completion
callback:

  ceph_con_v1_try_read
    ceph_con_process_message
      osd_dispatch
        handle_reply
          __complete_request
            rbd_osd_req_callback
              rbd_img_handle_request
                mutex_lock

The waiter there is blocked on the RBD image request state mutex. =
Tracing the
holder shows rbd_queue_workfn() holding that mutex while advancing the =
RBD
state machine and submitting follow-up OSD requests.

I then traced nested mutex waits while rbd_img_handle_request() is =
holding
img_req->state_mutex. There are two classes.

The first one is the messenger connection mutex:

  rbd_queue_workfn
    rbd_img_handle_request
      rbd_img_advance
        __rbd_obj_handle_request
          rbd_obj_advance_write
            rbd_osd_submit
              ceph_osdc_start_request
                __submit_request
                  send_request
                    ceph_con_send / ceph_msg_revoke
                      mutex_lock(con->mutex)

Example:

  NESTED MUTEX WAIT CLASSIFY time=3D15:30:20 tid=3D1988383 =
comm=3Dkworker/66:2
    state_mutex=3D0xffff8aa3e36658d8
    nested_lock=3D0xffff8aa319c47108
    wait_us=3D153142
    state_hold_so_far_us=3D153258
    from_rbd_queue_workfn=3D1
    osd_req=3D0xffff8a066e142580

  CLASS con->mutex by callsite
    con=3D0xffff8aa319c47030
    paired_osd_lock=3D0xffff8aa319c477b0
    delta=3D0x6a8

  --- NESTED WAITER STACK ---

    mutex_lock+1
    send_request+332
    __submit_request+541
    ceph_osdc_start_request+53
    rbd_osd_submit+30
    rbd_obj_advance_write+820
    __rbd_obj_handle_request+91
    rbd_img_advance+254
    rbd_img_handle_request+82
    rbd_queue_workfn+597
    process_one_work+379
    worker_thread+734
    kthread+254
    ret_from_fork+71
    ret_from_fork_asm+26

This looks like the kind of issue that should be helped by Max =
Kellermann's
out_queue patch:

  fs/ceph/messenger: add separate lock for `out_queue`
  =
https://lore.kernel.org/ceph-devel/20260703193803.3689912-1-max.kellermann=
@ionos.com/

The second class is more concerning. Multiple RBD workers block on the =
same
ceph_osd.lock while each is holding a different img_req->state_mutex. In =
one
captured episode, the waits were around 50-51 seconds.

Example from that episode:

  NESTED MUTEX WAIT CLASSIFY time=3D15:42:22 tid=3D1907557 =
comm=3Dkworker/206:12
    state_mutex=3D0xffff8aa34b09b598
    nested_lock=3D0xffff8aa319cfb7b0
    wait_us=3D51157147
    state_hold_so_far_us=3D51157170
    from_rbd_queue_workfn=3D1
    osd_req=3D0xffff8acfb2b9b840

  CLASS osd->lock by callsite
    paired_con_mutex=3D0xffff8aa319cfb108
    delta=3D0x6a8

  --- NESTED WAITER STACK ---

    mutex_lock+1
    ceph_osdc_start_request+53
    rbd_osd_submit+30
    rbd_obj_advance_write+820
    __rbd_obj_handle_request+91
    rbd_img_advance+254
    rbd_img_handle_request+82
    rbd_queue_workfn+597
    process_one_work+379
    worker_thread+734
    kthread+254
    ret_from_fork+71
    ret_from_fork_asm+26

Several more workers were waiting on the same nested_lock address in the =
same
time window:

  nested_lock=3D0xffff8aa319cfb7b0
  paired_con_mutex=3D0xffff8aa319cfb108
  delta=3D0x6a8

  wait_us=3D51156869
  wait_us=3D51156379
  wait_us=3D51156066
  wait_us=3D51155589
  wait_us=3D51155104
  wait_us=3D51148538
  wait_us=3D50723956
  wait_us=3D50723973
  wait_us=3D50722959
  wait_us=3D50690601
  wait_us=3D50689346
  wait_us=3D50676705
  wait_us=3D50535020
  wait_us=3D50534884

All of these had the same waiter stack:

  mutex_lock+1
  ceph_osdc_start_request+53
  rbd_osd_submit+30
  rbd_obj_advance_write+820
  __rbd_obj_handle_request+91
  rbd_img_advance+254
  rbd_img_handle_request+82
  rbd_queue_workfn+597
  process_one_work+379
  worker_thread+734
  kthread+254
  ret_from_fork+71
  ret_from_fork_asm+26

A few questions:

  1. Is the con->mutex class above expected to be fixed by the out_queue =
lock
     patch?

  2. Is it expected that successful OSD replies run the RBD callback =
inline
     from the ceph-msgr worker? In this workload =
rbd_img_handle_request() can
     block on img_req->state_mutex for hundreds of milliseconds, and in =
some
     cases much longer.

  3. Is holding img_req->state_mutex across
     ceph_osdc_start_request()/__submit_request() intentional? The =
traces show
     many RBD workers holding their image request state mutex while =
waiting on
     the same ceph_osd.lock.

I can send the bpftrace scripts and fuller logs if useful. The main =
thing I
wanted to check is whether this lock chain is known/expected.

Thanks,
Sergei=
