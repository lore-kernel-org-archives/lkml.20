Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427672;
	b=Q2wj/Qe0YAujrMsz0HM0ldhemA73Fhptgmzv/aeTHHyypGQAxFwE1Cos5kFDZaQaLEJf
	 7drNWhClcnm/7Kaj7+4H1e9zIOo6iroTTSSB5AFZtoXeg9hJ9wV8IQjcaq8GD3oVoTosU
	 pKLiGi+TnNmMpZFl19ubFrNhIYqUatm7uxSTHEP1dnu0+BCf6Hl+wjODW2S6LxwCeFyBg
	 LLWw79867e+Oh1esyti/6yr8WhsMarhoSN+7sXi9P314V5lDlpOPuUfMk2RQOdpImiF/R
	 zc5igJdH6cj0VvzR670v0wX4H04Z82aWP+5ks6/UPeEbQxQboF6YwsA4QEASe0gzacg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=5EMCD1rtKeIzP4pmI2Kq0aEOHvbQvIVCDlgtYyGqRvY=;
	b=BsBTPoLvmL0JC1Cy/wTBnK7NuhQw+ujob2dlfYRnTEkAEWBNKmiDJAcWU9/N6muymeiv
	 uXWQkXvI9dP5zimxrPJmeTdEy0dt/nqw8kpmkRPpg0iVVbPp70MfS85UTmgmLqoF96Z44
	 Mv6bSe2OX9q5oJg9RTf0Rj3zJHHXW6qiz80lr77D+HXbiEW9Nc3ogGqEcYCgoG70c3GiJ
	 emYdO10mxG/ahPPD7eGWt6ow19u51Py/wY5ZQ/CZKFUWci4TXRtYmZvCr/vL+lldSrOfD
	 Zck5562I1PcOhZ/ekTUmd1AAxFPf0eq2i4l5TbrzRadF3m7VmZ3glbv6voolPeFKpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ib994pDE;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53E4606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ib994pDE
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1358206a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794427671; x=1795032471; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5EMCD1rtKeIzP4pmI2Kq0aEOHvbQvIVCDlgtYyGqRvY=;
        b=Ib994pDE2Q7BaLhj22bPoqfOJhpjDDRFZvrAJjF7ehEjzTVOj9cWTjN5eyCaRLx9Do
         uaS2NF2dBOoNhOHaCI9cq6B0c4DpZT44Hwg4BXixTHzx/hoKZRKbUk2vfdj9GyW29j7f
         U4BAO1G3gUuj8dyUyzwVofzhK55MVd3KDdmWW0CyJi7QEjT+RRSF0k5VKFhX7ObI7VYH
         ZihBiev0hpknq2qZjGUOhL6B6WeIU89r6TxdMuT5YsT29F1WLV/aGEEzx20tAeRGPyaL
         zxhqro5AjHVmfqcVxw1iU2Dd3YE+92tQUea9yMj1bQgdPsP8FxxF9dTN/JDZEZO6Q3mi
         hP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427671; x=1795032471;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EMCD1rtKeIzP4pmI2Kq0aEOHvbQvIVCDlgtYyGqRvY=;
        b=K5WjRw7T0jlcnl4stMghWeq79OgQMWNbtLEjXXqnx6GzIp2qJsKC+spIH3TbH8COwP
         CWAiMFKf5olSKaBNrKeruFFTbGkeX2K213ui7O5g9NCemF6zF/318EvpXdyhmdUqGLoW
         4IQaCuazcRB8CAjTFBQmuCiCLEOCSnaWDc4nedHTZXT5lruSjOzhofpLiJGjsYe8AMiX
         epevK6vzLOrVbq9FtyZBfbQ78vE6tUQQaNuu6w+41M9ws9cD0RoKCyxx6nHtDDusfmQg
         5rC1xHiLeNt3DO936qkWaz6hAlefkQnM+R6eb7R3fij6uKZCahoBsLp2hcUCb8LfBlhE
         FCdg==
X-Forwarded-Encrypted: i=1; AL+hErFQR5WkcP9N8j2hsu2ebhHvhNOgwnwluybSisrM4S8o8wxkx9mq7Nkjrex90RXcSbLWDdCRv3DmVwva3yE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zbKHdYW973iep9jxP43TTVr4T/0a1sdI3/6vVr5jgKzGdCLkv
	6zu1cQVK1MPsOTNRjEtxsJ9RZtbRcIHtuoRvxAjh/ErFmbWKHAtEjEps4wIO7nhQyYd6X+j4+hZ
	geHmhMA==
X-Gm-Gg: AYBFou236jui3zdzM0zU4GaaEV5hpdr2IMMyP1XRKMe3lIwifxJMMyEPYwat1FAjiv3
	aH89uRblVws+uUedVnwt42jySvtdfcyzlzJ8a+OE5nffYHnvrg4FFP4vg/7UwmZmr/gHl5jt/Az
	sQDh++ENIsqB7uQa96QD9uSMyXOInAYn3vyCRa7T274Agb+bSMF6silogT+RI2DmfLTHKx6d1y4
	4MCJd+4YnFCBoi+ytCTZNtXuifW0UdQ/n/dNJpUqt5wBk21Ex117KLCch7Zczx0qD6agCXe0Uwc
	o6hRXyMPo+KnulyNJJw7jkBzeqj/9l8ZA/uXaPUkzvCl5LJwNJre1VyoVQQnesDjAr5ZPEqalgu
	Ou0Mp42xHYhdkINDweb9w7la5etSmEOoQWEkkN3ldgGg9NKPDX84H9VuDWr2VPxrY5Kdgf+v5c9
	IDYBAVG6Xaa8C8tC3yrQX39bxaaS8cWh2r9Vk3UxV7s+coKucfamlNnNsRkVpkXMUIjeQvCkbhN
	v3eyK2mUtv2Pu7FISPIITh0P29GCb9K1AiHRWTGdy3lHntZ5LOf3imlJTfzotC68njXHvt8udXO
	F7edaUSfh2BJg2qBtlr7msFkA/T4ugClvpBileemijg/Q6SY398rD5ofqpbP54lW
X-Received: by 2002:a17:90b:5101:b0:3b1:64d3:f308 with SMTP id 98e67ed59e1d1-3b182f8511amr3538560a91.43.1794427669947;
        Wed, 11 Nov 2026 12:07:49 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm691230a91.12.2026.11.11.12.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 12:07:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 12:07:48 -0800
Message-Id: <DMSNIQJ9G6P3.2L2X6PDV6QBGA@google.com>
Cc: <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <stable@vger.kernel.org>, "Abhishek
 Sahu" <abhsahu@nvidia.com>, "Raghavendra Rao Ananta" <rananta@google.com>,
 "Shuah Khan" <shuah@kernel.org>
Subject: Re: [PATCH 4/5] vfio: selftests: Add sysfs_kernel_warn_count_get()
From: "David Matlack" <dmatlack@google.com>
To: "Alex Williamson" <alex@shazbot.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261029203324.1637772-1-dmatlack@google.com>
 <20261029203324.1637772-5-dmatlack@google.com>
 <20261110103434.48709eba@shazbot.org>
In-Reply-To: <20261110103434.48709eba@shazbot.org>

On Tue Nov 10, 2026 at 9:34 AM PST, Alex Williamson wrote:
> On Thu, 29 Oct 2026 20:33:23 +0000
> David Matlack <dmatlack@google.com> wrote:
>
>> Add a helper to read /sys/kernel/warn_count, which counts the number of
>> warnings (e.g. WARN(), KASAN, and UBSAN reports) the kernel has
>> encountered since boot. Return a negative value if the file does not
>> exist, e.g. on kernels that predate it.
>>=20
>> Factor the code to read an integer from a sysfs file out of
>> sysfs_val_get_int() so that it can be shared by both helpers.
>>=20
>> This will be used in a subsequent commit to detect kernel warnings
>> triggered by tests.
>>=20
>> Signed-off-by: David Matlack <dmatlack@google.com>
>> ---
>>  .../vfio/lib/include/libvfio/sysfs.h          |  7 +++++++
>>  tools/testing/selftests/vfio/lib/sysfs.c      | 19 +++++++++++++++----
>>  2 files changed, 22 insertions(+), 4 deletions(-)
>
> I have a concern with this approach.  I run selftests in parallel as
> much as possible, using multiple devices, each targeted at specific
> tests, with other functional and performance tests running
> concurrently.  When wiring this into my harness, I initially saw a
> failure, but can't reproduce and have no log from the original event.
>
> I've updated my local CI to keep a console log so that I might have a
> chance of chasing the next instance, but I don't much like the fact
> that any warning occurring concurrently with this test can trigger a
> failure and the test doesn't provide anything to go on in the test logs
> themselves.  Thanks,

Thanks for trying this out and the report.

What do you think about keeping warn_count to detect warnings, but also
reading /dev/kmsg so the failure details are captured?

 - In setup, record warn_count and open /dev/kmsg and seek to the end.

 - In teardown, if warn_count changed, read the new /dev/kmsg records
   and print the kernel warning reports (WARNING:, BUG:, KASAN, UBSAN,
   etc.), including their call traces, into the test log before
   failing.

That way, if the check fails, the test log would show exactly what
fired and you could tell right away whether it came from VFIO or from
something else running concurrently.

To avoid breaking setups like yours that run lots of tests in
parallel, we could also make failing on warnings opt-in via an
environment variable, so by default the test only logs the reports.

Alternatively we could just say warn checking should be up to the user.
