Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672240;
	b=Uyu7FBz0AQ29Pb2P3Pwhxe4GzrCW0FIdaFb8tGBFqlKuVWa9J4gdR/tVSfDiJCH9/siW
	 t3Qbfot509anbs/pWjWJAoD/nFFCo9dYdnPMn7XqNigP2UkqoRWedm1qHmHroZhxIpN6e
	 CmtPEJHB+tZwtace2RTRuqxJDA98HimXZcqu0t0oKl1z7Kww2z/26t8AWwxlvw8DUng1g
	 2yIuLdj6/VGzTEUgarLiQ+1vIQCIj1g/dyNCtTFFBIxVw0eFP+w7zb7PSZDB7Tr97pDP7
	 o3///lMZ6xPKDXGLKO0uJG66n09vbW5eIZE/FxBTGbWskdoHvRQqA8RR8D/nua1sq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672240;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=GKn+IHyyHC0hLWOixkG2Q9KQnIe35j7BCkn/MbNYRFs=;
	b=ndlcLPamzbv2kzk5lubh7vfgRmzNwwXUFBbNClaLitEBjNNfRFUosbhAH/f1bHT1p1lD
	 P40JqvfNPvgZcoZl5UCXJZxDW9BOHBaHZGd9tX2CN3SlnWhKtGuAEsJIRl35MFIAIU3cK
	 NawN4SXgOxMAyp0JNY2s1RXQyBLwj0rAqG2FcICp/ECAG0BWsTwiNDGxGzhezYtyKuxw1
	 VownPV/bCr30CXEx2GkL0n6IfekTmQ8vFDQhzqMsqoryoFb/a1NF1JTyhmyFrBCM9avyf
	 W7VV2v5wgvpuHWrDrKWWgRg80Hu0wlW6jcGnrIxasdeoDz0Z7L1GhhHhw3CidobSsqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=Ku4wfd9M;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M9Ok84pC;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C3A606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C3A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=Ku4wfd9M;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M9Ok84pC
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CC0BB140022D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:17:18 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 02 Nov 2026 21:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793672238;
	 x=1793758638; bh=GKn+IHyyHC0hLWOixkG2Q9KQnIe35j7BCkn/MbNYRFs=; b=
	Ku4wfd9MyDqwwn8+kehzJAEiwsXNfsWZXj5db016f13Lddw3QHVPQsCoMCAiz1PY
	9RCoPe9Jvldbi++GUQD6hDwUx9QmRbFfVfexEcw4dzsnwbQDRxZIwzpil45FnauL
	5EDkLr4tIrEaylGH5MP/nx+27s2OXkkDqoYgPfccuXZuxt9i2HyUb+g0EpRHS655
	smTM+eMv1t3mGTtUtObelF+BuSYIzkrJ2JhLd82XEGlLGJEpN8UtqrFP4C2zncGN
	4ZYeQ8J8cQBUJpAjn4HlcOyfr4g6nI6l0NC7U9v0WVXBRfpoahw2ckjNR1pW83ff
	EpzVJiroOpbHGtUSbanujQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793672238; x=
	1793758638; bh=GKn+IHyyHC0hLWOixkG2Q9KQnIe35j7BCkn/MbNYRFs=; b=M
	9Ok84pCX+rOusmJ++C6UE7x2+yqwobP4Y8ApX0yxPGsLQvIRYNHlIqsZRZ/P4yqj
	SgwnieisrX31xgYoCTEENz4k81BYBkbCbNZTv5iDLDZPqlXF5IMugXRd2Yg5aMWt
	rF4j/phYGOm/hFVQkcJ9TER+X/EX0WEcoD0PFH7jWHhC7EaP8EEjAuSwT+IVIuvD
	zXRevo/QKZrdb3tE23HCoaAj5GCvgJjd7piOGrWZATaBlkRuySLSz7hE/pkN07E+
	OsJqLDlTac/JyV+yDvrigPDA3hCUIy9qmQSG410LhkFRSiCw2Hv8Fw/utYzyIfzx
	JCZZgod40x71V5YY2/NiA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793672238; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:ItLtfre0WmoY53jls9UhQ4fRQp5rqhLOqGF90wOxd5oW2Zy
	48ji6eoLc5Z7EIBrASETHDyaE1iFpFevuw90D39HLCB5W5NuAVFr6MvDocmqV55e
	VE/0Z3Y5ZPHIKVPjVtBtj2/XKNsTdwF9dT9BLVd+iGFWuNTV3MJlaZxHI1C7ezdb
	313T7Fz/w/tgsvLfAU5twANSStF/TD+NY3y6Nyd238+Fo8rb7ynzioxWeqg9MJWd
	M3z4TIm1D1UKEU1WluZDwmOfc3rzlqrgsIZRLVj1IgKyqpBWNJg/Pc6Uk9j7mMrp
	zXyShPPAq6XCqKZ8Z5ytba2bfkTGQz3RZzb+buw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:eJWUIN0a0MX4lndtD3FcNoXopaKhwBWoWK0RYMybGpM=:G5Q4OGLzTBj6wNSAZf/8FJ9V3PGt1pR8M4eQS5lBk6g=;
X-ME-Sender: <xms:LkTpalfxwla8fzXV1bST-yVQhNqNd6KOlLIcUunUx1DhAcqNEjlUfA>
    <xme:LkTpagZDQRrwmyZYorpm6wbbxrgxS8qCCqpAANomEKbtlkaahvW46zvdKALVwkSUg
    r0lWyFzwG-GPw9hNfgj2idKRztU4KqT5ZyHRVsRRC7xvxRukvid5ya0>
X-ME-Received: <xmr:LkTpajBmQMVvumlsBEfTP_YAObtWUR4t6xvtoOGoL8fwOmX2rWwYk-Ss0m5JSTVGUfWc7J-h3NYqMwfrhyevsisr>
X-ME-Proxy-Cause: dmFkZTFkMJtNZ5NfeLlg/R3NlXUfLyw66WDjr5df/9K5iRAVEAmU8Ftwunzwj80qGnzaty
    3sQhPfEFRynO0cDHIL1yhD68kwIkmhuM4yECEX+MpzJ/bUkBkPy3/+kcptYmOv6xQeY2n3
    gmQpUp4XXSOac/dNyEwOIKOpDL9GHvs3LcDYaIEFmBv/nmNXSv0P5+OeGS+Xwx3NZRqQvz
    UOp2J/BBmoXA0ESOzsPKoBRx9rNCbyzvhCTM4ZqeV6HQXRmh7fgo2s+L5gxuX0+uY153kJ
    Oa6zQMea5x7+0MsO17pj6LvN/r9y9yJufMDGsHVsv1v7lWshRFRh2K46g93usgoMQ540PO
    0TOXTOcjrEE26AoJAi/UFGObvBTpVoDN/bJkmJp/EIR4tP/L/1D6w14sPwPB7AhGX1SrjU
    APQKjw1Oj4oR8CXJUjIm+9yFNjXuyB00YRS9LjXiq8NPY79J0SNT3EqhK8yPyJMf2lxnug
    efJBF2LOJfYY9iEjmCbJmwy7bMaJP8jF4ENl91odQu7d8/ufh5ix4KMSHE8jw9mat8CFlw
    irJBVHjGkMwjECsMRugMsuPD7MIkzflmrqpbnbSVP8mXHbKk9DeZt5rktVJ7SqsQH79SCI
    55S80xbSsjbyxGfutVN5OzIeNChwv3PN9ZuqOoUaYF0fhiDbGO5fAhX57wTg
X-ME-Proxy: <xmx:LkTparKpQ8J1t2xL_2my9sKxpNeLnaZ-3Ah5BL--0Z0RRzv6nSwUiw>
    <xmx:LkTpaioSH7SYQV4Yw6xYr-CgJ7mhmCxTops2BXw1i7GYsr-sheDk6g>
    <xmx:LkTpasMeVoy1YQMbZ6loWb7udp-tuIGNV3THRJplprGMfKYRhvfcsQ>
    <xmx:LkTpanPnDGTe6P6pWUhMSnwN4_kV6yLx-zhHv5JUm4sI2bbNZr8Qdw>
    <xmx:LkTpamAeUTteFVdlo6ppnPvri6eENBDiZbQBsMQXcbcmSQjuUhgFJZN9>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 21:17:13 -0500 (EST)
Date: Tue, 03 Nov 2026 11:17:11 +0900 (JST)
Message-Id: <20261103.111711.1426428689637198062.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, anna-maria@linutronix.de, frederic@kernel.org,
 gary@garyguo.net, ojeda@kernel.org, tglx@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 2/2] rust: hrtimer: Use
 hrtimer_forward_safe_from_callback()
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87se1jmhiw.fsf@t14s.mail-host-address-is-not-set>
References: <20261101232829.593680-1-tomo@flapping.org>
	<uqohX3cKDZh17tB-JJSkR4WV6BtvMvP4NMJC5JJoemnBUsIjS3tgB2c1emjwPLLUo2s0unyBH-LAcKmQkHedhg==@protonmail.internalid>
	<20261101232829.593680-3-tomo@flapping.org>
	<87se1jmhiw.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 02 Nov 2026 15:31:35 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Safe Rust code can start a timer while its callback runs. A timer
>> started through Arc<T> or Pin<&T> can be started again from another
>> clone or copy of the pointer. HrTimerCallbackContext::forward() calls
>> hrtimer_forward(), which writes the expiry without the base lock, so
>> the write can race with the concurrent hrtimer_start().
>>
>> Call hrtimer_forward_safe_from_callback() instead. It does the update
>> with the base lock held. If the timer is already queued by a concurrent
>> start, the expiry is left alone and 0 is returned.
>>
>> HrTimer::forward() keeps calling hrtimer_forward(). It takes
>> Pin<&mut Self>, so no other reference to the timer exists and no
>> concurrent start is possible. Narrow the safety requirement of
>> raw_forward() to exclusive access, since the callback context no longer
>> uses it.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> This looks good to me.
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks!

> While reading this, I thought we should expand the safety requirement
> for the handle trait, because even though handles keep the callback
> target alive, they do not own the target. The armed timer does. And so a
> (future) &mut method on the handle is not allowed to mutably access the
> target. This implicit today, but I thought maybe we should make it
> explicit.

I agree that we should make this explicit. It does not depend on this
series, so could you send it as a separate patch? A few comments below.

> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index ab7c568b8855..84f45a7a3a17 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -771,6 +771,14 @@ fn run(
>  /// is running. If the timer handler is running when the handle is dropped, the
>  /// drop method must wait for the handler to return before returning.
>  ///
> +/// While the timer is armed, the callback target is borrowed by the timer: the
> +/// timer callback can create a reference to the target at any time, and for
> +/// some pointer types that reference is exclusive.

The module doc defines the timer states as stopped, started and
running, and does not use "armed". Could we use these terms here? The
callback creates the reference only in the running state, but the
requirement needs to hold in both the started and running states,
because a started timer can move to the running state at any time.

> +/// Implementers must not create
> +/// a reference to the callback target that would conflict with the reference
> +/// that [`RawHrTimerCallback::run`] creates for the pointer type in question.
> +/// Deriving raw pointers from the target, as the [`Self::cancel`]
> +/// implementations do, always satisfies this.

Even without creating a reference, an access through a raw pointer can
be UB, for example a write to a field that the callback also uses.
`cancel` is fine because it only accesses the `HrTimer` field, which
is wrapped in `Opaque`, and hrtimer_cancel() takes the base lock. So I
think the requirement should be about accesses, not about references.
