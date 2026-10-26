Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044920;
	b=h4ptrUwUPzztvifTplnru7TzH8Olm859jbFA6J4Cto23jnLUaFU4J3JdGbUOlj33/r73
	 ngbQQkFB02j1IQaT9wcmD98qW6n5xOTYG/ZhZ5uGc4kddKB9Y3pmG3L4lTvPv91NcaPIO
	 eB/5SjxaMjNc6KtlB3gRquZWJhpk81pFHhvJ/a95ENxzovsap0SQFE7YyV/bsMzxdXubU
	 rzDi9juTCrE2Qdyfup8hvjsTT1bsleDzHzuzTKGZl65jE3Md8JehCLJCh2jQN++hvtu3r
	 8xwviovV9AvNV1/6+lt9Cr+uz24dKqtHT1x892aUPi2dE3O+AI2hdFppJU46vuD+2SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044920;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=VTUalw67Sjd0OheYSOkJw2KWxkQoqOf+v6JIFVGFgeA=;
	b=ac1MLQtaUuPWse3eYvzAhCM9nT5puRumnoXsGMjUVlABDs9aVDb6GpTJSeQvlO8enjB/
	 C2tF6OVwUZa3z3ZA6jJzcx5Es+HJIZjclAPTbGVSkwM6FSvkTvmGfDWo7zTzzZzXfxoTW
	 9HnJfCn6YoBoVcW08FOPoZ0ENi6CAw3Vqw9I0wcl8Y5IQ8QlZJmt+S7VAaaOBDZlH6ga6
	 ECwBJizZqz408TzizM4E1MODb67E4rGzIOqEROs7FjVeaEXKci1x+Q3YS7Hh797DcSJdd
	 M+La+DuLopfQ4WkcpMhPRRtYGrFBh3IdQGqCu0dk8aeuRTsXfRPh5VhVZdjqrUwcnCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=NZ+RJmE2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="Yx/OPFuK";
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1246606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1246606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=NZ+RJmE2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Yx/OPFuK
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 896C17A0431
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:53 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 26 Oct 2026 16:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793044913;
	 x=1793131313; bh=VTUalw67Sjd0OheYSOkJw2KWxkQoqOf+v6JIFVGFgeA=; b=
	NZ+RJmE2uRhB/o0Th1Lv0lJ5jYhK31IagLbSEwGuXpLFRWQTInGTmRZ/cucgN+ft
	4UNifwqGh3hXPY5kqu5w7OvLMHJm2YhYP82ai7ZlTjKwPtOg+M0nUpps4yZLtZyk
	XqD4kB7xTLvNjEc7FXL0+AQFlpWoCFstmEFu3FlWvQs3GYmWxDKrcPBmnFPWFM0W
	w0+mXppSKt/pDp4OmDSRWfvqx9D7fFdFB2peh6KH3XU9pKOkkeoSq4jE6ar6hwyv
	oLhIqo6qdfvSuaFyKRpE83DxiZ0A7BvgKeAhecWm/1ZNvtO5VoTJ+FuVLZtK0eKZ
	PMzaJdG/PfsqO+pW/oMOjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793044913; x=
	1793131313; bh=VTUalw67Sjd0OheYSOkJw2KWxkQoqOf+v6JIFVGFgeA=; b=Y
	x/OPFuK/feWLezB2lUoZDh5SabY0F7LxHRzJjuJEY5w3Ript5l+dRSG0DbEh81PR
	3GmDQK1NCgDsVkjJ1AlfOy8qS2kSotciGEWjYmsJkmHPHrbWQAmnSMH4anxNTehD
	806SLxgIKoYaH+o7eYlNXxuc9hN3OWYYwUxF0CK579cGRHyEgYYCN4GlMwSEk2ib
	MhlW2cusrWGiJh/neIuaG7nTgtmZ1hV61GcO8wsKOsEUDHDmSPtZH1ghuWf3pGRx
	7Q/kUJyp4G5PQNHlxUXmqTwzL0oYWxhH3LBHKdoyOKxxGagCXw4Thp+2ooTAtd5n
	tkRQokaG0uArlclXQns6w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793044913; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Ke1gTBgiOnf6dWhG4w82p4Fp5N1YsU+AZs/21xzfphTQ3w8
	/3iMaqwBrTwJ/NKYVeRpDnzOIQighZxqEaraL1SqTakkTNpigQW4MpeRzDeFcmG2
	DzJ/FTScvHXU0Ft6iEgsAtRV18P7puwl6G+2i8RmvlBjQ7Byit3S1jJ+z444O4m9
	1r66KbHAeeQmOcIRyJOWEJQYUt4HntlEr2IwKtg0svmzm7qGIgRm7xI9dz6l7nVQ
	vWpggJRCVNbDED4OoEg7MjGTSfueMqjYKYVq+RqJgEZY607izjB/69tcC1rCu8A/
	I7QcP3uxV26VPWnsvywk+mzN3W3iNiEmuRoXtIQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:v+CbSxkUW4zLf2l72bFyxEhEEzXha5t+ido/HmHiLc0=:q7Kl7D0NhkE1T8RUi6v1YqAmu3sHwpSe8oDb91OsFYM=;
X-ME-Sender: <xms:sLHfasGLitLKnBHpdXBdtTUc5AOmZM5ASYuLTWBl_jGMBLFNupEGrQ>
    <xme:sLHfagK7By5ytWLbm1MK51l_ARWgiAo0bEqex12kyAe5V-dxhto8shj6iYEnAL7U-
    yXc90InQxLIxu-MwtqAN8_QfTd2koqEGAy14EI0c_yyLw8NodyVV-_1>
X-ME-Proxy-Cause: dmFkZTEeWZw4SRci5x6dFguR7oi+QjH47Y3/eSvpkMG2RLoQ4zPa/ely50POWwCqs9jRhv
    TlgmCKFDRhgphhyLNd/d9R1Nn315DpqP66fpN7cARXUjebCGIdsQX5Jzy9fXoxTc8ykSg+
    7/zcs3BhmJWa15p/6fA8ubLfRd7rTbfaV/bwXiUUuSa2j9zRDtQg3qn/mSdXGZaeMZkLgP
    5EDodRss9o6nu1JykWYrZhc2yy9o/WFeQncv7Hc4WR+PGQD3SJ8ZoVAFyRHwWn2kn8CEpP
    S6EPTP5pG6zW6tRviu5QCvPHjN9znsmONocnAdidi5mv2TBF7+T8+m3m51dzKvWdpVkHBm
    8T8UpcUNGoJ/YfV2KM/y6MzDg0gybz5AGS9bmg0xLOh5hhl7LVgOErRgr593+2eEhJj6wk
    kLVp0dJLhVz+diNjEdPOfTvH+e+mOjCG2tZQqCOnNrd7dPlgEUPCNJF1ETFgOsSyOHCeBy
    /6SEdTrcts5ms8c+BByFQr+dfZnMr1k7QsuRghv/C6Wok7AieQAmV2nHyJi3PrgETuMwwg
    WjcpL8S1wU5lESFQURE51/KLBM1ZXWwQNULH5Kul7ABttccIFdD1HbgAABSHOZvrW7x46H
    IwbUoMPQMsCX5KHo9W330UNxIAqPG325/U/DrfK4w2Mj7fqel/biMSVfbMGw
X-ME-Proxy: <xmx:sLHfarYL3Lh-M2i6JflZkLfzIr7YzlYUeTGTiMKLMl1iWxUw3PNaQA>
    <xmx:sLHfakae53zLk8jpU8e1cNW3IBCaqH3IRooWMvsajziw86F9Wg08fw>
    <xmx:sLHfaknWlwunNe2sCHwOj_fd9DCyMVSJjJy-ThUzUIZbUROfTjIxvA>
    <xmx:sLHfav3QLxQ0Nlod23XMKkeYR-0ha3NOAo_dw7pXVrrd0U50_q48rA>
    <xmx:sbHfajzIrUOnmVdFLTfLxSg6dGZV2yTxzk5P0oZ5fIYOHp-cut8LZm3B>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 638F92C0007E; Mon, 26 Oct 2026 16:01:52 -0400 (EDT)
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
X-ThreadId: ABQ4mf97QAT7
Date: Mon, 26 Oct 2026 16:01:32 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "David Vornholt" <dv@etik.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David Vornholt" <david@vornholt.online>,
 stable@vger.kernel.org
Message-Id: <e22cf1da-89f7-4c98-a90d-357b18687df7@app.fastmail.com>
In-Reply-To: <20261026180907.76867-1-dv@etik.com>
References: <20261010183917.146821-1-dv@etik.com>
 <at8kLPzAnJAfZRjF@black.igk.intel.com> <20261026180907.76867-1-dv@etik.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Stop a power level change notification storm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, Oct 26, 2026, at 2:09 PM, David Vornholt wrote:
> Hi Heikki,
>
> On Mon, Oct 26, 2026 at 10:58:04AM +0100, Heikki Krogerus wrote:
>> On Sat, Oct 10, 2026 at 08:39:17PM +0200, David Vornholt wrote:
>> > On a Lenovo ThinkPad X1 Carbon Gen 13 (BIOS N4BET78W 1.48, EC N4BHT61W
>> > 1.41, UCSI 1.0) with an HP E273m monitor connected, the PPM keeps
>> > signaling a Negotiated Power Level Change although the power contract
>> > stays the same, and signals it again right after it has been
>> > acknowledged:
>> >
>> >   ucsi_connector_change: port1 status: change=0040, opmode=3,
>> >     connected=1, sourcing=0, partner_flags=2, partner_type=4,
>> >     request_data_obj=1304b12c, BC status=2
>>
>> Okay, so the PPM really should not report the power level changes
>> since there are not power level changes, right? Have you reported this
>> to Lenovo?
>
> Right. The connector status is the same every time, with the same RDO,
> and the Negotiated Power Level Change bit is the only one set in the
> change field.
>
> I haven't reported it to Lenovo yet, so I've added Mark to Cc. Mark,
> this is a ThinkPad X1 Carbon Gen 13 (21NT) with BIOS N4BET78W (1.48)
> and EC 1.41, which is still the latest firmware on LVFS. With an HP
> E273m connected over USB-C, the EC keeps signaling a Negotiated Power
> Level Change for an unchanged contract, about seven times a second,
> and GPE 0x6E fires about 680 times a second. Could you pass this on to
> the firmware team? The details are in the patch:
> https://lore.kernel.org/r/20261010183917.146821-1-dv@etik.com
>

I need to read through the patch properly - but the X1 Carbon is quite popular and used by lots of people. Have we been able to rule out it being the E273m on another machine?

I've created internal ticket LO-4728 so we can see if we can reproduce and get input from the FW team on why so many notifications would be generated - generated so many seems quite wrong.

>> This problem may only affect your system, so we really have to isolate
>> it somehow. I'm almost certain that like this there will be problems
>> on some other systems.
>
> OK. How about a quirk for this machine only? ucsi_acpi would match it
> by DMI (LENOVO, "ThinkPad X1 Carbon Gen 13") and set a new quirk flag,
> and ucsi_get_supported_notifications() would then leave
> UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE out of the mask. That replaces all of
> the detection logic in v2 and changes nothing on other systems.
>

I've only skim read the proposed patch, but I'm also hesitant to say this is X1 C13 specific.

As anote, if you do end doing a quirk then that field is bad as there are two different variants of the X1 Carbon 13 - ARL and LNL. Better to use DMI checks on the BOARD_NAME - there are two per platform, and I believe you're on Lunarlake so would be 21NS and 21NT.

Mark
