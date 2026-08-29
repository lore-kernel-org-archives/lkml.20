Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1713911B2;
	Sat, 29 Aug 2026 22:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788043402; cv=none; b=Y1kE8GXntgdEpZ2T6kP87fsDzKkVFDcDgAifNlCXAJMh9YNlm//vFBQNnS517j4PMDUKL77FtZxl9UnHUfTvFXI3r2Y7sMklPQGMrc2byjXU7RTAIMGiOQID/YfMVdxHRgy57N0ZUAaxbXLgoRtf3yLM5xa68blLtAZrja+5Rrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788043402; c=relaxed/simple;
	bh=21xJ1c1bzoRHGa46oSMY9YoiuAzwVKki3aB4buiR3QY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Mt+YJLWv22Pn+4ulZV+s8P3IqVve1fad1Y2oIQ+gOgSH4yVL3FDmmawq45FgCENBY1mgJFQ4Aqyj1cb/Hyff5b8s+hGLxw6EuoKzFR4smwNq+KK3W0gJpTdlysroepevfXPcAqve/UJGYf9b1fvPYBhp6cZh3RgcjByqvqnyex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qsou8k0z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qsou8k0z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547201F000E9;
	Sat, 29 Aug 2026 22:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788043400;
	bh=+KAIvEYNjsLYCp0Hap+clvEUUm1wniiLD+hz4XKnlLA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qsou8k0ztd6mxl6zmkPGmDCNp4NPkEY7qeNQvU4ehSIHWp34mtP4xVlSaygMTUbVU
	 +BE9TiDq5wDV7Wu1oPFUE6h/ovypbuQ2p15Ky3Q3ADRX6MNONmIqcynL7hK9/1LEa/
	 sq96+hrxjSj8G849N8NYBO9goyqNYXqnCaIs2NuU=
Date: Sat, 29 Aug 2026 15:43:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>,
 <thomas.weissschuh@linutronix.de>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH v5 0/4] tools/accounting: refactor delay fields and
 share format_timespec()
Message-Id: <20260829154319.5d5422b8da6a93eaa72a00bc@linux-foundation.org>
In-Reply-To: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
References: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Aug 2026 17:12:38 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> - Convert per-field delay members in struct task_info to an array indexed
>   by enum delay_type, eliminating offsetof() pointer arithmetic.
> 
> - Add __kernel_old_time_t typedef to tools/include/uapi/linux/time_types.h
>   per Thomas's suggestion for backward compatibility with pre-v5.5
>   UAPI headers.
> 
> - Factor out a common format_timespec() implementation shared by getdelays
>   and delaytop, using strftime for cleaner timestamp formatting.
> 
> - Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
>   truncation check ((long long)time_sec != ts->tv_sec).

Thanks.  I can't figure out how to apply this, and neither can Sashiko:
	https://sashiko.dev/#/patchset/20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn

Seems there's a dependency on your "delaytop: add delay max, timestamp
and sorting for top latency analysis" series which didn't get applied
for reasons which I don't recall.

