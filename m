Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5DB3EC69F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385110; cv=none; b=leOSyNQ5fcE7SJylHhIgS7Ti/7xcFGqRUv8KJXxxnncQ/wuDlesbiFuWUj71K4AEMRxqk9cayus5ojqupGLJyBIxQKo3smPjPNwm31qP8Nmra/W8c7xFrypcNawfofj4O1AVKISHU64+tejm/HNFPbhbQQ/NNYZK38swgPzmvJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385110; c=relaxed/simple;
	bh=db4v1ANHItotB3g1ahWtztT7Yb7zlAgWKJovQuc6WCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7Fwr8uym7d3SoFXr4ywZQlIQkZc8REzOu9kR3jqwsMmQlpGlxrxcMkZppxT50q5t1L9l6Vcs+NVdollMo90n4krzhEjQ6v0uOLCHFLCcRhn+qW10anVAXNTqMRyGWZSJyq+XEsI20sx0YYzhW2PSy8r/JKioJGXnNc/1UFE50s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjyxnMgg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjyxnMgg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2455623a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385098; x=1788989898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=UjyxnMggSvWjQlQ6CH5nhRqcYjt8lUYVhHTws3E11wjdUGatGChOCAE47U7chPtM4x
         H3OuRn0VIfU//l/Pv7Xeo9kDZVmgh46OC+6qH60Kkog8mrr7NjorwO8xJel8gKz9MHet
         pKoH4yX6nBxKnDC/mQU4FBWIVoZx6gRJvVp1NrzRvfh61WU0Ym+JU9/jxk4vbI2Vyq9N
         vRONhN76vDDHfiVqyuTzxSf3GXr0AI72hno2RwDpCSJqtPuqTZ/NfuW1iJLYk6cFOfeb
         JRfk5n4PUFzBd0Kg/rAR+84Yb0s6wM5xpe8k/G1kdOJGiU9ObcCNcy2aB55xkJYIYpd8
         trhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385098; x=1788989898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=i1NKxjspqUn1/TP9LM5notLeE6XiovrC0j20HcJEFelBO+5/sBAyuk6Yq8CgRfXefj
         G5Cr8dX1SUNfBiOSYoPxlkTnKCv92UkaIF3GoUSpR/M8o20vT5xuJiswp7k5X1V1J320
         Fy8avMB+aVRqOZZhHssWkAeQPjHLMle+YJf9T7fB9k0Jc8CxobIaPl4JQmVscaFpeEj8
         useM0uzyXZk7iWe20fEalNbNMWLGoiUzseX4vqKeYEz8Lm3QmfTHmO7yGoTAXOzzRziy
         AkZ3mBmvmq0w/N+KfTmLF1H6A6RiBhDIKmYKAIyUwAD8NKpBKlSegi7UmgPATtEV/k57
         KbwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbLBY/4Ql1EkQCs71gFBzco1Ktb3GsCyhcCnxkHmAESvpQwAE8fKR945dJO1H+soQGsB1h6h1prug72ss=@vger.kernel.org
X-Gm-Message-State: AFuF++lxYArVqkBy7RewiwL17bQ1zbJPg+nqzDE03nbjuBP0vF8Dl1Kz
	10FLoBUyE2G0GSAdBR9x8fmLZWf93+mYOp7TtFlSNPrHiOycdnpGpGlitgn3xQ==
X-Gm-Gg: AYBFou11NM3TeKTI8nq3EiOyE8b7/M42XuZXB6nWlsbTEoIQ1//D7WXCPFGTl3vscOy
	O0u/L93RFNdZiDCuM7x2usdWVwhElSa/jLBNPw3/Hv+X287o0tcRxYIDnWJIDHg7sI2SAv4ryrC
	buA8/0Xy7puYNFdOqAPIyk7Z9/0gI3gkt4txi2a2XZ0HzEt0602fDgLSyKsOny93QUGfaf27fy2
	1DIWNoWnO96uJJ/1ecv5luqtBDIVUbW/BpteopU934hyk4Tr6NuR4R/cal4CS2iMFRCUWFjviMz
	PgfKMOelMUsiL23vSd7IaWESglTP9wykDlAVg35REqrRzFUynW3zQA8DDyD/Z3iLGATB6c+ZV17
	m5omBUysImTgCzpFy9NzunLgbP0imJZMMQB8T9TfvQuVMgmhu5M5LNQKY4tpklOq3t00/F2BIGR
	RTNbukFo40AZOMce8p88mOTJK8cjkAu8+a2TFbKm1uBZSUnBpMRBub2LUwoScxbJRbxeTe/cyPp
	g==
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr11966313a91.15.1788385097798;
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e6e3asm1371740a91.2.2026.09.02.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Message-ID: <870df75d-bd0e-4e59-a81f-880dc4207dfb@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-2-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:48PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are PMBus-compliant D-CAP+ multiphase step-down
> controllers. Add their compatible strings.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
