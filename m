Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AD1F1932
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302334; cv=none; b=RwGPTla1t0FqVLPXfQ4MfmGc4cATtUHV8fmclX+eODVonPXNfers4PYVz5E5EKI8y7qXxqFZ2S3WSQIlBjx5pbUpuKstsJLvoAVovGxgKLk6EhcUqowiOfl4t4ATlPcFs7Q14zSbSOfBiQ1VCW6v5MgjKT0jV/b2zRLomtnqxqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302334; c=relaxed/simple;
	bh=4x/0XseeDjvJa6YugPIA5WIWLzXeYXN51PeDC+hhwnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbPJhMd9z3tWPfE4ftniDtnYSNMLJP7DC7wbSM4znW0i8rMwmQ6DJSW+fn9NtFJUlI2a27y48BUp5Oq3ZBJlIaICo0CgxATrlhCO8tav28AvzaYQAri0e6ln1TyYRmxqO/ZPF5prMrG4O7Tgy0V7ho06shXvZ9WVWadmf69oj5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3Si/ddR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3Si/ddR"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so471354a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302333; x=1788907133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8BquFNcVW0STtY5GXcO9BwLTcWYfKj9vChUh9QODYI=;
        b=o3Si/ddR8e2/qMcNVylVPbfO6Aq9ZVNQWllVYENxKdV5yk+zcpkSJ4wLKT1cB+l/1C
         kZLJ66nsOPJRuJHSB/g3hsmSeHRSRfOPBOx+F9v3KyhP3VYqqgxxHAy5IFmqDf59tA8R
         CeH6Rf+i3e4TjQlfWOF1MR579rZhqAZtXLTLFFbNIxysrHi/XxM5uthmtAgrkuuXkn/Q
         NjBmsdIW6A/IRk08UOtt9xRkYaGZT4TFhpGyeUR6eu/XHJtS1amLrky/T7r8D+V0nF1S
         /0kkWLr+YWG7sf/Eog5DkdDc9ZkEj74kuCFRpQ7j4LRv/m1M1pHQbdyV5wMCFvQRjLFz
         a63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302333; x=1788907133;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B8BquFNcVW0STtY5GXcO9BwLTcWYfKj9vChUh9QODYI=;
        b=a2Byr5H/WEEvKohjcQuylOpiobR/4Jf0VFT2365LbAwCBzKh0MctSSArwVNLdvm2pK
         /4jariCnJpLVjLaahnmF560gw3Vc4py4JTeKKHoIhWk0Nta4PW4M2XNMyRJqC7JuJeuv
         Sb6R7301yLOEBGz9I7GJhfsSQxAt0fuPR2NKXgLrpm3So2wvepKAS49BEX9oEIv95m6V
         IfSwvrQsGhpROAK/e4kYNQLFjOdEzYVgx0gVzGAhaPi99ZWnkjP5p0j1scLurKYYFEai
         jjsC9V/1Ku8oDRs5ywFpCZZ+JBhpXjqQGO+PKQoMeMTf4wBfBKjkv+S57QcQcTwzjrx6
         +gRg==
X-Forwarded-Encrypted: i=1; AKwUvBy4sObS3N1n1t4mLJoCsPkyDNdHQcrR8rLR0g3WLu0Pth4zYolJykdDkPWu48vJSiq9jsOtNqCg/jPs1Ko=@vger.kernel.org
X-Gm-Message-State: AFuF++m8PNfxYNH6cSBiSbD5JjhQ7lZBZvN8LKx2eOYLRUUD23rl6+3+
	bEjoWhzEZRR7XLjUeV5RDxF8ION5WOaQEI6svdPKrXnf510UTVPd1tJR
X-Gm-Gg: AYBFou3na8DeB3/K54zAwP26V6xXrXG/cAclPco81Yz6bHeKqLCCSS0RysifsTwloBM
	65iTeMraomNgGzKS2xdTuVgrCf3+/i5P0LLzZWASGBO0t71vmlout7+fh7j8oLBk1Ju8/r5jA+f
	YxifeAy9Gb767E85z82RQg5kwmY9uXfJr+SgrPo/KWmAj51LS80D9deMBIt0dtZ+ZzhI42YlQIB
	m1xbLt8ABZY7qeGNenu5DRog3ZnonZbaTYPeefU9CExTDydbEaMsBr5zY0yUpe7A1QCIooY9GpG
	GFph7Q0ppt5fmHfNqhlWvxD8mYowD9BQjL0O76nZM8RI/X49VvLpN5shz6rjz09IOCnMwPZf/pJ
	wjhB9WgFZvq43/C3Vyso1OKUWlQKAS81GUhmdEiv0edoaeIBqdTo+xhV20QFnQXXBrb47rnJUR7
	ItFwr2UaZcdIseep2yeisAjnQBJb6CgjlgrMFFMLWClKIyPKsRwn2Aevb+n5JrvoZ3/kH6daRO5
	vhuzM3+bgE7cmXDXT1gfGyH+Hfs9LnEDFGYnQ==
X-Received: by 2002:a17:90b:4a46:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39aedf7cc37mr329614a91.3.1788302332928;
        Tue, 01 Sep 2026 15:38:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm2144123c88.0.2026.09.01.15.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 15:38:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec4046e7-c6d8-4a51-8131-e1553a0cf7ba@roeck-us.net>
Date: Tue, 1 Sep 2026 15:38:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 to enum
 from items
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 15:22, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Fix patch merge error. ti,tmp103 should be after ti,tmp102 in enum, instead
> of in items.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Please check the latest version of the file in the hwmon-next branch.
This _should_ be correct now, unless I got it wrong again.

Thanks,
Guenter

