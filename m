Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638761;
	b=Sw7R6g4RGHt6Vvn2YGOR9an8dGtXqM//EzlbOMH4pe5+Z1FqHpD5pf/w1YMu1fvC6OYd
	 j7osDW3T5241Ib9el73xG+5NGL+BYw1xGBQL81Our3cNWfevqXtQzn/op5a0Ivcit+Yk3
	 N3FTaJ/vGCRTffBHM95a+uQTTp85ztusMNuKnoZBuF4T+EmFJzDTu3ih0r6CHXJnGAkim
	 oNvmqOa8L9mcHTUIktVy6dFdOHNAPvjOnMDA4FgS25LnBAwyllGM3p7ZG1IuiXtlfiE4W
	 sAboukYPn6HFwrOMmfGglabbZstH21FfcGQO8u+d3AOuM00D/bj9OABT46I40WPQlfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638761;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+xlGaRU5eM9yXQHc3H7tgVi2dtTUfB0PXU0qiJAlpgs=;
	b=TJFZkWlgBio+iIIytKSclYwJtfUtWBWMAOwReHD+3VlkuLzwALGEMswETGgLAJ4P34Rn
	 RIxAS4exW+fzAW0wXglxbH+Ujs7k1yAhMSFQ9Lf+atd5wce/4ehBSDeyxUOASQus70pZG
	 Iy8uAxQyaFdrmVCyUDgs4A/uVnPApTQZPEpxVZ1brA4cdQ1wbXEvb5uJtlPBpOMOiHXOf
	 qLmupQ4mn0LZc7O/TGMn+4/k1NJ4EKUScA/SJu9paDqHff2dFkp64LNi3TZY+rQAwFXhA
	 F5TNRhc4sM7bOSxz7YZD+9nuUycjlILvsUwn0XEXtWmYDe3lQrs6zNY2HhdcSWxIHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=bRoNC8Us;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68EB6075294;
	Mon,  2 Nov 2026 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=bRoNC8Us
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5291F0180D;
	Mon,  2 Nov 2026 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793638760;
	bh=+xlGaRU5eM9yXQHc3H7tgVi2dtTUfB0PXU0qiJAlpgs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bRoNC8UsSF4mw/TY+wJg4tWEzHfnwOxBlkLxFNDtvfaHVWciB+qbDgpI+J7zwyrfh
	 gklRWmAak5o29LWoSA9WX5KD7g53/aHjXFaDRf3Dr+wsv54ddfRkuBl03teyoD7uVK
	 07XYJmpDvmo5qra7VxGzDeaii86lQKT9hOHvMeIU=
Date: Mon, 2 Nov 2026 08:59:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org>,
 danielmaraboo@gmail.com, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Avadhut Naik
 <avanaik92@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove bouncing reviewer for Spanish
 documentation
Message-Id: <20261102085916.0d1043a3895ddfad9def7e5f@linux-foundation.org>
In-Reply-To: <87fqxjdy63.fsf@trenco.lwn.net>
References: <20261102022923.686974-1-carlos.bilbao@kernel.org>
	<20261101184806.11850a34e2dcfae9c3f55af9@linux-foundation.org>
	<87fqxjdy63.fsf@trenco.lwn.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 02 Nov 2026 08:56:52 -0700 Jonathan Corbet <corbet@lwn.net> wrote:

> Andrew Morton <akpm@linux-foundation.org> writes:
> 
> > On Sun,  1 Nov 2026 18:29:22 -0800 "Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org> wrote:
> >
> >> Remove Avadhut Naik as reviewer for Spanish documentation. Mail to
> >> avadhut.naik@amd.com bounces with "address not found". Translator credits
> >> in the .rst files are left intact as historical attribution.
> >> 
> >
> > Thanks.
> >
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -24843,7 +24843,6 @@ F:	drivers/i2c/busses/i2c-k1.c
> >>  
> >>  SPANISH DOCUMENTATION
> >>  M:	Carlos Bilbao <carlos.bilbao@kernel.org>
> >> -R:	Avadhut Naik <avadhut.naik@amd.com>
> >>  S:	Maintained
> >>  F:	Documentation/translations/sp_SP/
> >
> > https://lore.kernel.org/all/20260316125324.396889-1-yazen.ghannam@amd.com/
> >
> > suggests a better patch.
> 
> I don't quite see how ...?

Avadhut has a new email address @gmail.com.

