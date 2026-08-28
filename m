Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF8839DBF8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909058; cv=none; b=ZzPtCorGiv7qhw+6pJOCLZQqSDj5yCS9DXj8jytnq9+PDpi29WyCa+xUiiMKyXHbPOVJI5u2v+pM/IjQ+vzFEIvoNRko1aZ9RSYiT/nc9bQhnv4aT/D5qmTJF7AlMYSAnqIqzJQMg1bEe8VtMG4eM10FkvMOEbEX4vN67NONBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909058; c=relaxed/simple;
	bh=Hvdo5v1MfFdr47iAeJk70f6z6nybiKkgDuXe2gZCqVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLn6Xz4Pxa40uCi9BJKmJsbuko7klvtXqzFSsTMV1iamLZ6ahE8LjhjWUxdtjGoRjmQNQnUfIaHNVjt449sXQ9fDWHAnr70H9/SX7ENXcsMNms6lhYYzxGqn1wB0V3ac7Kz9KXdgNbpyuKGsfNssDlRIOJnDnCUUvPkxanekoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E6y5rY+W; arc=none smtp.client-ip=91.218.175.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E6y5rY+W"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Hvdo5v1MfFdr47iAeJk70f6z6nybiKkgDuXe2gZCqVA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787909049; v=1; x=1788513849;
 b=E6y5rY+WWnFt4kUNsykrypUpwn9/sqZ0F/A6d4d/LFh01biqtje0SGDU35ljZ5X8E4YJDbaF
 psvYfFztTxCRCEe64ivCU6cUJGRnPJ5JaEMqD8wzPh80ZAzb8hvbWMNzuuuTqL1Q5lveAhe0sx7
 +4q7Zq7u0yNSO6QLXpIvNF+E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8d8a9a2e6a4f7bb5;
	Fri, 28 Aug 2026 09:24:09 +0000
X-Mizu-Trace-ID: 8d8a9a2e6a4f7bb5
X-Migadu-Flow: FLOW_OUT
Message-ID: <a82f8070-cc85-47f2-baaf-70c499834a8e@linux.dev>
Date: Fri, 28 Aug 2026 17:23:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: fix vmap_purge_lock livelock under memory
 pressure
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260824095020.1225189-1-ye.liu@linux.dev>
 <aoxE7rw6gru13DB5@milan> <0c34aab2-9b73-45c0-8fbe-e33895bc8eef@linux.dev>
 <ao3Tf193sQpS22c-@milan> <3b7abe37-4f6b-4af8-a78c-49ff5edff298@arm.com>
 <ao6heKKQLSYMj4tX@milan> <db2d4453-2bd7-4548-a920-fdc12730dce0@linux.dev>
 <ao8j2kOMbCUv5g9i@milan>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <ao8j2kOMbCUv5g9i@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/27 01:35, Uladzislau Rezki 写道:                          
>>
> Yes, i think so. It would be good if you could test it with your
> workload which triggers reported kernel splat.
> 

The problem no longer occurred in the test environment after applying the patch. 
I have send v2, please review it.

-- 
Thanks,
Ye Liu

