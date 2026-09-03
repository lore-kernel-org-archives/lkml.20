Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02007E105;
	Thu,  3 Sep 2026 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459513; cv=none; b=LVIijp00J6/BW9043xXZ+XGA0vq0lSaK5BB+p7K/C2zIVWq/U8FRjSnYrnptYP1IyGyToBbZXcoC24n7EnR3hqZD793WULOZNuyifPy4+zo7sl3sGOgwAkJjmtl0YGlWXtMIBXfOxkn2pawvWqqMhVYOZyAeVXEam8VL1SaC3e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459513; c=relaxed/simple;
	bh=q0pRZtMzocciLXZ7Uk1J4rxdMU4bSglWz9Zejnxl+6c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fPtGTf8adKzeuBtND576SHOMA8q3sAIfqcKHjXsHgBsg2a3dJ3i2n6U+7H/KVMoQw5O/MN/hjtDPujc1YjZJrg1Ny4uPXTwtY/gjEvuHdZ2336d/V2GBeEqiBJKNbXc2QlrS9Z5+okDna+rdDcJpWha3/Hr8d7/BgNuzEuxN57g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=y3Vckjg5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bdiWv99k; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="y3Vckjg5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bdiWv99k"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C7ED114000BB;
	Thu,  3 Sep 2026 14:18:29 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 03 Sep 2026 14:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788459509;
	 x=1788545909; bh=yJSVbKwMvwow3JtKYZ5b6ktTLZ/s1e1Bv6rK8BmE3Ws=; b=
	y3Vckjg5cYfQYcoUkx4IhbYtOI8ixbGgFczrQTmPSu24pAnxrL811FY58WZb+VjY
	9UEL0pH/B7XJPTHjS6nykI4BkFHMQJ7q4U2582S2aDpem9Xz5ardGWj028oUVbRj
	K9K3OBYutldAnAd2NtbTQAJjDMtky8OD1AC/ColqMCTkT9+35BCRU1yYUrAWSnEM
	1lzIBYujn2OCbv8YxE/3iNxM5S+bLOJyMCWUcu1onI29Q41XrsA1bzULeHVxY7SZ
	4AttvmFlTMLHluz7puCr0AIQNFuxfk6NsqyjhW1VxIhC6grVO8nRJqDKQvj2s7mW
	gFhivaevj+jcK3q+2pOdMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788459509; x=
	1788545909; bh=yJSVbKwMvwow3JtKYZ5b6ktTLZ/s1e1Bv6rK8BmE3Ws=; b=b
	diWv99kyP4rCu02DJaechzsCZ5aBxa4ZDRis2vrxINybIUjLGKBDyS8NJdrGRgUt
	neAfnplACTFL1FcHkKfIY0R+6skhZxrzIdAlJY/PD9gwPnRwkfviqSYsh1wjbO7h
	mMmkMEdwb132t3nNtHHotZ2XBTL2TlOypeUq4MbVCswINlmIvNJEKRkWXw7EQMeq
	Huszg5VLK5LdzS9GRlC9X5WE7xLKwriws7cuT/8Dx8zVBAxsAVMb7hPGYwkPPsF9
	XSbMvtHLhQXhj24YILqCGkAdH1ynyrMFHPUhpFzMwaH0JpyJNDWayD+Aqq1RDzV6
	bweU7Is99Zsu9t7sHjILg==
X-ME-Sender: <xms:9bmZaiE_xeGtpj-aAZG8FqxPjt3hRpaFNuwo3_PFeh2Aib8Zhv18iw>
    <xme:9bmZauJargMgfRnRnN5OF8BdnJjwnroU23o6WlFtHeDagzbo6tqjzj3oWwiYEAoGA
    5-hxD-J4b-eqfJnF3bJ6ktjR3rahnaNzO_3ObDpnfNHQSAReD3KWCrF>
X-ME-Proxy-Cause: dmFkZTGz2sGakKQmWs4ObkEsezaHzQnaR8zoMe6FG4x9vwNpWVPin7aeMOow/P75UR78bk
    RHl492FO+616I1+nkzegTTctVbOajGt4IQ0tSqx4rcTs2AfNuvKIz/r3pK2wwarcbdfrfi
    NgG5Dz3Qu6i2BusqveKFOMQ2RwxKEO/7/YWQHn9NYSJRmXX5pnpYcFuFbw/eTX2Ez3JYp0
    cRsgIoctBwSmq5h1EV5UYYQQfzc2uJq9wbdsQcqD4s8FBQIqCVy8F7/3YvsLUqvn3r+fW1
    hBPEWtoh6Z5N9ospob9hdoHd4ETJiBUwKRoHvL2gJrKCElwwJjEs4PyoJ8cEtUEj/tP2S6
    vs3CT6uixPqXFEwEy2q3nEhZAzHzgddWYWZwcu9e5yu7uxncYKAfRmZd2s7J10uw2HuMdk
    jE35cwANatK8WciLpjt7vBPgoAv1qv2B3Dsx2MrnbXvDHG/aisKIT+HzsxNskZq6snI4vs
    cJ48HMYK+0IS2BynVhmGOgvjujhfgOAU+QHtU7JyINkh6wEVesSP6LueQLsKlMcZuEQSTL
    xZ9ZODd6zPzhgeDqIS0cgZuoL03gao4YGpcMyDw13x1pKFc/hPY4I20pxmEoMF9zQYA21C
    GqjcryleQMWzJmg+6/zTAK6lfSt0C/jgClJaKuh5RdmmhF/GqAXPQ95zsOzQ
X-ME-Proxy: <xmx:9bmZajx-KKg1US7GQ5HfUsIpaV3YuqXA5_2UoprSFMWBD0_nMVH-Xg>
    <xmx:9bmZaiKOJH2t8DKGJbnVzG9dXcu-su6rw1bGMLnBnvWSizQu5RXGyw>
    <xmx:9bmZalqjrUYQiMwiE_LnhjskrUaOz0uAk7K3Wq1BUgQadoG98BR07w>
    <xmx:9bmZapKTSkGoGSleTvKtRa3shs6BeXZFE1S-zaqsQ4_tuAbuU8aBag>
    <xmx:9bmZag7dgwcqO4L7Gzbqrxm1ZZJsbntyWYbZzO6c57Co3lJU4iZBWTQc>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id EA9C62C00064; Thu,  3 Sep 2026 14:18:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AGpaznFded8J
Date: Thu, 03 Sep 2026 14:18:08 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <b98ed1c6-37fb-4235-8ebd-df350728f797@app.fastmail.com>
In-Reply-To: <anMmhwSSLEAnAZZI@black.igk.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20260729182203.3667583-1-mpearson-lenovo@squebb.ca>
 <anMmhwSSLEAnAZZI@black.igk.intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Retry if notification enable timesout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 5, 2026, at 8:03 AM, Heikki Krogerus wrote:
> On Wed, Jul 29, 2026 at 02:21:50PM -0400, Mark Pearson wrote:
>> Found on Thinkpad E14 G8.
>> When UCSI notifications are enabled the FW does not ack the enablement
>> itself. Future commands will be acked correctly.
>> 
>> If this happens try enablement again and confirm acks are working
>> correctly.
>> 
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>

Thanks Heikki.

Just curious - what is the process/timelines for this subsystem for patch being accepted and making it into Linus's tree?
We're tracking this for being able to get it into the distro's, but I want to make sure maintainers are happy with it first. I couldn't see it in usb-next etc, so wanted to make sure it hadn't fallen off the radar.

Mark

>> ---
>>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
>> index 49f1c53721bb..ea25c44c2850 100644
>> --- a/drivers/usb/typec/ucsi/ucsi.c
>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>> @@ -2082,6 +2082,12 @@ static int ucsi_init(struct ucsi *ucsi)
>>  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
>>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
>>  	ret = ucsi_send_command(ucsi, command, NULL, 0);
>> +	/*
>> +	 * Some FW may not ack the notification enable the first time.
>> +	 * If this happens, repeat to confirm it is actually working
>> +	 */
>> +	if (ret == -ETIMEDOUT)
>> +		ret = ucsi_send_command(ucsi, command, NULL, 0);
>>  	if (ret < 0)
>>  		goto err_reset;
>>  
>> -- 
>> 2.43.0
>
> -- 
> heikki
