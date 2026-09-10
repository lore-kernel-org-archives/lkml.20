Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690013C09EF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029298; cv=none; b=UrahnwwFXmyGNMa4mhFfADozqmbJ07r/P95PnKTTh7O/GZYP2pCudY6n6ilOVBmNobCtWe7Xj4qPlULTvxxSaSOsEEmmhPJdU3mphxCyO8+whro6DJWSW8Orr+q9275PcvRXiL6G02MFwY94l9AJdNCHRojiBst+YKo35KmvHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029298; c=relaxed/simple;
	bh=TpuLBKMPFct48AFRYHZZ24jG1FdoNN7ANXjZgpBiaUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSdDuYx/u0onB87UDchX43vtRMBSFRGsm3doERhuzcM9KKN83Ia4ShMP5DK65Tp6HrwqqKpvtzuJNrxOcFnmEE3/5Qy7fPqZ9IXfWk9zbl5e14SCAe5cmoWbGFMYqomjGADJJTz1Cq+vEC4xH54gnNBPv5JEs7SujNJQQo+5nCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aGZ9239b; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XQ1BEbSF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aGZ9239b";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XQ1BEbSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789029295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNvBbi3elEz1nStREMnqxozxYEg4vrtCAI0Kppph1j0=;
	b=aGZ9239bE6ZiSHfUmPCNSYDSArSRPR6jzRwAmasoMK98NlybIyxfXN5TpwF0RAgTDf65m/
	3+5Ucl8Fi3RYvwxe4+W1usAiQkwUpTWWDCVV2fUZqrzV9zKo5UB099Ckr6/MlNWNQbHbJw
	Mbed2bhMtJzL94J07RhskBbvcAR2/j8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-7QQZhD13PTCH57liAN7iaQ-1; Thu, 10 Sep 2026 04:34:54 -0400
X-MC-Unique: 7QQZhD13PTCH57liAN7iaQ-1
X-Mimecast-MFC-AGG-ID: 7QQZhD13PTCH57liAN7iaQ_1789029293
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so99912915e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789029293; x=1789634093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNvBbi3elEz1nStREMnqxozxYEg4vrtCAI0Kppph1j0=;
        b=XQ1BEbSFtrpicE+LpNm2KKtJGMlnjVqh2M8sqkEx6DMpCcRP6wFhYbnGizJalq85P7
         zYcQ7z3gRqIhewPlEFHNgI4h/n500pK2LvpjxGjuk7ekiYjzNDZkEsN8o6JgNWhJfSbY
         Ypn9OyeCDYGUJ6auOVgm7tdbaS159ZgTDsglVCuX/wvWuS25xqa26WaIPVhIVhzCspfs
         46dIKvGfGu7tTDIVPEW6AL5kAzGGsHi22NaZQ7SC0grtgKy5fjJx8xQMhOlRh+k+c6Ni
         v4eQ5MdIGWU5S9JJ2B5AEukpvH5qCLYIVH1k9erTf1/y+/MGwGXC73Qhm8tXF14MIR5t
         49Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029293; x=1789634093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNvBbi3elEz1nStREMnqxozxYEg4vrtCAI0Kppph1j0=;
        b=DAzAKGcefUAJw126W3o0MoruQT5/ABtzd89f7/f5bOWjLBaFmT+iXYaTtvZ8I9MNWz
         gIVkgstqMrsFZjl8DBwEg5vSHMNSrBud7LXlh1xsVx16bIrKGqtRS3YCUYCbnrrQE1LL
         TBS7tjzFV5EA459NLk9MzO6SX1MWEZIegC32L+q+oS3ru8HHkxlT2Hc6/woXS9/koWgj
         TyjCdQE+2OQR7xQz0dIiDKsBRa7BWG2naoJ9yBNdKCzDFZImxZNWIcNF9/yPdJYZQbqR
         U25GlFS9SohZIwQlKZDF9a4vzg9wyvcwEkK8KOWee2L01SmWLAm/FcM+g1Pdr8O+dS9X
         kOJw==
X-Forwarded-Encrypted: i=1; AKwUvByIJxfwev+bYKrubOFZMWayZ6GTUdQ8zBCIvzqbAh5dn0/M/4xCC9CvUTF97z6EesFxuansLG09P42qrMo=@vger.kernel.org
X-Gm-Message-State: AFuF++kkw3R1iPswyG/hcRqhpcugRvOlkEeZiX71suXx871SbEDqwJAu
	GTnT6lCcvGUEF3LPtNq2+hov3B19P9XFs4S4DGURQYyueaGt4BITh4wDD0/zXo9Dh7ZFGni3/c5
	FIQsiYolB5eGKV8WBOwgrPEOFralifDqMSLrPX0OK/l1ZhJQnnRsDcxa6EcwEmE3xeawoe60SVQ
	==
X-Gm-Gg: AYBFou0cCozqLHeS4iDW11OyGVKEzYn3yehbzD/WyxCQ6WVbEMNfQPFlBQyv5+920ze
	1tZEjnxxFfaQ2sjOhi+BeDXZTklxjeReoBKTh9GQThMPvkXRRe1PSdwoJyeExNj06aJlm9DcnL0
	A09sw1b7RmqCp8fiQZV0sZxFjeUCzW3PHAsiX8qyxMvA/+txjsIKdXJhSUViLy5nwayYayyOWTF
	2fp1jOM9L/Ib46wfZAlLTPuu0OL2PjJXVkjXTNwW7SlsskLjJbDIkp2/Jz5qyS716CmBGCAV8Mh
	ASMBUkZD4GkNMYVWLUdfpPCy1diAFI7U6eHI2QOfmTf8CATyKZQeYhajCi2v4NngYzSGQwo7X9/
	1kdgcCW+qmLLPbv9TOFgjZ8SAsVUd/scYRc2vQqL42si61LLozb0uOgYvUpc2J+0L8yZtlXGq9Q
	==
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr237638985e9.1.1789029292748;
        Thu, 10 Sep 2026 01:34:52 -0700 (PDT)
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr237638595e9.1.1789029292375;
        Thu, 10 Sep 2026 01:34:52 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm256356735e9.4.2026.09.10.01.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:34:51 -0700 (PDT)
Message-ID: <5d4ad86d-9c30-4fc7-8f4a-0ee1ce6df62d@redhat.com>
Date: Thu, 10 Sep 2026 10:34:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] octeontx2-pf: Fix autoneg reporting in ethtool
To: nshettyj@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hariprasad Kelam <hkelam@marvell.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Christina Jacob <cjacob@marvell.com>,
 Jesse Brandeburg <jbrandeb@kernel.org>
References: <20260903161117.2856633-1-nshettyj@marvell.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260903161117.2856633-1-nshettyj@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 6:11 PM, nshettyj@marvell.com wrote:
> From: Hariprasad Kelam <hkelam@marvell.com>
> 
> The driver adds the supported autoneg bit before copying the supported
> link modes. The copy clears the bit, so ethtool does not report
> supported autoneg correctly.
> 
> Add the supported autoneg bit after copying the supported link modes.
> Also add the advertised autoneg bit when firmware reports it.
> 
> Fixes: 1a50280c25ec ("octeontx2-pf: ethtool physical link status")
> Signed-off-by: Nitin Shetty J <nshettyj@marvell.com>
> Signed-off-by: Hariprasad Kelam <hkelam@marvell.com>
The SoB chain looks wrong, likely Hariprasad' SoB should come first.

Please have a look at commit c82ff94592fb68f529afe63ca7f5ddb7dae4ba83:
you are expected to reply to the LLM comments.

FTR lacking the H/W specific knowledge on your NIC, all the comments
looked valid to me, I'm setting your patches to changes requested.

/P

