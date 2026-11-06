Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937019;
	b=iUvj5v/+iDr43BY4mQlpngr7ROvWn0niced4vuvFF385oT1q1ICjxZTJmx8l0EuoIwWg
	 19yPLF7LeHn/ThV1laiGDk0t1c1mRhnlUIT3TlgWF2RBVZepH52QzPPiIQ1BjucMT2MGg
	 gTC/uXJ+0krJk6vNmdGhcX20cVboFIdl831l9uX5vcUBmo80fl8ZtESWWvF5huVISJ6ug
	 N93Or3NKqnC/Pej7x1RU3ZsI2susLX5/kSnWQRSM9ZnuKMPVbb/VKbfAfWY4S6ZiV2TrV
	 MnmgYm4+bc6Su+9ZlxgVZb+iCz3cyyxSQQKbD/zWwVCwMm5H4/MwyUV1zCQbJK413hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6tDRgJPpAPdHZC/CI6XOx/7gcx7ej2JTLHfsZG0bscM=;
	b=qWglijl6D/IK86mU9EEyd7kie49CSIxtwjBXVu5bdbswocZfoAEVSPvQM4MlEDYJDT8y
	 Weo+bqg9V5OsypsdTooU4ypw/eMBAundyEf/81FFqCDXml1dCiUNEl1gRw+PHKBDRSLcG
	 06k7HlodBW5m/ck683CfZBuxc0UCmdTwzb8V2el+6GpwiKSzTwafbkmJVO3Lrg1I9JOVy
	 4JUeD3GDVH0wuhLN2JgLHIZ30vaWgYbnBU56bHFsFhQAB7kPL/0o6SNrNQ4iG4UJjc7Cs
	 hgGRcmltuISk0hvj85AHTWXvFUSeDp1nxv5aKE41NxCUzOJ3lMPsyfHPgHkna95aBKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XPHMrNAt;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAA9606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FAA9606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XPHMrNAt
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f30660e69so16748885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793937018; x=1794541818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6tDRgJPpAPdHZC/CI6XOx/7gcx7ej2JTLHfsZG0bscM=;
        b=XPHMrNAt1ma58S1edfZpOnZGbqEmlSlhwQ5XZQ2FInojM9/wJO7Mq/3LCb2ggducBe
         ohNDZXcSyuch1+bqwLKl+U9HqlnERsB/vqxAINoPa0QIPZddBlw9w4zWAC1pbc/ZEo5Q
         kCtClKHzYYX8FjdUygvZBiivKbKN41CoQbsB7OMigxIArgLZ+JyaFjRg1qCqoktfdZ8Z
         Y1E4Js4YcgoHpvtdU1YgQ1gg1bh71W1t1bmm25EsmXnZpDjS4DHEmrkbcZu2K6iQGEqk
         mZceupHmxDI8Tgcx2J2ulKvUwWGgk5EQR/2UmFDlEqjeW2Tsc1T2EhEnKfNASt0xihdu
         A49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793937018; x=1794541818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tDRgJPpAPdHZC/CI6XOx/7gcx7ej2JTLHfsZG0bscM=;
        b=RTEvzMSTGCkfFVAnp6AKE3RTm8vcY78r2bTaHWKd1IuW8ahHmnXMbZ+wM/d+8wnEI4
         0oxztDs4j9P6w2S6BKZvgaIlRfJSCxQb3jD+D1c1dY2gIzAoiErmqbuZ2mu2STTX4vhs
         ucj56fmnHMLaP578mR7Tyfroq5yCIwWE4h33DVpVV4ztJNqK6WXsMW96LxibCw5ichRL
         VaFYMW9AMySmMuY8lmaAB0Nf+Yk/WiaQPOXYlVx+Mre+Qs6k/NYBTXcuKoseY2iZPuYu
         pLl1vWL9iz6B4NGqlEmvSBEOwpuoNfktNMYqPIx00Ta1oVBreuYimqGEibG04kdQjwil
         2QbQ==
X-Forwarded-Encrypted: i=1; AKwUvByu3YyDBafrMxcgDmz/hTbg6B8xZBSoJVAZsLzyp2S1dOp1M+CP/krPebUkXh3Vj6Epz4Eu3UjKxXPjWKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YNNa57w88k/W+G1u/XXtN8sSHnZTlBsz6VbSfQxy86K/ooQRD
	MzX8OaCJmI1/Cyt+XzRwQ5o0LESG8iWJAIbn1EZDHlGW77JfDKQmh9TCkXRgNIKWIw==
X-Gm-Gg: AYBFou1ZuxDWoa1XE8v/8lrJqfN1tipSuPJmAIYrcPTRhlY9KztUlP3Fyv5nYXLZFq/
	sRAkEuPG1R0QxUU3efBri5NrEP71Vhpd3Sc9GJGmTo7nXL22DzyyWCOBNPwD2PN3GrU8Xo/tyuv
	S9Ywr3zF4g7tBUkgarAVJM+z1mJJirzhDH41gR9ngMdR6X88qX1rFAe/bdjKTatjbTZR0VKDQRs
	wNgPB3pEK90r/9NslxNv1Mz52nE/cldgjj+2jILO3IXtNsipI5Wi0vCsfcOOhyQFsH13qVxQ1zy
	Ug4rdXNmyCwFtnjH+butuJVcigPEfOSLJc0nsZEJi+OW7jLrWwavhUQo6fo1NWt3I6JbhMa09bp
	ycsI42Iso6+13oxEzggU/rY/zFg53DPWB6qRo5Z2flS1m6Rmc/5rIK2Ep9ByWlBkynDJsy8PMcW
	qn7uKifgcwefHhxR0Z5eXL+Fc4HCqJod3J8fqt2KNvs8Dng01tUkl74ydmiwPlCLzsphAXA/knu
	dnHdbx+ooZ492vdbVjudYm0XS3khMZq4AnUrwaQfYEk2lYkyoBZJFUSPpESy7lZdVCrzKpgHvoy
	tdfUyyMp+7XkPrOHl0VtuMD4cFMk
X-Received: by 2002:a05:620a:458e:b0:943:fbaf:6f62 with SMTP id af79cd13be357-945f3541b0bmr188405985a.58.1793937018321;
        Thu, 05 Nov 2026 19:50:18 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5bac07csm46448585a.17.2026.11.05.19.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:50:17 -0800 (PST)
Date: Thu, 5 Nov 2026 22:50:15 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+3a56b27661cb0e004a40@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in dev_config
Message-ID: <b28839b0-7de4-4dce-a046-e453c697b4fe@rowland.harvard.edu>
References: <6aed2980.53a4481a.2cc859.0009.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aed2980.53a4481a.2cc859.0009.GAE@google.com>

On Thu, Nov 05, 2026 at 05:12:32PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    e11160948333 riscv: vector: Fix output operands in context..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=12e4e525580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1c1b9a4a89432905
> dashboard link: https://syzkaller.appspot.com/bug?extid=3a56b27661cb0e004a40
> compiler:       riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: riscv64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-e1116094.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/69abda6e64cf/vmlinux-e1116094.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2d7716a5dfdb/Image-e1116094.xz
> 
> AI-generated root cause summary:
> In drivers/usb/gadget/legacy/inode.c, gadgetfs_bind() only acquires a reference
> on struct dev_data (calling get_dev(dev)) at the very end of its success path
> (line 1709). If an error occurs earlier (such as in usb_ep_alloc_request() or
> activate_ep_files()), gadgetfs_bind() jumps to enomem and calls
> gadgetfs_unbind(), which unconditionally calls put_dev(dev) to release a
> reference that was never acquired. This reference count underflow prematurely
> frees struct dev_data via put_dev(). Furthermore, when driver probing fails
> during registration, usb_gadget_register_driver() still returns 0 because
> match_existing_only is not set on gadgetfs_driver, causing dev_config() to
> execute dev->gadget_registered = true on the already freed dev structure,
> resulting in a slab use-after-free write.
> 
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3a56b27661cb0e004a40

This has already been fixed in Linus's tree.

#syz fix: cb3b441f2698 ("usb: gadget: fix refcount underflow in gadgetfs_bind() error path")

Alan Stern
