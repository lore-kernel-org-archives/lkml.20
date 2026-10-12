Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB84AE8C2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822696; cv=none; b=fcjs0YFHBHEbwCHVjeRsjUnuhXszkAKzMaWTCnOZ1y7pdvVsNNiBScXKRHpHQqTbdWuzVoAhR+VlgEFx3olc8vvTnVeWhs5/UB7suS7c1p3bPCumoTvbqQXLgH2CO5HYEo70VsciMpnAmELEVGkbomfOcguDkg2Eeo3dG56PlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822696; c=relaxed/simple;
	bh=YE/cfgIkaWn4hLF79JXYi5jbj5uUcOqqXVzm0nD6Bec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOC2NDKZ7vTsUGUSpgGxWMYnF9LpOXPtRgtzaTNVEwdYif1N098jbJezQlaP6/8bnBG/NicaZrNYsKF5iTVdZwvH7J9GdR6c7zp9sZSvwK/XDFJTp5bCVhjSIDpczVLHlrDDW9gvkYwhf3gf7rYyXZpHxWZjY6qTNncPa2oLVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y9BMJ52x; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gKLb6OT7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y9BMJ52x";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gKLb6OT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791822694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gf4b89vW8YSS4mKQIDLy0PYDoLH7aFx+4KKasUNEWcQ=;
	b=Y9BMJ52xNiql1pz58g/wbhtbhCyNEPutaO40WN2hFPDpBCaPqa5i0gXfq7G1pAvngJSK80
	dNPPgjpY2U4gw7hsnRnmyb0pgrL1v0dee6f/rClkPqIh0hhtGKnIWLtJi3tLMIINiR6pkA
	LY2KYRbiDzZbsFnm33my7GtTubmT4Go=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-jph2udXdNBSpJy4TMKllVg-1; Mon, 12 Oct 2026 16:31:27 +0000
X-MC-Unique: jph2udXdNBSpJy4TMKllVg-1
X-Mimecast-MFC-AGG-ID: jph2udXdNBSpJy4TMKllVg_1791822686
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a168a8209fso19881635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791822686; x=1792427486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gf4b89vW8YSS4mKQIDLy0PYDoLH7aFx+4KKasUNEWcQ=;
        b=gKLb6OT7g6iKDaMpVlWjCDh4kCkuun6tXvu3+chruwxDoYpdBEksVhwr8PZjlYJXTX
         wpANIsj4Lptt6m/icm7zX3P8uDB/BKM/zxmF5OWNbczUp+YpZoPpgucGwHBtEy/jSKTt
         Fp2fd9q0ZQr6F6K/PLBMU+iDUOwJmhWYm5pzsbsgYq0kxTt5qLXwc3hddmdKQ8SBLn2Z
         CdFyujWWpXCnC3cLYKvgnKJEABpIOTHz26ujuUKH/hrCvaMjbkTSvSCqxHGeH+rwrY7g
         cNEZVsQGNkEPYXBIOiiJA2MQISbeJcBems7xedb/ICQa2d6gNrGhK+T2glvnrGFZ4oO7
         3Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822686; x=1792427486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gf4b89vW8YSS4mKQIDLy0PYDoLH7aFx+4KKasUNEWcQ=;
        b=GRnnS7/RSup84Vxw5kEkDs+S+WoU7muJ8tggGuAENHlIU+QHk896K1LRljVESU8Nbt
         9DA+HlJjF68BFcHI8M9ryIZgoY0yOnPycNJrwDvxPMYpnH9nNl3up9Yn15RQlysE14kM
         faBG/9qujt4RUkmPKgvIiTQKZCRKdSGgM+8/2prxy+A5LfeKtKyUvmj4XpsRYzy/Ty/n
         T4njBF2lsWgN9kA4SdJx4cjDxxKqAMnnfwpYjGkQKfZbwME1xN05ZuoaTceg3WcbYrwH
         6O2xXrObv9RRbLYQO4JUrmkXCGFisp7Dxml6T2IMGrAxdqVXX4SfCzkOsIdvv2+sTV/Y
         rDeg==
X-Forwarded-Encrypted: i=1; AKwUvBxorrso567e7aD1JrxVSODOX7FcpQsvoTE8fRS8SGRqgdCcSwmGChgGcIGelT1oFpHeAApzFFK+BxGv2Dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHNJRzgsB+uOXKeCRGtvMfbWxj51qrfSJY088lDF/dLcGvJvG6
	fGsxGYEQHYeH53/EE5HfvTiTcgRKs1MT9SNmMkeXbPpwnhZNvJKwiyZNYIYGFCbq1M2wJADc8wu
	h+3aIJVDatIt5edoOA1guJ5L8OC5IN7jiSa2jtUtkhnoo7IVtEyxzNwzF54P9VF5SPg==
X-Gm-Gg: AYBFou3hOLT4TbHnj4AxirqtGpRnTFPkN/N88Y27CEpZXlZvb7HmEnBwaF5sb4KH80w
	2eUVCTX2XwyiXylpXckuq40Bhckx7cirWjU9iwI9vRCNPk5fomFZ330KdrnMu0PbbtaBu1coW+B
	muZoInmJPe10EfJRjkh/8HJHHln/FoMEc1MN70wOOTR2N0eRg9aVUKUrcSUNSl2BUE6SbOaT+oT
	MpP2xVHEt2jZ8fINZ2K6N7QBkkQJd7vWEiK0ymp48vca56sw/a+clYXb2SAYUQOWxXVU6ng33ts
	y4tPZkYTV7d4LY7kmQo0SIksX8IYVqmxEQ+noa7/0e3X5ox5wjzOTcvpamF3twsvwRHLRmxt0/K
	JAi4//QL3MqIXMqUE8hNXNmz47drOeVwLKSvv0310v0TEim7hTNhpMi4kXxHTtNOrMg+uPv+1ZQ
	==
X-Received: by 2002:a05:600c:3c89:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a18e49105cmr187993025e9.7.1791822685803;
        Mon, 12 Oct 2026 09:31:25 -0700 (PDT)
X-Received: by 2002:a05:600c:3c89:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a18e49105cmr187992425e9.7.1791822685431;
        Mon, 12 Oct 2026 09:31:25 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm303662345e9.4.2026.10.12.09.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:31:24 -0700 (PDT)
Message-ID: <24dbe3af-8706-4369-8308-d3ad558fea71@redhat.com>
Date: Mon, 12 Oct 2026 18:31:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: Don't allow disabling napi kthread mode while
 napi instances are disabled
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, linux@armlinux.org.uk,
 kuniyu@google.com, sdf.kernel@gmail.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261006141119.85562-1-maxime.chevallier@bootlin.com>
 <179142548474.434549.4875313383372623036@kernel.org>
 <35a238ae-0e06-49a9-8539-9139aeca1a30@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <35a238ae-0e06-49a9-8539-9139aeca1a30@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 12:19, Maxime Chevallier wrote:
> On 10/8/26 04:11, netdev-bot+sashiko@kernel.org wrote:
>> Would it be better to handle disabled NAPIs in the stop path itself,
>> napi_stop_kthread() or napi_set_threaded(), rather than only guarding the
>> explicit disable branch?
> 
> Hmmm maybe yes
My personal take is that the complexity of addressing the issue for good at
the core level sounds like a good argument to fix this at the device level,
one device at the time, as needed.

Otherwise I'll probably got for the suggested path above.

Thanks,

Paolo

