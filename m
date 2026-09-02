Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E7D368D4A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393521; cv=none; b=Bir/Go5JuP1bowR2B8JrcnihiJMiIDUiigtFklFAYa6fHysMQp4c/JSnftDL1B2k6SbiLZ5YQNTkbYf29FDvO7VcPt0WhHpQX2GdNQXDSk2JLDCZTWFnNxKmOvxltAMN3FviILqL3s0De4/rgJ+cHDfjOTW3f48+V5FG/LiJWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393521; c=relaxed/simple;
	bh=G0EhrKf0cipMkkXxqU4PnL7wzU8qvUGgDJ14ZMb56Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKCj1K8HFqN8hcWtGe32dy4inXcDeGRn2pQEt6PuPJOuMhvaQR1Z4ttgQ+v+b2vVPNH5bZuMeomXUAYYid437gHB/9Y6Qpm8DtJ+3+3It3BrHlXsdQ3gzZdVhBRwuRnQD7XzcJYD1faHoUF5qXU1gZTXArovNAz41CN4pY/kemg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=4ixYbPT9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PlDXrb3u; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="4ixYbPT9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PlDXrb3u"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 758177A00B0;
	Wed,  2 Sep 2026 19:58:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 02 Sep 2026 19:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1788393517; x=
	1788479917; bh=Eu/0YsC/xd1sD1J8JrfUVFbXgHyAug2964fjNlxShgM=; b=4
	ixYbPT9sGE63lk08dh7p/vMHg6HWVQLq7AYU7fIF7bjRmria3LFQnhWz36eOWF0w
	jfVrg15LXIWX0L9Vmvsztt8PSyvI0M1VAUyXC8RtX3q6E1HTKX6qBYG3SbMryLHA
	NMDA1GlB24ZBXf21Ecbr7Dmbgn3t1QTDHKoVLENA1FjyNbPbASJ+eFxdf14UBI3N
	JjU32Q9PFK8i7fwYFaZS2mdnTG7DTUlIgWvSl20PXcEmq4e++Z7b6nHWOCffQfGC
	fo1IgHy36oYPGau/ydziaK1edC2wEQHlQFF/5WZsHUwh7ZWPodSM6TnweckonjE4
	pL1ipCM6TCBZUTRZ/6dBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788393517; x=1788479917; bh=Eu/0YsC/xd1sD1J8JrfUVFbXgHyAug2964f
	jNlxShgM=; b=PlDXrb3u+H4dcY1poQx/xLEGCStyF8NBMbU8JGNP3wdd5oFIz2e
	ySRumKeAd+hP4jy6/yq2c8yYcFrZmD2DBhvmnEG/H7d0BD20GFjSm0lcO71zfmLw
	dKdCvauMyoWcuJ3LcTRwP98Ool3e8OfXTEPiog0DMJ5+53GiIJ3wMuEUtX4Mg00e
	8+G8BaDxDRFDGjwJGOqiFFxKeuvVRaBolcSBcXsSci145aYMqOPpNPKYg2BqJ4ty
	EaVhKW8w9JK6Vx/DZRcbOVNUGsI5ZOpp12gT3ZJilFjj40K0aLSAf88gYSaJssqh
	Lm9vqkOP3seVJmZSVSuNlRnGuxoNhIDwRwA==
X-ME-Sender: <xms:LbiYag7hXfyDvuFzra-6Ul1--WaTnbHC08AMUgafu5XE5sq2_kQK_g>
    <xme:LbiYav2v7ZAl2ERjwrkL6aYCSPGEgLhp3kFvEhNFaPcD8CpMLUV6W_jtXKDee9l8c
    N-Tfau6dVw0nshKi7xByGZhiEiTlLCbF0m9yk9YT5PlUdOpxwmGKb8>
X-ME-Received: <xmr:LbiYanC6U84yznbZQGJ2eGAuPcx-SGBFIJ2wzojhohorRlaaR8mX-f0-AlDN26O2NQXYbpkQ6_z39Uq8RxiziAftYBXKJg>
X-ME-Proxy-Cause: dmFkZTFg4hlaRgdnFqzKJFe3rCFIAaTPlTae3F6RpWj8cWAGffnhnoG7IWh+sWz44G1eiV
    1hBF564CMFGTbQHifDoJ9O3hJ0OKB6iPZtGRi6SoVPTvCWoH5/w3Sh3fl0e28Q/6q/l0DN
    wyU+peupuaiHlRmfuTAf1beMDKclf274ax9C0y5Vp1zpVq5t7Cip27T7n6Ky6F7+IB9WFa
    83r9iSetpAh3gPFg2YGrYF5GpmcnNqdlP8qbpFvcXdG1EUmIX58YG4i6W8Ta+qKGM309DD
    iU3v2S0gKAi4RpqYKMC7APtBV3nb/9fI9rlCoFup1VnLoolSmVdCCA9pWftZVphqkjxcU8
    a4J8xzGsxIkbPKP0f8uNwoQ8hPaaI8b3sUXXZvm6vrCjb6tu9toSiXtn28VY5kJou81vlt
    pBNMkDTc3G8N0pfdMefT8Yx6a26msyAf/8j4tsPAZveECdn3tMgitTVDMvpIXL03vhEe5/
    mcCHRjtbZVWOPEf4ikM8AW6qnxtgjvqX9lzMkNRkPf64w8eAiZ74ZGGu3wrwZf/idJO9bR
    xa3fVuMYAJ49QiIBkBbPvsSSf9aGVWWAKvFEMtqzOvvs8ZMr6hCBC6khgkMn9AFshlC0qy
    J6mTahrgr86ILMkb+USg/71U93muG97orvHZscfX5hRkkapY10QjIYEoPTSw
X-ME-Proxy: <xmx:LbiYah3t_q9vgRKdpd5-1Mnj2WMcOJ-y_7yBQOlPNQwIxmlwxMPRzA>
    <xmx:LbiYahu245BHUcI9Fl3MZcOYGq2Ud8yoBLygP-3zEovYA3VBYnU8EA>
    <xmx:LbiYah7DRkMw9NSKRCJQlsaE3hqWGp0Sw-snUNDGRX2SU4whkpfh8g>
    <xmx:LbiYaiIQlFA6OGZFRLP3E02kFeZAry_WCeOOc221cUBJ1ap9BlcnPg>
    <xmx:LbiYaptIWfI0xHJnkH8GY59EVlNkoOuimxSPoy4bwvONt2nZU4HH9EWM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 19:58:36 -0400 (EDT)
Date: Thu, 3 Sep 2026 08:58:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: fix wrong git hash in code comment
Message-ID: <20260902235833.GA2393579@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260901134921.2386739-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901134921.2386739-1-o-takashi@sakamocchi.jp>

Hi,

On Tue, Sep 01, 2026 at 10:49:21PM +0900, Takashi Sakamoto wrote:
> When refactoring device quirk code, the wrong git hash from my local
> repository slipped into the common header.
> 
> Fixes: 5a43dc9f4ee0 ("firewire: core: detect device quirk when reading configuration ROM")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  include/linux/firewire.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
