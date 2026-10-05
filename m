Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1732B46AA8D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197408; cv=none; b=ngQhSj1M6onNBvJrSAfU6tbqfWFfCT6JpKZvQF3np7javcFU+NYumDm+2MiF3FROZo5ood15K5cvVCppwLGmRNx09wcqgBPoRDx73jTZmrnKT7LBNsnnuX0XdRBEC+am9LvhpW9sKwj5zK5AJPBiN9/yEwNyn7U+apGq2t5VvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197408; c=relaxed/simple;
	bh=zZMSJRsy/gKBzYArkS9Y2BElowiNX6pgl30a2dTwWTI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DErHDmfixl7YqJomPh33zoDCLDY+SlkRWIcdKfvMg61mbGMkYTodXIFcJV8LE5GAApbYLX7/kbQpWq58yAQeiO5KK0jwtbGFk38w/wxWxrNc6qVU+OC2NtYsdUV46Pol6QqonooOIu2AFjNAFZ06n09pqhZqAAM3J7pm7dB45fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GgC+UGrw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GgC+UGrw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zZMSJRsy/gKBzYArkS9Y2BElowiNX6pgl30a2dTwWTI=; b=GgC+UGrwLs2EUH487krBcFWCgo
	053S+kWgqYhNsV+1McfGjTWvYHKRMa5AGRK3+rrTpM35PF0QTU1iOimO162qh5RzXSaHPTF5JPlF2
	f6nxCWgIvfb1j/hvnzz5Qy9i1lQTt7nNqBqJIds8hOCK++I8UB/9FQ5PncI0dKmyXBkTyD+EVaJSv
	/c1xWVeO1vxRlMV1VtWgEVImgzto2N7nvwTPEnO2fKbPqY9j2vh9A8v8p5DAKwTSDA0jMAcUINjXC
	qC4FgOroxklcQjWkYC9PG2Wi0aeVWr6jq0W4RhiNAoC1T8f5yQB0OafFR8Oelf/S69Tu9bfGvGFQi
	DSc3U1xw==;
Received: from 90-182-211-1.rcp.o2.cz ([90.182.211.1] helo=ehlo.thunderbird.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDgGd-00000007paO-0vht;
	Mon, 05 Oct 2026 10:49:59 +0000
Date: Mon, 05 Oct 2026 12:49:58 +0200
From: David Woodhouse <dwmw2@infradead.org>
To: Rodolfo Giometti <giometti@enneenne.com>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
CC: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_5/5=5D_=5BDO_NOT_MERGE=5D_timekeeping=3A_A?=
 =?US-ASCII?Q?pply_extrapolated_ntp=5Ferror_to_clock_snapshots?=
User-Agent: K-9 Mail for Android
In-Reply-To: <219b7746-fe88-46d5-9a91-5335d202c1d6@enneenne.com>
References: <20261001202134.33929-1-dwmw2@infradead.org> <20261001202134.33929-6-dwmw2@infradead.org> <0d5d56ca-89fa-4f09-bd24-9c730dd27656@enneenne.com> <4751c410a0cb17270e6c2b43e70d01bfd7d6f0d0.camel@infradead.org> <7274f4ef-edec-4282-9c92-b6f7918b8320@enneenne.com> <46df3bedea175007a6480b4cb8ba070c6ff3d527.camel@infradead.org> <f432aee3-9bda-430c-9cb6-e35248c87b3d@enneenne.com> <80DBB2AF-6C1D-43E2-BB1A-ADABACABE3FE@infradead.org> <219b7746-fe88-46d5-9a91-5335d202c1d6@enneenne.com>
Message-ID: <4E05A29A-7316-406D-9C62-C51DA2D46615@infradead.org>
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

On 5 October 2026 12:15:27 CEST, Rodolfo Giometti <giometti@enneenne=2Ecom>=
 wrote:
>> As a parallel thread I'll also look at unconditionally using the
>> existing (non-correcting) ktime_get_snapshot_id() so that we have the
>> corresponding counter values, and an ioctl for reporting those to
>> userspace alongside the ts_real=2E I am leaning towards using raw count=
er
>> values even when an offset has been applied to the realtime value, but
>> still vacillating a bit=2E
>
>Raw counter values get my vote: userspace set the offset itself with
>PPS_SETPARAMS, so it can apply it to the counter if it needs to, while
>the counter should stay the value actually read from the hardware=2E :-)
>
>AFAIK that's also what the kernel consumer gets today: pps_kc_event() is
>passed the timestamp before the offset is added, isn't it?

Think so, yes=2E Although I'm going to think about that too=2E The GNSS mo=
dule can tell us the expected offset (from top of second) of the upcoming p=
ulse, and the kernel *should* consume that=2E

I'm going to play with a d=C3=A6mon which feeds the kernel the offset for =
the next pulse, each second=2E

>When you get to the ioctl, please post it as an RFC before the code=2E

Ack=2E And we can finally kill that 32-bit alignment thing that the header=
 file says I pointed out when PPS was first merged :)

