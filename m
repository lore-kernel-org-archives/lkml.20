Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533495;
	b=N69ZHasS0mmmxFSzODyh9iySKftKmrAkyuhBTBtFK3EteNsn4LTZZltYWjpI824UqhUO
	 0Ae06aY+VlR/N0SuqcvCOFTz0nEr1mP4TDw1KunmzeUe2T6GY3X4HluWWzEoeMsx0su3j
	 LPkYfsZDsvydgd1c8DimB6NiWql1rNqVpkxBswNFkRRheLltZdZSTNQ3xZ/8d5cVaKoL6
	 aTSs/HyD06p4rB1+HNtdxo8CJ+RQ/rG7428BSB29Z1uydSxnkwBlXK9XaJjEylE+1uHov
	 Ug0g6dqfHdEgGjC0m8OIJUByE2mHSKUVk9gkcIfeMU1aGoy6ZBaaxsFwjweJOS5KRaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rycHbTOJK2it38YspaXZxnOqkvIv8pjnp4MzdUIJoBg=;
	b=otbU91ZNaWvJeJSd9W2k8igjMlz0Joml95X12GDLIxRO1OjXyz9C5KBkTEC51Us5Dpd2
	 +pvEuyYXql+ozeAzsgh0zPguMSFHnbuc7M+2D9VvGrIlMSagknx2ux74xVA8SJ5XCBN+v
	 la9wldyLN0fVq7F7+Ra1+yLfC39KWjFh70MZ/5o96kfUEKOHJ0gGAfE4kUoqR7GBWwEq6
	 K30bNdWhhP4cADdzuQ/+5a3tOd0l0OB9ySRPsKMgfCQc/4QYck5KVSmdVLyUMdMYh+BBy
	 u8JfRA0ktfeEnNwvtux7vBk11OJXspygrFc8KPUUaBc/xc9W3X9BsMkrqTOMQJ9/rGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IcY3TtCu;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E12606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E12606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IcY3TtCu
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9f6a16afcso22445ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794533493; x=1795138293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rycHbTOJK2it38YspaXZxnOqkvIv8pjnp4MzdUIJoBg=;
        b=IcY3TtCu5761QwGkzP5go5rX/wc//VSmZY9B9cJPZbfI9qEKb3nueho3bx5em7ukkU
         eg5rek7shDDtGkOEgibVHzkEyb7K64GyNCEVSv0VVRGesdu/+jguq2ocvMjUvWzfLSZe
         aVSzEcbmhs2Gr1C1mI5NzTFA1TQIWVNt0YrLeKpQ7t33DRLaIWeSkl8N5eMNIAAjKnCH
         SkyUj3DJYWOHF1dKiFm6WNUbiYyUyVk8/4MDrHEBorwtCUmypMzBEcxW0pnAwl/Hz3Ul
         LaY6i1sWRM/vGKd4iKlJDtUE5RvVpV+Q/39flJXF0iTgK8oDk3ygKu5lQqjJHvd/bTdX
         DYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533493; x=1795138293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rycHbTOJK2it38YspaXZxnOqkvIv8pjnp4MzdUIJoBg=;
        b=Uh2LRXZ46Am3RVgv9Mz15aFF2FPuz0V+beA08CqWz7jEwzjEOoF8l1jsn2mPclJT1/
         P1deq9j85aNl4ew0u4HMuaLXdvFMzKQ9tnJ9sqemNZqo+LBODmmjSD4adzGroHcAOQFP
         YkWPu1T5V2PYC6vVQI5ml9b7lbNzHvEFEqmJYBfZwmSkakabIVuhJLDal6aezYaKdqkH
         NIYhAbXMp0f+5V1Iu2+Ev+EpezLNFmZ9mXfw4toW10EtvibsATQvK65NUqLqnNP3UEqS
         bNRqJ0xT3AJG3nIefi9zncA+n2A2zqhvoHrU6ZRL+J8pGUsAXprjpZruufvHKFZV3Bz3
         I+Xw==
X-Forwarded-Encrypted: i=1; AL+hErGN1dGzS+/D2IhpfxTIhiJqyPEnttK6ktv1IgYpgIklFi+dyf4N+jWvdQdREoDWfVqvhdfMXPFFhuIOTME=@vger.kernel.org
X-Gm-Message-State: APuU4Z94msn1FlfYg+r+T2xkFm7Fi5H+khztuwoj1NRgqTtm1ZYJx7Te
	IJCMXhGvgvLGGoEDjKq4s9d+3scpKpunFfWXPsLmSG1F72pA8IDtWu74zP8G0HUQ4JlldGImkBS
	1t0Numg==
X-Gm-Gg: AYBFou3Hgg9vCIwBhu+x4PoLCNDQAmw2eFgCEHvwt77jJH09ZE1CS2iXXiWNggtdXjl
	l66XI4p7hgysty9Gyi8VICengD3V/2UTFTxweXhjIMQiziAXENiu6dfXx+7HSZRrreoLzrThGth
	ETIn+TAQKCrivWllanKJSRavC/grygS3n5kRSv0RKicutBlTr5lst2fjEoYkcVOwgizfyA3z0t1
	FsogIEd9omgizPHiEaRjrxLGxFzyHGfHlfjKMOOb2oJz5Nr0qa4L+zKxrsATJX009uyFwhPaPBq
	uQ4LSqzqB8+q684O40xVWRnQ2IlaU+qD2pZxXr3ghHmUwt7rqvKHBy+Zc+dwBN1+TNCmCBLRo4M
	/PKhHwCjnQ2nFv3CqOudg6cTdG7BggfbfMyPjTJTUUoSBA9sfCpPGMsrcxxyUeZYUWWWn3VHztU
	aqv0QwZ6VDMuq0pQ2aVXpKYjNzjhtcXoLRT9JThZG5ElJxZgEDMpzt5bv4H98/7y7K41tEEWCBw
	N5uJPG2g4cfBkGPoItvZVABVt4Q+VF536mghpbnLnVGv2QnowTFSS13jv//KHCZliP0wa+5yHug
	ji8DVcPNyYBGNqt1/uObAC1PFSJaUH+B4LetjJ/4SFuLgEbmuCiFep8KFkfM8pRJByXWy5CKyXt
	LVjdHKIa6rtpSc/54iA8F+A==
X-Received: by 2002:a17:902:f607:b0:2e9:7ba2:a8bb with SMTP id d9443c01a7336-2ee0f274d9fmr3031435ad.3.1794533492904;
        Thu, 12 Nov 2026 17:31:32 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2b190cfsm291532b3a.51.2026.11.12.17.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:31:31 -0800 (PST)
Date: Fri, 13 Nov 2026 01:31:29 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Ankit Soni <Ankit.Soni@amd.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Subject: Re: [PATCH v7 02/18] iommu/pages: Add APIs to
 preserve/unpreserve/restore iommu pages
Message-ID: <avZoWubpbulF3UUa@google.com>
References: <20261110040828.1774343-1-skhawaja@google.com>
 <20261110040828.1774343-3-skhawaja@google.com>
 <wirs4vcszlt6wkw2wfauhjnxve4n5ivnnpkg35fqid34htepet@fn4opgt3lt2x>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <wirs4vcszlt6wkw2wfauhjnxve4n5ivnnpkg35fqid34htepet@fn4opgt3lt2x>

On Thu, Nov 12, 2026 at 04:31:27PM +0000, Ankit Soni wrote:
>On Tue, Nov 10, 2026 at 04:08:08AM +0000, Samiullah Khawaja wrote:
>> IOMMU pages are allocated/freed using APIs using struct ioptdesc. For
>> the proper preservation and restoration of ioptdesc add helper
>> functions.
>>
>> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>
>Reviewed-by: Ankit Soni <Ankit.Soni@amd.com>
>

Thanks,
Sami
