Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563700;
	b=digWiGgwMHC2k+B97jO8HEmuyk+Pix3TR99F4gBF9UHnxvEcOhxsZNfSlqRZsO37uTdI
	 Jk9lThk25cq+I52Suy6qURhqqw/IH+av4W5LHR7wyNI4OeximZgwR83hy2moOA4kJBTsU
	 fu+9VEdGn1xcrkzwTMC4hsPWuK9+7xsVUmT+k0AyymMACq3hRJvdmwAdDLeukjOkzvy0o
	 O+5skAcZa41Ajw0YbH5TGeU3e6K8XtE9tZLpjNo+kxmXbXE00geF5/xJupKQ+HRdh7r3h
	 KUBWo0xE8HMCZlVpQBKBRr/Ta/1VjBRgmmG/F5hzhhRmhKyXC4kJqYJKjZu55sU8Iyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
	b=DQrIP4hk0ilaH46RD40x3rxpRuOHoTK6TF0Cs/KfObCykbndJ95xOtLWS0IhLialMVg6
	 Snn8O9XLRBo9W3iPCoc3XwWTFzsQYyPKxR75Hy362WBlzXlBu62nmEsJknKnjsdDrgScC
	 WlB3V68IVcdzOOVt2Z0t5Co5Pf6oSg7wnX4lHl++cC9Id9BIxqBfKsSlgwQU5GlnlQD2b
	 /8+giUPUnuNtgNMaYu4iTiCWcKwhs9e9zbrXVWkpxKE94+qnXYfvUxV75qfou+HhxnrJt
	 iz/FL6nzSBwihxfBxKCEMx4Iz+2pKmhV17jYiESpjDrs6gP9zmI6O09gmtlpXsNDd7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sk58W6sW;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6760A2612
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA6760A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sk58W6sW
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso169260766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794563698; x=1795168498; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=sk58W6sWmN4ERo+6S+koVh/BM/TVuc998Smvb7+dAHAHasLoIxA1PyH7SpTb2sphTs
         qaL8BceJIK/C5zTluK59TXAg0t7i18MIhSXKzAc74GDtFkVBtJ5XexxofTn2ErTCpEyw
         wBL0ZIwSoD+QdFLNUYuAtp3uhttIIU+8CcgeY50Q9BuPcdVkRSxffNnvhBi5q+TOT3Z0
         N0fPVcnw8avDa7R0wdKzwUNoVC/3vPRCD1SmgKjZfrkNv7BBIugYP8aqCryl3mRTzhIm
         nyzLSOhSkS/Bye+QA00IM2MsjhnUA408QIyungJaHYxvuyXbuTeC6K0dJcKnUnQNsCLo
         BJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563698; x=1795168498;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=d3J0lbDTjfMsr5b3pJGZYA5NSC7b0jUDOVMbKxedRPHpnRW0If89x4Tf4yNfzGZqBR
         E6Pk8RhOny3UFSrSy4Is9+O1pBbhSO2wdjNuekITxKdkGYTUr/kTCVhp/BXZJGIwOoCl
         LDXPnZzihT1/zf2TMhY70poGGoTVqOMjPR/8XmIJLveqI2oUaOaTkFC4Z0RNgM2LsTL+
         J72PdVtN5E85bmATrRSXJDqWjjf29oPvO2fNSYYUeNz0rLf/O+zf8VIhe3goNrlIW4lD
         OI8Jvrv3vG/i9bnSURJ54cIkx/KIpMEZDxCAFSal1PIsC7y0YYpZDfZcGQ8LiLtc++LF
         sXhw==
X-Forwarded-Encrypted: i=1; AL+hErHdMgnHVCWxvh4+jJ8j4YHpws/7puhJv7ib8cHQRiu5dzuyd1dP94e5LanSsrBpTJeZbp/18BMJq7yh82s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8onXjnmzrJIBoZmzDJDHPdJ9cr4crVyYIcuatYu8d4iljyVfBv
	DW5pgxOXY1/MOC9N0qw02yM0/7C/t9Csq1JG4m3QL2uAcerMMZFJF9SoaYiAErtHwY9Y
X-Gm-Gg: AYBFou1JujLdoINS7WTZ9/xZU1lODXUyeM+lMlxvxdfxX/gH9kEzHNGSflDlovEOK79
	u7gwRG6nUoU37dg4AlBoft7gGm20dRUSdrIpDuKQuTL38EFl6hJ5NcONNPRm2bNtJek/yCqYpmx
	NJcanWrTKCc8HqTP/57Ow6luBWYPMtdXmKD7ujlHtfvUNW7H7mDvkHIoBVXAum/PI9GOIN6W4mW
	jq8Ol9ycM7QXVR4rJE7BQkODWb7YltWY7oB/cth+mlrvGUftHztu59TnvJ9Un8bi+lANjo9BIhV
	i6SMm49KtPSeCCb7Bg/NtyrK44xtCDJqQaRKWM8lgxPvi/O712X67k2j0cpCxrzJnM8z4I1Aqs1
	xEcy++QmO9BSELiLHI30Kn356MLWsiFKbVDhqfDFGVZggtEZhMvIRc9KfuxMxa99ESPI3EkOlSF
	QW4D3JjDW89OErTANcXvkpthK5dOK1Rg9q8BCZrjDk3GdulJBiWLQIGX6+dT7NdPtr5OcMbNi4Z
	i7D71Ocn1JHULLR+bXpNxiXW+jy21Z4i+HZ2hitUqpI2HuyM+UPEodmRYYFzGlAo91H0ysk2Mv+
	beuQi5eC5vK7kFAsYRR9xvriMLEvUdiQnEyqNeVJCLBKgDn5+bgCjiAvfPmSx+0=
X-Received: by 2002:a17:907:ea93:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c50963bdb9bmr198299566b.44.1794563698514;
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50957c6c1fsm75151566b.0.2026.11.13.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Message-ID: <b42c9f4d29a9cbea66929c95cc8f736f12703c72.camel@amutable.com>
Subject: Re: [PATCH RFC 01/41] loop: refuse backing files that aren't open
 for reading
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
 linux-kselftest@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 13 Nov 2026 10:54:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> loop_configure() takes any file as long as it implements -
> >read_iter().
> Loop itself never checked whether the file was actually opened for
> reading. Buffered I/O went through vfs_iter_read() which refuses
> files
> without FMODE_READ. Direct I/O has called ->read_iter() of the
> backing
> file directly ever since loop grew support for it.
>=20
> Since commit f2fed441c69b ("loop: stop using vfs_iter_{read,write}
> for
> buffered I/O") buffered I/O calls ->read_iter() directly as well.
> That
> commit was about O_DIRECT handling and the FMODE_READ check went away
> as a side effect.
>=20
> So whoever can set up a loop device can read a file it was only
> allowed
> to open for writing. Open the file O_WRONLY, configure a loop device
> with it and read the contents through the loop device.
>=20
> Refuse backing files that aren't open for reading. Loop always reads
> from its backing file so a write-only backing file never made sense
> in
> the first place.
>=20
> Fixes: bc07c10a3603 ("block: loop: support DIO & AIO")
> Fixes: f2fed441c69b ("loop: stop using vfs_iter_{read,write} for
> buffered I/O")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index a3325ceab484..c96e35c3ef42 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -528,6 +528,9 @@ static void loop_assign_backing_file(struct
> loop_device *lo, struct file *file)
> =C2=A0
> =C2=A0static int loop_check_backing_file(struct file *file)
> =C2=A0{
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> =C2=A0	if (!file->f_op->read_iter)
> =C2=A0		return -EINVAL;
> =C2=A0
