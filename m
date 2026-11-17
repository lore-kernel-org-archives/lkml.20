Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903941;
	b=k6kDEmm7grKwBsRKxfZHsKNFEWz+1/M3of2H3wWSUC83qGF8i53K/cXhPLU38Fhu2k0s
	 Zv8eYmauHaEUMWRQyHVlUFuRWN43X+rL/uGHnQD0XrzmeiGhMz4Yu4B6w5lT/70+WHw6X
	 uL/wOOA8iTYuB6VW0Y2RZk46Sb02N113ipeLeFFbznOYtmT6Dx2vmTYuBmLXN/g3pXj0/
	 6yvEaGtYzaIGkQFZNeEG349eDk3EF3QZRCDozxvVhsoaGQpoT/Qa+y0c0fXlYyRLxQtpc
	 abIaPK0Uj0ltond3b7hXhiiib9CSjLABG4BxyIJOjAcqWLPrfDbUd7cXtSIvwAMM8Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
	b=oIqtFvce2gYoY68W46tsWTVKMKfHRULqCfdsoBLVaH0leuC2lC9U33RcXbxfwZe6U0xK
	 LWzBIxTIBWjrrUBD+bY3VlXMuXcwpoLkdST3e6mT+u29kfBXOPt2YMF1oGW+GsO50zEtr
	 2rbczF8KTKv3I5rba69bDq/HJVpPDQYpV3f5cS4fUrH+Ll5tEOpUdVwPmtw+DlCHb9lwF
	 IOCEhk6zHxngVCJ5uYfDFPLEIY4Za1X8SOex03leCynxqWvcIf5c/TGJB74/f/1GJOySp
	 rEe+x5GqG9V2DwNnNrsq6RfNuwd6tIgY+JTMcGDx7wQsGiC0dlPI+M4b6JjQMvdy6bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="QoCmkI1/";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C22606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C22606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QoCmkI1/
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492690dd5daso4102921f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903939; x=1795508739; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=QoCmkI1/XbLLMuB5pWQjj6w7lhYbbqiM96jQW+pj9RZ000aRRl9S7H2qSmbtORMNOo
         ePt1TXAWzVIR/TrMeI58Zu3n81XgIdPHavzyhyljr/3uEJYZwsW6Sg14gd450d308jE0
         RrvE2vSlthe4MhW9V05IsJzW8g0CM3u+nfQ1hkfntpYQW6a4z4zmXmxD0w/TiuzDbd7U
         U8xZ2FexNWbZhSQ3d3pA0tlH/f0MOfn4O69UeuIyRM8vQ/YXTKpGPDyGoQczoxEfoynP
         BDcwZppUf46pJGXZ+RH52kug0iZSl25eld2NGIqCa+XVs4XFwFr0CZI1pzljVyhbNHw0
         NmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903939; x=1795508739;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=PbxMXsoftmliqh72XffG4bFY9sxQjROcl4H2FxAWjoneRFgPK4Lkq9/aZgvuJA5wFF
         OcbJZ2jM7VdMAaPsnVE3C4NVjWnf/onrIfVR/VSjNYWaEB31gJdXg+wFUkpJrrfG7Mug
         C647hlzYBtrmwL/UUxCpFD5lTr7L3do07V1yZKyPX2T6sMRBKRh5fwf/zRtnkOn6WQjG
         Te4p/fcpUEe5NIVFYHytBSb/JUH0Ox2pbO/7EimdxuBKTDB2buIh/9owbxKX/sn/PacY
         7qFa4ihstai5QELXgo69wNiewfOkidHUWPPF0h2JjWnRMvKaGeSagARi6LuYYroIBht7
         j1VQ==
X-Forwarded-Encrypted: i=1; AL+hErFqp62joFusZ09XhaRGIkzPE9i/d0sDgG16Gp03JcRpRxgYyA8Umqky15/txzHCdj8CMUFSPDnrFOm0kSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BA0iGJr814l2C5761sgLapMAKEY+H0oYIyKpRX86hg/aEz1Yy
	5Vpula/esT44WgR57vhcDZSKX+svrZ6nQFR3USRFDuR1IL59Tmx0Ot76JrGGTApQMzSu
X-Gm-Gg: AZFdTZcz7SFG80+nCeuS7qNEGwRthfNIJ9T2ck/U4VBgv5VJklAWxGR7o350Fvq7rao
	jIzbNb7SIZ9y7K1+AGJ8/FWBdA9Hng9EuxSh83V8rvAoLX7vyCWtYNXalOpSBYkWA2drOrw6aEt
	BR5axbyrwuDC6dTHFQA4GrI4nYT9A9zU9x5BSuc8xlVhLvGaJacIeA1WupMA3vFN9KoBTzQ5h7J
	D8vhjGXJFX8cZNptqONC0iCsJsJmhHrmgGAdCASvB+egJ2HlvSC8kA2NKIhU/bDmIJmo15pD6Bv
	s1M55AtGSc7IcmleO6KUv6nRWpQovE+CnGfujNLvX902dun/Nhq9WNlJCKCxVPrmSCp9QEC+XI0
	P/0az4gRaWbwJh2eLxBeQalqgFr0a1qJZ9ZiqN1rtjSmuvDrBaqxMB3mbbz68YreeCFjzZDI6Ss
	s2xLdSJrfSv583fU21yR+ZwACwoVoOoTftgKhzo0dTndkr9PJe5+2BSgkAGv+Kv+6M/fQt4FFNW
	mR5Jy62kFO3FTl9Tz26khaPKCXd/qNzU7+xWHFpImMdAfUwlbcd4nKfDlYOjp6vlF4/9eOQbdvR
	6qfC2/eus66FFo894FPYSeT4nc6ehZ9Zo36YF1OnFOqg7T+Jt9J+7aL9gc9VJPFQl8ZH4pZ34VP
	Y4AWjIg0ZeZNy1a2Azim9SXj88JHPqPBnsN6cFveAwROHH8cRxUpXdEnVF/eiZmFlkPrOtuR0E+
	Mmug==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr25238543f8f.13.1794903938925;
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm26907832f8f.28.2026.11.17.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Message-ID: <a9124bf1c858cef3e8ac06b1b2396dcb0e19e2a5.camel@amutable.com>
Subject: Re: [PATCH RFC v3 02/44] nvmet: check that the file backend
 supports ->{read,write}_iter
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:25:36 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> The file backend calls ->read_iter() and ->write_iter() of the
> backing
> file directly but never checks that they exist. Everything that isn't
> a
> block device ends up in the file backend. So a namespace pointing to
> a
> file without them calls a NULL pointer on its first I/O. Only
> buffered_io=3D1 gets that far as the O_DIRECT open fails for such
> files.
>=20
> Refuse them when the namespace is enabled the same way zloop does
> since
> commit 0c10f8a1a7ae ("zloop: check that the zone backing file support
> ->{read,write}_iter").
>=20
> Fixes: d5eff33ee6f8 ("nvmet: add simple file backed ns support")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/nvme/target/io-cmd-file.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/nvme/target/io-cmd-file.c
> b/drivers/nvme/target/io-cmd-file.c
> index 695963dd932ee..dfa8aa46188c8 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -47,6 +47,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	if (!ns->file->f_op->read_iter || !ns->file->f_op-
> >write_iter) {
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> =C2=A0	nvmet_file_ns_revalidate(ns);
> =C2=A0
> =C2=A0	/*
