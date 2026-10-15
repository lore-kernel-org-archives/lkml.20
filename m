Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52B599A5C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098285; cv=none; b=nEwfoY/4Ak/GrtgjS2lJj6UnU1w8csdruiEVsA8J+Ov16IM4jtWm6goOf7SvZ0sQJTtWuEbpEFKQo/HBLDcnujaZtmRvW9SdLL5qongYUKIyu7lMVS6PZbXgHVzF4R+uPwQZdsuY0KFPh0/wdCjsSTEzMlvqAyKGqtoRI2ECj14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098285; c=relaxed/simple;
	bh=7H04CVxxX4x8yKDGeGsyvBX1tcUcpxtXmtydhBTctSk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=SqvAuDALYNWq3dCRfQtGPdLa0VD8xReeCQ8yNEIZz0A8njoB8ghGXmDKB5TeB3Zs/U0H+v/6KWWcpuJkZYmx3GXu0TDgS3+mqQgcSUcchY+hV73oU1p+ShbcWAvPdAW6UjXnN0Yoyg5wi+hV+lus2J8bCtRXK8ZNopR8yxzurbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=bxyXm997; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="bxyXm997"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so3447602eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792098280; x=1792703080; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H04CVxxX4x8yKDGeGsyvBX1tcUcpxtXmtydhBTctSk=;
        b=bxyXm9973MrNM6E+YfyDxQdxF+50u6SOgQTLnuW3aUdFqm5T1cspNxYdTXnus9hz7I
         6ECEoRVRp1JzGy/fIpN0WafiwMCDmWyZU2DCU2yqXV5UbGobas/xkUU8Jltxk20x16Et
         yyniftTkFujlXGKC2hZ/UMF3SNDv6XCsG1JVn/s3Q2kgGDBCwZ5dek+c/HK8n8NdX6x9
         DHfu5jNyyKrik8/dxhRfhGCVxeqFM684v83WUyZ/IvxQ1jjwY+iHK7HMU0IH1pU36oSS
         S0x5wnT+e7ZhQigjjCoQQTuRWijt1Ds4BM+SxzklIbTHFfYwDaShnGQHPcmFAIyQh6R3
         clcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098280; x=1792703080;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H04CVxxX4x8yKDGeGsyvBX1tcUcpxtXmtydhBTctSk=;
        b=vo2ACXreix/6uA6Z8SXsArldjzMKUKbspgmWkHKJ5aNPjeI/zFfo6svlZQaEtZo0fE
         zMb099w0DcxeAkHniGI4ODUtWP+7TWLsaam4dmsHYqUEYDZ+8wmOdMK0UjD7ORmcTRE7
         VOhGEr1gFou3a8JICTojTukccx+yKYyMgcZRH5T/SbJcQ7uUMHTznXMlrxFK+ZNjhp+N
         j9XwxWdRzkm/2pdUhWHa5BdQuB9m4+HbdxC5pve3Eo6+I3ItA1+m5o+0QD0jxeek134i
         uRaN/thqzRZFn28yeFzbKjcHszBvrloZTVy85FyaVphokb+MXbarmTy3BRP5fFUg18Vx
         dmyQ==
X-Forwarded-Encrypted: i=1; AKwUvByAHZwfrxqJ76Sq74wb6u7Tn14lOdMfl7gaqjBDC7154U3B62UylXsyrvgRZMa7nCxHJE1NgkQNif2xIRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrgSpqV/ywPHp/rl42nioL4Jb9qEstj5zZvEqj0pyqm2kOI7W/
	6/ZJ125VL5ec7r6vXi4f0xQAHUMuGpWlCf7VbJQnO4CQ8piRpd3M8CDuwYD4SdFpqdM=
X-Gm-Gg: AYBFou2eD4SNqLzuAsfEFZ+3p9rHkGQq+3SLfv0eyo91wQCmJpfZ/gkQ6jqspsn+72J
	zIhIyySJ2asSukMbBXMcDsSjeL7r02hNXM/K4bSrYUeWb+sJKCrlNOPujx4i6ENvTPSX899bzTl
	IWPxCxizb9DTxAzrQpUDSjh4vWxSo9t90o+Sb3h9w89n2R7uW4x9bz1usC3ad5DjwYREH54nUmD
	1R1zNGUSosagXUM4HjN0sAaG3fdWTM2Jj+qqkXuc1hHzv9U7v5qQSC+KVRaJOvCEjdNQSJWpdld
	XCJa0Mtb4Q/Hqo0mYKbeJXjL8LhWBKr3TErbjCl8m4pyJqvI6eX5NrDeG7yYBnwFRyxZ2CD7cao
	30zlMXE5Hg4e2nV0UYVpdlARWHEBVmghM2zXAgw3/tmXdlKcJL7k1o/v3as7InJfAF6tM1mpNxQ
	uEU3BPnBVD/xlJmUIaTNeQxe/zZxtgtzkna0TiMIer9zDPDJ61d7lvq8LXz/DHPol1YI7K/NE=
X-Received: by 2002:a05:7301:b13:b0:35d:a0cd:e4e9 with SMTP id 5a478bee46e88-35da0ce0d9bmr8413450eec.17.1792098279540;
        Thu, 15 Oct 2026 14:04:39 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm814741eec.24.2026.10.15.14.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:04:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 14:04:38 -0700
Message-Id: <DM5PTJLL1Q7I.3LGRGXTNBA9SF@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0
References: <20261014-i2c-xiic-restore-runtime-pm-teardown-v8-1-40668c270069@nexthop.ai> <atE6LA8SFpFvZfzZ@zenone.zhora.eu>
In-Reply-To: <atE6LA8SFpFvZfzZ@zenone.zhora.eu>

On Thu Oct 15, 2026 at 1:40 PM PDT, Andi Shyti wrote:
> Hi Abdurrahman,
>
> On Wed, Oct 14, 2026 at 04:56:55PM -0700, Abdurrahman Hussain wrote:
>> The devres conversion replaced manual pm_runtime_enable()/disable() with
>> devm_pm_runtime_set_active_enabled() and dropped the remove-time runtime
>> PM teardown. The managed release tears runtime PM down in the wrong
>> order: it calls pm_runtime_dont_use_autosuspend() before
>> pm_runtime_disable(), i.e. while runtime PM is still enabled, and devres
>> is LIFO so the devm_clk_get_enabled() release runs afterwards.
>
> ...
>
>> Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> pushed to i2c/i2c-fixes.
>
> Thanks,
> Andi

Thank you!
Abdurrahman


