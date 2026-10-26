Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047692;
	b=h1J+OS6UbAUeI0LKqwLBSlxFfygIY4jm4w+klmXQjA3ge4lCVYQzfApm2eOVqJt5xXbW
	 SraKE90v7pZRagCB+XSuq1PSh6BF8EGEqZXvi/meoiJUQbCXgopWctdERYIkgywqCTFct
	 vPS5qYNEZNB3qBkpZmNhHZ12RC/3Fh2BVT2bZdsjZOgRZAikmC1kF4Jvv6dNCVkKPW9U6
	 22POJmGDz2JpsyO0Tn1rKgwExWcfrPqTK83bEVJ4qmWlq1cn5cRdZvALSl8byISWcdEKH
	 hbj3TRxL/mDw6lhj6wt7QOQibrhoNagBfaGyojtQfWdlP6bpnWJANa5IZe4tnto836Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
	b=nxtR9ZTiI2oAAlOU+MUGZk53RhiPP16xil21YtyTJ/7wrR8SftSZSrScP0C4Fn2YQNJ9
	 jWozQBAarjKN6jA9FcOakCKObwOigiHLkIqJRS26uDqWJBrAOB1/iIDZiDaHwlxme1D/2
	 drA3aOqq7/m20jZlb7T1DLa9sCQFmHPO5rPKsIZc1g2bvELXOTIsH5T7FmS+6zOOGXheu
	 J9c87d7n4fj3opLlmzto0NbLVz7wX1I5se8vZsx4JgqtYGJJrButVdg9cwIaH69Feh68M
	 5XOdDANnkEOSvGGd1Y/tPVbiDEnHkSzJbRfAl/kU8Aela6aoSaRtjTSzNmpee0JBmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTZC5w+K;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D8606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTZC5w+K
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so5160818eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047691; x=1793652491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
        b=KTZC5w+K8RiWwTzcTwge2bRfsNiXTSiL049VP2sWKoRAF4OVkB6fg8a5vDxKXAEWoH
         5lhPqe8wzjSyi2HbnmHEfpe+BdXH/x+IQzRpSOAeNbEJ3wfT5MBGY0tOp7bmxzU8MsBV
         b5ub3iyL6GNijJ6SHc/fJY2ZoFm2TVfw3wy8TcsUzK9mEiW7KFqurL7h78Sc6nnHOcFP
         ZmNnYkYRG54oNH9yvTFDVkVzZAmdeI1HR4CbbpcNpR/Ax4mp+uNoljj423qaHhOts/wC
         GZrbWxqzpe4yuG3VAP2VP48MfPAMm7kcr54wgATuJXRmFq2mZKMunxSM3Zrfh09wWq5T
         trtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047691; x=1793652491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Glp98pc/SIynZfFFbJ2RDbYRZ6AZRnouVLPAAYzRp9o=;
        b=mULdi+/FN7ubIpVUv5hgDVerxAzTD+Drjg0lQ15HMzeUYySFPKlIUvgRbjjqn6gsRF
         +0rgbtstvuHYdWtHlZy4ko7jU/KvV773dVMSk02rJXeQP3PdUcDP9C2K1Pq5RGhh8cIi
         6aeNk0buIzj712XQWvBO2DZH5im0rUU0qnW4LQeWESvxrsBnF4uKh3Gn6iaeInUmWXiO
         YfKjvHdXtANxwPEe3uJP/Cg0jtORphE6vSZU5szjVMN5XkoSY2CrKWqHIivjYirWXHyv
         h9YC/yhASRRtflr363wKXLQuv1mQRx0RPF6uHt3wzze+U3KewczqX8CgTMk15JCRSj0n
         WrXg==
X-Forwarded-Encrypted: i=1; AKwUvByNpCE+bqHVmGkoqeQzB7F8O2aOnvJ9cVWWLcV7Cu/JCbjXjFG62XCWTMfqXQNdKSYAnqnFIUxKZmY6BG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpegoC7V+fOwY7pbWfn9nrpjY0RaC+CkzM0jJSEahzW4uFRGT5
	1g023K8LJvCMHlmxga7HXsKDCVIF+MNJacbyQ9Mrj9W6o8+IvNYA87ef
X-Gm-Gg: AYBFou2TwqEqZwNbmcSWPoA92v7XXZjXredLfkUTw1P/jqVcHd7Sc9dS6nmY4LLlY3r
	l4rDEIPSGQrsqv8gSN8+4C02sDita/85+R1dpMRNQ9TTlMPFz/12orh4nvpIPX7ovcKuno+gsb5
	cDwbcMnosiTNfyWRndzKGkF1og4d4q4evW434qafTgoEgNEmFz75qM+VZj8a+5d63MOEI1yCzQG
	I6zrQQmPLi++Bf77zDSYTZU2GYd5SC+Wx2r3fTAVShQIS675ZNvofZZZC8YKOzeqRM26J0q+Y66
	jIElPNrOyIv7XljpyJc0iDfQ2bjavAcBThluxE+5spf+JqtqZ2zSqG7DY3QFExgwCjqxkoDVogm
	D9gHGyUQYAHOLR8b2tbcCS07auxplmM364qUovgcGgkpX3j7Tj2ydUwsyuDN4+vx+GywuHgIAbM
	H7eHmy71AwuBYdSvn2lOMK/vu5XzzV3/NL7cs/4+9zfpYXQHgYY1XR67G9Y33FZKu1y6ylcS37N
	lvXLaNPzl++eqhqHEK2I7YieV5baaIp1uQy3wr6D9nQBeGp6cIW0YVp4hRIpE+E8ODSTbQdfQNt
	en9GW4ZywTzLUXvkt9A6sNLCvJVb5457ejhtsyEcFno=
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10717768eec.14.1793047690766;
        Mon, 26 Oct 2026 13:48:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm51555058eec.23.2026.10.26.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:48:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:48:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 2/5] hwmon: (aquacomputer_d5next) Expire the initial
 sensor cache
Message-ID: <f80ee5ea-a00c-4238-941f-5644ea966f7e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-3-contact@vasily.cc>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927191316.4137752-3-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:13PM +0300, Vas Zayarskiy wrote:
> The initial update timestamp makes the cache expire at the current
> jiffy. Since aqc_read() uses time_after(), a read in that same jiffy can
> expose zero-initialized data or skip the first legacy report request.
> 
> Initialize the timestamp one tick earlier so the cache starts expired
> for every supported device.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
