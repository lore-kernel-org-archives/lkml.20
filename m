Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30441359A6F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922780; cv=none; b=R5UpLahWU/OFTA+KR/ul7hldwX/fwbUEWfrw2vXRuldI7wr0gwxkajMhz+zENrfYhmIpbZTIvFKLXK3TIgGPds6dMArjGGS+QSdsiCGu9BuIZZ94A2Pw7idh/c7crZBkJYxZ+lMhDWVbN4TXW0DUGd/1NQH0Y2klG6HF1/fbHRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922780; c=relaxed/simple;
	bh=YZG/JSrF/VgDZ41PuQy1wlBeOCLxrcnR7jrPKEkUbq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfiztyiU6MguMS/ekMkWNOhoD+SonuV56HQPBo+BfRNCT6jlrBQvGLLYUIC+anM/w2nv7D2GSgLLTe1VRxEx6d1hcjtAsij1qgcuVl4jnBFvLNb7meVURd8KX0qJ/fcWkjndujhBvhDbXlTWtAzAgwg6wdyiPFD9F+mGHHVKnD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=X/FmnSM0; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="X/FmnSM0"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YZG/JSrF/VgDZ41PuQy1wlBeOCLxrcnR7jrPKEkUbq4=;
	b=X/FmnSM0cS8HU6OnEAMI/DZZTXh74QoTo1Le4oCvCSwYeTWZAk46qtXTgna18+E49nQq/3iSf
	qheht6algnU0qoCJW6XzQRxdC+oG0Qbj8Vq0w1cfmLdGs2jC8aYEKUx+ov57SbCcT6l05sqTHc3
	9rNWE4N6n5crfeJk95LZueE=
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hWf1W1hsjzHnH49;
	Fri, 28 Aug 2026 21:12:15 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id F07E740569;
	Fri, 28 Aug 2026 21:12:52 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 16:12:52 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <ljs@kernel.org>
CC: <akpm@linux-foundation.org>, <artem.kuzin@huawei.com>,
	<catalin.marinas@arm.com>, <cl@gentwo.org>, <david@kernel.org>,
	<liam@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux@armlinux.org.uk>, <mark.rutland@arm.com>, <mhocko@suse.com>,
	<panov.nikita@huawei.com>, <rppt@kernel.org>, <surenb@google.com>,
	<vbabka@kernel.org>, <wangkefeng.wang@huawei.com>, <will@kernel.org>
Subject: Re: [RFC PATCH 02/18] arm64: align kernel text and rodata
Date: Fri, 28 Aug 2026 21:00:17 +0800
Message-ID: <20260828130017.134474-1-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apB1JCaNkGQMJQqq@gremlin>
References: <apB1JCaNkGQMJQqq@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Hello,

On 8/27/2026 8:35 PM, Lorenzo Stoakes (ARM) wrote:
> On Fri, Aug 28, 2026 at 12:11:42AM +0800, Nikita Panov wrote:
>> Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
>> Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
>> Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
>> Acked-by: Denis Darvish <darvish.denis@huawei.com>
>
> One small note on procedure: it's not really the done thing to pre-Ack
> patches in series sent upstream like this :)
>
> --
> Cheers, Lorenzo

Thanks for clarification, will remove it from future submissions.

BR
Nikita Panov
