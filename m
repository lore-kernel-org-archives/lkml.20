Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558660;
	b=i4Rfz4T8kUa8IYRsS4xOTRGSqqQ0aDcpepUzHOHLacCScFWcsL/nfZpKbb4lvcBg/5fm
	 n2S3RHGS18idonTMGCzn1GY12lCSaeZ30+n6TKDzFD81o66Bn75a7+1b/TpfIeEhKPGrB
	 XRcyqHsyoStiqq4tccSDx9eN+V9bElqrcuo6FP50sInQwcswpsTyNZlvb4+RxF5p2wnSf
	 KFSO4xoRDlKmjv7wM7Fdu55Doo3cC4Th6JEh9cOQXldnP3AcdoR6Ky42XmTIzOBuoSzwq
	 dklFYJc+CV8Y+uS2vvCNMshO4I+GKAwvH7/N8Ci2YTuA5CEWIZglqcBQUGXQVp74sZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
	b=gw684AtcR1RTyQtcdu1BQAZ2LQHtxtm8zw0V5zkezMraGzVv1GNDX0WkYCREMt0tFCfA
	 DoIu6pEGDhMgDFWknfIio6QD37WxI3yRCjuSO9AjFYXC5BCFnHrT8pmBSBYZ4ZaOwdAFw
	 mKKEbXU00pBBEDXeP0BwY7pZt1wlFtE2BGLGvZZIEiUxloGEDsnehP1xLA8G7BqI3CsbI
	 HWRmJNA8sE+i4YH8Jd1hGiumIE2zsgWiZR+iqHkqv1J2HEOhY6/kOfuJ9q4iTz/5t7ZAB
	 cTY2ahnAuU77PC0OElcbErPrm4PBtgWlc8WqOZjHuMPwMwK4FVsYOM1/QUO0v1OCnEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sRaNMk2O;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455C606A885
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3455C606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sRaNMk2O
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3417095ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794558659; x=1795163459; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
        b=sRaNMk2OSk/a6aWGOqOWrMugAMmZ1cinBvSaGXXuX6T5FudhFdHlZzEHowq/jIOZ4n
         Jzw04d95113kezBuy2csxHVIWCaqzTBp5Wqjaxn+c/Pl36oVol3U8iwzvNWwqzlINMwY
         dUj5skD3W8p1FyAHmxD4xgC6UJvK3jssafyMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558659; x=1795163459;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
        b=j4Grwi4VZntBGEYokdjGP0LgPsto1kNYnxh1hrFcXx/qvnSnWQNQLNqQz9XmFX1mUQ
         fI1spT3bkg2zgYPo410+tt7fzZvZPPZ3mRiYkQYvm4zKGH1L3P9x9dFu13AJGMaiSRrx
         vdiy3ISMmkOQIY3M7rg770uGxMwhZ3LG5r1RynON1gtITna4w7PPWU4hEUWlTVCxRvkq
         jlQZel+ODj9usIBlWLMSnaoaB6+0J88O7mjO8YIbi/IBPZv8NL2+CdoJEOEOdRtUL1JI
         a87WizaGHYYj+ifLoErOCaXQM2SB55TbNgF36xU9R+MRrZY2jXFV9I/Cd79/0W1WAEj3
         sGIw==
X-Forwarded-Encrypted: i=1; AL+hErGpLB5DUcOCctvqKv9G87b1JdfYzvaRDJVxZvuNn4Qepnv3X/ThM/dFyBQ7y4POWDl8yIISfsj20U18N2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gDRL7+IR0mgHDwN2tokCytsUOr2CvAc4sJHTKj6vHntLSy7aU
	s9WyTLNpPc59eFZkobO48XYpIFf3xFbyvhYSTrBMbiZWrED2qNbNoIyQfEuOHcK6B0r9pcwCvQp
	hJFPGRiIihjRYdOY=
X-Gm-Gg: AYBFou1ZQTx7KS42XidBq/atlBBvOJUR5aPZAdCz4DLd5z4VaTB0EIsi1IXOJWbRK4o
	BNIPx7nMyDiO8lCgFpb9LyPt/WkqBkITUG9ta7/q+UxSU6kZx/hlc3+xyRLwrHFnImN7drwnZGR
	tf4LsVSaaF8NzCa5k+xFYZAHiFH7Wi+dojnj6qvQgsDyoV7ydVcmSX5gwbpDcdarV90AT8koW+8
	lO26jshU7w/eJj6n/re6LsNrGnqI94piaeyOXy6JGaqPBTygCCM0nit1VMXBUMwNvy26QJIFqSa
	JgMwNXY36gEOQfeaF/K4qNd9tu9RjQhdJCqSSeBfuQ2esVlklVk5E8z3nU1sUQ8GVobb5ROWoPJ
	0TyuweqAu9dWOvVm2lbYFlD1R2M51PG1rDFBIOI/7WEM4g0KlqiQUansVLE1HuDTacsXLxOFN2R
	Vv8wkhWR0ENVCOoEW5dGkibbqmk9HTBAQoF2JmJ5bgWZ52eicJV+szbTyy5E1ErPwBNmOMjsS+r
	NCZZCVRi1ARCJCCEj4Dq0IIHGPrZlg6t/v9gO70EFdb4qgz2dosjSqEaaXMnGe60w5ll3IO+s/S
	pKsKJq9F7EqOQSJliRcexNE7dDUmC4rysa/+aICgceFchxdVcoWtDaYXYH64sWNKFayZcozQHYv
	nbSHU8asuce00sYdA0/Cp+U+q1pIVEg+FHMnxZW4QkUoOhZajpLzUVThe9Fqq3Nxnmsw+7zD1uH
	kLzk6sxV+oz7aSsx6XBfevO3WnFPSOt0NN7o4Ld0mwhSwy3f4d9ZJe6JbzvQo=
X-Received: by 2002:a17:903:228e:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2ee0da7bf97mr17781095ad.14.1794558659559;
        Fri, 13 Nov 2026 00:30:59 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868217sm6442615ad.52.2026.11.13.00.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:30:58 -0800 (PST)
Date: Fri, 13 Nov 2026 00:30:53 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after kexec
In-Reply-To: <179443616043.2329176.17166425351392983946.b4-review@b4>
References: <cover.1794383544.git.chris@chrisdown.name> <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name> <179443616043.2329176.17166425351392983946.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003053.1c951f5a678d35e3@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pasha,

Pasha Tatashin writes:
>> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
>
>Do we really need to apply this to stable? It behaves correctly, and
>your patch performs a minor optimization by releasing a single page back
>to the system.

No, I don't think it's worth a backport, since it's only one page per boot.
I'll drop the Fixes tag in v2.

Thanks for the review!

Chris
