Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345929;
	b=5S9uP8OPDXnE75pWX2QLt3AgOY0Mq23l+D5STxUKc3K64D96KeFq7UzNEwqU0RjrQ58+
	 fW4TycSraCaHyuUG/ZG6OyYqYJNV+uNnTved5E8+8LPjlQAyM1V2NJAwBbJYZXwDqPwLD
	 E4fsEwFBEWsUT5jnBFrbvvCs+vYcjiyv/+mt4Mphui2T8So/0Y9uc5DUKUcvwvaGhDNPz
	 Oi+OiW1sOxE3r0Frqmt8YHGxZ3lT6JIOupNHbfCOH3acD757kCuU4OF8TXt5Yk8Xh7E5q
	 FNb2vv1eLJUNplnIP79GH96WB8pPk3jJBZP/yyEu13BCq2lMEd6SJCgI9XUWkGht8PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GPeUEpbxZgN6b6poMbqb4po1OzKA7uw1ryiUgB0GJGA=;
	b=pmkQaw8raFsEHccf/2zd3E8hhcRPoHGWkA5U+Q4oJ1NplmcLPdWestJYeiL96B3Df1EG
	 smUtyhGyZLnQOg5+mkQEZvXzzCfLJl4NNXZ3BzPQYxSsNAPsIg21DQ54d52U7gg6fb0k9
	 3xtUeM3TV9ZlqjAKL8AABryvht8BGUFbi1wdOhLp9tV1Czskh6fPMEqjcK9vnLuwduU8M
	 pQ8+PIb4FkbK0MfybAL0IkQENKRKD1enyj99FBe1v0xAGlA//kJPXr+r+FhGzdQnse+ig
	 qtL+zJ7JJJlxot4IG6jpttLwh5YfHHSSevAG4ffw2zikYkcj9AO1AZShxi+tZD5obWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jccq4jcX;
	arc=none smtp.remote-ip=74.125.231.195
Received: from mail-oi2-f3.google.com (mail-oi2-f3.google.com [74.125.231.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A10606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A10606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jccq4jcX
Received: by mail-oi2-f3.google.com with SMTP id 5614622812f47-4af85d1cb34so265900b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794345928; x=1794950728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPeUEpbxZgN6b6poMbqb4po1OzKA7uw1ryiUgB0GJGA=;
        b=jccq4jcXeMUlb9kNFMg4bmgySVVsmX5UsetGhRhR+64XWvTXdLN95EixkElbZjvhHE
         W2Mx71diUc+jVyHhbA9OE3M/B0EmdPmaNlknxxSr+hbNZZgxDri4FgRCajHMgOI8ZXZQ
         kRT7PO7iWV4cF6tMLtElZkMM1xZ3LTJ//nT1adfehGSs8hwTfJ80puGlSZnsooPNDDbc
         nnT+zrQElAtdpL8WB6+7BldhmhWm/wZcTtrovggk2cW08mkutPMTKaVC0f0s3a5KgF48
         gQBa8pMdrkpRlxkngfl2OJMoJorjC9OtPiglvccnie7kRLanUD4CDTF3JyFUcFjpgphV
         U4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345928; x=1794950728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPeUEpbxZgN6b6poMbqb4po1OzKA7uw1ryiUgB0GJGA=;
        b=pqG1iCHVATf36S27v/DN6G7xtnMVUO7UBuzjGkS/1dRDPLyxwNqHSa4hY9uDEWQLLa
         monsOvUcOLE1X9ZOatI7h41l0i20BSXRDDzNIsbFbpRGGQXEFOMZCcasmDggb4601Upw
         wUvXNLPUkyenvOs36xwlm7yp/Vh5VXzuxP44G97CN1QDEcZpwPVjsPuhbWeLAM/8GABM
         B72TJmtk1dnP40fSKg4JYvfCO9NeCHsSmhvBz3kQeb8bgdt49ip/RPdKVY5S/WM48tkZ
         NgFiczF1Qu/DFD2gNKTw5pswyvkTCsRbgzodSGIxvSX76jP50sqXxJYbF+jMzpFz4Tbh
         bL9A==
X-Forwarded-Encrypted: i=1; AL+hErHZfA5RQVFmQeXIpUzHgNYZrelxd4IAx423q3b1HDqDWEV/1dOTP/6JydESZyge2VIDO81FSaO5mBb98tM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p6cK1nSQeccHmGTJHIAj3XR5JlsytVFg2zQAtEdq446fgM7qg
	LuNvMFnvzgUh468DtbPifVdKSzONUAPrRk1NP3vd6iiBhM+dfiei7waj
X-Gm-Gg: AYBFou3t2zFr3XUyVumE5iSAoNyJWFpjpTmtIZ6H56ea5OTeJnTcDvJkdgJjANek1pl
	4KZomti1FtzhqkpdEM16N4iQpPTWcIKTL5Rfh2ovM4iV9kAoJ64R6XZgUEDsHWpaoSb8TAs2egI
	ZW0gE2e07KtLbwuYaJ+ij6GTmMPu66giJbTOz/oqppWg2t6UrQ+K6kvS5hM4pj8IiFffITm3k2o
	AUzGRIWlT0itceX504yGuiyfmF8Gc2JDc0KcwEVc5yrpwgpK4EePUJs9BLcBUrhiZxFICPIleXh
	DjsHizjonbNKvL5VHEU+jPtJe3e0SpIAhtkTdYA7tL2Y+Bx0Cm78LZi8rztCnW9xZC5lEOy4aXb
	Zejt4Czg013Yh4bqjsT1YYtMsW6HpSR5APMnj5Xqv8KJSRMf3vA7dq7rrKrPM+i6Q6ORlG+603t
	i6Y1wbrL+ve1SAfXcGpbBEXeI4HMd3Q0nT0Tn+oTIukFgtSJ+sS9AlFDlUqOCI/HVtEEg/SDV+n
	NSr05iDgXpqVWs+xWuqgnWqkLfr9MatSP2bHUVbUsLQrMiB9jug1xi/ABiyQzvl2qZywWHjoWwM
	QL6gKZuY8jvowI0S3ANsUObw3ALLA+c1+bdZBUcyVNW+ygJ75mzSXvtNC0rqylr+Zy8=
X-Received: by 2002:a05:6808:15a5:b0:4b3:3e1:499b with SMTP id 5614622812f47-56b96294badmr126559b6e.6.1794345928215;
        Tue, 10 Nov 2026 13:25:28 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm3233400b6e.4.2026.11.10.13.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:25:26 -0800 (PST)
Message-ID: <01f512c1-84ea-4443-99c5-f6c30242d4bb@gmail.com>
Date: Tue, 10 Nov 2026 15:25:25 -0600
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
Subject: Re: [PATCH v4] pci: Add broken-GPE quirk for some Lenovo Legions with
 Nvidia GPUs
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Timur Tabi <ttabi@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
References: <20261110-broken-gpe-legion-v4-1-c672bb1c4d91@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261110-broken-gpe-legion-v4-1-c672bb1c4d91@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

So sorry all, I accidentally double-sent with b4. Please disregard this 
duplicate.
