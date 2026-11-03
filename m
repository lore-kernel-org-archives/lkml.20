Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716298;
	b=nC8K54y4fQrs07Opdz9qSBBe1vZqdokj+AayHXo6n0kO30wLLZFG7KZzVzmSX5dFp7Sb
	 qcIInECNkx6diSPAACLDZ3Lpo6gyKDZ+ulSUGw0S5LRmpB+kf/+JSbgk8Tk9wnHasFWNv
	 D42Fu3/22FWAtfDUHeXxtOb3DXUvH6qegWiNO61GcCLclzXILMBc1NTMYIiBlLd5vUFPl
	 x0caU7pV6VaD71TQVYbM7MBAnPDldPnxfGBmg0qtOUBn4A0KWGeRNCZQeVQuMZH4N2Fei
	 Dt+Bbyx1TiHfzEVSAtYgr9mhcZtRJrlqtt/0Ts+9IWQPeLcZLNr4l5oG3MfUtjqPvDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=hPPW6gsIkZazXoljHsP3T+oDXyldHk382XBY2Kbrr+0=;
	b=aZOwh4mcK/PEbd9adjCxFbz1T+p2fbSK5yFMW09anbstBcZ8u7UIA38S/jM09c2W2A/d
	 q/f4STktF2Yz/Ah4IT4wLyJj3phCdTFIBvefo8EvmSBh7JHXkmSFWvfDmw71w4llyTbbr
	 Q/rP9w5ZDy3Ujggs91ylr8XiGZ3xAnRNDJ5Q6UtZ4trka8zY3NDM0q9dOLae1DU9zegCg
	 wkYRiRN/sNu7uEyYSqGwM+tH2nbIF6G6plCkxLgaTxOSINBFMcNB2+8FSsqK6NpfzWZIc
	 eyo6bv5wwD0o4Bpx4WKs2Hja81qWo0yIfsWrsQVXs7ewKqlKduuESsi4rvyBVqaa/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=acBOIPEd;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAAC60A261E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAAC60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=acBOIPEd
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4165766c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716297; x=1794321097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPPW6gsIkZazXoljHsP3T+oDXyldHk382XBY2Kbrr+0=;
        b=acBOIPEd4MpcNLQs3XSsuc401B43jfRZum3MQDPezPNaUfXqPRk0RQyylj42AsGdVM
         8GcuBcD05N4B2D1lPOMoyUtzLlz6fO3SKLVVRocEh1PABFoPcC6NN7OGrbraGdyCyZBi
         RzL/QoeCdgltMReYAaDeMiFuVDv8K7M0dZIXkQY9ZokmrWutGzCZwSgFBXPdpc7KZWj9
         aKkyU9f4kjP2uWpMldAbjjO5ya7eOfTMdVmSoRYgU8QcoMRCOdoCAbN8Brfj+ucDg8PR
         Aab7BGngrr3izfTbxqAtaC242uOySxdtGlBD/HFzb+cJteHzf8BfzVfGCRyUIB42/F+R
         zstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716297; x=1794321097;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPPW6gsIkZazXoljHsP3T+oDXyldHk382XBY2Kbrr+0=;
        b=Zw3X8ITQAeGn3BwTDBZszfqOWPMnQi6rsBuqnefR1dWTsJ/ENO+boCsv1RvqJYceCX
         4MDBd1lSbcu3hlSHvV1hD5gmNvgclVNqu1Z37mM+Bj2aQCbwAMNj15wPVf6f5l6fJOTx
         wnjPnlMjXK9k5NZYeysVDU6rGz77joyjKbkrUdCKFeuMx09zjBDCH7NBQsl1H+JorztZ
         VZvpDtEU8ePAmbZPurIxP4n4wVu+pL80hKi4lysaY9uFyT9zH4xBCta034W81onx3Rh5
         8TheYE5tOZdjflqBOMJaIPDDIreX1b5VPvlmrN4QZ9m2jPdD2Kr1sPcA22Od6yQpPsMU
         c/JA==
X-Forwarded-Encrypted: i=1; AKwUvBz1mdld2VhVlbqoXAs2xkl/8SXA0dzAlWbc0X2qtNiDnMFZZjqLF8/LTTAKUxD0i5DjdwdN955YufwDAc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uef11WTkvUYIUiwhV+tFhziqyaOH2DyNfpL/xjIaSn+cm0frW
	R8m+QtByAJW2lWhmu+nG2PAe6azJlzBPqTQfZE6jn6JITv2M7+C2dUFUOMYk+sD3Tjc=
X-Gm-Gg: AYBFou0wjHPxDfgNXqwuHicbVEsNqKoaazvtyXUMj5EobXe1IzeKVI30+UHDxoboakV
	2TAPpRiDVqx3ki3oxvcGfwFEa9BOAAvTtpzuFrZ45XY+KXO5WseC/diruV28VSbuo7jQjeSVxIf
	oocHLNZs22oqtA18Kbqu8a87wX7RU/H0kxjD/avCQ/eShGCFq/AEte2M0syQEIE2bkyPB88VmXk
	soWyYps+IqJW1YeaH35wzw+aGUgKaD2HI43fRJcjwXFqDRCTfNzXlERB/uG0kz+sAiGGhgoXEHC
	I6Riu9PHNxlUMIYTBNqqSHRhB5CU+pSs3zyWeT4FRxfZfUqJnh6CT56Z+OR6IzQ38nxZyNhCaUi
	SMZeJ4QqaFP0y7/rN16y1SPflAHYiCaE6B3D9pfTBfSW8BZjoD/NDMKDvo7796T7RibnGXmJ9gN
	wiLv++KPI7i0MPIMReEkIvtCEZEkczkyLuwBnuqcY9wtFkxjq0trBdc9WG4+spjlkkTnpc8hIqm
	KJB5Gsz3CBU5TEVFK7gLNYg9xawVsPZuSK/w1GfEjTkbyJIE9j4J2DN9BczzIro1OC6Yk9fubUz
	pvxreMj4G2KKi01jbRvjcWNLCXiKsb6XRUT2MzlLEUKoRWL49E36klHXLxgXWa5FMMc5D4c5Fnc
	RO9DzqmmcUb6I
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr17688608c88.7.1793716297254;
        Tue, 03 Nov 2026 06:31:37 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:36 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Shang En Sim <sim@shangen.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20261030050319.1448530-1-sim@shangen.org>
References: <20261030050319.1448530-1-sim@shangen.org>
Subject: Re: [PATCH 0/2] io_uring/cancel: cancel all poll matches in one
 pass
Message-Id: <179371629644.3691261.15458912717105276248.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:36 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 30 Oct 2026 00:03:15 -0500, Shang En Sim wrote:
> IORING_OP_ASYNC_CANCEL with IORING_ASYNC_CANCEL_ALL cancels poll
> requests one at a time, and every lookup starts over at the beginning
> of the poll hash. Cancelled requests stay hashed until their task work
> runs, so each lookup also walks past the ones already cancelled. One
> cancel that matches K of N pending polls costs about K*N/2 visits in a
> single io_uring_enter(), with uring_lock held.
> 
> [...]

Applied, thanks!

[1/2] io_uring/cancel: count all requests that a CANCEL_ALL cancels
      commit: 21ddbb14f7c3baab50a2a6c13ee375edc2bbe031
[2/2] io_uring/poll: cancel all matching requests in one pass
      commit: 9eff9c07e927dcd9c57150cd6fb3d4ec76f00480

Best regards,
-- 
Jens Axboe



