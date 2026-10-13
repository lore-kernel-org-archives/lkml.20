Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2143EA97E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886674; cv=none; b=h1UGDuf6DgMZ3CGFjv9/oo1SN10se/nq5a25kKiS4FDVth9mfcekUIlu5UrYFQbk4tZalFNdAj1NnX4O/G0CMsuho/3ambz0PEvvpzESYPp42mS2+M0G+crRcl5oZjJUD+oCVKLIkqdzxQirD4H9TMZ8RS9C0BnDY4w65/I/gNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886674; c=relaxed/simple;
	bh=mIerHSoA0UPEkltbp9WWAtUXDdAGlSICZDdSK7TN0Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqiNvdzReqNJ2H2vWUT52DtJFLaqPDwtPs0/UpAUdTaRF+j4j4jFrwJkNVBbTtWZxgDgKx5u+1HBKgmS4N4rOkMt/vmcBBwBb4YlnzyeXJATzSz6sJYky0g+4PjenOnthVdWBWQPRgGJ3GR8v6PDRWYnTcLqJGadPNX1zk6pfSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKa65ZkJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GU8qH6o4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKa65ZkJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GU8qH6o4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791886672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQm+7FhyHN6+IiGzitNgRTZSKN6UAw4IPMrNRyYA++I=;
	b=jKa65ZkJ89SMxiuvAmyT55ZfGjYsooKSOyhr3yB3olPS1im1rWW+8bMDqlrhi8AGUDpr24
	PKmd2Tk0FjzFgvcQezPe9rbcn3LyGOQvqZn+pPCbm5eJOA7J7pbr1Ki/wWo2Y45I/1CqcX
	CuEjGb49FlKPW87OBAQusWOZsOSBQsY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-dFjuNbI1OGm9JBZbTkudrA-1; Tue, 13 Oct 2026 10:17:48 +0000
X-MC-Unique: dFjuNbI1OGm9JBZbTkudrA-1
X-Mimecast-MFC-AGG-ID: dFjuNbI1OGm9JBZbTkudrA_1791886668
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-486f9d150c3so1667102f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791886668; x=1792491468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQm+7FhyHN6+IiGzitNgRTZSKN6UAw4IPMrNRyYA++I=;
        b=GU8qH6o4wR2Oz0Y2zwKYOhV51o3IevFPSmp5nuWzvuy9Kdpf3gqsscKuGMbH+btojk
         90A4SLFmJape0AqbvsR+Vdc/2kJ/BgcpkRapopph8nkrXUYtYiTf2sOIkVv1C10G0AMY
         c9U6r1fYLJnw0scbhjPHgDFaFK8YU4hUue5iUzlhKEkEX3fKnYNMF6pUJb3VdkheYKDF
         dQ81GlD58TKEGpUnrprDiTHM4g5ykbmqRzzkJ+yuTSNdiEPf8QukudCLHEkDZ+yahPqT
         v3YD0ieqkG+3eAjLhCraHgjF1G+NV9awX4eE0cQlYGnAzZEw+MS2Eo+wdcbigTxgjD/V
         e0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886668; x=1792491468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQm+7FhyHN6+IiGzitNgRTZSKN6UAw4IPMrNRyYA++I=;
        b=BGbpl+PcjSdsPnSA6uzRIxcUekQ0RC9VE2t3BriAuF06xgTxQ2cACZMifOeaTL6bWf
         mgjs3mOFxX6YHjvZdA3fiGkSDeQPRQqMJ4A/hhEATlnbxKJx6KiYLzQIsEGNisedbiTi
         fLsRTPiOsj4PYExJVJRcvN8Yx70lCxb/ePbqJh6ZA46d/He6OJ81rmMQKZLcb2+yNDRF
         OVMvW8vKSE6T1oG/1AlVSutvkK8SHZdnWDSxOCeu43FyMQVUIwt5z5WVo2ta1IBIzIIW
         kfk1+Ln5DWIw3ngwKKQcqyVWgx665lRROpaXOuqD06QqXGW6e7cpPcpj8PxGCs6JMI5Z
         tWJQ==
X-Forwarded-Encrypted: i=1; AKwUvBySXrMdJV6Jbz65HjzMZwzttmIS5nEYWKHU8LHZfEBST3kYlepldO8poKBg6FmDvFPuhobPKd0EQG+RL8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6s89/jw51zsqRRYCnXqGRaaGzfHpYbhTsJdP4LGZUfrSXnWVI
	3STRbqdyfpGsbmahkFd2WCBW/N3nH4QG4TgHLOrlNwc4PwAtPO4SqMRu7vtNK4smeem7Dcy6oRN
	4NVHcHtLUsCy4lIStyQftx3QoscT1p2qttV6RUC46w0RXTTx5oUaTw0a/NMJPiW73wQ==
X-Gm-Gg: AYBFou3WxQNVcI6AZ8DXpH+ORoi2UJfly3XOvuAScVaQ4nE8RxNn6sLWKXfKuTY7NuG
	slZK2rRZaMjKWD1GRItNh3ZJXtRin86kqdc91pUieWRV1p0ncn6p+F5EZjlgCXuoB2hXtskirsc
	WRSaiJiJNmYfkQZ7Vfjn8QoNoJnlcfmbwjYhbtBUms4RDZpOFk6v1gbVEids8TvPgr8QVNdD3bl
	MIO9Jqf/15XCucA3HtA3tNryHOecYrG8yrO8QfvATxZUwNdpWiaTImyL5KoBnW+hK9z72WqcKlD
	tflpNcNco1vk9qOFya11aKe8Eo8gbgWT6DQD/3e3g3sLXd7Q2aGe1BPC7njaAb5o8s2U5g==
X-Received: by 2002:a05:6000:470f:b0:48b:74b:4ce1 with SMTP id ffacd0b85a97d-48dbad00328mr20458007f8f.32.1791886667599;
        Tue, 13 Oct 2026 03:17:47 -0700 (PDT)
X-Received: by 2002:a05:6000:470f:b0:48b:74b:4ce1 with SMTP id ffacd0b85a97d-48dbad00328mr20457934f8f.32.1791886667017;
        Tue, 13 Oct 2026 03:17:47 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc5e0asm4276759f8f.50.2026.10.13.03.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 06:17:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: netdev@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, linux-kernel@vger.kernel.org,
	Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net] MAINTAINERS: add Bobby Eshleman as vsock reviewer
Message-ID: <20261013061724-mutt-send-email-mst@kernel.org>
References: <20261012-add-maintainers-v1-1-ef0488f460db@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-add-maintainers-v1-1-ef0488f460db@meta.com>

On Mon, Oct 12, 2026 at 12:58:08PM -0700, Bobby Eshleman wrote:
> I've been reviewing vsock via lore+lei for a while now.
> 
> Finally adding myself as a formal reviewer, since vsock will continue
> being stuck with me for the foreseeable future.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>


Bobby's doing a stellar work.

Acked-by: Michael S. Tsirkin <mst@redhat.com>



> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..cc1341f6e15c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28840,6 +28840,7 @@ F:	virt/lib/
>  VIRTIO AND VHOST VSOCK DRIVER
>  M:	Stefan Hajnoczi <stefanha@redhat.com>
>  M:	Stefano Garzarella <sgarzare@redhat.com>
> +R:	Bobby Eshleman <bobbyeshleman@meta.com>
>  L:	kvm@vger.kernel.org
>  L:	virtualization@lists.linux.dev
>  L:	netdev@vger.kernel.org
> @@ -29145,6 +29146,7 @@ F:	drivers/media/test-drivers/vivid/*
>  
>  VM SOCKETS (AF_VSOCK)
>  M:	Stefano Garzarella <sgarzare@redhat.com>
> +R:	Bobby Eshleman <bobbyeshleman@meta.com>
>  L:	virtualization@lists.linux.dev
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> 
> ---
> base-commit: 8e2fbe0e75d38690d551456658194c632933cb57
> change-id: 20261012-add-maintainers-bc6e8a6fa68b
> 
> Best regards,
> -- 
> Bobby Eshleman <bobbyeshleman@meta.com>

