Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC9737F322
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190214; cv=none; b=PCbUebjXNYjvw/XezU5c8YFfM2r6pT10kr502TDh2t5Ep1Y4KDQQAagMNq/EOGvTq5GdqvsoXnPfR919jkCtTtlQvTUXH2ar0cnIzVWhJ20sqjoT7U4kgGUfrFNWB1IoSoittB53WSt6RoyJBQdoMrz9qgtXV+6Y1sxzLCR5PXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190214; c=relaxed/simple;
	bh=pFAflNl01LfRk5qvOvEIrVh2M1JZcZOvuCZxUFHabFA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=SEj1sAXLdI6kXtXG9li8io3ZtYihx26yZlIrUxLLEwmPMlKMgzOiEN9eQFsh9JyxQAXrJYCA+9Wbp67u5RkWhThoMENp7plqKpy1OE6z6VZYMRfmZZvJow5diFzg8cpwjEMmxaJ+zJc+g1ku8Rfir0zL/65zxU4ODsDdr0txhZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Lla6hFjM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Lla6hFjM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pFAflNl01LfRk5qvOvEIrVh2M1JZcZOvuCZxUFHabFA=; b=Lla6hFjM+YAL8EyyNHkF/Xce64
	0yokWyLahzcENzcHtBos5qZsHLBUWzYttp5INbF1R7d6JOueOHd3107tMlBN5TxR54jCD+pNDAKb0
	CO8SLuOvEwLVBcyuc2VPI4bSXKeaTl7RdjF7yZhb8EtapkNWzjwNTZUa+1LpwPBVzUqAvrEL29Xm9
	kSXBZagrfZOEiTpZd9sOdM1GW0z1mnSj95a5VuAHtKVE+HGQHzrirCp0DE2Q6G9oLNNxggUHgMnyG
	A/iDiQurFRfk/2zDUeBHCH8fNNxNYGdC1u1WglZrgPtXgIuSViIKoceJGmdkBuoamV51w2HjxaoLB
	bfeM0BiQ==;
Received: from 90-182-211-1.rcp.o2.cz ([90.182.211.1] helo=ehlo.thunderbird.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDeOU-00000007juH-1w9m;
	Mon, 05 Oct 2026 08:49:58 +0000
Date: Mon, 05 Oct 2026 10:49:57 +0200
From: David Woodhouse <dwmw2@infradead.org>
To: Rodolfo Giometti <giometti@enneenne.com>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
CC: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_5/5=5D_=5BDO_NOT_MERGE=5D_timekeeping=3A_A?=
 =?US-ASCII?Q?pply_extrapolated_ntp=5Ferror_to_clock_snapshots?=
User-Agent: K-9 Mail for Android
In-Reply-To: <f432aee3-9bda-430c-9cb6-e35248c87b3d@enneenne.com>
References: <20261001202134.33929-1-dwmw2@infradead.org> <20261001202134.33929-6-dwmw2@infradead.org> <0d5d56ca-89fa-4f09-bd24-9c730dd27656@enneenne.com> <4751c410a0cb17270e6c2b43e70d01bfd7d6f0d0.camel@infradead.org> <7274f4ef-edec-4282-9c92-b6f7918b8320@enneenne.com> <46df3bedea175007a6480b4cb8ba070c6ff3d527.camel@infradead.org> <f432aee3-9bda-430c-9cb6-e35248c87b3d@enneenne.com>
Message-ID: <80DBB2AF-6C1D-43E2-BB1A-ADABACABE3FE@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 5 October 2026 10:15:01 CEST, Rodolfo Giometti <giometti@enneenne=2Ecom>=
 wrote:
>On 03/10/2026 00:47, David Woodhouse wrote:
>> On Fri, 2026-10-02 at 12:26 +0200, Rodolfo Giometti wrote:
>>> =20
>>>> So I think we do need it, and my inclination is to hold off on enabli=
ng
>>>> CONFIG_NTP_PPS for tickless kernels until we do=2E But I'll defer to =
your
>>>> preference=2E If you want to merge it sooner on the basis that with a
>>>> 1PPS signal the system doesn't get to sleep for long *anyway*, I can =
do
>>>> another test run with just patches 1-4=2E
>>>>
>>>
>>> Yes, please do that run=2E This patch changes what PPS_FETCH returns t=
o
>>> userspace, so it has to wait for the chrony and ntpd people anyway; if
>>> 1-4 alone are good enough at 1PPS I'd rather not tie the tickless
>>> enablement to it=2E
>>=20
>> https://david=2Ewoodhou=2Ese/ntptest-r64/rodolfo-14-tickless-1hz/
>>=20
>> Fairly much identical to the full series running tickless, which was
>> https://david=2Ewoodhou=2Ese/ntptest-r64/tickless-1hz/
>>=20
>> And not really much worse than the tickful variant
>> https://david=2Ewoodhou=2Ese/ntptest-r64/tickful-1hz/
>>=20
>> The ntp_error isn't measured because it's the clean series and most of
>> the instrumentation is gone=2E I'll set the 5s pulse version running
>> overnight=2E
>>=20
>> The series is also tested on four virtual machines on the same host,
>> tickful and tickless, patches vs=2E baseline=2E You can see the tickles=
s
>> baseline wobble when the actual frequency changes, while the other
>> three remain stable=2E You can also see ntp_error on both baseline
>> kernels spiking during the initial sync=2E
>> https://david=2Ewoodhou=2Ese/ntptest-virt/
>
>Thanks, that's convincing: with 1-4 alone tickless at 1Hz looks the
>same as with the full series, so I'm fine with the tickless enablement
>not depending on this patch=2E :-)
>
>Please put these numbers, and the 5s ones when you have them, in the comm=
it
>message of the patch dropping !NO_HZ_COMMON=2E

Will do=2E I'll let these four patches progress at least to the point wher=
e they have stable commit IDs before doing so =E2=80=94 I don't think there=
's any rush for the PPS change, as it's been quite a few years already :)

In the meantime since I'm working on the filtering=2E Mills's median-of-3 =
helps, but min-of-3 seems to work better for the frequency side, because la=
te pulses are less believable than early ones, yet two late pulses out of t=
hree is enough to pollute the median=2E I won't subject you to stream-of-co=
nsciousness testing on those; my test candidates are doing full 24h runs wh=
ile I'm at LPC this week=2E

As a parallel thread I'll also look at unconditionally using the existing =
(non-correcting) ktime_get_snapshot_id() so that we have the corresponding =
counter values, and an ioctl for reporting those to userspace alongside the=
 ts_real=2E I am leaning towards using raw counter values even when an offs=
et has been applied to the realtime value, but still vacillating a bit=2E
