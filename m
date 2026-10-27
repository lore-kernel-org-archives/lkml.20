Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142293;
	b=22ztCWSPx+w+YImAZapLbqx0thi3GIvsvZTSpRsOwdKvz1lsJtvhgV4zJKA5tqcDWq4l
	 he9bAtTtrXeID8XHQt5bqREQc2FhzZBYwEnRebZi9oty/m2FTaLpnteVpDRpZeExdIzLZ
	 5hpRNgilUfIAu20ajUsmWeXARo+JfIoVuPylwKP86f6zdSEfc+cVx5UUVC+a9oKxrISLw
	 e0OqfyWMcGzu5xKdalU8G3O9q3KHZcRnRRUv9dkbCSaA8TUifWL81+oUORe5Yb3D6+ORm
	 1leIOpxqPBEjoIIcVEeJnp4IAywrgNH22QBuuyGOwCN21mFOdfxnPFL1nWzU2MVDn+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142293;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YOE9zxrNKax2JkchOH7/1IG0IQ1S7GmH8Auc8qD48TU=;
	b=5op5V4AXafw7A1S4ZRJlo/VWO5KThjqx4LRS1wiKqE8aK4Dv9TLxPwWP5cICG3qF8DZg
	 vN3URh34IVQNoxttwjbZRuwK8s/SeNRTyhWvPIrzQ10CqTbWTNaocbfBhf494xLTdzUvQ
	 hBVmM2nkZbk5bK90SsUAbwpuJNbhQc4poGPiHq0k+/CfQl4KWJxjQCe6Cps9MPaA2BGYa
	 toQH/QjiOxmWxdzjqJ49BkBmLu7bCXzhW1/rHUJD4B4KsKYzXUvEk/5nbVsDCGvuxEPI0
	 2Fl+ngTS+o0CF2WOlIUN9+PkT0Nn67/q97J8ebU5R0bep8WQae99dSJlxKuYKmjuxHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1Ga0sQ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C38606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1Ga0sQ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5163D1F01825;
	Tue, 27 Oct 2026 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793142292;
	bh=YOE9zxrNKax2JkchOH7/1IG0IQ1S7GmH8Auc8qD48TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A1Ga0sQ7QwTXszn2AN0v6Qftalj1+97wvk1BdOHhjbfMFDthk41RJheMKDL0QGJHZ
	 64OGoICGqGDPAbnprTDVAHZJDD0IDKhKOANSurqq2DVFBjHwzXzDSRuIK2vMxqZo8c
	 cU7IuOw3PuZTHbQ5kWgxGE4pkZw+3YHtWMrevnBPzowUSCBBqZ1yTcYbIseAN1tIHh
	 YWg8CAvqoW8vNg3PILRJSJsKw2ULAV9JVRtjPTGDjAoZ7vJD6dh0ezg/trrPgVFKnb
	 wyqSSohontetoadD0wpu5M9M6/XphKfzlcaUj8iWBQf3JAfw8TXio1OwzeKWvT4QyR
	 eRwo7WmCb3fNg==
Date: Tue, 27 Oct 2026 17:04:50 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, hare@kernel.org, sgogte@purestorage.com,
	wagi@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-tcp: fix request PDU size when header digest is
 enabled
Message-ID: <auEuEoILz3cndXOV@kbusch-mbp>
References: <20261027194710.334495-1-christian.aurichzm@gmail.com>
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
In-Reply-To: <20261027194710.334495-1-christian.aurichzm@gmail.com>

On Tue, Oct 27, 2026 at 04:47:10PM -0300, Christian Aurich Zanettini Martins wrote:
> Since commit 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation
> and startup") the I/O tag set is allocated before the I/O queues.
> nvme_tcp_init_request() sizes the PDU with nvme_tcp_hdgst_len(queue),
> but queue->hdr_digest is only set later by nvme_tcp_alloc_queue(), so
> every I/O PDU is allocated without room for the header digest.
> 
> With hdr_digest enabled, the digest is then written 4 bytes past the
> PDU, over the header of the next PDU in the page_frag cache, and the
> target drops the connection on the first I/O:
> 
>   nvmet_tcp: unexpected pdu type 159
>   nvmet: ctrl 1 fatal error occurred!
> 
> Queues that a later reconnect adds for the first time have the same
> problem.
> 
> Set queue->hdr_digest when allocating the controller, together with
> pf_cache_lock, so it is valid before any request is initialized.

Thanks, applied to nvme-7.4.

> @@ -1948,7 +1948,6 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
>  		}
>  	}
>  
> -	queue->hdr_digest = nctrl->opts->hdr_digest;
>  	queue->data_digest = nctrl->opts->data_digest;
>  
>  	rcv_pdu_size = sizeof(struct nvme_tcp_rsp_pdu) +
> @@ -3098,10 +3097,13 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
>  	/*
>  	 * The I/O tag set is allocated before the I/O queues, and initializing
>  	 * its requests already allocates the PDUs from the page frag caches of
> -	 * the queues, so initialize their locks here.
> +	 * the queues, sized by their header digest setting, so set up the
> +	 * locks and hdr_digest here.
>  	 */
> -	for (i = 0; i < ctrl->ctrl.queue_count; i++)
> +	for (i = 0; i < ctrl->ctrl.queue_count; i++) {
>  		mutex_init(&ctrl->queues[i].pf_cache_lock);
> +		ctrl->queues[i].hdr_digest = opts->hdr_digest;
> +	}

A follow on bonus patch can clean this up a bit by introducing a helper
function, maybe nvme_tcp_init_queue(), and initialize all the basic
fields there.
