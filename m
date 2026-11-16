Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869146;
	b=zWdPW+wTn4r3jGNftbafTEHJo/fyOEe6O7WRJL1JRCIIhetJ8oTOCxkUOV/nTt/w4d86
	 SmMvKfqlhYO9PYqIJN2j/hwf1sHD/I56Xoq8Fj0ncBoLMqGg4MXk2l1s7eol2USg0TcF/
	 6ccopGra9eu60VK1hy15MQsHRJaVNGx1fljRlJXHyTsmnt0xQUjw7POSmSgTUJUVio09a
	 PyNz49TBGz307XwxQL69GXR+w0tOGOUyvSxOb3WT0laXNm6x2Zj4SG9rL3ZX7gKQcfSsR
	 Ua7LTTswzKPxhpdC3l4bvQjmJRSTFfRhPitRrfi87BfuLMsKZz/bYYDn9yQDSMN2IZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k7+WvZ0aOuqDrQLrk4s8LJ2lZixNWnQh+kPTnMGEgEw=;
	b=llCuYDJYI549eutpnpelcAYpIT8gVNcEOFsnzrBNfdr6F42FI+grUDLmV/pdWhO3P7Yi
	 CxF5LlXoR6S1BK+xWwcZZJbCpw+7pfSifoT29RHWllJDcGsQHhNSWh+fb+5n57wgYAf3s
	 DYLyt1coZTn3HZASak+jO9e/Hh/5xcBL4ZqVxlGVNZJv0LRCWVLBYU8IHmByf84B72PrO
	 VNxLKSg5FSTK2qPBd6UV5tVX8SMk8QAZgq/Am+ik6iPaMQKGFzh1RjqqMHVEIZi/fKtcb
	 IVWXdAf61+vgdhCSEhtEhnSBrluiv9Y6dZCtob9KhdcpxqDD5pvxxE8hldjrBZqPt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=R8UAr+lI;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBE606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFBE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=R8UAr+lI
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso1244317e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794869145; x=1795473945; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k7+WvZ0aOuqDrQLrk4s8LJ2lZixNWnQh+kPTnMGEgEw=;
        b=R8UAr+lI3Msl94iYtwZlUGS9fl/9Azgw9o1TvidEUDT3U/UAxHwn2iX60q7R9M3hzB
         B659tpi6WlpzrMHIvVCAfyfwG3vrOWQgsJbKCt1X/8aoUxYJ2rYtnfzYtiU0tt1IIFu4
         XklZWynE0fE+/GzJEL+WIyDmNz5KpSPmQCtBMySPYVjO2Y8u1Cjbayn1MJhu8Bl9joIn
         vIT7ITMjYAF62DxIH/awbl9GDTKJFKtJDHx70riNtyYhsx3PTuwFULfhohDVhrx46M4/
         e6QDN3p5nZtfoya9PbUwmcnaYqOS5bCtMmfBgmCo2srt2kWvSaEqRhX/DonO4tjmYXGC
         2z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869145; x=1795473945;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7+WvZ0aOuqDrQLrk4s8LJ2lZixNWnQh+kPTnMGEgEw=;
        b=YoMTKvEd6fNZWn9nErC7KUeRxHkGzeZ6V9hD0n5WBOsBagjEzLGyuz30QLkp0vd0dC
         EtnWt+tGLb5SiLCw/iEDe9Nj5dxht7EKHR4jpmvwAqW0OhO3rtpjgGAya8UcNSrZAUjS
         nhmJJf44hd7cZJoRlThnj9Vc7e5B8l+ZPAJ80oqWNJg++VW6ueHpw8FySpM29wwNIf0A
         9CZXBpZkFJw01qEDMRPuRrjlzQ9jxNoRAEnGS126igtEiGbYq/ipVsgdWw1G3adYzSRq
         FYfccaAPmkuZ/c3Kgk0Fk9O0/SjAjo26MC3hYqj4KwmDonT9GEbqtB68dhAr6QAv7VTG
         5QuQ==
X-Forwarded-Encrypted: i=1; AL+hErH8ZlOKnRecPo4J+D4N6p5v/azNzuTMMJGU9kvmTtmpYDccosMVCK3B0ybw6fSty9p9EjbUfMYVTHfdGTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8amQFInOPKdpoqur5n/1Du9tzr1zW6Or+Ew+hovvfoXruVFv6g
	pyKZvnzO8gkfJpJFEnESzgAtnQ9C1bsIevYQwNT0NvqdX0ixguiZHq7gOiAUle2VCu4=
X-Gm-Gg: AYBFou0rLSWprt/RYWdpKS1dNwsdeun6yEVnbnEpNrffBVFqRdW6EGx3mgEo2eY+Uuz
	nBYO9eoIGZpc+jWCjbF4a59/XQhMA57aR8VwNVWkLasli0HpArDEBGSy/DRIIy1H9LCk3FGOjlM
	FZ54aeop8O+ALLdyLbgJhiTv21KjTTSyLLtR0HsM0X+AjhF0PTbYHSTQvtPLDwKScRS+TvM9TO1
	P+lRT9asl2qTFW/KcPJDBVT5Umc3H/AVUi7/fDp9HIiOpTYe19ke3uw5DZEdQQJ5QOtXpvPS6iK
	GlFI2eVo3QkHml6nU0q3gqxfvnPwWoWQfMzQktNXuU+lmeneG+vm/kwzkulCad+AVmX1P9e8NF4
	uc2RHSHAHp8YGxJ13b4VHzoS7qXiPxQB26kQ7uBH0VDiBrnQefpoacmCuuTUvJ0d6CMv/Bo3ZVo
	FQC7hUyEN58p/iSD96mTcvxvTyKgZbmMlsbfipL2ctI4J2TtjTpbVe9BlA+1qp1YKD6LvKqTFPc
	uphgDzz4RgFPG5pafdyb/f7Z4ObDycYRk4m2HpvJjG7T/ATfqm2AxK3rQvGQsd+LFlE5DltAgtz
	OjwXUa9y7gw7NjLVz/ByL3LFADJgjSK/GZz0eoQNsHlPAtBGqPOx8wLGeCHDMK2y69VqI4Gq6yP
	rnw5WPdDeibPdmcti6OvbP1HS57jadeZrtiR66bECrX5dVkU=
X-Received: by 2002:a05:6122:1d45:b0:5ec:e128:2c19 with SMTP id 71dfb90a1353d-5ee34afd185mr4178359e0c.23.1794869144703;
        Mon, 16 Nov 2026 14:45:44 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e3137csm7011494e0c.3.2026.11.16.14.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:45:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 0/5] KHO map
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Alexander Graf <graf@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Tarun Sahu <tarunsahu@google.com>, David Matlack <dmatlack@google.com>, 
 Samiullah Khawaja <skhawaja@google.com>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20261116134013.1636689-1-pratyush@kernel.org>
References: <20261116134013.1636689-1-pratyush@kernel.org>
Date: Mon, 16 Nov 2026 17:45:38 -0500
Message-Id: <179486913878.127049.11178890384802388709.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2994;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=B4tBNQ1Z7VdtzwiInC3mDSvjqCs8TTj8AJu8ec5+Ftw=;
 b=kA0DAAoBu3coTNtzet4ByyZiAGr7h5ajw+EgnwLf4K1QE3Ey3wBrMuunsyLKn4FwzG4JaTR09
 IkCMwQAAQoAHRYhBEExqpPstG8a8H82Yrt3KEzbc3reBQJq+4eWAAoJELt3KEzbc3reexgP/iNJ
 9wngObtxeMjseUrGIZO+homrx001i5s30BEDOoxaOnc0JLX0k6wLSKqgU7aGykiWFCsycGxxB9b
 c29M5wS9gxdM/pcu2Xw5N70dBLhpdn9+haQci07V/zrd5lMrfphNFYZwqjlWwbiALzVcssvLiOD
 6UbaXW4F2dIngPseFhAnnXLKgfrn9J2HpO11t86+d5RTjj+UTj4pu7l8ZmzffBTZJS6uGXWkLGQ
 E7FhU0knsnp/EwrkIFEdlfVxywUvoFyZT2KmtpAFNboSsJrJmJR1W/gr2ReuSMOPwZb+36pn307
 qlchMHGrpkxxKYg8XoyuNXO4eOYHIPQiVkDGDYNoKrUYJPsuuuyn5RpSDBSpBDFbr8ZK+sPZWPu
 TZnI5Aexi2UPJFvXfvNhWNCaeUOUQMSWrbfoTaYNF534mDaCAKajs3cssYoD04PdOruWTDEOt+8
 oL3aJMyFRagxw4GQT9JZB3SLi4tQ/i1ym1rDfzxbdrAVVIbB7noxj+h+2U6Rj7W6bJUS2gnIc8k
 H3OrBYHeSS6ccJcuolC8taHqSp6qIY057JLomhydU/L2vC98fy5zipt4VeLuYl1Ty5BUAbmly34
 UZJSzl95wNhO1dpC/V5Uazz1WvnPgP/MCzzQDw/eXmunJU6ptZeKCrcSEjxNavBkmfIr08kd8Bm
 P9lPZ
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Hi,
> 
> This series introduces the KHO map. It is a sparse map from integer keys
> to u64 values. It is implemented as a radix tree of fixed depth.
> Currently the tree depth is 6, so it can support keys up to 54 bits
> wide.
> 
> The main user of the map is memfd. Currently memfd uses a vmalloc buffer
> that has a pair of {index,pfn} to track the folios in the file. That
> uses 16 bytes per page. The KHO map uses only 8 bytes per page with some
> overhead. So for a 1 GiB memfd, it uses roughly half the memory.
> 
> In addition, it is a more versatile data structure. For example, it
> allows for adding or removing pages from a memfd after preserve more
> efficiently than the vmalloc array.
> 
> Post-LPC 2026, the plan is for KHO to maintain backwards compatibility
> as much as possible. So this data structure allows the serialization
> format to be more flexible to future changes. It can also be used by the
> upcoming HugeTLB and guest_memfd preservation.
> 
> I have talked about this as "KHO xarray" before, but I think using
> "xarray" is just going to confuse everyone since it isn't really a
> xarray, and the API works a fair bit differently. So I renamed it to
> "KHO map".
> 
> This series isn't complete yet, but it is in fairly good shape so I want
> to share it to get some early feedback.
> 
> Things that are missing and planned in the future:
> 
> - Multi-index entry support: currently, while the map is very efficient
>   with 4k folios, it is horribly inefficient with 2M folios. Each folio
>   in the memfd takes up a full page to track. Multi-index entry support
>   can fix this by tracking entries that cover a whole page in the
>   previous level, similar to page tables.

Let's fix it, see below.

> 
> - LUO versioning support: LUO versioning headers are still in
>   discussion. This data structure should use them for future
>   extensibility. I am mainly waiting for things to settle down there.

I would not worry about this. If versioning lands first, this series can 
be updated then; if this series lands first, Tarun will update his 
series.

> 
> - Dynamic depth support: Currently the depth is static, so it can only
>   support keys up to 54 bits wide. Adding support for multiple depth

Let's allow keys to cover the full 64-bit space from day 1, and make 
values 63-bit (like XArray), using bit 0 to distinguish a child node 
pointer from a leaf value.

By making it generic from the beginning, we won't need to worry about 
ABI churn for these features later. Instead of caller-chosen depth, the 
tree should grow (and shrink?) dynamically bottom-up based on the widest 
key.

Plus, with bit 0 tagging leaf values, 2M entries can be stored directly 
at L1 and 1G at L2 (on 4K pages). Even for huge memfds, the pgoff space 
is much smaller than 64 bits, so in practice the tree stays tiny in 
depth.

-- 
Pasha

