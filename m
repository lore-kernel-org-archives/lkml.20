Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977700;
	b=APesC9uD/rH6Ttxq38E9nuch5AbQpnGRCv8kqOY+D9PNSGCc4KskCPHhl9MUvNUTWvP7
	 wjaQsZFxXMXEdRBFD2g+5aB1/mdxxFbOwP/M/gEU+luBcaVxnurZYn2s3FPNem5cnasLn
	 F45TbNMBgEIp9a+mzkUQ+tPHm3oiHKRuRm9KQ9WAQhtPlp5COcozj3nPuACDRytpu32l2
	 BPn6xcRlTgeAb34FEYBLjCiGgeuEqRukNJpA2aTEWwLjW+CvfM9SObO9qthCcpUqXBOQX
	 3r8JSxAxqW24KqbIgxHopotOriVF4yDsfno/hhI923zPZvyr3IhJ3R7N6vU6FZiz5Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977700;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=3vp3q6lh6TXy5on50j0jpxtnhhR94Zm7KWhjqrQdFt4=;
	b=nk7ehtViDyu+SP134ix/vYXrJq8yeCX3Snfd+IetlCHHVSK2x8fTvFd6lcXZ7eC7Bzio
	 8aSr1kr4z+Bd3dsOWdtvpGUepQKy6DOl2tYd2osLzljqPGtG2VWqf2XYtGCKolO9ayz5Y
	 +913ABGIgMBq4aa5x/0VV9qa/yJROvr9ZO7T7tXP5flG+Y/bq1G2iX3icrlJexwIBOsoo
	 DvDtYwaLm93z7iD7xDcHolRhlqjIE/grsCRs204xBiVwIi3a3MH5UeCdx89x3fMQTkDB4
	 FSalQ1Ah37Dy41YvFhrXbBLJZO3NYZRQKBwL64Q0KIVZgMBihr8gmbl/Ors1eeVtotA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cp1OsbjF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=n8ufY3cU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E635606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E635606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cp1OsbjF;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=n8ufY3cU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793977699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3vp3q6lh6TXy5on50j0jpxtnhhR94Zm7KWhjqrQdFt4=;
	b=cp1OsbjF5nUm2XXzP1Yrf4p/Ht/ftqiop6GvjOOGl4yOTchounjZA1+Rgm1j0xnqwivPaA
	IRrczrSqU8P+SLIck1uIBD6HU/o5ZMVnHnN/VzAArz7//Cea7c4osHlz4tgEp2MaRYTTaz
	pYQUGp8oTtbLl96k7BNtzVNRP4P/A+E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-K7EuHIDLOju5bM5F7WImBw-1; Fri, 06 Nov 2026 10:08:16 -0500
X-MC-Unique: K7EuHIDLOju5bM5F7WImBw-1
X-Mimecast-MFC-AGG-ID: K7EuHIDLOju5bM5F7WImBw_1793977695
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4901562b819so820429f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793977695; x=1794582495; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vp3q6lh6TXy5on50j0jpxtnhhR94Zm7KWhjqrQdFt4=;
        b=n8ufY3cUDQpD7iDSD/RVDVONRIeOFwi+FYM3c1hK0KpkX4vEqP+n+CQtLi0HrO8Uy+
         ExULCAO83DS5QHtcRbad0LKvA/aAYXJkTlle8q4Ha+edNGnGe18RO3Eib6enV3HJPa2B
         jYa8MinYllp86cd9UAkd2puBur2iawLy5sALNx4+FZ7ydvfdOPnqxUTuI5Y6UhAlAb8L
         o8BspxKHKg25nsfWhOky96W7AOZ3QtMoNHhwqc4m/frALtGncQVmM77m7Cvekwbcbage
         /FP0whc9i0Y+jmmkE8csrHxI/0w/EyHpFvSpRaCbBHQ1miqph1pUki19D0vLWW7w9jD0
         1uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977695; x=1794582495;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vp3q6lh6TXy5on50j0jpxtnhhR94Zm7KWhjqrQdFt4=;
        b=hlkZ9IToSDq2kya8aG/tvASPJiV1hSHYnUS7CSDXn0Foy4azX3v7TbZldVlqw0J3t/
         TuYupnuJhYr/LO1cXL0w9hOyVmJI3aNCYKOpLEYMXQKODiRhUu+gUQkPBBqs/SsUGM27
         DNjz0+q+N5ZpN8ek9s+yNj21Xe6VKo7FsfLR5SOIDuwNgesWHgxDvR+kkumPlbAXfN/F
         8OdOIxuLf456XmXpJ+fsDESz2+Q4+Otd4KkmveiGxjW4KUNgCZRx3IDFBKZuGzVg0xEr
         J2en2hIk2pJ8bV4dkuuSNTKGZyzsZ0AVYGpaE46bpNgIBOYEfe5WHtiQzp6xmHN0WnpN
         yRIQ==
X-Forwarded-Encrypted: i=1; AL+hErHj/N/vsWHMsXdTpv/r44ild9Xu5+dK+LhMeYIJDK3mcoRG9v76h6Z1C0gX95pyF8YIF9B8zcHOObcIEAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GurJWzWxnY1jGNp4zcl4yR4r5LyLEe2nIXfRx8ig1zW/zSWnu
	bj7FC7ZpKmBa7ROK7x05g2eyTtxBd2wN4DrgenO1IlGT+mx2sVEOsvlzDvJG4o+WAYw5K7DgTK+
	UlK6ivIbJVsO30SR3v2RFFvhb8jIXZ8GnVhi0dV8j922Fv7sCo91ZtAP4wlwG5EmutQ==
X-Gm-Gg: AYBFou1SbfQyjoRgP8o6q4Le9eWK7SeQ/EqHxOUltVqAbz3t2VUiOU8VMeTEarUS+Ae
	vP5JIeJy91ISD/0AkclO5EnhA7qZXNEpN3ZzS20WCqb1u4Nb/mpSeHMQpXQjJeAkkLEgHpqrR86
	YH5vb9YW1QjKj6wmVjiXpItR1oCFP4BqLPGc60k5SxLF8qcXw3JnN5mH+45hWuDAE0TKkuAb1O0
	ScGnLsgmT99LAm7xpHKw3JaOqombK3du7dqWgWGqcEIO5478R6mO8yIqOBlDnTzI2Vc6D00/EFP
	2PqcwrgDtYs3a7eogBY8nVj6pOB+j6dsmNnJRW9LW/GOXkLsGi3ocpMqJXZqvA9IqyzhBVg0XAw
	b81J47Fz0Sszb8O/eya5wZQ1mdK5QYRnRrG8xk1uLTx5PXWKx/e9ybGBJm7h7mcg4OIy56lHrks
	+Rlb79ZWWwi5ViJT8=
X-Received: by 2002:a05:6000:1788:b0:48e:752b:9f90 with SMTP id ffacd0b85a97d-492772197c5mr5796946f8f.38.1793977695560;
        Fri, 06 Nov 2026 07:08:15 -0800 (PST)
X-Received: by 2002:a05:6000:1788:b0:48e:752b:9f90 with SMTP id ffacd0b85a97d-492772197c5mr5796888f8f.38.1793977695161;
        Fri, 06 Nov 2026 07:08:15 -0800 (PST)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723320csm3831907f8f.26.2026.11.06.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:08:14 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Manuel Andreas
 <manuel.andreas@tum.de>
Subject: Re: [PATCH v2 0/2] KVM: nVMX: eVMCS consistency check fixes
In-Reply-To: <20261105190733.3741959-1-seanjc@google.com>
References: <20261105190733.3741959-1-seanjc@google.com>
Date: Fri, 06 Nov 2026 16:08:13 +0100
Message-ID: <kuppkwihuaq.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> Fix two benign-for-real-guests bugs where KVM incorrectly performs eVMCS
> consistency checks on VMCS fields that are supposed to be ignored.
>
> v2: Properly guard the checks instead of simply deleting the WARN.
>
> v1: https://lore.kernel.org/all/f1f39118-2e1b-476b-9a84-ef7d56412bdc@tum.de
>

FWIW, makes sense to me so:

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

> Sean Christopherson (2):
>   KVM: nVMX: Do eVMCS consistency check on secondary controls iff
>     they're enable
>   KVM: nVMX: Do eVMCS consistency check on VMFUNC controls iff they're
>     enable
>
>  arch/x86/kvm/vmx/hyperv.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
>
> base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e

-- 
Vitaly

