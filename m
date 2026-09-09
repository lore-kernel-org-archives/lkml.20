Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A659B677
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988677; cv=none; b=D884OYL9NrJMA03Wu0MfgJbV346OjtXhDuuG/2udMlqKpGlr7T08SeW4sNVvhtqe4UaRDa9kFPH0xqazMnX5xhqG4Hk2NoOlwXhu7OKIzO/6/8aatvtvFAEAWdkeilQeVSGU9nwFWR5j8eYi1JvMKFqPjZ/IluERyr1RjwbGtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988677; c=relaxed/simple;
	bh=FRnYJEsiRVcAghW9SPXvcOkf7xwF/0r7gkSGTEvoOTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu1Zpv9Ww5HMIhCMqnc7o/exVcuI9sASMxARYrm7vAQBQ7dUEPkBG2WqPhxI62RA8O4QwG5H9ywTH64FKi6a1ltYZ97bkNSHReNAm2c26RN4ULGKQCoYRsZZg0fF2KwWGPqMlGBFilF11jRXn5AZzRLX36jRAjldRTRpipHuoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7mOtduC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7mOtduC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d58efc7356so82581485ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988675; x=1789593475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uEKeZ2TrQn0dt58Pw9u1wPw14oz0jOXcEhtf2kaaHgc=;
        b=H7mOtduCT5+YNt1d9P57M4fxyubfsrBTdOMZFoBWdb3KihR5h5jMT7UEO9s9OYYwEV
         1xgoVbP+e0am4+ZzSxXQbeb9D2tledd6I+sJrSjL2Jq8fwqG1omvtO5mdtCp7dqpCgXi
         x2lBtyjPvsng3mfLjzEw7KRq3x8f/bc4vUm+XvhuVrUaBr2Kf+16mxsgZRn2C34+BeFs
         JpvnRg7MQ2CpnWhnHFL6SSAfEBQlRNm35n5lG47xasMgB5nuqavXUotZoNYvTfTnFrtb
         auoQjFP5wkq0Y4NsaNBc0SRCzqkS9U/EBU1K2OzBS62PSHjDVhyJKi4k9tXn6hyEeX7U
         F/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988675; x=1789593475;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEKeZ2TrQn0dt58Pw9u1wPw14oz0jOXcEhtf2kaaHgc=;
        b=BgwQmOZyunlmnw9Pnj9F3/bG/tMiKL40r/G1TcsBu0b0O8IDku7u3GQcUIjqOu0eZN
         uoJV1AK5eqkr8hvTNYoGWys8fdDO2z2a0G/JlQOCW17I+nmo1S2b2EiN9HZGh3PyBFPT
         ortxPWIxqUI5DxJOmLbBbLTJZRvT/uRi5hEN1LFVsrYwQj0bsTlrXZUSMFA8IYRVQwjM
         M2ln+y/huac1x/ro12wZu6xzb5nu+sB23TdN12fTiKmQ/A5DtblDkD0IGSmZyMs9AtXN
         hFJG3ZKgYEXzewvw93WhGjgJzhHtSDpW3HRqqnD0sTKYbQQL3hoeal4JY742gTfCu/h5
         REWw==
X-Forwarded-Encrypted: i=1; AKwUvByn6PEcMhWMbF8W98ZN5HXZ2/ct7uKqOXNp6TH7IADx2Mq+Vc/iblUparDi33GRsfDMU7o2vTrC3HG3zDA=@vger.kernel.org
X-Gm-Message-State: AFuF++l3FFDufk31+PWgf1Uxk22SGdO9e0qxRRiu2OgIQ9SK6gZtSa5v
	xsZPCDs/cjFQF83XroxhzatJcpEMcGHs29ZB8BpXgFiphsA+ro1iYGDDi/LB/g==
X-Gm-Gg: AYBFou1guye9wgWZ6NsOXo1ZzkHqlsdl9t7vB5lSC5Rz7cxOzzX0jdluP5G7zpEOfux
	c7f+GCy1RvDQNPabP/jqGVjIFxd9KlFmCwqVfr+dlwD5kP2Kwd0wNddqMRiviIeHAffsgTBRkrX
	8j3ToJxc0/S3ElP5wpo4yXBERwIS9wmgf0Fz8if609WnK7018dVUrkYp9ZXWb8S0/jFU6hXlLvf
	4HD9JNlE2w2I7liTnfYV1cwi97cEzQkUap2TQbjYKCbaxM89Y/DUTAxO7fucBVEVyHk3F7AalSR
	3e25kZUe76lAz5GoSExIigaovfZXbAEF9dlEekNvC7Jj6wBQIy5BOChBpoZe5ujKfViXdzjIO+m
	vaSgMuByee7OoK2VKJvMpWE+7xCifc1w4Rk7xQR9gUAL2WNbJr/qnb/Cb6gw6aquGBEMmKN1lCE
	SzJaIT2X+aZpNKzBsmzaqfwm8IPR2FFsU+YT51s8P8Owjr9ABOv2qq7F7olTHcZlO2/9IGWfdcT
	2o91YDHFJq6
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr53766810a91.23.1788988674868;
        Wed, 09 Sep 2026 14:17:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae5837d8sm2124986a91.0.2026.09.09.14.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:17:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:17:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/9] watchdog: msc313e: Fix undefined behavior
Message-ID: <dab384d4-97ef-49f9-8c67-331146d46147@roeck-us.net>
References: <20260828161348.13212-1-tzungbi@kernel.org>
 <20260828161348.13212-7-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828161348.13212-7-tzungbi@kernel.org>

On Sat, Aug 29, 2026 at 12:13:45AM +0800, Tzung-Bi Shih wrote:
> readw() returns a u16.  Left shifting a u16 by 16 bits yields undefined
> behavior.
> 
> Cast to u32 explicitly before the shift.
> 
> Fixes: ffd264bd152c ("watchdog: msc313e: Check if the WDT was running at boot")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
