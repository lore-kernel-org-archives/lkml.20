Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.30.211.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493461;
	b=Qclg2sgSyeewbpBgFMos9qdfbjMFSi02VJS3ujGMLe1mR6bDck4KI6TJPso23ToDY7wq
	 9HD7cXYucTa0QIgB1sqVQJOM9/rTxg5/PgcmrCSQtSLgiQGfRb0eIkHOWE+42QXLmi9Ga
	 ytta1EtYyNbcR6O81i9rrJ2oO7CPcnk8CWJtMRTaXTVT+eLiFCklbOFBct/1Gioq9Dfil
	 /iv/YMSSfSX3GD4pFgh8dACT1kL6t2egMrMXb7OEA1TJPqM41G8YBZ2lhldxfLpo1ZO5q
	 fBCYmRaPb3Zbq7wDvyDX+yF+J/oa95PpRzSeQEtymYlrD4NEEmH2ZSqLTpn2E/DTcrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493461;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-HalOne-ID:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=aFG2HP/YgJvzmwkELEIVClidnUuFRBnAC4gyPRz2wIk=;
	b=LAhIPdOV4WBYU50yzx94g5FaYyh+l2A62evym2Lviryk2F5FiU+1jiXxV3uQx/gugCDw
	 k5sTWswZuPbj3Mnu38JFL/MwBDuvT3v2p0fNOXb+wkeMu4Rn0bDxSOOTW7mOXtXg4iOwJ
	 sWXsIiCElcndMJ5k+fTOSq+04NZgqRkZkM351b0882YH/F/g+ZkcfpV/U2RNWLs0c5wV+
	 P+2MBlNg0xUBd9QP41f7wSLQ7G+z7dYTdMWnlHbTtOrxbxyOIZLYILNj3eC3wxpj3gGVQ
	 OU619PmLjKrlgazVxqDfWg4mGLNRkVTzbpI+A87810XiPQjmKhzQwCKr2fhxVhXkeQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=konsulko.se;
	spf=none smtp.mailfrom=konsulko.se;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=rsa-sha256 header.s=rsa2 header.b=TsZPhoWh;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=ed25519-sha256 header.s=ed2 header.b="tp/VAhUi";
	arc=none smtp.remote-ip=46.30.211.244
Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C32606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=konsulko.se header.i=@konsulko.se header.a=rsa-sha256 header.s=rsa2 header.b=TsZPhoWh;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=ed25519-sha256 header.s=ed2 header.b=tp/VAhUi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792493451; x=1793098251;
	d=konsulko.se; s=rsa2;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=aFG2HP/YgJvzmwkELEIVClidnUuFRBnAC4gyPRz2wIk=;
	b=TsZPhoWhqMXIicwc2lJ4IPC4xnem15qVHzBv+WFP6oa2pWct0sGIG5UMNCXDgdi86QMuAYqXoHXqS
	 VBRdpN3+20zeIkThWxTrtB52UbDLmRxu/bMcuMmcCcJgliTP2XgFFUG2gGvlmFbD1CB5lW+FC7US0y
	 +Cmf0ZV1MYrtW/DyTi9gMjbyE8ww9luZG1g9DJhseTm78hAlIru0O2+vEPsWN+wWKrAhhD3BUctyfX
	 S0ugsMFS+0nTcvvRm30JZVPqx9W1cXKexntz7RM+jQnR8ZlIXdv1TVO6BC2yJL6zGfn6XEMNQR6JJJ
	 RIIFaeWXGsGgWIJdsw7hjfpMr6BqYaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792493451; x=1793098251;
	d=konsulko.se; s=ed2;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=aFG2HP/YgJvzmwkELEIVClidnUuFRBnAC4gyPRz2wIk=;
	b=tp/VAhUi4TNkngibwnUKSs2Y4t6+oPnbu7f0mPRTfQVjREKprNg4wzy5PQQGvKlfTmweZmqM4eFz/
	 1CwP0erAw==
X-HalOne-ID: 1bdb834f-cc74-11f1-ba2d-33fc7c51c1c8
Received: from smtpclient.apple (unknown [2a02:aa1:165e:5a8:ecb0:57ca:e3fe:31b9])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 1bdb834f-cc74-11f1-ba2d-33fc7c51c1c8;
	Tue, 20 Oct 2026 10:50:50 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after
 concurrent resizes
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <3a034d40-e01d-42cf-9325-8c1e4a6db1b9@kernel.org>
Date: Tue, 20 Oct 2026 12:50:38 +0200
Cc: Harry Yoo <harry@kernel.org>,
 akpm@linux-foundation.org,
 cl@gentwo.org,
 hao.li@linux.dev,
 hch@lst.de,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 nickolai@csail.mit.edu,
 rientjes@google.com,
 roman.gushchin@linux.dev,
 vitaly.vul@partner.samsung.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F07BE53-D6E5-4988-B1BD-84AD2A05DDA2@konsulko.se>
References: <atTh-yyVIPQ-zNWJ@thinkstation>
 <20261018160315.1465504-1-vitaly.wool@konsulko.se>
 <atTv1tg9q9n92kZv@thinkstation>
 <F846CE95-6D2A-4D53-9C09-5C8630E2C8A7@konsulko.se>
 <3a034d40-e01d-42cf-9325-8c1e4a6db1b9@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Oct 20, 2026, at 10:27=E2=80=AFAM, Vlastimil Babka (SUSE) =
<vbabka@kernel.org> wrote:
>=20
> On 10/19/26 08:45, Vitaly Wool wrote:
>>=20
>>=20
>>> On Oct 18, 2026, at 6:15=E2=80=AFPM, Harry Yoo <harry@kernel.org> =
wrote:
>>>=20
>>> On Sun, Oct 18, 2026 at 06:03:15PM +0200, Vitaly Wool wrote:
>>>>>> How about we take my patch [1] instead since
>>>>>> it isn't prone to this bug and is a nice optimization to the =
existing
>>>>>> mempool_resize() at the same time?
>>>>>=20
>>>>> It is not a good idea to squeeze a bug fix and an optimization
>>>>> into one patch.
>>>>=20
>>>> Generally speaking, yes. But that patch had been submitted before =
the fix
>>>> popped up, so there was no sqeezing per se.
>>>=20
>>> I mean the patch you've submitted does two things (wihch is not =
good).
>>>=20
>>> It should be split into two patches that 1) fixes the bug and 2)
>>> optimizes it.
>>=20
>> I don=E2=80=99t think this is a fair statement. I would say that the =
patch I=E2=80=99ve
>> submitted improves mempool_resize() to be rid of unnecessary
>> reallocations and data copying, and that (improved) implementation is
>> *not* prone to the race found in the previous version of this =
function.
>=20
> But it makes the code more complex:
>=20
> 2 files changed, 28 insertions(+), 16 deletions(-)
>=20
> without an in-tree use case.

It does help bulk-zoned, e. g. on a device-mapper table change that =
grows the
pool.

~Vitaly=
