Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851649;
	b=GYPbysHRKTUZBIy+tO04tC9U4M0rkd6Ql0qncXnNmfls8BR6YUJPW2/mwDA0hdp35keD
	 3cwt9gnb47rbSqV7OO5ary9vQqxY5cXKZFiYpooTSJTSSVnOVBaet/Vb8KRiGNqPuFdsz
	 L6412wxEasCy4oOSrhsRp7e03If2+M//lquF5ay42uF1/sAvKq1VMrVzZOC9x+DKW3A9L
	 nILAIg3mg6LQioBuFbXgzPkaRfm+nbMfE5G3Kgl9zk1GC52iKK4QpgZqETv5ErXgzUaCm
	 +QE1u475rthQviUWDI3t8hE1zkEycuV+G+3u4p+GVOh/c19dXscdITTxEI+Q9dP3xrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851649;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=u/WDt4ovHgV1XKKVK2ChwQHHRdL8kTKBELJvnvQN584=;
	b=z1vpOJ5tMnOILECEs5F6C0GyN3B6H9DWtxjZH3Xlt2NG3LxvPs9ylTw7f1/vnwOTmKn/
	 GL4K96XihHVAi4SDTLyJ61LAYv1uQuLonnt1uIwrVupoA/zcDxmrfxq84LIGJG8g2HGMH
	 EDJ8hg/Ey2UYrWFoQ1GAMKNICqcg/JUTbd46ANAI/o2eG9KoQhG6e7ePNzPqYJ47T//HH
	 jQXTF/hKsEWOS+okIJkkyUM0giUEjZjfeMOsbDnHa5cvawnZtL2k6zGg27Y6bMw2U1KuT
	 lpriugDQWB8CiBwTNegRP1p+beJ3aMj0+YcpCLKNdJPPmzK6RI7KR5JlEOE7MHGx/qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF28606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF28606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c734afb8deso4346167b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851646; x=1795456446;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u/WDt4ovHgV1XKKVK2ChwQHHRdL8kTKBELJvnvQN584=;
        b=VrUf63EQ5Xq474LyVNl7uYR1rW2IG4u//H1Cf5ySkRT0Lm8lwMDaZtpXkLRoTCEcIh
         dzgrpeiHdG3IlBufwLHWJXgnlhZPgHVby4AMLYZvsEXlLeSrTf2qxdLNTpYD6hu+4bGa
         1FsVYo18zSr5BslRm4NgLXmSCZ20ocpI64kjOrDLfaIrGqt5dgHvy0aUmE7F5FuHoiKb
         l7TFtoEt9HPMsyTVuELHUZxLZa51l30OCcyr3ON2O7q6xTE8RXctpAVMl1Wkr40tKEo+
         BUwv3gDYLRpu10Vn0VkW8o7fUdXLKcLFYaDuyuX3/o8zAh/DElfsxUShJUsaSN82B3w9
         erVA==
X-Forwarded-Encrypted: i=1; AL+hErEHHcl6ipDonks1oPyrJsYnq0cg8KqMlcqQAMSXAn/S2mTinG/Cs/QuEe/IjF/iAAlXnhjmFH5foANV8/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aleCXEr9fJPMPiTJ/0ZIF65fXACKqW2lscjJpAsl5+wps7Rku
	OFm5Gl9MJZoz7b7SgBLjXeU8OItbBf6YaEyOzhciuch/3cCOlh77t30cJ55LTwZVrFwXwRV8iB7
	tP4bCK6JJuDeWvcSvdqXCh5WykURC+QQLcBMnISC/GeekGBYBBVH+kTti4m4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:2793:10b0:571:846e:6f08 with SMTP id
 5614622812f47-571847e2a59mr5136812b6e.5.1794851646470; Mon, 16 Nov 2026
 09:54:06 -0800 (PST)
Date: Mon, 16 Nov 2026 09:54:06 -0800
In-Reply-To: <20261116175346.44221-1-founder@logarcheon.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afb433e.f3cfa7c9.844a4.0000.GAE@google.com>
Subject: Re: [PATCH] gfs2: Fix NULL pointer dereference in gfs2_seek_data/gfs2_seek_hole
From: syzbot <syzbot+5a5f492ccae698fd7434@syzkaller.appspotmail.com>
To: founder@logarcheon.com
Cc: founder@logarcheon.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> When the filesystem has been withdrawn, gfs2_glock_nq() returns -EIO
> without queuing the holder, and gfs2_glock_nq_init() then calls
> gfs2_holder_uninit(), which sets gh.gh_gl to NULL.
>
> gfs2_seek_data() and gfs2_seek_hole() call gfs2_glock_dq_uninit()
> unconditionally, so in that case gfs2_glock_dq() dereferences a NULL
> glock when it takes gl->gl_lockref.lock, causing a general protection
> fault.
>
> Only release the holder when it was successfully acquired, matching the
> pattern already used elsewhere in this file (such as gfs2_fiemap() and
> gfs2_getattr()).
>
> Reported-by: syzbot+5a5f492ccae698fd7434@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5a5f492ccae698fd7434
> Signed-off-by: William Chuang <founder@logarcheon.com>
> ---
>  fs/gfs2/inode.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 75fb1a0..4110b2d 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2255,7 +2255,8 @@ loff_t gfs2_seek_data(struct file *file, loff_t offset)
>  	ret = gfs2_glock_nq_init(gl, LM_ST_SHARED, 0, &gh);
>  	if (!ret)
>  		ret = iomap_seek_data(inode, offset, gfs2_iomap_next);
> -	gfs2_glock_dq_uninit(&gh);
> +	if (gfs2_holder_initialized(&gh))
> +		gfs2_glock_dq_uninit(&gh);
>  	inode_unlock_shared(inode);
>  
>  	if (ret < 0)
> @@ -2274,7 +2275,8 @@ loff_t gfs2_seek_hole(struct file *file, loff_t offset)
>  	ret = gfs2_glock_nq_init(gl, LM_ST_SHARED, 0, &gh);
>  	if (!ret)
>  		ret = iomap_seek_hole(inode, offset, gfs2_iomap_next);
> -	gfs2_glock_dq_uninit(&gh);
> +	if (gfs2_holder_initialized(&gh))
> +		gfs2_glock_dq_uninit(&gh);
>  	inode_unlock_shared(inode);
>  
>  	if (ret < 0)
> -- 
> 2.43.0
>
>
