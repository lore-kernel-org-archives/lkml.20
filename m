Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2946EC70
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037784; cv=none; b=hs/FPdxU9thvo4ax73nx49fCOY4edahL2bKkKo2QyVsL5u0BywGfAt5omzHIej+NGQ7Nxmz0zRaZ+ndMZSjNHcgF7Qz0nOKJAL22V09VSs5NYqQUM09iPdJUsCco1Bw5+LOFSi3546jCPoHpcf6BgpOH69KSn7AttMjxvH4k45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037784; c=relaxed/simple;
	bh=RZzN/VrGO/Lcn9qkFcksdPvlKhl+S3I4NUmDeoONm8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6KSTL/dYnqx1NfremijTYLIvRT/veDWBn6QCkFbpQ4yfbAazhKN5eIFFxgvDGnkz41ZB4eRJ/pD6knRE8jnF87U6oeWg/U6lUbJYAO7WWACyM8Xeg5lfJVqZevXxl0O/9cGYAZOEAF0QTCkPyHhWY9GIKRn6a7RO9vtzNDVmZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ERxovQ/Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXNlOfKU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ERxovQ/Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXNlOfKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789037768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+kS+43ImV+1fkCyHmKwfuzV6agDs57MtzRJAv0xXyM=;
	b=ERxovQ/YeCVqi08hEgT9+Ya5BjcY03p/OQNujhIgb0PBVUEA7LO2yDsMxBZpFJOhJURZrn
	hTrkzstr3OR78+aBQsTE9jNSidS3qa9+wSJmp2PC/1F6ceo1F5HiZLHCwNl9+LdLq4Ueb4
	lefBfGZDHzl6A/L1WqkG4xIKaJHhSww=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-qtMEfDGPNjOeBq0OqoG66g-1; Thu, 10 Sep 2026 06:56:07 -0400
X-MC-Unique: qtMEfDGPNjOeBq0OqoG66g-1
X-Mimecast-MFC-AGG-ID: qtMEfDGPNjOeBq0OqoG66g_1789037766
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4858f06e142so4100804f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789037766; x=1789642566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+kS+43ImV+1fkCyHmKwfuzV6agDs57MtzRJAv0xXyM=;
        b=PXNlOfKUaYExOxWNtY1ZMuZPi8BLheCZIWYhnWWH5JLYwjlHACBf1RhSfMCLb7bz3b
         yjhZdqh1rUsTUH+pVZn3OXezBTT4ul9nru3zeGG76YKfKxkiNBzMmvGebnnqFDyBin8l
         TxjNynGh5jAPWmCsucs18F0p+chM6THZ3rqXPLR0241PQXLFq5JZvDugvPKr2sKpwg+5
         4UrtnkEwFjcl6MD0/crQrZHlLj7ZNdrd7Qc7ZWiy8mcULU5ffga/vIikvym+F1frGYrn
         ULOQX5WiD8SE+75N7oOUWTOnm630E3bh/5uJQHFBqzqFe/XvcvbKN8nF9CPBbzfUlqo8
         ROFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037766; x=1789642566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+kS+43ImV+1fkCyHmKwfuzV6agDs57MtzRJAv0xXyM=;
        b=k7I3JWl2D8BN8/C89h4kKokmFN8dvHgM2R0qhPFInSIYRctR+TAFK483rAudF5+ePQ
         teZl/bY+hXXu+6HqiY+VSMbF1lQ7gi0ahevoXkDI2rjMGbScNi4JlmH7bE3bL9D3zDjO
         lDcCKUIW7lST7Crji3dyi0X9wgHbncKB/+inn82R5jw0qjZ9pQo2W99HdG8JwqFUPzxd
         jlXw10fd7rUUY6Jd9sRGCNsHF3XGQ4bM9DekltYCG90MooB6/TlXgKfBWCO4Ap+DMHam
         obhOX6kApzkdh+pW/ZwAfX59B/QvLl693Uf1O8J3w1Sv41dothOwqX4gjA7N+aO1RJEo
         sZYw==
X-Forwarded-Encrypted: i=1; AKwUvBwb/fDOz65Z9RMmx1y9LM53oFp1t0I7WRZ6i5DinXXukpKw2DWwQQdPnz7NoIT9aR0Wy+OS/8NHn/bTDuo=@vger.kernel.org
X-Gm-Message-State: AFuF++mYIvmMvyheI3Ly8vszmVl3muf6TUBgQzxSxiNim9R7vEn+HGsh
	g3VGK6kj4Af9EIPsgzw7wGMfxF/qBMPpyShYfGyU9tE2WLYW/DJk7qAvB4/kBiOhP/47nD1O4Ve
	3wN9yeToKNGQksoZfvHRQWVoAgwzd2P9LaproI8RlmtMHU7ZIbNMS9uh6ZLIzjdAXxqnDc1F+Ww
	==
X-Gm-Gg: AYBFou3Jf4duy0D0BahUqy6mRMpqcPsW4UNP024SK0ZZFi/42+OggMyie35Dw4GG2lK
	xZ9W2ePLB0/QNn9AGDbqD8pJQxRdavA20ZqiwJL6hCrjiliULzLjzKM5JW+GEpfZ5SV6dKTTouu
	Xwtzg7eertBpzqzbIkLWEw27C6KX//gzuzw8TX1zkkYaVLDtH3EjUDNd+Ev8UxDl1kSMbDG6pxt
	PGr/z1RuZVCkJq3w3wUOcNwAZKk72ZqMl+S80071J5QrB5VL2kOISSQdTTCPJUHkB7ACN6AcBMz
	r4x+lkbTuO02PL3ahVD6VhIjww2VZnORY2GmEftp8XAZaOgLVveMQUw0NFtBDulPGfB22sLfOoT
	vpaxK4Y+q6NDjWzsrh4tVVgooUO3uK6TU2r95n1VqlFXRp1cKvO93Va+I4l6VYUPYPQtTZ2xdBQ
	==
X-Received: by 2002:a05:6000:2311:b0:485:b027:a79b with SMTP id ffacd0b85a97d-485c23ade14mr6287045f8f.21.1789037766064;
        Thu, 10 Sep 2026 03:56:06 -0700 (PDT)
X-Received: by 2002:a05:6000:2311:b0:485:b027:a79b with SMTP id ffacd0b85a97d-485c23ade14mr6287022f8f.21.1789037765706;
        Thu, 10 Sep 2026 03:56:05 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm44784660f8f.9.2026.09.10.03.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:56:05 -0700 (PDT)
Message-ID: <bb5eeef9-a78d-44c2-a8f5-2cddd274d3ab@redhat.com>
Date: Thu, 10 Sep 2026 12:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: vlan: fix vlan name truncation
To: Janis Edvarts Lacis <janislacis06@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, linux-kernel@vger.kernel.org
References: <20260904210024.263220-1-janislacis06@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260904210024.263220-1-janislacis06@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 11:00 PM, Janis Edvarts Lacis wrote:
> register_vlan_device() from net/8021q/vlan.c sets name based on a field
> name_type from struct vlan_net. If name_type is VLAN_NAME_TYPE_RAW_PLUS_VID
> or VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD, register_vlan_device() sets vlan
> device's name to the actual net_device's name and adds vid at the end of
> this name separated by a dot.
> 
> Network interface's name is limited to at most 16 characters, including NUL.
> Therefore, if the real_dev->name is long enough, then adding the vid
> at the end of this name can lead to the result exceeding 16 bytes which
> leads to a truncated name for the vlan device created in register_vlan_device().
> 
> This patch fixes the issue by returning -ENAMETOOLONG from
> register_vlan_device() if the newly created name does not fit in 16
> bytes.

I'm sorry, but I don't think we can accept this patch: this change an
user-space visible behavior: even if a strange one, existing applications
and/or setups may relay on it and they will be broken by this change.

/P

