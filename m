Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792789493;
	b=xvvzKxwfvAmlN1IN47HwZhB9ZyaB/6I0RMb0+FGvQ9J/Gs9lj/eXKxWn8mYW0AuErGQu
	 42TvxZX+B9njCJbT3X/3vE1g9wxVRwokBX5P08yhQBwadHJepSuS32ZjEFU1qTY9Cg6gD
	 j1cx8H4q58MbMqhEcP/ua+buC/x8ocpU0lwti0DuVtvz+5UMpxCWfCo7xpAbGNK4ZA35J
	 anKn2zEh9kpRZeqPuGcDSy/c6O4ClsFTtfuNauvle6syiynMDYyEVfPnHuuz0kkGHq0xp
	 1kUPrQlG9yH7P1l7kJC6YDnh5G1Q0xeG4hvdi0EDJOa1AX4CJxOX1sFt1pKs2liyAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789493;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ft+jeTX8JPK8dBM+ox3+6SqWpyAIyyLKY5e9QAWb2rY=;
	b=vZSDo6WyVBURwKkE0JWm6qDoBMcVTbc940xVp72xgKEZ05KY4Zj4hmwY6CzEsDKWkMWb
	 mGy1gqTpgHDAp5/I1udHynw08PBRDtzuDT6S/319xre0WyB+ABNT1f2fMA7MQnf8t/nBc
	 PyfqRGNkNL6s8xtRgduJU/aVVW79aUrkEA3cHtF26W42fqZzHLnmrfKMtTMYW+TAAHR5C
	 GVdPfBJ94AWhFPhsrNEmSRCX7UTizrkcLyERbNdCQ9ImiTCLirvTGpPKwGTOONWZ//EYC
	 7DGoW7DCNRHfW3NYxDclGvLd/kjk8xALUi6pqeKL5tmcE9oJQ90L9k5naqIaYKhH5/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHLKhIG0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHLKhIG0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C801F01825;
	Fri, 23 Oct 2026 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792789493;
	bh=Ft+jeTX8JPK8dBM+ox3+6SqWpyAIyyLKY5e9QAWb2rY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iHLKhIG0Brw8BeAtGwF3H8VzsABYztxCSOOAZVkFs2Wi29VyAtanU8pEudl2Dyyzt
	 5oR6wuIYKBuUCiuOEBZcflkHczYmCkhVIhhHSKowMom1Qh3jtXuhilhMoN5zj0Qkm0
	 WXgDbIovpVPQKVTDyHSX5ZT/7k/mU7iyJaFvqQjvkc6a5Rnc3l+TeAFdsVlLmhFKhq
	 NQsqPZ/QaGyWyNz7XTe1/ZzPmx5lLTuElIS/P6Vq3xdvUjzZDLohVupWm3WoILtda4
	 gUEPcI6LyAG0xdPfhKRnC5AiQs6B2AFS6LizuHnLchShXL/38wg4M1/VWlj2SLTlSE
	 j4kevicgQmWUg==
Date: Fri, 23 Oct 2026 11:04:52 -1000
Message-ID: <145b8e8f1e35e1ccd54bf678519d34d6@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v7 1/4] workqueue: Simplify unbound sysfs attribute registration
In-Reply-To: <20261022093848.5727-2-tvrtko.ursulin@igalia.com>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-2-tvrtko.ursulin@igalia.com>
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

On Thu, Oct 22, 2026 at 10:38:45AM +0100, Tvrtko Ursulin wrote:
> +/* Avoid naming clash with the other cpumask */
> +static struct device_attribute dev_attr_unbound_cpumask =
> +	__ATTR(cpumask, 0644, unbound_cpumask_show, unbound_cpumask_store);

Can this be DEVICE_ATTR_RW_NAMED() instead?

	static DEVICE_ATTR_RW_NAMED(unbound_cpumask, "cpumask");

It expands to the same dev_attr_unbound_cpumask with the same file name
and handlers, and the comment can go.

Thanks.

--
tejun
