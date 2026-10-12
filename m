Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14362431A51
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792665; cv=none; b=W+7l/AY/drXLhz+oGiX340XIyRaDPqpfABfK5DYWAqXRtvpsOMsMNMgoDKShqQr5XPVaC9x2AyBm7AxU2V1XuSpo/AUYjvpmAxHMldsWDRTrS5DELVTZfyZl8iDB+A/fgcBufxU0M8m4E8OIpro2Wo3l3RgzUyCup6TwB6y2TSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792665; c=relaxed/simple;
	bh=NbQINEYg4X2aBXVzQtuxuZ5+NbLkeCPA4jqxulrmCUA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZUrpo1DF/5O5hnW1ASoMhDGf7Dgew1ukrEAlx2H+ErgN7jTzRw4ETErMNi1Xd8U+yVDPNjGWvbmx92/cm55PgCePXXtv9aoCT4uXfd16ctSP5QyvuBLQYzqzMFONk6+2t6s6jt4j6wE+i8hSYQxDYpMZPJw1Z8UG5TWadL5v0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Cpci7Am6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TqumM0GZ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Cpci7Am6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TqumM0GZ"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D92131400067
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:11:02 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 12 Oct 2026 04:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791792660;
	 x=1791879060; bh=5aq75OFK0387x6ZUPnC3HDU/yaLDvZPP7XIC7MCXsFo=; b=
	Cpci7Am6aupOAC7KNHk/6U4mtd6jyTgB2RTTBKtBHVzj7t9tvaL3t3ntPPdoHR+d
	RH5Tk5JDSdbbxbst7VT4wxpHbNoTbmq42IDe3FWYfaLUkpsA9k7lH0tGS/LBEcB8
	6BqDZbs0Vq22WqB4065rzILJUEy54TDBHMh67LnVVLX+Zp09+vlPAVMZEI+mlKS2
	LRgskzdyFb5u+O17QM5U7ZqOjuOyWOEAUcAdunEyFYT6UC/VZSXzpI1WzB7x+vIP
	ld8nkdYycsDCTFckAKMLgp5XUFNrccD5cVBvqj0Pq/MJ/7lctJfkwyMJi1Q0Ui6d
	bBXf9F3cyKOObHjOi/NABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791792660; x=
	1791879060; bh=5aq75OFK0387x6ZUPnC3HDU/yaLDvZPP7XIC7MCXsFo=; b=T
	qumM0GZ5CUgtsCAPDjZtmWdsyd4vGyJkXJPbaWcnmnqlknWEhFb7Le/hsexacHO5
	ldsxcT2vXNvvUU6rztfWOWdPCRVGKJGDxJT/eaYwDdrw/ScqsGJIasNUJzukbr2e
	V1ilT0eQUIntFP8IAapt27JJ81fcG6UOOJ3+q4WaqHhGt0EvqHxhpqKjkwsCc3/D
	JmZRKkK1r/XhSflvHYNBrpwmWYpueDpoxOfKMEM50T44SisnFZGLkM8tQN01BwSq
	XEWv3oGrXCuwfZqwV6G9ubwLdOOwzIaaJaHRhMnXslGUUKW4bAxRb1AnweJKuhjc
	ljNWXqeQvAAJYRRqHQ6hg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791792660; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:JkEkdxXwq7DGx/0fk+38D4AE21N8w/gvWzR7X4WLdjmWAof
	VsJGoQz3K1tXdGTEQBUXVY7gERAhIef+SOSsmpgWyYEZURVaxnVnH6VIF68vuRne
	T0+eL4MMdSIi3YEQJ6mqqgt3yOUTh7tgoZpoCxUyGVKoD3N/tFj8JlTrYH0wHw/g
	y8heF90djcHH61T1699oBJFJ2tG9n4IDFgUj+idOyL4/xn06GuKnVL7KOmjAIZnY
	V5HFoPaoS+y1hL/JG9fYjKabapvvb+8D2c77pay7qxKegxDTU58ZXV5+KADHOTOJ
	Wsk2qrtt3m+I4lzcEIaT8/Rq8LKdV5x/iOqK90A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NgztxYTDSFREAbLoozt7GOiDsimSw9ll82hcXQSz/kQ=:NbQINEYg4X2aBXVzQtuxuZ5+NbLkeCPA4jqxulrmCUA=;
X-ME-Sender: <xms:EpbMatRxOgPbMhENZbzMxNObGYTIB3x5fL0JkJ_EGKZ5CkPIkyw3_w>
    <xme:EpbMahnDJYWxghF8WYk46oPXY19aVBorWnL1d865AQ6KYjLbMyk1j3mf_hZFaSHZu
    hdgMH1oY3anJQcR03FHTZ1CqFanwmOTEkG8abT5Y9PZnMWpyvccQOFx>
X-ME-Proxy-Cause: dmFkZTFZk1jxtNGkhkS/W6SrTSVR+8obP8kQjIPqf8ee8n2yaDvYNhdQP0D49cV22oby7Q
    +pzGSoVXH44kcGP/0qKwr04oVA7ITe5TuVcjBh9KDyz6go3nz11FwHSB+AVPJapyQzYTHv
    U1xRQUiUSAfccCKivEYKfX0xcHg7g6lLjJQGYzVZR3HFVvsLbOv8sGgpgVQGBjshJQzECF
    9hkAjO/IV6xqThb6lZLvWXzquFNbmMvVKKHd0Ir6K5KYtwfIashiLbOkvr0LgWXPkS1tI9
    M4rUX7/B3+T9aZ/jdsRG/AgsrakNwF1mT/dLh21ePiEbSTycEqLAvjERpq25jo+VCunZA6
    TVovKl6vUGh8dngR/Bhqs+Z/HgdGnd2Kt2rMMU6llP4zwzTTJrsCClVt5tPeqd36PIL/HK
    fbxtkDK6Ku7lilFyHL5RLDmmXHkfXR0YBYD5lW2siU8GaFb/U73myJ3sMIe2EF/wn2gpd2
    tiN+hkvH0v8mYU+zApitEDRDifMFbCuvrt7PRXMS80mxD1eM2WCukPSFo9Y5DpC+jq7aQr
    Z0dpxUThMUvjwLUPcY2oY+xXTlUPQTyodE/Dtd33f4cT/tEOjY0vG7QrjsyZhCRcUz68pa
    he/+qKiybI1tV+4kaBZde4uwXROPGugSvK/2egIlAfGE7CoAi2kyaRfxY2/Q
X-ME-Proxy: <xmx:EpbMak59f1J7JXAZ-2LKGe1Xr14Qjb8JjQJVo_b8cl0nDxPnNqmz5A>
    <xmx:EpbMahW8WiGqWIfKLtOXO6319pIiSqPUd3BlVm9Qu1MYa1E7nmlVAA>
    <xmx:EpbMam8G5Nn5K9FfsbcR0dpDiDpdDGydbkEoraIfam1jPuDziUQOVA>
    <xmx:EpbMatldX-9UeQgj3ITft2ErhgXflGyo_ZlxCr1Eon4-nZRA8iedvA>
    <xmx:FJbMagCeAYABTVIFt3un4X0CZpAN8CJPChKgjTNLZ_GMEKPlEb-Y65ps>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E5CEC32A008E; Mon, 12 Oct 2026 04:10:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ArRnSDGvrQUJ
Date: Mon, 12 Oct 2026 10:10:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, soc@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <ab03d380-f49d-4eaf-9e8a-e8b09d1d0195@app.fastmail.com>
In-Reply-To: <20260925-parlor-snowfield-6ca46312a610@spud>
References: <20260925-parlor-snowfield-6ca46312a610@spud>
Subject: Re: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 25, 2026, at 18:56, Conor Dooley wrote:
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux 
> tags/riscv-dt-fixes-for-v7.3-rc
>

Hi Conor,

I replaced this with the corresponding https://git.kernel.org/ URL
in order to pull it, otherwise I get

$ b4 pr 20260925-parlor-snowfield-6ca46312a610@spud
Looking up 20260925-parlor-snowfield-6ca46312a610@spud
Looking at: [GIT PULL] RISC-V devicetrees fixes for v7.3-rc
git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux uses unsupported protocol
ERROR: Could not find pull request info in 20260925-parlor-snowfield-6ca46312a610@spud

Can you change your 'insteadOf' setting to send this as a URL accepted
by b4 in the future? I think an ssh://git@gitolite.kernel.org/ URL would
work fine, but most people use https://git.kernel.org/

     Arnd
