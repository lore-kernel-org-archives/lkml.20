Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763CD3264C4;
	Fri, 16 Oct 2026 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153968; cv=none; b=UGX7AATXK6uHIfDNKZA/CTdjU+PFJbNnSx4WfiUix2FRL2hqsnYZeHSGIQNmzdWTgbI8V3JPtAit6+zVAAQW4KpURajjVt0RzPat00wK6XZBmukbxOnwDIn3LI8hh3REvllp1gryLPh07GVqh/qJa+DjFA6ZrWCLkxbbhMZq1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153968; c=relaxed/simple;
	bh=2rt1UTx0GYrvgXs93HDM3aWGQ5pVS6D7BlvWoNFZqpE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Dg+2V+nk3kOI9XTdQ9l9b+iHZCuCA3H8RCbfIsUOYrzGwi6Id0S+czsAiALrA436VxDyGnrcTJJvPhiGr+TLAJY45jYmwfq7WVlYNXtQKRC3JTPhuMgncvINENyjwLij3M0v8ra6COOkILj+0LOM7sVokpZWfX1fQAfg5WRdPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2a6M8mQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2a6M8mQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C11F1F000C4;
	Fri, 16 Oct 2026 12:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792153966;
	bh=sKwrPftf7M4AYzSS8lZCiNv443HYKbegROeNTv3TEno=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=i2a6M8mQRvk6HXbJlZoWhUrmZYlEREgyq0nHet+tm389RFP9f+qyDC6K3ETAHi14J
	 ahV6yg2HSENfvFGD+lnU1LwH/9LaV60p94HM3NwTF2DAG/k7vX+khaximvO/xvdR0+
	 ewg7zYladr9rSjy/CzLgxZdC2A1Gj16GFkyG4MT5IdWmxPDu3eEB26YG/wzGopbgYO
	 caAzuDuE+kTTMzfiYlKdJHrUGS3/4LhaqX5WZ4UmC83rw9Ra53d6ByQ4NLhErgsOh3
	 rvMVBHSoL9MH7zT0OJza93m1Y+1dtv/0M+BPRnyN2hf5T2LyaKnJGLVaPm3REs8OlS
	 i5C+g9Jo/MaFw==
Date: Fri, 16 Oct 2026 14:32:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Nikolas Koesling <nikolas@koesling.info>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hid tree
In-Reply-To: <atIV9kBYjdaxLov3@sirena.org.uk>
Message-ID: <491524so-s30r-r514-2s0n-68qq21qqsnr1@xreary.bet>
References: <atIV9kBYjdaxLov3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Oct 2026, Mark Brown wrote:

> Hi all,
> 
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> /tmp/next/build/drivers/hid/hid-pulsar.c:742:4: error: expected '}'
>   742 |           .driver_data = TYPE_KYSONA },
>       |           ^

Yeah, that's me fat-fingering drivial merge conflict resolution and not 
noticing, sorry for that.

I've now pushed for-next that has this fixed.

-- 
Jiri Kosina
SUSE Labs

