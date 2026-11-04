Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822898;
	b=dkkQ/uKFDDwJQ99weVdVDZJwxCHYVztlVZgV9ipPn+vEb8Rsu2W6SPLwqjgVn/VQ9vsR
	 XqWa/Hqjm6nBGWKg8JasLQa6refKrReGy4H/DsqiqV4P7vf0Avwo8w7fnjxFx5I2jNGWR
	 IpkZyMCed3VEspQxeZxfRjgW/N8X0UvQbY4iDZTHTdpMdIBnFsBZokIhXtpeAyqjsHB8h
	 uh/RHO/IGHSOs2s8Y/yl4MvzWYA83nBHOpjoGdCz4snD5Upac4heEorj2u1CNlM9ku89S
	 9KXyi/meR31aIKHC4HvfImqZlIWSaUBzwaEpi00a3N6bfBFr5ryPuvmvFHb6/JS+PQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822898;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Received:MIME-Version:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Report:X-Spam-Score:
	 X-Spam-Bar:X-Rspamd-Score:X-Rspamd-Action:X-Rspamd-Bar;
	bh=0PcCihOuFAnilp2mklYvKQzE/8b41vnt7v3E6IaO7LA=;
	b=P8eiZQUg5gq0q8d2YJL7ZNUdxJfhfNV45eOuchJd0CcNIDXrxyxiybO3zuSYD8LK7Quo
	 gn4P/tzyWeYioJ1r0SocfKIF2ANT+Ae0DG+TIpIp+b7kJvNkC5XahJIyrsueuypWWWzpl
	 3j3l5aCBNAWNDAlDvYFG5Hk5AqjWJzU8bunIhm8hsuvPSlLnUEA4ZBOF0h0wXrh9/z893
	 mkGHIdFQHy+AidlzmipYiTNFBGfj9svjPDjlQCsdkC8a9RHLqwnjh51GfYD6xHcYk51HA
	 qN8KKHIBmBMZx+6PzGAotZdAGwTVIDtv2eMRUTNE6tdlOD7zJoPNeSJVeGZqPaPqJow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b="d/EaO050";
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB83606D821
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB83606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=d/EaO050
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=0PcCihOuFAnilp2mklYvKQzE/8b41vnt7v3E6IaO7LA=; t=1793822896; x=2109182896; 
	b=d/EaO050Waef0VGvBBKY7b6mGqO5i4TlnYImHiLs843C5ij3oks4y/bfy44BQW5HqLExELPQR/b
	zT8qYQreNVpZH6z0YhlFnCdZhYcKFcMF81oLPswv741zMrX3eOK7rRudiuSe7jldfjS252gyNmpCK
	enM4epYLPN0890LnuvfNz9yh6NyuFFsiC3xa4ielRorAEuqjDctt9lnxApagNZFFOw9x+AL127DA7
	6Nv97ScI9hxUuTxGwvp1msmo6GsACiRN7OhTFT2TCU6ppiXfmV6B+xF+Bby4ScsLM20WDMeLb9Igr
	4Sd04MJb0vcxTJvkkNgEAB3VgzH0RRB+6rfQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xOhHD-002ceZ-1n; Wed, 04 Nov 2026 21:08:07 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1xOhHC-0000000EdDv-22S9;
	Wed, 04 Nov 2026 21:08:06 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1xOhHC-0000000F9iF-1R6L;
	Wed, 04 Nov 2026 21:08:06 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 17:08:06 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi
 Grimberg <sagi@grimberg.me>, Chao Shi <coshi036@gmail.com>,
 kernel-dev@igalia.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
In-Reply-To: <641c7c0d-0455-490a-8811-e6eda728a7e7@kernel.dk>
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp> <352cfcec6865cbf636a22442511f16b1@igalia.com>
 <auo-v5ZliGbM1Tiz@kbusch-mbp> <65414ea51d23fdbeb5d8b7bb4bd9d535@igalia.com>
 <641c7c0d-0455-490a-8811-e6eda728a7e7@kernel.dk>
Message-ID: <cb53c4ac3cd1ec95ec01374dc757a5f7@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.9, Tests=ALL_TRUSTED=-3,BAYES_00=-1.9,KAM_DMARC_STATUS=0.007
X-Spam-Score: -48
X-Spam-Bar: ----
X-Rspamd-Score: -1.6
X-Rspamd-Action: no action
X-Rspamd-Bar: -

On 2026-11-04 17:01, Jens Axboe wrote:
>> I agree that a device in this state can't be used successfully, but the
>> kernel should, IMHO. 
>> Say, in case the device hits this due to firmware which needs an update,
>> the kernel crash might prevent the user from applying it, in the first
>> place.
> 
> OK, now we're really reaching... If the device is so buggy that it can't
> even do basic operations without violating protocol and crashing the
> kernel, then there's nothing the kernel can (or should) do to try and
> prevent that. We don't cater to severely broken firmware or devices.
> 
> Please stop all of this nonsense.

Ok; thanks for the feedback and clarifications.

-- 
Mauricio
