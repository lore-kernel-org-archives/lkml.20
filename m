Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181620;
	b=TDfOvpwmc04LjlJ/RZWp0hBYRAe8l19jt8dp8zW4RKYOqVAsbf1Q0Xk7ilUN2z7bmbYu
	 Queq2I+7n1EnXVKItrNiIYoRMz2Ddd5HM+K3Mi6oe6r60eTazGAf0Sb3j9es69EjUGsjP
	 REwRt984AaRe9EVWS4xZbCT7Jg9JTrmy8TIXcp+EhaoAIlP1s0V+peR4J1MBQTUYbx1q6
	 Ch0C+pI527AVGMFOFpO3couTL7Wq9jeX14L05Y6l7SWU6OTNIV3Ei1kh3DgvPEqjOi2WA
	 1Ts0sOoyIN3+6r53I17nrYPnJ1fKrk4qOlT7P0jtkmZ/UJxsZNoAUJSCUYjYHbZyqFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181620;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=chgp5kijwG1/6HKaEG+Lbzp+qWE6sXL3YHrEDVw4iWQ=;
	b=CNmPF0Gj2AZHMUo8MBdsQcafrIECmcyZRLqk9nGOibZ+wDoQ5Ts+4F6y5cfkug0Ir+se
	 /uBkewYhoKiK5ByTsS9VR7ZAW9ImRgOW3vNd7FBzCQi9Et5Vzig3EXwL5xqaD8ss+Sxde
	 /DGJfvCtFAy0drM19NK/84WA3FxVPSVaDDh/GgK2wbkBXGq0LmaECxPC5q2NBVC9MpwRK
	 1Zlp4kYVunNfEAVbBGl7pxuk0iJkot5EI4U9koF+Tm7JGXImm28TeaoZTtiYRlX45Uzwc
	 SwbrcAWQEajbtmJuLu6WKO/TNZbghQMl15j75LS5KJlqPuvkp0WiOZ67M05aLOvMGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=fEdn9TfE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eXVXM+LI;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C6606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=fEdn9TfE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eXVXM+LI
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 353AA7A00F6
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:46:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 08 Nov 2026 18:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1794181618; x=
	1794268018; bh=chgp5kijwG1/6HKaEG+Lbzp+qWE6sXL3YHrEDVw4iWQ=; b=f
	Edn9TfECDuUlKQRglEwd1qlfXlucAAWyz3e0Jr2Ks6MVSw2eYdo5UXfJgsSVd+D0
	g5tSJ73oLIJy6HFQHBnKe8yPrADAVVIQFTWQZqfHXXJMS4fODsS6hoAtMfz/moEM
	lsnnl8BLhJkr0yKLfzj5CR0GuDi9fkGWdKDKBC+/3TOCxG0eWiXpigRk9fCgcO7y
	3wnwMlefdXXYpbhIURPPHgsJrKbP1pvTfMpgaR6ufhhkzRLXcA60LXcfH4F/Ss/M
	Eksf30nuuvC8aLLZv5+wJjLXuyjiY0mHrdfUOBHwq48WrWqjNLTc+XqfkS3R40k9
	AL/cDWPdD9lKl7j2NnOVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794181618; x=1794268018; bh=c
	hgp5kijwG1/6HKaEG+Lbzp+qWE6sXL3YHrEDVw4iWQ=; b=eXVXM+LIfB/BgW1cM
	xxQShGWHW7Wno4drhMbxx0iEXecV6UVrf8BpnxtowbE28wKP9ui7LFLWCHajN5XV
	tX1h6T2n5cA4MUPCpoXjFrIgE0jub4BCRJWHH2ggOqaecJyI/pPECdTHUyaBfRXG
	ZDr7bbJYMcV1f5JTHxHK7fd3vOiIdmTmfszdwHgkKtgnYwRge+0V4S43pzrYyi40
	pp6m8Y3Qf7KgL5/zwo3Dsz6Vzq3dP2tOJ58LuniFblFnjKfQOih4W4Qq75R4BgZO
	4ZoxgHIPDJiXIsDjpieOJrA0MvPumes15/miVxZrmrfbQdGEemwWTobUALnOo6py
	VxdrA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794181618; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:QPHukETBw2cwgv28EeFH45RJmT8xjPIZBrZVxxQrhlUf8Wn
	45FROCLjYhLJQW1/SLsetsODIGNh5+7uA0C9hrWfT4dNwPg79WBiEP0/1unRr9lu
	YzT7MYdyKw+4Z5H8uz4PUgMraa6uipNMaMaF9/hsWWZCIJG5hChkz7QGxMDyNwrK
	cz5KHb9IR8CTro8A4F75vtMWXysq8JtAba+8Ed8s/3/s68ouRpU0t+oMokltwRVK
	OF46YfwJZFgvsqI3iV2Z13HCCDctxarr+m/5NBhuQdXfTj6iBhEpDDAZcZwgFCYL
	hMTUOXbUFN0brD27xdaXtnjCMzyHIFcEFm9ew3A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Vz+lpTXHuWHHFUnSbBw6lyjc4LqD/3C4UpF7FUIvvzE=:chgp5kijwG1/6HKaEG+Lbzp+qWE6sXL3YHrEDVw4iWQ=;
X-ME-Sender: <xms:8gnxamXl5ZSbezaxTT9BeMwV7lRuEATqg32wk19GaWJ3i68KMtM3Aw>
    <xme:8gnxakGUuIZOvAbd5hXTnUasWPdz7RmLXk65i2n5ac2NXc5kQGd9DHL_4WnUggxpb
    83taqE3zrNwyLGGz9SceZPbUgs3BfRALRE-fArLLm0JnqzVpBvXoI8>
X-ME-Received: <xmr:8gnxaqdCy3Ceh0a-gaefXivQvs8ay52_xte5gDP0fKu8W-rF5GbYr70Q4SeG3_iC>
X-ME-Proxy-Cause: dmFkZTE3n5JXdSeTkuk5qKam4RiK/rrAPwg0NDllVXIsJrQIS9xzmIESGOzuOTE9H/S7xD
    qnrkBEOsm+06glSOPFkOspgjAGlrRzYZtH5qZnq34cRMTiwdg+UyipfgXOSOFgQ46drjAn
    Nooos8aie0yPcFpK17vIYFsHRrPyjqiQAVouUXsPly2590cAc8TzRTlhwTLbsF0+VS/DPA
    ZYzEBV+0v3ona+NNMz1tbWIyFsnbupx0D/GKjQykcGQ4E3cksXOSYNGy/9uXdK4IpzDtOh
    Tp0RlOY2cXxvdnJK1cjK98hSd6SWWnKpFvEc6TZS/7xh4X0r5YIrY0U4Xyab3tXdiyG2Zc
    xyFA7ug06b3qKQ8vgugO4ftNPBrEW3j/QKE9LEp5PcaSbrnlXREPpMiie/8n6ryIAQbZsf
    0mUlwsa9a2qXG2TRZ4N96TB/UqiA8rsHwRtGXqAs2PTWkPM+8GvgrCl0r/5GsHTnkkO+GB
    1p4A/NldxnB6DHjriMwRvARSrPmjRIDScLbzjfUx5LkF4sqTOVelZS6gp0MDTaETTcO+jk
    Ow7PPFMN3XImMNWVoRA57lUQA3ypSXhU93agrimqssz/KqR0gvaQrgtRtaY6eMkdmC8bpn
    /ZLNAFPaZjkeUyb9e6pTHN6bvcJrIuYgyShJqR5RdW8z2zGB5wLHV0d6vDFQ
X-ME-Proxy: <xmx:8gnxatLEXez4IgVI36pC3H9xTFn08n5XxVsaSPKt60oIDgBOJSPuJg>
    <xmx:8gnxanHBksYaNjBRnDcHQl0Tf5H7LSZcyL7FG8ZYw4DwYKVN-ws9bQ>
    <xmx:8gnxaoAk5a-Kel_34L94WFDVFtC1FbrwLTGOFK4IB0XmTqcRR6DOwA>
    <xmx:8gnxai_lHrIZuBUSAPTr9lUZL2amL9evIdkpb1b5HVZhKdb08vHCCw>
    <xmx:8gnxakDN6uN0gNhd2JhUz7m3CK3HGi9RYTNjWcSWxWc-4mnT7rzDSNcq>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 18:46:57 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: linkinjeon@kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH] ksmbd: read request header for compounded CANCEL
Date: Sun,  8 Nov 2026 17:46:53 -0600
Message-ID: <20261108234653.1918767-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0cRgD2yOWbwKBhBZfP0O2ejMhJmcsRk-SQgKJhFyowKBsLZmKYKUb_iKGC1VTDPMUlJrnX1Qpa-CsfMFLwt8hxFqjGhvOLwzEGkO-0JgtvQ=@proton.me>
References: <0cRgD2yOWbwKBhBZfP0O2ejMhJmcsRk-SQgKJhFyowKBsLZmKYKUb_iKGC1VTDPMUlJrnX1Qpa-CsfMFLwt8hxFqjGhvOLwzEGkO-0JgtvQ=@proton.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 22:30:59 +0000, Noah Weinberger wrote:
> The chained response header is initialized with Flags =
> SERVER_TO_REDIR|RELATED, so SMB2_FLAGS_ASYNC_COMMAND is never set there:
> an async-form CANCEL therefore always takes the MessageId branch and
> matches nothing, i.e. a compounded async CANCEL is a silent no-op

The bug is real, but narrower than this says. init_chained_smb2_rsp()
copies MessageId and the Id union from the request header into the
response header, so the async flag is the only field the two headers
disagree on, and smb2_cancel() reads the response header, which never
has it. A compounded async CANCEL therefore takes the MessageId branch.
That branch still finds the pending request when the CANCEL reuses the
request's MessageId.

I tested this on ksmbd-for-next with a blocking LOCK that went async and
an async CANCEL sent as the second command of a compound [ECHO, CANCEL].
With the LOCK's MessageId, the LOCK was cancelled on the current code
too. With MessageId 0, it was not: the LOCK stayed pending until the
holder unlocked. With your diff applied, both forms cancelled it, and so
did a standalone CANCEL with either MessageId.

> MS-SMB2 forbids compounding CANCEL, so only
> non-conforming clients are affected

I could not find this in MS-SMB2. Which section did you have in mind?

Thanks,
Ian
