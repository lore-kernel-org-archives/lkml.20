Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752648;
	b=FmJgZQsE2ePM8elks145TLztFj1O1GF6/UUll1qcleXtTRZr8te3fo6HHdVntZbqUz6B
	 zHUg/yvXLp+dPMD6VRdZhUHd7qJ3QLfwOiE0BY0saazykHiO7mmPw6RcXZ+Aak0hWxRBF
	 zJwL6Gg9bgyXzwS9rQcdpsbjlIMr8Uy89KZ5RRBlEr+cW4brS1rXB2HllmhcTru6R792Q
	 QfQ+k3zMOg2gT3QR8XMIMJs7UvTzUWTzULJddcWQ5gXgUxYFEmARhxK3H3vFFQok9pMIK
	 R5tmNoeOp8x6pfL7uIVFppQ99f1NxVZT+/eAhzgc6z4yz/GpfkmpCH2TakJUpz/x6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752648;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=ZI/jWFSUpK9WyTo+E+G27clHiH6WPIOS6hDg2pOWU8E=;
	b=G/SMxj/m2qUaIRmAuoowdKzqhAF3PqVJyNMtqZoW2R0CelMmP5EV40mf9YKxvyMlWN5U
	 lPvSza+5O+HYr1OVLBMuorQoQUOOysHYw/PoEZWqPp1SC3X7lHUhYQF9f+YABbqewTeCD
	 vb+J8wV+0PrpL3L64VvPNevp/7OBuELsbztfsbhak6p452SM/ilDuVZT/8GXpsJeO0D5b
	 hslwyVXrzXAd2ScXEP/tDSM76Zm3U2G1cdKKnc8+hj2G+CGmEPBTZpPBaOL5APLyhHYXR
	 O8sa7TUwlaaPcUGL9wYQbZUo1SOgUFDJmHbBl8N//9F7hfDrD2B8Yf8BIN3ehNpwMSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F9606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-47b7f5b898aso1163294fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752647; x=1795357447;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZI/jWFSUpK9WyTo+E+G27clHiH6WPIOS6hDg2pOWU8E=;
        b=VVI4fo/a44jQQk21rPc++t0/KaRv5bUK2bRmt0QuH4Kmu8Z6aStYZbOGm2MIQKZaMg
         UT2EATcNVkbzth+mwftsMDGJKgKqgCH5snlehvhO3Jf2QA8+dlwqvqqzIcxPKKWbhcPf
         e6ZQt6qJmYd3/AwFLnsL0wpqvbqb4VUFOFdj4CfSZcm6/ic4S7vbs/yy2i/UZCRuaWS8
         QHfyLPxqvP14Hym+uVCewJH9adm7HKl/wEx8p/3YdNsU4Nc8OqWZJejeecbaSwTOUHqs
         5pby9xtae+sgmdP4OGrl3N5n4Y0vLKaqfWOvb4N7pVddi8OE2+Cxy8c3L940+6Tq+IH8
         Gnsg==
X-Forwarded-Encrypted: i=1; AL+hErFl+m0gOVGFgXc4RR2hh6zACgoJMIKE/SFY4fzivynZvRECiU9Q/7Kfozo3pU+ETfNTc69ojDv0yt5nuf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yYy+2hN8h0iWIqKOOGvdOyLC8QI+gxDM0IeoXjTTBrj12XIYR
	YuuBWdDsPcI8OUdMnTQuboDQoQ4JHOWleSpUmkKn6YdnT7B98vq6RIcdi0Tyt5+GD1Ju/eANfU6
	kmaC0Z7P3sdmn3PyRihdlSBCCkELQoXfhsWnbr4yWN0U94PnhqKd5+n8XJ7U=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1383:b0:552:2c0b:905f with SMTP id
 5614622812f47-56e643c967amr7564564b6e.10.1794752646872; Sun, 15 Nov 2026
 06:24:06 -0800 (PST)
Date: Sun, 15 Nov 2026 06:24:06 -0800
In-Reply-To: <20261115142356.21127-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9c086.920b2b3a.148c65.0026.GAE@google.com>
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
