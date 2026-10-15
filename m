Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA036DA0D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046755; cv=none; b=ntdJoVuWYHfolwYWAu4IAaBmCqkmPdKKITQRmY0uHKdcY5hvXd3fpdXTGmVFLtepxAVAo82uQ8b/6hJ7B83zvX0lBshnm3yFVDGajSqgEl1NNrTyvl4IiwG2sV0qAhk0WqfX7IQtT3bb4+NIoq2omjhRW8BmmCrYboZ8fL5u7Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046755; c=relaxed/simple;
	bh=TbDH69cLnOwbiRBMRczO6P3H2iBJWeJVxp2Q8rcrfmU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fy1xWzVevGHfYq7eQ/3qmik66aJFHC1gyu02ubp7bA61OJrSpTBGOjhWIdlQ/gn+BPwU/eCcDzWrrIXM+VKRPFpmuG6BN9w51Vc59DUpLMc5e7rD6juowJceRXpPUQtZyWQ+TphesPRbWOUFFxFHpLBdTSDRlZ7G5pjPYi451ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mYUtHhaI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P8cEpROa; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mYUtHhaI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P8cEpROa"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 46C121D00132
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:45:53 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 15 Oct 2026 02:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792046749;
	 x=1792133149; bh=XgqcjR77NIKSoPQmlRles1mwkK6HYO87Ft7tGzgcxgo=; b=
	mYUtHhaI03EeR/24DCbkjkiOs68WL5Wc6rVAI9P6OBgQ8Tu18H8NwOvBaE7DDxUv
	13fIHCwTCuy7nYUBtxgRrXGvaSZ+iIioEdYFaEUcs1DiadJwZ2CMLjNkGkGJ/YXA
	pbCuqmbFh4Ppstz7B2W+G11XAQZSpd2CMyeAkhl4Dsvh77XVsI0bVGxpP1dk+RwW
	M9ieVJlbWmbXPbYRpJXoEgV22BUEHNlL9EtqWVx40OohoMCJJpT4izwYPaVucsE0
	MUJMXMsOwD3x/SQDKWGvPkzqxIVJaUcM4ngku4c/8jPLSYipRCYr+YfrzwcsLz9u
	0Zougs5mmC4RgyjcWB51Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792046749; x=
	1792133149; bh=XgqcjR77NIKSoPQmlRles1mwkK6HYO87Ft7tGzgcxgo=; b=P
	8cEpROa91UPWzwmF3caR6aFqOjkB0pIWH7Kkjfbs9n5PPO778w8CjVB6uVNTMqCz
	Lw2JkTValVJwHttpPEz5bjKV8fu9ojZkjNI04ZoWjB7tFpfottVz40Y3NIx4fwus
	0Ywa0nPbc6/W9Ha1vfzMCzNB6Ul1ncH8V0AC4OrG+4UirSrIEsQkI9q6Q6h4TaRh
	tAygYL5nLyyvVSOR0P9EJtu3l3yFl8JSBK+nuo0demfCWHmbC6Rok1KE9c0356tz
	dAV90JDaAKyUcu6NSCuh3s6cTxSrH4H5HbscFcOqO8TmYGJA8AmRWKSCJ0BHSBDB
	6TLTb5MtzmZySDitP+AoQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792046749; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:l1gwyh4GnFG30kN7F+Gya7Q3G5hIUuLaDnB8JvUKOMyFILx
	ejMQJyMG25nR7XMXHkrdOejQGCH2aXwh0gvcJeAeHJu18frluz7DhbS8SnK2kDFu
	I9zIhudYWELyinUwwX3K0VoOaejoKk5NVIAE2GOVHHx4nHx3KEaS5DookHI1AASi
	lMrwL1jWKhThB6VhB8bKweJvHAx1iM5ocNoPjXy9wbdqdKWs6GjlryDvYVHwMFYY
	EXwRbxgxvsA1lhMGBgKEkrENHK0TpxgRs7ldT3zwS6nKrsa1I75fnHleSQVtr//+
	/uj0gk6asSKECa3tovCBFhnbCLtbjZbLKJDLzzw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:E6Kyr097ageaCq0UxlldGktGf1LWX1ZHb7wlqIFKLG8=:TbDH69cLnOwbiRBMRczO6P3H2iBJWeJVxp2Q8rcrfmU=;
X-ME-Sender: <xms:mnbQagYSu9E5Cy-Qm6Or-4yu1SapksQaQuGucxS-fgZNiq7Rlkq0WQ>
    <xme:mnbQamPk7gsQ763FqQ91aL8CeJx2FoV4KCS75NOTRwgwU8cIDRVDmPEngOrkrkg88
    keSwuAeViqyfOve9dXZiyBKfr9lw5xhDtkB9hH9M4CnPmOkJo7jTgns>
X-ME-Proxy-Cause: dmFkZTETerMpUv2huYRXIsC23poMftVRKC5StKO8jTV+2h4VrXJTQGugY54SDjZfYo4+aN
    BAtwDCwK/JFjkf2amBaYDC4rn77olkL8PzG57SwNbsNz577/T2weUlDZ3d8rE/us+AMdBY
    MbHX0r1C+OptsA06qHOwAczIwHzTI6qZUpvfQiVDi/jDK2tJfYfRfyCXEKcFUO3mf1jl4s
    JJbyC6cz0cNKIS3BcB62AoPkslm1OP+9S8HE6QM6d+1ZrsyP7WXAAOYEuqh6nTHzIgzbyr
    AGtnh6WacfXnFZ3ks3Qh3huYgbxPCByvwl/pA2XqW+obwFu/3bX4zTOBNABTAv8kmz2QKH
    jgI7bdK8uDMmMZpV2C3ia7I3RqRwMug8VEVyMsI8JMZ6wkli7CueSQCa0E0ecEy6+Gggm+
    y2ZN60TxY5ZAB8ezWL4auiWKiDKhaukTSN60EXmQgJDSHbMCy69iWhd6Qu/zjPIlHBNkhd
    JCLpaqWQJfzBnteebXkbYZ3A14U2EORH7cqfkiR1V2SOjwBhb44ZdAR1Vu9EDlMktQdHph
    Ec4XqS1W30KVJLuXkhagYRAz44ErNOpK91ZqJAi20owvwRnwZhRAsczn2diHLJ/aiwbCMO
    QAVeQfrg25631wsEWQoWjpT0QV1kqy2tjYiMiprEmUe1rldO7c/jnWWAOa4g
X-ME-Proxy: <xmx:m3bQahfScpsBHZtiblE9Cg6PALcL8o5NnsK7JC0qyU20GZg68gsC-A>
    <xmx:m3bQauQYQYZX3JW1w1QjpQDoLtw6n860xGMSAqnCI1-osIuLgvb9qA>
    <xmx:m3bQagsv0ePkkm9eBn6R9cbjNKtyaGeCuIFNSNYkFD1-UPSz3XG-Jg>
    <xmx:m3bQancHYk3dcrFgo3FBagtLhtAnU6mMkXntnoHCQOVToRLtDb_ThQ>
    <xmx:nXbQasntx6e88R2Cs4flpVU0rK90GmuLEN26hay8Oo29hNl5rkHLS0VW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6E03C32A008E; Thu, 15 Oct 2026 02:45:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AQIkDqPSEdso
Date: Thu, 15 Oct 2026 08:45:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Cosmin Tanislav" <cosmin.tanislav@analog.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <5b26153a-768a-4b33-bda3-19d3dea88634@app.fastmail.com>
In-Reply-To: <as9okp5GgBgc5Hlp@kekkonen.localdomain>
References: <20261014103201.859465-1-arnd@kernel.org>
 <as9okp5GgBgc5Hlp@kekkonen.localdomain>
Subject: Re: [PATCH] media: i2c: maxim-serdes: reduce max_des_update_streams() stack
 usage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 14, 2026, at 13:33, Sakari Ailus wrote:
> On Wed, Oct 14, 2026 at 12:31:33PM +0200, Arnd Bergmann wrote:
>>  			return ret;
>> @@ -2450,18 +2453,21 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
>>  				  u32 pad, u64 updated_streams_mask, bool enable)
>>  {
>>  	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
>> -	struct max_des_remap_context context = { 0 };
>> +	struct max_des_remap_context *context __free(kfree) = kzalloc_obj(*context);
>
> max_des_update_streams() is used in implementing disable_streams()
> sub-device pad op where meaningful error handling isn't possible.
>
> It seems there are other ways it can fail but this adds one more.

Right. I see there are more allocations in max_des_update_pipe_remaps(),
and max_des_update_pipe_vc_remaps() called through max_des_update_links()
that could fail as well, and may have the additional problem of
leaking allocations every time a stream is enabled and disabled.

Can you tell if those should be fixed as well?

> The bulk of the struct consists of the vc_ids_map unsigned int array, but
> the maximum value VCs can have is 31. Also the size of unsigned long
> depends on the architecture, so a fixed-size type would be probably a
> better choice.
>
> Also using bit fields instead of bool would save space.

That would likely bring it under the warning limit, but I wonder
if there is another way to avoid the stack allocation entirely.

Are ->enable_streams() and ->disable_streams() always serialized
or can they be called concurrently on the same subdev? If there
is only one of them at a time, the allocation could just be
done ahead of time in max_des_allocate().

      Arnd
