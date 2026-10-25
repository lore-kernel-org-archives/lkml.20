Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939423;
	b=GCxbRz9EA896Qfsi1h8vhUd4wOr1roljRdaUnwfkEMvTHlhpZ0v6qKPn+Bh6Auo2DHag
	 l9qJiDOs90n5uZp/+IQXJHAqhqkFyVhrsT8v+YoccgCaRIDnAXNgxwR/mlsMnkhoW74fP
	 Jb1rpx9DQ/5Rkv9EpmPSzS/Nil5GXuxZ2UnnRFYG758O/runnH3Rr0geZJzB9vsGu6yO4
	 tZpdCI5ZCdofO3PeNT87ABc6XzQ/1RGa9KmckproP6nqc9PTWDgEnleRD+bDgtOmMZ55f
	 1SrvsqxmhH39KY51rN2v4o88E5yesTwwLbQFureIUhMOD7ACDJej2k/TIIyHFSWsF1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939423;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=10Wn98wCYjGze7UfrWdQv3o7MdZOhneadzomG6iUcnw=;
	b=u29qrLh5cAo+FDvZFN3WzqGVd+/6wcSpJHKFd4STu4Zy+nj3VD28nsTaOp6rI02okU/4
	 Gb23PmNBBM65CbNDysXa3djcEGe8FXpUokyFYrbaFpcGtXs0y2fD3JVTPpB7Yy6V6OJ+E
	 DG+dWXBfKoEv2/4SRX1OW8Bq/cZF8uIb3vDRLKfsft6BaIc3ubSfrtBuUqZsAY76SrAmu
	 U34V4WnXzt9CaVcrU+5pztXZQUElsaLn8I4ajtLuMam+1+KkC1wvNiAjs3OTKdlSRsDFh
	 Q/VhbIvX+wvYF9D7TsBkNQhdahfDOi0P/P7TR4I+YLSn99QSYcuTanYZuxOsr76upgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hc5UHF18;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LZ6VZpXX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88962606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88962606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hc5UHF18;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LZ6VZpXX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792939421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10Wn98wCYjGze7UfrWdQv3o7MdZOhneadzomG6iUcnw=;
	b=Hc5UHF182UTOCBSHHZAmW+27Pax7I8fPhVNq67UqrNaSzSvrLyqOVFSzpX8fvu12niV4nR
	OURolaEE/ZObMe+hXM62EYPa+9f30OS9aJoEFVX1h0dnQJRz3hYKIdAFwJgAI+b4DaUsaV
	tgmwS+QMaJ7mD/PNugKFyZKvTXuTEQk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-kSpymDoSPWuJR_J4AhVwaw-1; Sun, 25 Oct 2026 10:43:39 -0400
X-MC-Unique: kSpymDoSPWuJR_J4AhVwaw-1
X-Mimecast-MFC-AGG-ID: kSpymDoSPWuJR_J4AhVwaw_1792939419
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so457561585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792939419; x=1793544219; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:references:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=10Wn98wCYjGze7UfrWdQv3o7MdZOhneadzomG6iUcnw=;
        b=LZ6VZpXXYJPBh7Eo/6JLPcahSa91lQyu+TLZsV1dIjIT0vyK1vwGSS0zpxKYXVPyJr
         tbZl8scZ9lgWeP4KaiOd2Dezc8ce3nNus+q/BZQpRcVDqBP2OlGTu3DdyhONKR9+xFPi
         L93vgLuv2MiT+W9eswMDd9LB/7SaCxnLp/SH2AKx+rjI9MYsPjbrBXUaAwi2UI5OHTMd
         Ywdxbw4SCFz2S7CU6orzFpaQZ8VApWSo6bZqadUj0hLbBhfZmYDOUs6xRWRqc1C1lIRf
         TxUDjcHkfLiyGyGcHY/pEWI1wFpeIMgxG6RgT9duyiPUQDmqvYzwZkUpi2Z8l0h1gzqx
         tcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792939419; x=1793544219;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:references:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10Wn98wCYjGze7UfrWdQv3o7MdZOhneadzomG6iUcnw=;
        b=z5QCDoQ2Gts7qbX8kpssKCdfvLJuDAUo0+HFAJcs9QKnHHP3XHj40Uee1+8KwddPW+
         TUBSJkk0iefDVvoTwrmXumCS/0BAzGGx4PNLn7dMWWSy2dMQNNSDl4YZ80fhHgYHISpz
         FixYMv0nsc6S69VgZqD9MtjIGCq+WNqwlJ/ObA74NbJJ57cjj1UsG3KS8R14wkwagh6R
         9bLra9EqfQHKgylGSCHUxa/cGNaGqmqRj74/g5KrWJi/vKVwBMBAIlsrUOyjQXF0jjwN
         2hlOraLiw93x2kYcc+zTqSB5MQ5k0R1azyl9M4QPU1p+4zV9ADOUjGukC0QVp6Q4yuPg
         CKnA==
X-Forwarded-Encrypted: i=1; AKwUvByWa5Gd2SDoenkaiVxlrh/R5lbXqZV3wQwMvdfuyUfp3o6EQRAAjYTIxVtiMAmoF4zw34FQlITL239Q+lc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs8VzS6h8+PSvWny6YHv0SHC90wp9kNhHhNA+5DzfonDffElZE
	LJwD5fgTEjkAUkTzsM9sQBuxon5uxm6I3rMCAY5iYD5Fh/0sUG3Et+vA81g5Z7iWSNClXGVX549
	JHGHdpaMrhQUzrPrQtgLXBZ8Kw5iT2SwFJky/qlD9Z4IqppNqLjM2xA60m6cJNn2Fkw==
X-Gm-Gg: AYBFou3s4kdwTZrClgmDcJmv3SLLpnBLwLZdnqYHKv7sOexmJHMdLtIgW0M25/OefQ8
	esDTK7eHdrRm+J2ONe8NyjoD/zV7MFjmW8RaHfpCIdRi8Kbv1Bx0PJtOizLJdybik1+DmhzPcwF
	wQ8c+TRLzP7Rdk97u7t+s87+AYI875U4VE4hI17uGy5M7288J7lW9z6c+yiWVzCBqpuloqAQrL5
	etZrULUmv3ytjVsyORZSxNgBrbibTdAExnJ0pcWjHhMPEYoI1IME/gYmt2kpq7n+4UwJaG8h+ro
	j00QuTCRksBLGdgRJUaVvOL1lCM+ztFOgs7HFaL1OZd/ohM0QJ3Un+IjKQznSYZ4fDHdUryskOQ
	WA8WUyVsp4hihUmrBOfQFsqdFEw+QaKe8bltW/O9O1f6b1hEQ6sm04riW2ArCbg87FZXhDbnFOq
	8KKMbVrx0YmyCYiyAdvkwV
X-Received: by 2002:a05:620a:4543:b0:93f:21db:851a with SMTP id af79cd13be357-940ef9f050fmr591914085a.40.1792939418662;
        Sun, 25 Oct 2026 07:43:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4543:b0:93f:21db:851a with SMTP id af79cd13be357-940ef9f050fmr591911985a.40.1792939418182;
        Sun, 25 Oct 2026 07:43:38 -0700 (PDT)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm436834785a.10.2026.10.25.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:43:37 -0700 (PDT)
Message-ID: <60cf407142a0663a811a2ccd64cf387cb71808ab.camel@redhat.com>
Subject: Re: [PATCH v2 0/2] scsi: target: iscsi: fix stalled aborted WRITE
 commands
From: Laurence Oberman <loberman@redhat.com>
To: mkp@kernel.org
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	mlombard@redhat.com, michael.christie@oracle.com,
 linux-kernel@vger.kernel.org
Date: Sun, 25 Oct 2026 10:43:35 -0400
References: <20261016175351.126373-1-loberman@redhat.com>
In-Reply-To: <20261016175351.126373-1-loberman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-16 at 13:53 -0400, Laurence Oberman wrote:
> > These two patches apply on top of=20
> > commit d5869dae5080 ("scsi: target: iscsi: Fix hang for aborted
> > WRITE_PENDING commands").
> >=20
> > A WRITE command that is still in TRANSPORT_WRITE_PENDING has never
> > been
> > passed to the backend, so when a TMR aborts it the iSCSI fabric is
> > the one
> > that has to complete it. That commit fixed the case where the final
> > DataOut PDU for an already-issued R2T arrives after the abort. Two
> > more
> > paths can leave such a command with nothing to complete it:
> >=20
> > =C2=A0- Patch 1 is the hang this work started from. A WRITE that arrive=
s
> > with
> > =C2=A0=C2=A0 immediate data, aborted after that data has been received =
but
> > before
> > =C2=A0=C2=A0 the first R2T is built, is never completed by anything: no=
 R2T
> has
> > been
> > =C2=A0=C2=A0 sent so the initiator cannot send more data, and no DataOu=
t
> timer
> > is
> > =C2=A0=C2=A0 armed so the ERL=3D0 timeout cannot fire either.
> > core_tmr_lun_reset()
> > =C2=A0=C2=A0 then blocks for as long as the connection stays up.
> >=20
> > =C2=A0- Patch 2 closes the equivalent window where a new R2T would have
> > been
> > =C2=A0=C2=A0 sent for an already-aborted command.
> >=20
> > Patch 1 also adds a one-shot completion claim. Completing the
> command
> > in
> > iscsit_execute_cmd() introduces a second site which
> > iscsit_release_commands_from_conn() would also complete during
> > connection
> > teardown, because t_state is still TRANSPORT_WRITE_PENDING there
> and
> > target_complete_cmd() on an aborted command records nothing that
> > would say
> > otherwise. The claim makes sure only one of them does it.
> >=20
> > Changes since v1:
> > =C2=A0- Patch 2: route the DATAOUT_SEND_R2T completion through
> > =C2=A0=C2=A0 iscsit_complete_aborted_cmd() rather than calling
> > target_complete_cmd()
> > =C2=A0=C2=A0 directly, so the completion is claimed and cannot be repea=
ted by
> > =C2=A0=C2=A0 iscsit_release_commands_from_conn() during connection tear=
down.
> > =C2=A0- Patch 1 unchanged.
> >=20
> > v1:=20
> >
> https://lore.kernel.org/linux-scsi/20261014143932.39453-1-loberman@redhat=
.com/
> >=20
> > How this was found and tested:
> >=20
> > The hang was reported against an Oracle RAC cluster on two-session
> > iSCSI
> > LIO targets, where one node's LUN_RESET aborts WRITEs belonging to
> > the
> > other node's session. It was not reproducible in a lab, so the
> > diagnosis
> > came from instrumented kernels in the reporter's environment,
> logging
> > every
> > site that completes or waits on an aborted command.
> >=20
> > Across two hosts every stall had the identical signature given in
> > patch 1,
> > and the stall only ever ended when the initiator gave up and
> dropped
> > the
> > connection. 217 of 222 LUN_RESET drains completed in under a
> second;
> > the
> > rest took 46 to 54 seconds, which is where the hung-task panics
> came
> > from.
> > One 53.7 second stall recovered on its own and the host ran for a
> > further
> > 19 hours.
> >=20
> > Both patches, backported to a 5.14-based distro kernel, have since
> > run 300
> > reset cycles with no hang, in two independent runs: one
> instrumented
> > and
> > one with the tracing removed. The same reproducer previously failed
> > at 95
> > and 196 cycles. The code here is equivalent to what was tested;
> only
> > comments differ.
> >=20
> > One thing to flag for review: patch 2's window was never observed.
> > The
> > instrumented kernels recorded no completions at that site in either
> > run,
> > and the reproducer never reached it. It is included because the
> same
> > reasoning applies there, but it has no field evidence behind it,
> and
> > I am
> > happy to drop it or send it separately if you would prefer.
> >=20
> > An earlier attempt at this fix completed the command from
> > core_tmr_drain_state_list() instead. That is not safe: at that
> point
> > the
> > initiator may still be sending DataOut for the command, and the
> > result was
> > a double completion -- re-queued se_cmd->work, list_del corruption
> > and a
> > refcount underflow. Mentioning it in case the same idea comes up in
> > review.
> >=20
> > Laurence Oberman (2):
> > =C2=A0 scsi: target: iscsi: Complete an aborted WRITE stuck before the
> > first
> > =C2=A0=C2=A0=C2=A0 R2T
> > =C2=A0 scsi: target: iscsi: Complete an aborted WRITE when a new R2T
> would
> > be
> > =C2=A0=C2=A0=C2=A0 sent
> >=20
> > =C2=A0drivers/target/iscsi/iscsi_target.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 28 +++++++++++++--
> > =C2=A0drivers/target/iscsi/iscsi_target_erl1.c | 10 +++++-
> > =C2=A0drivers/target/iscsi/iscsi_target_util.c | 46
> > ++++++++++++++++++++++++
> > =C2=A0drivers/target/iscsi/iscsi_target_util.h |=C2=A0 2 ++
> > =C2=A0include/target/iscsi/iscsi_target_core.h |=C2=A0 5 +++
> > =C2=A05 files changed, 88 insertions(+), 3 deletions(-)


Gentle ping:
If anybody has bandwidth to review the v2 in this series which also
handled the sashiko concerns.=C2=A0
We have customers waiting on this series.=C2=A0

=C2=A0As always much appreciated=C2=A0
=C2=A0Laurence Oberman

