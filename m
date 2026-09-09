Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF375328DD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951769; cv=none; b=C4hkomB8vvueO6C/qNI28iisv/f8xeK7KDlqbWWhGSE+2AvFLSmAVoMMu0jfPizPM5ZNJBJdO91SHE1eQBI3k8dV9qwQaBW/etMJ5MCTUtg9KhGwH9DO/1q/eIf0yCtZg87vt2thno47JFokr8xBkU47iFWf4qxcOAje0RutihI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951769; c=relaxed/simple;
	bh=/KNkqL8brsMMGc5Cqzr5HLntXTDWrBVEovCUk8D0+MM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Lo95Vz3mnceenMZOaDXbf5Hyp1SBuuHeqDY0Z801rqe32djdQM2am1sdiAMsXnQoj5WETwFsQFvSxE/Gy9ZWyJcjo/hDUlEPJkNq3MQAzLhAJFeG7Vbere10sm2DTPceJOgENM7IXrnpLb8DnMCpwXsMDs5PuTy8Gw8zLJdXpWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=PzDW+lfQ; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="PzDW+lfQ"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso28583a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788951759; x=1789556559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=PzDW+lfQBEpFLI8b75gyc8ue8zKJWHtomeWlbHdeq4HAMqHCoKFuGr2SlvSm5fbzmZ
         QGesMF1rCd1eZFev4EkwM0Jaa+wHFrgTqy0ArZg6nVwk2i8GmbB7YNzadI+0HU3lvKVs
         wlO6yy5tO6WKyIVHs4/Tl0GQtbmh6eSE8dfgiPjuKeurD4+SKBt+19vgQwNU7amlT8ex
         D4AH5wWZnEO+kS3AmwIr3euIUABBC2RAz2wRNCEcjilcjB5SmpYuqLULDRp2/7VdzgVl
         L8PzfX1VmcKGPmKau4tuYT6rktk0eMA68OJHdb84YwIIvIOF5Ts4TQRWCo3hSxjVmBct
         BDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951759; x=1789556559;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=ZSfxeObLJY1D4vgQLcXCxT+67pBJbv3bJXFRpqvzCta4KiIGyXYNnFnIHO/vx+P+dq
         EH0OEFWCbPx6bT5GEEo9PlcC8y7Beywwiy1EUAak1jqyrKv9DWbdPz7nlcxswE3nNQz2
         wtwupbYpE/lK84fKagGOJ60Y4VLISIfWeqw/x26Vb4cMYVN8iDUCU7JstZp7McuXC54/
         v1QT0Mq4W4HYsQOAmb8aM3tGoFodX1QnkvQtoXKkLFN5stFSE6ojqmHA23hatGOnPYKr
         xZs1SQwEgs4dIUm2N2fnsJEoIEXyBcpOVOWrJ3o7Vf7zCzkQ1ui8r9jn83O04ygXI+la
         m0iA==
X-Forwarded-Encrypted: i=1; AKwUvBwXVXWEGz0cqeuUQ2bPBs+8WXKciwJoU8YIv0wzT+y46ixZQv+OXNjiavUYY6CC/5OqFP8AKnEUMh07/ts=@vger.kernel.org
X-Gm-Message-State: AFuF++m35BLo2wDc/oj1vaBN39ebKNQfFWsiwXLIiv8J3uHE6kQhl9EL
	wLgZR4NnclGHw+GrihyLq/nwcLvwSP7+09Xp/JSLNGdC7XCLGD/SXwvlZRtx4rZ16gI=
X-Gm-Gg: AYBFou1rjLcfZK/4dnEWh9D+di0cqBOPDmtFdn9mi2MsYzSZajDubf96A3cvlx47PWo
	zMWDgEUqRrvEaxub8fDwrft1SQ9WDrtKH1DrhuY3c9mwpDcpb/axHUqwvShLRGzXNixh4+0naO2
	MKv7lGJrCATHNCJQS5Fw8myaOB2E8CVpQUnfy/1fulbjr8CJ8fyhNvgwWqxj4st1QTSTQz3fn5Z
	mmPUVs/Mb7Bit1u9+HDXF4bZSqi+d033Yxq1UhTueQvdkZDXAKZN82apNTiREFtB06Y1HrbGfNs
	KBV/+yaErlkAIjx++UhcLfSSTFBK5UabMzpiWaJi440uOpok6TUxrHNDXqbISk0nsk3ViCbNv3Q
	IGse32+ct1diqjToNxr7S32gQBrya3ZHolIatZ7UaHPPCKD+ssrqg2C76VWGO8iG7Yd4zxYoMXW
	CiTtyt3/aU4IBzAnPMUkFxQNvujSVdPwkpvdjzJQiwGg0Iis1kRcWlBjtrRY+ArjhRfMmsSzeRa
	ToI4QW+i3QvUJz7f8LU64QpOZpKWo3dgeKmr/aGl5kLx11HAJvNnZeiBg==
X-Received: by 2002:a05:6830:6404:b0:7f7:f55a:4bcc with SMTP id 46e09a7af769-8020ee08c65mr696250a34.8.1788951759157;
        Wed, 09 Sep 2026 04:02:39 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa888f614dsm15905601a34.15.2026.09.09.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:02:37 -0700 (PDT)
Message-ID: <fdc957c4-2b98-4b76-9bce-06e4d27c233b@kernel.dk>
Date: Wed, 9 Sep 2026 05:02:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
To: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
 <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Language: en-US
In-Reply-To: <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-7.3

-- 
Jens Axboe

