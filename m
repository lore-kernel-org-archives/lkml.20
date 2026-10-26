Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999488;
	b=eljj4r/uIhap4kmQKah8ctiYQyy1pVv9/tLcNfDbLioh6BKhPlXQTD/STqZVToXgVmZH
	 Qghy8rbMTRW9Jx2si/4GSeAU0DjhtPKtz8ZQHLKDCEmLbz+x1jweHLgNdlTsqdOx0Ta8F
	 KvsK0wZUe8cD1pcscZeta3TxggkwlMvHPJtoPQrA/XQF4zMF6959e3ASvLPUgCkWnI7dS
	 hC9QRtfykaGSBrGdtExmpyYqcLSJRoKfFDVR2B/5vIsECQ2QbXDcjzoJ23ANUV7iAhsrL
	 ppab7xQy7d9oel9MhwmUgVlgfGwwLxD8bLCL41c0kcSI82e3Li5a4CqaBDn7p+BC3Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tqmqc2FAHq1/TEZ08yuwaWFEYVntE/KXbkhcQq7xhy4=;
	b=tDwJ6q9RRxBkGwLMNuVxUd5Y5h5pMWTnCIHBpBxFNK1jJkBQtulr1RcOUbwzPC6Cvtsd
	 tCWH0M89dJM9Ljb1pNHyVVh1wC++rReMeMRu/RGGgivvWwra6xScK+p1cwHEQ5o217bx0
	 4dj4SdUfGJ1/+1ggkE4W1WUFB6qK0v7Q3PQYriXzQk8OoYO0PwPYr1zi2ZI6ElsLYw+4C
	 h4tP7kWeDyojkrkO4mR+Qiu31JauINdRCp3WqMEOtoEo4DdB7t8VzgSt2NbPPiiY18X/s
	 rcvSbI3JQhvL7v9ViR334VDc5I6GQ7qb06DlJ7XUt5RLJsTBB5GY4gCK3iwsvrPvwig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BoM1xI+a;
	arc=none smtp.remote-ip=74.125.227.8
Received: from mail-vs2-f8.google.com (mail-vs2-f8.google.com [74.125.227.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE5606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1CE5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BoM1xI+a
Received: by mail-vs2-f8.google.com with SMTP id ada2fe7eead31-7cc2f11026cso729347137.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792999486; x=1793604286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqmqc2FAHq1/TEZ08yuwaWFEYVntE/KXbkhcQq7xhy4=;
        b=BoM1xI+aWwraZsm+CuXM3j1YHGtNLrl0aVYu5Xw2USEBsFEOsR1f7qkVPjAiamre+L
         ku2hIG4dESzjVyQQ6ldc1BqrnLv+N6Li0btd44g815WWpz3HTS9MoamvAr9KNiUBEoXG
         Xq+2PSSrRDBWRgE3NibLCakYyf53rx07jrAvThXlI6bdrSNwjjHtEDZEbJsAZMA71uyT
         QfWMQsQx2MYz5DUEptnH+9OMQVllJV9dnYlpdI8opTMeBQAiEZL0iLY5pDj4+xYI4uEE
         9y9C9zloAmrKJ9bzfqqp+WwAPSMWYWwNAfKXSTnNKJQCgeEIlGkE1AEK6UQV3zBTFDQf
         bI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999486; x=1793604286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqmqc2FAHq1/TEZ08yuwaWFEYVntE/KXbkhcQq7xhy4=;
        b=FLev1KAvq7b0gaa0nDZJ1wmzomquwu0kh8NIOv/efYkZF5ue1rimS0xjVtVravDLyk
         0MpIDSEHSdOq/nq0t1pKfOSJQwRDGvxwjZDp8V2N5/e9T61E9Lgq5LPCuShqXXhGiWxF
         oskib3ZK349WDMBzAmwBSGAOy/OB0vQkArTuhUTI0g24fC9XpqbkyFIIWXxXmeAAX7pP
         2NSSU49ZRP+KGfUQjaOODvAGpUoDWbBlp9E9dlInZjIvd1W3WSx2xOGcQvL1xXvCV8un
         J0W4h9Kal2rSbhNQTazLQRT2U/VNak70gHig6aC9LbstXGW9N9XRX4UHMwkQO3WztKaL
         oOXQ==
X-Gm-Message-State: AFq9FYK5PyxFdbMruPrYG4lwNLOdSystknI2u6aMCltv37HgiWLBDqt0
	CIPjUTBcch+ayXfFG94A9V9FaQF23uDcqIoIKTpynVXj0kP60GNz50o2
X-Gm-Gg: AYBFou2Qeh/wdffK4fLn/J3yXrJXpiZespBN8Ai4uzPD+zmwb583CJ4FgECyDZJkcae
	ygSZanqP00ni5lzjK9PKi56YP7M51QkSf8vkJf6PO+muk3mKpt+vk4ECRLf054lkR4wQALf6Son
	ZoBrfEuUxmKKSyfwLlGMou4eWmRG1RwtPkYcqbv3aYmFHjMTZ3GMTzQm1/Hn2hH+YKdHtiGlsLr
	EDi2JtLgZn3F7UB3/9/K1CInFgxkwAib9t1k5olILWZ2k07MnHvGrawHlRRZY//1QSwiWoRLimP
	z6mdlgymFBLIWWvff9ewfWqp31oN/2k3FV0zblBizFfm91JfTCkqLJNUGk2scTP8KYptEUTuPcq
	uhIFp+meLyi4dk4+YA0vXpeFTdPL/Vwxa1zQ42CeQWcTFOtLqyTyM9246tk5oTJMvjtvW9PyNtq
	qp6w1LIr7Fut8OVfV+G40br+CmIwAURAMk/Vt4myTG7UU02K/CwGdF6n/SRVbKJZLfwzzfqUViT
	472j6NCQvEB0FAkWcKJar1b2ZNLn8F6udvDgY3hq6z+LJB7iC+y09Jz2AtFYAM5zUI=
X-Received: by 2002:a05:6122:552:b0:5c9:c60a:e9b6 with SMTP id 71dfb90a1353d-5ec232dd5cbmr1925464e0c.22.1792999486437;
        Mon, 26 Oct 2026 00:24:46 -0700 (PDT)
Received: from linuxmint.. ([2802:8010:9a07:5b01:117c:ce91:5502:4059])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234ad50csm7363461e0c.17.2026.10.26.00.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
From: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
To: mpatocka@redhat.com,
	yukuai@fygo.io
Cc: linux-kernel@vger.kernel.org,
	dm-devel@redhat.com,
	Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
Subject: Re: [PATCH] dm: reject kcopyd client destroy if it setup failed
Date: Mon, 26 Oct 2026 04:23:27 -0300
Message-ID: <20261026072327.1363893-1-nehuenlian.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026042137.178310-1-eadavis@sina.com>
References: <20261026042137.178310-1-eadavis@sina.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Edward,

I reproduced this bug using the syzkaller repro on a kernel built
from the reported commit.

Effectively, in "drivers/md/dm-cache-target.c", if the execution path
ends up in a bad_* goto, *kc (which is cache->copier in cache_create) will
be freed and the function will return an error pointer, but cache->copier 
will be dereferenced later in dm_kcopyd_client_destroy, causing the bug.

With your change the reproducer loops on "could not create kcopyd 
client", which means the null ptr deref is gone.

I suggest removing (or trimming) the call trace in the commit description
(is already available in the syzbot report linked in the patch) to keep 
it cleaner.

With that small change in the commit description you can add my:
Reviewed-by: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
Tested-by: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>

Thanks,
Nehuen Lian Bova
