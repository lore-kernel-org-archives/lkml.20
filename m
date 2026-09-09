Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4829D270
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959738; cv=none; b=Rlf/XW/R5ZRB6WBS+Wg5qSkPgvGIMCQp4M1NgRlsWrX+jdzgiiOqd8CQsPKyZ+N0vR5aItrb/lCDwzACemvGvXnbyROKdnGumBBxMfHj1yAcaeRvCFPzgg62oVq+GeD/6uBF4vYQo1R2Gvv36nln6QRWyWkDLkNNfU4DHQziYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959738; c=relaxed/simple;
	bh=pBTt+2tfsjRssASnib2J2rZT7+ZEiIQz2KEdyia7qoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rp5Y/7FnS/c4rijC7K5jyTSKUxwjMUVyJ6nzoVps2chIKT/U6Ix8XF0eHzP8jyfg1PgywMYktBKv8Xvzk06ig3BaGFgsiT/hKRNjU3OoV6pRgLSgBopzJPmkI+rmbA9QGwYa+unZOxFgwhBhlMFFP+EKUkZXn8IkhlsnujcNFTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=b+ruaXsA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="b+ruaXsA"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c293ae2bab5so58110066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1788959735; x=1789564535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e7N5+dIQHVOx+RZXAZ44lkw8yoElIHzZtNyfLL8erQ=;
        b=b+ruaXsAjrdEEJHXW3E4zCdZJYZBL3jwNYFFmYw1+KpVfTF+z4LP8tiBhLbEar8fOC
         9kUqxCNd/3rPLVku0hFOrNKyR1MAt5N94E7v2jcBH8xf+VMv+6xnIzl+Pcm3IwnHpwPH
         tdKgduj8DPdSkPZRdqi2f1fDosYWB0QRPpBzopGc3yumU+kvPcRzsU3zlk1SFcalgIg9
         MYU13yDPIyes+b3vOWrtGlzLcua80VfydyP+a10tM6Fn78QvxBBoSQtu4ZPyQzitKjYf
         lwP8qzSj6RLXnu7+tKx86ik3NVPgSbhLIDqEOT1W/Tt128D9rQJAH4wI5KZS8HJQrjJG
         66GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959735; x=1789564535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e7N5+dIQHVOx+RZXAZ44lkw8yoElIHzZtNyfLL8erQ=;
        b=XvE0Yn1iFOaHeDm16Kj+LSP/Roy/5eDpe8s6JTchQYmwCbOUB817YkwAxr0NNH6yTH
         szfYWtk0TAbwQ7FUjHXnVj2nQ1V+6jWZTt7tnMV8zN8s4O7o/hBucZ0gpwD0VAA+tjn4
         EL/iHJJVclrpxOnLOac96ILYT9MJZDYdWejF7/DOP+JH2UW10g6eugI/jTiQrE3WKbEW
         JW6Y0myG8ueCGNh9u3JuYOcUFj417PPNk9rb+US6lEWP+Ak//VK33rQJ9i0DNxuNSsch
         j4Dc6fh06LhosmA3cFcApM+FoHsQd5+1a2CvtWpuh/pGP2CXMyawcsO33EUTF8awk625
         1XbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZc3PQFXRNuVaubUDHp7N5wN7cBsNXHdIqQHqlhccgWHchzf1ar0iygruiotYQh+O5LMPFE5/VLwtTRHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++keNW90qO0zClZfn7zxZawaKe4pFv+DWXfbUtd2Mr9khCXtIclL
	g/TvB0ItPGLk1QhS8aO/5SHibpRskmmhNEDQGOEerlknju0VoaCsGwv7Vps/d/J7Jw==
X-Gm-Gg: AYBFou0Kre/6/iOK/TeKoNXDyR8PtcqwDhhirrkE3+L7iVeQg2kUDewSAaGuILgz4aO
	m+COUzG6wQKboLtWIqM+QGH+s0wcIaolsSNGAqwV9Cip8cYKFU9lquezwhd3mfv3Al5JRvL9EjU
	12zAELoz2dHPP14yDx+2v2ep2f3YSOoWV3kWUTSsbo+bcHRCryteTmkfr2Wghsvd77gw0yvd+j4
	ei+MZ2hOZs7N+kVEsUWmuSqbToAZZpCJXr1lW+3bS/W4jjxEBbIuFpStvVCEX81iuMv8pukAf9t
	8ZyhoOu1v8Yha4BqLSmSs+U1etMU0ExYW/46vGDXLVxe0rS4zmmMXQDgUlYkUYq9it0WArt9Byl
	LFJ/qPZbE8bCWgtAwRROVoOpiXKQ9UFy+WBllyN9p8pRMCbtq9M8Ym1vFuQnl0UysV4Q/ENBDFP
	zUZPRUg4Sr2hc23HA7zMp1wjl+uuyzpQSQLL/ESShK31oqnzyL8pkcpGJ1M1gCpI1KxU0fLDkuS
	MY97eaVXdY=
X-Received: by 2002:a17:907:7216:b0:c26:3424:f7df with SMTP id a640c23a62f3a-c263424f912mr967275866b.30.1788959734749;
        Wed, 09 Sep 2026 06:15:34 -0700 (PDT)
Received: from [10.83.43.186] ([82.141.220.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa166sm761880866b.16.2026.09.09.06.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:15:33 -0700 (PDT)
Message-ID: <cce9c00c-6730-47eb-8663-f02dd795db88@arista.com>
Date: Wed, 9 Sep 2026 14:15:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] PCI: Stop waiting for link status after config read
 failure
To: Lukas Wunner <lukas@wunner.de>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Sewart <jamessewart@arista.com>
References: <20260904111318.1063858-1-yurypm@arista.com>
 <apq3kd9_qsURNpKu@wunner.de>
 <6f916404-63b5-40a3-a429-befe42a08629@arista.com>
 <apvpr5Q6gu_3MODj@wunner.de>
Content-Language: en-US
From: "Yury M." <yurypm@arista.com>
In-Reply-To: <apvpr5Q6gu_3MODj@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I sent v2 
(https://lore.kernel.org/linux-pci/20260907123853.1081635-1-yurypm@arista.com) 
of the patch for review, where I simply check pci_dev_is_disconnected().

Thanks,
Yury

On 9/5/26 11:06, Lukas Wunner wrote:
> It's repetitive because pcie_capability_read_word() already checks
> internally for pci_dev_is_disconnected():
>
>    pcie_capability_read_word()
>      pci_read_config_word()
>        pci_dev_is_disconnected()
>
> I just thought that since you specifically want to bail out in the
> hot-removal case, it might be clearer to check pci_dev_is_disconnected()
> in pcie_wait_for_link_status() before performing the config space read.
>
> But I don't feel strongly either way and checking the return value of
> pcie_capability_read_word() is a viable approach as well.
>
> Thanks,
>
> Lukas

