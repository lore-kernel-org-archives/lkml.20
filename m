Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700853C4176
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049372; cv=none; b=WgNqEW28K9koON8ejzC6l6IDi4IE6t39/V3XMePst2ivdv6EK8IlUknwah1C/E3bmKKohTXCOUmiq2UdzrCW5hxvbzgT84ivPjvNIV9FCPSZ4JKV5zHhkniZLgj6edXdOGrHAK1kVTZSVmNR63xb57xKwX20cpysTPv89LD28jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049372; c=relaxed/simple;
	bh=WLuhN8S3kBqq7GR70WuJ2SXrNl37lmuIfZHXjt2Hw3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLpVg6RetTnrssv9dPALtKEFkCRMbHwvEWwTcbjWF6i3E3yw8cEVTMkG1tjVMMNAyTBHJ+bzE8LKl3x7Lc2sJPOLdw5CdnAjW6+CfGh+G2HFdr5oqsNt1fmfqWexj2gsOvv0hvhhd7c4BBOfdu3ZyAhNaCfJFV84E0EvFUetgpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhnodseP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhnodseP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAF41F000FF;
	Tue, 22 Sep 2026 03:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790049370;
	bh=nHrlPrZzqJDJTFBiP2HX8fPXXqyBFzlN2E/VIksLIwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PhnodsePS+7WNIM70RnTJZMqvGFdvZ8tJtiuCiUZJwa2+a1HT1qNkM7htxbj/j+A3
	 gNcNTg/tIupmdgd06BpJ0b+DZgwjjCrBHt2RI/qOkOVcx7WQBSRxpVxpC+V6f/FUwR
	 9VJI9ZLeJNkrxXl6kTnu9f6tbacggc0SY80hXhNV0PM/Q5ECz5rp6oL2rwzi1hmuqT
	 g9N8dljllgveLt72+W2f18ZErbDYEf/XEoAfKXTIATg/g+mAawgkqJ5AIkSHOsyYzR
	 P1nAzAaKReRa14vqEinimc6JxaiewudKHTln3S+2WuMxjhM254L35vqt2St+L3aMcD
	 P7x16UfjaKZJQ==
From: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Jaidev Shastri <jaidevshastri@vt.edu>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pstore: publish big_oops_buf after max_compressed_size
Date: Mon, 21 Sep 2026 20:56:07 -0700
Message-Id: <179004936539.2521428.14485005071859688805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921-mb-pstore-v1-1-46f9a6129d58@vt.edu>
References: <20260921-mb-pstore-v1-1-46f9a6129d58@vt.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 21:16:54 -0400, Jaidev Shastri wrote:
> allocate_buf_for_compression() stores big_oops_buf and then
> max_compressed_size, both with plain stores. pstore_dump() runs from
> kmsg_dump on any CPU, tests big_oops_buf without psinfo_lock and then
> reads max_compressed_size.
> 
> Store the size first and publish the buffer with smp_store_release(),
> paired with smp_load_acquire() in pstore_dump().
> 
> [...]

Applied to for-next/pstore, thanks!

[1/1] pstore: publish big_oops_buf after max_compressed_size
      https://git.kernel.org/kees/c/7c756181175d

Take care,

-- 
Kees Cook

