Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577476;
	b=RGlxfI4U/5NPARFqKvkdTcanPQLHqM3kCoLfJvP/synx4TKQ7Wd9psvPdRm9a47zKee7
	 b0KxG+2Av8r4wKtElyaz/oZxUeO6glKE82oHHBdB3S99fGcLiXWBZt6AoExrVzHDGTozD
	 +7EkSw9HrGXxg9sFLxJd2lS9T58cvFOW2jF3Lzlh+uT1caibXwiLnciqEWbzSHGrHjllb
	 ZCicTUykrrpb/n5QtCc+CdzD2ZKvSLC1LdPGXD1NiOhnNqRU5yzhRNAGNj2fafKOcrSBl
	 R28TCELjSshnqQV9SZIbF4EglqcbHV0SBWJYBS9MZrE42flB5ZvXyXSFv/qffrtKaBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577476;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
	b=czRx2Eynlj6LurS4ZlRCux56xLTUGFG9vtfoKZtHC3QDm2FIrBqHmEQbisK2i1tp6TZn
	 Ud1gEQVAxNMcPF2Ed+qW2GX0IAXl758JcfyOzBTuuAZDTYtUvLMHk90Hfmu3pycImzzs4
	 R/NpMfPVy840Se9sjbzB/qqd7sAr7KU18068tO8f7DS1ThvD0+Prtfp1O4JeFtBn3Bpi5
	 htRVVPGmaL/FPOvFlHBQl1VIti84givumMsh0dr8N56C6KpKmn8jXrfnXypCoTc1OYPBZ
	 vaRroUBFeN6J1Qz71zfM4jMss/Vl0H1uiMJSrWOr8Q9hNvFeu2an9igi7QjZOmSMggg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRJpuDgZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p2NMMm65;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0F2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRJpuDgZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p2NMMm65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792577474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
	b=DRJpuDgZ7LgJO4mT4LS0rmTR2Oit+nfgKj7EybX09VGAcbFwck8EgxgOKLEMi+fvZZUlEw
	ZEQ7SIOEFNXramMqkbi3fIlhVMWLKVB6GUUqUYOUJciRsvaCvjL3SDmrUt7ORVAwp2Tas1
	DQaWVlFzjGEhDHyQoMiDU9wwdfqCw2U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-zjEAmpKGPHuDJAO3vsJxbQ-1; Wed, 21 Oct 2026 06:11:12 -0400
X-MC-Unique: zjEAmpKGPHuDJAO3vsJxbQ-1
X-Mimecast-MFC-AGG-ID: zjEAmpKGPHuDJAO3vsJxbQ_1792577472
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so4064595e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792577471; x=1793182271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
        b=p2NMMm65jqUj/I4P1B9BWGIMi03CnY7qLB07ZBtujZih+ki0UsAbslcVS2RDxNYh/Y
         o2MMminxeoAs0V/jx+OZTBzf5RO5ereCCprRDR9pxx0wCTK/Zz7oPSzfiE2J0EIvRujU
         EzSPPpgnyZVIGxuwDqaIzeo4/hfhsxkaAQlpY4dwJbyLi7J9KSLygKezm5TbHBggRyXN
         3lJ6ksGEVRgwPNI0sQblkaXKLUSeJ6clUYyNgsMUz9s4A4u9MHlKa8AHjjU54WO+6yID
         rxfnlBdy26X2A/hQnxRPrHn8oMD6vkQ0eJvUy+avYZqyFNoWTcqPhPN0k7R+bTNR/5ZG
         NLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577471; x=1793182271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
        b=XULLNaac73aMKx3dmnRJ4dCwpCxbX4UWXLCtDHM6KAtc9ZaERu9sQKXK0ppoE0UMCy
         J+0RnRGpc7351dqfY9S/Lwi5VXnndH7h7vmo5e/AGbjwftdSd9Vkk6qykKtZkJOa8lH+
         sOjLJrF9DL4V0mvmb/X02p/Zi48XFiNt8JVRCBB99I3Uu0V/RCwUXAheSWchRQAQ3Fhj
         0Pczt4SPRSPUwor0wTzsKGCDrnh8ZQZagIgalSWSMBRFgOLgsExELjH3mQFf/RGR5XMq
         f/8CNItEWulujg/xOlp2Kts8HkX+B8c7dSrMI1s0nrhp9ZSF0lcdbi3lM8Di87juoCUC
         DvwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsH96su1gWZTc2d8MS3123e7emX39JzTy3l4Y1IS5tg4ENiSX5oPqCGIgMDbd7iv1PMgg+h0O6J5MNr0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnYH38mQESsd9q11vgGay8pXjuMn0JhHTLfwak4V6wNPhNEskn
	1dmroX6NVl36kWOCa/PBzY53YQumB3zNT5yRvtcumLaLpzZEQbajJpN7xU3gP4Yc8xUtbVyJAz9
	rxaUQh7w0u/sMQj/METsV+IFUqETeNeTztN61/FSBuOI6qtbhFxcCA0nGL2rWL9gW9g==
X-Gm-Gg: AYBFou2K/81SBpZ6kflNUS1LRNYzF5IetPafEm4NFuNm6CA6fCLDtC4kz345WqQYcm5
	Bp+FDKTbDujdIuFB+s4X7H1STzxIT2wi4SF9wdrm23vwT/c7v4YagldDNVrhoP3BcivuLDm5Pt9
	ZxG5nDwgZfVs2ADbqrLx2MfXFvFr+l08ON3i47Rw/jELnSgg02nun797mEmYugzg3Tp3jHtPcCM
	/ZGhIGHq/DfKn/w0QJY9k9huvIktlWQ7DcIMOh+NzAtuXbZgYw+RPXbaEX3PBs2VeB6ORM2gM8w
	nKnlifTx4C6GcHOUeeo7+TqnyHgQoG/o9MUXP0w/dHx9H8VzlvEralrXxaMCVsmsvLJrGkhurNY
	gQ90sqA==
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1fd8a7d77mr31195385e9.2.1792577470799;
        Wed, 21 Oct 2026 03:11:10 -0700 (PDT)
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1fd8a7d77mr31194065e9.2.1792577469551;
        Wed, 21 Oct 2026 03:11:09 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm152330945e9.12.2026.10.21.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:11:08 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:11:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net-next v4 2/7] vsock: rename the vsock pernet operations
Message-ID: <atiPgleCntfwV4-N@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
 <20261020-vsock-guest-ns-v4-2-047527cfccfc@meta.com>
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
In-Reply-To: <20261020-vsock-guest-ns-v4-2-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:05PM -0700, Bobby Eshleman wrote:
>vsock_sysctl_ops and its two callbacks are named for the sysctl tables
>they register, but the init callback already does more than that: it
>also initialises the per-namespace vsock state through vsock_net_init().
>
>Rename them to vsock_pernet_ops, vsock_pernet_init and
>vsock_pernet_exit, so that later per-namespace work can be placed here
>too.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> net/vmw_vsock/af_vsock.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

