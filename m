Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793403322;
	b=izASsT53htX0w21bbf/oxBWWP5b80NAv4jghEIGL+36a7qnPkVu+NilyDRX/6x//1n83
	 Jhl/QEsWGyW0e3yT1gS03HmEJzZVzuAWnCcK8aZjONQmM5FkQBecVpik7Rkg60aREhVOX
	 dvhJ/P+3xjk64ZXMXvPe9dBAg8keAXUFFVFqm0LN3unRhCVrNe5tmJz+LDZRUcLolG4Dr
	 v/RuNGQXWSOU2fU7n7JmWJoAK8TRc/wJnhiZ36pMBISMvygeIzCXacM2QrcykwR/ZqaOv
	 njly3WsVo/Hf7hGuPEXQ1EHI0jAddmYygkZ7hlBQsh3NzxrHsdhS4KcdGapbaNRwPLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793403322;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=SfD/0ciXQvPVPxjWs2gCYrpRzH726iFiL2lTheWGioM=;
	b=folh9C4b+hI6xFxgaBgrB79P/Euqx4ZnxRvLb/4HIZe6Ww+xmZvdtKooPkp5H8qdAcTc
	 Od5s8l+XnMwr5VXSYZG4DaZkOaAWz95XfbCRdAymzRR5c/rQd45yU1Q6ebMNYwKgDCBr0
	 1sM35hwTthvzaVsByIS9O1caU1pqo7tAG+SrmHmk0mNzgFbn8Z/BEsh9TT9vgJiheGGeT
	 7HFex/SFQirk5qqepK8z+1EyKtnp28FFpao1F0r3rn/v8uWf20qhTEj8pQlHoaNWGqHQM
	 iyXCU+IwSZ9kjFoESeu6Bf8VNeX2Q2ydGnyQqVlaLDakQiDK+3qI5ZKcdtsZHr+4WYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gTQnfIJ7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395CB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gTQnfIJ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793403321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SfD/0ciXQvPVPxjWs2gCYrpRzH726iFiL2lTheWGioM=;
	b=gTQnfIJ7bsVR1ybBbAZBVqpgaIhjZfakAkye4c4QiRqxZctt/CjT1RnjODcpbOD5RbPa+S
	LVKcwhzENwyDpjlEjeb+nIrtSvw6MM9nqNVjnK6ooagqfnDmD/hHim5hGgHtN3Loob68TG
	2kNU08992cAkDvqm0q6nennwcBAFto4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-OhQo79guOtSX8hkSTr3Skw-1; Fri,
 30 Oct 2026 19:35:19 -0400
X-MC-Unique: OhQo79guOtSX8hkSTr3Skw-1
X-Mimecast-MFC-AGG-ID: OhQo79guOtSX8hkSTr3Skw_1793403318
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD0AB1955F30;
	Fri, 30 Oct 2026 23:35:17 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 739E130001A4;
	Fri, 30 Oct 2026 23:35:16 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 31 Oct 2026 00:35:17 +0100 (CET)
Date: Sat, 31 Oct 2026 00:35:15 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
Message-ID: <auUps7Hy7W0SqWw3@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
 <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
 <auTDEy_vyMixVRTU@redhat.com>
 <1ad2ae74e3257578cac561f19af63ccb94fce85a.camel@perches.com>
 <auUPo66ISiR2gzmi@redhat.com>
 <e184b73da5229fa387074fce2d977994f6464f1e.camel@perches.com>
 <auUgX2kp9psrvQ6x@redhat.com>
 <9ba498189291b99fe18d3a8ac32722495fa3227d.camel@perches.com>
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
In-Reply-To: <9ba498189291b99fe18d3a8ac32722495fa3227d.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 10/30, Joe Perches wrote:
>
> On Fri, 2026-10-30 at 23:55 +0100, Oleg Nesterov wrote:
> > > >
> > > > But why? Why make get_maintainer.pl depend on yet another module?
> > > > FYI, on my Fedora 44
> > > >
> > 	$ perl -we 'use Module::Load::Conditional qw(check_install);'
> > 	Can't locate Module/Load/Conditional.pm in @INC (you may need to install the Module::Load::Conditional module) (@INC entries checked: /usr/local/lib64/perl5/5.42 /usr/local/share/perl5/5.42 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at -e line 1.
> > 	BEGIN failed--compilation aborted at -e line 1.
> > >
> > > Module::Load is a core perl module since 5.10 and
> > > I think you are using a broken version of a perl installation
> > And how do you think it is broken? my laptop runs the fresh Fedora 44.
>
> It doesn't include perl-core ;)

you can blame the Fedora maintainers, not me ;)

> > I used ./scripts/get_maintainer.pl many years, almost every day, and I never
> > needed to install the additional modules. Until ("get_maintainer: add --json
> > output mode")
>
> I think that was added in Linus' 7.2 in mid August and in -next since April

Yes, I hit this problem months ago, but didn't have time to send the fix.
So I had to have "git revert 09d8b39563e84fc245d642182715a7e0e024b0f2" in my
local trees until today.

> > It's not that we disagree... Worse, we can't understand each other :(
> > Perhaps is this my fault.
>
> I don't disagree with the concept of the patch.

Great, then perhaps you can ACK my trivial patch? Then we can discuss
the possible improvements.

> I think we understand each other fine, you just care less about the
> output error message.

Yes, it is true in that I don't really care about the output error message.

But then again. This error message can only happen if JSON::PP is not
installed, and my patch doesn't make it worse?

Oleg.

