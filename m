Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC14CDA2E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953170; cv=none; b=CjEcQTztopQHJczY2NiKF/AXEy4m055lfTJslwI/le8M+wCrHuBMVYF0V5QLsYCDx9ZrarYgPA3+10brNnSg6cZCTXoV0Ge0k6pbohbsLA1dSXWpgboPuKTygvrtbt3dom0ZyMrvSvgw9tUhL9tjH87lE//HkEwVzG8ylzOuW54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953170; c=relaxed/simple;
	bh=CF0W5d8WeMXiN28AAdFuRXYkCxdYb/VESvohxnVUgDQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hA+7Cf9kErGZhF876gtShesT6sZo2Wqr8jBljqR+BX9KOUiliowOVuXAmBph8EajXAIRIN0VXvsOBZp7hF6Ti2+Cl77j/wOMG7IRoEYmrZFIX9/mhU9O4rGOiCybn8/SCgr2mpaTfBoDCRZQVH6oB8ai7pGb2pp/Gugrm2jQWBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dNcx5gqJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CdT5+EeY; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dNcx5gqJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CdT5+EeY"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6F1A27A00AC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:59:27 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 10:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790953164;
	 x=1791039564; bh=/RBlyfe1Mgv6R04PMaBhoX6CHFIp9V+NLKVrO6k0p4o=; b=
	dNcx5gqJvNk4zRIgpqFFiHT5EviIY+Fl3qLxYv/KpkQh9EZFW/Z+p6W4OZXxs6Li
	t1EVUxT+qs5N2F78XrA8BA6SadyzgP2SkTJdQriVMy4phzSrF/NTCw3Zet7a07MT
	cUNjepOSBalXFwc36FRTlYI86oQFToauoOCJ1vlkF+ZopIxo3X/BaG18+1TfTcAo
	QTb0tYWOqbAYus1RrT7O/3BzFsE1cPbOZ7/AkM6y+ROYgbVa8G0HbaEbzjg7K4zt
	2LhV/0HVQAArlDfpZ/hdrkU+LElLGMnZDjj21OjCkaenD9TFO65KxeBex2vp/wWl
	596HfRjQMBt+8F9bvawCZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790953164; x=
	1791039564; bh=/RBlyfe1Mgv6R04PMaBhoX6CHFIp9V+NLKVrO6k0p4o=; b=C
	dT5+EeYK3932VO9mXatMUlbKm0ytctxOb9fkiMBT30IzlQ3RftWKR7pHJu/R1QgB
	90dKyteOHzwg3e6meGnJ3qq17E/Gs82OCeEM5Gy9Wkzvf2gX/tXmZLZ6Pio4AARf
	EHyd1fVz0m5aftWURqJLSdwwoDugADoB0PcIJmkxgpngqaIfo5coKErIy6e3xveQ
	0i1Dc2YCu3C8Nb968+QkK9M9mdQ/4SQPNaoGUvxImxP7VRCnD7X1UjddquwDB0zL
	RHwQFT1ADf9v394m9wwrfFu3VMEF18zwE1AyB8V4o/wdPU5JdmqqybHT5mUeDFpw
	u6Cd4YcliFiiusGpBXhJQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790953164; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:RtfT7sx1Nuo8+71tIRfiMvd2K1urAc1HRZrUVkscaPcIDlW
	QBkf7pwiNPHyjeI4BihWcdySKNCx/1o/wZGfSZlOxvlEQEU665/cis6+9lB2ggtQ
	5uHCCI75c/fWCyQ0GT2+P9Vrkz9XzsyRlwFncyokARJ0LB1XyRouDlsgEtoGnW3K
	KMC1N1UAkhhqr5bCT9E62MIH8rODVk3PYwJLFVh/uj9CfmjlT8RGNHwxVkx31VzK
	XeU+EumBMYeXCFpPgCaiVUyqo1dK7gtJTLTD7/h0i9TrWiZNdniUfe0TE9uP/NqV
	LANxyJJolYEu9DeNqut5Lysg2bdGHm1oq5sqtxA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2Ije8LP0WNR3wslYmdZ2aSayPTYymwLvGkBMtGd9SKU=:CF0W5d8WeMXiN28AAdFuRXYkCxdYb/VESvohxnVUgDQ=;
X-ME-Sender: <xms:yca_alaF9rSJz7a16Gya1srH6SOi1TFFn3X80V39M99sgDDtSJfr0A>
    <xme:yca_anPdmOMJo-MVLEMbDocaM0vW1EW8Y5mjxmRtGqSI7OOXN7fbJgWNy6EDYPaiX
    sHeyzTQiV_yci1dlt4pybU5sAjUyjq3CXwi8L-MykJSJMk9Eva35Lw>
X-ME-Proxy-Cause: dmFkZTFXVycTGfb7P92y2Ed3FrEYP/S3kozu0kL1Km1AmpmUL6OoqPjQAk4qD8SiLnDMPN
    O/OiP/NiYyzc0jDCuqskm9R/PeGNm0WgUEgVqVcjR66BxEathivYnSGG6G5EhpDV2LKNtK
    MPK0p50NehCpMsepnk/SSraY+7Q+FWyfoxRkbLHZHH+RQdPiaLVtGaNfysXoF3tVR9wxup
    QQxsTvNMK2H9KMR0vJ++4xoS7lOpeAcPN/hYGWTJRnOx6gHjdIEp2utK27NgNZ3ArJJahm
    ROz16KAXDODxvtiyKljvHe9XX7i2lZ2a/ghkfKP3HCsUrovqYmG4IjcEC6qaP5jTbJ4pXX
    YnrZDNb6cZr252SrkJrGzBn3LXxcP53jW1BCUCVXhVhnapO42jZ/g9WQKTxDpTMrAHP5Hc
    jR3oRVi7jn2irwtQ+u4l382bB2DUDe9P7MaPj7FH0d7sTxqkdIHf94voLvOXNwnC31VNXD
    tmlPZ9BWdesVzaLeVKromEnsyl5IZtDMPJVIILCPV8X1VjqSbZR2UTNJO0RjsJIGeJuhH3
    VigUBPcDd/YwCt5gp9uJ6kwdquGDAOYQJR0baX6DEFCIYpwKd0vs/l2V7+U3C+ZXiG8Q05
    YWrVqIWZ7onqR3mQwgjHJtsm3oOt5Zqw7gwJd4kbJPAU0nPQ8WfoYur1OZhQ
X-ME-Proxy: <xmx:ysa_asNweVpvIzWX4u4WHl7K6DgrNmKR4ODO2Mwyvu7ldLY8fYbSmQ>
    <xmx:ysa_amp2Oab9AQd_fidORZs4A1wqoGFehmC8AF87eOhruKooQo7_Tw>
    <xmx:ysa_atEBVsVhtdxTGKn65oTOs9BwY5lCD999C3SEPPySwMHEK1rM2Q>
    <xmx:ysa_arr72RnNUV5kcGoNKibzFhtty2UmxCDVJM5AQfsiXI2WRbb0Ew>
    <xmx:zMa_aueLglEDvQvUXRiUOQQqTQLonTZOJEWIak3QfOe8FFLCndJ-E8pZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2EF0A32A008A; Fri,  2 Oct 2026 10:59:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aw6mAajFSntB
Date: Fri, 02 Oct 2026 16:59:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jens Wiklander" <jens.wiklander@oss.qualcomm.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Message-Id: <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
In-Reply-To: <20261002142443.GA778834@rayden>
References: <20261002142443.GA778834@rayden>
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 2, 2026, at 16:24, Jens Wiklander wrote:
> Hello soc maintainers,
>
> Please pull these fixes for the OP-TEE driver in the TEE subsystem.
>

Hi Jens,

I noticed that the contents of this branch are not in Linux-next.
Is this intentional?

      Arnd
