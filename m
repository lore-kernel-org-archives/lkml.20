Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778606;
	b=wqilLovSn8DCAF0qzrusK/kEGqxfYnArqoVvru/5qp6f9tR2x7mvQ71Yps4QwnkIT6pD
	 tpyxm3S4wMwsAdZ4usOuu2QdOGcaojm1lU6BiA05zcKssZaJZk6mvA69ARoAJFONjxmBR
	 Sb1OdA8pidaShJu/BqBplcNBc3fzuWWNTdxZeyNN9BjSzQ2n8QoTFmksxYOD1WPeI81Qi
	 j1mV8jO6NcTlmB547/1zlwp7TU8Ts+OmoWun58vbuvHnN/cQSgI9PevDmFnAhb77URAGk
	 QkqfA1fSHuIFmH0QaYpeWN341FXnXKMIEeqhXUgWmHo8U6bXW5KTGANz5W6AApcGAEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778606;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 From:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NyAwWvZGRqt2fSINn3TXW/MK3vDKgb//W9niGurTNZw=;
	b=E2GfOyEwkK19azMxkyzvZ4FyAo00spASSFk+L7MnVjU+I/nSVydbc/e4Q+JWhwnD5Xq5
	 Ok5GkWcjWwPvWPhEaHceS9VtUG17LRKLHu/o7jvW85DMHFX1NY3x0dc+LAuKi6ELyIXAO
	 H/1wKhHGo7dIzdVvuPc2Mz3ggBYIs1wSd3BQzZ6Qg6iY/aEVLbCPCccMehhwpNYrT6RTD
	 HpR+3zavw3ABsSqoifQ+gTHAfwK5xsDKHag8uCKCf/7EsH3GVphW3C3UPGCvN8874NkF/
	 WNI9L59reVaBmlikz351Feqf9f3Ej1jt8feGaJFllxExk5AZNa4wmekRNfrNkwW+GTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=At063mFx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iGp04ng9;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F6C606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F6C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=At063mFx;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iGp04ng9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793778604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NyAwWvZGRqt2fSINn3TXW/MK3vDKgb//W9niGurTNZw=;
	b=At063mFxIO5nC65EUOOEtBGxo20lft2B52+mQ9h8xkT1MGMglgkM60jTKnB8uFLGE3Lxij
	G9vSDwXd1N4pg871vo2hfIyLz3jWRWlpYcv+YOjDDrDQi5oBSlCQkR5WwNbjV3HcdqWXtu
	oMWSoQmWn5IsMzO6OATitI3mnJeteVE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177--awQepl2ObSBg5AAqkVgpw-1; Wed, 04 Nov 2026 02:50:01 -0500
X-MC-Unique: -awQepl2ObSBg5AAqkVgpw-1
X-Mimecast-MFC-AGG-ID: -awQepl2ObSBg5AAqkVgpw_1793778600
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df02b91f9so934949f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793778600; x=1794383400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyAwWvZGRqt2fSINn3TXW/MK3vDKgb//W9niGurTNZw=;
        b=iGp04ng9jOg+JXfSK9/ROWoPdb4aGCxKYduJh+qQrF/+pAGlq3STfAeqnB7Yl7WS8S
         5RFuZypuFySAx5IJjX4BBXCQtu/o/eMfnSpEkyBdxR2HzcZlAcYRYOtPyaHrJk9deivk
         CpMZ7iAf4rnxui3GHRwQ/rfDz2o742Y3p2Mi5ecDXF0AZzCgE023dXQ6oqe2m2l1UQVf
         gmGd7KehuVBjzJ9R8PjVfM55Ik2Kgop73ll6QfdoRpmUOlzNWdvlSCe/2jo/rChFx/1O
         h6XDxWHq7lilrafWtaNiJbuVlZVm0dPXwyorQw/Bn9b3L8l4fyZezHy3N5WLl65bQ/+L
         SIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778600; x=1794383400;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyAwWvZGRqt2fSINn3TXW/MK3vDKgb//W9niGurTNZw=;
        b=TTIsGMuCjPCmf/HVFG4Hshz80utYHHUlX5W8pF4vtFV7d1mWfjui0wnQuyzdH4qQU4
         NQ6yxHWS7g/2rzTjbe3W4WMx1j6V/ap1KsCHR4IeZ9kB17A2LftvK/IFG8Xt95IUV8nV
         33SoA48MMEWZ7CTK1ypx8h8HHlsUCxpBwec++AXzS3HM088boifKn9lWsQ5/Pyc3iutX
         cimtJjBLST8HKBTcFp4aOZv7jE9bJp55hXaRgnyi+abwwnrEP6VdJd8sVNb3mt/UGi4k
         JcRgs8yyaz0w2K9Jnl0796zxxVdM/AXRDeeJf3EopprGOL7dyBo7WaJeF5TSrUqkmbqG
         wZ2w==
X-Forwarded-Encrypted: i=1; AKwUvBws3ANKhXGPePp1tWMOqS5/QLMf+kyanrukhcALs2Lw2xdvRgv08YbQv+zfeXdYf+mtWpxV2kxGkbWdNUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZZyM9V7/t2qAZTxPAvTFi4YW90zdeDO3GqvASN6vUyGVs6hp3
	4EZ25i8Rym5B4t3VMndyOq4i41EmGbVz+3P1ozF45ph8tnmm+ax7OJUPA9E4BRH0138JpdMp41L
	Imz3W7Bnw6y3s4Bv5k5KyWY8Y2E3omg5tnexqQlC6X1kXQRK6UivjxfXTuMo5qJLUVg==
X-Gm-Gg: AYBFou31WoeTM3lF6Ln2l3IBPXGQy/jA9ABC3o6ZKBbeRNkUZGkCQjlPRY4k9RjzwV6
	1364aitVNObBnVQrZRkr79Iywn+ugerUKKoQTwZblxax/jQHMcIhYYYF9xTbZSyruiqHckDwcq1
	C88grz+5wp/GBQA0GiPb4Wt4IarwWD3LesD9ZnFApjJud0WB/TenITZXUlx3RKvItxAkXtHW+0E
	u4+HuSz7SskIEVsiePLn2cs1DsYip06Q6cNOPm32PJn1nokJoRznt0LckmjbGrsYBVG4UkxgLBb
	aD8ve/Shz3KiC1SLqw7amnFLmuiJAJp8DAcuoK3PV+xDFIN4uYnujtnYZdU/ldxyKwFAurlOLe7
	F719d3bu9RayVggTLSGUJ/ozam2O6qiA6USTkR3bl4dCzPt+cezchP8A0G90IUYvmyyoKbh2596
	khoovVb0J0iWoJ5AMQaA7UTexSh4VOULNriiW+zKRN5Ec=
X-Received: by 2002:a5d:584e:0:b0:48e:6669:fefb with SMTP id ffacd0b85a97d-48e6e2e2369mr36435240f8f.22.1793778600096;
        Tue, 03 Nov 2026 23:50:00 -0800 (PST)
X-Received: by 2002:a5d:584e:0:b0:48e:6669:fefb with SMTP id ffacd0b85a97d-48e6e2e2369mr36435196f8f.22.1793778599451;
        Tue, 03 Nov 2026 23:49:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda2007esm2308479f8f.47.2026.11.03.23.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:49:58 -0800 (PST)
Message-ID: <9490ec30-10db-42cc-8071-2e8cd5dc5a3b@redhat.com>
Date: Wed, 4 Nov 2026 08:49:57 +0100
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
Subject: Re: [PATCH] net: ethernet: ti: cpts: drop the refclk mux node
 reference
From: Paolo Abeni <pabeni@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <20261103102858.1340800-1-vulab@iscas.ac.cn>
 <dd92fa56-7c57-4a6e-9598-20d4363d0a66@redhat.com>
Content-Language: en-US
In-Reply-To: <dd92fa56-7c57-4a6e-9598-20d4363d0a66@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 12:23, Paolo Abeni wrote:
> On 11/3/26 11:28, Wentao Liang wrote:
>> cpts_of_mux_clk_setup() obtains refclk_np with of_get_child_by_name()
>> and only drops that reference on the error path.  of_clk_add_hw_provider()
>> takes its own reference through of_node_get(), which
>> of_clk_del_provider() releases later, so the reference taken by
>> of_get_child_by_name() is leaked when the mux clock is registered
>> successfully.
>>
>> Drop the caller's reference once the provider has been registered and
>> its devm cleanup action is in place.
>>
>> Fixes: a3047a81ba13 ("net: ethernet: ti: cpts: add support for ext rftclk selection")
>> Cc: stable@vger.kernel.org
>> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
>> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> Please have a look at:
> 
> https://elixir.bootlin.com/linux/v7.3/source/Documentation/process/maintainer-netdev.rst#L386
> 
> also please note that such limit refers to related patches within the same
> series. It's highly discouraged to have more than an handful of unrelated
> patches in-flight.
> 
> TL;DT: please stops sending new patches. Likely a very limited number of the
> one you already submitted will be processed; you will have to wait a significant
> amount of time for any new contribution.
> 
> It's not the first time you have been asked to comply with sanity limits.
> Please respect them, I really would not like to be forced to blacklist @iscas.ac.cn.
I see you ignored even the above message. I'll proceed removing
from PW all the patches you posted after my previous message.

I don't assure that the left-over will be processed.

Please do not post any other patch for 2m.

/P

