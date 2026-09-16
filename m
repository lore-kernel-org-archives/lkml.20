Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A9C37A83A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561724; cv=none; b=LURUbBZE/yta/2ekK/qKvYjwSJqtHHk6IPufyV2FLgqqYQOreh/+64MPMlJFT0G/rhDRqI+g6uZdHcBSap0YjeAPin0Nf2DbJIFF8wNUcOpXQyaDjeC46yfKic+GjNK6pWPcG4ELJ+pzVxy/cveJkUXE2KR1nF9cog1VPXtdNl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561724; c=relaxed/simple;
	bh=xl+U70fbkUqzVeG1dKiFnh1LU4j3E1hpm3qW61N6DYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMDrGYTBm8IKtWxBFiL328oQHFEQZX15xg+9rCDeFYsYhle46kvAHr4iX4htsXIvYxKlx2QK81FUIbWpYRuXFELQhA6DnLjyWLU7tvA2RHsHvUMu6eteGXhntL+D1ayBfAt4iYenx872Ym0kOJDdCFhNSU8GTFLu1BtU5ZE+Ork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fL3lyEyR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PmLu0Llv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fL3lyEyR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmLu0Llv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789561722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xl+U70fbkUqzVeG1dKiFnh1LU4j3E1hpm3qW61N6DYE=;
	b=fL3lyEyRgxo8EHOTAo8CiomxsMnS1L1CkvBtgtgTM2MkYSt667t4fhwyixWHaEmMgNr+VN
	9gdKCmCpoZzGba4Plr2+Mhfo4Y0wMZO1OREI3MWv+ew5VpMpbBT+dq6e7gmZeGxTQW8vnp
	/QWwRfWEI8stwzLVM5ND0oAEPDErnCU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-vDXX2Qi2PZqFOyRMJifIgQ-1; Wed, 16 Sep 2026 08:28:41 -0400
X-MC-Unique: vDXX2Qi2PZqFOyRMJifIgQ-1
X-Mimecast-MFC-AGG-ID: vDXX2Qi2PZqFOyRMJifIgQ_1789561720
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6c17ec1dso47310455e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789561720; x=1790166520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xl+U70fbkUqzVeG1dKiFnh1LU4j3E1hpm3qW61N6DYE=;
        b=PmLu0LlvrmLJEt/TDCQbxgMR9bW7qo5UUhlySx/9fcdOjTJ7tFFL0WTNdz+r0449vA
         ILc2/Hmy4fMpRS94j/ROt7kPj79jGIH4h5g14sOhOY2kQ4uQpqF81GK+M+IljxD8X5JD
         ekuI0M15WLlf6sftHGVoKYCnUQnGgJHVIAfCxQv/SjqZaTyIr5TEitKds0BahNY7dJxF
         P9fvSMpiSLFfYPpgVz1ENq1ieeQty78wk3shwUOt3Rgc9Wq9F3qgnLX5tLskuT9s7juD
         JIL9wl7z/VM3TUyjM1kCTcIZmYeeG6VeWRnDjpehVcajIGyBFqN4rzj3ZJ6UCT7kAGhR
         aN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561720; x=1790166520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xl+U70fbkUqzVeG1dKiFnh1LU4j3E1hpm3qW61N6DYE=;
        b=lTsK6eRCU5+rX5IbDMzapyPsb7h9e/WKKHRjT7Z3S2CsT1/Z512i71merYmwz/b3p7
         KlSVdiG2/yjRzdasZe0pS4l+xqjoxUffNNpUtDt3GVSn7td9boJJN8vkv6uHvHJ78tC4
         ov0BhYjsZrafEh/C66mW98NYMJ+tWtKYIrKSLMrmgRTK0tTOVlfzLJP8ZRfsCuSfWqp0
         dCg9e0d5wVLF4wWHb60NvfaMcdzhT/4cacNW6n50HhnC+eb1DpBUGbUyVfe40lG6tUTZ
         i0EUU5t9VBQtrDDg2W0sBmERIa/gNsTLGmAQUsw/FtCw+UM2k8WPwF/HIizit7+fvwtl
         EklA==
X-Forwarded-Encrypted: i=1; AKwUvBwEyu+3vXNhyfQMQ4/WQc3cb6IDT1POkSwiY9YAg8QLbQlS7Nrq/qBdngOTZddg+dqw9GNuo0/yG7q0IHs=@vger.kernel.org
X-Gm-Message-State: AFuF++lKA+biRjrt8WUssFZjoJS0X276nyzE6RTM7PfFVx2bg3QyAYfT
	Wl5lJINtWDRR8U9ln68VCVSOphp78UQb2m3OwGdKvHizVEtUGjWxLFY95y4V1o6a64rdYlLqHWX
	wXW/CRVEkfjWeSIkV+CspUJXZCaUkzcZlD2r1kXDuGbKYyfCVSflTQ8YDOwQJXhArWw==
X-Gm-Gg: AYBFou2lrsfan914fx33qxcBhkHpPnro9pUm2ajDw04Id1LCFhC0wtIg1rEXitX2cgP
	SkabS7/VTT+67JEs+0WA4eDRDW/1aYqtnx8OzauNflJn40/n3AV1IYcbf09H15f/bSQte7DLzO4
	643D+j9yrNHYVWUcgRi3vBP+OAHOKR9CQAejzjOEXVowJtbDUrfWV2Gi4UB2E99a/bbXwbz8Z4J
	EGChqCkbOVfaIctrGhwb7aK7rf7vxBzXYzsI7GY5Az/fpvFpObS77+jol6ZVgZeetFUtVIr2Bp8
	1pYxM9HiNw6Nen0EEXx6h2iBmC8+Jr+HktLLKgtA31gYVPfN2WHoEppqTWrdNewKFqoDtv9ErhJ
	3q14XlDYV3F2XYxFyq2lZwbuok6ea1FNdvWA4WBKTXOzQug==
X-Received: by 2002:a05:600c:6592:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49eb7326586mr62422885e9.9.1789561719776;
        Wed, 16 Sep 2026 05:28:39 -0700 (PDT)
X-Received: by 2002:a05:600c:6592:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49eb7326586mr62421665e9.9.1789561719193;
        Wed, 16 Sep 2026 05:28:39 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7642sm6490127f8f.5.2026.09.16.05.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:28:38 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:28:29 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Asias He <asias@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/5] vhost/vsock: Fix socket state constant
Message-ID: <aqp2w_FZlZoR2lFY@sgarzare-redhat>
References: <20260915-vsock-connect-reset-closing-v2-0-a1d9abb472f7@rbox.co>
 <20260915-vsock-connect-reset-closing-v2-1-a1d9abb472f7@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260915-vsock-connect-reset-closing-v2-1-a1d9abb472f7@rbox.co>

On Tue, Sep 15, 2026 at 03:15:12PM +0200, Michal Luczaj wrote:
>Refactor under Fixes missed one: SS_UNCONNECTED (1) -> TCP_CLOSE (7).
>Until now, sk->sk_state = 1 stood for TCP_ESTABLISHED.
>
>Fixes: 3b4477d2dcf2 ("VSOCK: use TCP state constants for sk_state")
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> drivers/vhost/vsock.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

