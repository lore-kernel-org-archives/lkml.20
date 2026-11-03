Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714705;
	b=mrkWPovvzSaxkNTTVDvg/0tkgUYuTf/a9oLMipObT6/5stKSYGwqg6IITcQbLPAJYqRh
	 32BwkaxELXjPFJkmgHry3B+6oUpYf8yQym1rYlNuTezSVpaXxftescYq//0HN2JHpL/yc
	 Rx9EbdDo78Pq7ul7imoD7KkghLQ4AnqrBawPfNxft0Skgftxg9TW22Xtxx/N2USq6AHpc
	 CuPTopuHwEFwpQ/qwLBQgJDUHDZbORgh4RLAkeCFyNnrE4LhrPptkvC9P3B8yMzZKhIEv
	 KbzdRbeeUr8V5tSbwg7hcRDIYnNqcZtILPJREIwUoR/ZoF+0Ypjd2Hbfyi9HU1tSF9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714705;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z9sgzcHkxu/+0pAwfSMbdu/m/b2YeHjsiSjPVdj3CBw=;
	b=XetblfDOj+YIReMEb6DGgdOnpd87O7GTq6itEPl0VBi5gG811dTmseNXcoo0vtV23KAC
	 MY8jQwjit0Gbobao0RzvhWCxruv+KQUCzxRfF5XMhZTLC+Ws2bKxd8EfqLRhcCJPT3j0G
	 PcOhxR9GuszHyX7DNE/VjOfKcMXGLIIU7Hczcqidcta52/L5UD4XgZIU3CjiDivNfMwDW
	 1UPQ1pKkOqWtEoOkteC62QsLDygyUqVIMYYRuV4+r8X5G+FtG0GQ3iY41EsXffUtLySJ6
	 XQtIp1eOi3Iv/fXr98sPc2O/w4id13QqglrornI9ciIa8bAZUThJO4M5LxFUyNfvNfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aSA7kE8A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC649606A327;
	Tue,  3 Nov 2026 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aSA7kE8A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20ED61F000C1;
	Tue,  3 Nov 2026 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793714704;
	bh=Z9sgzcHkxu/+0pAwfSMbdu/m/b2YeHjsiSjPVdj3CBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aSA7kE8A9FiD3o7+1mMovRZ4e3hvIMr05wH6CYj5r1WRX8iM43jOOYTQ6bwqPjyrx
	 QaTNIs/fMyoX89Fx2cG4YHjb/M8pKA8M8VsZHuprG2Upm3PP8relAZtSuPvNKr+Gj4
	 GY4a2tVmNR6X/9Y2hr+hrGxYnnNyIvW1gzEp+wiw=
Date: Tue, 3 Nov 2026 15:04:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Dan Carpenter <error27@gmail.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Raushan Kumar <mitramaurya80@gmail.com>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	linux-media <linux-media@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVENI?= =?utf-8?Q?=5D?= media: atomisp:
 reject short _DSM packages
Message-ID: <2026110339-joyfully-captivate-855b@gregkh>
References: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>
 <aunacczneVpPd3mM@stanley.mountain>
 <tencent_283392A22C260EB0040CD271@qq.com>
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
In-Reply-To: <tencent_283392A22C260EB0040CD271@qq.com>

On Tue, Nov 03, 2026 at 09:13:16PM +0800, Kang Chen wrote:
> No. In the confidential computing (CVM) threat model, ACPI tables are
> controlled by the host and are untrusted; BadAML (CCS'25) shows malicious
> ACPI/AML can be used to attack the guest.&nbsp;
> And the kernel already validates many ACPI return values
> (e.g. types, package counts, bounds).

Are you sure that Linux supports that threat model at this point in
time?  And that this matters for this specific driver?  I doubt that
this media driver would ever be seriously considered for those types of
situations :)

thanks,

greg k-h
