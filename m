Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735021;
	b=4ZouiS+HruVK5QlPDa5ghjcz35nH1PBA6LJnt+FryTcfKD0KzWbeVi1vNt4d3thPqu+C
	 Ui2cDLWvuwYrOyDNLQzqeYokzGfj9gPHsnH9tqPTv/lEg3jxYEsnQp8Ov2YkNjAbdA0cQ
	 NuSi09uUeXINtHu3IEf4AsULiQ6J4sxS5RIBjmRr+SSGxznxHlQOJrL848uhQK0OovxGC
	 IH3wlQT4SGWQm9OvNofDZ2NUFOkxrU+6oT0Qf72SUR4Z1r08wxvxWJXaMirbyYf8nNWb+
	 s4YkIj8TxYSzWqbdnyrbEMcBeUb9dhLvRBv/hqky/X7xBPYFmuFmtm55We0S6GuueJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735021;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6qB0jQs8hu7FwycF9sp0s9p+YLOE2kIUGoFjmCaZyjQ=;
	b=rg9C8uPfF6peBhcl4rop/ENNNTCw/IHsXanoBcA02Lk/r2uGPsQeNJKDkOGoukKMr5jS
	 7yW4Zzdt7Qns240l4YnDA1PJPKMVY/ToSXEYNXH2k7SjUPrMjj3npVVd/Ph+i4p4GiNiB
	 FJw/Pg7fIJHtXmNtvGF5pEQm/Fxq1dhAcnDQKLNCyo8148SC5xG8uAjT1TTJ9YzIP0t9v
	 uoZQdkiexX4iawoOl4RgOaYW5RGQ2sGf4PllQFFsx1OUxLVEMpr+JYjlv5c7tB/aYRonJ
	 uOkK3WjzJfSgqH1TL/l02vXffkNjH03eQoCF32UvjWQZWinBWwXXTirG/HuZxKMYs2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyeQpRpa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA29E606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyeQpRpa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AC81F0093A;
	Tue,  3 Nov 2026 19:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793735020;
	bh=6qB0jQs8hu7FwycF9sp0s9p+YLOE2kIUGoFjmCaZyjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YyeQpRpaaHn3W1/DDkmUxpk04c8+p0E1Iyq+zCLQb7693Es3WKnEDLrVH0Wcrtdr1
	 diC8Hq8x1nZ6dGbXh9gw2qJfsGWAPhhZZ3gzNa7zst4NcsY0Tfp2NyTYZ3Nl98vFck
	 LL/hP6XRPb91WI+ENAvDjUZcC0FPfrgxjf4jeXAddOWpKLayF9LOLba75MKdO+GwIm
	 KPRApz4Vdh1fOm3czxEsPv6MwTYYy9suFl9l500N/VKeO5MpOg1GpqTsJqfC8GgGBb
	 AlvENu4gKbz4nK+vNqmPcOWdOiZgRrmdCTDHQSWI+iXsJTLuq2WGpr0Oef3h4y+/gm
	 VUyy4jBoF7OKA==
Date: Tue, 3 Nov 2026 12:43:39 -0700
From: Keith Busch <kbusch@kernel.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Chao Shi <coshi036@gmail.com>,
	kernel-dev@igalia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
Message-ID: <auo5a1kRTSWsAYtF@kbusch-mbp>
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
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
In-Reply-To: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>

On Tue, Nov 03, 2026 at 04:18:25PM -0300, Mauricio Faria de Oliveira wrote:
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index 2d8f681079e85601a92624d196e77f1ba3ace34a..3ba0666da7be6a3de2e5f0fd50155af115b4e1f6 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -708,6 +708,11 @@ static inline struct request *nvme_find_rq(struct blk_mq_tags *tags,
>  			tag, genctr, nvme_genctr_mask(nvme_req(rq)->genctr));
>  		return NULL;
>  	}
> +	if (unlikely(blk_mq_rq_state(rq) != MQ_RQ_IN_FLIGHT)) {
> +		dev_err(nvme_req(rq)->ctrl->device,
> +			"completion for request %#x not in flight\n", tag);
> +		return NULL;
> +	}
>  	return rq;
>  }

Is there something special about the NVMe protocol that makes this
problem unique to it? If not, why doesn't this check go into the generic
block layer instead?
