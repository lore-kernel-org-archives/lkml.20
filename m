Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A74A384E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264490; cv=none; b=N0kcewEuDWMo/PLNFsfqLOvw2N9OvBeozH+J0wrWG9EL4lPuujXvsXTVa5qms63y/vDUFaABFMfDWXFqbvsZMAzlnOGRb2LqJUqPFP8u8CWcduZTnUapC1syWLrDATqx9+Q5AW+InVKurtV/ju+aBPatRmRjYqq4fYldnKR9AZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264490; c=relaxed/simple;
	bh=RHgNRSvOZ3tfsNjW9H3nkua9GfCHF6/OUsrBr3E6fUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LECOlruafK6FccpxrOVS0vqwOwcXP/VLTUPao6xEODgKLEujuT0gOK+BVX3vfZEMJkHu90tLEQ4FB5LVfqU6H87xh7lwaTK8EAFGzU9lre8Zii7HhOXblnjH211UMgosgib5jlO1a3Cjkgqnk85ycWAere8gX6Fblh6e6ntQBXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB9+c90h; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB9+c90h"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so12725305e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790264482; x=1790869282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyXDYntwE85ynqtUchJX/U4vPUnBlAqyn2V6U1Pm/s0=;
        b=PB9+c90h4SjieXC5s/zNQoFveT1BgGn+f1+ocj8JPTuqTByrKGFZNeGgB0FEZL7Oer
         Y2u/TPALzMztfPtg65PZhoJ/U/LC5rA8VAb1OpAeSIdKQ/DkaginNirdyBaQoFAX5MsN
         M0KGJlfkOuBw/tTvD6Sv3DHm6qkDEW24CVyyqCpj7ZpJ35QnsZezmI4YoFKqx5xlCF9o
         w4lAHLXucX5rLe9AHD7CrYwAaD4Kz/lsQvngw2R5fx35BDS2iW/oHbgS46OhcLfluwH7
         q15xHnXAoWzQyXm9qjQQmmiUNxT3JUhHtLblW2/tSFx4rZDxbfrCD04Y4heLosquGoTf
         +o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264482; x=1790869282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyXDYntwE85ynqtUchJX/U4vPUnBlAqyn2V6U1Pm/s0=;
        b=oDIK5ppBFUGzkn8traUOGdQu7vdta6UkCNO3/p92+rm2yVmPyhAVNOAFcsVGemC5DY
         nyuF/Nn3m8leb2fw9wUjXzbuImcFzTvZqByFL60wIv16G9fhqeVrUX+O70GeRcCo6kqm
         tSys4Rv2UmlY+XYoocfYvDlKV/+An/zdD6RAGH+v6r6wm7Uf8SjPUyr0fS5M3vFEQTmF
         JgLvpnNUcJLD3W9UETJw3tZQK+Kq0ls+QPxwS4uHcWK7YjyLyBfTQf9r5RrUU2VuQwpu
         8FcdTCwvKRuStXgYJttOd5Bd/aUwgv0TSf6QSKDcqNfAbSfglC5b47LlWKhUvqgjq9+p
         YYPg==
X-Forwarded-Encrypted: i=1; AKwUvBwZDm0keCRmwhHzbuxQQ6k8OFfcRUWTiS4tnxnC9rmuAeMjDw+E2vHKd5d7FTgxSdRArMvNHf+H+fu/Z0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mawTK+dVM84Z6msBRb6OB1MKjAxr830rU5BiAan7H2C06Vpack
	48KHM1Y4g2EU+uwfeaCeVv4oJ7NskBVPARByGM/VhC+jGIhRx9eyn1O3
X-Gm-Gg: AYBFou3PbjSgTCBLnMXUMf+6NR/E6tVU+5f78bxvubJHEn6asaVU4AwsoguCUymASPN
	DESjjcEuLfxKb1sZrq+kHGf7GY4U4dPCgmCcw2xdJXXK+3R3OYxp19rTWDU3K0+zaMHQtjuVzvP
	2ZWTlzcofQFJ2QcSeTWeWVDRaoLeIh50TCQEcyruVKbK3UXkBzTDihBBuT/k8rj1OoC3TCRs9yw
	R9HY584H9DY9bmwe6TMwDJ8+43yo7A/vNYo7wTh1TyeZxsJcWHTRQn0aMPMsUM4gT2r1SIJ7tgx
	bcJfV0YQ8k1nH8bbAXc9Iwk3QFKa3APHKBY4OEAdWzb2v2XcSK3xl4XPyaK7vHiOfZvwTCYofaF
	mNZMsijEpVlgtDCu8hGcyLdFNkcHzpOdTsbBR0lxHouCZ/5XGV4oU/zJSqg3ffHScbNrVwJGjG3
	0Ir0jlMafjlCA6atZY9C8xW+dmaekkWRdYtonE3001QLALBenonCROUADNR7tjm9N1jJHIK2bGz
	iB/M3bKSeNfaCqsS6p5h/JLufu8rn7dAX6VQxCdQ1HsGPx35qh+QrcJ/TbJ02+PVTW3uMGKxlwG
	YPD4B7MVSxFh0MtDIlTYLOlJkFRUvMfVuHdf81bGA6SoINz6
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr52893095e9.7.1790264481754;
        Thu, 24 Sep 2026 08:41:21 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm90846945e9.9.2026.09.24.08.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:41:20 -0700 (PDT)
Message-ID: <f566591a-cef3-459f-a39e-86addb0c5d7e@gmail.com>
Date: Thu, 24 Sep 2026 16:41:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist
 helpers
To: Mina Almasry <almasrymina@google.com>,
 Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org,
 ilias.apalodimas@linaro.org, axboe@kernel.dk, sdf@fomichev.me,
 bobbyeshleman@meta.com, kaiyuanz@google.com, linux-kernel@vger.kernel.org,
 io-uring@vger.kernel.org
References: <20260922204348.717198-1-sdf@fomichev.me>
 <20260922204348.717198-2-sdf@fomichev.me>
 <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 16:02, Mina Almasry wrote:
> On Tue, Sep 22, 2026 at 1:43 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
>>
>> io_uring zero-copy receive and devmem both maintain a bounded LIFO for
>> net_iovs in a contiguous area. Store the freelist in struct net_iov_area
>> and provide common push and pop helpers.
>>
>> Leave synchronization to area owners. Keep devmem's area adjacent to its
> 
> This could be a follow up change, but I think synchronization should
> be provided by the netmem/niov infra, rather than the area owners. TBH
> the infra providing an unsynchronized data structure and letting the
> area owner use it and shoot themselves in the foot feels error prone.
> For now we could use a comment.

I don't think we want it. The duplication is minor, but I'm not set
on the per area index array approach, and it'd make changing it
more difficult.

> I also think we should not provide _push and_pop functions, rather we
> should provide _push_bulk() and _pop_bulk(), and the caller can decide
> to only push and pop 1 at a time if they need to. The reason is that
> in allocation paths, we almost always want to alloc in bulk. If the
> infra had the lock it could lock once and alloc a bulk.
-- 
Pavel Begunkov

