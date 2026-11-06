Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983569;
	b=QPqU6j4GfErhuJ7yLTyW7gdatTBAAbmIJToRlw+s+6aS99IaNrQkOaSt8jmWejYCqQMw
	 gwCFM8ZT3mzujlY3MSp5xaC0lWOsJqjdiy8dSJVTPqaqLzv99Dhk8JqPXOyJCFJUtiejp
	 iiSWljYWgScBvSxOIQGD2Lv51zKfik/Cs2TFy2yBY4BxKKxjd3A0WRW5dJxJ0iu81xNbj
	 Fggyy1Jq5PbcQaQJBhK62XO0OetyqVIztbun0Ylm2PmUWoo6JiDJrpvUgyjgdZAOuGPKi
	 DGoj5NXAkR5ywAvaH9hazXm8mBuKMNIH/daMVs//5nKnlxfcigrV+kzB8WRxsY/Hbhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983569;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=P8QBfiTTfPiEZ9dHQMg3odXwV+kJNdFbS4BVB2JlZao=;
	b=AWYYil9rsPnRbe7aYL/57JVYPQrRrw4BR6pQRFYXj7EATuRTGohgNqc+ydS8xIzFG/Y4
	 FtEWfumikVtC/7EfADBASKjX4kH1GmnuvcdK4EhW0KA8ltoxLjJTbyp2xVEhGIrSBq2Pp
	 lrrWZqgdKOxU1F0pve6WGZdbvkfnlinJ1hRt2fhn3DzeflxuVirC1D3qSAjJI+/bKVmAj
	 WyM7kKLtuD4q2Ocz73vQdFyc29lMcom70LATEBr0xBQhy+wocTD2PGiJNwH215h5XVTx2
	 5cmnuv0Tokp65H7/DmW3S2LsAOe+N+WdjMRSFqINTunPSrOFnJNuWP3ycvYd1EYbSxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfvMsI+K;
	arc=none smtp.remote-ip=95.215.58.169
Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9D606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C9D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfvMsI+K
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P8QBfiTTfPiEZ9dHQMg3odXwV+kJNdFbS4BVB2JlZao=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793983565; v=1; x=1794588365;
 b=jfvMsI+KuJ8UMom31avO/aEdRYsXynMr9s+g0dlF6DyGSJWwFvHz9lrxCjSu633+4Ozx6fbk
 4WV837AgyE9NwyPCH8NsK6fwbJ4OGv3hDdurd8/9y6nuZjRzoZC1MHm9FzFaE96Sm8abZISGwJF
 iqM0Fzi7G21g7Ya3aeJCoSyk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0526edb197ecc249;
	Fri, 06 Nov 2026 16:46:04 +0000
X-Mizu-Trace-ID: 0526edb197ecc249
X-Migadu-Flow: FLOW_OUT
Message-ID: <1a79cc1d-1c47-4a87-82bd-304c63deabd7@linux.dev>
Date: Fri, 6 Nov 2026 17:46:03 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] HID: flydigi: add support for vader 5 pro
To: Mirian Shilakadze <mirian@msh.ge>, 'Jiri Kosina' <jikos@kernel.org>
Cc: 'Benjamin Tissoires' <bentiss@kernel.org>,
 'Dmitry Torokhov' <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Derek J. Clark" <derekjohn.clark@gmail.com>
References: <befcd715-ecc8-463d-9617-a269dc7c62cf@msh.ge>
 <546fd97f-bbd6-4867-b86c-9a4a44ca44c6@linux.dev>
 <9231fd80-a35e-45e6-a608-858e60a7faee@msh.ge>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <9231fd80-a35e-45e6-a608-858e60a7faee@msh.ge>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/6/26 17:02, Mirian Shilakadze wrote:
> On 11/6/26 4:03 AM, Denis Benato wrote:
>>> Should the driver check the flag and warn or turn it on itself with 0x11?
>> I think it should have a sysfs property allowing to change it and also set
>> the most reasonable value at probe.
>
> Makes sense to me.
>
>> Since you two have the whole range of hardware and SDL has working
>> code why don't you take over? It would surely be better than me making
>> the bridge since you do own hardware and care about it.
>>
>> Let me know if you are interested and I will be more than happy to
>> make that happen!
> Yes, I'm interested. Thanks for the offer!
>
> Could you Cc your friend so we can coordinate? It would also help to
> know what the recent firmware update changed.

I have requested him to contact you via email.

He uses discord: you may opt to use OGC server (ex asus-linux) or
communicate between you two.

> If it works for both of you, I'm happy to send the next versions of the
> series and handle the review.

Sure, I also have another driver version to be cleaned up with apex 6
support.

> How would you like the handover to work? If I take it over, I would keep
> your authorship on the existing code with Co-developed-by and
> Signed-off-by. It would be great if you could stay in Cc and review.

As per rules you will need to keep my signed-off-by and git send email
will automatically include me due to that.

I don't promise timely reviews as I have quite a few things to take care of
(asus, mostly) but I will surely try.

> Thanks,
> Mirian Shilakadze
>
>
