Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777483;
	b=uhbzOvXxWJMMBmqBUI5rtYfyNWXXdyrsHd+8sfDiDDcyejZ3lYMP0n2sPTG3QqDjrz+I
	 W/i7RPRJjXIgEe6uf3Nj/kU4TqQ3aSqdES+mlhXgWQG1JMlZk2+0VgfjidyYYmeTuhoXV
	 /2Uz2DQtFQIODTzHNcOCh+HEfn60eosRN/RhjG1YdJmDwyAMFzdBpmDuocqHKGwD29LCX
	 x/IZ5BH8EP4hzRjGtiIkOtPuS1Y1KNIbJIO5i9f5/LtXwBAtdrC6HmgRhBlaz0WyX8L24
	 W4EIMEQ7n1/ZwumBoe0PJZ5wyrcw72oB7QJUY3nwQFLSSo3VVMmkFVqeHIksHjbm1Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777483;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
	b=31mgfGH4FCDS3e4oQlEs4MSmUdnJj8tCV5o6ts+HdS/5X6xbHdR/5zWsiTkUOtNeYPqB
	 Sy9Y9pAtr8prOvWS+KLDwSyz7SjfzQzEfDG9KA9Sda4p+44Kq1umKJjLczJLLSjlNVaVH
	 td5fh+sxCWxqLImb1dT3lIR5X1o7Hr44MFA+7dZgghsbH4GxuqNQ/04KKQc07mMgD5vN8
	 wLcpRDSozAPoJv5Xnmsquo9nKjFWWpMUo1NEX4USAJHVLBGNEOaG+zwKyZIb9DXDT2fc7
	 GrInDLNj/g9Xi1MD92+f/TwxiBaZFD0ZF0ScE76Xsd/GCzaDr5mK6GqnWlWxJicnJtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHveVmbM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qPyUMYEP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBA1606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBA1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHveVmbM;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qPyUMYEP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793777481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
	b=bHveVmbMboFoyV/JO0zO4CZHk0sykT/qOL2/fszQ0zblTFn2wFfP1dTCXlbULjVWuiQ6lA
	hkIAVs4LrV6RSWBM7l4BxUVp6sN22wBPRZbykFsWabZRsqW5MC/L5EyhBomu7kdPVQkQ++
	he3m5V8F58tqHZzmi38LORtin1KHjfY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-Fm9KMm0OPzOc7yZU2atncg-1; Wed, 04 Nov 2026 02:31:20 -0500
X-MC-Unique: Fm9KMm0OPzOc7yZU2atncg-1
X-Mimecast-MFC-AGG-ID: Fm9KMm0OPzOc7yZU2atncg_1793777479
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a2063be141so3763365e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793777479; x=1794382279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
        b=qPyUMYEPu6QMDw+ynFBXj+Jukdd/b7kY/MwSzggCPBbpqxVgSSKgaPVvCXHszLHMco
         DlChHW+HSdOND+z92arp08ItIKAl5SBxI6sb508qvBIMVvrx5D+CCApcPJ6w2U8LroJm
         r4b2JM0Z5YGcJCNO5bJoyhZPF2SGZUAU5HamlEA3FNIx58qghw1wsKgWyPu6gXbmqnQN
         E+gOashfTRRTa6fbRRxM9NEUCG+fzcXqMLRRTDR5xfCivw/vR7Iab+z/LJZmmRbcob58
         7nPyMK1EcwD+cvreIfJGyM9HJYnIuzgjJgn3rUsVj/grOtz2KJY44lsvT26XeYlcUWSR
         WrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777479; x=1794382279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
        b=by/O9N7IC/iMqEQAKFzH9pwDaFDJGGlCc4eVHhQG4Nr00MOV9LNJMipndGrWGXAQYM
         LrIqrYtayHzlOFEuOml37TofDJ83UxuzN+2RVnjNxhISLendCAQ7P8gMIrayj1JZfjso
         sbkMIIJNUTyY2OkniLR62wSDb8w0PX7e1Q7f0DNL16ZiD7p081z1i6ZD8MyrbgjYS83t
         aZYoZz21LJnbEiUlYOmco3fV9lt3yihWuT5Q3w6+t/1lJXRpcYRTnItveYZrHwb5Tm//
         p4wn6D+XjWZVypGVheZ+cabCtit+EBj7lD9VCUqgFdQIon7cegN2HhxbTqkCzQHyrVKC
         8sjQ==
X-Forwarded-Encrypted: i=1; AKwUvByb8Atit9XVauP6SyFGJAhxiMbJvk9+3r8DpfjCPOvgOSlHI6Enc2Ly9mG53IdBhZ7Vjl0Nf6IdjYHIKU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jv8S57ME5IlZacFUWGSCNtlvCmnIU1HHTcEVdDp4YE1JPagvr
	+QOEHl8s9JQY3xmtycsJ02zdaELfRvEohhFQfXb3rJ/QHP1jSNH+YT4OixfK0HWf84pTaPfhbHZ
	4c4qiadsu69lYj8c+bk/aEk7KYzTuDZNcAByelqWZ1FfHMq/OzFEBd45v5O3+5Vzaag==
X-Gm-Gg: AYBFou2uf2Zn6jsNzOWls6aNU8LUeAiWqM+TcL+xf61xYIu1jl7jeYceeYsWsRJ8y+G
	mzz0iiNDa0EAgsB4jAvWprEgCb3tHiBNkiSPrEBIM1S8PclwVY7DOtsoyjyVaOiuAqASrhLoivd
	DBoTfZ6EQr7EJGynMAym7WcYHG1epUXX/onPmW5IfSM2CtGUklmvkE0l4dnOpKyJhAOSEv2DvJ8
	a8wuZ72I8Mn045TOjR9Rvw42OTrpAhJxaJDEsHHF/bU52xl7/gEHxLu2k98aYztVRvIgmsxL+PC
	r/wov6Uo2wjpvDi4GBp7lhw/0tGulG41mAOnllNOrR9GPmsXHitjGOKuK4MKONrMXNbNJG0f1vP
	GH5h6PySPAZnNf5VfyMkkRUdhFYbLEUlddNLGSIKvmlK+XtXLRqYwatBi1B0DfFYgvQ7KCErugQ
	3kk3K/S51WMEnxeU/7aM6hh0FT7bJzJQPVwpS9gNcJZeE=
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr342501295e9.13.1793777479224;
        Tue, 03 Nov 2026 23:31:19 -0800 (PST)
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr342500785e9.13.1793777478812;
        Tue, 03 Nov 2026 23:31:18 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4532916f2sm29117235e9.5.2026.11.03.23.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:31:18 -0800 (PST)
Message-ID: <a323799f-a817-4022-96dd-e6f376fb4d03@redhat.com>
Date: Wed, 4 Nov 2026 08:31:17 +0100
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
Subject: Re: [PATCH net-next 1/2] netlink: add an optional per-netns ROUTE
 multicast index
To: patrick <work_patrick@qq.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, corbet@lwn.net, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104033526.2917590-1-work_patrick@qq.com>
 <tencent_1E208C03035DF063166FD46C1DA1978F6306@qq.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <tencent_1E208C03035DF063166FD46C1DA1978F6306@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 04:35, patrick wrote:
> diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> index fe43e8595..0cda347ed 100644
> --- a/Documentation/admin-guide/sysctl/net.rst
> +++ b/Documentation/admin-guide/sysctl/net.rst
> @@ -280,6 +280,33 @@ checksums.
>   These messages are now emitted at KERN_DEBUG and can generally be enabled
>   and controlled by the dynamic_debug facility.
>   
> +netlink_route_mc_index
> +---------------------

The above breaks kdoc

/P

