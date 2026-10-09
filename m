Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035949DBB9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539086; cv=none; b=R04GzXubJPa9QiMKzJHqApUjFNn6GCCMW986UU8ABeMCu+tHiVwwQmqyOy673pPc+ro/zvvqFcWBxmOkoEiBUhFkgTvqiR/Ijezes50W3Opmfr7aQ2e/x4KZ9VAxS18vn52APUUyaiS8KoPEhSpb+9ODOTT7DevN/7XcybmgsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539086; c=relaxed/simple;
	bh=bExytepNqeEnYoIxPmIR3Yt5a0tGUiyPzEQmZBVvvIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqVlrUOqer/8G0zda2XbZg/Ikkb5Ts5wYYvLr49lpxCRh0lnc7Rq1bxL9aTJUA+/8SXx/Iy/pVpIzBLvOPdJC5aDGDox9NwTUMKT1SfsPOgui0t4KHkevIYZnsriL+YaTs3If/te2OdxPUNWu5b5GvGETPaotNOBWWSPotE9sXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KlDWB4qI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFSIIpB7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KlDWB4qI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFSIIpB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791539078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ElzbfGJ6k9OnVXRhdCGGIydQGM/Gsew8hwRjohyR8bE=;
	b=KlDWB4qI1lbkIrF1WGNLDRsCSYEaclSfMp3aJBBLZX7H+4p8i5HxEd0ffnMW5OWFI2PkiW
	rvdOSnNzS92VOsH2eL3d/s6xGUaDpAbVNexHdSa2xruyM4FrZTx9nCqrZB4Q8kyA9itnkN
	DwFwqmn3sU/RKqqzmBZ3WTgADx41iSw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-LqgNU309NkW9yd6vcmAnEw-1; Fri, 09 Oct 2026 05:44:36 -0400
X-MC-Unique: LqgNU309NkW9yd6vcmAnEw-1
X-Mimecast-MFC-AGG-ID: LqgNU309NkW9yd6vcmAnEw_1791539076
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso48049185e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791539076; x=1792143876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ElzbfGJ6k9OnVXRhdCGGIydQGM/Gsew8hwRjohyR8bE=;
        b=CFSIIpB7tQ+sJUoQ6DgDrCcLao8JLIyttQPk3sT6RVayfdj3gWSgL3+nuirAfZH32b
         BxX6uYyofsNNO9jWwt+n6RtOv30RJGu9bKx8n2B5o6B4Qycvl5MyllYD+X7cX+dWq2l2
         xdTxwHrzfMNtUfHhjKh71r6Ljx0WWeCcv0A3MCjPYGM3+u9gROckYoPiQciFQt1MzunV
         UH88hpwxNNpxr9OBuO4tIKw1bgsuIQatk2I31Pms9xgmwjbMUyKHzKbRocfzYw+YfrJs
         lOA44rBTEXwjdrkTx5mPvwaioDIU+JIHkCS9mbhtQjdbATS2ZaKozx6tljEb8uc7vVWF
         Gi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539076; x=1792143876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElzbfGJ6k9OnVXRhdCGGIydQGM/Gsew8hwRjohyR8bE=;
        b=BkkoZ+7Zi6txMfo3uW76jEObLeOSgWIwrqJpjSWVbGbmZFQlWX5+VW1QJdPCyzcgQL
         XXAHbDHNy7xbse2Z77DVkksXQDqfvr7q3Iohzqzskw/XBH73/zvblAmOoLU2s3tQuMlG
         ewQwk9f7xzE8ZXTaB3iqzbm9jroId4MCXUlT55nkox7/gjiHRwITA9OGUr7QvFniuY9p
         CUkPPGBv/m4S1V6E5ER29lszKE7NYCah40AqgAmhZ1UEBbtRZP1OhG88EMBcBbjgYkQH
         D12NJKMbFz+19XOExW3U1RCiQ09OMZro26UKwHGMlRCTxT0ZIoT3DTScr9AK6WhcsZmk
         Bu1g==
X-Forwarded-Encrypted: i=1; AKwUvBw5yVf80ifpuiNvDP6l/gEvOt9RoJCLvxb1B7D+Kk0SgA6B+DzbdC6ULHXH83umaW9MPBiW8dSzQz5fCiw=@vger.kernel.org
X-Gm-Message-State: AFuF++mJQtBXOEsbwfnvAujvsIIfzYgsdK7iBEaHd0561NeZXVjyBuWX
	co4wzHVz6lcTQ7jqpHLw+stDWHQbdfD6Xkt4b7I/6v8PmU4gLw0bwYUJH9socAGJREi/s1sv+yF
	3y7kFLA1x8nhgAjS1EF85rH67EBDwgLDJfzS7i+uI4IGoPx9dZ2tQKSUnrHh3t/sSdw==
X-Gm-Gg: AYBFou2VA5f7QxNHnRIw/2GZIpySR/HCrp3AuOPbko+j1JL2YHB426TjZqp6MEuX9/I
	QlF92oYleZdAcnwvZnYP8JTKCfmeSNux9ccQW8TiAu4x8p1s2h0tWmu5DHU1n+AjItd4J15qm49
	eJhdQ1rLjOxY7QmUx/w0SR1/wMNDj5Tpj4LTagv1tvfvzzcOGDejCkHvlJHrDu8aBI2kbNrRT6k
	XHW7DskwXDo4dUlU1YvJXjRKZnvSXy7p0bBM069EEBliWEwptTEiBDfH0A6E2Qdim+JEczHQ7ga
	Gj0eov4lg7IKCSpXRVNmsEskB8RGDZHLTZWHJDCczQErLzlR6CiHrzo9O67ol0TEuqxntt4ZAsN
	h
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a18e4aa206mr24728365e9.27.1791539075671;
        Fri, 09 Oct 2026 02:44:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a18e4aa206mr24727965e9.27.1791539075228;
        Fri, 09 Oct 2026 02:44:35 -0700 (PDT)
Received: from sgarzare-redhat ([5.11.115.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm44828935e9.13.2026.10.09.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:44:34 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:44:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: netdev-bot+sashiko@kernel.org, stefanha@redhat.com, mst@redhat.com, 
	jasowangio@gmail.com, eperezma@redhat.com, davem@davemloft.net, 
	xuanzhuo@linux.alibaba.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	edumazet@kernel.org, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH net v4] vsock: treat TCP_CLOSING as once-established
Message-ID: <asiySxBYMDbRa73H@sgarzare-redhat>
References: <20261005-vsock-connect-reset-closing-v4-1-15d41cfda3ed@rbox.co>
 <179133282699.434549.6239722975007408103@kernel.org>
 <011a9085-0bb4-433b-afc5-9c787cde0e12@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <011a9085-0bb4-433b-afc5-9c787cde0e12@rbox.co>

On Wed, Oct 07, 2026 at 11:24:32AM +0200, Michal Luczaj wrote:
>On 10/7/26 02:27, netdev-bot+sashiko@kernel.org wrote:
>> [Severity: High]
>> Can vsock_connect() still reset a socket that is already linked in
>> vsock_connected_table? This check only covers TCP_ESTABLISHED and
>> TCP_CLOSING. At least two transports move an established socket that is
>> already in the table straight to TCP_CLOSE, and neither one unlinks it.
>>
>> net/vmw_vsock/virtio_transport.c:virtio_vsock_reset_sock() {
>> 	sk->sk_state = TCP_CLOSE;
>> 	sk->sk_err = ECONNRESET;
>> 	sk_error_report(sk);
>> }
>>
>> virtio_vsock_event_handle() calls this for every connected socket on
>> VIRTIO_VSOCK_EVENT_TRANSPORT_RESET. It does not take lock_sock().
>>
>> net/vmw_vsock/vmci_transport.c:vmci_transport_handle_detach() {
>> 	...
>> 			sk->sk_state = TCP_CLOSE;
>> 		}
>> 		sk->sk_state_change(sk);
>> 	...
>> }
>
>Right, that's a known issue[1], to be handled separately.

Agree!

>
>> [ ... ]
>> sk_state does not seem to track table membership reliably. Would it be
>> more robust to check sock->state == SS_CONNECTED instead (the transports
>> set it together with vsock_insert_connected()),
>
>vsock_shutdown() complicates this. It can flip SS_CONNECTED to
>SS_DISCONNECTING.

Yeah, I'd avoid to use sock->state for what we are going to fix.

>
>> or to check membership in
>> connected_table directly? That check would have to guard both the
>> signal/timeout reset inside the loop and the sock_error() reset after the
>> loop.
>
>Lack of membership check for connected_table is not the root cause of the
>issue. But, sure, we can discuss adding it as a sanity check.

Agree also on this!

Thanks,
Stefano

>
>[1]: https://lore.kernel.org/netdev/arpBYXWb9pohx-8v@sgarzare-redhat/
>

