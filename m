Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872296;
	b=KtrPVvZqTdXkqPH2YQNVoGBeNKog/8a/RXUK76GVDYi3PIJcHJFt/+aWrDQuj/lK/E/4
	 UjuiDBz/dPJl8sPIwlY+Ic7I4PjJcV+dKkKQUZxzQQgixYK2hDJVK811sd8l+1PbhCjl/
	 SDavvFWaUQJajQiHku908pg3BdMFdL0TstVcRlpNNFAQXagzt3VKIwHWqZrt9IKm7+k5V
	 YrJctvRok3g4Cadbi5VoCdpmOcAGY8+iO8eCoPPUV/wDsxgJPHU0slZI7qKyMzi2gHOFH
	 i+bq/U4Ol1kuwie1nzAW2n8o1YAMZHui8VnRj4Z1gaopDee////sH+vX0tlyLqeqZVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872296;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ntbAVzKKszvhnnecyjPK9p4OIP/hmO9ZcKNX919vInk=;
	b=ozd+fZechrrIuNWkK3Y/icxlZLoYG6wlMOyfmdbp73aUjOoG0J7PQisy/OVVXk3cBXzi
	 QzrfeICEIiCWyRiRPRy6aqR3m4PpZNhwmNNHOjGVgo1RJa94oxKeWHAPXjZSgZxTTJqi0
	 /izi1Vqt1MLDGQWFvzcC1h8mvc9aF+qIe4yC/NSn1PISD57tynrM7Fwl57GafwBYYb0fi
	 pC91Ndrh1jRl0qEnnu9rsYGg7Xl0r9rCHKIQENDxbo8khnZimykMrGS5bBqDG/DvWGPGO
	 0hekmUBlCsTiHZGwplWdjyESgl2MaCdqJNyxDh5LZDCornLvp88WeZB0uxpCvPytejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="hkJd/cGT";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KBxm5ORs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E8606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 891E8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkJd/cGT;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KBxm5ORs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793872294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntbAVzKKszvhnnecyjPK9p4OIP/hmO9ZcKNX919vInk=;
	b=hkJd/cGTXQf8gONRmfwGMkSqjAveIZ2oxKo788DmB8g8svaAgniC90naYOBMKiCvn1B6Mx
	raORHnBkVLr43IxM4qE0lmHX2twwUd1EAqEkjUXAnyOSMmN26WdNdZkl9g67PDisED2uJQ
	2HAvQLOv/S2WIdx9mE4acaLPG2JbjSE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-dCS6pnxIPBSr9c9Eina3ew-1; Thu, 05 Nov 2026 04:51:33 -0500
X-MC-Unique: dCS6pnxIPBSr9c9Eina3ew-1
X-Mimecast-MFC-AGG-ID: dCS6pnxIPBSr9c9Eina3ew_1793872292
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4903fc8537aso1063754f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793872292; x=1794477092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntbAVzKKszvhnnecyjPK9p4OIP/hmO9ZcKNX919vInk=;
        b=KBxm5ORsYSzevNZymCpImPIMAziH3zAdtOVBWYadIPwBFRJgSwQwekaClE4pxP0Mmr
         ZivCvjByDkgCdV/L6wa97qihOlOBJkbMqtwQjFplZTRy3dYG/pUbATZCoxxL8kyL0AcI
         SMYOGTI776enpJv6wMnbpKM/jChav7qhJF3gTxrNXxHz1QsirejANXR/Q3i/DoEBHn3M
         PnPLIeKjCj7wtAnELTw1LdJ4uqhdLLDG2ktV6BttQFmuayzXWcNZZoDrEGizbksUtsHn
         sWSJQOC2BWT1sY6henWes33721uWMTNiTsRkZ2uQGxRDkZsiSeSv2rEEpmHr3Y269WYR
         hNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872292; x=1794477092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntbAVzKKszvhnnecyjPK9p4OIP/hmO9ZcKNX919vInk=;
        b=kaK24k7X7ruWJXCgvFF2gTpbSoI2Jv2xScxhPImR+gnK2YiT4JVB0lrH2jpuZFgzLm
         Bt1EFLQVMFgojd5rsYF9bO52eIYpsZkeR1ZBuna9rPAnM3EDYgiPokL1lBCKQ+WTYXZq
         U1LWskPQ8sTRCpvHUbLj2attMDWZ8FIL6y4BNM6wWFlESFWrnlB+B5K9xgF5B0KZhggm
         oHLk5nSW8wxvd4SXzes31XZP3z0o7oD208Dpybr2Mb/0Oaww+xKVHBcaFMP7sqV4dSnV
         Hg+zjW3PSXwr0Fk2x/VDaraOYpoHwEsxhgOowfpjoJ2BZrH6GbnVHCvro++V+mImzuQZ
         PwfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy9ct7bgykyncHR8VK7bdI6h0OFoG/30jtjGIh2AL346okjZ0BsA72/DubNYVStF6f/bdi9NtFprjbWKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z97TfVl/NAKxOIaXbwnLIVKK5AwWC5C6WER4Q2z7cLj0KzmWKtk
	r4kVjj3RZlOKhjGbmQhjcIgxLewgHEtOScMuPseU+nzWHjpMJB/vTUAExyOTDjdsdF6LBTVkA9B
	ZrlZdzpIAgEYPTwtfIQ3GoPgHCd3C/KxG3tGranf64oADCNIICesoBnhUbIaMoM9x1w==
X-Gm-Gg: AYBFou0BR2LmmppZmg55Ud9Rl6tFvG/oi6mmtRCwYjLAEZAzDPKIfNuaZyQYR45oGgJ
	Mf8b3WEJoaVC99Zs5s7MNPcKeCEJVJekll5IHU/KUpQ0dpJts7ChUkDzoyyRWy9Xzy6gxkpKJSI
	5i+yYaWiv8oz76HH3WA/RMG0Yu2QGx5P8EuERoo4PKVhPbH0hjLTMFojZV+CVj9u4oR+JO76BwE
	nanj0sBkIMhV9z3GBadvqlvB/uMtaZkIIwHEcgPLGuiUa0axEB4oFwPi+425qcyfwK0dwSAozWo
	at3cCLuQOCMjMHy2PdJex5xxSnkC2iuKQX6rbkhfOrqI5WjKqd45AE2weAcQ0EilrsMIJpY3Ssf
	61xXmJM6UGUvPe8loFDwaHkuVy+DzhOy4lJzXoNVk4gYuisOBlLgmT6Om9QYhaEk0h2Qp3vPW34
	CnNX9qK67mQ+eOEDPTNqSKIWoZiM/199owzIbWZx5mSUY=
X-Received: by 2002:a05:6000:430d:b0:490:da85:7aee with SMTP id ffacd0b85a97d-490da857cbemr5409707f8f.24.1793872291987;
        Thu, 05 Nov 2026 01:51:31 -0800 (PST)
X-Received: by 2002:a05:6000:430d:b0:490:da85:7aee with SMTP id ffacd0b85a97d-490da857cbemr5409669f8f.24.1793872291556;
        Thu, 05 Nov 2026 01:51:31 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm8980486f8f.3.2026.11.05.01.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:51:31 -0800 (PST)
Message-ID: <6810d4c3-a3b9-4da5-97fe-27cfd92563c1@redhat.com>
Date: Thu, 5 Nov 2026 10:51:30 +0100
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
Subject: Re: [PATCH net-next v2 0/5] net: sparx5: add tc matchall port policer
 offload
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
 <679b8dcf-0aac-4674-a006-5af0156a82ae@redhat.com>
 <20261105093905.ln6tdot26wyej7pi@DEN-DL-M70577>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261105093905.ln6tdot26wyej7pi@DEN-DL-M70577>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 10:39, Daniel Machon wrote:
>>> This series adds offload of tc matchall filters with a police action to
>>> the ingress port policers of Sparx5 and lan969x, which are both served
>>> by the sparx5 driver.
>>>
>>> In hardware, each ingress port has four single-rate leaky bucket
>>> policers. A policer drops the frames that exceed its rate and burst.
>>> The four policers of a port share the pass and drop statistics counters
>>> of the port.
>>>
>>> The driver uses one policer per port, because with more than one, the
>>> statistics reported to tc could not be attributed to the right policer.
>>> This matches lan966x and ocelot. The policer meters each frame without
>>> preamble and inter-frame gap, so the configured rate is a data rate, as
>>> tc police expects and as on lan966x and ocelot.
>>>
>>> Since the policer meters all ingress frames on the port, only filters on
>>> chain 0 with protocol all are offloaded, and filters on shared blocks
>>> are rejected. A police action that is already offloaded as a port
>>> policer on another port is rejected too, since in software it is a
>>> single bucket for all of its users. Only drop is supported as the exceed
>>> action, and the police overhead parameter is not supported.
>>>
>>> Patch #1 drops a redundant prefix from the existing POL_UPD_INT_CFG
>>> register macros.
>>>
>>> Patch #2 adds the registers used by the port policer.
>>>
>>> Patch #3 tracks whether the ingress block of a port is shared, and adds
>>> the per-port policer state.
>>>
>>> Patch #4 adds the hardware programming of the port policer.
>>>
>>> Patch #5 adds the tc matchall offload.
>>>
>>> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
>> I understand the following will be very frustrating, but for unknown
>> reason AI review did not kick on this series.
> 
> Yes, I noticed that. I thought you maybe had some magic button you could push,
> in order to trigger the review manually.

Unfortunately, I personally don't have it. AI review is sponsored by meta,
only Jakub has direct access to that piece of the infra, and he is AFK for a bit.

>> The changes looks sane to me, and addressing points raised on v1, but
>> I think nowadays we need an explicit AI feedback.
> 
> Ack. I think the missing sashiko-nipa check is not isolated to this patchset
> alone. Just FYI.
Indeed I hit more patches/series without AI review. In some cases I can run
the model locally (for single patch, due to many constraints).

Thanks,

Paolo

