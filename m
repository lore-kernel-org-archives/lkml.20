Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409817;
	b=wVQ/BziA/APi8u9ZC85UXVzhZhIPPrqcX3NxarTtRzKzfOt/cNMvxBNwosU4LEQgL6I8
	 dpLBKhbbTHAVtZi0zHxSkicjK3uN8cB0ccREvY6lqFyNlj0K0TKn68tjrhvUzor1TVO1w
	 Uu7lCn2dWxq6mHzZadFYsykHnn5xHCSoXvalV8zd6nJ5mwHG2yUzcUxdOmG1OnQVNfqho
	 GNpOgMPL/FLsR7FHnU6k8QC53Fm5Gf28+LtwfHrnaKKS3x8xSn+euNzGhDI25TzZThNb3
	 E8bXfBaOl7PlmjHKIJfyO2G/fUlnz7DQYAvO0Yidr9UxUX36R5CkJew+GHPQUkLRiXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6nKy42afFVXtc1pmf+02i77MnNtiH68dE+UHRbcYHP4=;
	b=14uRKGCUItuoRnkvLNzCJTDDD3ARHJU6wM6BcJkwvHzSfmF8ywaXxdA1owxXdkbgY+1C
	 ROrBMqUbWZzfEGGiGEzbWPNRAKoaMAXRCuOn9UMcNZtkDBPnXLE6hivhE+yUaQMyLxIxl
	 W65aaDa9VZXh9MfvTq+n9p02YmxR6uvT3ZJzbInaNWIkyJrc1ch9WWkflk2A0poh9HE/P
	 VMcekRnIgnGLQevQB2WWiFDGlbJKdOhJPgRof6osx3wCHOvrtuWxunIKV1kWlIO27Nm9l
	 DAabPrbV9KV4j9t2vnCRp1rAMxgROMJNWgK4a5mImideUnZ5XYBu8Z4Dr9AHILNP4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d0NblGy2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FC6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d0NblGy2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso2042454eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793409816; x=1794014616; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nKy42afFVXtc1pmf+02i77MnNtiH68dE+UHRbcYHP4=;
        b=d0NblGy2IsRhO34Y7hO7u7yOI+pl2kbpMI3OrB3LQIBKfZ5bePXrUzAms7mvg//bUc
         Vk+FpwQtD5TYY6prFAg6SYanxBQm/YJ2Xoi4pzkmb6UNA/mHfKW+sqWD8RctXoyDhIXm
         RzUawgosSZnougVC1cQvz208uFRNITZ5gcJa5DhCIQXKAfstvOPIhKNdD3IWjZkv6vdl
         DTYdW0otw6PH8+G6v/nFrg3pfYUViNKD9AQIHGKlzXZP9Pa9znosTHDn5jtj74EOhkeI
         auSb0OPy6pCojvDKL3e2VfaMUaG1vSK45UV5mkLRQF6OPvlMjcXHEinDbnYLW5uUI2xV
         JFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409816; x=1794014616;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nKy42afFVXtc1pmf+02i77MnNtiH68dE+UHRbcYHP4=;
        b=XU1HzyuPBU98SZFfEkpnY/T1Tq2gg4BrRG6XlR4C0yAzPg4LS3LsFJbIexhuGASDXX
         zofvwg7L7e+zNrLtc87/amCS4a3EXGp+i01s5kYPvbQ/Fzsr+Ee98bwFqABicVcy52mp
         3tKGNdXdI7PDu5iFHWzRhRz9KHcDAC9TQ4wfIcjzj1lAw04TD/tY53Z4ekjrNYrJzF8q
         DlyqrChag+/CjDMct5iJpMr+MkGXYVKFypSn+hSrVRl8j8nsKycFzhC1qqony+wkhu2K
         sKzCT2ADXfH+hbLXUNmR/+oOxy99Khq996lACb5XMjosMTSmW1fPiEW8P68ixQSxFrzV
         7tjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAYnh7NW1hsv9b8bkI42aU0zedS4RX6CRf0moDkgboNSG0dxg4HqmdE/zuHFiw0qiCLIJQiwywRfVeQ4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsdlifNg3U54eBIYCOU9CYzKvhcLnnA3bVcyV2SSQrGWtKLT0q
	2gyJ+Qhzt+F5qRyuH2qkZ317tT5mofEBPy0QfJoctFoTK1PYMgGWqOnE2EvVaJJ/
X-Gm-Gg: AYBFou12s3AIb2LA7OI1BPlo77Br4u6dg6ZfaBAkH8dqtyHCqj+nIOEBhL6TpoAVLIl
	yvh3myr9h1a7t4hfgaA1se0WMrqgFYJWAQWA+6QweDT1Z27JYme4xfAwoQV/czSCkDNcxrxw6Hc
	/4X2bAVoYZQPiR4DWxUcUUubJY2Phq71akaWslm52Ue79m2/FN2QffVUOvCHFa+9rvIpLlBXsGo
	PbJN04c2ui7NHGu5Apf9C7KVHMpaSNugItgksii0QfStxVtZQBJkAPSNz6XcSiIPVAb4DuEjUH6
	LitxmMeHC51zIF0iCiJ38KXtbbb6PaRcqDSJyy1gdr2ZCAA02Kly86kW4xQ7rFHWGZWiznWUdKL
	05FGaeUN6+uqZU1BzQK4vE0IHoY1ZdWbDd/jpumRAqyY4w8Dyq91FWYroS8CH2q5p3ZGAWvxkIC
	A9HRPsV0P7BIG1gzPpIdi18zXWS/0msUS+bMAUxBcNSMsermSUGAb+XBYcxANiEDfNHNp1FBvjd
	uofXWivvToPqsrWXi7uIHs3bHdMpBKOSm6Dv5/nDqtL6PUeHN3ukDJaGFjL0AxOCf63VfBix4/h
	KUij1j9vpF7oQ8aTsYNu0b4PyK8U95zzLqg0nlnQveFumzuRvCL9THIWwp0cSL0wCyWdoIbXR7m
	IO6qBK+tnWpENZZlz+99hcM4yTbZJ
X-Received: by 2002:a05:693c:835c:20b0:36a:30b:5dc0 with SMTP id 5a478bee46e88-36a423c338dmr5639993eec.24.1793409815876;
        Fri, 30 Oct 2026 18:23:35 -0700 (PDT)
Received: from macbook-pro-de-joas.local ([2804:7f0:b101:c5e8:f804:4efd:32bc:71d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm11924617eec.24.2026.10.30.18.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 18:23:35 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>, slava@dubeyko.com,
 glaubitz@physik.fu-berlin.de, frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+c0ba772a362e70937dfb@syzkaller.appspotmail.com
Subject: Re: [PATCH v7] hfsplus: fix null-ptr-deref by creating hidden dir on
 remount rw
Date: Fri, 30 Oct 2026 22:23:32 -0300
Message-ID: <179340981245.8403.4135841764755575334@gmail.com>
In-Reply-To: <20260717135706.42918-1-kartikey406@gmail.com>
References: <20260717135706.42918-1-kartikey406@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 17 Jul 2026 19:27:06 +0530, Deepanshu Kartikey wrote:
> hfsplus_reconfigure() does not create the hidden directory when
> remounting from read-only to read-write, leaving sbi->hidden_dir
> as NULL.

I independently reproduced the syzbot null-ptr-deref and confirm the
root cause: on a read-only mount of a volume whose on-disk "HFS+ Private
Data" directory is absent, sbi->hidden_dir stays NULL (it is created
only in hfsplus_fill_super() under !sb_rdonly). After a remount,rw,
hfsplus_unlink() -> hfsplus_cat_write_inode(sbi->hidden_dir) dereferences
the NULL inode (inode->i_sb) during rename -- the reported crash in the
[0x28-0x2f] range.

I applied v7 on c339f4010 and tested on arm64 with KASAN, using the
crafted image from the syzbot reproducer and the equivalent sequence
(mount -o ro -> mount -o remount,rw -> rename): without the patch this
oopses in hfsplus_cat_write_inode; with v7 the remount,rw creates the
hidden directory, the rename succeeds, and the KASAN splat is gone. A
normal read-write mount + rename is unaffected.

Tested-by: Joas Antonio dos Santos <joasantonio108@gmail.com>

Thanks,
Joas
