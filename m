Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590551;
	b=qt4genuk9AMMDFYM/fPKvaIvCGg0xy3kucai/uRyvhPSNfNbs0M97nSK4YY1ffhkmXra
	 L/p1nvujjHj8waFafL0QMcG8UnAO+gv7l+pn1dHbnJLjSyJKre236uEV+8ORub5dw4GJr
	 z27TjE3DEiuD7s1bjXOVsbFokQGeZwt6vSEC+CpP6xDoaU2ajkqPT8qdzfMPqJBPKn0/s
	 V+8Ot0LmUlqzWfsZMe44jS0puENAobK5HIPjXQBVICtxhg3cFtE5iCZjXRZWJNSy6LX9G
	 kzBcc8WBAKNphwCcuFh5rG0zswvJ/6MHQ0Id4u8fZ8Z6ysBVx2ggceelIXhaNBUX9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OXfE/1W5iYUB1NrGTtPkTsDeQzVdgtifzj98ImHtgPo=;
	b=WTOZTvaVB9Lbpjy8fMOU4NREeCEqUTHtjfb4PjU3uixdpZMVc1ESePiUwyLe62CQ89gY
	 jtyIXcLYsMC41SL0mtkj4EI1yEzSe8YlOw/YJCGebfrEdHLExquoyGPvllYz1cjS5Q0x2
	 gq+Lk+BpmBgm1cWupC54zQewqHHMzJEk6q8i1kUul4hnmU67mpI84A4Q5qnZAGoY3sInm
	 /I1M1ZYN7ily8VQLpdGI0Yrf2LlcI4VMkEcfCmDGsLJCES3R1jUuOtZ+7VxFngsd3T6uV
	 +01znm5cDCcUp+gGtI82qJJp5vf2fUm+dDCAJW93u3tJe80Atv6zjFIVq06UfV62xcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjxkZf+O;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681EF6074B32
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681EF6074B32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjxkZf+O
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3155758eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590550; x=1795195350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXfE/1W5iYUB1NrGTtPkTsDeQzVdgtifzj98ImHtgPo=;
        b=fjxkZf+OCvJgyRQFlINphS3GvpNklkEUcMMifyEbajyUYfgGR2pCfZgoTsPAe0hjAN
         opijHSp8A/8EAoZumHy2iy34a2kc9kVqiTkavKjQjeurqIehnM9CkOfx81Z8oR0yX5ul
         J9tpsR6m3FHT4a9p/xAt+ZRJcodC3CjeXxhpf9FCU48HlCxCPWQjC75knoVVqu2lFIcN
         nHSzSqeeHutQy5biOw2l6oclNIlpNzW/Xl9YJQzjU9ivLVJYXXUktQN+NseViVRMAX5J
         NZhkkF6lfJOMroSC3tEqiJyfGmbFOukuvKX4idxUk3fiKCZTP5Kb2PQA+EOwg831zczn
         WIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590550; x=1795195350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXfE/1W5iYUB1NrGTtPkTsDeQzVdgtifzj98ImHtgPo=;
        b=oeoibO+xqdTY05ONXwSwL6+GZ8oaA0B61joQ3Fxb0ANKjK0Ebyi1pOgVswjfPDLSm9
         /OUQZKYlQLPYhqPEi+Ije3/gPbF7YxGHvUOUdO5hdW460FTLv6/ubTVMhnxh3xovI9px
         TxY3KSVS4O/H+Rnxlm2lC1Mntg8LLpaRSzGRGd2ifxCpuRtiY3zKFJFRZWw2Y3kmAlOb
         XNB2rlvMa7CWunIOh6uqlmIgORFBWh+47jz2e3hAYDHwEJ054ylrDVxHQrbt795Oo/B7
         fEofe70cvtpuZy6xUuxiXAwX1XGA3+ulDgioqmcrV97y3CA5cW1Vdit2bWIaKUDShNdr
         PqAg==
X-Forwarded-Encrypted: i=1; AL+hErFlPOhweNNSlHLdPhgVfx7RxAt6MvLfJbqZUAtAVzIdbO8YsKH/W/XOivRE4pOYUUlBQolpVO+/OzF6jT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qk1oWRjmI5+fVXgNtTOStrvIcz8ltyLbDl9zK629gkOwPw1Ix
	UckcvNaP86X3gKE2649pAGfjNl8p1XwjfrOVCV6CNdRvzqi56PKiiOLj
X-Gm-Gg: AYBFou1RtC+ALTNy08MTMfpbh/JjAENM0gacTJI2PxyzOayBrSx+j/VsKL9r14aGLnI
	Q5qWn12TCqcK35vaCpUAmgqdwfJdc1yNGzsjuz9aoVcpUFnDiABBmKUTZCg5XRYlrvfeTx/WfJz
	LOweFT42L8zqTuTM5+hAs9YldL9pM6tzx1JlCd2VsGkCKtUX3o56cZkYez9W5EXrf+kT0YGPcOM
	Hhs4YbfasUNDp23bEMzOR8PpdJ/zrEyYpe6w57fhXZTImNOQXRhMSFbgAiXcKQIXhtxsKpYq3Qc
	I+mnWMQTTAJgv1612lOVH+lKuzbuB6J6JySEmSBQJexawS1WpNdokvpHfoRqitB+F/y/8sYXQIr
	ee/jv1Potsh2VgfG7xBtlWadniuTbUfZk3yHcBG2bQZgdmV3DfjGNwYgjQBY2Vep7OwjHsUllzq
	n2SWeortL8p0u3TBFHcbQTr0XTkuBBVjbLPq3D0gcu4FCYGuRY3nY4DqlKH3EN1Hlzo46bGWjx8
	DbxOWj8+iIzTFgBe/W48ch8vsMSrvEt2KyyRaHjskndUEEgLveLb7zNocGXZaqmQA/4bPiv
X-Received: by 2002:a05:693c:8105:b0:36a:54a0:6b4c with SMTP id 5a478bee46e88-3796721e0femr2979743eec.25.1794590550340;
        Fri, 13 Nov 2026 09:22:30 -0800 (PST)
Received: from [192.168.0.216] ([182.48.212.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm11744319eec.19.2026.11.13.09.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:22:30 -0800 (PST)
Message-ID: <2f9cd058-c2a2-4a7f-a755-a66653a8f659@gmail.com>
Date: Fri, 13 Nov 2026 22:52:25 +0530
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
Subject: Re: [PATCH v3 0/4] openrisc: Add support for KProbes and Kretprobes
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 naveen@kernel.org, davem@davemloft.net, pjw@kernel.org,
 wangruikang@iscas.ac.cn, namcao@linutronix.de, kees@kernel.org,
 linux-openrisc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-1-sahilcdq0@gmail.com>
 <undine-1794560694824423564-2986102e2a604795@undined.local>
Content-Language: en-US
From: Sahil <sahilcdq0@gmail.com>
In-Reply-To: <undine-1794560694824423564-2986102e2a604795@undined.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Masami,

On 11/13/26 2:34 PM, Masami Hiramatsu (Google) wrote:
> Hi Sahil,
> 
> Can you update the series according to the Sashiko's comment[1]?
> 
> [1] https://sashiko.dev/#/patchset/20261026201240.107462-3-sahilcdq0%40gmail.com

Sure, I'll make those changes along with the ones suggested by Stafford.

> Also, can you check your git email settings, so that the next
> version does *NOT* reply to the previous version.
> 
> This mail has
> 
>    Message-ID: <20261026201240.107462-1-sahilcdq0@gmail.com>
>    X-Mailer: git-send-email 2.55.0
>    In-Reply-To: <20260930202744.50489-1-sahilcdq0@gmail.com>
>    References: <20260930202744.50489-1-sahilcdq0@gmail.com>
> 
> But I can not find "20260930202744.50489-1-sahilcdq0@gmail.com" in
> the LKML archive.
> 
> Also "[PATCH v3 2/4] openrisc: Add KProbes" has
> 
>    Message-ID: <20261026201240.107462-3-sahilcdq0@gmail.com>
>    X-Mailer: git-send-email 2.55.0
>    In-Reply-To: <20260930202744.50489-1-sahilcdq0@gmail.com>
>    References: <20260930202744.50489-1-sahilcdq0@gmail.com>
> 
> This should be in reply to the cover mail
> "20261026201240.107462-1-sahilcdq0@gmail.com"

Oh, that's weird. Maybe I used the wrong message-id when setting "in-reply-to"
using git-send-email. I'll send the next series such that it doesn't reply to
the previous version.

> 
> Thank you,
Thanks,
Sahil
