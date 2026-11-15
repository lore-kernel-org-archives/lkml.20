Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752383;
	b=UoR0bVvB150LQS3GVZFyC/5zfMJi8gqkwXfm3HtLIqgjUr6LD0Z4PPPrREvHVo9IcIc9
	 owBgZAeEuMoT4cuXkEtcdI7leg4swjD6SUqaoXhAT3rXMMqPbVX4nmpclh30yviVGRejz
	 SFXw5CN3jXERptbBjPEVLfka1KSrp0LQCbMq98LkIbzU9FWzXgeg3Bik10hsv+H+XpxA1
	 QDYizp0BFYjFAkEgLFkpzipGGucGoyP2UsS9mJCL4stgTkToBINS+KQC9K9pgA2ppm7yH
	 1l0Zdwc/XHGb4oSGKLjs0pyHKhd33xQh2bJ7lTQPIX+yEnAJbHvCDpMIsCp0IIDR5Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=ZI/jWFSUpK9WyTo+E+G27clHiH6WPIOS6hDg2pOWU8E=;
	b=g6MVOKRM9WOg4dGDVKG5RqueRzoTl0iYBADaeT34D8uBqVZuXnf6GgKXg9e1lY5Zp7ri
	 iguAHyYpkzB8N/vIyqKW90mXfqjakYq06nYEKMHGp9iw9tBzU+UnSGpT5tIqLNmo6KDnA
	 5KmGg+tLxYIDsPBaOW4HvU10HCRE1ZXnAKuD32/n+N4e8IDfsayHr2QlpOuAcDBR7rMel
	 xE50ngL16kkrZulT+hOdrzLDLo+xEoGWBeQ1uwqWjknE6UUnpJb0QhfjFjT0aCawxunuN
	 nMOJKyMMEepdx/psBONYl7Ps334mAQnwys7CTn3etZ548Gfei5mLlEO8Cf9UZAzN91g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6695606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6695606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5735cd94235so357794b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752381; x=1795357181;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZI/jWFSUpK9WyTo+E+G27clHiH6WPIOS6hDg2pOWU8E=;
        b=ex6aely35wZJ0vUKrqt746s3/4TfFit+uYg8HZANG823K59NF4tSrZARdP/JV+qItU
         HChozE0Vpq+4QZGqscBk+vQy2oIPXYLmr6wl26Sv978RzMtFQMzBdo4dzMrT7MvSnqyc
         9m38UvcjbgRYDLMJzfuUpxJF3BtolFi/HBUDcSmr/994BUlIAY3gJvNqmoHmPGM3RuSA
         mHbhh0KAZXxzORPhePTkhfN3dEOULHMd3aMS8izjUZZ2997T6TT2N3gW/lbQlGMECJHS
         uAyq6eUIZ+qdSCTTutItXfOoqILbbbAbiRAZUZjYkZ9AlVC2Qn2Fs//nIA6PW3G6l8tB
         797w==
X-Forwarded-Encrypted: i=1; AL+hErHiO4mDTTFFtF5hfeiMCl96NRpBTOAINZVvPzDKeM2KiXSA67vzsA71pG3G48BzT1N8fKUU54FnLFVkbw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KHN0bDIFRdCNsVZDBTx/l4MxNcq+qF8FH5PNCKbFH+nqOqKqh
	QDFYtJu1loZa57E6/NQt/WozNzlh0js6q0IpSrj50EA6IEyAtc7Q43yXwyDYKyliY5MqZ63PkM6
	ueEJRfRljUDNMWQ/fmhwxJDjIcwtO0iFAdeAsaVVWsYsLMkZr/efgmNuHt6M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3503:b0:4f5:6fff:3ac4 with SMTP id
 5614622812f47-56e64be801emr6723080b6e.41.1794752381740; Sun, 15 Nov 2026
 06:19:41 -0800 (PST)
Date: Sun, 15 Nov 2026 06:19:41 -0800
In-Reply-To: <20261115141930.20935-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9bf7d.84fe3b82.798c4.0002.GAE@google.com>
Subject: Re: [PATCH v2] RDMA/uverbs: Free all radix tree nodes in uverbs_destroy_api()
From: syzbot <syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com>
To: kartikey406@gmail.com
Cc: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
>
> syzbot reported a memory leak of radix_tree_node objects allocated
> while registering a siw device:
>
>   radix_tree_node_alloc+0x81/0x1a0 lib/radix-tree.c:276
>   radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
>   uapi_add_elm+0x61/0x140 uverbs_uapi.c:41
>   uverbs_alloc_api+0x85/0xc50 uverbs_uapi.c:659
>   siw_newlink+0x36a/0x3f0 siw_main.c:433
>
> radix_tree_insert() can fail with -ENOMEM after it has already linked
> intermediate nodes into the tree, leaving them with no entries.
> uverbs_destroy_api() only removes populated slots through
> uapi_remove_range(), and radix tree nodes are freed only as a side
> effect of deleting an entry, so these empty nodes are leaked when the
> uapi is destroyed.
>
> Call xa_destroy() after removing the entries so that all remaining
> nodes are freed.
>
> Reported-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
> Fixes: 9ed3e5f44772 ("IB/uverbs: Build the specs into a radix tree at runtime")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> Changes in v2:
> - Drop the dummy insert/delete workaround in uapi_add_elm()
> - Call xa_destroy() in uverbs_destroy_api() to free all remaining
>   nodes, as suggested by Jason
> ---
>  drivers/infiniband/core/uverbs_uapi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
> index b67db3790f03..77a4eb494936 100644
> --- a/drivers/infiniband/core/uverbs_uapi.c
> +++ b/drivers/infiniband/core/uverbs_uapi.c
> @@ -621,6 +621,7 @@ void uverbs_destroy_api(struct uverbs_api *uapi)
>  		return;
>  
>  	uapi_remove_range(uapi, 0, U32_MAX);
> +	xa_destroy(&uapi->radix);
>  	kfree(uapi->write_methods);
>  	kfree(uapi);
>  }
> -- 
> 2.43.0
>
