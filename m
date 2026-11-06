Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954701;
	b=nPNTtm921v1GvfILxKnhhrMdq6eHWOxkatHU9TZGOeDGLWcYyUUk+EJkaYke4mE+AG1Z
	 ghfop8MgCZ6D5hbUTRfJblBnHAlW5DACMScu6T3ebXK+u/+gZKERpqOv5uooiUo5xI7cd
	 /ofqFM3fL8SWvwikgR+UZK0i8Kj7NDDZBBVJPWZB1NxX8qg20JJbhPw1hv7KEDxQd/m70
	 yKXM9g4UoD7EDgK2S888RZTJBvNoVhALjNgVvoXKewkcwg/vgihxFXlHNOgWAV+mb8SsE
	 mYp0sHJREW5s9i7dCyBw21nAaEFzCp6h7vye+XusYj3f9XEUdKyJETLexWUCg4P9UQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954701;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=D12luyMh0xjyZqt4l9+q8OVPX7YE7q5qQw5MibUUHvU=;
	b=i2HK/QwBRJSh/VL8558XVR5Lf+T6fZZqWJFJU/TJ5WGl07jn0hj7/rXvf5dYWB72X5p4
	 V/YoZUnhZMg8jmPxTGJYdTFEZ9G17RS+lcQxWLf3ndUqEAgLVoEcu4vcOZ7n6gakOuJjP
	 mAjNKN45ZOHyjOgDFWKRkv8GkauuSmqAXS83ogv8RHL+Bz37ravMkGUY/KinbjUCy6HEK
	 qc6ZT+xLIG2LtcLYVtB7zsCnrcAFloRGzwg0YEOViuEdbQgNKOdx/g9jsVV8AFVs9HNPh
	 jY3ByE4QaRdmA1s59Wo1+zLmOIUqvjilv7PdZlfrx2maONLGtE0ir4fE7P2Tqkf0BWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=dJR1NhrH;
	arc=none smtp.remote-ip=62.149.156.132
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E02606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E02606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=dJR1NhrH
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id PFZ4xiX0VV5J9PFZ4xlBn2; Fri, 06 Nov 2026 09:44:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1793954691; bh=5fOtySEKPV/vTWiWRb8Q77DYJaeBTDOyVSUx8cJJIY0=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=dJR1NhrHW4K2K33fBAL8Sv3uK11M22qtbTXgC4Sppit4Rp9ZKI+HY3uWBknjaPK0B
	 g1HZFYnnu1BpoHrFJiFswQslYjSLRAqqcVu/T8RvJReKWbfQO7x8Bb+hKTK1hFdeiw
	 /S8IndBI/4QMq1XbtBrYoXMq0x7sX6j/yoWrQqPSCcGQIHJFaUo/a0yXRLZufk0ie0
	 x/FmB/bkdASgyjpfYb65JZlpUepijTW01lUNWhMq50lwpPDwYOWW1Wfbs6PsBWfa3o
	 fbm6OYJCSsKAPdUKg890DgEgiiXWKlIipw7r9L4Ils0I9Zn9jiBlxumib3xJkugvQI
	 t1H+g0vmKuRVQ==
Message-ID: <fd554169-8870-40d9-83a7-fdcd838aaa8e@enneenne.com>
Date: Fri, 6 Nov 2026 09:44:50 +0100
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
Subject: Re: [PATCH v2 0/6] timekeeping: Reduce magnitude of ntp_error
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, Jie Wang <jie.wang@intel.com>,
 Yuan Wang <yuan1.wang@intel.com>, Ryan Luu <rluu@amazon.com>,
 Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org,
 nh-open-source@amazon.com
References: <20261106030856.2538039-1-dwmw2@infradead.org>
 <a5c57e49001c9777d8b6fdce71ffa743004908c9.camel@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <a5c57e49001c9777d8b6fdce71ffa743004908c9.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPXReln/1Cx8bR7aujhWNKH8YbCwOOwr60Fo2y6me5huGOtvbTwtDm0AZptPgOlJAzgOx2g8BOm0VAMMVA0frOB2ozLB2uSUktTkZllJD24rXusDTEvh
 UuhbYu0eHWmM4J6mIyehxWr9I28bsfYgey37FUQL4j7D4Ve5Oty0ijTOwnT3x2AB00sYMbvvhfc45/E8X2OhX8rjjzv0bbl9HkbrdoHW83lvt5eQi444PCOH
 pcekpJeo3otHQb9BpNAiUNHoCVtd7LHBalEeuegm142LfethXh/jRGilChOH0zttKS0Xe9jzk17rcZOzBE/Bq0NE7kYQJbeA/5uRO+0KplsRy7iBHWpCopQA
 abXSMYY1X//Hf/4AO9NbTCP4Vs5akw1K/3rXS+IbwgotsloBFAkJ6iT9cmVKMg0QS105CkOmQ1HrTz7tVE+d4Kn5E23zH8NpiEF1IGo7mkB5TKufto/V+KLG
 wcRnowO7welO1Q9I5MPKIZTuXEimGHG3XDLOqKjeKwpOi9se9jR5R525koVSiSqc0lEJel6xS6Zu1A47

On 06/11/2026 04:24, David Woodhouse wrote:
> I think I reordered and reworded things as agreed with Rodolfo; please
> shout if I screwed something up. What's sitting behind this in
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/ffclock
> is the timekeeping reference stuff for importing/exporting vmclock, and
> preserving timekeeping across KHO:

No, the 5/6 and 6/6 split is what we agreed, thanks. On 6/6 I'm still
missing the ntpd side, see my reply there.

> 
> The !NO_HZ_COMMON dependency can sit around for a little while longer
> until the series above is actually applied, and it can note the
> actually commit ID of its dependencies (which I think we agreed is just
> patches 1 & 2 of the series above). I'll probably round it up with the
> other PPS stuff I haven't quite got publishable yet, improving the
> filtering and then working on counter-based capture and UAPI.

AFAIK we agreed on patches 1-4: the tickless run you did for me
(rodolfo-14-tickless-1hz) had all four applied. If 1 and 2 alone are
enough, could you put numbers for that in the commit message too?

And for the UAPI, an RFC first please. :-)

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
