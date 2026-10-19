Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426579;
	b=0wQk3H4OpsfqdIMr5XGeEKl7qmDEuJTJVFIDuu2BO17/HBGaS39RLFRVOTBNpVPrRnFw
	 Gfh221616hbFPAv60e2UWvWHuHCgsseWfM/48G3VpiHtaGVuA4njj77rnmRRPzy5JOqdy
	 nZz0vqhNF1No3i7jB+YrTuUVQaSs7hQburytVMASkL9GUmTAZsbcVnW7r3qlJ4GOKnq9J
	 SwBj8IUsXS3pR4r1TNvLMRu1aHmd9o/QB/6oTcL1nNVrkEZnOZctgj4tFv/R0m+XGCNso
	 WA+s339j/nb93Fm8VdbLUk+awjZHZs9XopvNEnZEEOPeWelgixVVssQkQO96KMBwXVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426579;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=twMOlmT0yue23EXrb7yO8rXJi54Hb/dfyyQW5AH2AG8=;
	b=VP4cX2JI4fHES3nApWJ+wdYopaBqGlSt+NLrbh1Zr1S4zzTq2kjM8/vcV1LpDeN3M3G2
	 nmvjzdxrZdhjWoiGJOyi0dY/KJ2olcQLLA70KdX9fm9VEVTlRj9G/OXt8x3bbWQkIDqF9
	 VDVqut1v4Rr6aAOLurPNABFmuYInIeX0qJCP7kaY/xdFfavyRgeOiOiUemy4QR22xHYaI
	 FnbcWoOqb4sHx6Dg2INaJUNz7Be3E4LuOjp7EAkXFE1mlU70d7U2xU/07i9OYkozM0pQG
	 O9MKdf9hxbZFtdIjvEYqfDvjeENBqFnNJ2tnohucHawlvo9KGByobY2pLIqHdjHTo2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=EVyJ6Hgd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NpcNJfgK;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B223C606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B223C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=EVyJ6Hgd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NpcNJfgK
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AD96C7A00E1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:16:17 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 12:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792426569;
	 x=1792512969; bh=twMOlmT0yue23EXrb7yO8rXJi54Hb/dfyyQW5AH2AG8=; b=
	EVyJ6HgdPMKC6/xmfmw41oqqUK1u/frW2CBaRMXMxMuY+4xGRtcvhDkfauDKa+Rw
	TN/1IdBVxghQ2Mrl66pkIScht1HerkvW9F0mGq1Rz94NUXpn0XV+Plju8m1rTFgc
	h33BcCxRHTuSLeHAima47rtWSOROgEOGgEkYNLlNSlry6s3zPk9epS35/TfAN2xK
	XKzaKU+4cSypEoeD9wrvDbpsOc8L5q1Czyez7oIhFFTXLqZX0PG3YYv7dO7uMm2W
	8T++XKzsRlKAcJSV4v/oZLTVbvrcDBOinaOPhKGl+WyjlvWqD4mCioYk9bbiOfU1
	XmSnbuXBbKcD5HN699CcjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792426569; x=
	1792512969; bh=twMOlmT0yue23EXrb7yO8rXJi54Hb/dfyyQW5AH2AG8=; b=N
	pcNJfgKpiGDU2DQd35qHaUjGpHlhD3L9AU5l04ha8sM1cEcJV135z7dDeTs6L6Md
	gHU489aKgTkdGeO753RevBDPOaNa3bgGbq5D1qqzZCY6ECcdN8hd+mHlz1nS208X
	Djlo1aPzJYynU5aTxNBCb47tGR8xbdZD0xum9BJcjeb4pBEPHJ7mTWyKmeqD3PUQ
	8VhDeaToQPTuPu+MCQqSPXg0Dc549+YFD97kBgK19Cr6QaKtQREOp24a4JEmRNGJ
	OG/RqOLSlBGslnyJmd5J4i5RbCZyBmWUHlDgzgySD/lAEeKkyEzZ85fTh16E9MAP
	1OW4XbJWF4AfkMYWhDqrg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792426569; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:er5uSDNmUbyxaf+iYgYqYEenblzIPvK6VbPtOfHNaTCbBu7
	kt079mvMnIMoZuUajA096gSJIKd6E7B4myEGZ+3AVu5HL4KcWLcxonmUAlMU2Exi
	MIIQVnio0tMrZ8gBFvpPIBLBi4pCB0fGWjuAWFIp9HkVwA+2mjUwE9mU0ZekwxJr
	yAmgv5NT4+r+xNBjSCsIDa2RMeAXUrdpnlm2qG+p8q31CRb1mcrmOyjATdB+xlLY
	z2NN7m8m2fa0afDoBGpgyhGVjdjg93sYoNAw1l5wQnniVdKl384HU7WOrQgeLfkJ
	P8g/bUBSXSVq/q7un4O/vDfjCA2GF4cg41bXS+A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VNN01YMeoBa5EVQZcUhpH3ntchpaAZTH7HsXvobRRs8=:He3NBNHj6wh7LN1DoAA+b7UitBww8Jtib5MHhm2r6KE=;
X-ME-Sender: <xms:RELWaqUwoqf9zbQUn9Wv3_JUgctuFYyLX_dRi2joRRAwTXcPNQB_9g>
    <xme:RELWahbIbeHvYMHkeD-ouRizEe7Ijw5FHQs1CsnU32g3ghUaOCBuVN7VBuO9wHMth
    hstvP0CuejOj7k9O5YsjJ3V_oaibWE1qDLBuNtp-MVcUpetzuXeB0c>
X-ME-Proxy-Cause: dmFkZTE/YABC/L3ImVGCsVMwCnE+rJ7lv+dsfJO2rPmmgoXH13hyWzswO/+2INr6Dds1sh
    zhXBho3SOfk9G+qngnWHyX6GOpa34tm4UQ4FWBJ+iZEql0brIlMjtRlze901uO59SEmtOL
    CNUCaJeYTctECI8ktFcbM6gHKx/AxKuUWkyMqodPbP1ckZ9K02Ej9svP6PgpQzzNipcAZ/
    F8Pojc95eXinBUoI5ie+cNaLM3U4jJp4zPA/2HFX1uthTWUhZdiLEZ/D81t5mi45H7sj0n
    577RJmK4PS6+q3ZMVCPLMYp/G6Lt2kS1/Sa7037xFKn/b1r+B6t98FMgBfwBvlUqCNuppQ
    S17Sk3+Fh4lUuMJ7eMDTjMHfNe9G4hyeozOgjELwxKS5ovIrSC3tqqFJyx3oifgenZOTIr
    8N53K4bWLub6aDBf52y08I+ahjbU4qnPC9kJmLaHxAzWn46ctIxgnH9JTwjQT/ZbgXfZwg
    uOR1xUnMLMPA9IAkgnvFNUI0PTaQP5GvlSMQhzFtRZh6BL4GJ5UOM1qeH+rofgs1jvhaXY
    9D2cc/o+zEv+s0KDtRBr0CndQhIehHNrlqr9NTmH2VtOU6QSUBX0yUH1fWHnf2IHkVQDR3
    U/Ke9kqtYb5IKTgSUziph4D0HrsrdktVa5NAfz8MjCfTlQTBz46ZFfYeXbCQ
X-ME-Proxy: <xmx:RkLWaonu2AWyhmTBGWSgS_wyA8Uc3mtMoheCRzDMSCYsA5VfovfHeg>
    <xmx:RkLWariZvrXWgaMY5tK9EGRfnOwleyN16x2IjyPjHXNYPEtbOq-T5Q>
    <xmx:RkLWavQQWq0jpBPClH8lFz45vDkkc5J8rxbNkKe52pD6XmcyvVHDnQ>
    <xmx:RkLWal-3BCSVCPrEsAU2g004lLbR_piXWpJimavNfF8brlr4xSsnSA>
    <xmx:SULWaujNODSG_q5KW8LRGLjTAicq_4nusiuCaej-avpWoSTeKiP3JzCe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 18E6632A008F; Mon, 19 Oct 2026 12:16:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AwmqQQkeUF_N
Date: Mon, 19 Oct 2026 18:15:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jani Nikula" <jani.nikula@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 "Chenyu Chen" <chen-yu.chen@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 "Harry Wentland" <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <3486e0b1-d188-47a9-9de6-7ee5c2cfd097@app.fastmail.com>
In-Reply-To: <6c18da11310ced4a7c85ac7862c3f5c67b39891a@intel.com>
References: <20261013205223.2396822-1-arnd@kernel.org>
 <6c18da11310ced4a7c85ac7862c3f5c67b39891a@intel.com>
Subject: Re: [PATCH] drm/edid: reduce update_display_info() stack usage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 15:28, Jani Nikula wrote:
> On Tue, 13 Oct 2026, Arnd Bergmann <arnd@kernel.org> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The drm_parse_cea_ext() calls into nine individual parser functions
>> based on the data format. If all of those get inlined and KASAN_STACK
>> is enabled, this can explode the combined stack usage beyond a
>> reasonable amount:
>>
>> drivers/gpu/drm/drm_edid.c: In function 'update_display_info':
>> drivers/gpu/drm/drm_edid.c:7040:1: error: the frame size of 1888 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>>  7040 | }
>>       | ^
>>
>> Mark all of the individual parser functions as noinline_for_stack
>> to avoid this and keep their stack frames separate. This reduces
>> the stack usage for update_display_info/drm_parse_cea_ext to
>> a more manageable 744 bytes, while each parser only adds at most
>> 200 bytes on top.
>
> Is there really no way to tell the compiler to not do silly things in a
> more generic way?

The problem is really the sanitizers here, which turn off the
optimizations that gcc relies on for its normal behavior and
which cause additional register pressure for the inserted function
calls.

       Arnd
