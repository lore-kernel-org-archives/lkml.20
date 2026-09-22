Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF67E545291
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081600; cv=none; b=j0TCZpQe9lXmOt2fGMxYH00As/SDKCRO8wN0p0QJzX7oJhPEiiUxz9jtOpNj4no3sbPICMLwSX6/C47OzLxMvioUlTu8UpO6/OuFLTaS6GocJYh0D84G369KekZtYac7xqwNI+ytiWRmldyFf9OurbqYJ/nUtbSD6VjAxj2Awck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081600; c=relaxed/simple;
	bh=qyFdaEgNEWQjqDPze6zuBU++M1/H9oQ7ulVcqDoDcBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDogWM9qEWbzPz4gv2cHi2KVtiTukloBcsDZA3PxYz+YkykIiOJU80JrTyiozOQrvuGJxDZXUDCZg3SyO3LX4Lri+h9GfLblpFAkJ1+CUQrsTwis59r1gfxScEcrin8N9hELY7Wb4TQ+ThhXMdcXr4AgXc+2+dB9cVCOvuFvwPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoKGIk48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoKGIk48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B0A1F000FF;
	Tue, 22 Sep 2026 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790081593;
	bh=+c9dYd91MT3vXguF9zyMvY4hnXR9KLof6KH9MAchdIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DoKGIk48OrIs8sM7z6x4ISaR7I78vam1KFF0vlN8jeWAQePzjW1xVkKvGcvE0We/0
	 pJ+6jYc2Kp/w9QkmPF5fekg0Ahn/2NIVAyc0tOKy7AoHF5LCDzgq0c75gF1kngoikt
	 KBDTCUQsc4r1XyI0I7tgeUda6inACoF6HaUZT1uykp5zpznsKWw83D8hmJYQm34yVN
	 YWe1X8dK70OLhxu6TMCKvpGxlXH5d+1qOqe9Vyc3m3CDTBQ4IellhuyrE+aH5WOxAz
	 wwG83bnpoI1gZtKvIHwDzTt3/5lbXiEtd56SmRAZaVsfMcqDsR34EC4QTj1LalTXbi
	 LJBAomB2V+w2A==
Date: Tue, 22 Sep 2026 14:53:10 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Ahmed Shaltout <ahmedshaltout.payment@gmail.com>
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] /proc/stat idle time exceeds wall clock since v7.2
Message-ID: <arJ6NjfdHUPjN2Kc@localhost.localdomain>
References: <E76BE609-83E4-4FB6-88B8-191F7816EFD6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E76BE609-83E4-4FB6-88B8-191F7816EFD6@gmail.com>

Hi Ahmed,

Le Sun, Sep 20, 2026 at 03:14:22AM +0400, Ahmed Shaltout a écrit :
> Hello,
> 
> Since moving from 7.1.8 to 7.2.5 (openSUSE MicroOS kernel-default), the idle
> time reported in /proc/stat exceeds the wall-clock time the CPUs have been up
> for. Idle alone accrues ~103% of the ceiling, and user+nice+system+idle+iowait
> +irq+softirq+steal sums to ~108% of it.
> 
> This breaks the common `100 - rate(idle)` derivation of CPU utilisation, which
> goes negative on an idle-but-working machine. node_exporter, and anything built
> on it, is affected.
> 
> #regzbot introduced: v7.1..v7.2
> 
> Reproducer
> ==========
> 
> No tooling needed; /proc/uptime shows it directly, since its second field is
> idle time and cannot legitimately exceed uptime x nr_cpus:
> 
>   read -r up idle < /proc/uptime && awk -v u="$up" -v i="$idle" -v c="$(nproc)" \
>     'BEGIN{printf "idle %.2f%% of ceiling\n", 100*i/(u*c)}'
> 
>   7.2.5:  idle 103.10% of ceiling
>   7.1.8:  idle  89.13% of ceiling

I can't manage to reproduce that, neither on latest mainline nor on 7.2.7

Can you share your whole .config file?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
