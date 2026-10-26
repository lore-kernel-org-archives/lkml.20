Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041029;
	b=XwjS+CH+fiXkbxBUbGBiILOQJiGEy7+x0HbLoFkBwxIOx/sDBB14nBLJ0Fh1AeOu7CME
	 PheCPlGn0t78kZfNTW0+B8pK6XoIpWvNf+heRbRG9W1VarRQuJSGbUfUd0k+Z0/tw4fjV
	 naM1qNrjokT4dHvFqbzv/hWXT12GyHD8BqfXbwLQUJpKAQGFZxpK8YE4K4gAWA7b5hV+7
	 +bSSY+2vRRZQpDU6a7tAUTggSoJ2dxL3F0OG4r4TJekm8dfy7sztF0XNdUqJzKkcrFEoT
	 4819tCGno6DvWKpadJZnToBgTADwkvcJPpsgkgVQ5c+/sHHQzB3OVdqxQJziOcSCtUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041029;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=bWlVFKk/hA3IhLifvlVvVb0OqBSStw22ybdS81uZBv0=;
	b=O3L0E0bsbAyfOtTmO2qHdAAI702NieZ7BaNjMsVeTk5gvdw8jPsefbmQ2YGNBvkQk3Lj
	 e41YCUQU63VbQYg/1u4UbpIv6CnlhggrobObWtoN9i5fwRKPRjYqgiClWtIw1WVrTkgj2
	 EUOt5dU5w160H4iLnBiwqfOpgd+75SBq/yIMe4e4sY5ZT9PSc4LqgfkCBF7c8rV8Q4gjX
	 k+EVPoRkZkAbmj6BLrrmnKh9w/14fFmzte7Kp5mHLDR9vKgiW549kn6DzWS/yi834brm/
	 GtDEUQUeBHWQoUaVHalaVq3BjBKvtOr80WD+QMM7HImEYI2n3K8qu7cV3yqh/5mgXtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCffbO5I;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GJRgb3Q0;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904AA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 904AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCffbO5I;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GJRgb3Q0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793041027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWlVFKk/hA3IhLifvlVvVb0OqBSStw22ybdS81uZBv0=;
	b=XCffbO5ILWrUuFHAx5NVFERneuSB/cFwFRSPzIUpZ7Ya9OUY/Ue1budbUAXDjUNhjfUeow
	M6GQn/DGtlWLrY2zEpe+QlRnoKkKXKVkNOFA2MvihLu58PBqKou6eOJqnY6gHZNJx+YzR1
	W2XGvMeKxkzKmmRoxb0X4rMv+SLgLyk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-YZXUL_tUNLi8YiNn_o9PXw-1; Mon, 26 Oct 2026 14:57:06 -0400
X-MC-Unique: YZXUL_tUNLi8YiNn_o9PXw-1
X-Mimecast-MFC-AGG-ID: YZXUL_tUNLi8YiNn_o9PXw_1793041026
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f2fafeaso458283685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793041025; x=1793645825; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bWlVFKk/hA3IhLifvlVvVb0OqBSStw22ybdS81uZBv0=;
        b=GJRgb3Q0GRMk4Si5qpQXLAgyEK7gVzHKWHmW9f2kCI+drvziXdKEYFox1Nb4OOhv2P
         KhTOhO4djcGY3J6GBOOv5VGCyCVUrul5DNzesJEZK/S+/iBqJp/zWsgwGvm6b5RxBJUR
         eihsD8UxWZUazd8gK6uGTN8359Dzkgu0hr3FmISgYNegLQqLJENs0YnTieSqnRLpNkoz
         3w0e26ToZfZ/cr/vCIuj2S/4+2OBEIiw21ltRA140exh+7bIZsl3YTTiVzeFdPrtwUxi
         O6PbvCmCoYkqf5dGbNtp9XF/2qZ+gaJCNYS8XHx0lO2rLhbH/psT0vBfmoRqr/hFtlGW
         tUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041025; x=1793645825;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWlVFKk/hA3IhLifvlVvVb0OqBSStw22ybdS81uZBv0=;
        b=kHGr19VFWCwxEcHqt97XuzwkuxPxOZArw/80QdQNMW7dDdtSztXLpSNOGzPFSYi4Jv
         CG+ei4dj0ILQZCQQNcGTQgj1W+fHp8AWdVNFa+i3pZP3FAlWGxNUTavLQdWe+URnwVXg
         1Zz1uHmq3SKUamL462BpVhdkov3aZL1HtxEBx7rHv0z7+8XXq1Q/2BY3wgvgdwNaLR4K
         2pBK0TLUS6OUf4Hd6apUWdXh2hDYlLKoFoYvQEtgpn6IIcCsQpv87tkIOpmFk4U1ctVh
         aJuXWvRcwRyZfgQ7NzDEF81j9WZLMC3IEAYqdXVpnTHMmEPowUnzX8LC1ADnupe1huns
         MGbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8vXJ7KudCPNbhzvow2jOvo4wV4mErtETsYRyWMFSKvIOYXazktdJvCc/7bZzLln32C12uzkdkFaV9rXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJnA3eVBY39XDoGkBc63JKiSzSXLvC/lMjeVTm0taeO8eEkBgO
	CD9brnVEYv7tC7X8zHPVPsYhzN7d16hS2eDn2s0KsUHrLc/mpBwXpy3znUrezbs3ItHvg8Fof3n
	kkcrK544fbpInHvtfd9ceDfhqBhJ5kUBR7A6BD2AbVqQMEDXOJ56et/tI6zjDosFl0g==
X-Gm-Gg: AYBFou3kOZa8F1TyUJ+XDordNSP/2C+8nClc2yMPUcRq66RW5Knav6ftjzhE5kY4E6u
	PA0ZoEhS6c7dXfx26xuu14OsZR4YEgaFCoqt2wbxEnKbfUq/Nk+F47kY5kQApOOuhdGkUNAmnMe
	ksGKP3Ct+gi5nBKr3aYac0EOrfke40GR7Ta1dxc4xuq0TT3D06ZOPQZ8BpZSVBtLL9PmgyO1+CN
	lIGi92f15LXb7ebkxBwDjqpLjQJg0zxS3h1s6AugWvqCfpdks48myt/e5z3h1EdJtTbaMgtmExF
	qAQ1M0sQsp1JtegBHZZFH2diUw+9Ucr1jsO3+WbdXwiaF5Rjg8LoVnq7L/menGBqbXrTvA0tjWj
	HcFLDZTQn4q9VV1suZh92zz1boRb6idz7g9Qp9dhnr7txtLjRnv7T4Xba5QJV0KmiCXI65L8Xwz
	bpkSVrcH8jYh/quXGwvFqnJA==
X-Received: by 2002:a05:620a:3714:b0:93f:c3d:7bf6 with SMTP id af79cd13be357-940ef7d3964mr1197183985a.6.1793041025569;
        Mon, 26 Oct 2026 11:57:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:93f:c3d:7bf6 with SMTP id af79cd13be357-940ef7d3964mr1197179785a.6.1793041025086;
        Mon, 26 Oct 2026 11:57:05 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a9720csm765520485a.42.2026.10.26.11.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:57:04 -0700 (PDT)
Message-ID: <698f6e4ff260d9480316c68ea30a63af05c936f5.camel@redhat.com>
Subject: Re: [PATCH v4 0/3] scsi: target: iscsi: fix stalled and doubly
 completed aborted WRITEs
From: Laurence Oberman <loberman@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>, mkp@kernel.org
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	mlombard@redhat.com, michael.christie@oracle.com,
 linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 14:57:03 -0400
In-Reply-To: <ea77fa74-3290-4685-b1d7-24c45ca1286c@acm.org>
References: <20261026150710.1063511-1-loberman@redhat.com>
	 <79480408-8403-4a93-a2dc-c5f01864a20c@acm.org>
	 <8d705915480f6cbe6a1b37c2cd06eb98727b3207.camel@redhat.com>
	 <ea77fa74-3290-4685-b1d7-24c45ca1286c@acm.org>
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

On Mon, 2026-10-26 at 09:47 -0700, Bart Van Assche wrote:
> On 10/26/26 9:12 AM, Laurence Oberman wrote:
> =C2=A0> If the guard is one-shot across both, a second call that would
> have
> =C2=A0> taken the CMD_T_STOP branch is suppressed too, and I am not sure
> that
> =C2=A0> is safe -- a suppressed complete_all() could leave a waiter in
> =C2=A0> transport_wait_for_tasks() stuck. Should the guard cover only the
> =C2=A0> CMD_T_ABORTED branch, or do you see a reason it is safe across
> both?
>=20
> Please limit the guard to the CMD_T_ABORTED branch. The only things
> in
> target_cmd_interrupted() that must not run twice are in that branch:
> INIT_WORK() + queue_work() on cmd->work, and the
> transport_complete_callback() call. For COMPARE AND WRITE the latter
> releases dev->caw_sem in compare_and_write_callback(), so calling it
> twice would release that semaphore twice.
>=20
> The CMD_T_STOP branch doesn't need a guard. complete_all() is
> idempotent and t_transport_stop_comp is initialized only once, in
> __target_init_cmd(). Suppressing a repeated complete_all() wouldn't
> strand a waiter either, since the completion stays done. However, a
> guard shared by both branches would be wrong for another reason: if
> the first call takes the CMD_T_STOP branch and CMD_T_ABORTED is set
> afterwards, a shared guard would suppress queueing target_abort_work
> and we would be back to the target_put_cmd_and_wait() hang.
>=20
> Something like this (untested):
>=20
> 	static bool target_cmd_interrupted(struct se_cmd *cmd)
> 	{
> 		bool queue_abort =3D false, stop =3D false;
> 		unsigned long flags;
> 		int post_ret;
>=20
> 		spin_lock_irqsave(&cmd->t_state_lock, flags);
> 		if (cmd->transport_state & CMD_T_ABORTED) {
> 			if (cmd->transport_state &
> CMD_T_ABORT_QUEUED) {
> 				spin_unlock_irqrestore(&cmd-
> >t_state_lock,
> 						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags);
> 				return true;
> 			}
> 			cmd->transport_state |=3D CMD_T_ABORT_QUEUED;
> 			queue_abort =3D true;
> 		} else if (cmd->transport_state & CMD_T_STOP) {
> 			stop =3D true;
> 		}
> 		spin_unlock_irqrestore(&cmd->t_state_lock, flags);
>=20
> 		if (!queue_abort && !stop)
> 			return false;
> 		if (cmd->transport_complete_callback)
> 			cmd->transport_complete_callback(cmd, false,
> 							 &post_ret);
> 		if (queue_abort) {
> 			INIT_WORK(&cmd->work, target_abort_work);
> 			queue_work(target_completion_wq, &cmd-
> >work);
> 		} else {
> 			complete_all(&cmd->t_transport_stop_comp);
> 		}
> 		return true;
> 	}
>=20
> Notes:
> - Please use spin_lock_irqsave(): target_complete_cmd() may be called
> by
> =C2=A0=C2=A0 backend drivers from interrupt context.
> - Call the callback and queue_work() after unlocking t_state_lock,
> =C2=A0=C2=A0 like the current code does.
> - A repeated call in the aborted case must still return true so that
> =C2=A0=C2=A0 callers don't proceed with normal completion.
> - Please describe in the patch description that the second call is a
> =C2=A0=C2=A0 no-op by design and that fabrics that complete once are
> unaffected.
>=20
> Thanks,
>=20
> Bart.

Hello Bart,=20
You always take the time to help me and I appreciate it very much.
I am following up shortly with a V5 that I think addresses your
concerns and also limits this to only two patches.=20
I am back-porting to RHEL9 and will get it tested the same way there
too but I expect it will be fine.

Thank you
Laurence

