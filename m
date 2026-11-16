Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807880;
	b=uO+VtkDp4Wv6QX1XC5riqCFtbXQML4Tq757Znot16PPfmopD8x6hJyiT0deZ6pnDLHIJ
	 czZoLVatwxOUJTtEL06aOJ/qrUtN6RZfzT8T/iUjU4+mRWR5AoqvZjHhskJNDn/YUzlOw
	 jfdQeV5OP5tVdBgO9R961fw0wWOq5TMcX7b5ElV6l7Yxkx52Ev+qKrfzFSdDJsPJ9YgjR
	 X+qJRoFtBboBQCmdCxFCQ4KyG8Ib4Kv2pOt7LulVBTNZDto2LGZw7j3RQEGPsVZChYNvl
	 OlvWLIPjWiAJN+WeLbCWVan1aiLrq9Rn7JARHWaROucuQS2NWu3L7T6lBeOSbf7OTPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807880;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=YH442YWUNRpnQkaRImDBTqOX7zg5nlBfCdBGvA+8K7Y=;
	b=fS2RefRwcP7riy11FeX3E9id/gRNP1kQMIcn/hceD2eEUtSUWklEoXyJzwjfW0e2xjPW
	 wdzmOFmkd8OgIXkQYvnnghBbEnlA6vNmVxgmODuGJH6z+4fwKxwPZKiitQNXvb7foiRhK
	 CWJucpUqaz8bKNGuGzKaji55A/F9HFlRAnH3w8ixqbJnvXt2RcqdSpLZyziRiSlUOPxus
	 voEHfrVY2AtZdS52brA1XaAvddnSUte2B/bqrWy62Iqvbk+wY1zxSOf3lZSRHXr+uQCk1
	 HkLl1CViR1YAY22BjZwU7umipjdBzTpfOJV+PusteKb//y7oKnM+LPz89rldi5sKddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0AA606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0AA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-57289376805so1327195b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807879; x=1795412679;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YH442YWUNRpnQkaRImDBTqOX7zg5nlBfCdBGvA+8K7Y=;
        b=vNutgnEMIs9/pI+K20Of8pLsmZS6P+GdJTJH0lY95EXlyu6tp/+8pShXFZ486fD7nw
         wAhI/rIHdch3zcJb/h73hvIw8hakikmxhad8P4D1AhKGnVM/LdkK3XEZoaGNcRbBJ48c
         wIkwkED/WJBKHDuFljmLx8XfLS0GiviAmDLWNcghPWf9CUM5lZVhfEFvFUS0WNDjHAkG
         DIE5vLwcpkCGSATqNgtfrCiSYmPcjvmPTag5XubiLNDPWo+fMC4q8XbseAZ9RuTxVFTm
         x7ZVV0pM6R71Cx1nVHK/UREgPkY4gPIYsBm9dtemfQPudwVPLvBrdRmcFC/1NkEOLnly
         OvsA==
X-Forwarded-Encrypted: i=1; AL+hErER099dD/2W8xSjgkBks5N7EOtih94TUeJOQOxAfrP/UjngDJLkWQtCIvi3STF86sCPFvcuOD5wUDvl5YA=@vger.kernel.org
X-Gm-Message-State: APuU4Z93LmoX7qT1XWFPY735i3sQ9Pr/H6tKBHTY8QyOb0UFi/oJbW0s
	RBrof8t+LG7f7NT566Tou+B5mYVsIUPxGArKAeNin4310QdCY5QSA6M++ebgmpMdruD1slDZXDA
	cKqVuZYlCGff/11Ey/E3wMKbKw40Uh+fHvYt3Aaw+cdPYP0Zf0Ta/DgihuRg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:211:10b0:571:7f0f:924a with SMTP id
 5614622812f47-5717f10b319mr4111005b6e.35.1794807879376; Sun, 15 Nov 2026
 21:44:39 -0800 (PST)
Date: Sun, 15 Nov 2026 21:44:39 -0800
In-Reply-To: <20261116054424.62067-1-diasyzhang@tencent.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afa9847.b64ae673.1498f1.0dc5.GAE@google.com>
Subject: Re: [PATCH] ext4: attach jinode before inline data conversion in setattr
From: syzbot <syzbot+9c29b92a3b6500bb347d@syzkaller.appspotmail.com>
To: diasyzhangqing@gmail.com
Cc: adilger.kernel@dilger.ca, ahmadpsn95@gmail.com, diasyzhang@tencent.com, 
	diasyzhangqing@gmail.com, jack@suse.cz, kartikey406@gmail.com, 
	libaokun@linux.alibaba.com, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	stable@vger.kernel.org, tytso@mit.edu, yi.zhang@huawei.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> Commit ed9356a30e59 ("ext4: convert inline data to extents when
> truncate exceeds inline size") added inline data conversion to
> ext4_setattr(). Pathname-based truncate bypasses ext4_file_open(),
> so the inode may lack a jinode. In ordered mode, the conversion
> can pass this NULL jinode to jbd2_journal_file_inode(), causing a
> NULL pointer dereference.
>
> Attach the jinode before ext4_convert_inline_data() and propagate
> attachment errors. The attachment in ext4_truncate_up() occurs
> after the conversion and is too late.
>
> Fixes: ed9356a30e59 ("ext4: convert inline data to extents when truncate exceeds inline size")
> Reported-by: Ahmed Khan <ahmadpsn95@gmail.com>
> Link: https://lore.kernel.org/r/CAOaS1==g3mdoqmS2AjOC0_-woXJbA_X0LJQt7+M7d1=+gfyQqw@mail.gmail.com
> Reported-by: syzbot+9c29b92a3b6500bb347d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9c29b92a3b6500bb347d
> Cc: stable@vger.kernel.org
> Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
> ---
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>  fs/ext4/inode.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 10cd85d4c721..1e31933ae98c 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -7127,6 +7127,9 @@ int ext4_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
>  		 */
>  		if (ext4_has_inline_data(inode) &&
>  		    attr->ia_size > EXT4_I(inode)->i_inline_size) {
> +			error = ext4_inode_attach_jinode(inode);
> +			if (error)
> +				goto err_out;
>  			error = ext4_convert_inline_data(inode);
>  			if (error)
>  				goto err_out;
> -- 
> 2.43.7
>
