Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A508548F000
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055952; cv=none; b=D1+JYa/KAj7jQ2L0uPcT67Wpm6qYoxtZJ7QvnWH7JTDpKei7/8ntKckfhKaNmbCDrZNdmmi8vZUPEgGCcEQEy0d2nS0UVWlSI4iv6ei6ipuqcL2o2IxxzZXCxsDXo3HDo7lsNRojpSyDUNtyQNtn9iSoFCg27hLadGi+eo0l+4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055952; c=relaxed/simple;
	bh=1uD6+ZDtNGgIz23JYID4aYcA4hcVV8tlLfIyOSY7fug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WB4BgPKToaeLgHZQtkuF9WZHvYVzhO8xUSr6r8W2agDnvQoYNXIagRYFMB3iPqAFrkFvsRryNhyIC2jcypjzTv0nbVDov6/9CxzGpMZauuM/oLCXWls3Ua4AMDd4uHLMZ/VhfluUuRd04q64nhRgYAaxy5MIcoS67TP3wDkZeVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzvP3dyd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=N1ddu0Do; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzvP3dyd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="N1ddu0Do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/V6yK4AYSarYyuFwL0AOAwiP4ndwZDNRXbkjVWDUGhE=;
	b=hzvP3dydh8tp7uCzbF1tmKH8D8QV/n7uObDvNoeuLUm/kMyMpBCFUG2i40fgj5Ns6cMyE5
	xG6ZTD/q+k9ZooRsE/CEf5lmlCpBfamUEboS1w1jU0L9rDMDVPKvi9aaFZUTjqZ9UhKy8H
	HXtUReTiW1LCBsnhdPp8sBb1MtUewDA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-agwE7faGPdix8KJDukjkqQ-1; Tue, 22 Sep 2026 01:45:43 -0400
X-MC-Unique: agwE7faGPdix8KJDukjkqQ-1
X-Mimecast-MFC-AGG-ID: agwE7faGPdix8KJDukjkqQ_1790055942
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6095929a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055942; x=1790660742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/V6yK4AYSarYyuFwL0AOAwiP4ndwZDNRXbkjVWDUGhE=;
        b=N1ddu0DooF1QSyvJQgosqtdQ39wFyak78njEstLDqnmZyJIve5r9JwyArvQITCv0Rg
         wT5fwnCQv+pdYQku3wDivEoBMMFgPH3tBVfHTdfrk8Gch7b16ifdMQImMyDLU/8d7ihP
         3fmCgZpLMEFvKzFbeDDLkloDuwIkKcB/SZi6UkzxPKOHakIsAyBYu83gZKh+2pA2SnTo
         5Tb3eJn/HSd6XCLbk/xPEaEvxAdhyUDkb5OyrbZqmfCTo1IYM0o4g2nxH3TZWvevKV+Z
         pbkvMPFbBMguq8uWlBYhto357YsYXYYmgBAIhtURNL8bxPzWO4MwiOQlzA91Ep9EMlj6
         k2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055942; x=1790660742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V6yK4AYSarYyuFwL0AOAwiP4ndwZDNRXbkjVWDUGhE=;
        b=xxtaUrFtiuQfnKH6r3glDGLcZdEFsx8bx/wcfd+CjJDs9giocj2BK14SVBnjWhOUaN
         HHIWYVPk7Q4Dja+MyMxxn7+Ee02Lq+zBPWQ7IDPJdGxDpuR8YAfWA9htaCK/Lq1lqshf
         pfZGUsQ3+zeSOs7UzINBwZwZXR8bU8ak8FRZftAZAGObGRid2eGOmau8tqQoZ4g2lhqI
         q6oGIl+mj3EYgOLaX37lKhXGo+lrx0q4Ui8aWiPocjkvWZ/KDsy7BxjJ3iqQQ4c4u03T
         bZXfs27xS6YhP7agjsFundowVM9yxyusg724B/ZapA/A13UuUP1ncdALs24XQrUFAJmA
         kYMw==
X-Forwarded-Encrypted: i=1; AKwUvBzezji/kW/39SbI/S5oEdZO3IGAjgz2FdoQPv6CmcQQbR/N6CJcwLxL83MAdpMh6BqhHAmGnA7cT5XcE7s=@vger.kernel.org
X-Gm-Message-State: AFuF++leZrIVRcQi05krCYfnIQBo9LrxJs9UJc0qU/TxEhsJ9+majmTn
	8F8gLiGVuTxUf72PpA6TuU3g06qVKjzNlkx/6uAIYIL3AzU44P4bVbmquqVjZdbhsTiwaDqD7Ml
	1RajZAUw2kchmBoUTYjP201yFlFevmbnF1ibb2ZTyV7uSdYPyVOvj9TdDOqoB3V7tfA==
X-Gm-Gg: AYBFou0vEqyUhLC4LRon/PckDN4gNN60Fu9GEmWTKH5ajh/JS9UbAUjsdscVIvXxHeR
	QCC/ZGHWJHQ9q8JswLPxKwqV5UmwBu0V8pKygNff52uzJf+GhvlSbBYSip5tVslGlJqYviQXrs7
	UYG/0SkYgxWUqnYz/756Q4bwHxYzf2NUvJPgqXc7iFOOlPFu+eIQ2dAazu0Gz7deHsVqcx/SvbQ
	2pbQFoDToqKi3pTknenMhFCbc2U9mPs24w1vGMG7ixqGYaGbsaiE8Co3Hq5dg8bS5j8pK1mXUi2
	z4E33+DWrkUkCmQuWtVQq4jtSEZRsHL6C6gRP7FQbqwsioUeff7YqAAZnTWNZ70GBO3fY3XWs2k
	ghfNR0+4g3xezj08Edig0jRXNVZgyuAMpiKs4h2zFqw==
X-Received: by 2002:a17:90b:3f87:b0:3a0:631a:ba6b with SMTP id 98e67ed59e1d1-3a073201d24mr72359a91.33.1790055942002;
        Mon, 21 Sep 2026 22:45:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3f87:b0:3a0:631a:ba6b with SMTP id 98e67ed59e1d1-3a073201d24mr72344a91.33.1790055941557;
        Mon, 21 Sep 2026 22:45:41 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06747204csm2633409a91.11.2026.09.21.22.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:45:40 -0700 (PDT)
Message-ID: <b720d9d7-0353-46e9-90b6-5b3dfbfa15da@redhat.com>
Date: Tue, 22 Sep 2026 15:45:36 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] arm_mpam: resctrl: Don't stop early when tearing
 down a class
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Sashiko <sashiko-bot@kernel.org>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-13-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-13-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> An MPAM class can back more than one control and more than one
> monitor. mpam_resctrl_teardown_class() iterates through all the controls
> but stops if it finds a match which means classes backing more than one
> class aren't torn down. The same for monitors, in which case the mbwu
> counters will be leaked.
> 
> Stop terminating the loops early.
> 
> As we are already changing mpam_resctrl_teardown_class() remove the
> misleading comment. It doesn't call resctrl_exit() and isn't required to do
> so as the only caller does it first.
> 
> Fixes: fb481ec08699 ("arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v1:
> 
> New patch
> ---
>   drivers/resctrl/mpam_resctrl.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

