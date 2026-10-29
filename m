Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236924;
	b=PPhQokTbs/vlIFd++AdZpC44NL2Qm/8PoSZOa0+51fCd7tdkZg8s5YIYIfJCUxC6+Qe6
	 bUVFvWc1W77myDfA2MzY5ZUnStvQJqISV1beHX4EJ0rzZtqw0BspRHoCXLAfVEs0mbtFf
	 YSKulM2/pOhAe9sfV21frkEloJK/PjlfJGF0FBbLQHYsUzAUBmw5XvOX0wHvOG5cJ2JX3
	 /54w5+dBch+kKLXuzf8EA6YBhCnsjyoiAKx9S3pZ8T9dmwl4O5ESClm/NkTFcc2hMSbwX
	 AghCoD3TfhCosiPX052Lv1aBsURK6ni+5nGb85uZPo4NMKPVNmUQfDenM5SlA+Yp9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236924;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WXaEqoKFJjh2uwmR5UbQG1k/n5O6wB+CyMB0Xm5vS30=;
	b=pQXqaK5tKJgY1zh/lSqYjNucYaE5lMIA2sbmr2T2TqITJBECNmvx7QkanErtl4HNfHbT
	 cOX9dxNZxFsoZX3UU4NUYR9iLS1g+wDlB0wVzCEmAh/N5thkobxYDxeeARaMYRHduyUG4
	 dHYtYSpJ/mrTMR51oNAOsYpP3u8hbMJWN4D2uoaiV9jsBH032pXTw+WxCEVPRu3vTTd+4
	 xCUUSJDNwYz/Ku6VKldhGdnW4fHNuOm/iJFbxuO8whl0CvIHRlrPHytSWZM5hDKfn7BWq
	 3hKdL67rdgIYzDUuLPA/upr3+VI5cF420EncBI6HzYs0Py+tImRnUu1n1rSW/zmBs6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JU6q5406;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD07606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JU6q5406
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793236914; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=WXaEqoKFJjh2uwmR5UbQG1k/n5O6wB+CyMB0Xm5vS30=;
	b=JU6q5406klJEn2N6xqAhwQinBLCR1a6ARHUUhn9mjjFdlScAwqx7tKCkoec4OEyeeEAlaxXeMJQ+KzEVGjy6puu2R4Hcctv2cCTEeD+Ij0unCtRh+KMlpHmp5YssOxA1/WbgRmp750BYr0IksyvmcL7cQ9vAfp5eCgj9vsN53wI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XDhs5rO_1793236912;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDhs5rO_1793236912 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 09:21:53 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: Ankit.Soni@amd.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	robin.murphy@arm.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: [PATCH] iommupt/kunit: Read an exact NR_SECONDARY_PAGETABLE snapshot for the leak check 
Date: Thu, 29 Oct 2026 09:21:51 +0800
Message-Id: <20261029012151.78138-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261028125910.GB3040767@nvidia.com>
References: <20261028125910.GB3040767@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>> The run fails consistently. In the example above, 14 of 21 tests
>> failed. With the proposed fix, the same command passes with 18
>> passed and 3 skipped.
>>
>> 3) Could you clarify what you meant by "disabling the check on !SMP"?
>
>Just
>
>if (!IS_ENABLED(CONFIG_SMP))
>
>With a comment explaining it
>

Got it, v2 will guard the assertion instead of open-coding the
vmstat snapshot:

  │ if (!IS_ENABLED(CONFIG_SMP))
  │    KUNIT_ASSERT_EQ(test, priv->orig_nr_secondary_pagetable,
  │                    global_node_page_state(NR_SECONDARY_PAGETABLE));

Thanks,
Fangyu

>Jason
