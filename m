Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145855;
	b=TAbY+La7jLLFR3hp8AjkKW6zeHcccLtuAa65ccZ1SIaNr8C+BNlMVGQX1ZiB5a0/eIQQ
	 gLwKp+TRizSLV0K3avCaC3UOaSD0J7uxYa1+Tp/AqdEEaxQoLhVT3oQGYFnv0Pf9doLrr
	 bOL/1EKamWUWuhhwsrF0LyDxb3Cz+HFVsX7mDeoyDjcg5eeP7Y7AzMfTsMOJ5WtGnR6n3
	 V8fxITVSsK/nE6ag5lPMtHILcUDNHov2YZuVcs60vCUWLuGH0reN2nhAfwKS85sgrf24Q
	 ccMfwDkYjYT6CxKL4GQMhSp6VaIKeUFhu2f9b60NioL7+gWwlFMxyZnRE6/VW/OtlBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145855;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=pJ9WMFIz5jkQTNafoPRPatjXOyfzJZ2QK38+7g+yNi8=;
	b=23gS6FRqmdRwGOmsn4JpYmGwPxFzoOZLVM6Hd3ECXTiX9C3hCH5hPRSyPlijVROQn6Qv
	 BW+9UWFQtJM/MWnEYErXg4zLSNQ0/8tamKyYJ9qwQY6uD7ZPegyRQKGp8PDA2NNupcrLf
	 8A6pJ6BhG2W8NpINWOKH2gSWtTb4Y5FrpvREPmFJEIQnCxPXPFprgaIiQR/Zr+MhPq4Nx
	 XAZocOsVgmh8JgCZG4BZkzDBEXadzxPcqtXMpL+h1D6rA5dzySa2u6Z2Yrx6hIYKc3Yy0
	 0DePMc/mh7PMmMNKdKcD6CHJTXGqzY9Gdie/XKWIcQyLS0S9YoILfB4m1DL97Bkppqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB599606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB599606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ad5e0ddc90so105874fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145854; x=1794750654;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJ9WMFIz5jkQTNafoPRPatjXOyfzJZ2QK38+7g+yNi8=;
        b=WQ2bafnA2cCWrFtH2Z+cHQPmb+jBTP+drvjNACG2r7wE5POykrVnQhB4o2SkTdhrcf
         +BDOW1boAo/eV9SatKHJ9Iw3Cd4P7AUbm+xza0xTMQ0Kbo2mZJ9E+Q3VOBKdMKf58lKP
         uMXGWgQH7prSCL3Nq3gon8hDHkYnHNrKh0hykfV8DDNDUxstoCwPN8ntkaeFo+57+6bL
         BXWVWB4LKEdwN6cdQGFVQQiOkL0M0pVlKU57uPZDYgKvKbr1F5a0U28s+++o5YLXU8Ip
         VYJmN2XRsdzIb0lKZP+PjctamCOehglYZU0dQv28IMUf8pL9OJ1GI/jjM6Agp1CyN00c
         Wdyw==
X-Forwarded-Encrypted: i=1; AL+hErE/GDGTWgwL0TDdRq7WNkNs0eN2faQQKcrVdyf0To36JBdg2ynP0MIsZD1sGXihUlS3TmJ/YaVKkmzAUFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uS3ETrZHCcjQXQdStK0YtqDOJ+rr1n7cFUH5Qwc250siRAMH4
	mZ2LjChge04BfLm0zlAlogoVumQ3IyKCe4NIAURHcEn4/BCcsrQ89uN59fts7TX93bko1lxhIel
	oLYQgHnjOIVYVf6q4tUi+c/32Dud++IxEs0K2woimFpxIylMD95q02gskDQA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1907:b0:4d6:90d3:e18e with SMTP id
 5614622812f47-56814613dc0mr872506b6e.45.1794145853969; Sun, 08 Nov 2026
 05:50:53 -0800 (PST)
Date: Sun, 08 Nov 2026 05:50:53 -0800
In-Reply-To: <20261108135049.991-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af07e3d.5a668245.1aceb6.000c.GAE@google.com>
Subject: Re: [PATCH] Fix warning empty list in svc_destroy
From: syzbot <syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com
Cc: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>
> diff --git a/fs/nfs/callback.c b/fs/nfs/callback.c
> index bc282b744f34..ebcca3dd1269 100644
> --- a/fs/nfs/callback.c
> +++ b/fs/nfs/callback.c
> @@ -60,8 +60,15 @@ static int nfs4_callback_up_net(struct svc_serv *serv, struct net *net)
>  		nn->nfs_callback_tcpport6 = ret;
>  		dprintk("NFS: Callback listener port = %u (af %u, net %x)\n",
>  			nn->nfs_callback_tcpport6, PF_INET6, net->ns.inum);
> -	} else if (ret != -EAFNOSUPPORT)
> +	} else if (ret != -EAFNOSUPPORT) {
> +		struct svc_xprt *xprt = svc_find_xprt(serv, "tcp", net, PF_INET,
> +			     nn->nfs_callback_tcpport);
> +		if (xprt) {
> +			svc_xprt_close(xprt);
> +			svc_xprt_put(xprt);
> +		}
>  		goto out_err;
> +	}
>  	return 0;
>  
>  out_err:
> -- 
> 2.47.3
>
