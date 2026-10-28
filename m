Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199201;
	b=zqVIz1mYJHQQ+VPIvYZU+SQwvdE1Mvq5lzJAN4wqrSJcvNvPZh2x3+Rz6KNhESxI1YYc
	 Mx3pLgZwyhUcjatj7YMjIBw30xCLZOGNEH4kTlYoz8d8gS2pzs8ydO7yS/UNd6+33NRwd
	 /3hm02hD4usqQqNoA2zcnO6n7UGixwYZ261NNDGojZ7hmfOJf5X0toEZWaEoy1uUKmDgp
	 3v+5UEo+19tIqDbdnwxsS2JqnvTgJX4CMKG1dYnv5mTDvHo5AAVKyOefsK7kZoFPxB58w
	 EpRlWAYyc5baGI/zhY6d7MATaWQRxtUwC0G7xGe2remXSeOLaE3qfzcv9DVX86KTf9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199201;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4ApRypjtvurvU8lrMAvVl2EvzMRrjCy3MkYP8jr8EAk=;
	b=edBFbxHvPWXxWQL8xdBrH2wJ0VUe8tCaKRs8BNZYS+lcJE5qZJ1ClSFbGQGayfhbHvrz
	 FCa4XkM9dZBc298tHbiwEeJjY6SGiinZxblTAXc4eRDiNxLm3yIKhBE6s3p+Gz7kpXLeK
	 fhOKaNX47tGGXfj2062o9mNLS9BtJCY6/v56IPglLMdKQPmASlHiDfgRf//tHVxefFHUZ
	 YqlF9CE5GsMIRctZcBn27GqZsLjMImecOX2kJqOY92Nk+zgG4Cw588wBCTC/5+iiGR7gJ
	 hHR9MA4/KmvCyZb0Q0wxtjzTkR3iJD6C7mR7Yw38FlGr7ISdak9yNtZyoebJY3VsQSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Te3eXccs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1265E606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Te3eXccs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441941F01828;
	Wed, 28 Oct 2026 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199200;
	bh=4ApRypjtvurvU8lrMAvVl2EvzMRrjCy3MkYP8jr8EAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Te3eXccsimcAhBFgCflRDCKdZnX2NngBUXpllFjHfYidqlci14bgVUbEczVoBf9lM
	 2iQeil42ysT//7I+gNeBTHMQLsVkVHBtiW3lYcK6U5+tUk1TwbwIa4T7WBu6EKZIAn
	 DfBwnHv/eUdYZi++3LdbWtobxUWi2yAjibSfcf4B+P+JWODKJ0gSuuaf8kyQeUFnA+
	 L2zsYNq6yzwQsKfh9kPRixrK4xKFXLKxE0ZB8OEp9jquaqKXLADbcNYKNtDyB18yvh
	 0VF78Q8o1xQjTe2jX5mS6Dd19kghsrYrm8jSFdS/7nGhiFSGv9Cy3fXMnA/SCnYi7e
	 r6iw405Dzinrg==
Date: Wed, 28 Oct 2026 08:53:18 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, hare@kernel.org, sgogte@purestorage.com,
	wagi@kernel.org, kanie@linux.alibaba.com, nilay@linux.ibm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvme-tcp: fix NULL queue->ctrl dereference on
 reconnect
Message-ID: <auIMXvQcd3JdJbNI@kbusch-mbp>
References: <20261028143343.221936-1-christian.aurichzm@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028143343.221936-1-christian.aurichzm@gmail.com>

On Wed, Oct 28, 2026 at 11:33:43AM -0300, Christian Aurich Zanettini Martins wrote:
> +/*
> + * The I/O tag set is allocated, and grown on reconnect, before the queues are
> + * connected, so blk-mq can initialize requests on a queue, and dispatch to it,
> + * before nvme_tcp_alloc_queue() has run for it. Set up the fields that do not
> + * depend on the connection once, when allocating the controller, and keep them
> + * until the controller is freed.
> + */
> +static void nvme_tcp_init_queue(struct nvme_tcp_ctrl *ctrl, int qid)

The comment here has a weird cadance to it, with all the, comma
separated, thoughts. Something more succint like "Set queue fields that
don't depend on the connection" would suffice, but I don't think this
function needs additional explanation.

Anyway, no need to send a new version, I'll just remove it when
applying.
