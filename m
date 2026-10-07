Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1741DE1B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383466; cv=none; b=dE6P6r1VtvR4WHx6SJmqZAXJdGExmV3vcgkXuLKymmTsn8g9wiZUstvMVk6QOOpkoKcMjAJe7Ng0rkLNXF2WYhPtwx/UHyO1GgEBlvYOvDmgbZdj+VkMyQ+LQ1dAS0aZK5yoQZ95qN4tHG/7Ei8wiLJrJ8K4DLyFzmjaGDC9OQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383466; c=relaxed/simple;
	bh=CZwo2SjLQAnRqNhxm/dE6Jll5seKYhyoAeShlqewf3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWORT4wfLRq8wGYapp184HC99Cewx+ZUvo41g2p5UPZaJy3tVoK9ke8Kl3q5k3H+vKdK5PtPWFwqJ5LzL9LA4/BmJxu6qP5jfYZxUYCMN2w/2FI/CLSa+GmujcYTI5cA/eZArXJjYUDfabjdkHNJmNUecA7gvoIgU8BNwMtkNAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6R5HtY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6R5HtY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E5C1F0089B;
	Wed,  7 Oct 2026 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791383462;
	bh=QLlG6oxieSL0p4PDzPMxZn7nV9OG767QOiP3EOIwymo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M6R5HtY3LSN7F5e9vulKAKZ3yQzD9jllXuRdm3vj8+bKUbyy09Fr6MFB/J2OKEmJK
	 ucuBnrh8EbjRU7DCjxpe99c4EQxMozHIbLvQa8OG9wgrimJEkyV0KacRiuYEg9/heE
	 +7lhXYGs/L7z11TQq7wFMztpyEUDbsb9YF1rJwrVYVF8cAG2poFCxq6A8cglMqb72i
	 CQiNhQCI8sFNIKV/RUXSTh/clphr+/w3ZBeRhfWWNLDZqdAFe20P4d9BEVne1joKsm
	 7SZdmERzoWhwnfK6Ck/nAO2QyEymg0jCp99ngQ3KWEh7LnEiu8hUWhVXyXMcUIz51f
	 Ooo6DnJnGpIag==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Weigang He <geoffreyhe2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: vexpress: fix two device_node refcount leaks
Date: Wed,  7 Oct 2026 15:30:55 +0100
Message-ID: <179138341052.606716.9871329893441157602.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925173252.933705-1-geoffreyhe2@gmail.com>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 26 Sep 2026 03:32:50 +1000, Weigang He wrote:
> The Versatile Express SMP bring-up path leaks two device_node references
> during boot:
> 
>   - vexpress_flags_set() (mach-versatile/v2m.c) leaks the
>     "arm,vexpress-sysreg" node obtained via of_find_compatible_node().
>   - vexpress_smp_dt_prepare_cpus() (mach-versatile/platsmp-vexpress.c)
>     leaks the SCU node obtained via of_find_matching_node().
> 
> [...]

Applied to sudeep.holla/linux (for-next/vexpress/fixes), thanks!

[1/2] ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
      https://git.kernel.org/sudeep.holla/c/62b9ae8ae4a7
[2/2] ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus()
      https://git.kernel.org/sudeep.holla/c/27b98d331f1d
-- 
Regards,
Sudeep

