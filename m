Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A647A882
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257450; cv=none; b=JsrKatURHGL2dQS/ykmWyO+XeMx4UWQ2XCxaGIyynRcka2+lOy6zl+Qt/dnN5ek6+hxw2I60o9apWoQLuX6s899F7oXprNlau/GLCDbAHa4sAEXD8E6jOVKK27/Uyn9TBTndrT9M4MUA+fLkHp//Yk1QFPiHJNkCFQQMQI87gV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257450; c=relaxed/simple;
	bh=eCiXJ0V1lD61eU/nkm8ptcqiGA2d3BIel3Y3IprKT38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faySDIS3eET5ook5osT2Pw+XnX7ecZkCSU4Jx9OJSBHogrI56uoNrQC8LjNi/6TC5Ov3P7R6KT/302zP0yxxpQ6uTOBj/V4I2juR774CKx432Z0+wfcDQwt2+0D6Sb24zoi9O/U9p22D92RKmNbTiPlYYl/El0KCIDawdQw6OSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cv0JhrJH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhGDhSlr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cv0JhrJH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhGDhSlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788257448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ACL54tT4vMHsYH0XEuJ1PQI1LaYJnFwQ29QPKJ7kRX8=;
	b=cv0JhrJH2fzSgnSfAvTgp/bwB02FqaZyqxemfX4aWMloKhNB5FbyEq7VYTa0uu9uyRlykA
	TqK4HWC4JE1R90cH9uVN1+XrZyZVDDCmm2hoW8wgdWOtKaqSy3gyQRJy264SrbR3G90wJX
	q8n0t8HAITY9NwQwfj/namn1fejfWso=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-MDfuxBI7Mrmi-sL376tPBA-1; Tue, 01 Sept 2026 06:10:37 -0400
X-MC-Unique: MDfuxBI7Mrmi-sL376tPBA-1
X-Mimecast-MFC-AGG-ID: MDfuxBI7Mrmi-sL376tPBA_1788257436
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f726186c4so2575465f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788257436; x=1788862236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACL54tT4vMHsYH0XEuJ1PQI1LaYJnFwQ29QPKJ7kRX8=;
        b=LhGDhSlrf+Er51VzBuOG21/scn3624sohXDDOfFUiVa1/0/4nCly9+hpSbS+WOfmTK
         TKZOxm7qClycm9NoirhmWjNlLVMJ0Ps/2B5jJEJ5rq6gnQij3xpc91ac8QbUPx19kRxZ
         2YFk4JtVrls6lZohSiioJoSkbDwX1JD2xzbE5tJFdr86LMIsIX1lFLlOu94QcIx7Qf/0
         FG86KvmykgXdt9q6xsKSp4VEwYdQKJUIhL5RiCSJrC1PzRggapc3D/WYtPpX8mOwckbr
         Ks/lxVC9A0410iZQaLbcUJZXRggbPMlp1A9K7tYB2H7xEHwtXI65OD7LTyOOMlQGgZVS
         f9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257436; x=1788862236;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACL54tT4vMHsYH0XEuJ1PQI1LaYJnFwQ29QPKJ7kRX8=;
        b=BMDWJBOhoWTNLGpM54F/TQ9fFio+w+ChZn6JCeDY++efhcd5rOCK0aPnWkMlLr+YBz
         zqLcJp8uY7eJ9qT3MoFRxHF6Pvj0eoce3t63rdYwrrLi+AQ3tkdJS7FERdcmR7m3lbOI
         ywlxcZ/IKtkegKWtTfTYOjpUhjWma2i4jWa67CdHE0kU1QeriqAsKc6puY6LvsWl4f5h
         lan1ccpFy4+VPGE3tDUDinX59P3+oVgLmTj3ihtY6W2FTNk9mT9FxtgdzTQDN8E2tKvU
         g6CntJ3OwZ4GcKottoehGcT1gWfFYQONNOwzCehp68Zreu95jLE4j1F+mGLV+Jitcr6n
         fwJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgt+P1sBQPnyU9MBY2YPH/XzVOk1NYRVFBSIjb89WnOAAhKt5uj5HshBKuVyzW86qla9Ioq8JpmfavghE=@vger.kernel.org
X-Gm-Message-State: AFuF++nQLlbMp3hB8aUAmBpy3Jq6WYKKoBcbufove/Hhox+rMO/ZdNKB
	AD1tUDmm88eWf5qvC0/IcWeH+s6AtkBC1i5kqAH0Q7qZzktn/iSI/y0pP0RHboBiBtQeILahSUB
	Ptyh6AzfLlxgs+T8qUkhA4qNWAiz9PNsb+Bo3R25nZ0TU5TKQFA7XQfLzDyFXfMqlKg==
X-Gm-Gg: AYBFou3b7b2wVueiaqvWxoqmh9BCYKHN2BsCuxrn7P3v5ABbt20nt7Fy1lEk30kN//q
	SfvheWvFfFVfEBK8eYlisqnGAaQIJMVCmqm1+VzykmA7nBVx3KivqGqqn/eY8BiX77W/liaT1UM
	6yxE70UkPiftMFJEi+tnXyNa+V+75w8xzTMOT0SsKKuliT1397KHyU/9pxJ+AAzPi9SCss67sIV
	4Xrw/XdGTy6u85HNBUtTZxlWE+jska56WFq8sO+Qo5Y1nMswB5/gS53EKwb7myMS9+D2H+/FtZ8
	czAcJVszGdIc10uzkNkN9MzAv7gwKfuuDdPoyESXEgD+Yh0NnSdmywUoX5GfKYYWAI0UdjV57Gi
	cXYZCNkPOSmzM3IqyU9vgauIQFfrGq/zsa2Of6MRVisjQB2rr3k6OxV7fm8Q2ElJf21cXfMgZlA
	==
X-Received: by 2002:adf:f105:0:b0:481:51b7:290b with SMTP id ffacd0b85a97d-484416aadccmr9393878f8f.14.1788257435702;
        Tue, 01 Sep 2026 03:10:35 -0700 (PDT)
X-Received: by 2002:adf:f105:0:b0:481:51b7:290b with SMTP id ffacd0b85a97d-484416aadccmr9393781f8f.14.1788257435275;
        Tue, 01 Sep 2026 03:10:35 -0700 (PDT)
Received: from [192.168.188.218] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c4absm3951169f8f.10.2026.09.01.03.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:10:33 -0700 (PDT)
Message-ID: <53a67f9a-b8a0-4967-b2c6-be4ee3a09735@redhat.com>
Date: Tue, 1 Sep 2026 12:10:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] vxlan: use one headroom snapshot for neighbour
 replies
To: Sanghyun Park <sanghyun.park.cnu@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Stevens <dlstevens@us.ibm.com>,
 linux-kernel@vger.kernel.org
References: <20260831054614.2069896-2-sanghyun.park.cnu@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260831054614.2069896-2-sanghyun.park.cnu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 7:46 AM, Sanghyun Park wrote:
> vxlan_na_create() samples LL_RESERVED_SPACE() to size the reply skb and then
> samples it again to reserve headroom. A concurrent vxlan_changelink() can
> update needed_headroom between the two reads, creating a TOCTOU race. The
> second value can exceed the allocation and make the Ethernet header write out
> of bounds.
> 
> Snapshot the headroom once and use that value for both allocation and
> reservation.
> 
> Fixes: 4b29dba9c085 ("vxlan: fix nonfunctional neigh_reduce()")
> Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
The patch LGTM, but the changelog needs some improvements: if you have
can observe a splat on the unpatched kernel, please include it,
otherwise please explain whythe issue is not just a theoretical one.
Also please specify if some LLM has been used.

Thanks,

Paolo

