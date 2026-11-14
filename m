Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794698411;
	b=WccXSlzv4jWzWqSZoc6yog7E4GAHOq3iRKccVR0RpLTmJjM4T06hxcIeR0XdDYcbUzGE
	 yyzZj/sRXfrrlEBCXvEBJ15j5QeVOLpp3HsDBJx1dGwK4V8t7TDrJE4K15tzfnfYeHfwU
	 GdYjTFAsovvDzJgflKZmN1XmqxfAeJ/RFQZYsVhjm4XU10/23wT5GiLTAre3Cbu6dasmy
	 nZo7LN3oX3xyh6YXvuzy06t9tU68rbOicctEgVHwnLQliDm+VdXpkDeBzZwdc3mJLAO3N
	 SoMorLAoSHBUA+G36XXb3VthaV7V/nMaIPooCCHSJ28mt61MSo0Ze/Q/kv0OWvp3h2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
	b=DN8/TXVUjfVsmCI9nMBf2vwvf02CtUcBCJDk+SHBSV37Y/MuonJ+fuPrqOgnI/wesykG
	 VfvWN4Nw8YVJJAtP0CwwEw2AKZ7qI//2cC1tIfshhh7FRBhkD0wy93QU+Qypueh4uXmlR
	 jwWXRk8f1M3pTIX3yln1UYlggrPhGd9+nlgL3KcuH2Yrkfo5D/sI+K42Um5ex3ZkvUkJb
	 qkO3eWBvvln3qBlEi8FTBF+ble3bYCXDAB2r8RXGU9y7f23e6XQYzV5qR6CXROWfwm04l
	 CKovLLMT2wWEPpjHhpuVKAm4xWuBYG3oMnkcsdQl8Z2lrl4rAiUlN5tvnNjPUgKamiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032DC606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032DC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so5593824a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794698409; cv=none;
        d=google.com; s=arc-20260327;
        b=iLZwo4mCOC3q+M6saZS1FiLQxY2rHVU10kUByu/KBuzg/cBz5muYIjtRgJYYLjuwo0
         x7L6GiVMmBNSChaQ5r/RNl+A4flGsvtR2NzmzmMd3Fvwk7zwqan+LRFyzd4Wo7h395Sh
         AuRO2MgvvaA/1SNnWC/26dn4nkFHyMkBdjceKJ4ChrVTWqdE97SfWILzwDij+05WoeNa
         JFyCBXyMXKkL7d+qnjr/OjLHx+TH3+SpFX3rBSUPjZS+/ROwHgidDB+OYR+F9vgxpLrW
         +SYjAiRghXmviEhVyvjlLVna9rNfRVvsolo7KcQ8AepEEX0DBWlobMQ8/9Hsc2THcNao
         dc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        fh=RkCjck4tVyyIsD8pMiPTvJfvTaGygLY0M/Ke8iCAF5w=;
        b=DiuPS9yHwQFQyZLI3pWRRnidDaIf6F38mlwWj+Y3krdL8okPS3AoFYZCZU0IrP+Wac
         NeCUznP8U+udc1k9qTvnsrhDM5zKbVgsckpK+j6H9rGyl0MmQdJyXrXrKO6ai7qoahwO
         TpfdDaEo183Qvs8BM6CJu63WJt5ugPm7Hze+d/iODFTO78z704qi5qVwNGARzlREZzFg
         2Sy94Qg8ncm1QYqjVc4tUjm2U+eWjI4Dz0SU0SHJOSFBm8IdVGweUH7mALbVZisXRk8L
         yg1FbeTGWnFqduwvES5LED4RRQM2jaE5ozIS+CyYZAS03+qpI2kCEDe9f6xZU/r91vvh
         HKcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794698409; x=1795303209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=bZ4A5V+6Vs4HKIPLNbCXlaoHg6GUiZAgPE1CoHup/u8F9XnmCFMSb6naMqQFAl++mw
         +LZR0jt78s/FhrwMU+95xN0Ho10rZ/g9p6M/dfGpr9SfvlaOXM2WfiTCtO0CejnyefhK
         5gg17lDjyCI6S+pTTK/DIWzHtcTY1JHkLI4t/I/Teu6/Lgz9A0oKfkx231Ay53Fdu4Kp
         zCo0ecwmPzO3ZOIddRCFMjOjLH94BU3oXsC8cOhJgJSeLFwZkZlFyxo1cq6JVw7hHb6A
         21NW8PziNlBat7d4DfM9UgO0YIScpglsDnmQoGQNIOQhlOx3hw76q6t8+8jTPfBn24eS
         FVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794698409; x=1795303209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=zZG+tYz/6W/oYCg9LjBKeOol5EzOcDsXhTtknGlqfKgw3uVo8eDYoy0eiOg6XaWFtq
         voEmYFZW4jelUk4JBvqf3bUt3WZ6VIE6tVo0t8lDQThiCuB7/1Ziu58iR1Utsz9+InX1
         1xmzc49u54GDNjilblWe5pTdnGrNSmUiWbPGp0LHhtv4W6oNYls9BZeT39eql5y+HyZL
         hKyR0imJQ0Jj62r2w1qgRAYpb1Q+/PR9ofRfP949KRdnKjPZ3nzr/lFAyo2WeTYZvNqZ
         jIBtIcPLT5rHTpeUZZok1mitVzvsgMLmc3GfD4ISE5vShl+8CWpti3JGV/NgAejukpEL
         jsjg==
X-Forwarded-Encrypted: i=1; AL+hErFZIVnkPiPPspxgAvhE8RFcCywi5jBa4TBuzDZrpMLvb0lTSm5PtwWW3epv1YCFOS5BZa1DPzyBba/Z52M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cZtv/NUNyqlHUm0oKtIOYKTwao2rS9tO+bSQppIUmO3/vBNZP
	AU+quhpstI1fp7OmI1/Sf65vLz+PsJ13/kgQDXFQej9sImNYBCpXaOMR15yRxD3qag6+NtmwiSm
	bW7ym6DzJg9q+IKczk5jiyIs2EVs3bcA=
X-Gm-Gg: AYBFou1Yd21Pd3U+PHGZvs9bFO8i2gmumIAJzbcfuYQ266dhFNhBgkQPdi32shOZfY/
	2N+l8+yy2KtdUFOGlWpND/3GHVHJvJhffg1qDSZxREBpgY4wjVZRkAnuJcVh0e9MBQxQWQN3K78
	LFQmQYC65a1tUxDDkRaGsrveqoXrrR0f/UsieMOHj2reMe+mnHvyfDYonFrzA/YSPL2IWsAIxYU
	lGkjvpBLzlPAjwiVLer3k7pTVX8sOQnjU16T66BNunE6l+VknsxNAVxZcXuoAStWqbF1aZmaQ5d
	fY2pIYSVhr4OEGLwOkhKJbuQmBXSyTFC5CKYm2fIGlAMQlqN7DfKSbdyxQUtJ0zTbCak173BNBM
	u4jiJq2RXaPkI9lmMvNTvZoAVROCvpMkENP3PkF3FLwMT+wdpauc99F4KK8KWRhY3E73flg==
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr1542816a12.1.1794698409123; Sat, 14 Nov 2026
 15:20:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org> <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
In-Reply-To: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 00:19:57 +0100
X-Gm-Features: AclHuK_YVxhIpv6JLzeNAX5mX5IHGfu05WS6uQ-TCKewxE3JKeci2PyA-UDMCbo
Message-ID: <CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
To: Chris Down <chris@chrisdown.name>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 9:06=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> Hi Christian,
>
> Christian Brauner writes:
> >+      /* Look through stacking filesystems at the inode with the data. =
*/
> >+      if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEU=
DO)
> >+              return -EINVAL;
>
> This looks good in general, but what the bots said about O_PATH files
> here is real. With FMODE_PATH this is reached for a file that was never
> opened, so on overlayfs nothing has been through ovl_open() to look up
> the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
> itself, and when that fails it hits the WARN(1) at its end and returns
> the overlayfs dentry, so the check passes as well.
>
> Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
> it's easy to trigger with that. From a quick test with a metacopy file
> whose redirect into a data-only layer points at nothing, registering an
> O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives
>
>      ovl_d_real(/f, 0): real dentry not found
>      WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
>      [...]
>       file_check_backing+0x308/0x5e0
>       fuse_backing_new+0x219/0x4a0
>       fuse_backing_open+0xe8/0x390
>       fuse_dev_ioctl+0x53a/0x7d0
>
> and the ioctl still succeeds. A normal open of that file fails with
> ENOENT, so nothing could have used it as a backing file anyway, but with
> panic_on_warn this is now a panic.
>
> Maybe ovl_d_real() should just stop warning when the lookup fails, now
> that it has a caller that isn't trace_uprobe?

Yeh I guess that this needs to be a Fixes for lazy data lookup.

The correct fix would be to teach all the callers to deal with an error.

> The check would still pass
> for an O_PATH file whose lowerdata couldn't be looked up at that point,
> though.

One observation relevant to this patch set is that a datadir layer has no
business being a pseudo fs and that can and should be blocked explicitly
at overlayfs mount time.

The other observation is that fuse_passthrough_open() should probably
check the backing_file that was opened for io in addition to checking
in fuse_backing_open(), which could have different FMODE and specifically
could be FMODE_PATH.

Thanks,
Amir.
