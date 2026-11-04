Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826022;
	b=ZD8liLsW0+t6W9uRVOCjcKnwgZbY4wCmNmWvIH9E5d4mwWTTuCmtFvKqURMn+xwmKYS3
	 RPfPTrZUU0KDIfbo69fCLnDrnPBub+QBjO+PKCvWIJW9uLT+riRmcVrE+rPUAD4tf7nQY
	 CVIcLDj8yK7eHgdZyuHvm3zUT70LokHFPNcxqJZ/38uWPxfvBuFJI0RgWihyeQi02jtHI
	 Kfal/PWrq3TAmTOE5lrEYDLY4pV/lDhgQdl2ACAgWFUFVVftyQzPRzCesGhWCgnF1puBp
	 orYAZvkIiPDC4YXONU8N14dF9Cvqi23PA6aVZeL4qHpQ7KgSAdgllwnEvtEQyOlzGVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826022;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=0kNaDaN7VzGkf9l540YM+342pLPmeRVN7bIHtngSK/k=;
	b=L5QC4MYYWnZmzPWI1ecUXU5gdYPdHSz+Zv9xPywAPNR3oAKUo2TqKMyCTn3nc8hcFKQ4
	 bqEigep69bPd2XWhM0440U4gPfPcbyhz3zdMi/a57EFK2ong1e+KECQHoOpRtaLQgVyB6
	 PI06j2qBgPNV/JGARl1mghVbU+xOi+ZPqnpz/pL9f2jvCOF01mg0qW89OYKaeNAaK253C
	 fL6vS8CadZI7m8PVwOY/pEhGB4oqVkzwdKLo8TBOTBSe7YZ7elE8s1b7sxO8wLH3DsZT9
	 ZGZbFcDOmAjbOoIDG9hXLex9DryfxxqpcUyIP6is/IQtY4kRHI1X9cK/d0cLQ9F0WAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cKOYknYY;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4+o1zQjd;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F796078963
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F796078963
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cKOYknYY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4+o1zQjd
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 78AA91400187
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:00:20 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 04 Nov 2026 16:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793826015;
	 x=1793912415; bh=0kNaDaN7VzGkf9l540YM+342pLPmeRVN7bIHtngSK/k=; b=
	cKOYknYYKdTNm7gT3ervxg7QOU52Utgs5UOoxtrbubT1te5NsIbZVFPMKvQimH1F
	Ib2iv8RWV6UqdraJhvlS5yd33G4tYwFGshUdIGAdvuU3cFdG8rbWC3+KHemVIdXr
	NUc2JhM2u+Fuhup590pgyYcIA58JTAMOd7A5s6PKYEJ1G0nSYzo1JqwOw8UaY8u5
	i/e5W+IkaQrQVH55p1WK2J1BV0dLB4esSzLf+T0EU8o8dUzyZbsKE9LFW1LDbbbW
	3WekMdVJHEFYWXzfbmA+mnv9lsFDEQ8/WTpzFsEFp8PLVP/iIhwhjwYa5asbRMbg
	mwFkIJvImo19SYtH1YbLFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793826015; x=
	1793912415; bh=0kNaDaN7VzGkf9l540YM+342pLPmeRVN7bIHtngSK/k=; b=4
	+o1zQjd3Z41zn3sTJs2UJJfBufYk9JKTqk39/upRC6nT7pcYjQfD/I3Zc3xUL5rZ
	yuWYIf/gUkcGIG93Az/bYc/7Dc36FemWDLmMf3KdtapwF2oa2w/hKyx55r0w2YUM
	V1EYzS32YyXpJWz9G1QAPLPbcO4Rj1H3ZHMRG+wciXebn7B5UGdXi7RurV8D/iRI
	Mn6GcSLvThSgYji/hJ1bPQnO+PItKOtN0ZsnHfstInXC5rC1hVaZ6YaPEsEdm0yc
	0R36LQL2uTJuSjbl9z/FM5BsolZktLXLkNXGb742PsVtn0O1xFxlsHd+7j9NJrAn
	JhBSW6gy6x+a9LlNZnrYw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793826015; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:OPXaIJBlW06ldM7rn7jyTZVN/RhNlXRNCHUWi4D0TDOCz5s
	msawivOffskiX48zRggJvvpnXnaVKiYoXHZ3ZxkvdxauEDOBzvl+sXw+FLxlBHdJ
	FphBslo98FBUBifld64+WijPi1u+t7JbAR5j8eZlgIpgAYBlpPI2S2xf0CMUWsXe
	5Y2ViOQm+kMgmXSw2jzWtTWuQYBnbMl6K+ekX7nOKMaSyGvsgM03t2+IiofXWmib
	MSYrwEJ6bXhXj08qy3uNdYU1ItouNhIzKjHNmdmRabSJeE/3a2l2KgV8a3PUk58l
	srSa7xi0V/vDdU+PWJ+0jruxgFlM7UOJy8mVluA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:fUmINlirdU2Tk6RCoHByTkIj3YlbxSUxiZjtoAUaQGk=:tYBOb+5dGuOjuQrd6XKBAFeuLK+8HRMkrzwfvErc19o=;
X-ME-Sender: <xms:2pzrapVO1PgXZib1J1FOBsiKZcp-1a2WMaiCzkWr12POCmkiMBllIQ>
    <xme:2pzrakYn6jOelhw810z9h7PtEocyxoQVs5edVa43zi1qGGxRlmYuFXHNs-zWUktAf
    1eaLGQCpfHbNQjIOw-5G3gdFqd4lzB-2-cTc4Rd0zl-ciJQRX21O57K>
X-ME-Proxy-Cause: dmFkZTEmmuOD0DZhwLvQ1jMu+N+9f1/bshj4za9fBQJ9CLi5nyqGXS3WVLocnYlOrqOSIB
    6FfId29nGSaJXnRDBuWEgopsKFsk9kKCdZMlOaAKHZiJOecJXJK5tvhHf4ExHC129SPRTn
    ywDnpmZfc6lQS9TUXA9FcCx2VPLS6+9LolLspxAgWuT9gBQtAauE01L1amFsAnhggz9Thz
    K4Y3OubtvjuJtHSnf7zo7wc1RCs2RvOov96x4Gnlg/5v1Dl92DGS7mO3qjvUBcf5+r+W1w
    M2Ah/4lcKnXI+AD7UM9xPoqDsnA90jhXogV/fJUgnmX/RUCq0OsQxlztOfBV5r2ctGxleQ
    P5q62C7C+Ai5m3jgBR8Ubc00tyJArfAVOnKr/LvHUrlJi8kOqvjG2g82xVHp9aqznRs3V3
    qL03F8W2Hy1HAOhL5fLwctcAInLF+bXJ6DMyIU9W9OVVQKGXo0PkiWCRWrFzYVMWb8g6fV
    eOAXmA93VZa4o3zcfq4qC55WNbV+Uz9zvISGAgRFmjFpNzNLlp+B8xe7yw0wZcaXUiz9CP
    FSjGKKuU4t5zdMcRPV6nUzYzMnaxK1H39SW4qpWKaXsgxT1D4VgfsnklufIjUbsHlO2R9H
    0wX5c25K5kQzHuWxQqT1Z6BAnytUuqd787ITw5dkM92Cg9y6+rLOuyjydRhw
X-ME-Proxy: <xmx:3JzrangpKATqgrFY9U5FKngYXRcRvPlOj3GrvzIj0yk4F1827md9hA>
    <xmx:3JzraqDv_f2Y3-RNnCmohuE0avDMpLZVmJc-xMja_czk7Lxx7RTNoQ>
    <xmx:3Jzrah4wqYWgSCUZ4-OLOKBLl26x6kjGdzjCooKYvcBTxAagK-vDaw>
    <xmx:3JzranGBXgwi1mFDP_mObr_pbEak_8hTCfhVqNcPvwprpGKJxslj8A>
    <xmx:35zralsJWlZ9ZXZAEn7SjmPWpVp6jklZ58NKQFrEjXOYvm9PpdyfvIPu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9380F32A0099; Wed,  4 Nov 2026 16:00:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AgP3mv5Dxly7
Date: Wed, 04 Nov 2026 21:59:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Thorsten Blum" <blum@kernel.org>
Cc: "Mike Rapoport" <rppt@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Alexander Graf" <graf@amazon.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Changyuan Lyu" <changyuanl@google.com>, kexec@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Message-Id: <34a03ed8-5b75-49b5-bfd5-e5cdf48dbfd4@app.fastmail.com>
In-Reply-To: <179382570401.2089669.6201187990672133004.b4-review@b4>
References: <20261104162352.140836-3-blum@kernel.org>
 <179382570401.2089669.6201187990672133004.b4-review@b4>
Subject: Re: [PATCH v2] kho: Remove redundant 0x prefixes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 4, 2026, at 21:55, Pasha Tatashin wrote:
>> The %pa format specifier already includes the 0x prefix. Remove the
>> redundant prefixes to avoid printing 0x0x.
>> 
>> Use phys_addr_t for size to match the expected type.
>> 
>> Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
>> Signed-off-by: Thorsten Blum <blum@kernel.org>
>>
>> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
>> index 6f1f55fe3181..6a7600a0a7d5 100644
>> --- a/kernel/liveupdate/kexec_handover.c
>> +++ b/kernel/liveupdate/kexec_handover.c
>> @@ -2010,16 +2010,16 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
>>  	 */
>>  	for (int i = 0; i < bootmem_cnt; i++) {
>>  		struct kho_bootmem *area = &bootmem[i];
>> -		u64 size = area->size;
>> +		phys_addr_t size = area->size;
>
> I am not sure; having a variable size of type phys_addr_t looks strange 
> to me. Furthermore, KHO only works on 64-bit platforms because of how 
> our radix tree is designed, and we do not plan to add support for 32-bit 
> systems.
>
> I would keep u64, or if using %pa for u64 is still an eyesore, use 
> 0x%llx for the size field.

area->size is also a phys_addr_t, so using a local variable of the
same type makes sense for consistency.

      Arnd
