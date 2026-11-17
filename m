Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903967;
	b=g0gdCrhW342tac+MPUCNwfkEZWFWeS6uRC2vGYEAedKbZuxM5ymwLChP+9Tku67tfs3b
	 1Gq+enIPntVq1FLo2zuGGccKmK7ELbn3DWk18ctZ+Hcgx++uP3q8PTSDRAoam4kSWbFl5
	 FiNsZ4I3WXuEJCRe4qFJ+i9Xgg8w1XFyF1B3gOPNjnEf/Zx/zDvagWCRD7Nl4E7DS5OtM
	 zt1Z/8Tj1kYSQKAuMS0pD/bupTmqXfKKB4/lDvFEy+SAA78CJ1tYyb3eDrmxFdzQ8jMQz
	 EFAhGB7dZzccWtSG9bPlzocszdijpnR3SY9cGxlWktOxc1R5FBMp71gFQhagTWCEXYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
	b=cvr0xsduTH3tSxVauXmV+Vxcg44f9jmX18kFYaTv9G/VinizrucwpUyx1IhIvfr9wT89
	 Zyqyx1JULS0/tCbPaYCiKZdEkzIj+jDq8O1eNOCIhI6zqmZVSWLHA5Liea1jEBTCnzAar
	 V+rA2F6urNlp/Q03F+FNEAn5tVZTAEr97D3u4XpsFvpR2lUbtt9eY7y4+8qpOMau4Jhjp
	 c8v0NP2Vz3P9DWAGIB/phMrw01jdGiPCXcbBhA3VRT4FvJB2IoC8H2vfiCYwqB8i7gr6r
	 cBsRCfLgRy+ascF4wcVDW+h8tQJMDP6SB4eoh/OoavzoAzin9Xu29WZE4e2dyk5DQPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cds43TFp;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05280606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05280606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cds43TFp
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so4353915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903965; x=1795508765; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=cds43TFp7I9j7WPcDQvYfHpQ9LovbzzVif9J1GAb84gdrUsjaaD/ks8/CxWEGRZF0/
         68hyeBKuGnu6JbonI+DUrAk+S9ERoS7tOFFA4H5eAQDr7L4jclXV2ELfZ8mKm2Ufg0Vf
         wmDFKHpSFXtb9q6HdOEKHOgWOeHJI7n45fohFUmuSejGQMSPwWlozLhppiRP7NP6/RTN
         Xh3C0JkZ12tnXvLGCknth+xcOYp3m/oSfXqUlVI9cwzFe0Rue3P0S85bM03sQyFUoXwh
         8JJkMFcg0oB6zhSAQwaixAlqp7dYBZf2pow5RK/cSK97CWugz7jqMDtCMqYWg5eRSPcE
         y3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903965; x=1795508765;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=CYEL6AfJ8l8Fe/aUe4zKX3azR4RE1bo0Ju2fvQ7GmLr4WpX4E8Y17zmJOw0Mhfte5y
         t0G8GkrSIzuDMFabxjFYDZMuZegjuN1YJyqZ5BCQzpo+eUQMJCBCVOqGksQ9NKD8AsbZ
         SUrDUC7aljx3QqMbgbaNe6j0uKqOryE5Slw9FVuq/2QkjRKsUE1+LPB/OGfay7gZCIFj
         Tk9glW4i2AgE2f9yAGVpGoSER1PWqhAgjKJpNzhkGASJNuqPrMFKm9xuP57qSMW/ro7l
         vCAf0NKpq9Y5YiJGC5/NZa7HW9AbA1RA94S084XxcjOYN3Oe287b3wNHnVE2AyiQVz4d
         LvYA==
X-Forwarded-Encrypted: i=1; AL+hErFJ3BVvG3ozsoS58BEya1Jzw/MUxWja12CC2Z5OxjsQKl/Byiu+BQrjSk4L4ylJc6tvbfQWrTf+gLd3Q1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dc4zIVgMHzMu3k8yOShnOLYMcW21YdVuK9mViTaz1Wd6nLHGs
	JMDlvdCW7vxtfxShK0nIpt4aCnSfDCYemoW+Hfmt5vXKqPjY+BWw68ZHl07Tcw4dxo6+
X-Gm-Gg: AYBFou38eoTuA8Uz9mnzZfK+PZPLfcLS+RNtEvnGELLi5j0sS3V4MXamztwBm5A6xii
	pWNmAeoBd7qGEsbdxnkM4HeHzyCMVlUiGoRIkVrUbmT6rEZi6NBzDTLUNAS95L1pIiJ0golamBk
	hKYFQg/WhI7MpzNzbiGngEh8fiFguIHRqaYFcW8PbLVY7K68Mcbalkx1snkuzWS9pu0mrutwclN
	BVSDEbrile0+jTKGStNF7r0GZnX8dbC+YudZHok63yyIWYGSrLAY5y5thpv3oJRan3WWEgW6Tgn
	02D7/B2wGTLMExfHgH1Zus7JAPXvtnIe4fQCOXUtor7p58XhyXMLh0zrv3LHXquqyv6+uL2uEZL
	aZuGAwm+N9ul4ilsGrTtV8DOQxxsXHoVKFrYVDmo9B93572dZL/bkMRwtNZEnEWLsE7BBpqgQMx
	yJSBL9pSEMU3dpf2z59r5ZHE0W7CXTEsi4x8j1ElrHlgt9J3Qh8v0MX/WWhHMK5ZVj9juebtdCb
	DSaLlJjxmPUBaPoXKC0iEA2QC6UICu05fjUSv3l9TKaKuEBIsqy6wsSvaUTiRuukLsfEe4sqrVk
	ZUU9bCegKsQZopW/be14ZAYG07WTnu4J9ijdwRTN08nj7LSHcNed0gdLdppfiPEWo0jgeW7qQG8
	XaTqmpFFXfSXV9tjW0phn7ZF60/2ckjuDFhcyiulTQw6wiV8u9LewDD6E
X-Received: by 2002:a05:600c:5493:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb783813a7mr42606245e9.10.1794903965400;
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm12629125e9.15.2026.11.17.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Message-ID: <88041240268f70b218de7dfd58c41977d03a60d3.camel@amutable.com>
Subject: Re: [PATCH RFC v3 03/44] target: fileio: check that the backing
 file supports ->{read,write}_iter
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
Date: Tue, 17 Nov 2026 09:26:03 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
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
> With fd_async_io=3D1 the fileio backend calls ->read_iter() and
> ->write_iter() of the backing file directly. The synchronous path
> goes
> through vfs_iter_read() and vfs_iter_write() which check for them but
> the aio path doesn't. So a backing file without them calls a NULL
> pointer on its first I/O.
>=20
> Refuse such files when configuring the device. On the synchronous
> path
> every read or write that needed the missing method failed with EINVAL
> anyway.
>=20
> Fixes: 769031c92c8b ("scsi: target: target/file: Add support of
> direct and async I/O")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/target/target_core_file.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/target/target_core_file.c
> b/drivers/target/target_core_file.c
> index ab9824a4852f1..a5391e57e9aa5 100644
> --- a/drivers/target/target_core_file.c
> +++ b/drivers/target/target_core_file.c
> @@ -144,6 +144,14 @@ static int fd_configure_device(struct se_device
> *dev)
> =C2=A0		goto fail;
> =C2=A0	}
> =C2=A0	fd_dev->fd_file =3D file;
> +
> +	if (!file->f_op->read_iter || !file->f_op->write_iter) {
> +		pr_err("FILEIO: %s lacks ->read_iter or -
> >write_iter\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd_dev->fd_dev_name);
> +		ret =3D -EINVAL;
> +		goto fail;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If using a block backend with this struct file, we
> extract
> =C2=A0	 * fd_dev->fd_[block,dev]_size from struct block_device.
