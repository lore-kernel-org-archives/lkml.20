Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191902;
	b=Vv4bFM1cIsiCYPPzyPpCVvuqcJbJFzXOD2v+VGvYUpuu6IruGamJuH/sSNsQ6A49OtzR
	 lIksqrgNw3IV/SLMQbnYcsOIJ/WxCv83JFIHZoDKlavnZH+8lDsb9ym8TXivQktfKoxTI
	 rHM8I6SMKU4w4XqyhAr4WzMnqTkBChUe6aO5GMpZe7qiKH47iixi9cT/u+LcK0yqJV5dv
	 op6/XPfxBYxqNlJl/GDwoYU+OrXEsvEwwoU6o8WPxPNLgt09Npv6fPll/fzhlt6d7kb9R
	 uLh665EwfpmqnUeYbMVWvDasBWT3GTKIZHe2ebQ+sISxIKm11qhVaaPBvSuASswNNdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191902;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4QgwrBI3wl14x9XOc2FYaDf/AYjSUgDXY7fYshPzgk4=;
	b=0BHjkiUeWX+/dYBmjQ3a8AxCOELeT20+EGzenT2RDAhGvF7ixhYfcNxHlj/Yn83ResJJ
	 4VE8V4lj88hc2qWMgPo/drEMoXZsUWDEIzoAdhH/w//NH+UjcYi2kCvti4jpW7xQkjtWg
	 fANZSmPuosTxU1Pj4b4TozpTRXgtM7VKPKkc8OyCXnIw3vSwhCObNOmTKszuTmSDdmsyt
	 93Gd7HKdz5xl+q1+vodUQHmv0ihYlP4GWwHS8Y8fVVUZq2Pp/PE5Ao3SItlQ+HAhwPrqu
	 OXInyhtbcR4NTn8T04G9TfZzTRfmk/IluM1/BomA3fbt0CTtDhX/b80wWpqIq6byVrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G6e+/v8+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127D60A2639
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6e+/v8+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE061F01408;
	Wed, 28 Oct 2026 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191901;
	bh=4QgwrBI3wl14x9XOc2FYaDf/AYjSUgDXY7fYshPzgk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G6e+/v8+7X7ISVE1kgLO/YqSfIvA554wZmped1YsiYXV4t81Yjj1CceWPNX7BOC7z
	 bu3QYyRt1I6CPSN++xNN9QYxRn1UgtEksiBa1gT14qfjq1Fji9eDHEMIM6nSasVjuZ
	 Rzv/BAIXHSHt8XTq8dbc1fjAHuUwtHlVwmkPvI+OAZTsrchiufcCe1hIIp0rVf6JSo
	 mHDKau0cRwejmYJwxEzkA1DjQ8FZKSA4pT8+nCtDMeFNNNp+ld1HL2uX2W6DF3dKcm
	 maw2JYZpW3wzKrwm+O9Mht18o8tuMigApl4lMuyuuQqjQhqv284+kWZqNJPGDyd3Mh
	 VB4SvDgmkKuow==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4DD9C198003A;
	Wed, 28 Oct 2026 08:51:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 28 Oct 2026 08:51:39 -0400
X-ME-Sender: <xms:1-_hak0yawTSG6VO74TCldACfwO3HdoRCjQRlREmV1hoRQIc6vOvTQ>
    <xme:1-_haocqEnrkyUwta2xwErVYeOCIiW5FNRHeoU_NJK3aFAcFRdNyp4NGkHaTm-Ut_
    OVC30F-b8kah9WafQmmwmUefq4HTVmMliQXuVTtM3ELLUaCAln8Jehe>
X-ME-Received: <xmr:1-_hamDkh6Epwxm7nIAHt5kwV7S078xkEeZemQLhpsgILXOro2ZsRQ6ToOE>
X-ME-Proxy-Cause: dmFkZTGE3qyaXVxGyol57PkJZIGWeoKTYQuEzvLABDKdQ+sPhlAGnOjiWdxNbmqxYTkZLW
    FPOtYF3Mh0BXDufsWNqeP+u1K424UqG0/E7TmpbHb4ukX06jB/9APetf2z9qWTvS6jlpNt
    FE2AszEFmluzvuiHX6sDb96WV7WyIkQ9Nc9fBCcK2tbCWlZqLQhKyX185ZeAMIDLHF02yX
    uYcUC2c4r7nNyrceOdZs0exaSF/Yx51DoG06ot6xyfmEvG2un6aO42EF7PMSI5dOAz1uGR
    HlAySkWe21xaQAcJ1lXFnIC872ASFxKh3j8Zst097HloApiGG/3LCYe70+lEIIl2aUdwZ8
    oEbpxq/mZKn5r0FGv210ENmig5Au9zdHfgIRCQyt5mMx0vsXbIiQU0EJcagVIfmnzTnICv
    61YSQBzN1RClpB5jCEd+NIwi7RP38LtABLc3FOislqtD+SJOEDVNxHYfByu7inVkbxTbsW
    NsDUe4ovMvC2eJ4tRR3yKdzvI8x/BbZBTi6DVZC2JrsQGarSRxqLTUzlFuw/eMbCp7cvWa
    YlQPjVsYsSBvRnaAucwl0RhZiK8lajB2LICICvdG/Gd6vfKftiBz7Ttubhodhk+Msv9Bg+
    DwANTLTEo/rKYBRyHGSJ7MyTNqd0LJKKtulcG83ksjGE4F7mVZLZjlXk+t7w
X-ME-Proxy: <xmx:1-_hag2rZ-ERMvifHFoFYhVm1jTki2folsDUc64gKMMgL_JvZ0hVVw>
    <xmx:1-_hahNmWBD1bTvVYoE8UCnoS_073bpJvvgkcIwaMjiVsDkrsflSJg>
    <xmx:1-_havY5Dr_j3lDt7rmUk1dHnpoCwGYymU5Iy_jUlBz1c3h1roCwOQ>
    <xmx:1-_haj1HgrRVJSrCm5vQRdVYVZIBRhxIC9bths7jdKhz3FwI-08w1Q>
    <xmx:1-_hamtCvEwO8JyxD2zmga0K7GCLxU15ZgDVmaDefvMsn9KlsBeJ-ggS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 08:51:35 -0400 (EDT)
Date: Wed, 28 Oct 2026 12:51:33 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, 
	ljs@kernel.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com
Subject: Re: [PATCH] selftests/mm: skip collapse_compound_extreme() on THP
 allocation failure
Message-ID: <auHvwK_vtQYtx_Ui@thinkstation>
References: <20261028100119.11340-1-zenghui.yu@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028100119.11340-1-zenghui.yu@linux.dev>

On Wed, Oct 28, 2026 at 06:01:19PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> collapse_compound_extreme() needs hpage_pmd_nr PMD-order allocations in a
> row, and it kills the whole test binary via ksft_exit_fail_msg() as soon as
> one of them fails.
> 
> Gating the case by PMD size (commit b36bec6a01b1) -- the current workaround

Nit: checkpatch wants the full form:

  commit b36bec6a01b1 ("selftests/mm: skip collapse_compound_extreme() where the PMD is too large")

Otherwise looks good. Thanks for chasing it.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
