Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86974BEE5E;
	Sun, 13 Sep 2026 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281032; cv=none; b=OdTjNQjOYj/HPcc3/vBNHo6xK37yI4hIbMIU71dxUTX94/Ehk51rmHEoeRGIAyYcZXql0T3QLTCDrKVIlkouYRYUEkYdqzkFZ2c7nhAq45PNTGcL9ELLBluP24WPzMjS5qTNOPu3RaT1+/A3sKoRFlDfVHbQj3KhxyzjXgIMo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281032; c=relaxed/simple;
	bh=o8NRVV47Ku+yBwYY41dAXpMxQopG8RS1TOH6vSd09fc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=nbGbkW9wMK4rplIl4dTRxjuKouOqBEZh06Xnsq4Lb9qSDqJ83ROiOfYQ6Z9qaIkXKgaVpbjOqclRYlE2XoGAE0A1HUS/rCqBNVZ7/SOHu5N1KWUMpxG9J5d7yJDqtrwIcg0XdpsImUi/6qRuXKNgRYcwGSLHas8DbXdcE8+2+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=qJV1AhBG; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="qJV1AhBG"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789281023; bh=o8NRVV47Ku+yBwYY41dAXpMxQopG8RS1TOH6vSd09fc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qJV1AhBG9i3DU7Yr02JJgjvkbswwodk7ur4I/p3HdVTMHRL6JqA5hHx8FvysBb6wN
	 6zDNI0JRPwznq46w6UQJR3a/4tec5oefnEU1BNyqR/PBsiLU2HPV6pGEzOlmkqgYdp
	 0+pybgJ5cu4Mc/hc2aXfObSl2VVZ1D4kgm1zP/7+JLfALX1jzPqmCeGfWSvcv4djru
	 x3pw9K8Gq9QZCz6jpRUX53o02qYDHXEEcOGF9RU1eKaZEnwOsdH0Yu/7Suu4xHvUGa
	 WaK7MtCOtpnvhkYvZtZn1wk0JSToaCi1kP+qm1ok7cKFiHpAeI+A/REPen0vG35Xpd
	 vqU2T9IemDjjQ==
Date: Sun, 13 Sep 2026 06:29:43 +0000
Message-Id: <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
Cc: "linux-man" <linux-man@vger.kernel.org>, <libc-alpha@sourceware.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Andy Lutomirski" <luto@kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
From: "astian" <astian@memeware.net>
To: "Alejandro Colomar" <alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
In-Reply-To: <aqXOgqne-v4GtglY@devuan>

On 13 Sep 2026 00:24 +0200, Alejandro Colomar wrote:
> Hi astian,

Hi.

>> Date: 2026-09-12 22:00:57+0000
>> From: astian <astian@memeware.net>
>>
>> ioperm(2) says:
>>
>>   int ioperm(unsigned long from, unsigned long num, int turn_on);
>>
>>   ioperm() sets the port access permission bits for the calling thread
>>   for num bits starting from port address from.  If turn_on is nonzero,
>>   then permission for the specified bits is enabled; otherwise it is
>>   disabled. [...]
>>
>> The use of "bits" here is confusing/sloppy.
>>
>> ioperm is supposed to enable or disable permission to access IO ports
>> for the calling thread.  In this API, the "permission bit" (singular) is
>> really "turn_on": 0 to disable access, non-zero to enable.  However this
>> description refers also "num bits starting from port address from" and
>> "the specified bits".  That seems to suggest that IO ports somehow refer
>> to "bits" and this API controls access permission to them, which is
>> bewildering.
>>
>> Searching around I have seen that other versions of this manpage used to
>> say "bytes" instead of "bits", which is only slightly less bewildering.
>> Ports/addresses in the IO space refer neither to bits nor to bytes per
>> se, they are an abstract interface, like a syscall number/index.
>> (Architecturally, in some cases, these indices may in fact map to
>> processor registers which may in fact be portions of a contiguous
>> internal memory, so in some cases one could correctly say that the ports
>> refer to "bytes" in such memory, but this is obviously all very
>> low-level and microarchitecture-specific.  I think being aware of such
>> details actually makes this description more confusing.)
>>
>> Apparently the reason for this confusing description is that for Linux
>> ioperm is a syscall and the kernel implements this syscall using a
>> bitmap with 1 bit (permitted/denied) for each port, in a contiguous
>> sequence.  See ksys_ioperm in "arch/x86/kernel/ioport.c".
>>
>> Thus "num bits starting from port address from" actually refers to the
>> bits of that bitmap: the bits [from, from+num) are set according to
>> turn_on.
>>
>> This kind of implicit reference to implementation details is wicked.

To complete the picture: this is not a mere Linux-specific
implementation detail.  At least for x86 (IA-32) it is inherited from
the processor architecture: the port permission bitmap is linked from
the structure pointed to by the "Task State Segment" (TSS) and checked
by the processor.

It is still an implicit reference to an implementation detail.  I think
not mentioning this bits-and-bitmaps business is better but
alternatively the reference should be made explicit and the kernel
bitmap should be mentioned (and for x86 perhaps also the TSS).

>> Suggested change:
>>
>>   ioperm() sets the calling thread's access permission for num ports
>>   starting from port address from.  If turn_on is nonzero, then
>>   permission for the specified ports is enabled; otherwise it is
>>   disabled. [...]
>
> Hmmm, sounds reasonable.  Do you want to send a patch?  Or should
> I write it?  (I don't mind; just asking in case you want to do it.)
>
>> PS: Oh, also, maybe the title should say "set input/output port
>> permissions" instead of "set port input/output permissions".
>
> Same here.

Sorry, I've never written *roff before and I don't think I want to spend
my time learning that... although, I might be able do this by just
blindly replacing words without touching the escapes...

Which bring up the question, why not moving to a less hairy source
format?

> BTW, the manual page also says:
>
>      This  call  is  mostly for the i386 architecture.  On many
>      other architectures it does not exist or will  always  re=E2=80=90
>      turn an error.
>
> Is this still true?
>
> Another issue:
>
>      EIO    (on PowerPC) This call is not supported.
>
> Is this really true?  Where this is not supported, I expect ENOSYS.

I'll let others answer these.

> And yet another thing: should we document the parameters as being
> uintptr_t instead of unsigned long?  They are the same exact type
> always, AFAIK.  Or is there any system where they aren't?  If they are
> the same, uintptr_t will better document that they are addresses.

I suppose it depends on the architecture, but for x86 these are actually
supposed to be 16-bit integers.  I guess they are longs for generality
within syscall ABI constraints.
