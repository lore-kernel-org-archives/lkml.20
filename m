Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C964392836;
	Wed,  7 Oct 2026 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407541; cv=none; b=QtjgOaZiKyN2e4s8DkZvsU8LG4sYaRNetoixskxB97KKD6XGXDjJYLGCZBxctnjctdrSKjWxu+ibMcam86qaAhAkJm123au4auN8feG/O1sBAVPmid+ILvqNAwaoFpbyKibdm+CbiCYgWwvqIyEAe8v0+2BTBg8w+ErA7rLIYq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407541; c=relaxed/simple;
	bh=VitH6Cyvvzaxf87KRoCmSNyM7b9ylR8mzeyPAN2A2ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZChF26FUcCw0YiWV1ByQZcOeisSU9DzfNv0AB9XQqAqzoioyso7Z516bxog+aRkiGzoTSvFH/7Wptck1Kbf5u7g24UAg7SLIj3j4MFTMUua9I9SYro0emIdJnEfv/D+1zs0tS/YVpalnRR6tIahX0JDpAb3RjUBvarkTLvZn34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw+nZzPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw+nZzPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83641F000FF;
	Wed,  7 Oct 2026 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407540;
	bh=K/hFtpugBNyaZWDjnWsylwZXhVvU3v+GHw5K3MjPY74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jw+nZzPtPphHIXkNvxgXCHkbCvA9RuBOcsunwvPHvJf8AOV6MGDvQa/nq0XC9i4R+
	 pKfT9OzTtgwNay8EHKzvLkd+Lm2MSd5bgxov9Sg1dHIjLRfkBa/XMh5KKvswTLY9wR
	 ndCE19Py5O3DcGn0AwUChf4M+3yuOJdhpf+QFxZ33hQp705/wqDGPannZjQoaXWUxG
	 o+uWQje934TVlObx5aBWu5rnW+IegH6DYygA4v0/V8rH+k7W/b1td/n45gofkjpOdC
	 SDNd9EDltu3B+h6ZiKYgRICkuA22hPoXT7wUmaWxaKMkVDBx+Yb5ia4pirwJnuPpEP
	 4BI22XFlvoGAQ==
Date: Wed, 7 Oct 2026 16:12:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: conor+dt@kernel.org, mchehab@kernel.org, krzk+dt@kernel.org,
	sean@mess.org, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rc: Add Ruwido Z3 RC-34 keymap
Message-ID: <179140753873.319971.14467441616897374180.robh@kernel.org>
References: <20261004121931.6746-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004121931.6746-1-festevam@gmail.com>


On Sun, 04 Oct 2026 09:19:30 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add rc-nec-ruwido-z3-rc34 to the list of supported keymaps.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v2:
> - None. Only expanded the CC list.
> 
> Changes since v1:
> - Newly introduced. (Sean)
> 
>  Documentation/devicetree/bindings/media/rc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

