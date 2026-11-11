Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383096;
	b=UjkoIhhYGsmqL7ktceaMVWMD/451TgLY4ZNw/Y9lEzykWAWeGjHF8ZnNfYZ66zovMtXM
	 SKFCywGNZ3MOaldbbCO7IpH4QUj1Lsaex1X7hMXyCMFPylDTtke4GLcN/3UMOp6lkLBHi
	 C2soVZs9Oj9KlZTFMQVOELQPZtgj0WNRHef72KMwXQe7aC+gjcveqa9WMNBhPODghgihY
	 eBgyck7v2m7rQv2mGzhcmcTmtrVkwssQR7kRgF35qOIxWuKknl+ZKsociUlMqNmnrtKyc
	 cT0DOpUbLT44wWuWF7jvXZwcybfKWz0xlm6Fe6rn8kQ5Yy/wYeHvLWjJUMc4meqCSQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383096;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/WW4T5PDdj0B0bz3oK5sZd4Z6A+mKi0CG/XCNeb4v38=;
	b=ofniUmRyHvhdqfpGqBO1beCYAYZ+JhJRJ4GmrqzrxadREuXcmowyQsAM6nGQfnobFAaE
	 6cShI4Qq7jkLeEuIHG5QWN9lnK0hRBwuagAw71PVYfzjJFnnfNlgA5MyJHcuglVoUvnU4
	 85vxG3G0kTOrAQcLBgDCVvI6+rFag+vl/D9bJ9cvlgjNrJMVXL8IGfZM1kKmgroul9LvN
	 jUFyPUnGrQnv7/qnq0bEAHrRdvfj1HL3EMw3EQK+Rpqxsrvm8DAm/qY6NQsGrcU+aWtsD
	 Wj81MNnMtpMr57o+rSRyCe5ig2C70I//kWxnc2WvbT28Kl8XxF7rnCYqSSujD2QRM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=v8qqnNUQ;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE85606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE85606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=v8qqnNUQ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794383091; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/WW4T5PDdj0B0bz3oK5sZd4Z6A+mKi0CG/XCNeb4v38=;
	b=v8qqnNUQrqi5dSkG5EK8hP17cIkaI5JlgvTUEMDF/YqShTSbMvHOk0zleA8MVkaAXFSkMuexuEjx4cszS1Xo5j/SO1mD38PZOowv9RrtPwQAP3c1s/Qdx7NZto0mNI0ZBeME1xll/6AjnjLlVVdz5ibijsgo5IvOchlWdsNlcUI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XEYBcfp_1794383081;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XEYBcfp_1794383081 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 15:44:51 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: catalin.marinas@arm.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm: kmemleak: avoid long RCU read-side sections in reports
Date: Wed, 11 Nov 2026 15:44:39 +0800
Message-ID: <20261111074439.316823-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261109211709.133122f9f10091f06c4acbc1@linux-foundation.org>
References: <cover.1793871596.git.tongweilin@linux.alibaba.com> <20261109211709.133122f9f10091f06c4acbc1@linux-foundation.org>
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

Hi Andrew,

Thanks again for the review. Following up on my earlier reply, I'll
withdraw patch 2 for now while I work on a simpler solution.

Counting visited objects alone still leaves an unbounded RCU section
when walking removed objects. I've tested alternatives, but they add
either substantial read overhead or more cursor and reference-management
complexity than I'd like. I need more time to find a better balance.

Patch 1 fixes an independent cleanup race and has Catalin's Reviewed-by,
so it can be considered separately.

Thanks,
Weilin
