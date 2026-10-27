Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141626;
	b=FRQRd2hMCtE7j32fmKh4+eoVLaHm9xjjkQH1vMpi40qEv6MV4b+3Xl4V2XvHrMALDC6m
	 HsWafF+5qCh1IWlzIVqQge8js1RJLcX6sNrrKhKsnVgxZOS265ROuhslsRTZiLCAgBW/m
	 uboW1g3sVPQRX8/rpGmRJ/eM5a5GBLQAwbQ3YSMdD3bGcPKcim8JAZo1Bg4Fi7Vt7cKq6
	 4puhYPhG2pMG5i//iSIaHWtr/mioQtsTM65c8AdVofugT1xdqjBWnuJXlBZTqI9XitgEG
	 lGpQJouZok54EO8MhPHFetspTFhhgr2eLgmjIlXlABrvUC3pSReCVo9RY+psqcl6p5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141626;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W/pRLNrsz15lpOWQtGvs2p5w7AEgYY+eAZ+/hxAp9uM=;
	b=hVbZqOvPgZsfs4nbTD4Js+XPjONzXw55psHXQ0h/aqrppSbfnLrJqHTNQKUX4cUoA4Q0
	 tIb/c09939MPdO/sSIgwQ5H+WUxBwGkViu5uvU1a8bpPRaNxJ46AsJq6DKg4LMsb434oz
	 QuugWxhPewEmXnrR1EgPN+Wh0X5YnXscmqNsYTBR6vbYBknMNDzOJCLULo4ProtSSkiKp
	 oBjVhVGEuSf60/8QvuF+arrxlFVJwq2yvnW/w7kTy8JZ+nqDN9ZMcyIblbCaHxHPqhgJ4
	 hXq9/dIWUQ1F+ouCmyO1GsTpLyBTCUUV1rOdkoLjofimdur1YoUIwhGLr7ia+nG4LhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+7ylXEW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683DF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+7ylXEW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C231F01825;
	Tue, 27 Oct 2026 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793141626;
	bh=W/pRLNrsz15lpOWQtGvs2p5w7AEgYY+eAZ+/hxAp9uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+7ylXEWWUmwzrvainHKo+L+66ScH10XkZyFS6XA+4xsuTAfanMQFQin9PHZ7CuRj
	 aGrH+GjmJT8Rw1zlLlz6t8dfPYT0c5MMJt7cVO7oAjBBjMMroYYMFOnVG7Z4CRPT9k
	 6Fc+9y7GzjgZPjgP9uxGyqIIVCEsS9HQPftqywNiXpyp3yQTgn/94ai/J5h+uCAJgZ
	 OheDHKio1aRvyO+4/xlsvzeEJFql1ovUlVE6K8AwLR/4gWC5Zw5orfxZI01LfbS1oZ
	 KDlvVLtZAKkKrH6j261qkmL7hdxRoRK2B1AheNBlw5cvZUPv5XlQXQ84+5Kee+TfgJ
	 4smF1OwjI/b8g==
Date: Tue, 27 Oct 2026 16:53:44 -0600
From: Keith Busch <kbusch@kernel.org>
To: martin.nvme.dev@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin Belanger <martin.belanger@dell.com>
Subject: Re: [PATCH v2 0/2] nvme-tcp: handle TLS control records at connect
 and on receive errors
Message-ID: <auEreAhSYCdGCWvt@kbusch-mbp>
References: <20261027-nvme-tcp-ctrlrec-fixes-v2-0-9656395ebcf2@gmail.com>
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
In-Reply-To: <20261027-nvme-tcp-ctrlrec-fixes-v2-0-9656395ebcf2@gmail.com>

On Tue, Oct 27, 2026 at 06:38:51AM -0400, Martin Belanger via B4 Relay wrote:
> A TLS 1.3 peer can send records that carry no application data, for
> example a NewSessionTicket right after the handshake. nvme-tcp does not
> handle them correctly. This series fixes two cases.
> 
> Patch 1: when read_sock() returns an error, nvme-tcp does not start
> error recovery. The queue stops receiving until a command times out.
> With a NewSessionTicket on a live queue, I/O stalls until the I/O
> timeout (30 seconds by default). With this patch, recovery starts at
> once. This also applies to plain TCP.
> 
> Patch 2: a NewSessionTicket that arrives before the ICResp fails the
> connection with "failed to receive icresp, error -104". A target that
> sends a ticket at once, such as an OpenSSL-based target, cannot be
> reached. With this patch, the ticket is discarded and the connection
> succeeds. An alert in place of the ICResp is now reported with its code,
> instead of as error -104.
> 
> These patches replace patch 1/2 of Hannes's "nvme,tls: minimal handling
> for TLS records":
> https://lore.kernel.org/all/20260922133708.84522-1-hare@kernel.org/

Thanks, applied to nvme-7.4.
