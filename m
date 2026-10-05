Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E9485517
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206289; cv=none; b=LAX72zLAQVFjQoy5G6ApDZu5kA2ae/3615QVd/xJzlb/uiGJEyShjH4Imf3dcd1gTFBisdojQLwmMmkCoUjtrJOYvTyNffqNtHrOWKj3OvnSCSEn615RaeDWo6DIHTNdzy8Bxmd7NZ7jRzR4qg4RuecdAh7lIYK8p2R3wiee4Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206289; c=relaxed/simple;
	bh=ock0vQ1uQm6360Ra5cdb+jQ3MdxKSzZ48R7M/QckE30=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JuuFBejDBrNMv9EWNaoxYCboa97vvRTE9gnLRLRRDGyvfmuiY0dyaJqglR/bTAsLNNd9nVVCBfveiS8h2X74BuugBUfRAh4PBm196hgKlr6jchJVBKaGm/B/V1VyWDtteQrraBnv4AHJDRYLaakfOfHRBCfqCvWX3R9gaDIme2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ge57/i6E; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ge57/i6E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ock0vQ1uQm6360Ra5cdb+jQ3MdxKSzZ48R7M/QckE30=; b=ge57/i6EP+EFesnnmd9pfk7bb/
	tyTNuJJmcq1s7c11Qqzyv99MXRoJc4Ws7cP06mfnTrLk2FIt0kJIc5wR0qdAVm9swyOlGEzV9RVyQ
	WIHrA6xtgYNJ19Yy7EU6d6B4DSeoyJ9kwzcv4QYz7kWsZMCAn8TnsmsSCbldqQVZEPt/0U4YDM8Rp
	fm5VzZFI+HpG5w2Gi4+lZB+XLn4HX3uqukFCLww/wkfKlvn4/a0dFJCXreNGkn+jR5Gx9kTxIFWGv
	q6twtSEQ6zcmcs2NNmMTLh33vTCXSy6A+azc2+nXi2F/Dt2KJ/oRutgaa2uTV2YRB4xqxGvO89q7u
	qEE8wQOg==;
Received: from 90-182-211-1.rcp.o2.cz ([90.182.211.1] helo=ehlo.thunderbird.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDiZp-00000007vZc-2mq3;
	Mon, 05 Oct 2026 13:17:57 +0000
Date: Mon, 05 Oct 2026 15:17:50 +0200
From: David Woodhouse <dwmw2@infradead.org>
To: Miroslav Lichvar <mlichvar@redhat.com>
CC: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Rodolfo Giometti <giometti@enneenne.com>,
 Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
 linux-kernel@vger.kernel.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_4/5=5D_timekeeping=3A_Reinstat?=
 =?US-ASCII?Q?e_proportional_correction_of_ntp=5Ferror?=
User-Agent: K-9 Mail for Android
In-Reply-To: <asN2RcjoTNN5rpaK@localhost>
References: <20261001202134.33929-1-dwmw2@infradead.org> <20261001202134.33929-5-dwmw2@infradead.org> <asN2RcjoTNN5rpaK@localhost>
Message-ID: <3861AA94-5490-45BD-AD68-E0867308D4FF@infradead.org>
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

On 5 October 2026 12:04:53 CEST, Miroslav Lichvar <mlichvar@redhat=2Ecom> w=
rote:
>On Thu, Oct 01, 2026 at 09:21:33PM +0100, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> The =C2=B11 mult dithering is sufficient to keep ntp_error at zero once
>> it's already there, but it doesn't do much to reduce it once any
>> significant ntp_error has accumulated (e=2Eg=2E from frequency or phase
>> adjustments) =E2=80=94 it can typically only drain single-digit nanosec=
onds
>> per second=2E Commit dc491596f639 ("timekeeping: Rework frequency
>> adjustments to work better w/ nohz") removed a larger skew because in
>> a tickless kernel, it would remain in effect for a full idle period
>> and overshoot=2E Now that timekeeping_max_deferment() ensures that the
>> system wakes at the top of the second when skew is active, the
>> correction can be reinstated=2E If ntp_error exceeds an amount that a
>> single =C2=B11 change to mult can drain within a minute, add an
>> additional bias to mult to close the gap=2E
>
>The dithering is switching between an adjustment of +0 and +1, there
>is no -1=2E The time to drain depends on the direction=2E If the mult
>division has no remainder, it's infinite for +0=2E I think that's ok for
>this change, but the message and comment could be more clear=2E
>
>A faster correction creates a larger frequency error=2E

Right=2E I did consider making the threshold depend on the difference from=
 the nearest integer in the direction of ntp_error, and how long it would a=
ctually take to eliminate using the natural dithering=2E But in the end I t=
hink I dropped that complexity from the version I posted=2E

I did also ponder making it truly =C2=B11 from the base mult, instead of j=
ust +0/+1=2E


>Is this patch considered a requirement of the one adding the ntp_error
>correction to PPS and other timestamps to avoid larger inconsistencies
>with clock_gettime()?

No, I don't think so=2E There are a few phases of the ntp_error fixes I've=
 been looking at=2E

 - fixing the misaccounting (already merged)
 - reducing the (known) genuine cases where it accumulates (patches 1-2 he=
re)
 - eliminating it once it does accumulate (patches 3-4 here)
 - subtracting it to "correct" the snapshot (patch 5 posted as DNM here)

The three parts I'm posting here are complementary, and the snapshot corre=
ction doesn't *require* the previous patches (apart from the bug fixes alre=
ady merged)=2E

If anything, it's the opposite: driving ntp_error down to only what's temp=
orarily introduced by tickless drift will raise the question of if we even =
need to *bother* with the final patch (I think probably yes, but will be do=
ing a bunch more testing on tickless kernels once the dust settles)=2E

>I'm wondering if this duality of the clock wrt the way it's read
>couldn't cause any issues=2E Any chance there could be a new clock ID
>for applications to do clock_gettime() with the ntp_error corrected as
>well?

In theory, sure, we could plumb it all the way to the vDSO=2E I think we w=
ould want to have a very compelling use case for that though=2E

I'm slightly more inclined to let such userspace use the clock_get_referen=
ce() that Thomas and I talked about, and convert counter values to time at =
their leisure=2E

And ultimately, perhaps, just calibrate the *counter* directly without any=
 of the feedback loop that adjtimex() + clock_gettime() gives you, then *te=
ll* the kernel the result with clock_set_reference()=2E=2E=2E=20

