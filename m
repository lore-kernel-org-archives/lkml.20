Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F894052B3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848717; cv=none; b=lqPUkPvu8ve8ib8YUlQ+n0BsbaW0HE2rJJfQIfdxkejKMAKcqEf4z1ilcX5Do3q+4yJ2KV5g2c8eeSFKbKivSgApkXlRCnaTOk62E2UpWfi71maQjjnH++9xptMODRpdttW00Ij6mtpYrJMZJQWfMh4ra4aUDl6LYp0qIe3VM+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848717; c=relaxed/simple;
	bh=FXxGXjkhNGEXZqrrH/byp0zQnsvjNHJfBhA+a5G296U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kboZ+g6VBIuA+iz7MAeTNtKiX4zMq7QN1VvIR08wRuORxF8vZ2QCfQ5kgyoQ74wg1d6sHV6iN0XfPSMlePbBQShJ71aDWLXBtR87jO4aVP7LmkgXQjWHBgBfEaKM2eBtJ6gFuZX18AIxc17tjZCzqBUtN14szKCip6cRP8EvWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKYToTiV; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKYToTiV"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c2a97ec17so1535006eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790848715; x=1791453515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0p+G5kuRzezJoiYkU/GdI56ndmvFnKYEbf7hSebGh+Q=;
        b=MKYToTiVEsqTAiQw0n6uKeKMAUiGdXYozWjBpltXt7kzFzvwcbCaorisH7ByiCpayq
         n1deHFq3vJ/sf4B6dQO8UqLy7D/QC9VsSAx+5yFZrrxdrPJYqA27gsDgtIt56uEIaTif
         G/w/Dtsx/NIRx5fQiu7qCvkfQYbejOZtbm4+HzGG8Ra6WRJv9Hi/3/l1+wiSFXgYN26Z
         eSPFdPvZJp5oFRYkZm5lRaLKNKh96kYpIznrnVNrUA52TdS7kZwwPQCK7z48QA/D4oBU
         9mPHNGq9Hqj2gYGf7TF7ARUQrmW3PF6s+p1mFWAizaIWjOk/KqegDZ/MppaMGWNhQa4y
         hirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848715; x=1791453515;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p+G5kuRzezJoiYkU/GdI56ndmvFnKYEbf7hSebGh+Q=;
        b=pSLqRhd5LySW9BLQBm2/+y0r9u0PZhYZbOWd/VnukeAILfzHDfrh3zs5zxmwNTYrB9
         2CJO79DP8BkrFhXwS54VduJyXi76Dv9wsORcCDm70kLQfwIItwYlujJVl5x1Bp9rp+f1
         x9Y9+VQ4HeoFGNPeDgvtK5Vf9GtjsA+ELl7sIxUEPfVjnJ0ZcN+LyrI1FWsV9W0nIPjW
         jodnJd/B7RKXzVi3h+vVnujj0iRs6YDOT28HWGXGIW0MivaQO+ERREC7HbH8fynMqs1b
         MPPcLv3UuisQhy6ZT1lZv19Uolg/Jf5hpsPkm3kqYQbgRVbuY8fgIciyGQdXE3yWYuln
         jgYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcIX1I3vvjFvjZzdeTD/p13J2yfbER2CXNlA63HKUdT8O3vugZuXtgRhTqr8ggLlI0vzFs8Gb0vj6ozns=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOu96alxI2TOX7wUKvGHEamlSxeAag4gvDscJvMKQ7nfhDMSUm
	RVnzn8vPTjor7oSlKAOBmbhcsrDPaAW5+B/qeiw0F51bil3x4pubrti4kXGj/DARYzY=
X-Gm-Gg: AYBFou2OFypGKfr/uqrp9bTBzrHvy7jov8/TrpyuhZieaLkXkPD2YA3FJD30qY6DI87
	cVIIe4NiK1IpFalXAomgoYgMM+7bMQZ79dj8Kymzr9ry0Rhjyt+vA6mdJePqc9E98GsNafkB3Cs
	SEPMJ/wic19lsQ119hF0w5ycxz4/TNVAOo1XZWPaAD0bP5uuY9YV5xh8hlw5lQySbi9CU6GY7Rb
	UBO5FXoD5OXi7oswHVijGpI2MkD0YyS70MhixtApsKXcbQp9+IpyMcP9HACmAbMJ89fhpThRx8G
	nz6x4C858xB8T12gvWSiuEu8OMRx7NN3+zSxcjxIrVWNOFWR0W/kXQvsSfrEvI7mRNRAFYGxST7
	niaVuykJg4xv/Hf6CnpenJTzuSz4yJVKFwArUE4Tt+U2m80bwgFzLeRO23UXvxEj3U8hB/zn7IS
	uGbFebPPeWrV5JDK9gsRRcowbLNh0D5LVAvcdAgXiPwE3+WwdnTnCFgbrfrkLT14lRDy6jvcNl
X-Received: by 2002:a05:693c:884f:b0:34e:6ffa:ad6c with SMTP id 5a478bee46e88-34e6ffab5b3mr769959eec.40.1790848714758;
        Thu, 01 Oct 2026 02:58:34 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db491fae1sm6397324eec.24.2026.10.01.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:58:33 -0700 (PDT)
Date: Thu, 1 Oct 2026 15:28:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Cc: spidermana <xuyiwen14@gmail.com>, miguel.ojeda.sandonis@gmail.com,
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
	daniel.almeida@collabora.com, gary@garyguo.net,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	lossin@kernel.org, ojeda@kernel.org, rafael@kernel.org,
	rust-for-linux@vger.kernel.org, tamird@kernel.org,
	tmgross@umich.edu, work@onurozkan.dev
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Message-ID: <ar4ux5SVxjlzTGvL@vireshk-B250M-D3H>
References: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com>
 <20260929095539.1398671-1-xuyiwen14@gmail.com>
 <ar38vCqqekY7T3SZ@vireshk-B250M-D3H>
 <DLTEONSHWRPQ.1U2Y6GDBRURFX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLTEONSHWRPQ.1U2Y6GDBRURFX@gmail.com>

On 01-10-26, 12:49, Mehmet Koseoglu wrote:
> I see that v3 was already applied as 0ba1ee052b3f. Would you prefer
> a follow-up patch updating the SAFETY comment, or a v4 of the original
> patch with the comment update and collected review tags?

Oops, I thought I haven't applied it yet. I did that couple of week ago before I
went on vacation :(

You can resend the patch and I will apply the new one and drop the old one.

-- 
viresh
