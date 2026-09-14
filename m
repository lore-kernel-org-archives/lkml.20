Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD6496D5E;
	Mon, 14 Sep 2026 19:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415624; cv=none; b=JIHllI4e0jZMQCzEpwpdQzitXEf4qiAFq/CiUyVIdjlDo8pl576Kw1XmelJklvTQUb5uEHSOeyBKZ6HTX/W1sglK0vklw8BeiNKLW1gyJNcG7OdUSSh8F/oXmKYUrWEvVYIdsTX1ahcZC/qEYIPl/0fMP1j+IR3EOYugrzaeoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415624; c=relaxed/simple;
	bh=E2pDS5GaSNUQXDT27nNSw2vgkOr9Ijzb9Rp2UNGR1Ds=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IXwMZrNFb+C/xGg3N0d363FJp5OKa2FJto3CKihiTNztr+fwGginilTxlGXK4TzNdtkpUBs0FZpW+rop3zxss5LTfxirOkOeEmuhbngrMeF5xOBwxK5YaSxC6nbLoQkKNW0fy28cdpfQ93klSERNQhjby0h9BjTYwqCyKDX3M3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SXx7rO6q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X1NEAzsG; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SXx7rO6q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X1NEAzsG"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 080071D00086;
	Mon, 14 Sep 2026 15:53:37 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 14 Sep 2026 15:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789415617;
	 x=1789502017; bh=opaCvCnTuRSbqkN6v+2aHUWMlgp5xCP12xi1paNZ7Uc=; b=
	SXx7rO6qIQgZ8O0wzKw8K9aaUJzr0t0oZlP92QFKdwqH3sy4D66HQ5imYyVjHimY
	4Q5NjIAlfuADMRh2NQgR2csXnodBozzW0fTiaCLDIioVEYt0AynT2QvdNQq97AQR
	y0Fqw4ykudDpB2jOOm/V1N6yVJOnWAiOqGK/XIMh9UUz+1EAXuyW9v03jq4XgAP2
	2mHLYxRRGQ6FUtBt0LyVH51Z/qUhqj39vHKlxC5B7YOLk75UVrBPAxOIs+nntDBs
	yPIiJ+Tp1tHR0N9v9NAq8cQCqeoI0v3PVlyOkf3YKoXLiGCfViVquCUeZtF2MeTg
	SnYRdmgdCLB/bAAivP9mAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789415617; x=
	1789502017; bh=opaCvCnTuRSbqkN6v+2aHUWMlgp5xCP12xi1paNZ7Uc=; b=X
	1NEAzsG1IAZML9OZDVCbJTAd6PZiIScmF6EQz6HoillENg5x9iKA5PA6e+tdk3Bp
	PypF9f1EZcvBnWTdclhq8+hMC5rtFMrz5P55YboUD74+Dts/ZWZbghSrXr/6DGr9
	sJy/ZeJw3Yg/UnkAN0KUvIyMSAy6M13rEQ3njzgcsaPCgZTEtXTrpY3R5hY2d4H1
	yHRsrNqP87qcOIXEmi1ZzBFdrzlJ0EXacUnBUUalwKvVeiVG27oNX8zTdVlYV+5G
	BPeWDeVFPDAVKmV5Mub2cFtGdOe3sAibLjPgx0vv7otMZsLrepsonn6oX+niUPf4
	exLakNAWHLwCmxMhJ3yAQ==
X-ME-Sender: <xms:v1CoalVLJjEK375I8AcdnZVD6OC4H5j7V-eX8kfLza3iqkRtZodU7A>
    <xme:v1CoagZF51gy7ynRbWZHjM4_cbvfzlRTOX3Ufyhx5H0lW2eAC7W9sRDxnpYMT7TjZ
    EITYBhNXSKk7gf-EHLxGaKADUZCwhe04Pu6M76Fq5SAEKIo0SBmXfpW>
X-ME-Proxy-Cause: dmFkZTFJURTY62Q7SjjrdQBiZ9cK/QsrasdOpZ0C4CYJUiQ8fvYo5xjoK5R5hMDCs5S+mQ
    4mAz41kXkBUv1l6Ddaa2CyFUStIFEeH1kJgJXUZXCb/OB1VNX7p65ppX+f9DVlMONBQ+tu
    flzVfJFJIHs740LfRcASx4VtYsjrCfL7Yl2YOLhpICiTIU08KSUD9RAKbSiL9fp/32SgGh
    zL8SHSRsUNlTljWE6f7j1yPE5YJKIELrlXKP7RmGb7P/YaXFU6WwPdj7YOZvVlTjNslSVf
    1jO4D+MTMvJbB1ZkG02tSEDwMweIH90UaaDct50l4nhV9wCsh1xG1hk0Zb2+II+9L0vufl
    /hj0Qtgo1YMFrIf5mNeAH33MAuc4kuVjBL48lbyPzQb19vUkqkFHuhwPEW0et0VPrFaMYP
    lt+eg6kbYVfci/rFwAh6Q435bhox3yfM+k3d3/jTl87/6UmEDI7gsu3slWu63QTCLUqz7q
    2sNgGQ1lVHJihAlaKG75Vb0SiR2INSxfvffKh7MLcSm6qTsE1aQ7YFef7KZR3UOjfFAHXA
    gLmHBrv6KVVDdSTHFydHLqzsfVRrLIEXmn9q/0ltU1HAvx4ZAUMQgfY7WJCm6FaVOvRuPI
    BaIVzh0cMBzjPiaRTNsl+4dappa2Dvu8HCyCw6xjfju23e4Eznp2uABiRklA
X-ME-Proxy: <xmx:wFCoanC0J5EtlPbP4_25RowBHhyM5I-veJHZduujJNKiIspCFs9sPw>
    <xmx:wFCoakZacQzLrx6V3EqUzdeTs0SdXOM4s7_Kd6vzCW-XHks_MTbJSQ>
    <xmx:wFCoaq7m-LKVRJOt8bawE0kMJeMaH7nnhhn6jMAFf0xtfLnN-D_G_w>
    <xmx:wFCoala2Q-U8mB3lS6H1MDeuO6RvdOMLt3t4hPiMED5wX5DDI30XIA>
    <xmx:wVCoajF7Z1GjnWQObrlfo8_TigsADRNglTK9FlQPS9NxekYjYlzzAZFt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6595732A0084; Mon, 14 Sep 2026 15:53:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmIRJ1Q9JmRB
Date: Mon, 14 Sep 2026 21:53:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next <linux-next@vger.kernel.org>
Message-Id: <b6ca14bc-a4f6-477b-bbb0-da12d27b61af@app.fastmail.com>
In-Reply-To: <aqgf5o_gSUQH1AF0@sirena.co.uk>
References: <amY1zEUOGFe4Op6W@sirena.org.uk>
 <fd352f58-8100-4b0f-ac8c-25b08d0e2886@sirena.org.uk>
 <aqgf5o_gSUQH1AF0@sirena.co.uk>
Subject: Re: Missing signoff in the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 14, 2026, at 18:25, Mark Brown wrote:
> On Mon, Aug 03, 2026 at 06:25:57PM +0100, Mark Brown wrote:
>> On Sun, Jul 26, 2026 at 05:29:00PM +0100, Mark Brown wrote:
>> > Commit
>> > 
>> >   3edcea7f0413e ("Merge branch 'arm/fixes' into for-next")
>> > 
>> > is missing a Signed-off-by from its committer (and also isn't showing up
>> > as a merge).
>> 
>> This issue (and the matching author signoff) is still present today.
>
> These issues are *still* present today.  It's making noise whenever I
> check -next for ongoing issues, it'd be good if the branch could be
> rebuilt.

I assume you hit this on the branch I pushed out earlier today, which
started fresh from 7.3 with just a single merge. I've amended that
commit with an S-o-b now, but I'm not sure if that is what you are
asking.

When you write "and also isn't showing up as a merge", do you mean
your script has an exception for merge commits to not need S-o-b
but fails to detect this one as a merge? I see that about half the
merges in linux-next (including your daily merges) are not signed off,
so I'm not sure if we are all doing this wrong the same way, or if
there is a different problem with the soc tree.

      Arnd
