Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972539;
	b=ev/Sub2goJD9y+ljv73vJZIbQ+nT9N5VqNIUb2Bi81NqBHgKYqiKLvc1+rvoUIYJGgfA
	 FaJEgVRq071XQN5juV/B6oHpo9L/ilBm+oNYwlsDYoVEvpA6/ela+aIqqc4xbhXd6zH+2
	 vfnsH8ZFss1eGM91ycVRPi2sqK6nio05g6q47eY6l+NjZOTRjD5cHD8nV3RtXMfexKvyd
	 ArEIauhfuXZ7P3WkjT7BgZS/2817E+K08RX5FJt8tCTPlg3IXvHEAyFS1vLFKOA8n+cLO
	 gzJWdggmobMpHWQt3AJm6H2enbVgJHucPIprbwYCPGNfjjCH573V4zQ3QsHwyrYtimA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972539;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=M2OtBz6UMPgdGIuaycWDBNbfaEpTV0kfhUa+atvwSh8=;
	b=zTwAN1b0o5yFR61GdbUE7WuXb96GMGh0WGgmTaMGIiIOz2AblFLlzS5e1ALjYN/eymIm
	 3E7WwwuLJjJolFE9Bp7/PzY5XugMGGhxPhVEvY5Go+Wd2zU6gZ6XIG8BVUTc5dOThldcJ
	 8wyqdf2xb3iXwh6Ju9K4N5du6I8OafpmjMGs88ZjHWV7/6chAdMfcgBJEsMKjoNOEYpWg
	 DPtkzb3ar2ZXFLYaQYLT7Wjkxfhoe6WoK9IdZ3eZYP09NP/4+RWhjW2g2Wx3fN/yqVwsx
	 QSmvs+q8+ZMlgOw9a3z8Ni/yMPjGa8lvSpV1Ox9xzQu3ZlGHrRQOjR9lbKcgm0lgL1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JNAQxlhn;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nhnolO2m;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51060606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51060606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JNAQxlhn;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nhnolO2m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793972538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2OtBz6UMPgdGIuaycWDBNbfaEpTV0kfhUa+atvwSh8=;
	b=JNAQxlhnXixGlRXjLedQdGG+uFiZGIPcK3VX9R4fgOzVolVAVPDEqz6/pQI2+aF9q6/jth
	VqOaYHtM04ryJL18o7I4Ux4jQzt57Q7LAF8Ekl1YGalqFQ+yOymKVZRh1iUBiOt2HnRakB
	meCrTgmKtG0vRW+/LCe9O3gZkQr6TQ4=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-5_tYCWWkP4inJvjbJBcatg-1; Fri, 06 Nov 2026 08:42:15 -0500
X-MC-Unique: 5_tYCWWkP4inJvjbJBcatg-1
X-Mimecast-MFC-AGG-ID: 5_tYCWWkP4inJvjbJBcatg_1793972535
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6799288480dso954169d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793972535; x=1794577335; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M2OtBz6UMPgdGIuaycWDBNbfaEpTV0kfhUa+atvwSh8=;
        b=nhnolO2mnG/dIXW1NWmgUqxAJwG48k9brC0aSkEsA0aR6IYjYD4/yTbM8w7IthbqhT
         aZ5aq/Q9iP0a7n66LpZuOx4wlsdowHeKYFr+NnM/1uzrBZdXJ44gyOmeuE2I5I8ePAID
         tTvrIY/emDSOvBZwYwobHWJahI409afdv240Z3ep5xnIk7bKsofSXF39175nLGW1zG3B
         y3UVmn44I8zSz1cHQyFk+lrY2QQzLNLi/oYa/CH8sOJ/IAQIf/iTKAeFYlRwlbPOirZu
         qqIE3l99hn4TFn6KSoX7SkiSj1Kzxy8NkaLq23hzAg2juq4Y9F8hxlOu2qP4STSJM+bX
         ugog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972535; x=1794577335;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2OtBz6UMPgdGIuaycWDBNbfaEpTV0kfhUa+atvwSh8=;
        b=1zUuNFfs8/HCtIlqitO+plhMoWHA92iwz2L32qrOjGSjvlFnxltKfIGZRDqnHXO2wp
         K+h/hNXqKQ4BTN/u9L42Oew7q/xERRzWn/XdX6X/7gzlr4syglBXhPpJcKsVFeZvn63V
         SZBVwGvAXaXvfq9PghbEFIvcK2n/3VCJM5pGJlCyiz6MmUMynet4fnqqaPmoCOhqXpkC
         8hDy9sZjLLp6O+UVpJLVryxEODqH7oGWfJDW4c0c0scVHEdo3qxfZUumzDPzYaRVUBaM
         VWQf93diOej5PzvcyM8vRNqN8wC3LO6RqbmmXX091MUrMCPDAsjfYH5WFVj2FUeiLsKt
         FAyA==
X-Forwarded-Encrypted: i=1; AL+hErH/z3wewNiWwMnn1zn3AcHl3xaF8rk3VVlT4etIOdv8YC6ElhOKYV0QyMrSkuSaEHP+5JDj9BhvsmDXpp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j+79v+ADEmQK3kiclBjkyeRzmNupUfhmK5BEeszzfalA3kDmL
	9B1j5xFi9OCABM2SbmMsOA7HXHhKdL3xOfM3yYfTxFm1sufLk5I2CfIoFW5RsXMZ91ZqasMMx66
	E7TMSRdy0TVqrPBZ7fAYiwbxyrz6C2aoflRWeKRInGrAd74HK+HE1k8Eu+SPoUPpYkw==
X-Gm-Gg: AYBFou1pTtR6HodnPmEOARsO7GsbW2tZPKV4zJfLTZSQwS8BnRbfutPsgxR5e43kQgN
	gGXRYsCnTQZiSdvn/VbQlBGzDCmzze8CGFGujNYBp8p8VW0jpeV6v6GQ2kXOTs1jiH7sx6hLKaY
	kRRQUtKC8B9ty8G7ogv7fM52ARGB2wwCSV5z7XUyqDvxWJo2ktgJX67ESJucQBNJnNFHPcbjNqE
	/hyHtDM015VILHCLskMtBg28HabRuVLgK21e1luv4LO6T78G8jlVA92Rg7qq4z2nlW1MLrx43wk
	4lso8C77jiM2+7TF2QV5l3TXcI0WfZ831iCTqEDB1+davNLF352lwmuQ8kpfq+qgumy370NvYjU
	NZnOmKj9jKRIrUrEQb0e2lpv4MaV7QquT/UtHdtQIKCq4sYxUvhxyHGKEQyd743kEzk7JVTSmx4
	AJfMRaFw4SPL6tDw6EF3q+Mtw9NvIlJIIOj16uAhn7pDcsQwG602NgqRd1xF9vh0V4acCPvJM=
X-Received: by 2002:a05:690e:4385:b0:675:3ec2:25e3 with SMTP id 956f58d0204a3-67c1456dd29mr910183d50.50.1793972535235;
        Fri, 06 Nov 2026 05:42:15 -0800 (PST)
X-Received: by 2002:a05:690e:4385:b0:675:3ec2:25e3 with SMTP id 956f58d0204a3-67c1456dd29mr910167d50.50.1793972534598;
        Fri, 06 Nov 2026 05:42:14 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135ada39sm1930977d50.16.2026.11.06.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:42:13 -0800 (PST)
Message-ID: <e89f5d5656ef983e21e27a8557ddd178e108295d.camel@redhat.com>
Subject: Re: [PATCH 5/5] scsi: st: factor out the end-of-medium completion
 test
From: Laurence Oberman <loberman@redhat.com>
To: shao.mingyin@zte.com.cn, bvanassche@acm.org, mkp@kernel.org, 
	linux-scsi@vger.kernel.org
Cc: James.Bottomley@HansenPartnership.com, alim.akhtar@samsung.com, 
	beanhuo@micron.com, stanleyjhu@google.com, jmeneghi@redhat.com, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 08:42:12 -0500
In-Reply-To: <20261106154249447T0sEhKHXg8J8MF0Fo1Op0@zte.com.cn>
References: 
	20261105193339565ydLHLai73bbBko0TtjrtV@zte.com.cn,1023acf9-999f-4e42-8dff-e84a69c7e259@acm.org <20261106154249447T0sEhKHXg8J8MF0Fo1Op0@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 15:42 +0800, shao.mingyin@zte.com.cn wrote:
> On 11/5/26 09:21, Bart Van Assche wrote:
> > The first occurrence is in st_flush_write_buffer(). That function
> > submits a synchronous WRITE(6) command and has nothing to do with
> > write-behind. Additionally, I count five conditions instead of six.
> > Please fix the patch description.
>=20
> You are right on both counts.=C2=A0 I will describe it as the synchronous
> WRITE(6) issued by st_flush_write_buffer() and drop the condition
> count.
>=20
> > Please declare the argument const and please choose a more
> > descriptive
> > name, e.g. st_all_written_at_eom(). The "All written at EOM early
> > warning" comment from st_flush_write_buffer() could be moved above
> > this
> > function.
>=20
> Will do: const struct st_cmdstatus *cmdstatp,
> st_all_written_at_eom(), and
> the comment moved above the helper.=C2=A0 v2 will follow.
>=20
> Thanks,
> Shao

Hi,

Thanks for the patch.

The refactor looks correct, but I don't think it buys enough to justify
touching this code. The EOM handling in st is mature and subtle around
buffered writes and residuals, and having the condition inline at each
call site, with its comment, makes it clear what "success at EOM" means
in that context. A helper named st_eom_ok() hides that.

Unless this is a prerequisite for a functional fix, I'd prefer to leave
it as is.

NAK for now.

Regards,
Laurence

