Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408271;
	b=JvSdosITB+iEVQm9Q7uzoAzc+WW7JomrQMkCBHReItrJyIzzfveo5qs2hWgCwp4b/RVg
	 FKaSIGSTkt5HmZVew88ZscOD/iVfP0sWv725gchn6GBVr6tsVZWIVOdzR/TtLZGU+RKL4
	 uuxD+vRytamhU9e5Eel0957n3KPdRnov1fQHhbV6Ia9m6haB/y0wmmScLwncR0IyCsH1v
	 Mj0WHEReSv9GX6FVpLNQI1csCveAW8h7kXuKwk4C70GxNQhwAHUaYld9h3wKtb37/MrjQ
	 U90ZIlgD8YRLWSCUsUSHcIhoirUVOjbxdU+gT2CIHwPKjpTErUwNUF9tyXE9Rx0n9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408271;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Bl537ijlD23VW4erxTZOlzT9E/4cxctJl4Miyc9Kivg=;
	b=JaopQsHQuSKzUu2JXBkf6LYmn2e+f3SdlHmkJWsDCc2YHZzDftXVS3EGrjbXBPKdgWgJ
	 gHXrgi9FjDZAOZuqaItaZjx3qFrF2PENlMQNuKIKQM8/wH2RSlWW0GEV3FvE5aO2MdIJw
	 4QA8ChKpFjwC0W3ZrwEgGMEmoBfUstBt+tOU4aew4cjz7NppmmiRGLB304qqCudS5YtrL
	 Y8QBcYgRiTXk3tnr49v4TPfCuOpwDKsHqrZ30JwqxY5g6rE/r9sWm6wnQHtQ244+T8tls
	 CyWpDAs7EA9KKOWp/juSPQh4c4Y8L6UgHM6docGsplCQoq6BF+hHCvhBvh76fgX3EYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4307E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4307E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so655587a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408270; x=1794013070;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bl537ijlD23VW4erxTZOlzT9E/4cxctJl4Miyc9Kivg=;
        b=C7FuT9cFOD0KXEK3apOlPj4lDKr0zTRWen4QruAaUNktLnyanFK0/wojBpe+4bWYWi
         Copw52D3dvRQPiRQ9ApLQnJaZjFxMgp+iGchYwSm5gCVY/TNlPdix2ctR0lZycVNNkJK
         1b6zSuTFVfBYa3xybzZLLcRtUyz+H7a/9x+2qQq8wPfYG1kYhvfYCwbWXjNSngslYUQd
         +sO2HlXnLogYlmWzXh0rMnqFkYLzTIKKxMIWNIDvg+G6Ckr2696WzHSmuPRakKbsbEce
         yKy039tQMImQva1x/4tUohG9Psg9B1Knwo8CUnk+rt9hn4I//XrrHVlmgL4qNml1Graw
         6REQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq3uac/lobbFdkmj/m+fWCQ18yTfvPNNmNec4MF8uy0f62S0stZmUA8w7e+5HsbqGfftklG3pNB7/skDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe2xDyDXyjv6vtWiy/dc4o2nKy3lF+WUTPpnn8kGFEMqAJQhQi
	a+kPRSK27ui1VfusJ3zjoW/KUIpXFnengYLRn7jKwZXl9MA+OWJlKCNnh3wiF4sreQLeloUhiys
	hI8V84xr/vIGWOg==
X-Gm-Gg: AYBFou2nwm3NJ8TkoCsNcAAbnqhSmVxFvfojvv7BvVMosv3dwa5ew3y24leS7wH0Yk6
	Pbo1quNXiLLrWMo7IS01hq1UT8tpUryRQW1Hg5dYhcvUz5AnmUe6BcRNf37D9p8DeBV+hzZYjvH
	h+xW/HFzgoxiyILLGML9KT4lcLTC1qDMLIfc8jH657APF2XEn3Tw0GmwSvtATnQhq0t96/v+MBY
	NMauRRnLagSZdEQjy/ATXJXZ3DlC5vOfH9ke56Ct8Aoz41WOomIVXjqGnO61Be48QxcWFJLZRGi
	z+sn+brOmWJmZHxfDm6SyzXiO4nkUaEa4yf37HkiKVfGaUf/8aVv+99MxYXZTK/iMgT78aONSwq
	mvlfd9vHM8FqkJZvAYoekmWmMZsFhtsp7CRt/PkDOfSKYCI4HqwB9kj240LDLIhRgibzP0L15Ny
	Ni4Fi/Xg6CQFEI32O/FbyOkLaLbii1Ybv6hSS7oNCdGFL3zHSh83fSRxKaQ4ZRxRh5tCkANiSVL
	CfFxN6+LYWc6oGSVOYpJO7yco68mLGaeCB2oq+BBNEAK4rNfBZXN56gL3zOl526RAFXluV8cfTT
	OswEqRCum2JSXOpPEuIPZcmiKSmZeBEQCsixv3eRoJtRvfN6X9t1YasoJ7oOHjw8bwZ5k7aGV4b
	jBe9s7F3XnDXKt572pONdHZ9QZV8lvQFKsuBXtlU=
X-Received: by 2002:a17:90b:440d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae897f8c6fmr2910757a91.30.1793408270496;
        Fri, 30 Oct 2026 17:57:50 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98f888sm10200098a91.13.2026.10.30.17.57.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2026 17:57:49 -0700 (PDT)
From: Jongwon Lee <ai@linux.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cxl/edac: Mask DPA flags in the event record cache key
Date: Sat, 31 Oct 2026 09:57:42 +0900
Message-ID: <179340826284.3478.8780635809480680434@linux.com>
In-Reply-To: <8afa233c-13c3-478e-89d2-1d3f87ec7c08@intel.com>
References: <20261030072721.31970-1-ai@linux.com>
 <8afa233c-13c3-478e-89d2-1d3f87ec7c08@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 10/30/26 10:44 AM, Dave Jiang wrote:
>> Co-developed with Claude Code.
>
> You can drop this now. Or just put it under ---

Moved it under --- in v2.

>> Signed-off-by: Jongwon Lee <ai@linux.com>
>
> Is this a real email address? Please use your actual email.

Yes, it's my own address and I read it. It's a linux.com alias
that forwards to my inbox, and it's the one I use for my other
upstream work (rasdaemon). Happy to change it if it's a problem.

Thanks for the review. I'll send v2 shortly.
