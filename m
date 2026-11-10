Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346652;
	b=A01/WAyp2yf7GBZdot9dTJsOse1yYiNL6PbAg0DAq0ghwU0tl01S6vgS2rsi2JQKUKyd
	 HpKllJ+plW2ypuTxGHhLfWronM8WypWLW1R5OuLPjfqU8ebMChv1ykvLVUGmj9xPzXzyT
	 a/7BvaZFeNz7l+h4GO09ZmEHv2Vg/uVecapGjBnr8Y9C/wy0QnkwTkioWUBZM3wIovH9T
	 xM0SXqqPqVAfIyWdwsEe1rIspognKQWvVML3MzvtZsWyhkpzU3fV30hjsCybX7d7F/vQg
	 EPDs75pLjWfoToMKs3Q/rTilahy78TKpUMz7AKVu8pkNX0RFemjBfmTTuUKqNveY/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346652;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=Sws+Lp6Hy6swTFJW+u4tF35Pkj7d6vf39MsZt+8Uwno=;
	b=k9ouD6zQhcVfWm9QIoVK4r6weF4pKPYz9IoAB0iwqfcKqwW2V4kJef4lYTr/pivB63Mt
	 Z5Ql0qPLuSIKh+YN5EZgm8gLImt0FVpDoaeODFKwS+YZPmEetbUtFYJrkhFDO1r1iF93S
	 0o4t5kPzYM0NqB/Y/VkN9rQT1eHHswtoVA6nCZFUA8N7ZXwFAvxHUYVINv6F9O3Pnrl6P
	 tfM3+VyFPAzsqvgs9L8f/K8oYJzOnGJm9yuR7F/FcjrxcrkIJb9QuHNc5LkBAHVeSdhP5
	 Ydpv7jv0x+VHEiWGvwhUa7hyvVr2Ao79QFDydb5lMi//rJgxLn4r0gzC4zOfKtAYs/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.com;
	spf=pass smtp.mailfrom=fastmail.com;
	dkim=pass header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=iq9GGlMG;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oHsv93NP;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09553606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09553606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=iq9GGlMG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oHsv93NP
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 72C7F7A026D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:37:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 10 Nov 2026 16:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1794346650; x=1794433050; bh=Sw
	s+Lp6Hy6swTFJW+u4tF35Pkj7d6vf39MsZt+8Uwno=; b=iq9GGlMGEpICVNJlmn
	9RcIhvk+MPdNzzBE5TUtPsRoiEkUFPTI0Yz5Cwk58N5FrGqL1JQG4rF0mzNkX28u
	YFcafLmsP3rf0+y1tdxKRaDyy4fxWCI23pONvsSUFX+oUczoKY0hTKOiDSLbxaUt
	XW2DbUA881TDSq9A7euiYmdAt4Qop3dfg9OuIhLgUN26YoZC08kjQqNMppqZmJLI
	lphPndDK5V8pQDYSq+aFJuuTygSXB9xzXSo83kgJ+4AkFKdJvL05RW52VQ985ODP
	eDSUbdXZ8FwKQhtXvSS5MZHTa5ZhTHCu44E1W+sauXJKDrQ4dCsW704rrRk6sX/p
	70OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794346650; x=1794433050; bh=Sws+Lp6Hy6swTFJW+u4tF35Pkj7d
	6vf39MsZt+8Uwno=; b=oHsv93NPjG/uBgQPLS9cyR++G6xkasGaRsuU/YKSduTE
	Wn02sa2LYWXfaPyRnfKe6GDYLqFRYWDj/xpQSjexDQOj+jIi8sJkC2mofv+CgMo+
	qKQiciBrHaD29yecYX+vtfPHTpnBAno7Omv0K+McGedG58y8yX2CxUkFWYvweyl3
	iwG7BaOY5mUMTAIb0/AQK066Lsy8Dwvwpr65qV9VrjCIXWTe746P5KoFFff7F5/Q
	Sxv2TzfiT44WmgLmBkOgy2vPu7hjxQA5yNFJ5M4laufljU8ldrEkTc0FrlrDIARl
	62AI0/OvoPwzVmOnKNPahh8dMEii6KM1HBZrukWcAg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794346650; d=fastmail.com;
	mf=PGp1YW5sdUBmYXN0bWFpbC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:eUQvIRdqfAq4VAg/Ihf9auPrErm+GsLod6JCg2rG6ar5m+P
	bcrKwI10Y193dix/OGsRCGPa4v2kEJCDmh7cInfiCILtsBvh9ql22tf0DBC1C3sy
	x8Jr3hjNU+WkQIGh3JjgoAeFZPSjWtMCvCv+mNnhEzYwiU/tP/AbD+2mY1T6tXSu
	KTdOkJ+1uqY0RWB9QmfmJiIvNqFmNjzhIbp22u9oYlAX/OlKHADRcr0AovKzh2rH
	uKIeBm1IKKlrJeZzeajq0O+gJDFmCMM0XfHZQPw5K9bvvKmAv2H2LAItbntVUWF1
	psVJhvn1an1qZkfwFbAYEgpg2Gcvfokbm5fi6ag==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:K+c6zqprtutpXQxBfbp7PEl1jJVRCH8PSxxXm110fHE=:7pqfSdJ7Q85y76jYkUAU4b9u8AovJbMY9eoZWC2Uga8=;
X-ME-Sender: <xms:mY7zaktdO5_FzZyOLIhbYfFs42Zfum-RO2C3N63gst2CQj1SR_drgg>
    <xme:mY7zalIOAsuNMkys0oxRs8s9wlwsdPgtzDN95rzFW9zcw0RamYhye8-2rXPpXKxHf
    AxOKYoxDx7Q1n5-ZewFvy5jRp1Mu36nNmhENC4UTBIn9nECo8DXz0sw>
X-ME-Received: <xmr:mY7zaoYSzV9Q37CFopMjDdGZAMYz15YNSTVVf3BVipkgXvjJS3gUBn7d76K757oMPWkW5h_vnkb4xa50s7SO>
X-ME-Proxy-Cause: dmFkZTEZtBTh89FCx7LMC5ZA/ckmoh5zDljfKwX9YxsvecDvQfZ8aTgSJmYkoNBm/Tccil
    Fguqf5MrjHPa6ojl0UiOH1/J1Cy8zAUbRuP0E6LsiLlSrezKDCVg+voL1j2S0WJL2hWe0M
    ZLOFM65/CoN97aHECuYRWP0efgtEZ4KOyX+XBP7Pqfez/+JdZGrlMdNK39JV+hrXIYpDNU
    2UTtyyl9o0be8iN6Z0msCe0mSk0QmsqWz1v3LR7aVGRZUN+5lJFXNOzttTwElfMvHdHMIN
    iWPGJHSwsSyd6k4FZ1sa2REceKtQV/B8+ch/81weBj88n25KFxnuais1Sj3Dbj9cjSgtNe
    +2rG0oEeGYC4UUHtcnZ67ICURCXVXMIdVq/TC1mnCuBWOtFXRPY5bHc3cuLtRN+UcO0Kr0
    WJlxlDKeOmsLHYE4+pT+8myFHcJqWmoGafJ6tlLl2zQvfLi6SnRWK7i0WVwaHDBqGpHvG4
    59hQNdguj2UlbHDWOkBpfWPXVswJLMNvZIAzeaowDLMv/D74L8otdtjcANQbKG9ZNzEd/E
    Iwrw1zHEpYGUbsWFWc/QfCL428OJrTt0NKvghoTG7QMgBevoQqZYVzJ5kN69WLSySw+7cL
    2Vx89YJs1QPQWezHTSV50Q/L8gmpm0x5Y912/q1tUDw9SPCwywGldmfuIxdA
X-ME-Proxy: <xmx:mY7zaomO_YAMh36NAORAlhSgaOxSupfXKusnD19lZh-SvekPdHBFlg>
    <xmx:mY7zamVOuw3asx0vgq2TIAllJjTl_bzc4v8cMDNeQ68ydr24O5-JOg>
    <xmx:mY7zaiJeaZrboUTcA6_b1F0cfhE9rG0aMd-a9mNukuNdGxY3Tacs6g>
    <xmx:mY7zauszQ495G7tnaMACbLow1e6ep9T9Sy0n9M_6Di63tL_zB_15rw>
    <xmx:mo7zagbjXsfjW8knuDKNdXz6CdpgkL8gUNP4FlKrJHhWKsXxQqkBkcpe>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 16:37:29 -0500 (EST)
From: Juanlu Herrero <juanlu@fastmail.com>
Subject: [PATCH 0/3] dma-debug: skip irrelevant buckets for partial syncs
Date: Tue, 10 Nov 2026 13:36:46 -0800
Message-Id: <20261110-zcrx-dma-debug-registration-v1-0-48743ea61631@fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6O82oC/x3MPQqAMAxA4atIZgNtFAWvIg7VxprBH1IVUby7x
 fEb3nsgsgpHaLIHlE+Jsi4JNs9gmNwSGMUnAxmqrKEa70Ev9LNDz/0RUDlI3NXtqUNTEFkeK1f
 7EtJhUx7l+u9t974fTBBA/G0AAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 Juanlu Herrero <juanlu@fastmail.com>
X-Mailer: b4 0.13.0

Make the ZCRX area size configurable, skip DMA debug buckets that cannot
contain a partial sync, and add KUnit coverage for bucket bounds.

Earlier Fastio ZCRX registration means with DMA debug enabled:

  driver   pages    before     after      time saved
  mlx5      65536   4.720 s    0.942 s     3.778 s
  bnxt_en  131072  10.658 s    0.556 s    10.102 s

These runs used an earlier patch revision and workload. Later
SG-controlled CX7 runs showed no overall registration gain.

Validation: KUnit with KASAN/lockdep, W=1 build and checkpatch passed.

Codex assisted with implementation, review and validation.

Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
Juanlu Herrero (3):
      selftests: net: make iou-zcrx area size configurable
      dma-debug: skip irrelevant buckets for partial syncs
      dma-debug: add bucket bound lifetime coverage

 kernel/dma/Kconfig                                | 10 ++++
 kernel/dma/debug.c                                | 53 +++++++++++++++++----
 kernel/dma/tests/debug_kunit.c                    | 57 +++++++++++++++++++++++
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 33 ++++++++++---
 4 files changed, 137 insertions(+), 16 deletions(-)
---
base-commit: 8ec20f45bd96cdc4c0faff4a6868aae52fab3827
change-id: 20261027-zcrx-dma-debug-registration-03221ef6a7d4

Best regards,
-- 
Juanlu Herrero

