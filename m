Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3684A3B8BA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479416; cv=none; b=MbmR7Ae24NhLqjv2pERvBu/OFagss+lwUMvewwpxSXH3t5YDE83WJOGU8HO7NU2/aS5gSyIm/7aZ3F8tO3U1X0FY4qDKlBi0diau03OHf6Rt+TwO57eM4EmTqg4KdRhm+QCx2fNr/uRSdTC10MeeR23ZobO61D6Cqkz1iCM6WLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479416; c=relaxed/simple;
	bh=BnBs6v+SnWmcSFsMdor+R9mxm4jTxF4rgmv5gJ31rBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKRpRZRbM9nWqcESptBLZiRg/adflWFveh30dCP59AdBCKS8kcLvSUXoIqvTMNx4HlRIw36AYjO+9JFH46AtX1YTZtprOE0hd11WihDhZ1L4noXtqPHzh0KJyj9zekzmoh1r/RbI010xXsfFIfdHZJv0iG+Lw6PdsrgRxVyWYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WqJ64hh4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+uKnfpa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WqJ64hh4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+uKnfpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789479414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o7NY/1C4E5sXjTjMfgvwiOAvJ9n5lroYv/zvI5y40+U=;
	b=WqJ64hh4iRS0hIilV+KOIhu/EQpa2b4IPK5SdqB58Ce4sYB3yPApD+28zaF0jGVSpVD/8l
	Kz1VTYDXBtWGBKRFF6oab731Fh4/wBzAf1tg/36Sx3iVp/s7q/CmZUtDdaDF/7wZWb/dTX
	VluIjXwOefJbO3VWNp0s7Wq0ruYH63g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-mItTaN6TOluIIGmkZlCfPQ-1; Tue, 15 Sep 2026 09:36:52 -0400
X-MC-Unique: mItTaN6TOluIIGmkZlCfPQ-1
X-Mimecast-MFC-AGG-ID: mItTaN6TOluIIGmkZlCfPQ_1789479412
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso241983785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789479412; x=1790084212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7NY/1C4E5sXjTjMfgvwiOAvJ9n5lroYv/zvI5y40+U=;
        b=T+uKnfpamV0GORVexlx+aXwrZuB3YVRRDy1eDNScl6/Lj/3D5aQsY3LkfSo0iBp5Dh
         mMfZTlwn8KYOOWjfTkv6jvWUMgjdNIsBypgiKl83YslxlBg6nAN1XXgjmEl2XTbgBRAv
         RcnyoYBFIkBD5wBSq+YsZOKEPmKdMwxg7k2Yv28nlDSNSFAtT4nXM9QLOQ41+srSJmap
         QHwdAKVbGbWfdImm9alyNtDJJKcOCyROvcWeWvcSb1pMaqKEbOBjIrfHHKCOYnYAmlw9
         vXZgGXPlS0WKhQS5W3e1UBNYmWjvyrUXGVLBlcmQt5vWxFCnCqHiDTgHs3dcFAi5HZHO
         u0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479412; x=1790084212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7NY/1C4E5sXjTjMfgvwiOAvJ9n5lroYv/zvI5y40+U=;
        b=Pwimo60i0LJr+cZ/sVNli5yNdPIHo7k3boeR3IArVKfimed7SabUfsVVBFkuBL9OG0
         v3443SR5a6nwEI6jBRtuHrervGY/RzzbnjGMyJrWivcpUwqn8GwSi702+arTI/9dqSmq
         zz/R2GjX3rrT/d+/ScrDJTR2rcsgUjWNWBS6NEbFT6sk61+2KxYiBWsMBP/aVmXqO8QQ
         Vu9JMqbnRXORk4EcCT2x60p4q/wWge+CDNsDhNFPtd6PmdexFVTsrT5EZ0dsmYHYV1y0
         FgUhmIsTBu8y/DomPKAW+XvJDlcEI1v4Hdpcjb743QpK4W9NL6cO2/1lpEenWNnpi6cW
         jYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1H7mSaccAitSjq4r9Jn02V9Vz763vLFwcZpmD3Tv5KyA8NTYsG5AVWi+63bfXHv9Szg64x1IzOBgFofs=@vger.kernel.org
X-Gm-Message-State: AFuF++mw5itZ4bVS/r8VUslY+WLya+Inoe14h4WzxndXy8ZL1DMXw//+
	Ti2bs7GwR3VRVqSJM5Np0ZTfrY0qgCU35PSycSwX1mETxIqXvT7k928g9O3+IZgSbkCh+6VPUsT
	+4GbLIe5WqvFx5kSDpTloUuEbIJN/NxjeLfS5nDi9MEx2B9JpazwaZMwL4KOqL4DQFw==
X-Gm-Gg: AYBFou3DNeyvEEbOaLU5gqnviAp1s60jiqkumCmxmTymnWQGfGAUPU3Y8UBxGFs4Jbd
	2CJbsUUCGLdzwSP6D92YNHxesZmPgmniEGNekZPgD1tA3r5pVv0ClSuSJuzNMiGBbFPGSek50Qt
	oVnMo7CJ34GoLUmGDge+UMkdcdrEJssNcWEr0AHCctXSyOL8BgQg9+3T9LU0C7hGCyeBok+TJWG
	lb9dajbg5msY3PhR9r2eoforDvToGdeFUv8lOixGohWJSflfnk7ChfHWkIeqNwdCNB6nYGTK9ZZ
	0U+3eq/tyRj3YOjUZuQwoK4tM/3eZ5WVjzCNN7MHEPreXRttqHx4h5iNH5+nzeWVm7y1avgn2io
	pH/c5EbJn8d5xX6Ov9y8nTzKMEeaa466i5n/HFMrxmmpiCZPZYY23HIDaM4gFMCofI5JQRJ+U9Q
	==
X-Received: by 2002:a05:620a:414c:b0:939:72cb:baed with SMTP id af79cd13be357-93a34728f09mr497059485a.36.1789479412061;
        Tue, 15 Sep 2026 06:36:52 -0700 (PDT)
X-Received: by 2002:a05:620a:414c:b0:939:72cb:baed with SMTP id af79cd13be357-93a34728f09mr497053485a.36.1789479411468;
        Tue, 15 Sep 2026 06:36:51 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18628sm1258848285a.13.2026.09.15.06.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:36:50 -0700 (PDT)
Message-ID: <229fb007-8f00-455f-ab92-4d15d6b90d0f@redhat.com>
Date: Tue, 15 Sep 2026 15:36:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v10 01/14] rxrpc: Fix lack of short-send handling in
 rxrpc_kernel_send_data()
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Cc: Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Laight <david.laight.linux@gmail.com>,
 stable@vger.kernel.org
References: <20260914151340.3227501-1-dhowells@redhat.com>
 <20260914151340.3227501-2-dhowells@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260914151340.3227501-2-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 5:13 PM, David Howells wrote:
> @@ -816,15 +814,29 @@ int rxrpc_kernel_send_data(struct socket *sock, struct rxrpc_call *call,
>  	ASSERTCMP(msg->msg_name, ==, NULL);
>  	ASSERTCMP(msg->msg_control, ==, NULL);
>  
> -	mutex_lock(&call->user_mutex);
> +	for (;;) {
> +		mutex_lock(&call->user_mutex);

FTR coccinelle can't digest the lock inside the loop:

https://netdev-ctrl.bots.linux.dev/build/cocci/results/823484/stderr

but AFAICS the report is a false positive, and I can't think of an easy
way to avoid it.

/P

