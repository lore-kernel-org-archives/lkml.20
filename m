Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102061;
	b=sZa7luZBWTRIWy+Sp3qfK8v9L6GbekgYDGEN1gJuXxxNEWH2XQJZjNBk5Qhq+cEeMUes
	 ldLYeM8bH3V6TfRf85mshAT9bGiO7qJ7IjyVXDQJvCDhlYJe/YU2+SIYal1s3dVAJtmAv
	 WJOc3YWmABpyKE/KLGVeKftLmQ3N0FLhvPekSjsUW3eXDLjHd4NRH1imIwO0PqeTuo4nK
	 iHUxqBJ3cuZnNhgVfjDPxJxYXQbX0AyB2PACUWaRlwrECoM0+yjQBhZWtBs8disxaz6JF
	 xCJ5eM8t3XV8YoukC0hARX2HmEv0taV0/PyvzfaOszAFC+xaOjI1da/l2aOHzlN/ERg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102061;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RACdtXZjtylpJ4vLt4UW9KJj02FOgkoM44pU5ajByGU=;
	b=41zGc6+f7GuGvMnE2pUdw9x6+IE2PZN0J6vgRQHrXgxwzKaXRckx5uLOKuzmFgJTC9MK
	 Ck+hbayGyDE9bBwYgguuaEkQmbFsKOxrH0uALC329e3XXV9Ip7gNLwL5Nwv1076am8o8J
	 xOjmu/XTEA3bnehbklG7U48hJGwRUVqSR/pBpipV/D2vYZcl2RPIhIFazShDAwuupHbAR
	 c2p1clK7AOhBsfnTVNoI6S0RKBZIIi39cpEbgksG9CZMkKtc8bOYguCoTtEeTrck2TEdd
	 lYsNKB2Qjkg78xsXDZ1oUbDi0lsZjwj6jCfdgGbbaKQ86lLWtlDbKzc+ozPrdu2iIsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="GBoIXM/4";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pqRBtJZI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8563606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8563606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GBoIXM/4;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pqRBtJZI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793102059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RACdtXZjtylpJ4vLt4UW9KJj02FOgkoM44pU5ajByGU=;
	b=GBoIXM/4LXWSKCQ7Nu9TcblptTwxDj+rpjJP69/pCP9yp+irfceic/KCCVljM8pnNczHM4
	8poiTtiJfaW+sAVSxmZ2CRBA2ElF6lj/9yzHILTCY2bZ3L0cKvOWhVIzq2Afp3lahsCl70
	RmbLiHZstEXSFFhEMe+iXPXmYChD5No=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-6reSIGqPN3-Wh9nPMJaZBQ-1; Tue, 27 Oct 2026 07:54:18 -0400
X-MC-Unique: 6reSIGqPN3-Wh9nPMJaZBQ-1
X-Mimecast-MFC-AGG-ID: 6reSIGqPN3-Wh9nPMJaZBQ_1793102057
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b027578a4so3803901f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793102057; x=1793706857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RACdtXZjtylpJ4vLt4UW9KJj02FOgkoM44pU5ajByGU=;
        b=pqRBtJZIgeXnImGGgvTqkWzoWWbVWymVE1u4nAjoQnMzaI0TuJUR9cR70uzn3cf4GJ
         LPGIr9ItbS9r6kW5ETwXJlaEtk62PnvwMQzXJt+id8P+sfEOVAXcgouwRrYffwyEmfId
         w3yJpJf89c1Pe14RrweC9vCPTYNdgFUOPWer+XBFXG17+u2DOdyWx4q9c84YKmdFW+vM
         eq9JOXX+SlZmwxJ0nVRjnvJhP3sqGbMw0V6CeOu4En8CagrmUws5T/SLcV/a2joRIfib
         HrBRp0EQIQBa7HF01p4hkN9hXrRU0eG1N9+awNIIoJddbTRyak/R6QajrxSSwrB6Flf5
         L7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102057; x=1793706857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RACdtXZjtylpJ4vLt4UW9KJj02FOgkoM44pU5ajByGU=;
        b=dnvs2FEIw6FrRIKqazD1/Gj0StBQGkq2MrBkrAmSecbnSjSSpd76KvIA+V/qrcUdLP
         I2oS2AzB1u7EbKYhPk/W9E85EyFGrqiqSBuMOMjC11KU63MCza4Z0FAP7KncEnGOfLCF
         /vQFELxgjnKVZ81lUz31dpJkU9NfKiKJcgRSBRaWuyJbU+T1l3NMcK4QTAu8f53l79Tz
         xZVY8RVHM8c+Sjs4/nu7r8h8NifTmX3948Q/2wur6qJp1zjGR0/HQXruIUTXDhWp4db3
         tvZGOeKPRqEzjYVkITg4GklYmmVDjsumeidcmHIH9JGRG1UNAxh0GJ4TZhy7/8DGAxHJ
         cFwA==
X-Forwarded-Encrypted: i=1; AKwUvBwrNkijLmk9ZO2A5pkarqEV5RRe+9m/XaIm3ObAPkvbtNtTQZSSYV0kAYmDVVOZS2XPupf9RBrcf9hMCf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2GVEAyc3GsoagYTe8xpWj3YW9yNmg1rtjyOl/n7qaoSRC2LeH
	5EqiDgsDqTof2FsBZxTfxiiD4LxRqXyRHBO5k7bOgdj2w6G+ia2mTke6+CbK9A9H5QynXBtSPjq
	qDgZXsaxPzXL4qHLOiwTQwvsHkbLQJggnY1T29pkMCvF5PZdlW3grI8vLh5wO69SeZg==
X-Gm-Gg: AYBFou0tGuIjvunV2YIfZHwbkd98GboQVMFqZSJykburduNwQtzv57ASUlo5+qZqYYR
	P7zUfEFFewKu0RdwK7dFHi7KhVwscuW36N1+riQhW6J1wza1KymySkQC+5Ouz9tJvOOc3kvA75I
	Yi2w/m0VrRgok3fTh44mnXjz2Db/6d4abu0n/vwFj53WTwWuyA7VztbxdY74W3YggdKigkieA7I
	CxHIsFnfRZ8AdfDGRR+xDArn3HEX2S1fUgOIi7RW6LOBB4wwK5hDLzCuc2VP2dNwkk3pC//IR0Y
	lBJS11qNEgPZN6BKh4wlqU4vkayoggs61tdIPnr07qs+11l5msmnc8LiCDrLY7xRrlNjYJB90NL
	aSMrOAKhp9UCJq6YB31vpn/n0WLGtElDlM+Zs0yjs2bSCFX5XKF8JwYk7nZ0nHbaAO3Y15vYIag
	==
X-Received: by 2002:a05:600d:82c5:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4a7ca0f7e06mr48519645e9.22.1793102057257;
        Tue, 27 Oct 2026 04:54:17 -0700 (PDT)
X-Received: by 2002:a05:600d:82c5:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4a7ca0f7e06mr48519215e9.22.1793102056880;
        Tue, 27 Oct 2026 04:54:16 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm259948205e9.8.2026.10.27.04.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:54:16 -0700 (PDT)
Message-ID: <be411f93-4105-4d68-ad03-7bfe602a8cb6@redhat.com>
Date: Tue, 27 Oct 2026 12:54:15 +0100
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
Subject: Re: [PATCH net] octeontx2-af: Fix representor flow rule PF_FUNC mask
 and channel In representor mode, an AF-installed TX rule must still match on
 PF_FUNC, so do not clear the mask when rep_mode is set. Also, do not
 overwrite a channel already provided in the request when the rule comes from
 a representor device; only default to the PF/VF rx_chan_base when none is
 given.
To: kmahammadraf <kmahammadraf@marvell.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Sunil Goutham <sgoutham@marvell.com>,
 Ratheesh Kannoth <rkannoth@marvell.com>, Geetha sowjanya
 <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Aditya Thapliyal <athapliyal@marvell.com>
References: <20261021091736.2406505-1-kmahammadraf@marvell.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261021091736.2406505-1-kmahammadraf@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 11:17, kmahammadraf wrote:
> From: Aditya Thapliyal <athapliyal@marvell.com>
> 
> Fixes: 6c40ca957fe5 ("octeontx2-pf: Adds TC offload support")
> Signed-off-by: kmahammadraf <kmahammadraf@marvell.com>
> Signed-off-by: Aditya Thapliyal <athapliyal@marvell.com>
It's nice to see an hopefully human sloop, now and than :)

The commit message should not stay in the subject, and the above
SoB chain is wrong/inverted.

/P

