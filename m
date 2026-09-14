Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875141F5CD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378550; cv=none; b=TkhbX4t3rRTOvFAMDHj7VbOqmrBbhz3P19PqxLkwlzxh1FkQ18ODR6pLz1VScLlOVu4M6H6uRG94m0Qu540eIoTUrjzY0ZchcJXCSGEH/35HGCTH/30kGaqNaWh9OiY+n/0jmFMnXdWp7gYZ3QgnaO4scMZqgw4Rd6VJxUym358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378550; c=relaxed/simple;
	bh=sOlPnOIlJOoH8xQSpL/ZeGLPkuQHjT56UXwh/NQM53I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBQ99J7p7bMpyqaSU0qQW5DNTakGxzZQcF6I5Zrm1GurUZQZyJtdXDNE+mRLtPYS2ARXmqFJCq3hd1HCFgqPYTc5c0hJx7l3evCpVJE/BjFR8MIZG8bFl10ANjM7PLQFat+JCgwYJ7iXlLRHEKFoQZlP+dm5btPstX0/JmLEcw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1GfoYQ4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1GfoYQ4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b965570d7so40226355e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378547; x=1789983347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sOlPnOIlJOoH8xQSpL/ZeGLPkuQHjT56UXwh/NQM53I=;
        b=G1GfoYQ4XQLvOqPnBv1trBKUOhmiFCdGWghjVQ++C+C+VVQZu3TVHi2wvEHopudNSK
         GKenKF37/jsaE45nERqIyJW8SmJUHbScFSKrv0e0ATYru2tbUcJvSwGsk/N0KgAQwOeC
         PK4o/HI/WOXuPHgD21ybd/tahPy6zjMjfuu59cAEIbNM68mzPSJ4Ld4uNqB+/NsHZW+i
         ms++4u+D3EK3BHGUhJxkfXhOURu5EY0X6UaAfOdEy+AqxREvYAbxqMfUNqXR1RJ642XU
         m6KfKvKLnnNWlNvT+2YRyxlZvww3rwmNvY3KdPxTDk3Xo8tLxPPLtulDLJYubMyxh5W0
         y5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378547; x=1789983347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOlPnOIlJOoH8xQSpL/ZeGLPkuQHjT56UXwh/NQM53I=;
        b=iF+ow/Qjml8H/73LYm257QSaIbZDcSEXdow4KUfAecoFzHxCpZ2KexMR9xAsQvc32V
         BT23MFTM002nVy1YZatOHiCzcqAPqJGBxpYlFnzVvMXYt9EUCxUQ2H0jlz7st3nwNCJa
         1QQ9V1oIAduUdJbLvF7ETm6So2KvR1N72eiPBxh8y6WJ8vGQJygMiNCd00U21AmubmJo
         bpRLz2sWRcMdjStIHdf6ohAWTexT61YGkhg0oq/3ZFr65RGc3KPdFOzybuc0/XMzLlZv
         XHoVMwnEDPauVf1SGgfvvN1QAO4B5RGCV95fAGJ3gu4B+0to3R3u/APqk3nOqYUVO+3l
         6V0Q==
X-Gm-Message-State: AFuF++mnOCpk18pBvkgd+IpW3zox1Tf1AzreAFe3bHeqpWVesqiv2jLM
	QxnWxf3oW1nAi3qSCPhUJaSjlckZP3Qp5KcbYua1vLHcKac1JLgk+g0C
X-Gm-Gg: AYBFou00imytHCyxjqrc8Z1RbhsL5uaZKCWqn4FcbBJa2wr8PLbztMYROv3Wcu5QC/+
	5JKRhFsRLVOBTwtJkGEGYI77SuNSDPJpADfHU4DkJ79oeDUUIq8yIUDGTMd5OTqnfYBvDw0kbu1
	dBz4StvG+reLRwDLmIvNkJ/+sA41i1xQWdGW2NlzvKT4XxiHm28oIuKYaVLvwnD+BDkO5EDJEwI
	quC2J6wuWjNHaaQuWeC9DeY8QCl5UOg2FNCveXeI4yFfFsvXKSdi3ZSbdltLqQ8zcUAGJ+qXBnQ
	xCQIguEdLBpA6ZQoP1HWFuy6OV1+GgOBO2k+Ywj3jXDIdG3/VNY7srYsCkQ0r+DrKzfVCT7iSlH
	uje/oazPjWUcf0rHAFTPqWEBqM1egJzLxWjo/a28ANgh4W9mDJjw7a8vto0eNwvTVnZmVG0Un5Z
	xaU9klAm8cQu12lbSy0WOw1nBNd+NcmNwBlHwL0YPjH8uT1nEctt2KznMeaHPvi4Bbat2sbiKgz
	G/ruJqy6xWVhJc4XJWeHqH7urrorIDIG9wSV94ZPkDtnvw=
X-Received: by 2002:a05:600c:860b:b0:49e:79c5:ee93 with SMTP id 5b1f17b1804b1-49e7a64b4dbmr18373425e9.8.1789378546566;
        Mon, 14 Sep 2026 02:35:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm27261204f8f.23.2026.09.14.02.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:35:46 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:35:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?SMOla29u?= Bugge <haakon.bugge@oracle.com>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, John Stultz <jstultz@google.com>
Subject: Re: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
Message-ID: <20260914103545.3db6eb45@pumpkin>
In-Reply-To: <20260817130239.343594-2-haakon.bugge@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
	<20260817130239.343594-2-haakon.bugge@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Aug 2026 15:02:36 +0200
H=C3=A5kon Bugge <haakon.bugge@oracle.com> wrote:

> Add a stress test for locking and atomic synchronization primitives.
>=20
> The test maintains an array of elements containing counters
> initialized to zero. It creates four worker threads per online CPU. On
> each iteration, a worker chooses two elements at random, increments
> the first counter, and decrements the second. Each completed pair of
> updates therefore preserves the sum of all counters.
...

I think 1000 elements/locks/counters is far too many.
You are trying to hit contention so you want a relatively small number.
Possibly similar to the number of threads running the test, but maybe less.
Perhaps nearer the number of cpus.

Also you are only going to see an issue if the RMW of the 'counter +=3D 1'
is split by the same RMW of a different thread.
That is pretty unlikely even without a lock.
It would be better to force a short delay between the R and W.

If you use change the MX_ATOMIC_ADD to use the atomic_long functions
(I've forgotten the exact name) then all the counter are the same type
and can be removed from the union.
The default 'just use +=3D' code can then be moved to the bottom of mx_add(=
).

David
