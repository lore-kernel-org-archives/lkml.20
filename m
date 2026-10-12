Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB1472F7F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799660; cv=pass; b=ndQmgMuGpexWnevi9FPDuyowHRNoR0MgGswaYNbWqO1hetHPjHRTeYh/6TPJe3doK1FeG8PmWuNSuDwenU+DV66rhSSzHqManaHDILuOr5AzAnEAq/Tb6iTVwMJZG1Q+DK41h0YtuGTWNj0sYuJsl0kfTkkg1nxDKr+V9LLYYnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799660; c=relaxed/simple;
	bh=ngoSFJKCcMjqIKaYPLntMoiTZq1+aK2iDToLFmsMqUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPUnCXCYUpgkXH073H2e7BV2qyUPPZDl+wErOW+CLw+7ku1AN9yFebTNf0N92EU5MUcm55Bh+8cn8FmF3/Se4fv0R53o1M6tili1KJa7UT193X4kfPJQt7ojUpLIiHi/+rrkmQy2GOB+wEtc+AXRzFwWjwqkIRmOFd3cPCbHOtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqxeuCqt; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqxeuCqt"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917a20e9efeso26449606d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791799652; cv=none;
        d=google.com; s=arc-20260327;
        b=X00sv12BM57kzJue0JGtGD1UetqIM8leK8wtK413uYqSEOaidNruzaQSIzNJzEfjl2
         4Z35I3QeM3Y5AOvvcO6l3x8M6H4dS+/iZBuFNe8OXaemllg2dbC41B2v6/t9vhpQOz+i
         chpjB2PRs4+/mKevwMp/EIKmAD57NGCLbLM7qxPkUEsneowXmlDAo6mmkg1gnK65+5mF
         0gli+dMv+khYV0AlAoe1GBX91ZHI43F5xc8VR4cCsWYVq8ugMW0TC13Z37nRWRxKVwBI
         l1DaCr9VGeBRNadLpToUrMboU6YrQF771M2EOv40JEEvAxDVoZPg/ECcGyC5Eq15737O
         6J4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z3gPxzFUWOWhxxZIc6/y8cCD/Xx0PXySz85Q6RMiuY4=;
        fh=1yNi4tNQasHp3QOOBx91Wb1mbJlIpcun7LCMYeWyMJE=;
        b=eET9+piY3lV6fw+I3A1nTChaW9VenOKGixQGYwVrHKws2BZ/VzeTXr5NJGtuJqRwiX
         uNHfZu3I8c46hXOed70l7hOSbZ1S28HIQ2SuOod3B62kO5IJQ3XBdKCAo/zp2lW0lylK
         qUtn49vxgUCfAtgCK3zGlBVwNA9SFi/62afxhE7RG2MbIXlwCmqDnsPnWwE1QCylT5kH
         ihGyu6HwcrsjBN+lS0selwA6gu1TZ6gbw69+lP1PiOG83qrlDoanyTDuHmexfYzD8KX5
         mB/fNAzOBNAhCtHwIq40N/fTCGaLfkPHtr6dpEBR8hTEvnzuqGobbfhIkSO0ZPkMIsn0
         C+ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799652; x=1792404452; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3gPxzFUWOWhxxZIc6/y8cCD/Xx0PXySz85Q6RMiuY4=;
        b=YqxeuCqtkxtuUJZJlw95ZalpF1RSjwb3b7ytIvMbj23gOYSs+nMc1EDzPKPzZLBScp
         jNAxh7mZ9VAxqSTuCFpTyIA0S2N1u17shw2Way01dAigJz4QEVOEuaTGdZs8ORvFE2mM
         GnX31er4fJKjo2K73S1UD7sCVCwXDj8Bo/MPlS8pfOSzsejwnmvlNzxK7WybQHO5m1/4
         IKZBU9b9yXnT0Ab9Viq1N6iCypO+rBF8TIaOjy2im3eu+QBEVTRdcB03Rg47+ZomL0C+
         1GvvCdBLunkODaLxh/IF447iPN13Ww39r88FTVxuQrvwuTHWm3VmD3COEtt+zaxKqinl
         SDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799652; x=1792404452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z3gPxzFUWOWhxxZIc6/y8cCD/Xx0PXySz85Q6RMiuY4=;
        b=rRleEwc3UuOpJqrwlREZyePG2sQof4BPjSYapVcQh8NLaeObmaR/j5Xh5XDRsvFlz8
         JhDdcQ5tatfMl2jpCafJyCLqB0utof1uc3wR5RbXQHl5ZwFh6pIh3K94ir9rd6Z1Fe8b
         /exDkiHcpKLf+7ug/AdjzlriUqX39Yi14oQWYj8u1RCjK39bfltadtP4oHuax+Vgk5bj
         ZjOIi/JsL3u2VIqeNe/NGFLrSibIywx6lI3yOdi4Tpr5ZdAeDix64rWv9rXMdLn8Jo1t
         3otHv5Aa62YWJtHf6xMW9cuNaaylvQ/mnw+aiIx42KtyMlSL+T2GBkO2nLdzt1Smz0fk
         vtUw==
X-Forwarded-Encrypted: i=1; AKwUvByM1qap3NbAqQZo3qqckaeqtfJbTUOlmMNQLXOvoOPiCFn9UMRZ3WmH0S+06uK1VDg5WziEXComJV0zxFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7iS27SwKbwhXFwCQw9YkNHeMyTSN5xo9whhYlJ8EGgZ4yHZuo
	pSn4l3OaCpGQgaeGEW3SYTorMnnvxPKIYZsskVz/DvoEDxsK+EjJVfZ35zsrYF5+GHg9wRrunll
	AFvmKktRGJkEFnmWRV7rCzd0wGYqrAb8=
X-Gm-Gg: AYBFou12x5zWH46NWlUIIwCqABGUwWY7ixlhuJXZuwVSVN8w1BiqX9sU+a5BiiMM5ya
	eEoBHUhHFgxEmRXX4iSQIk/Q9/CmFT2DjeWVulpODGYoiaiVJwp/mkCbrk1bO9gbDQyHXJkn26Z
	8NKiv+Z7tH/WxoPnJBipJGAORHqcpKBqGDzGe9oVxjhBS3j0nJW15tKFVjQRwuAqEhA62IpBvIq
	ZASpt30GWVedRdbSYKaCwuo14SzvV9Uyujqcg2Drwyz/Kjku3LmDjScGpzY0zQ285Sez/fC/PGf
	LxIOlN/wfmElX5ePpWFTYZeyRxDuKktZ6WkzaCV1wv/EX62MfayNfoI=
X-Received: by 2002:a05:620a:1725:b0:93e:94f2:adaa with SMTP id
 af79cd13be357-93ebd1ff9e0mr1625320185a.32.1791799651780; Mon, 12 Oct 2026
 03:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011014803.100454-1-physicalmtea@gmail.com> <20261012015950-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261012015950-mutt-send-email-mst@kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Mon, 12 Oct 2026 18:06:54 +0800
X-Gm-Features: AclHuK81b6ciDOyZt3Ymreum_6B8T825nAgthHuFC_f3e8ltpzVIpbuECAmYi1w
Message-ID: <CAJwVaM+Lw8kJRbpMrC29QZQeoJUyfCRvic32J2huZFFTyyjekA@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-scsi: do not count PI bytes in the data length
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mike Christie <michael.christie@oracle.com>, Jason Wang <jasowangio@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Nicholas Bellinger <nab@linux-iscsi.org>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Sun, Oct 11, 2026 at 09:48:03AM +0800, Jia Jia wrote:
> > vhost_scsi_handle_vq() moves pi_bytesout or pi_bytesin into the
> > protection sgl and subtracts those bytes from exp_data_len.  The length
> > passed to TCM is still exp_data_len + prot_bytes.
> >
> > prot_bytes comes from virtio_scsi_cmd_req_pi.  With
> > VIRTIO_SCSI_F_T10_PI negotiated, vhost reads that header and does not
> > check that the CDB is a READ or WRITE.  sbc_check_prot() replaces
> > data_length from the CDB only when the protect field is non-zero.
> > target_cmd_size_check() leaves a write's data_length unchanged when the
> > CDB size is smaller, so a command that does not get that replacement
> > keeps a data_length larger than the data sgl.
> >
> > The KASAN report is a MODE SELECT whose header had pi_bytesout set.
> > The data sgl held only the parameter list.  spc_emulate_modeselect()
> > walked data_length and read the next physical page.
> >
> > Pass the data sgl length.  Protected READ and WRITE still take their
> > length from the CDB in sbc_check_prot().
> >
> > KASAN reports:
> >
> >   BUG: KASAN: use-after-free in spc_emulate_modeselect+0x145/0x380 [target_core_mod]
> >   Read of size 1
> >
> >   spc_emulate_modeselect
> >   __target_execute_cmd
> >   target_execute_cmd
> >   vhost_scsi_write_pending
> >   transport_generic_new_cmd
> >   __target_submit
> >   target_queued_submit_work
> >   process_one_work
> >   worker_thread
> >   kthread
> >   ret_from_fork
> >   ret_from_fork_asm
> >
> > Fixes: 9f977ef7b671 ("vhost-scsi: Include prot_bytes into expected data transfer length")
> > Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> > ---
> > v2:
> >   - Drop the claim that target used to subtract prot_length.
> >     9f977ef7b671 cites 14ef9200, which is not in the tree
> >   - prot_bytes comes from virtio_scsi_cmd_req_pi
>
>
> you can mention the other patches you sent fixing
> security maybe this will calm down sashiko.
>

Will do, thanks.

> >
> >  drivers/vhost/scsi.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 4f8c0260bc9e..4bd29c2ceed9 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> > @@ -1534,9 +1534,13 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
> >                * vhost_scsi_queue_data_in() and vhost_scsi_queue_status()
> >                */
> >               cmd->tvc_vq_desc = vc.head;
> > +             /*
> > +              * exp_data_len is the data sgl. prot_bytes already sit in
> > +              * the protection sgl. Protected READ and WRITE replace
> > +              * data_length from the CDB in sbc_check_prot().
>
> this is barely readable - could you improve pls? even if that makes it
> a bit more verbose.
>

Thanks for the reminder. I'll improve it.

>
>
>
> > +              */
> >               vhost_scsi_target_queue_cmd(nexus, cmd, cdb, lun, task_attr,
> > -                                         data_direction,
> > -                                         exp_data_len + prot_bytes);
> > +                                         data_direction, exp_data_len);
> >               ret = 0;
> >  err:
> >               /*
> > --
> > 2.53.0
>
