Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516485;
	b=MMSxYlVK2xYazcEGMjI89PgnTnQYi9P62JGx4Mlqsv68hrx7Hua8mzxBV3QnohFa1pK+
	 IQ26a1c2iSvzIT4Fi/azSBS9D2la4J19dm0aKKgq3pF9TL8ipraOiIcggJCK6bPOITboi
	 SmErvYOTL9W9fL/7lxf0PqerDlvIROB1BgH/7G3obAljUqBhLaYkI1uZm8Nl14WAH07OW
	 9F4V11uBp/Dg1E8ZNGD3R97gejldWKZVMtoEKkRYAE+oQvU2Y2wWtGEH0rc/OFCTATQ62
	 znbLnUI3Xb38HZHpy5JYfYKu39ZUhQWLMIkam18s/fwU8+dqR3w7Cecu/s+lUyedoHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516485;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lOwnGQXmS8evHlFVLwX0xtuDnhg6yBqOr9ZK8AmqtFQ=;
	b=YgXzo+LLPCfYOs/tddmPmmIA+fYGSwXPgPxke/OtxVHa0oGeTJkz0Fc3Zw3TNbERgryP
	 6OezNlZVqJSQ4SoXuu2zXySJeSN6sVV9x9ZlqH1Bl6IaG0iI/vH7lS3BbSs32GfqVNEcY
	 eRz/qQKRH0nVVYQz4GpBQSoMmm14q0e8QqyyWjZoka9zmljCuJ+fOH1k6oA2KXiOCjsvA
	 bmZfttWmo1eTIR5XwQRQ7wMISeZjhxOGtesf1/rgaPWvjem6K/mjPjDdiciZreCFP2AYf
	 j2tf4Qm1xJmup/jcQ1qgDrHimhVx0hLHuQtqiLw2U+4PnIfAB34M73kOaV9F3HayW1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YrbUqHU+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XrcILpcV;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD591606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD591606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YrbUqHU+;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XrcILpcV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794516483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lOwnGQXmS8evHlFVLwX0xtuDnhg6yBqOr9ZK8AmqtFQ=;
	b=YrbUqHU+rHcmSyyevIaNaoiXUMa2N0Kvot6Q+zVerXXVvKOxuOPK0M6Sed5DGbzU6dkOS7
	fVTxI/xMYbuQUR7ufhDNmwWhqwOI7dSExJMvvYQlEkOqPnuj+zyivdbg0E8rug7Vrm0ewA
	AV1XWjyUDNbr5vYl8WlKYDkeMIAoVO8=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-HBzFSoJiON-f9ailf8CdHA-1; Thu, 12 Nov 2026 15:48:02 -0500
X-MC-Unique: HBzFSoJiON-f9ailf8CdHA-1
X-Mimecast-MFC-AGG-ID: HBzFSoJiON-f9ailf8CdHA_1794516481
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8626dd59f73so215541a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794516481; x=1795121281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOwnGQXmS8evHlFVLwX0xtuDnhg6yBqOr9ZK8AmqtFQ=;
        b=XrcILpcVi768ekJQkiC6az4W/O0HPMyYmAmrrucrjsC0hI5lPjWzPKtGVXVrPb/dhf
         mKJi3hUwD03+UV7Xy6OaeqHZ6kiYXq2Vi/JdrO5CCIpD7aYGwqcz40MxDbeO/GCduMho
         Ht6+Jb3yfMALIrFojQBCuihl7Po26goyI6uI4KHe0JLu2KNCg26Ys6jEvlFyYKSJPiMa
         B2cRnWyz0uXpBoMNCUY1kPpGuPVJ4MjYYqQItmrW0/chATCt5G3ehy/53eSqR2tmn4Sx
         3phun0NRzswUh+bs3xHt6nj8cJ4M+0cdfSlxpR66cZsU5LP0emccfjnc3SwylUeytqQl
         QMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516481; x=1795121281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOwnGQXmS8evHlFVLwX0xtuDnhg6yBqOr9ZK8AmqtFQ=;
        b=GhhDVYEej3wQUHUGZ7Py6TsoZdPoR9lAYwHl0goAyRagFU4RK/TWByHiWdrK/Jlewz
         ERr9Q/jnQi+iVcRoC7uUpCIMGZi8MKISmvD4vANZkaeplSg/fg3lH/lRu+sRTHmBVaLb
         1QSihYcP0SE44UxBmxiGnR/B2DQUqYStHFiNbqqEYkfd9dbdnJMhUfLb1ceTFZeEDMMu
         1l5dBgJsmcvAc6qe8n3KlEnUFTCFiYIpIgrpJoxVwF3xaoyJ2ZJtcwtbTRqIWo3ouA4R
         yDQs9bsXHIS2Dl50rN8aNIZ1/pRQHQpOZnEgrbpE0ajZL/ILCWo9tJRaTMC0dT4nkUem
         Vx6g==
X-Forwarded-Encrypted: i=1; AL+hErE6WHxems09kSTCPEjbIyvv+Pc1ywbIDAFW2MDe+K4fW2BM3gsFWo0dtxo3oywPn3QSLLnP+CDfXKfjkw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VKgZLk6mOZ9eMCy6HvWtQqwGdPAjmcbbfHucti7tI+qwcAnGz
	0/dp8SB0/vHS3F1obMCY1cqPg2LXz/cnaAGnRVq2M7D2NATGU2JGmvxYOLIQCyBLYKjTU+O5Jfs
	Qt2lM2nxpnZZGMOhPmE1BhspkJtAqoIWdJEt/ELLyZZHhRvHBR10quALRk9xKil/Klw==
X-Gm-Gg: AYBFou051SlDvM7DnFgYC4Syi9uF2lbRcON4F0IfCUyS50ofZjY02VscHWzxWYuCNXA
	20WJAozkjcOxogKeAwcTiV/+TU82xnFnY0ycEmQpUdUgCivoVJEd1At3Kqri0RdmAHseqVz9Ifm
	guhxAK6IYrY8RWltO6td6OxTTBED/u13qVONEjZMdmtMm35mXDvJPQGlywl5N5DxqaoGhASpqkn
	PlMoOkoH8ezHzVlYbbs7ndbUNXBi91oH9bBxnvWAlnYlfuetrBisLvOhYgA72dPVXHiO7hn83WU
	YEB0LYYQFIHccT94KUODDCtK/MaO5GrM8u0LXkkVJvyrA9OUt7ZPus5yyQpsb8Nvmd/hv9Q+ccM
	nkNHvCQQssq+ib6SdevyEvcJaz9FiX6Xxy4xCo1fKJCG+SLh77y8F
X-Received: by 2002:a05:6871:7b0a:b0:49d:ff8c:205e with SMTP id 586e51a60fabf-4afdf2da638mr911060fac.29.1794516481380;
        Thu, 12 Nov 2026 12:48:01 -0800 (PST)
X-Received: by 2002:a05:6871:7b0a:b0:49d:ff8c:205e with SMTP id 586e51a60fabf-4afdf2da638mr911021fac.29.1794516480871;
        Thu, 12 Nov 2026 12:48:00 -0800 (PST)
Received: from sgarzare-redhat ([69.196.88.181])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813465esm686251a34.16.2026.11.12.12.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:48:00 -0800 (PST)
Date: Thu, 12 Nov 2026 21:47:54 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: jrmmhm.kernel@eldare.de
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v5] vsock/bpf: release sock lock while waiting for
 data in recvmsg
Message-ID: <avYllBVgJg2AHYc0@sgarzare-redhat>
References: <20261109-kbh3-1-022-fix-v2-v5-1-4d9af04f0fad@eldare.de>
 <avXyzxvIN3ngFepE@sgarzare-redhat>
 <179451283622.7.13355395779239029915.1767743913@eldare.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <179451283622.7.13355395779239029915.1767743913@eldare.de>

On Thu, Nov 12, 2026 at 07:47:11PM +0000, jrmmhm.kernel@eldare.de wrote:
>On Thu, Nov 12, 2026 at 06:23:00PM +0100, Stefano Garzarella wrote:
>>On Mon, Nov 09, 2026 at 09:08:29PM +0100, Jerome Mohm via B4 Relay
>>wrote:
>>>The loop
>>>and the zero-length check belong to the fix (without them the reader
>>>returns early or spins with the lock held), so this is one patch;
>>
>>I don't understand why that fix can't be in a fist patch of the
>>series...
>>
>>>+    if (unlikely(!len || (flags & (MSG_OOB | MSG_ERRQUEUE))))
>>>+        return __vsock_recvmsg(sk, msg, len, flags);
>>
>>... I mean, why this change ^^^ can't be in patch 1/2?
>>
>>BTW I'm not asking to split it (at least for now).
>
>It can: the loop is needed for the deadlock fix, since without it the
>reader returns -EAGAIN early when it wakes without data, but the early
>return isn't. A zero-length read with data in the psock queue already
>spins with the lock held on net, and as far as I can tell from the code
>the early return alone fixes that, plus the MSG_OOB and MSG_ERRQUEUE
>cases. In v4 those reads were patch 2/2. They went into one patch only
>because Alexei's diff replaced both, and my v5 sentence justified that
>badly. You said you're not asking for a split, but since the early
>return isn't needed for the deadlock, it would fit as its own patch:
>should v6 have it as 1/2 and the lock change as 2/2, or stay one patch?

Yeah, I'd prefer 2 patches with this change as first patch.

>
>>I saw some comments from sashiko, can you reply to them?
>
>I'll wait for your answer before sending v6, and I'm replying to the
>Sashiko comments separately.

Great, thanks for that!

Stefano

