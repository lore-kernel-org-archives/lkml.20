Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132255;
	b=J3/wzaUE787Rxbv67+5HYBDYQnIFDvq9fIQhU1Z6cbg/2BYbTCllhA9GQdIi+u6WLndQ
	 Orv8MNUyJvfrunChM9ZlQkLLqRdDig3CZ7xq1/Cr72913NI8jvVoI68Ht6GwkjGQojxOd
	 lipSmF/c5G2P8Yc25kYy0tGjps4TwRR05jKjAJ4ADGKuZXsWABy+4Fs3NYp5BpqixV7wl
	 CRwc0m0owdbszlon5RfriL+kfGb3sY4mnWloxt5l665ueIUfilcwKBu68oXahKfeyWFx/
	 K/26UlL3paaDULwFxrYgz4zsM41iaQC+qWcbgsqi/C6A5WSjToyvd+6VG3Iko9SB7YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132255;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=KKwkeFgU3gXfmKW0SRyZt4v+TocmcIjpYN2wd5Bhajc=;
	b=JLCXS3ZCmdKCb/MRk12rbfJVQt80ynB4yaXKh07IfesZhYejIBpTQ6lmVbgkurqQJe7u
	 TCJKfdemv6l+mqN6cj8RXlZ2Kz+4NYGIGAHmEmY4DwpE06MsZNM7SDYpC/R5g6+4MAl4t
	 48hVJDlIhdmvuze7FcVCYlJsS1HCTQrI/StLLeQacpSvxJGNAtVmk+ye6DwZwNvqmV6C3
	 l/0ow6J+P22y06KRdHSnZlYXyvKl+XLNa+L6tC339CohBmzUWg/MzXNigQPfhvmLYenvw
	 CNYPVf1Fe/AGZVl83jl6XwSrCg6trk0WahZvziBtn4bdVM03tjUn8cvq3Q4x3OjGpdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b="jR//LgNx";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NHMWqTTR;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF879606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF879606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=jR//LgNx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NHMWqTTR
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 0A6011D00149
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:17:34 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 27 Oct 2026 16:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793132253;
	 x=1793218653; bh=KKwkeFgU3gXfmKW0SRyZt4v+TocmcIjpYN2wd5Bhajc=; b=
	jR//LgNxqdJ1855Eonm5NxFLcQYXl3QkwACGhA1uDEhdymejLe58nH9SZguzjlZ3
	EauDrD9w05ykiccvIC7JfzkoG3NR34ApQ28ovYwg/34C6IoiuUfh8/jCSIdWI+Wu
	O2yyChamrQH+nIZH3q7ixfIp/ZKAevEUss+rgmjLOw0ris6GkLJ+ERtdZuL7Sehv
	N8TtsVxrpu/R/3SUodm0iQDPUCAIQEQDE3okFE0SOiNTJYcfWCor4Pjxu9fK8Qg1
	bfPgrOFZFo4zHVPkT0/+vs140UtLg196gOeJM5DLbAaZPPwA6aOPFRZWMZU210zq
	iUQBiv3UvvkCk7Lss3U/1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793132253; x=
	1793218653; bh=KKwkeFgU3gXfmKW0SRyZt4v+TocmcIjpYN2wd5Bhajc=; b=N
	HMWqTTRgdOLk/pqTxHPCFd1KOeV2ja8zlHZc3GNteP/RfTZafhl6aUigxsvL+4oZ
	1ktwBlrSu36HoatxaIaYpmoK4s03yxJcWXX8Wq7CTP/PmsVLmq1H0UNloQIP7kBI
	CRSmp/xAf5uxZfqRFRFcpqB2xJu5cMqpWmttvPAtzz3xOh31HG3wuIplBopKQjLk
	vW2Mx7p+FJhNv8iZYdKBjMeQE8Y0wY1TNZr4YKLqWxEM6a5D/TFgxMOit+DyMh7V
	2v694EVVblhrQ+ANCLdih2OzqOPN5KV3+pe1XwYL3r0vkkt3jkGottKUovZgDwEO
	cEcnDX6j8RTeikccx6Law==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793132253; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:GlebX0B+IiutO+KxE+Syv0DM1TMRx4YYRj/zVWMeMzx8EwN
	Iuuc2QDPVGhln0w4m16Bu/oUTS7hxjmQGz+cwm1/FQyAHRhi2tDxXPE0IduFXJHJ
	gPlR4sBPAQLTNo1cMRq2/ib0QYcMbDPWCbj8R0haN0/GubU0sPLAGORBvxh57cFq
	HWlAVl3Ua4efdu+urxqUl9+wl5x84sKoUjQrouqO3QI7N5BdnqppWVzPYHgwJABP
	XOmKXWh321DDpMO/Uh7+Pa1ldyAsy8ET8OQxMGlbjRq/J/84EH2UI/VPg+hyUwLP
	ZJ2ZeIKlWPUrLISMuETNqh8GtB27X4pQUEAvlAg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Nep/12MHvmmJQH5s6LGpxzUD5s0BrbGyAmaBxU9y/VA=:8elFCOVnDjzDevYIrkiXCBs5k+XBc7aLcTwoHNT+2EM=;
X-ME-Sender: <xms:3QbhauI3O6eIc8kH9YszxFuGRgxsUREd_fw9YX1HzzZ7mYPVQsw0ig>
    <xme:3Qbhag-rUsTf9oDZMPQ6AXvs2iQ3oEKSKkecnteOBijzDgEO6wzQtcbH0VT7l_LjU
    HMtD_haBTSy18d-h27bQU7HMyB8fB1hqU1HfsQm-_5K0_0dRcdmmm_x>
X-ME-Proxy-Cause: dmFkZTEODNfd+5jyxRpKnbWFaRZYVF8JtUu2LRUSMMuUvfzUgZQewT6BgYUipmBkOBRmf0
    PSnguYVp2KGoZeLL88bgzeXmBH2T+qG03+z3QxIhxQAhMTYzmFICzkcGA3NHdFkXXc/vhm
    IRrrJ7TADjYBlqUyxLq7W81tfavekyaabbrMpkrRuXR0aJIEWTVe7CEW6FQ78RG/ovQqnD
    ehbQfJpiTYN9lXfGR0n1GHZcK5Pw1U7wVaoaPYkRVmFAD3ov4avkzLAsba5BWORAoEsNJF
    8w0GPrZqav3NOsfwSo/7LW/uDzPpDQSfJSYJxiMfdXof4NKb8AfU+p2nmzwKWWIq7xNPpU
    aa/xxLOHxUQKHwWAqCYkFUt1M7FH0Wqiwe4e/Ct0EJaPhepD7pWfEF+B2ECmJBLgMlvJok
    JtXHGVQQ0bgJWvvepNFhpvJ5QrPadQaP80VAjRnQYNID0a/wLWKdaV4XcmGfr6XuWffxCC
    k6+O8lm2ECUzBJW6xPxBW4VPUXdKXeIaSgaULundntcWoucmBj1wxCfo+50nqmRYA9O9pW
    e9fovkIrRi+DHXcQi6hdZhmqG6AnKYyjVEQ5/aMczsyGtV0Z2kbTcb4gBhryn5aUKHEZwb
    T3S/9OR7zjWBjBpfeLH70eKZ6Equ6Z/xlFZBxDX6poCNqX3wwbwZIIjlnbhQ
X-ME-Proxy: <xmx:3Qbhan3rtvRV1UESG4PTADhzPLOvS6uJDrmgsch2zq7ku3MC2p5ZjA>
    <xmx:3Qbhas943SGiCAFW0lkij_9E0tX1n0-um71J1pLQBBTJyZAI1Nyl9A>
    <xmx:3QbhagP9vOmJjN_jOwe_lBPaHpv_Xfwi0AFK_cFkPJXQfjAexIPmFA>
    <xmx:3QbhaoeWLa9nMe1Rd0cu5bRASlQHMgjL99LtUPXoeXc9qVeVPdYu-w>
    <xmx:3QbhajOBpIlZOaeWgSqELbNx-pP8o1nUuoJ4OyaHc3uDM-ydEOUyFYWf>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 03C9A2C0007E; Tue, 27 Oct 2026 16:17:33 -0400 (EDT)
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
X-ThreadId: AYlPbohTFbKF
Date: Tue, 27 Oct 2026 16:17:12 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <03186586-6a9c-4350-aa7b-a42de11ea420@app.fastmail.com>
In-Reply-To: <ap6akwNAlqmJPMOz@black.igk.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20260729182203.3667583-1-mpearson-lenovo@squebb.ca>
 <anMmhwSSLEAnAZZI@black.igk.intel.com>
 <b98ed1c6-37fb-4235-8ebd-df350728f797@app.fastmail.com>
 <ap6akwNAlqmJPMOz@black.igk.intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Retry if notification enable timesout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Heikki & Greg

On Mon, Sep 7, 2026, at 7:05 AM, Heikki Krogerus wrote:
> On Thu, Sep 03, 2026 at 02:18:08PM -0400, Mark Pearson wrote:
>> On Wed, Aug 5, 2026, at 8:03 AM, Heikki Krogerus wrote:
>> > On Wed, Jul 29, 2026 at 02:21:50PM -0400, Mark Pearson wrote:
>> >> Found on Thinkpad E14 G8.
>> >> When UCSI notifications are enabled the FW does not ack the enablement
>> >> itself. Future commands will be acked correctly.
>> >> 
>> >> If this happens try enablement again and confirm acks are working
>> >> correctly.
>> >> 
>> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> >
>> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> >
>> 
>> Thanks Heikki.
>> 
>> Just curious - what is the process/timelines for this subsystem for patch
>> being accepted and making it into Linus's tree?
>> We're tracking this for being able to get it into the distro's, but I want to
>> make sure maintainers are happy with it first. I couldn't see it in usb-next
>> etc, so wanted to make sure it hadn't fallen off the radar.
>
> I'm sure Greg pick soon.
>
> Thanks,
>

Just checking on the status of this (I have users of this platform wanting the fix).

Let me know if anything is needed from me to get this fully accepted upstream. I can't get it pulled into the distro's until then :)

Thanks
Mark
