Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586384;
	b=krah8JFx5LPsdzisUfUc2rBqOSB4klxADnm0HdVzcm9BRB6k6IRA6UF4Y8W2v8P2jyS6
	 PNBDe7xGkDgR2A+4iwSS8mubn1QUS17nq4nj7EK7bLYcueCtVEqCJ3+ksM3DjuU7wFFOd
	 aJvMzcSxv93Wsjg5nGn3KXBd0fLawHu8h2uP4JP1A1uqWk29ogJo1tCpNdTaRT976EaI5
	 kfoTS1Jh4MlcpTnstY7PxCSW6kA44BcGs3qTe0Gfm5PgPKjzifnf7r6ragZa33ZZqpKCV
	 55Hgxm4c3GDU6x+YFSuuycCLhMG4Ovi3azNA965Yu6dgXFr1GHiAAGHXTDfbXo2ye8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uBhj5ZT/wKvt1cB2ZHQUyu1GVRILA+V8UDZgyKlKW6A=;
	b=LsL8+5olGA7iN7WeOXIs8XWtNpl3ht+Mi34ssGJsGDaQaUgJc856u7bMlurKkLIGGu7z
	 xVdnh6N4LDOhfuVepq9mIxokpEKLcugop+aIORW7HlMBmYBykONmQAAHYuLzG+Hp+WQ+5
	 cm+kzG50xOk4kdV9O9toMaksP8mB9M1tuNF6UoOwiP8NoknZrlenJTb2xXh+oncuHc1IL
	 /d8Q0DGUPQhqGLIBtd8ytWDtANjcyAWFVGfy7MYg4NJkoLp/mgX9Eqvz1qnFA+uJPu7pI
	 NwlGC6JRvQbvHzgJ3Fc2L8HTtnn0EgHKUc240aBOV13TUxeL/Cwrj4cj3RM3UVdX6jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JQmTVlP5;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E8606C570
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39E8606C570
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JQmTVlP5
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso964745f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794586382; x=1795191182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBhj5ZT/wKvt1cB2ZHQUyu1GVRILA+V8UDZgyKlKW6A=;
        b=JQmTVlP5ZiOlcIc2zz9AksAjuPn3HqjHFW2kgua0zm1wzf4QbyCXiuiBpN+yZ7/ol8
         x+UJ7CPdzLaeTEp2lvexusQZ5FW5Dv0k+uylRLINRYqC6dXwRhepupWQh6lWVLPXmTUb
         WmtNOu2iUUxAEIn7F8WNFrmBJtChzh3sXDL1jO+s4EEsyfAzM12p6jK5W2Bi6wtFv3QC
         QcJUrLa4a+JRdYSSh9m4x/fVbaD5OLuxKGGu01Vb6BmwDmvbAwaOYIc+0SHm3gwryLfs
         aRzZvuSe0D8ixpqxbasc+kBpCgJMlPqUKj/FjajSX2CWRZb13rCJu+QrzgXEmHT5H7Ln
         UQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586382; x=1795191182;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBhj5ZT/wKvt1cB2ZHQUyu1GVRILA+V8UDZgyKlKW6A=;
        b=0rvw+fNlDbU4hJyVEPHhMEsnGUkWb756VfIi33SpHWYEZTzrwhjyelfhmZSVGAzybe
         QNTjmn116T5Zu3jd6QbhLLNFf40xECtUjmOGtwCVxo1D1HMnvmoF5+LJrOzPl1MGv5R9
         nfIwmmkJdqZ2rLEjwoHqvHegxw37gzwXKZRyoWZB/BYPvpx7ZLJdm5aICcy7qLkC3qV1
         kFkzEPlyT0WDRSEE7nJTHLWGqEawzRaRURcXiYD3PCNyeRfSW19TPuZggeiOT7nErp+c
         lxriUTO+VJ08V9r/JoUpAMgkALgANv7CfLZADkxJ2q/hHxY66AY3PBbpPIvEKDX4+Zw3
         s+Bg==
X-Forwarded-Encrypted: i=1; AL+hErGY89/p0dvqIGm5IgtSXcF8Rm/27Y9rVl3elKOtMdI7hMttSTk8YBFm7bwUclcaPSE0wRalsumQ23bh6jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z91/VH2EArGalRuQccbU9P2uw6O1oSuj1DQLCDegAh4z708kG6p
	aARgLBllMuj1gKmF+3DBepTvDtIxxnCl5Uwj4mGT40mQ7E6S6sGFpZiylgoBkraLsis=
X-Gm-Gg: AYBFou2PKZe2tzp6vWdPvPRLsdb+nPl4nam3W5smCbC+Lh0UB6BjD91XIM/jXiIGdji
	VodDphLlhKJ+pDkiHGP1Y+cPB4aTP7WtzScKypUliPa4JqTeFAooFwjvL2sJcnrvTn6k4bv06lT
	0Uo/TLNe0MKj8Zp/VX1YzIkBh1+dCqL3bZrh4rtiG8g9OE2Uo4lhJn6pnEJNGlF4qWd8DzjJM2x
	yBZz5Aon+E5PrDespjyEQzrC0YVRW8pKsILelROHRpw6K3jHSgE1sF04MBKp+8aAWm2GgRaWZBE
	8+Zzi9QNPwhz16MjquH4GoRKwrrn1XXf+qsRhf4OYIFRHeke3QUskgZYnURQVfNTAbWoBtIH7kg
	q9cechwL8AdTz4lAEAl+wrK2JPLEeVCDPlj7hs2Pp7r6hgwVNtONRoPiZthuMZVHK85u/kWkgNa
	m1Mnc9Ov1lypY95SKClgZHWOBuzwmc/YlBRRupB0503n8zT0d7Qdy2CCe0RrKc66WIWdSIUzHSZ
	rCn1nUmzclNn94OmYCFIDjw4mEk7UBWrbIHWQUwTNj1B+l8IxeUE8Elb614mJlNA4K6zprviEdW
	xnlNd2iZcYrF9ZNlTiampke9jbPAw9s/
X-Received: by 2002:a05:6000:480e:b0:493:f3f2:2255 with SMTP id ffacd0b85a97d-49c70542714mr6244595f8f.25.1794586382025;
        Fri, 13 Nov 2026 08:13:02 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm5658167f8f.41.2026.11.13.08.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:13:01 -0800 (PST)
Message-ID: <8826c56d-8fa2-407d-8362-3edd8c281cd9@suse.com>
Date: Fri, 13 Nov 2026 18:13:00 +0200
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
Subject: Re: [PATCH v5 5/6] x86/virt/tdx: Make TDX module initialize the
 extensions
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dave.hansen@intel.com,
 kvm@vger.kernel.org, yilun.xu@intel.com, xiaoyao.li@intel.com,
 sohil.mehta@intel.com, adrian.hunter@intel.com, kishen.maloor@intel.com,
 tony.lindgren@linux.intel.com, peter.fang@intel.com,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, chao.gao@intel.com,
 artem.bityutskiy@linux.intel.com
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
 <20261111-tdx-module-ext-v5-5-c74f764abc3d@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261111-tdx-module-ext-v5-5-c74f764abc3d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11.11.26 г. 5:48 ч., Xu Yilun wrote:
> Continue fleshing out the extension initialization process. At this
> point the kernel has provided all memory and the TDX module is ready to
> initialize the extensions on the memory.
> 
> Initialize TDX module extensions via TDH.EXT.INIT. This process takes on
> the order of 100's of milliseconds, during which the TDX module loads
> its internal extension image into this memory and builds the execution
> environment. Once initialized, those add-on features can use their
> SEAMCALL leafs normally.
> 
> Note that TDH.EXT.INIT builds all configured extensions. The SEAMCALL
> leaf fails if any extension fails to initialize. The kernel does simple
> error handling - just fails the whole TDX initialization on any error.
> This is OK cause all extensions are considered necessary for security.
> If a nice-to-have extension appears in the future, this can be
> revisited. A potential solution is to have a new metadata field
> indicating which extensions get enabled/failed, then the kernel decides
> whether to continue or abort.
> 
> The original changelog was written by hand. AI was used to help correct
> grammatical errors and polish individual sentences for better
> readability.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
