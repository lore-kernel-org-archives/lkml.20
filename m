Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731797;
	b=p+R98Mg53og0u35t0sbpdPnSgdMfQa96Tz08FF70LAMv1cKPnoYX3unEfofiDUl8bM6h
	 RlMKrRgVx9dhaCBZzCoOx6H/ZceoVzG6zFxEvf3Ovpv8MIvg4d8yOVBb1wZM0W/q/FbmZ
	 9XtS1zWL4Y/QVpLuYK3LjUAGHD993oCjT5wKu1KOKJ/lXM7O2TyyVzKxgPWV/afHyHiVv
	 kfgAwgQcCqBBPnfDXuZzXX8/VsgwNKHv6v5HG4zI8MLWfhqeyeFd/gBtkyZH934exhC73
	 uUNjDXiKPdkEyuEpTPQ04DxmYElEk8wLYk8JWtt+cnw/yYmLQVJYGU8NiCEeyi9x5Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731797;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qmufM6raPP/JE8IC4efMBvY+lfo59L1JtLhgHRWcfbw=;
	b=YnqcH0/i0KVwJ7CiduItTltwL2K1+/+lMYPEMFcAUxv8MSvsZe5iKAPxIw8MCzR+fNXv
	 z2UQycWG91M9d8amDNHD+EWe4qdJ6OmwAXK8dzFBGEAA5K6ju3pKvU/idgLWMFfbcn7/o
	 3usCbsAmRc2goWqKf1n8jT54mAjwd9bAgfItSoNNLqwv7LT3QGY4e0jJ4+I2moJtGCqSf
	 jovuSOYrhUrjJ19tZMNrglOmjinemZUzp7RoQy7SCaGt4AZe5LLt91Dvb3JBR1z5O4sWP
	 KJFewhVdZ9/rBQ5pZ/OrdMSBcMspABb4ney1IvFi3B5sstglqT+ij6VgdLUtMol5Sig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=qA0qT1vF;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=uCAaNScI;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2870606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2870606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=qA0qT1vF;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=uCAaNScI
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793731777; bh=qmufM6raPP/JE8IC4efMBvY
	+lfo59L1JtLhgHRWcfbw=; b=qA0qT1vFUlfZf/YOCMyEkddy9ky7IotHriBxqGBRZQKEP1+KGZ
	qRQFA61k9s/M1Zqc0tQzOvF1GttpIzgYs6N15Bs84B+QSkMydvEE4OW1MhLPsJ2lZ1VdloJ/OZ/
	0l7M0whulqhZHRhCohl48PuSd8Wc2DxgvN3wCsX574MzlHnl+FdPI8OfBQ9A32DDeUrZdqUU2rV
	Vg6mwJyLJ0T/KaF8SbzHVjLDimXFjuXZOGzEZNaJaHHviNrqzR8yixKgVcc485DajShqEBODqCG
	eWR88KBEmIDrDuwwaozFdRBoMHB7t85w3C8YyNZJ7vMacvB8zX2E0+ErupLjI+kJeOA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793731777; bh=qmufM6raPP/JE8IC4efMBvY
	+lfo59L1JtLhgHRWcfbw=; b=uCAaNScIJcrmC96mfiWOfQgZjvRYhQi7ALsdRMmBZJDbghnr0u
	C1UMye/aXKX5Csuira+RifYL0dp4Xcm4ehCA==;
Date: Tue, 03 Nov 2026 18:49:35 +0000
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Jan Engelhardt <ej@inai.de>
CC: David Laight <david.laight.linux@gmail.com>, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
In-Reply-To: <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop> <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr> <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop> <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr> <20261102163448.3956dde3@pumpkin> <s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr> <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
Message-ID: <E2C3F6AB-A35A-40CC-A11A-235AED362FE1@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 3 November 2026 18:19:23 GMT, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>On Tue, Nov 03, 2026 at 03:03:47AM +0100, Jan Engelhardt wrote:
>> 
>> On Monday 2026-11-02 17:34, David Laight wrote:
>> >> 
>> >> I can get gcc-17.0.0-20261102 with no further command line options
>> >> to turn `atomic_compare_exchange_strong`+uint16 into some object code
>> >> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't
>> >> tried xtensa or the others.
>> >> Thus, is the patch really needed?
>> >
>> >Won't that need a big jump in the minimum supported compiler version?
>> 
>> 12.0.0-20210420 behaves the same. I just chose 17 because that was
>> convenient to try first.
>
>Are you also advocating ditching the single-byte cmpxchg() emulation?
>If the compiler really can handle this emulation for all sizes on all
>supported compilers on all affected architectures, that is actually not
>at all an unattractive approach.

Well that would be "not long lasting effort" 2024-2026... Hmm..

>
>							Thanx, Paul

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
