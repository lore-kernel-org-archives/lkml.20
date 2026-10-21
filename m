Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587666;
	b=YFXSHM9NMhKTNR41wdiEhYGR3ro9qoPHvJ0YwWWz70RkqEdqKOB1bgp8ofqyPY3ZmXfF
	 9Uqc2ZO2K0EcvrDATt73aHWAIO0LVSdhrhK6IHP61l4h+C980rTm48H29S4NA00y1Q2ov
	 v0wqcpoTH0LGxi6FLJDZPP546dIfZcTSnCqb9eesAeZFW0z6gFRM1bSwENBsv5dWomh5v
	 mmFwk14Ry74cEXVZ+l5mozEydoyeCzeL0MAf/+efq/8AN8BSm9hiF7RScvmtCbJjCwzke
	 Uy13vjUZCfCXcAlCTVEdCtksK4LCtVHYtRvF7eyEssI/25nQCoeDMqCRdxDz4iVJUdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587666;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
	b=YvHaEnETz4GVRNjk2gva/2XxSKgbd5tgpr3TjE+kk4vgD4DkyDY/pHwyygNtXb7Fvp9a
	 fZiYaF57U2sqZJfN/qxmnqwp31se+12PZjeuLeH7fHUm8UZ//XCLtLViBdMtL1Fs+eoG2
	 9XiUuwTRzGUwZXbBkQmNe3QSMUiH6MVszHZ3+68vww+AqLHM92FKFjhv7CyrhKHjLH1Bl
	 05r6UxpfrNr30ZOhbGpuhDuaVF3ihflAx924vBxuBuFbxJ4o8rq08C0wjaIghypEq/BvS
	 0GKu9VWOheDsTmDN6PSp6GA+jH6iFJ6UthCp8vAApX4MzAEdkCaH8Oz/wXxCOybf6WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ozh8G6kW;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eqhbLB33;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A8606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4A8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ozh8G6kW;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eqhbLB33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792587665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
	b=Ozh8G6kWaAnPHnLAb9UZVK0rYxqSCXI0pHsO+va1Ze+R5jLpLUy7DR9UfdE2c65sX8nH3Z
	7bJN3CaKTJHUstIEE45omZTPn+kykDvkmEUE/i1PDtRmjj/GSB7jjUJiVNmpIo0lIbMJ3U
	45NJA4iF1AgCCqvQXtzbWl6W+sZuIf8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-2SC_zsxGN1KRWyUW2uFQ5w-1; Wed, 21 Oct 2026 13:01:03 +0000
X-MC-Unique: 2SC_zsxGN1KRWyUW2uFQ5w-1
X-Mimecast-MFC-AGG-ID: 2SC_zsxGN1KRWyUW2uFQ5w_1792587662
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1de9dac94so6878155e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792587662; x=1793192462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
        b=eqhbLB33SLTe8SvEB8cV7kZVJA9k2DbszVVbQlVPSTfTXwOYYhwEcVxZ1LSHbeypW+
         nnFhGnc3v5Frau+Oej69xkp0k7NrK2JqvcgjNRiRDDqLcGhFC0rvvkzjTb7K+4KPncms
         soy6KLsZH0xaZURxz6z9IuSftdvsbPJ6jHeKC7OOa2HFaj5PWzlbRNKZlD9CFCQlYHsC
         F4QPc06Q6NVmF7GI/XMv1WI2bvJ6H2lZkGtkqRFDASXAM7EdIuTv39nUCeNuu9Kz3UR4
         DoJtrLnCsZmT2IGRq1Qc9KtoNQT+O7/GC3VsLZLYOS3oH6P7B+CZRv5kynlermkmZVcB
         Fsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587662; x=1793192462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amQGH1hwIa+htL011xLiNvU/lDwW4NULLyl99/iMwB0=;
        b=hUV4OCRIZwvfPcNJJo8g1JOCAqx1Eu3oqfrsEuLDpXVG48dMBGV6nkjlEFb00QObrc
         bA8DiRMnu88vnIaOVka9L+Q0lEkbeUjl7xXlFYNfCzpoSSyX5YwOlt+wxLqEvnJ4T75B
         8qufMwXgp81BZQNc/M7NuUUUEcWbfRZ92w2izDgPM9etPjj8uO0suh3lIkcbOz7Q3aIs
         jpEze/MBrk1u9PKJIun2XJIlT0CkSBSguNY+Hp/Q1zkF/Zv1519gMamcnqRWzGRhFHlk
         +x1jlZCIxVrNKtegK0vQ6PNquXKHSErWPgCi2K9OhudQMHSOVeUW1ZrAJUS9xAiC0ki2
         wL0A==
X-Forwarded-Encrypted: i=1; AKwUvByzsvl0/xPDPHh50OdWzE5b6QS9FrjqxHu3IncGTnHZ5iDNChIs2HdUWJAsQcZ9XNgnN/wR6ATa96vDZHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG2gMwnqbGNuK5kxHo1fOmL9/96vNJ3mqnew2eQDfIYcee8nV6
	Ytp6OI6uQenkkhPwqCiqIzayVC82ZGCM9UFYiKn17cjICs40CuT69bRp1LX8FtoGrleKN2SfcKa
	ELZwkVJvmfxIB+H7Esrs9AlEWRftpWTUv++MRyO86tQFwFU9M4g31xjWQmM/anUtlSw==
X-Gm-Gg: AYBFou0fpC0LCTIP6OoMg1LeyZ9X5Z3rfJ2AXWmWdwTynpZq1rLs30EfeJFxdiPU3VQ
	xuS15YXGxqQ8nkRzSfazy6NJvjKRAiJ2cOysfDIoRTWO3TZ9eOQjLdezdZPKhbmlIzIilFXLAc9
	Iihl+c1i5YNL27bY5/MOGl2yPkUFpjlh2GYbvhA8jIPRFBrsn0ZYztGYnPgwmpmEN5XxJ8hCgb2
	D74qLLlsm9vBTaBNH+vDzzMoitLxb7ybr7IFB7aiFLafNVkaeLFs/dqGpVS35yHk581H2xoaMfl
	MP1Ft2JyOVbsoMofgsiCZW1kjZAM6MOHxu4V0Yu5COpPDwU1MK7gdqPulkOnVTG4zVrrc5xqAnN
	Lqj3ONPRvifIFELlc1EHEuyTBuAB4ZK898IhXLyoGWmf79X0d+rtsfrBFXfNQyhZeJT7+q1VFqA
	==
X-Received: by 2002:a05:600c:3b24:b0:4a1:f736:79d1 with SMTP id 5b1f17b1804b1-4a1fdb20d04mr44729115e9.16.1792587661698;
        Wed, 21 Oct 2026 06:01:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3b24:b0:4a1:f736:79d1 with SMTP id 5b1f17b1804b1-4a1fdb20d04mr44725765e9.16.1792587660186;
        Wed, 21 Oct 2026 06:01:00 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835e22sm6113081f8f.44.2026.10.21.06.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:00:59 -0700 (PDT)
Message-ID: <d6f50e2e-adcc-4d85-9be3-ff24cb8f8cc2@redhat.com>
Date: Wed, 21 Oct 2026 15:00:56 +0200
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
Subject: Re: linux-next: manual merge of the bluetooth-fixes tree with the net
 tree
To: Pablo Neira Ayuso <pablo@netfilter.org>, Mark Brown <broonie@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Liu Chao <liuc63@xiaopeng.com>, Networking <netdev@vger.kernel.org>,
 Piotr Kubik <piotr@kubik.pl>
References: <atiblfL12VddJgjU@sirena.co.uk> <atioPA8ofnC-PCGi@chamomile>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <atioPA8ofnC-PCGi@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 13:55, Pablo Neira Ayuso wrote:
> @netdev maintainers: Please, see below.
> 
> On Wed, Oct 21, 2026 at 12:01:41PM +0100, Mark Brown wrote:
>> Hi all,
>>
>> Today's linux-next merge of the bluetooth-fixes tree got a conflict in:
>>
>>    net/netfilter/nf_conntrack_netlink.c
>>
>> between commit:
>>
>>    cd37ab22a74e0 ("netfilter: nf_conntrack_netlink: fix inverted IPv6 tuple filter")
>>
>> from the net tree and commit:
>>
>>    1ae2d094b0200 ("netfilter: ctnetlink: fix inverted IPv6 address match in dump filter")
>>
>> from the bluetooth-fixes tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Sorry for this: This patch is duplicated, one variant went into
> net.git and another into net-next.git.
> 
> Two possibilities:
> 
> - Revert 1ae2d094b020 ("netfilter: ctnetlink: fix inverted IPv6
>    address match in dump filter") in net-next.git
> 
> or
> 
> - Revert cd37ab22a74e ("netfilter: nf_conntrack_netlink: fix inverted
>    IPv6 tuple filter")
> 
> before net-next.git gets merged into net.git, because these two
> patches address the same issue.
The 2 patches are equivalent, right? We pull net into net-next before
sending the net-next PR; I think the easier solution would
be manually solving the conflict at that time. I understand that accepting
either 'net' or 'net-next' variant would be ok.

/P

