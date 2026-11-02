Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658658;
	b=C07t//61VEMskZe8yT+NurQH6uIOR1CtBRYK93+PR48waKQpwefMeP1NGQ3whaee7RVU
	 gqkPKAIkaeGPmf1DrEIgFz85oRJGiC7GhfZN7zYXLiShmTYlTFoK+Mipqw2D3vxM/gGRQ
	 aSbprFcNLPLK4iz0FOPwMIuUyiqZW8kjAAwi0S/qZrPfgjRJoFcTxDpK8vZHZJM+b8J2/
	 OJ/q1/WodHkWkBFf8HhAoKH0e/g+C4NNxNsm7rVnFcz5kNyoiOUcCTCZAJ04upEb4pOxc
	 9IowA5dKDFJAGH0ZquNynRF2+u9fsuqWGxgSQwp1LGz/kyeWjJjHY5x/kCd4FCymk5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658658;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WDxQB3eUyT4fTAdQ/UkaMEE2e+sF8BTRfd+4MsQN6R8=;
	b=xNCZQ3+MBcYh4BPowcC7cVyDTgkjf7DZdJz1fNzGUjt1bcCNsfD6lKXDGfc+y7mhgy4j
	 8APHfBbnfAUapQ5qzZEbnKO9p4YhSGY8KSrGSg1R47SIoX7qgY0GK0FEqHl84MLtq6ad3
	 kv41r/E81AWLJ5IkO1Kyj+k/sVLRMl+Vjm54XDSlAzWlMRi4YzIjAfipaCCk7LkVUtSP+
	 ZFd82VyQCeuQLodNOFPVAkcHpEZ1BF8g2uJQu4n0T/h7QmQEa9J6pRluGxnxDgVfkMrhM
	 venBGOYLE9TdGNFmQivxyB4wXiH2U5vrU3xikt6pV3FPPonNGk1k9ZXnTx+6N3zQUyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XZ7qjQgR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=foQiX4Mu;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E50606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E50606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XZ7qjQgR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=foQiX4Mu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793658656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDxQB3eUyT4fTAdQ/UkaMEE2e+sF8BTRfd+4MsQN6R8=;
	b=XZ7qjQgR+YtABKmJElK2WXapS7KLh2remPhcjXzqTPgMzEVuo5F6MrCmldzcBKmi/Jr/J8
	gL0h5/y7OxnIHgSojy0ABwOHRtp0JybI8DFBnQgWxKqfA/VidNcxg+E6MS5r09NMKmOD1U
	SruV+pDSjTvq+SpEY0m72LFfbKq6J6c=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-lRuRz_f7OqSAONn1CbXTTg-1; Mon, 02 Nov 2026 17:30:55 -0500
X-MC-Unique: lRuRz_f7OqSAONn1CbXTTg-1
X-Mimecast-MFC-AGG-ID: lRuRz_f7OqSAONn1CbXTTg_1793658654
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e832c03576so52878065ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793658654; x=1794263454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDxQB3eUyT4fTAdQ/UkaMEE2e+sF8BTRfd+4MsQN6R8=;
        b=foQiX4MuwPo04YFMziENIMMwzRK+cVT1Tv8y3NLE3jQvCBl/39+y2iwUmsIrPlHrBZ
         6XuOUtKdr9+NdGIIBnTQVT93iv5ITrvZ8ULzzZPBuPCQcAPXJYaBnIiugDP18K0Awrd3
         kmXwZYOH7urWxKVTFh61ME1eIvco7Mu4VwNkupUfbr0Anm7/9XP+ikME7sVJRYwiU6ei
         fLNPfLq1hAFT5hByomDMpVOQGBKvw2iKDslG88g7Kn6uVDuGMYh03Lg4TgNgQZxQWNfw
         JFipK/SfY828cynHv6hts0ylJNO+FY/i6NWv1ihVxINlGBxFd+OAI2IgQchzzrFDbTw3
         6zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658654; x=1794263454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDxQB3eUyT4fTAdQ/UkaMEE2e+sF8BTRfd+4MsQN6R8=;
        b=aP7Q3+MTyvHS7hATDvEhpJkoDG6k+SjPST1WurdXuJm5mTm4OBSA9oAux/KcrKXfCc
         kM2k66TI3Nmp3eshPVh/pF+y7LJYKxd8j8+xUHXmASeEXKJkvs/XWmQmcPFFkeXKJI2+
         27tf3aeY3wOU0T4h6PZAzfLr3KMLGiZyPwFcqD99L5+0xFKHGzvFmTsheR8h86Dea3Yo
         2ZNes4lvFMr+ujoVBPhZtBMK1i6Z0g6yacDH5znmYibXkVfRaHAs4AGZYZqyUtUF7n/U
         8RaMQMsKBJhAuOKgAMuz2pS56A89rkQvSAc1njAtiRiCN+QtOU3KokW9AEZNz7oVepfz
         L7+w==
X-Forwarded-Encrypted: i=1; AKwUvBzNuKkI7/fISEOsQik291LQtID5tXWxBZdfPO1J7WTWffI5A+jAwP0ENk3VR6xQHI5bxm/zcolXj2uLBQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rCsImQMe2SKNWfWWJJCvB5gNvMvWG/B0RPHzS1Cg/7ROWB2ej
	YAZSSxVYXPxbNtwiovQNrt2g9zX2cuv+a6Np4JwNkTlmEmYmi88vDnWzEc/OLUWn5atGcSgPS4u
	tYBrPr4Uqh5Fj7697fh5zVr+eC8LOafggt+tlsftwNo1IBoXUw3bMWo2qQ8PsdqVfLA==
X-Gm-Gg: AYBFou0n7jc/HDd5G/Qq9i3y1KGmJ+YAmVe00IrodUiJU5PDQVSUBkJyM8ZCP9sRbe3
	q5dye8h5eMapcbQfnVyvsI5416allCL3FC+nebg8IaLkXlKUGjaz4c1R4FOxYXSjLEvQCdmzKnq
	DTv9zcg5PpJJe3XihEXb4LFh1jxOcazzw+8hVK7ezdrdKO+eTSF+/+h4iJvDG0eX9CnuI00qhWz
	KKC8Uqc0QppPz88GnmTP2AR/+L+NnloBt32TEycuDSkTKt8UtkS/20IHOIaSpf4p2s3pD4tnzFQ
	A37qetfubUQ6fVEGoeN3Yk3uv+9uEwGKhFiNoZqisUhbAqIlNCbq6XwfHxLbycCI1qAUZstWrph
	CnYPv8onrlegxVnGvU9rTnVwtFoi7FePnTiLKrMOvzjCuSt0C5xv4X5VEJXVV9F8Cl5HPQS0ejz
	xHG5u6Y4XdE2gcOw==
X-Received: by 2002:a17:902:d2d0:b0:2e9:5714:6082 with SMTP id d9443c01a7336-2eb3652031emr108465495ad.55.1793658654135;
        Mon, 02 Nov 2026 14:30:54 -0800 (PST)
X-Received: by 2002:a17:902:d2d0:b0:2e9:5714:6082 with SMTP id d9443c01a7336-2eb3652031emr108465375ad.55.1793658653732;
        Mon, 02 Nov 2026 14:30:53 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm33297415ad.73.2026.11.02.14.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:30:51 -0800 (PST)
Message-ID: <5ea2dfe0-7d95-4ab6-a17e-33e3aaac38d6@redhat.com>
Date: Tue, 3 Nov 2026 08:30:46 +1000
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
Subject: Re: [PATCH] arm_mpam: avoid hour-long timeout on invalid ACPI table
 entry
To: Andre Przywara <andre.przywara@arm.com>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261102112748.3458012-1-andre.przywara@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261102112748.3458012-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 9:27 PM, Andre Przywara wrote:
> The ACPI PCCT table contains a "nominal latency" field for the expected
> maximum time it takes to handle a command in the PCC mailbox.
> The generic ACPI code reads this value, but leaves the handling to the
> protocol users.
> 
> For MPAM-Fb based MSC signalling, we use a value derived from that number
> as the mailbox timeout. However if the ACPI table leaves this entry at 0,
> the mailbox timeout code interprets this as "forever", and waits for one
> hour.
> 
> Avoid that lengthy timeout and just add one microsecond to the read value,
> to come up with a non-zero result in any case.
> 
> Found by Sashiko.
> 
> Fixes: cb351e3f304b ("arm_mpam: detect and enable MPAM-Fb PCC support")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Gavin Shan <gshan@redhat.com>

