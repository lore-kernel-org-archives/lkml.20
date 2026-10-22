Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677185;
	b=oubOIZYH/K/XEbqPrfjO68opBLIStrhlcTbA5/oB7D88nzZKtO/6h62tpckUhLotWZ7E
	 ttQ9G5kR52BRGJW8B3v2DVS2A6cnWrqJ+dtRtFoAxyJ5SUE6uIWhcDoPVcuKdofy72tPL
	 lOHuKaVXLrMAiRknMzS8C8kusjK1qZTUZoU/+3+llF/F9J3S0mAAiCq6QxJidPBwD12NM
	 kQqzMQD2p6F31Jj3b+ANuyWe4VNq35ieNpy9BOaTOFBdJN7Kn+pzIf/+aw5wh2RTVr+HU
	 mxvwOSrbqMyPnNL8/fUDlOnwgS6kQs3PsgXhrRJcb5c6/uhHTtfTGJWY9Oz7VfBh6tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677185;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Scanned-By;
	bh=0aOdxxHIiJ2ooFokUBRIWQ1Gic9A+VvHO8Ew9COtEfw=;
	b=h7VbKZ7bJg5TZC9C0w0g4hTTaYHk0ClYT5rnHHdEPwyu+aVQe81VNY26IL3pAjwgcpw5
	 2epQP/hx0c9/Q+4ElmFQnCRTiqyXWcUKInC/+lyNVPSXYKOE8h43du5aASHorayIu6bdh
	 A1jZu8gB1rVHj4v4OohjYSHqNt2MuGwY3bqIpFdufuHWmy6rrfX4gsjRzIRrOUyK+FXEC
	 Zw8kFs52yYX/kg1VLiZdwkWxt0+Rqc6YuYjfQkMiaSxWeJdTS7eiFbdLSf91gtavd8yFj
	 Q2/+C6LDVeIrzhzSBpMbwTv9hY1nD71sPacgcpeaZHuW5TcBjDn4Y0spExz/bKoH9kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aTnmDAuk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C40606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C40606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aTnmDAuk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792677183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0aOdxxHIiJ2ooFokUBRIWQ1Gic9A+VvHO8Ew9COtEfw=;
	b=aTnmDAukOXp+XaOOup5IAtveR5aIsUPnqLY+/GWh3MqAVI/KkJwl2GF1xV6L97LFjDsA7B
	RFFCkh6hc4pm4+tMIEDVcb8aUvuZKEwTUw8JfEhTw+zHK6aNepDfoIQq5vclzMMvATAwR0
	Mlpd1RdpQK5Jcf/tvsTsXm6c7xmiORc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-TGMQZBYLM5us-7Nel6SCjw-1; Thu,
 22 Oct 2026 09:52:53 -0400
X-MC-Unique: TGMQZBYLM5us-7Nel6SCjw-1
X-Mimecast-MFC-AGG-ID: TGMQZBYLM5us-7Nel6SCjw_1792677171
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 543CF19560A6;
	Thu, 22 Oct 2026 13:52:51 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E1651800444;
	Thu, 22 Oct 2026 13:52:48 +0000 (UTC)
Date: Thu, 22 Oct 2026 15:52:46 +0200
From: Miroslav Lichvar <mlichvar@redhat.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>, Ryan Luu <rluu@amazon.com>,
	Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] timekeeping: Reduce magnitude of ntp_error
Message-ID: <atoVLqWfyJtCfci2@localhost>
References: <20261001202134.33929-1-dwmw2@infradead.org>
 <8431ae22ee7c7a786c93d8c0bbc85366f39291bd.camel@infradead.org>
 <66dde3d2-edbc-45ef-b6c2-2c35a822733c@enneenne.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66dde3d2-edbc-45ef-b6c2-2c35a822733c@enneenne.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Thu, Oct 22, 2026 at 11:05:18AM +0200, Rodolfo Giometti wrote:
> On 21/10/26 16:37, David Woodhouse wrote:
> > Ping? Patches 1-4 of this should be ready to merge now.
> >
> > So is number 5 as far as I'm concerned, but I'm happy to entertain
> > further discussion if anyone has an opinion they want to share.
> 
> Number 5 changes the timestamps PPS_FETCH returns to userspace, so I'd
> still like an explicit OK from its users, such as chrony and others,
> before it goes in.

I'm ok with it. As described, I don't think it's going to cause any
issues, especially for low-rate PPS, but I don't like much that the
clock is inconsistent with other sources of timestamps that the
application is getting. That can be addressed later.

For the PTP_SYS_OFFSET_EXTENDED ioctl, is there a possibility the
application could see an out-of-order system clock timestamp in the
list?

-- 
Miroslav Lichvar

