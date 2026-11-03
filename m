Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739218;
	b=VSGx6j9E4oVvGDRJW4QnKNsrz2GyiL/ndZo+5Iy26KRgtObVIXZabjMltzAExyP14y/F
	 zb6/jonwDqKbpY4OGbnNHZBAn9U7G6gAQZlvsys7YpJyoogB5akZMfUJ+uqeU/lykr1VJ
	 gyGWUcpJuIL58jGbm1wbe4Zhf1M3LO9Z0wVAbAQ2ArN8JFKNYlKZUuPenAwwYz+Zn2wPs
	 WxlbAP8nynGKl4KS8c8b8p/5/JA0ohrwF7Kp6yqYgF/6+HWCS5VIr2WQ/+zzrCiVFFnMY
	 m7wlX0ogJLHWxIBSdOHRvLghcgi7dIoI5/phCbs9hx4PAtJ1GyFfUEfAV9c4u0zqfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739218;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=5xPft9KWXDkuOx6B7/u4FFqsvHBu2VvHvH2RwxyN1/g=;
	b=2rbisFI/71LUmIFM6MivfdOHSSXbUV0C5m2Xl7G7uUZ/vVfQOM6QnNEPW/82u8N10Iuu
	 3QYZungarURuyNwbkPrAPZ1xxTugyXjn/qQisffmQD2pwVrxng5/2Eh+jizTMxUTgv/MT
	 4wEaQ42TPKosUHw2j9dOoG2YMpWuqnafnXxN8+ypYSGgO3kFPh4iq4uMxqFgamkQBMFJw
	 ABy2+TgayzQx4s1h8q9+wTx+VuEmdTAJiWsLeVhegNsUc37DD5sPi0gfzMtNFxbJXa6hE
	 sna4LwFPHlyEIn/snhUzq3dLDAorPJ4k4+KBMpMBzuqS+MgIN6cLles5NwbQdz4DnYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ag3VuK5A;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tT8fNFNr;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B667606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B667606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ag3VuK5A;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tT8fNFNr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793739217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xPft9KWXDkuOx6B7/u4FFqsvHBu2VvHvH2RwxyN1/g=;
	b=Ag3VuK5AUyaEfJUPkJXijvvM0gzio3z75X66tnYnwYiCTI9pC6hTYqCOKWeKy3S4U5U1p1
	uXjLBCGxJppqYpybqd8ggtDwCaSjwnzKewHjSJtMUWoCaHvsgSKTYlLhHOmoTVUhW7ne3x
	/l8w7Awz+aimtJKwgY8LO0eHbv84sXw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-ddmWqwGzPxi0sU6ZJX7sWg-1; Tue, 03 Nov 2026 15:53:35 -0500
X-MC-Unique: ddmWqwGzPxi0sU6ZJX7sWg-1
X-Mimecast-MFC-AGG-ID: ddmWqwGzPxi0sU6ZJX7sWg_1793739215
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0cfe694c3so242087b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793739215; x=1794344015; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5xPft9KWXDkuOx6B7/u4FFqsvHBu2VvHvH2RwxyN1/g=;
        b=tT8fNFNr6S0O+XqApgnUOxbVGOG8DuJyT3Qy/+KaPj06AFSSpIzuhOlW/38uFVv2pc
         c47aoKR0zcZerlvJDCbBlrQYyrFMpUkNSTEspcC+FI5ElHyiKoYmKVqcL4r7YnWbKmsD
         Hk0e1hzuoHXJLT0T4+VXCzziv3v2PMUS3p18v7CVBjHE6hHqyzfUU9Hqd5xTDBBAC35d
         mGkneeO/nM/49EeAOoidtjriEv+zPoP+/VcaRIHg/hJMsbtEkXzY9gi6a88blR/OM8gU
         7QIFhE/Qmr8aoyaP74WeCivttJ7vWCLc2mF10CwL8gogP7W48PsZdh/6E/+s7jy0wKW2
         Z6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739215; x=1794344015;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xPft9KWXDkuOx6B7/u4FFqsvHBu2VvHvH2RwxyN1/g=;
        b=UeqCMStzibhQOyeY3yyjCiDzh0Fq3gg5fxGAhBK0frXAwnn7UbqAKwwpoBc5XFy33D
         Nif2jCNm8tBT9TLOos2PvUb7BQ8xU179D+R4zVDjbdTwWm+mgvhmpwyUAYi7NmSNt386
         HFymUuXgu/i/j9fqYR7y07/pDlJFsJDPfMKf8LE9CpzT2nKZUCUCj2YnoDoFLnbqyaZ/
         AGDuFkwpEQdRNzETXTXNTkXsw9RY0ucfJEr+ZeqvUwn3tp6K8LN+/dJTyZeXoqj6J202
         pU6/xmNIZLZB2peFRf4ARnuEiuIi63dDeDWt/MtZvuEzWjVCmXIeiRIGdsGPf/Ck34kJ
         7VIg==
X-Forwarded-Encrypted: i=1; AKwUvBxRPLWZLi7wVtiz5NngoJdHYANKltXhd8NUJJAII1GjVDFMvKgoHidmrnHSdTL3aU3ig4Me2xOaW5MWOXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WTu5nvDDJqk4y55/I0jLjHmKN3ybFM2YLJmMkAiVUW0PLaYsJ
	5FBvuXP9qP+ABiMmrzDKM7oVXQoq59YJzmHG8oXF06mMpnyalbw/xvvFtjA+QkwIy2fo1OVJ3b4
	zUNaVSJ+/IsidkUff7+r3k6kxAUEPmJHcAEbAsl+qxz9jcytICMKjHEeJB8HlOhcBNw==
X-Gm-Gg: AYBFou3xNUnuKMITALgIGVrdw2PTXV7Me1AXXL2E8tc8jRYtaCoHcGVqaJ8S/S+lXFi
	cUS5rvX8KOR+x7cvAbSo4iJzX+BcjO04mk5wPiFH86OkHZVEAogwziYrqee7GoqJKKavSm8ZNuK
	nNn1aqOP67ZnoURjXiRcJ/W6lS2Q1VWM9LhqHg0+D/qw2qVjFjrkETPr1D/05RKcJdXyMYqJZUo
	MVaY5G9n+Khi2Zk8rmMp5CTx3awINrlsA42injL5j9tLB5i/GJXtFxKla0afkYsJAMXfhaxQtys
	pVss9+eV/zYFkbWssR+77WeE2XHaPCBab+HtO6QW9JggKYP8R6U/NncnGucOd1R8gIlwV8SlYZt
	58hCzb1L4to4qKKYDxVHG+zrqGaK6dRKYrUTIJWTkshTAkccj3JdNUU3s6tAfWiM4lo53tMX6mO
	RO4XHOKB31D+DM+Ip0pFOUeBfIwkXpZqTIRaYprxnNy5h0cxF4PZ0SoMdMoqzjO1jLqQqsjhc=
X-Received: by 2002:a05:690c:19:b0:8b1:ce5:be3a with SMTP id 00721157ae682-8b2b677f906mr103815207b3.37.1793739215152;
        Tue, 03 Nov 2026 12:53:35 -0800 (PST)
X-Received: by 2002:a05:690c:19:b0:8b1:ce5:be3a with SMTP id 00721157ae682-8b2b677f906mr103814837b3.37.1793739214512;
        Tue, 03 Nov 2026 12:53:34 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30998fd95sm4851957b3.30.2026.11.03.12.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:53:33 -0800 (PST)
Message-ID: <98fdc5862cfd344f1b1401a3301382807ce4eaff.camel@redhat.com>
Subject: Re: [PATCH] scsi: scsi_debug: Wait for async target cleanup on
 module exit
From: Laurence Oberman <loberman@redhat.com>
To: linux-scsi@vger.kernel.org, "Martin K . Petersen" <mkp@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Hannes Reinecke	 <hare@suse.de>, Bart Van Assche <bvanassche@acm.org>,
 Wenchao Hao	 <haowenchao22@gmail.com>, Wenchao Hao
 <haowenchao2@huawei.com>, Catalin Marinas	 <catalin.marinas@arm.com>, Ming
 Lei <tom.leiming@gmail.com>, Will Deacon	 <will@kernel.org>,
 cki-project@redhat.com, jmoyer@redhat.com, bgoncalv@redhat.com, 
	mpatalan@redhat.com, ftjahjad@redhat.com, fsuba@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 15:53:31 -0500
In-Reply-To: <20261103193235.1564898-3-loberman@redhat.com>
References: <8e4ba1820a7c56867bf7fff07bd52ff3f79573a1.camel@redhat.com>
	 <20261103193235.1564898-1-loberman@redhat.com>
	 <20261103193235.1564898-3-loberman@redhat.com>
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

On Tue, 2026-11-03 at 14:32 -0500, Laurence Oberman wrote:
> sdebug_target_destroy() is called with the host lock held, so it
> defers
> removal of the per-target debugfs directory to
> sdebug_tartget_cleanup_async() on sdebug_async_domain.
> scsi_debug_exit() removes the hosts and then removes
> sdebug_debugfs_root without waiting for that work. The recursive
> removal of the root frees the per-target dentries, and a cleanup that
> runs afterwards calls debugfs_remove() on a stale dentry:
>=20
> =C2=A0 BUG: KASAN: slab-use-after-free in _raw_spin_lock+0x2d/0x40
> =C2=A0 Workqueue: async async_run_entry_fn
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 kasan_report+0x92/0xc0
> =C2=A0=C2=A0 _raw_spin_lock+0x2d/0x40
> =C2=A0=C2=A0 lockref_get+0x9/0x40
> =C2=A0=C2=A0 __simple_recursive_removal+0x35/0x570
> =C2=A0=C2=A0 debugfs_remove+0x40/0x60
> =C2=A0=C2=A0 sdebug_tartget_cleanup_async+0x43/0x60 [scsi_debug]
> =C2=A0=C2=A0 async_run_entry_fn+0x96/0x520
> =C2=A0=C2=A0 process_one_work+0x925/0x1910
> =C2=A0=C2=A0 worker_thread+0x567/0xcc0
> =C2=A0=C2=A0 kthread+0x355/0x450
> =C2=A0 Allocated by task 150:
> =C2=A0=C2=A0 __d_alloc+0x34/0x9e0
> =C2=A0=C2=A0 d_alloc+0x44/0x1d0
> =C2=A0=C2=A0 ...
> =C2=A0=C2=A0 debugfs_create_dir+0x18/0x3d0
> =C2=A0=C2=A0 sdebug_target_alloc
> =C2=A0=C2=A0 scsi_alloc_target+0x7c7/0xa70
>=20
> followed by a NULL inode dereference in down_write() from
> __simple_recursive_removal(). CKI hit this running blktests
> throtl/001
> on arm64. The cleanup can also run after the module text has been
> freed.
>=20
> Commit b402a0dce64a ("scsi: scsi_debug: Fix create target debugfs
> failure") drains sdebug_async_domain before creating a target. Do the
> same in scsi_debug_exit() just before removing the debugfs root,
> after
> the driver has been unregistered so that no host can still be bound
> and
> queue further cleanup work.
>=20
> Fixes: f084fe52c640 ("scsi: scsi_debug: Add debugfs interface to fail
> target reset")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Closes: https://lore.kernel.org/r/auja2VnJTp-ijxqu@arm.com
> Reported-by: CKI Project <cki-project@redhat.com>
> Closes:
> https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3017229113
> Signed-off-by: Laurence Oberman <loberman@redhat.com>
> ---
> =C2=A0drivers/scsi/scsi_debug.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index a922c8318a2f..deaed8b3e6c4 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -9053,6 +9053,8 @@ static void __exit scsi_debug_exit(void)
> =C2=A0
> =C2=A0	sdebug_erase_all_stores(false);
> =C2=A0	xa_destroy(per_store_ap);
> +	/* Wait for deferred per-target debugfs cleanup before
> removing the root */
> +	async_synchronize_full_domain(&sdebug_async_domain);
> =C2=A0	debugfs_remove(sdebug_debugfs_root);
> =C2=A0}
> =C2=A0
Please ignore, this went out without series numbering. Resent as [PATCH
2/2] in reply to the cover letter.

