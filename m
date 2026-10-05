Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D623909F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195335; cv=none; b=qTpd99zGeGvECjOBB5DS5U1ydupsDYEZJqBAtwypgH+in4924tRkHs9WFFwtk7PlrSyFbE13svV6I9Jg2b2mAEZ109kX474LYVkYgxe4TBCaDOHfov27hNjmyrLkjFS68lJnLzgjcP9HIuIP+lsQCI/TfBNoE7ZrdOXA7HEl2fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195335; c=relaxed/simple;
	bh=qctAjJRRDrnKoGmLwV4hdmgQ9C+nxvparTn7Izebt2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf3H1j7rEyxCmIjAQOS4hdxA2Ik/vnXv3wv8OM41xLS09wBv1TZ2B2sUu64SeHzR6j/XWwreVveITRRb18cut53KvA6NXf23tFE097zkTaroDPCvfpSbUjLHqB48XaChic/Nt5yKxfbAPCn9Acq4D7L8Z/K9ZCrWyVoejsfYdAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=FoeG8Nfy; arc=none smtp.client-ip=62.149.156.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="FoeG8Nfy"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id DfjDxONzfXXg5DfjDxo7LH; Mon, 05 Oct 2026 12:15:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1791195328; bh=qctAjJRRDrnKoGmLwV4hdmgQ9C+nxvparTn7Izebt2E=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=FoeG8NfycvqSFbS7K+75gUzV+DsAArwsXILqpMNstwHUIkXeBciPji67ouOnpfSc5
	 VdbSn2pq11w9ZKZEHLJ2dSsG1XCGnvr/FVwhZF6XYVUIRU4AP4+Nu6RJ98M04tG6ah
	 z2dORG6wSrQXO2NnbZetvbbqb25NGqBko9F4bggfARiTFFsfYsWrIl5hEJix1HSCLP
	 YPeedhmiJuJ498nXZ7+YkPX7B4n8KlhHqLNVvHDogxvyjvGq8WwMy97mDMEvl6wHR8
	 TKYgr9tVYKJc8U4iKiIyMW4HnqDBvYeQJeBJY51nSRP+W6KAMIQqq0MIHwqR7QEonM
	 poOeCKvFkv8+w==
Message-ID: <219b7746-fe88-46d5-9a91-5335d202c1d6@enneenne.com>
Date: Mon, 5 Oct 2026 12:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] [DO NOT MERGE] timekeeping: Apply extrapolated
 ntp_error to clock snapshots
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
 linux-kernel@vger.kernel.org
References: <20261001202134.33929-1-dwmw2@infradead.org>
 <20261001202134.33929-6-dwmw2@infradead.org>
 <0d5d56ca-89fa-4f09-bd24-9c730dd27656@enneenne.com>
 <4751c410a0cb17270e6c2b43e70d01bfd7d6f0d0.camel@infradead.org>
 <7274f4ef-edec-4282-9c92-b6f7918b8320@enneenne.com>
 <46df3bedea175007a6480b4cb8ba070c6ff3d527.camel@infradead.org>
 <f432aee3-9bda-430c-9cb6-e35248c87b3d@enneenne.com>
 <80DBB2AF-6C1D-43E2-BB1A-ADABACABE3FE@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <80DBB2AF-6C1D-43E2-BB1A-ADABACABE3FE@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCy0NqHoQnp46C9jRM2GfoRnCJantpve1cNfODc9taLHVA9/lNv0YEEK0acUeMKH2IqJ/wjgwsh2J+E+HEsvLefiw40g7iY/QI5/sQKUnteL1ZJbiXyf
 ekgbNbGT2lbHA46maeT6E9WyRkThxWMvMBlDLsTDH92x584yMPrQucIiL66AtarNuEWPXHfLsglFYMqJaTkXWCvBi5NqIPx644OuZKOBaLX+WdHPILbHW41S
 DMb7oXU+W/LVdzkY6P+ot2T2KS8CBp3JErMdch2nboNPchBByAtYUy5u2Ic3hqfboCbx4ZFB/6ow0tLME+rztZz2gRwaIMbMfOGjAOSS8zhDHw7r6xXEiLGF
 cUPxiYlT2cLyuC2Lvd5AGmvTcxPk8m0JtPBeDoAlnYDP5wHiX0s=

> As a parallel thread I'll also look at unconditionally using the
> existing (non-correcting) ktime_get_snapshot_id() so that we have the
> corresponding counter values, and an ioctl for reporting those to
> userspace alongside the ts_real. I am leaning towards using raw counter
> values even when an offset has been applied to the realtime value, but
> still vacillating a bit.

Raw counter values get my vote: userspace set the offset itself with
PPS_SETPARAMS, so it can apply it to the counter if it needs to, while
the counter should stay the value actually read from the hardware. :-)

AFAIK that's also what the kernel consumer gets today: pps_kc_event() is
passed the timestamp before the offset is added, isn't it?

When you get to the ioctl, please post it as an RFC before the code.

Ciao,

Rodolfo


-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
