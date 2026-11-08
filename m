Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145322;
	b=bWdlzB53QlLaMRkkzTIu1RApJWHo0fV4JD6IBx0bDToIZsEqg8/QdIti9102ABwB1Rad
	 4P73vAeAWx11QUYOVN3zsWc8Ef8cJM5ep9+ihskft0aDKJ7zL8WKZzpCGkw8uc/bJoHaU
	 rra2kKZaj8mUL2l5Ov6GElUBMljktlM1l4SeeIJ073QEzE/EEpUY4sdqj38653dxmuf8U
	 uCIlciH9FgEyh1dPCSQUXEpCSm4O3itg7qr9ttTT5Gaih8OcNC2CGOiRXNNcOZigV4jzw
	 xBxXkkkTQ15cR3EkkglKkf7eg0EsC8tAhhjHSQwj6C90yj6cAp5JN64FBMFxgAAp/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145322;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=+Sf/dbKnNotRcB/HKFEzImZxE/j4OhJ30lJ32BNW8Xk=;
	b=XOUIna6IV1aSm5v5GMc+iQstlpdimm2m5wkiO5rz2pJgaZZYq15lsKQYJTC8bPUxEyxH
	 hVBu9oQom6oE7EPu/Mc8tqk4w8T/fzZiEiMmvxe2Xc8E7MR0jEumFfCz0NCsW2nYD07u0
	 BRsDZ6PpBSqApHJa2NEyon/K3u1QxvpAZ/qWYvxGcv2J7LzSt02N1qc+o9UL+jdh3OAsA
	 12Jr7OR0IgW82Fe0E9RWq16m3CfWzE795xmME7ZmNeL3OB1LBj6a18HpB+yQlk8cueMEa
	 DIq/6azWpHlIPi1FyLa6RnhNsx7Sqnkwd4tN+vtKWlg1Nhsj4IwiuUKVS66s6Y1zs4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF80606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF80606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f2040e10d8so58359b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145320; x=1794750120;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Sf/dbKnNotRcB/HKFEzImZxE/j4OhJ30lJ32BNW8Xk=;
        b=br98Ywq5YevN516gwVp9jZavdPpPUKcwM/CXZ43vbw5Jbilx1AMZ2ZFkJUHL7Fn/uK
         PQhwJB/aODFXqatrGwaJFCqiqhM9n0wKPyBGiQmKIN6yopjXdwTavtS0iQDBZtmx+GEi
         c88J8/eNLQiw4yceybK1ICQt+pb6M1cejI/KuWzeF9f0dEVQB7zjLyVNIPnNjP/1AiNt
         ATjnMcNXXjpWqUa0GsrUD0rJ7UUreRVlVmktdK2BF/rf1ekmAFkzERT6h3zc8WfWyUH3
         d53yfY98GU6SfsIdMqBNlWBBvRncMBOQKbg8dVhbRGXLIH8nCIJXj+T5eiQt0pFcssqf
         3ISg==
X-Forwarded-Encrypted: i=1; AL+hErHA2Kb4zfo7KYVJHXsS18sLs39dizzGhQpkVoNwtaF1eWImyGog2a5YKBIwaC57nsViLgasCg4kJvIydn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N0Q8YmRP+fURKkvhx5FjyNE2QQA1GaEuBCVGa+RuwH58odrDX
	+g6iYcvyUj3EH/zORr8hblatH+SXzL7PGEa29KgwOsTRFBWoyF+6AZP2b72h8OKZKeWPFJegZqA
	siY6RWS3dC1ZbPONoW6MNfNO5VKII5lRdhjBH0HP5V4hVSkmm1DCuNRVeEyo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4e:b0:4f5:41f:fdba with SMTP id
 5614622812f47-56814645d74mr1034990b6e.20.1794145320701; Sun, 08 Nov 2026
 05:42:00 -0800 (PST)
Date: Sun, 08 Nov 2026 05:42:00 -0800
In-Reply-To: <20261108134155.717-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af07c28.5a668245.1aceb6.000b.GAE@google.com>
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
> index bc282b744f34..74247ed66933 100644
> --- a/fs/nfs/callback.c
> +++ b/fs/nfs/callback.c
> @@ -61,6 +61,12 @@ static int nfs4_callback_up_net(struct svc_serv *serv, struct net *net)
>  		dprintk("NFS: Callback listener port = %u (af %u, net %x)\n",
>  			nn->nfs_callback_tcpport6, PF_INET6, net->ns.inum);
>  	} else if (ret != -EAFNOSUPPORT)
> +		struct svc_xprt *xprt = svc_find_xprt(serv, "tcp", net, PF_INET,
> +			     nn->nfs_callback_tcpport);
> +		if (xprt) {
> +			svc_xprt_close(xprt);
> +			svc_xprt_put(xprt);
> +		}
>  		goto out_err;
>  	return 0;
>  
> -- 
> 2.47.3
>
