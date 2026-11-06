Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980962;
	b=ml9Qtg/nNyCCIYsxlSB3Tq84kI4EHvwyWQYPoN/g0Xk5PcOvm5Hib4SMZEqSnHnC6n5D
	 sdbhz8XGH6UhxgM71rqN1ayBRxHPFwRpT/ZUKupX2p6Z539BU6g5XLQ0UB2DRa9N7DosB
	 NyTTX770pX9/rru/lUUDi6aKefRMw0+55tZdV15WNCsoF1IiIivleUMtUmoNs3MK6XlQn
	 KiArc41//Hpveak1NfLHhket59cnEUxlSR2vAZ9wM8fHZvbVQrFNxjBMBi2tyD+HdV64u
	 PcO9jZmkSQ0esKnq8iG3FsVjddNb+McmKW+jpfxpZ0Sylj/pHWA1UlIVuuig85hnoHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980962;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wpRuGom+aQB1p40BqKVMA66QnEAxTCxkfSpTV/U+fQ8=;
	b=DvFO0dHVVAK+/BSeHS+Ayex0nh6DrVV0n5yUPtrLfMko8353k4gBTVDRUm6DQaoK/sSM
	 vppLolx9yT+pK0cMAIF5JTE3jti8k+OjrJuoF6mfr29OGltHQniaxpO5ltqiO5HacvsVH
	 Ij+ch3lBuE/3hpfzoCQ0tGW8FcuhBm0frkB8FtPdlh5pnXigi2DWzsUerWGuYB7eUS9vV
	 FRnW1VTBhiZbKkZAGsBz0IrcFJNtUzSU7mjw4+sfqGiEZXKl3yaap0gRz1Fki30P+4UkL
	 bKndpAsyFavxYz9iIIU/JZvtaESzA5HmFNynuAWCTQnV4OZi6ew8Sg4rrhnYaAv3oMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=msh.ge;
	spf=pass smtp.mailfrom=msh.ge;
	dkim=pass header.d=msh.ge header.i=@msh.ge header.a=rsa-sha256 header.s=protonmail2 header.b="bRuWAVO/";
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E476606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E476606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=msh.ge
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msh.ge
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=msh.ge header.i=@msh.ge header.a=rsa-sha256 header.s=protonmail2 header.b=bRuWAVO/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msh.ge;
	s=protonmail2; t=1793980959; x=1794240159;
	bh=wpRuGom+aQB1p40BqKVMA66QnEAxTCxkfSpTV/U+fQ8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bRuWAVO/NIlDuQ42a1gbM/KpS5JpTIAI3fORBadjf1yq0rZWrruLs7dqCrmY1c56/
	 2hie+AqjK2H1s3gMMgskgI9hiVbtamG39xV3kA65YgkYtI0FpiWPPeXaXSTr73jZew
	 Wlt7lfHfWuitQE1cQcblqz4arXMSyjgtzj7zu1d3EaObTzjKO4js7NxrH75cvp4pQr
	 zBwPIRZOhytr/sMxsZVbwg58hvppPNFt0dq2csEnbYmlwnn1cBIxBpw+Wm2hHOEsXc
	 F8JHrQDUFAVAFFkiDaiJ09/eq4qMuahuEjaGQEz3SFr0igj4YqI0toC/Yd/Erf5dLI
	 ixmUUqRJPFv0w==
Date: Fri, 06 Nov 2026 16:02:34 +0000
To: Denis Benato <denis.benato@linux.dev>, 'Jiri Kosina' <jikos@kernel.org>
From: Mirian Shilakadze <mirian@msh.ge>
Cc: 'Benjamin Tissoires' <bentiss@kernel.org>, 'Dmitry Torokhov' <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, "Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: Re: [PATCH v5 0/2] HID: flydigi: add support for vader 5 pro
Message-ID: <9231fd80-a35e-45e6-a608-858e60a7faee@msh.ge>
In-Reply-To: <546fd97f-bbd6-4867-b86c-9a4a44ca44c6@linux.dev>
References: <befcd715-ecc8-463d-9617-a269dc7c62cf@msh.ge> <546fd97f-bbd6-4867-b86c-9a4a44ca44c6@linux.dev>
Feedback-ID: 170041685:user:proton
X-Pm-Message-ID: 532db2194371616abd96a0c567165a9b096544b9
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 4:03 AM, Denis Benato wrote:
>> Should the driver check the flag and warn or turn it on itself with 0x11=
?
>=20
> I think it should have a sysfs property allowing to change it and also se=
t
> the most reasonable value at probe.


Makes sense to me.

> Since you two have the whole range of hardware and SDL has working
> code why don't you take over? It would surely be better than me making
> the bridge since you do own hardware and care about it.
>=20
> Let me know if you are interested and I will be more than happy to
> make that happen!

Yes, I'm interested. Thanks for the offer!

Could you Cc your friend so we can coordinate? It would also help to
know what the recent firmware update changed.

If it works for both of you, I'm happy to send the next versions of the
series and handle the review.

How would you like the handover to work? If I take it over, I would keep
your authorship on the existing code with Co-developed-by and
Signed-off-by. It would be great if you could stay in Cc and review.

Thanks,
Mirian Shilakadze


