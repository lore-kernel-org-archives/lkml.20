Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB926CE05
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348398; cv=none; b=n1U97ifJTUoO2RqwWobbxoneF8rjSJmox7ofHeVzbxW1ZgEkczFuCZWjXIlAK8ZCnyfr44D/KCWtR2ViSY3J1PgbJJqxSr08VulyHaHdLbWu8wW9VC7fMrKqiLp10qI80C3S+DFdDlLKoNFPMDJ/fj1A+NZGneYD7Koam/RXeEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348398; c=relaxed/simple;
	bh=nEiwzoK4SoNy8IEzELJlP5xTHu5XFQc/2OLa7Gpxo+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci9jyhTsXvyVWAnKn+HE2k4tZWpqxBIk9rgVF+WAFDaxb8F78G1IEaJbZVrr19yFmhZkfinvxZKivdXZdiSzmIO8/seK5SdaMc1wKGr3LlvrXc8WBvQoz4tR1tUfiESxzeDR5el1urfrKkKzbaUmofelM4Bv/tmyRPdJPIB94z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVnttTLP; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVnttTLP"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b355ffso776304b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789348397; x=1789953197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYhF5pMkaESj6kjmpcCVISkdRjgmdv7n0c/SdhgqaIU=;
        b=SVnttTLPQltCdRMbkj5NmnIeCRblPHiYSoyv6pKqYPf03rN8NfRqXQ51MpZwqGq+V5
         TjMN8etQeb7yH3uO8KQ+gmVlNW/OLXEKPbhaRLC1owz1Dlw3hKv9RzfpuB8qVU7seZ7b
         VNcceZCmth4n9nPsrDL7vcarFVcKcbBQIZA5pfORZh+ySg+hUYoIozBC236FT5/fdMLH
         tiJABXRBvvlwuuZrf94HG06AOIonwDV3K7x8DnIMnBYpzbNFv9v9lXOEQZ/heCv4TmZz
         ozFKht8R2yPOAdDdGTM2zqDiFGVzeaaqL+jC/T3dNC6b/9meB/EugH3PTEL5MGyH01Ek
         OVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348397; x=1789953197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYhF5pMkaESj6kjmpcCVISkdRjgmdv7n0c/SdhgqaIU=;
        b=AT+uxuuGYLIZ3NqpOeF6aeT2Y9ZswS0zyY4vhRFZVVmsUhjuscFVq1zMIgpVGWxRqM
         xMTlyi5crzMhobb4KTAUCgm0RzYsv+FAI5QyQ5sbzzltWNmD2Vnu7JkshLXQmsk5eX3w
         VsA8F1jKqQJ6Y6CaexLzbnnE7PCFRmZ/tH/z3hOxk8P7CKx/Di77hXuMRULuTOmytpO8
         pwkuP00Gk0cuT/57Fimjk3GlsiiKgh08uzzRapulLXG8Y00GdfqdMPFWNl11xrb8RjZl
         ptZ39NpT1r+jTgd1uCHMiVRfWqjMK3qIrjdePsona36K1XaOZW/i8vDQrod5n8gn9XnF
         /OVw==
X-Forwarded-Encrypted: i=1; AKwUvBxzdb3G8Hj7pQKQn6+8MtDYboTt4CqQ+sm9MxkAgWMgh2bjzaj0sbh+tU1lojvaKPUEEYjSwQOxw5QYhhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lTqDsm73T+cqXchLIWYlQ0tp/XjKcZ6P1E6bJ02gFDUBceE89b
	1IFvCFOgTka+y9tsWtaM+5RxompFmb3oYSFRPqxqd1mLCtqKzq6kNlX9
X-Gm-Gg: AYBFou1IwN7oojimCwY+KQ2Zk3BuO+FLetF30H3M2wvVG9i+npzDT7OVwrV/n6jgm3e
	49F5QbHFlUawvsP6aiCC7SJIE9MX7TdEaRslOI62S6Pb9Z5eozm7L8J+WnBv+RsmduH2n5Ic061
	cjFYyxS1rGDVRf2MfS3eNpPk9Dj/FwDn/MR98rrberaB97ALD9v1mSHfgC5JeUk5WfXUcxCyKOg
	CbIUl67cjjILfwMKUxOufc70CGDoOX0MU6lKfI1yQzTQammfRxfQeZgMmknM85Q8WN/Iw5kR7sO
	jEQT7o9tefXJ11aj4vFCy8djSfg3wyP5yi2Wpru03LwrE1C7BdxPp9YiZ1wuBdTN6K3CdVVPqvK
	EivomTJq8jHnc0Cz6jLQmCAY6BLQbFCg66UBvjyKRhydnZQBIefyHlRMzaKZ942IfK1vu/d4dqd
	2QTWfQYnJQAha6XqvFjk0SJIn2jYqyR+3ksdACYsQvUy85SQI+jo8gcPkfVI96XmTpFdS31OLG8
	pj228GMm2WhTkw9sRfndakn190UxfE1OqrZhjyT
X-Received: by 2002:a05:6a21:4cc6:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3db4042265emr402955637.4.1789348396768;
        Sun, 13 Sep 2026 18:13:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm22832868eec.7.2026.09.13.18.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:13:15 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:13:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "hpp.iscas" <hppiscas@163.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] Input: eeti_ts - publish the OF module alias
Message-ID: <aqdKI55w_6FCCl4b@google.com>
References: <20260905134004.66336-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905134004.66336-1-hppiscas@163.com>

On Sat, Sep 05, 2026 at 09:40:04PM +0800, hpp.iscas wrote:
> The EETI driver matches eeti,exc3000-i2c Device Tree clients, but only
> publishes the legacy eeti_ts I2C ID. The I2C core emits an OF modalias
> for a Device Tree client.
> 
> Publish the existing OF match table within its CONFIG_OF guard.
> 
> Fixes: e32d7f1b246c ("Input: eeti - add device tree matching table")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

Applied, thank you.

-- 
Dmitry
