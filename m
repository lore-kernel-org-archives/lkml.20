Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092442;
	b=H60wZT3E1xYQVmjxx6iLUdvqvcXDKpTSuyXPisxjkyxoROVMlJm2BtG5YW6XzbMZ1ZFZ
	 LrhJPO/dqikc/Mlo196fpORvyJIlP6W7Ty0+b+ye/83BWPOetw9WcXzwv0X8mxaJdkziu
	 waS8VVeI5jT9wyXXzxi6DQQGqYz1fat/oAgns8FNPXeOLAbohcA2y4DUbbI22XhRYgQvR
	 L5LOcunzx6hHFdoYxuOO6WCLV15ZuPXa2szx+9dULOMGISk02VWP8oEsg0DW84uDM9dqV
	 dASlLBE12lGGmMAsrwEqH3iKrVXgDUfRMpGNzM7f2uJOoK0W6Wqv6NFSsW+Y56RnAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092442;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hJEIcr4Cbco2yvPZ/s/3T8+YR17zM0P3saY8Ui62mR4=;
	b=LR4mSZDShmh+XSS0VqDMl/bjIE/QzpPnfOUvhnyIxAazB3uhHGNblwa+yg/M1mL1/jSM
	 egUuhdJk5v7YO4M7sm3k7O92ySbFJ2Bzu3tX0RHXULC8rexgOla9OrMTE9adKA1m/s1fF
	 /qyUm3zcFw4VareJHPFIkA9yHMq4U8vR4hfT+dJOeeTXpE+4pQ1VkmGpITpGB5tPaunGW
	 8o/HCcX2ihZ/+AJJoMbStIapEY7R5ApM7hMcRzj2Puxw+mL+skcYMVVFDT6/5ZcZaOND7
	 Gy7s3QdnTwwEFA2Ngg+aNB56STYGOss8wcPZLJrW61NOBgFIknFdm2A3ijMRvkamaGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EK4jpZTb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pxu50o6s;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9301D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EK4jpZTb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pxu50o6s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793092440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJEIcr4Cbco2yvPZ/s/3T8+YR17zM0P3saY8Ui62mR4=;
	b=EK4jpZTb902wdaebiTvK+UlmwE7qZiaXgD6cq6O7yJrA8qBxmjLQQ8CAyxo02Yyn2pN01m
	SBFufig7c+xje/CYQ5gnXyQr2YsSypxrBF1PGT9THJw/RmuL1aNt5WTYGQyBCEc+GmAyqJ
	EOKbGIraDc2JMA+W4zr8ZZsHeNmc/Ts=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-H68LQEajOSOf0r76WM7eNg-1; Tue, 27 Oct 2026 05:13:59 -0400
X-MC-Unique: H68LQEajOSOf0r76WM7eNg-1
X-Mimecast-MFC-AGG-ID: H68LQEajOSOf0r76WM7eNg_1793092438
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso450734f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793092438; x=1793697238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJEIcr4Cbco2yvPZ/s/3T8+YR17zM0P3saY8Ui62mR4=;
        b=Pxu50o6sqI/AzD7BWfZvHPX77sFbK3EVKrvrhTLSZzfIgTLJ1hBJ+BU18pdBvFk8+k
         lAju021gHY105wHmNGkuoWj69OP8Qt2GDaQb+3tbQbRJlM3WAS10JqzDeFzoiA7uBsTq
         Z3iyCuLfkXDWjXA805K7Ih2gwKTMT/NzOYdNp05QlaaaDDGjrBeu5yWpvHjkkRfvscaY
         3GD9YK0qJEVKM64fM9HTHkrlmDn8C1yCtdNdecHRZS9CXPubDV5+dwtEx4fTNNocG0Y2
         lfK59sp67XibVc2cQP1YGA7I3ndh5zrufIlB5HQe+5RcAdGA8L5md4el5AMb9C3JfQ9w
         im3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092438; x=1793697238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJEIcr4Cbco2yvPZ/s/3T8+YR17zM0P3saY8Ui62mR4=;
        b=R/8xMeN0W9GWjVlnos/9bgggvhW1hmlS08NRfj+A4jsBTljiPjr40a1RXeQLB9GX5+
         +PXRxue8TBBNTA1iCkeYZVPm/JHunp6FYKR4WothhnbJSm73KItT9Y9yOpg0YMsvoZEF
         XMX8Qyyei9tPzdg/NayvxBNEodw7+RNNabXFuvffGL4fAt60DGoiXPTpr7ULKqVz78UL
         By9TiRad+SVO/8GUGO7bjB6yY0ZdSGDdYtFNBRs0eRrx9P/laUflXkuIhJ/cyw5ZKnCe
         oqA/hpIu7LufUk3wYXDjLHxdda0+zHREZFU0qcA3qRotquHNsr9/9DBdqeh6V9dF8bZz
         J13g==
X-Forwarded-Encrypted: i=1; AKwUvBw+RAKAxvxc1sfSesTItBj6YHktSGdrHHChzZS8bvgsAgaNK6yWQZKvuhe2VIDbcWVI3Ve5Mo83z7DV4lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKmM/eRNSB/dehDVpiosOk5UniU1Y2RGRgFtYlOQENpWXVQNcK
	/WsIna1xioA1ZR1S5qQlcYlniBUEK4+f61ilB4fnE95GiqymH4kgF3do2VvbNgoI+pSGlBr9+oO
	xhAMD92pbBnxqSQpZlfN76Fg/8gMvDPCzvHkiCE1U3y71fDIVssqW7B0DBUoRkS8fcQ==
X-Gm-Gg: AYBFou0+/bHMZhmA/MW5SMkoE9wW5l+xcGYOHtYZ25iS99wPtNG14m2yqjLd2F+XS2f
	GHEskMe3qW2TJ2+4s0eW04ntMjUXMIA9IQadF1+IfttE0N00PESU2PAW6H/3LzN6owHwiEtVRW/
	SE6dssQpd3WlFd6esG0JZhxAmHCXvnEQISCU3RzuWUeyASADpbYhtIqxxwfjuiwZ4C+6Houvaen
	r8XAsE6azEJlpEbupWeCfbibvFVjcyB+IDRyBcjmImTvIyn9h2d+AxtMFj0Ze56d8ELCvr2vHH5
	NeI4qJcicZq062OjN3aUa8J028WLPNpVyT/ucELYU3rljgRm3tS/jVm8lBSRR+auBTRhnPPAAX2
	fWUk1LvR5UsZ+Biwlnc69/rXcMMlcyighz5mnp5pu2Ne5avx08R7Sg5eW04fa+uI6So3hOmWqAg
	==
X-Received: by 2002:a5d:5081:0:b0:48e:d3f:c41f with SMTP id ffacd0b85a97d-48e55a550b8mr3720278f8f.26.1793092437943;
        Tue, 27 Oct 2026 02:13:57 -0700 (PDT)
X-Received: by 2002:a5d:5081:0:b0:48e:d3f:c41f with SMTP id ffacd0b85a97d-48e55a550b8mr3720240f8f.26.1793092437482;
        Tue, 27 Oct 2026 02:13:57 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm20919540f8f.23.2026.10.27.02.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:13:55 -0700 (PDT)
Message-ID: <1104cef2-569a-4aa5-aa43-5c42b715a7d0@redhat.com>
Date: Tue, 27 Oct 2026 10:13:53 +0100
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
Subject: Re: [PATCH net v4 3/3] netconsole: recheck device registration after
 waiting for carrier
To: gustavold@gmail.com
Cc: leitao@debian.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, stephen@networkplumber.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev-bot+sashiko@kernel.org
References: <20261021-netcons-fixes-v4-3-3857120c6340@gmail.com>
 <179293924034.3134.1271340447995228966@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179293924034.3134.1271340447995228966@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 15:40, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] The stall the commit message names is still reachable during
>    the carrier wait.
This looks legit.

/P

