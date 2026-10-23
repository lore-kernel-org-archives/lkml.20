Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790897;
	b=G1IIJ8A0iM4usICu8ahFDNQZeT8O9wuJ8yDqbzUcWECTTqmZHdgFvIzPFkxzjzxnV+jK
	 ia/G6vMGD7p8g+fH+fcQaxH9R6dPyaOsiU+eEzoCje9P8fJpreJ9quMvNEP49btzVhlB6
	 fosKa942Te826I35Ymi/UzH1IOl3u3uAcbqtXU6ZDOSngSVboussd9N+BEU0gVKNlN+uy
	 w8znNr0tdMJYXGhFINtPWr3muapP0ONs6BqS0s5ajRcdqYfYpOkAKUUA3e56l34tScagS
	 UYOZUWCniKDsOAUOtzwJ4RULr8XACcgmQ3K2nGzo/+6qHLUe7WRa6/oh8ZwwSBABQTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790897;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=65NXKcLWg5y07a/0Qm5N3Xlh+w2sUyen7hNQ60BZuJk=;
	b=XrCa6ZFIyw7vvq+MgKJxyw/MmPVozKKg81wmRtTYwT6S90tPJNtlFM/e8/OGNHZqQZa1
	 fiEwjZENDXihl1QFgKnB4RtCTEdzNGSpnM9j8nj2zgP9F24ZKyy0eLV+X7EvBe7zcUov2
	 WQepVQPpv8RXiKHGhxFkOiE1DPYrMfOFKZI6wC31uAaS3gRAb/SJ0vfKWl09aXNtQVnb0
	 pMfQ/wxevYCJJU7s+/aq4AhBxwasjVtFiNDM4JG0iNConv+OjvW13HXky0odubm1KRm9s
	 1KE4W6yVqspFvjzl5+XMBRbSINYvMevB5CcbW0TxFXmlEjfd8G3DDMUWjMENvXIA3mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVXjtNgX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15340606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVXjtNgX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6E81F01828;
	Fri, 23 Oct 2026 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792790896;
	bh=65NXKcLWg5y07a/0Qm5N3Xlh+w2sUyen7hNQ60BZuJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QVXjtNgXRLDTH6KFI1r9V+yVDy3PgTcL6Zk9WmEYZYmIzIiuak0BzKsOKj7ueQRMs
	 /KCPGpdwu4HsI+4Gvcsi5CLRanmstP1IjNs1HM/PsJqqGT4DGlV1/XFfAZ9nVpRhIt
	 91cyqJrwPzgTHFm7OD1i9cv4KAYn2qDcBrW265XmRWbRNeJeYDBFNJwKdpgzhBgZ3M
	 qQDCxmD5DVzAG9+BFfgI2Pf9/beo+ZrbMwlnxrJpDPTPLpYd2w92z1gRgx2/0RgNZB
	 00zTsAUNdEZU12wlU1zRfmgmthKldxO8oUNJY4cjrF4AB6L1tA2qlKcYkF3xTX4HJu
	 vaWlYV9/sf0GQ==
Date: Fri, 23 Oct 2026 11:28:15 -1000
Message-ID: <91711e517792f2e607258d75b633898e@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v7 2/4] workqueue: Separate sysfs mutable vs immutable wq attribute sanitizing
In-Reply-To: <20261022093848.5727-3-tvrtko.ursulin@igalia.com>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-3-tvrtko.ursulin@igalia.com>
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

Hello, Tvrtko.

On Thu, Oct 22, 2026 at 10:38:46AM +0100, Tvrtko Ursulin wrote:
> +/* Sanitize attributes not modifiable via sysfs. */
> +static void
> +sanitize_immutable_workqueue_attrs(struct workqueue_struct *wq,
> +				   struct workqueue_attrs *attrs)
> ...
> +/* Sanitize attributes modifiable via sysfs. */
> +static void
> +sanitize_mutable_workqueue_attrs(struct workqueue_struct *wq,
> +				 struct workqueue_attrs *attrs)
> ...
> +static void
> +sanitize_workqueue_attrs(struct workqueue_struct *wq,
> +				 struct workqueue_attrs *attrs)
> +{
> +	sanitize_immutable_workqueue_attrs(wq, attrs);
> +	sanitize_mutable_workqueue_attrs(wq, attrs);
> +}

The three helpers seem a bit excessive for what they do, and the
immutable call in sanitize_workqueue_attrs() is redundant, as
apply_wqattrs_prepare() runs sanitize_immutable_workqueue_attrs() on
both of its copies anyway.

Could the comment on sanitize_immutable_workqueue_attrs() state the
contract? These attrs follow from the workqueue flags and are enforced
on every apply, apply_workqueue_attrs() callers included, not only
sysfs.

Thanks.

--
tejun
