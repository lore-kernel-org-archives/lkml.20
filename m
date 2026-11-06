Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986981;
	b=SmhZVsI53fcff2lX/XWtZM6UM370YOOL18oJRel51ET1ZdEriyYRiLowgPAbA5W2XHC+
	 WKQJB6nw+BPiJwgor6kfl+F54PkemCekNRJBC9TxB8AAX4wKCZQVXiyceoOO21UTvb9NO
	 T7KdQ5uUtrBOutSRrJ3cIcMjd65XX8hgsZsWLddOq8/yiwsYBQ0foZFTLL/1KsAMh4feK
	 g/BPC8MA83zAGn6GnDgFBNVjYU+dQJZbFRljuF9FTcvhDbSQNar7T/0020+EwTxo2m72V
	 zhBLuEuRR80sd4pKBTjfCftINsCsgOhS7MaRrtR/ZTmLeg8Nrk1CW+0Tjo5233AUGgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986981;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iyg6Q+qrD2UpnjN6XRmPgrn4h4cKaTQ6cc1+uggWPUE=;
	b=3e6vInr/CJ1++gDXG+U2jKXV8dU60qP9EuGvqUZ2NdkK9oTpiQemn7tQ3FTBcSPNlKT6
	 aM0Yr+IpDIVlx4XaMZ7Tk9p1XtOgWpo4g42nk4to/SxOLC6vCzPs6StTxXrJmVNw60sUv
	 7E4IpHoLl6ovDxG+8clKGEh+zLV3HzOjPEPffnZdsAlR2oVtzS4v68BiTJYxzgjiuJwz6
	 sHqyoS9Twt21yyR1y7oAxw8/ReAiox+4l7SJfBLuELYDXER2R900eK1bcUxh5g87Ge29n
	 D1uuWH37KcGnvcqTcSJyc1BAHJdhUTOenD/GFRw2AmEe95PXbA8+jfN+wYxcyYnqInw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVBk83LQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0565D606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVBk83LQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77671F008A2;
	Fri,  6 Nov 2026 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986980;
	bh=iyg6Q+qrD2UpnjN6XRmPgrn4h4cKaTQ6cc1+uggWPUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=oVBk83LQW0wLM6C4DDhMhh3lLYgVGrr7V07EMSbERL19EvIlevFWWHtokFnEnZ1GK
	 R1YeMHM7pAcHdpCccIrx0KRqlt3W619KGZPYSyZa7bL3hetis6E0sNZqmG/41wfXy8
	 dsoPswHqmCJNXX5V+xNacjzGI6t7ceRBs30p1zFRdPOYy0TnpSHbWpJzwBIcqJjAHY
	 TMprK4hwdvg163C7vQ7OSa5lxTYxQHQDP6kdmraKbZ3O34aYBVDlTBuNg6L3Z0RyqS
	 Wa8EpwVwA4TexvFM+PG59bsGvJwFMhTo8jQYlF3/4kR7CVLlRADNBtFXsm40nwd0/7
	 b001/vjR7H2JQ==
Date: Fri, 06 Nov 2026 07:42:59 -1000
Message-ID: <bafc737c395f64580feac56148429264@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.5 v4 2/2] workqueue: Keep the limits of both max_active domains current
In-Reply-To: <au3smjfpG3_ic2Me@gmail.com>
References: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org> <20261029-wq_final-v4-2-2985ea9f24fd@debian.org> <56db993fd60efc4892e1cf1e38ba48e1@kernel.org> <au3smjfpG3_ic2Me@gmail.com>
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
Content-Transfer-Encoding: 7bit

Hello, Breno.

On Fri, Nov 06, 2026 at 07:10:56AM -0800, Breno Leitao wrote:
> > Maybe this means there should be further restrictions on how low max_active
> > can be pushed. For example, a workqueue created with max_active > 1
> > shouldn't be driven down to 1 in either domain, however it gets adjusted, so
> > that whether a workqueue can end up at 1 is decided by the max_active it was
> > created with. One way could be a floor of 2 in the setters and the
> > derivation for workqueues created with max_active > 1, while one created
> > with max_active 1 can still go back to 1, e.g. after being raised. That's
> > just one option though.
>
> Sure. Should the floor cover min_active as well?

Yes. For a workqueue created with max_active > 1,
workqueue_set_min_active() shouldn't take min_active below 2 either.

Thanks.

--
tejun
