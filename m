Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918A5187DD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682827; cv=none; b=auGR5dlBha3HS/oiLqEq4/wth3YxcSs9P1QIXiRKwj/FcCMm79YdZUF7vH3jOoDOVZ/32pvwYaCy6r/bveJkAVJGG8Ct6zDFVdARI4eW8ZCGEBkZsUwsLU22cPTdhu5vQN7fOXjXOUQC6VQT9lj3aC8YL9W1OhiiPhGLc87edPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682827; c=relaxed/simple;
	bh=7j742CzvHo7Rqq5Ojk4XIcl/5a83GNl55B36u0QiQ5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C+H0niBDFk50EHG/bDMuOqcdcpKwop0BeWXBK0Gg8pWXyrxlCuWNK2G7JQ2zScyTKvE3qmF2NIVNeW+oZ+N3ue4K6huTbmo7yOlSF2jOJ5HsgzNcSnm0pHAVTq3NmSzC+0pybhROd/j6PVl7lUD6XL6i423ISvchTkPu7mtPXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opqSDRsY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opqSDRsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BA91F00893;
	Tue, 29 Sep 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790682826;
	bh=/xMuLzEzFMdx1SNrUMigxPA+Ybp9ReIE/88H0iZ1VL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=opqSDRsYwk0i+dnRZOCt045nv9doTYcluV/jVuLoYVLrsMC09p6z+AcZyfpEUwcJ8
	 0jQ0Zt2fmJCC7kbhoe1WdmfGKl3T8MzkrD57va4FEisoWuq/PNXUFRLEAk42yYjcoI
	 qXb7AW5SN1oxj6XVVhd2podNg4wDHqcoPtjrIz3qa0tAZagRPCeA19cTu791A02PYJ
	 y8jzI2VEOUPyHsZ1mgHWfmb09dX3QHlA/AWgifuEuL8bIcp6r/wp2u08hdIqyv3dTS
	 nAT5dsYuvQbW3xcSO96/XihEMpBUIHSX1gTJGcpqMod2B32cat6AkIDCvM++vXeGKv
	 vZVO235x2fdyw==
From: Thomas Gleixner <tglx@kernel.org>
To: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
Subject: Re: [PATCH] clocksource: publish finished_booting with release
 semantics
In-Reply-To: <20260921-mb-clocksource-v1-1-3e1d1b43e90d@vt.edu>
References: <20260921-mb-clocksource-v1-1-3e1d1b43e90d@vt.edu>
Date: Tue, 29 Sep 2026 13:53:40 +0200
Message-ID: <87wls4i88r.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Sep 21 2026 at 21:22, Jaidev Shastri via wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>
> clocksource_done_booting() sets curr_clocksource and then
> finished_booting, both with plain stores under clocksource_mutex.
> clocksource_find_best() tests finished_booting with a plain load before
> it walks clocksource_list.
>
> Set the flag with smp_store_release() and read it with
> smp_load_acquire().
>
> Found with MBCheck, a static herd7-based memory consistency checker.

Unfortunately your tool is missing the point. All callchains which end
up in clocksource_find_best() hold clocksource_mutex. So this
acquire/release is pointless.

Thanks,

        tglx
