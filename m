Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222416;
	b=4wB3uLoLmTvhGLCIRH/4w/Okr4RVziJwNsFG2/owRSZH6YwpVfrW2zfnjfStSbNHfy6q
	 nocHQW6RIzHHNtaWIan/jTE+w+DO9piz4EHA0IxjD4jFQSCPIeUUHBuqNJyBszEsJA349
	 zlidiLhmCS3gLP6p6Rq88Ltu73uWXmUWxeCfbwAWM6oCy2g0wH6E8+gDfEegffVo1+yPX
	 t1i/olQn3Yv05JVUjyIMHMFkNSiDa5LItOlMJzqYlsyi8xHKx6zUOwv0p3G1NWyRoQ1z7
	 TMcivH696zsyECGRj6as/DIPhXvfYmrCVDuFRBGWDRmStvwHufBHgqXYAgqWzhofsqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222416;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=sB1AZMsrCF8YGBC7Aq4dmS+wCOtPqKdKL2wS5BWPtnY=;
	b=yOk3zKhtebUf3VH8mZ3MXrV0b6qbD6f5NCF3kLB2enitD0M/8to3P3hj24qDHyGFDOfD
	 cXglmUXnBIYL2Q0YSV3YUPsROFe5+e1ZLOx1gUlnso1V9LBNUuZ8rDbtb4LtmtUti3YEq
	 durCX6ktjPpoCTcXBNd49/8PE7+LtFo3FsfSmG5d1JVusQ6BO8WJY5Y7HrJuoon7kR5S0
	 9RQ5NrgEY6ca4Qk2nMfCu101P6xKLHQxiYkm0g+6mKpvpSAZguqadighpd6GX4pcX6s8f
	 gYAQDpgKdW1UkLRfbSxuTvFqKBa2x7xLkvGMLlLMNUFhMvh9iwsGhw7wbgbKpGxzj3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="Z3tDBW/T";
	arc=none smtp.remote-ip=43.163.128.43
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92AB606A31C;
	Mon,  9 Nov 2026 11:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Z3tDBW/T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794222411; bh=sB1AZMsrCF8YGBC7Aq4dmS+wCOtPqKdKL2wS5BWPtnY=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=Z3tDBW/TE2bxgTQVC5yncQIjtP9ub75/NL8T2/qAULjgQ5O2zgIuuJff+Id4kq/Nd
	 j4yltXWO7KfueIzkG3Hswvjic4EllUeBp6zJZgw+Ya5uxXn0ms29q8c7HqDTymd0Y8
	 4UT08/DUJOlqStj4nm4Zm83tyBxPFEQAdi13N+4k=
Received: from [127.0.1.1] ([223.88.55.127])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 1B1040A7; Mon, 09 Nov 2026 19:06:49 +0800
X-QQ-mid: xmsmtpt1794222409twei532ly
Message-ID: <tencent_1488194DD8BAB74913B0C0CB5736E5E0860A@qq.com>
X-QQ-XMAILINFO: M6tnIAhVg4BFOOC5avU5SIKHZcpmpkiptMAMpyE1sNbOBmwnntxt9L6KVfCg3d
	 5+Ab5DBejO2S6qI1FmY+QyVWSITt32rlAzattnmh3EDb6o7vxB9naN+fbhwDeYiJ05VE5ASaZ4Gu
	 ZXc0Py5+yVHmO56kFuDvWA7holLhfAQQOaDa2528A5FMVAhH3ahtiEbgtRHEfPi5DhxfoZbD0oqk
	 esDKOApmytJv76SOqPOzIqkNn1iN+zXKadsD55lDRK6FZTzadMTTAB+iShEfgyt+kn5HC7tS4TcV
	 UeMZwO1QQWHwPgAWDiUnS6l+FX9Y7cf/Y32gKZtfFtsXvRvNROpiGSMh57lRejIDRs5/fz6x6bqF
	 simkfDUg0HvDhh5ysIhNarJUixJmloqGWeTNfjsskY1cO30CdgwLodH21efmGtu610wmvv7CCbed
	 CXYzB3u1k5qIC6nkf3jiM7HEG/9mOjIHfEgMScoq9SYDVtVjgPy/No9inWn+kF23aQclje8aj7Wl
	 omWJEpv61n37HjlVxc6FHQI3nh8yI/lzpkPxkFmULJfbjs7gsllWtm1ekzsgv5ZChk/szqw8XGN1
	 kw5AmhSJAhDm5bqSse0Ohftl/9Co44iXKo79K+rFGilvUYjVAoBCcVcGY6fJ7lRyd9THmQlvr5uP
	 QeGxZVgdOlT3xO3vdvXIfstdlH3MBadOcNkd7HZ+mkCB446BRoFKEtPNz/rPqtVyzMEjhlVUj6r9
	 zUY/iunmFAxkQ1hS0Iv8fs2Lzld5S3i/1rosBzn6bFHHEKgwegDq0rEK8u42xxqCN2r0tUnXUFKZ
	 QsnB04GcSh1te5c/gicj6V/Ydz8sgYl26LibJaDHFy18w8xfY3s3Mt1/7h9oLQO17q+rY4JORRJ9
	 GwLrHvXk9EmI/bDbVR9Vr6Od0j88FmzBRhdY/ElPEKDxP3djJiUKoN28tpbMCBnPfTadNs5Ek71W
	 oKcP2eE675PvX5JB/FtZy8jPB+JZ+TKyyFHivBvPVIq0G7p/qr/5kONExpRR9HpVG//H1hw+pni/
	 qpWBP63DxeY3dR6DvZFSY/mdCNqTQ3r9+3kfPMlXmgDPDd6WY7zSWHwRU3Trzk7lV89KPdRHTVlW
	 0Dew8BCqi5577bVDQkxx6Mq5kf5hK4wvBfzt19o5kZDqyCVaAba2Y3ZwIKxw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com
Subject: Re: [usb-storage] [PATCH v2] usb: storage: don't hold dev_mutex
 across the max_lun control transfer
In-Reply-To: <2957b6ab-f1ea-4d1a-9124-7ebeba7ed617@rowland.harvard.edu>
References: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>
 <2957b6ab-f1ea-4d1a-9124-7ebeba7ed617@rowland.harvard.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 08, 2026 at 09:10:50PM -0500, Alan Stern wrote:
> You lost me.  Exactly where does usb_stor_scan_dwork() or
> usb_stor_Bulk_max_lun() try to lock udev?  Taking that lock while
> holding us->dev_mutex certainly would be a violation of the locking
> order used by the rest of the driver.
>
> You are certain this diagnosis is correct?  I can imagine the task
> being hung inside the mutex_lock(&us->dev_mutex) call, but that's not
> what you are claiming.

You are right, and I am sorry for the confusion.  My analysis was wrong
and this patch cannot fix the reported hang.

I went back to the full report and read the "locks held" section, which
makes the picture unambiguous:

 - the hung kworker is blocked in mutex_lock(&us->dev_mutex) at the very
   entry of usb_stor_scan_dwork(), so it never reaches
   usb_stor_Bulk_max_lun();
 - that mutex is owned by a usb_hub_wq worker sitting in
   ene_ub6250_probe() (ene_ub6250.c:2363), which holds it while
   ene_get_card_type() -> ene_send_scsi_cmd() ->
   usb_stor_bulk_transfer_buf() waits for a bulk transfer;
 - the wait goes through usb_stor_msg_common(us, 0), i.e. with
   MAX_SCHEDULE_TIMEOUT and no timeout at all.  That is fine for a
   transfer belonging to a SCSI command, whose timeout and abort
   handling end the wait, but a card-type query has no SCSI command
   behind it, so a device which enumerates but never services bulk
   transfers blocks the probe forever;
 - the same probe path also holds udev->dev.mutex, which is why
   usbdev_open() is blocked in the report.

So the deadlock I described does not exist; the scan work is a victim,
not a participant.  Taking the transfer out of the dev_mutex critical
section leaves the mutex_lock() in place, so the hang would remain.

Please drop this patch.

The right fix is already on the list: Hongyu Xie's

  [PATCH v4] usb-storage: ene_ub6250: don't let the card-type probe hang fore=
ver
  https://lore.kernel.org/all/20261109085449.83117-1-xiehongyu1@kylinos.cn/

which bounds the whole card-type query with a time budget.  That is the
correct place to address this.

Sorry for the noise.

Shuai Liu

