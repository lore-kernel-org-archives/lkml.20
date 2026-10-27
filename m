Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091373;
	b=CeXteLTUGrLZkJQwLOCS2eg6RjT2RKO51Lxo9BMvyyGIpRIxHLiMbjtNN+CSTf9pEAAX
	 v+4IJ+RQ93W0l9IYNqteGAe1LF79rb2cpvKgDQc2jVUe6XJu4nKSrBGqQHJYWZxnG3K/J
	 e2Rpr+brUD/tZEevrvie7v3aaeLAwDJP4uRR7V0MHJdrr7VSdZweRqXBEFyW2ZgGzCDNz
	 ytEYXGLCSBp0l37PPlUvjD9EafyVx1jprkFtcsmXUEzEaPaajR02B0RZANdeD3fkM5hnc
	 vdI1va2lo7jJ8BbyF+Q5HUPocbQ9mtDMuNsnGux7ajJcw9P/jGSFdVa7ISbUe/6GvEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091373;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HyrhFsYs+REFUgaFVShlaZ9e8ld3lHCKJ+hBUTNdVHw=;
	b=aiYOzpZ7CwWRbeM38KxvuyZTas7MIONaUOSgMAkPWH5Yy60cm00hZIfLaeOrNk+xbk8i
	 VsaQxOUSwVdErg1iHOjxJ8NKHMtMr/hH/k30XCbGmz1XsBLX994fAC7gaLn7BSYz45OYI
	 JaY0v9txzHc4R3Krb5iCNpHvNz7nv81OtEJG4aHAwZTr2kaapfgcf0BjsSTX7hVPGnJaK
	 4Cfk1HSRUAIZYi51hp6QFe+0/tTmQORF7zvPLJUidTOu80g5X01NDzDTbybiEsYR7Z9EL
	 EAwJ2cW8hHD5YJv/MyoCqW6MHqx9dvU3ae23ibQZaMkGJKBaVbCVhNdWpS2PabBYIZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XVk4s9uZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hVG4Z9Rz;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56512606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56512606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XVk4s9uZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hVG4Z9Rz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793091371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyrhFsYs+REFUgaFVShlaZ9e8ld3lHCKJ+hBUTNdVHw=;
	b=XVk4s9uZMvalsel9zIsIkXhztuP0qeiTnGFF1MpaiHK3eYxJ4pPHA3iWdBu3Q+aLWk47l3
	GDBpFZSekfJZu6hzGTgunFWkEJHCfNagTcqBjfxx5z22Isi+oo9uUXAWtFO9AHbARS2Mbe
	paGP0Rep85wLtTLxZtOQrpE9VMUN8qM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-dc8TpeD9Pe2BC3vlhw7Zqw-1; Tue, 27 Oct 2026 04:56:09 -0400
X-MC-Unique: dc8TpeD9Pe2BC3vlhw7Zqw-1
X-Mimecast-MFC-AGG-ID: dc8TpeD9Pe2BC3vlhw7Zqw_1793091368
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so38303935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793091368; x=1793696168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyrhFsYs+REFUgaFVShlaZ9e8ld3lHCKJ+hBUTNdVHw=;
        b=hVG4Z9Rz1dB6d2izFFKRdGgemqvVFgxclc8HXtnYV2qslRbk5JEoRgmgyoDLQ3nVMk
         QaRuB06kOKz11LulRDJJakWKTgz4nNHX9I/FAjilMQh84UQq/8cWaecyRxnKBXpFQmUA
         yCSqToXeTLfUL7S/qHJQVeXcDi9WkcZgDezn7vgYdjEQUMEFFX+ai/+UaIG3CbhEBKeV
         ow7p18V+l46aMX+JF/DzBSPSaQVtzTGaK7hQ2pi/hrVkcXE+w+RycqbL+hVqqdpFR2pW
         328iUdS62GzahwKB2yvRmHPutBubbZJMoKTYwsAolWfYG1wy/EyJ3B5MMScmf+AZaF7k
         qjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091368; x=1793696168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyrhFsYs+REFUgaFVShlaZ9e8ld3lHCKJ+hBUTNdVHw=;
        b=Q1ReTYbaMDNQHVWd2akz1CJW9O4/oQR049kFSRc53v2VXtczmbjVghZAJlhcF4Fii3
         BsS0mhaTyhc9Hrd0EhIcQJC3JYUcByygdbYzJUeAaFOhcQyCeXE6KyPTHM+s110zW+l7
         rwt3iHFLB+6blvgQoyvP0Mwb70lEQ1Xdqfosual93i9zzkiJjmZ8bG4L9a8eBdN9MAUq
         W5wIyxtARiZ477501c4i9+DUDe7+Jw4Lrj+YvfdVAhDpPZseUVjp43i3/mnzWgP+yvB7
         bVfCGE32/wmep5C7botumlmltnB+ad5K04VK0LPTqimyxOqz66+2I6ml99pFHeNODXjx
         Bsfw==
X-Forwarded-Encrypted: i=1; AKwUvBypQ/tIZaWrLUIFkc1u0LmiaMxfsBkWc8jUfMvX02yExagzmsyVaxyBslS7vOUJ9bobtDjP7bo88XY1Imw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbaXg4KepnXv27z+rH9Tw+J47dAZQFco00l6YFDZtvtcfO5rrN
	igUb9m/daQOnQ6tc8VUFAwl3dXfS/5F/JLZccpthq4t/LZRs2MjAheB2sZ2O1LZRmO1N76Ys3DC
	c75gynIg9BQHiqL0gWSXCXIOE4nGLvDYo/sWR7Zpz0gXzR9lV5ta6TgAJ7G4q6Hgo2A==
X-Gm-Gg: AYBFou1sNP+PKYsBhXl2ej0yZX2x7o559myZZozpQMJ7PiTLFFzqfGb6hr9wn4Be6V4
	rWZH649n471Yl+slQonLs3MMCggrfcZKit/mg5rmjQvVmw+nN3I6Ebt1HFcepSXuCPbSI9G9PUZ
	VK9lp4aoSYxOA2Bdb6BOEx8fRJrsl3lY7f5ZH9xsSwh0uSc3qa3YjPDqpUMgqEB33OLhwtJa78D
	Iic3AXwy+ZVZyoXIlz07bCAhAI8rnanQLcF3MOWPxLqnYtaxqfPrue9KZbE7wKWp8z49WBC8aud
	Qa919/ToqV1tyPaXvfpJPQspSnUJ0rDlXPiMuGBRPkgvC7gaQ9hoKh/43Eei9VBCD7AmYH0cOZ2
	EjmpgiYgGlrKQrQSEp3EHdt/w46bI1Sf43IhF3pIQvl98LPV7P41vdlimtDLHhvx89GFkQ0E9DA
	==
X-Received: by 2002:a05:600c:8183:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a35ac9d234mr149428755e9.10.1793091368521;
        Tue, 27 Oct 2026 01:56:08 -0700 (PDT)
X-Received: by 2002:a05:600c:8183:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a35ac9d234mr149428265e9.10.1793091367861;
        Tue, 27 Oct 2026 01:56:07 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm259883715e9.2.2026.10.27.01.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:56:07 -0700 (PDT)
Message-ID: <a3c08b59-7eae-4a1b-aa0f-042abe024525@redhat.com>
Date: Tue, 27 Oct 2026 09:56:05 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 3/3] net/mlx5: DR, Fix out-of-bounds write when sync
 to HW fails
To: netdev-bot+sashiko@kernel.org, tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, acassen@corp.free.fr,
 valex@nvidia.com, erezsh@nvidia.com, gal@nvidia.com, igozlan@nvidia.com,
 kees@kernel.org, kees+treewide@kernel.org, leon@kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, mbloch@nvidia.com,
 moshe@nvidia.com, prathameshdeshpande7@gmail.com, saeedm@nvidia.com,
 william@theesfeld.net, kliteyn@nvidia.com
References: <20261021074949.3471704-4-tariqt@nvidia.com>
 <179275275762.3134.7548579754182364985@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179275275762.3134.7548579754182364985@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/23/26 12:52, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] After a single SYNC_STEERING failure the pool latches into a
>    permanent error state while allocation stays open, so device SW ICM…

This one looks legit.

/P

