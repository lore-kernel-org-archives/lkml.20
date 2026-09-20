Received: from sonic311-31.consmr.mail.ir2.yahoo.com (sonic311-31.consmr.mail.ir2.yahoo.com [77.238.176.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F245E46EF9E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924385; cv=none; b=ZMmb/ESYQiFwOznP0FQ9g/wtIW1xhqn0nDuHZDAwRVBtoNY60+cm8nte3AXD3FA6VzVT/YdWJlS/FLoqdrZF0YbN8FcoxFk6ntpQFeDGr1a76cF/otgT2HjEWAjg7f3X6uHpq9TcOEE16BHSmCTEevObI7yfOsFin1e5DM9+erE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924385; c=relaxed/simple;
	bh=+UInC3rTJoLFzSRfVXwajEGLhogOWsHStc/pk7yc+O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BA2eDsDn5dZd70sNoplYHt9p37XpI0en5Bze1gbcuJVNI6HU6PqJTlwYRBZLdIe+E3uDOkxBMl3sP/In3d7/hPrEyhWCi4H3dheiPIe4nH8St86Hwgq8sSp6C4GI9uYxzpOnfR0D/W4g7BS5lfQVBwdYsPRABLEr1es9BD3PzYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=oKRouTyy; arc=none smtp.client-ip=77.238.176.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="oKRouTyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1789924376; bh=BiVnQLXo00UTixT6+f1o+pie6/XXxsDLNiTv8vV36DM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=oKRouTyyhvXnve6hl6T7O6/C+zxMy32OWhCeiWmrqVhmtbfd8dYuOkDrCNVcyiE4HaJE/7ch2haR7/+cokyln0kDfVFdsdB9oUjQFdziKIr8NH6OnVbc4CBEcL47DDVFcO28JYu7W2wd3DEnofr1PsmNmzGXbcy1k4E7HTM2MuV8kpRtLv5+1khFCVlZx7HxdUsa6IAElTZZH8ooTE7fDCkbf9Js9NlFWX6anMPrq99VyibS0ZAzo4PGvvjLe0Nl/+WIdkSZ1OqqIezHF100eTqMGh4h89Yy+JM4HWa3tQvigLniR/f7E3J+fDhfFHBZkB/DXEpxJ8c5Sm/QdpwjSg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789924376; bh=cwTt/3uznFU16kNfldEuBzAPEFxZ6efnEOapGsrIsHR=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=FGUoNq/qOscvQVF99qpN4SJ9abIxSKxZ+yNDpIGoOX3qJjc4tpGv4W17y7NlispK7pFnoZQqZBZWXIEwXjnKkOh8u2+2ggkzWoB/9u6vFh0RezHE8wqgQn1dEbWTWUQvDxF7HYiRpmMyNihylNXz/9Ka5VHc+mwt6U6N/2UoFyTsW6Gf1SVoT5LEOtUBRgc3cBt1tDUeoXSLpP/7UXh6VbTCJd5gLYetb34QNXgORbW5esVHCPbz8X2dPpmr1DYrhJaWQ12z56RC2KAd0ZZU9W4b3MTpAuB4WOu7Dsvo0ii2PxVfnF3e0ZKc5xL3Vn2fIpOjFZMkwAi85oK985x72A==
X-YMail-OSG: vQZUuE0VM1lfdEI4uv5owC9bRgLGI1srzKvKOIT5e7iuNom59..XU59sWfGKmt0
 PAMqq1ZSHAbb2MPj8bi9zyJzrcgUU86uFFu4YQJNgtgidpaH9j.SVdBS2n2GeX19q_mk6Svqay6S
 Z3QkcI1twtB_TUviyyXWjwjfX9W3dtMOTWd.spbontUrWpQ7MDaz1SYsa7sq.KYKE4oypADtZYah
 S.uNCzegfb59iz6IgdQ_UwNQsxHvy_2Sw7vBDfFxO72A9ECH_ovb_TGFAMyjKbIv2ogMIGswyM2Z
 ev5NnPhKT4xdoNGPMlxX_.Gf35PkxrTydU.ccbawBA.l.m1NCSQUHoLqeUJSY6Rx.9sppuy_oeks
 RveEQcatQKgI0y9G2owRTQQelAbYq1Ycoo.BaARaN.DRTKo8xgw87Jbqyxiaqb30i7TSLtap92Y0
 SCK1Y0KA4zkc8kM4kAInLe113zBqrGLHvU68_p3u.VYKyoVNxZR9WldpUBX7vraJfgdECVpTn5Cm
 dCHy7fb2hvp2SfppC.LnBy7fwziofGofoPG.jrVSRsmYiwDxZ2l6Cyu7H82KmRvsj1iv52nn1H4A
 BoXbE3KMiPDqeUggOqYnjaP3Pc8tOg8tb.KdIgjssXJUpmar7NncVd8KPIGZz6D9ugcFnrAttPdX
 umXPO__ncl8uWAq8WJXv4N_SmfS9tmH6i_CP74qRN5pB8fMOX04tXNPemF3ttAfy7jRigs0EMYHp
 4lllQfgHK2ytLdHW7UX2NTnncF1CO8AX5Vt4Y5tXdwYSSNgkDpqEBMj5FhemJbeTSd88OdqnnqQy
 Wekdx9jpsuIcmXuUkXPLeetWOfeD1A29O0ulb9SyO3hFEB4Wd4_fJz9EZK0BNFi3VKs80Gyvfdkl
 QGGYX9IABJ2z4gQ5mfGX4CmGX8p6vJykNS17JXgQm.R8yYa1N4RzRkj5kBTP1XEBCV9kcOT5Pnqs
 x1SzVb_rLvWgEDkNQceRRUSX4iVZY.DFbcw3uQg6b89W.p2r7CciLRoJ0IKJY2wAd8CVHV_8_dcI
 qZKVGUopY7NoDXBqbEnL7FDobr0KTWo5ENZoRMhh_PzoO4EdWbnHFCvWw3PQHYAmnKicG1zjvaHH
 ofGe1loEvphd.tm5RLZccCzJTaFCdxPPGYJevkPKe0TT2JOJDHNUg.wSyjaG25FXHOxtJ7gIPUoG
 p_kZ1iGCu6kpZMHo.JwAQYXVRlPpSeMsR8sqj7ukJwfrA3dOvvZ7vREdde1lb8xe43clDFrYUEUK
 WiHhlmj5iKxl9DCIy5T4dit8j2p_y5SepUQjHcmGrHHX3YQAapXn6b_Ny3.kPQ1cIRfJujEH3KSB
 K8RqbO37r2vcH784LY5SALVxd1LZUywX71rNqPX2UeZqRizNKeOoZ_p2hlp7Ar4qbwqDMP08By5O
 2ZdXmY2H9.SVcCKy9BXJqAKv_OfSmbnh0p1LWctDC00QE.sMYvKkg.BGKxy8cq30jW2Lo0EJF4UQ
 nQOO3UBloP0EY4U.WnUWjTxL4vuEYa7ELt9EjekyUIrJaxaVu9RPAeVzN4kzkwghtCAuuNDYGj3I
 oYgGXEzIYJ5EaguhlG07OYFRVF6lmRz__B7l5HGLfZ.gVk1Faufy7l71nMJMmQoShEKSNkfaO0_M
 ap.2WQ6L_lGTccamycA1cIayQQlvKbPjcgBNJdvoJHECRHLCujreNog3NEH5SIsGBlEryKV3Rf4G
 56cIBcWRIfOY9oTR1vUokiKycTNBH9R9oESVKrWgrQdVrQNUuFjJXnZv5vuBijL8LifXms6YKWvi
 NDMzaWXLG6ARwwLHcLt3_iXeEM39bRyCsFeHsie.0K74kbUhCE8qS.06AwJJkX_xcaiJRq2bIO9p
 7QxULgzLiwwvXPhWuOTj3GwWyVKrCgvlTIMAyvUAp7dEameHFMdbuWjPx229bH.MgpsEkHFY2Njv
 e2Nx3vR69XaeuPsSbLVYBgSxofSQf0bJc4MwvO9D_.iN9bD1WjCvkOoTnrWqHBDBKWGN75oA0l.0
 rjjE8javu1fUziZ.pdCZMt9Xg00yqe8yfGBPrzVVgP.ACoaQizlENgZdU1oeqkn1gMZa2nHXCPGs
 qQcZHuOqDnRubiGLmbdm0hC6scg.OQo7wwM0j7J3MUKHlxHnANDgu1tniexF8h_cC88SAd27dwMI
 fy_XxOypps2pVv7eqbbD5fgJ5mDblI9EisfNdDaNOT0EVvI2wH.0J5ANzrVn7CEOuB4Ec.pD4vcp
 AyUJj_B0-
X-Sonic-MF: <eexto@aol.com>
X-Sonic-ID: 6eea9353-79df-46ff-9674-4767c33e10fd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Sun, 20 Sep 2026 17:12:56 +0000
Received: by hermes--production-ir2-cddf86dcf-zc97q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1a1cd018961f573a62dc6df30444266d;
          Sun, 20 Sep 2026 16:30:20 +0000 (UTC)
From: Paolo Lazzaroni <eexto@aol.com>
To: pkshih@realtek.com,
	rtl8821cerfe2@gmail.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ohavrylov.oss@gmail.com,
	gabriel_v_maia@estudante.sesisenai.org.br,
	learn.rahul.rai@gmail.com,
	mihaildimoski@gmail.com,
	atailhan2006@gmail.com,
	Paolo Lazzaroni <eexto@aol.com>
Subject: Re: [PATCH rtw-next] wifi: rtw88: 8821c: disable deep LPS on PCIe devices
Date: Sun, 20 Sep 2026 18:30:18 +0200
Message-ID: <20260920163018.279705-1-eexto@aol.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ef40cf436a54a319ab228c19a137cc4@realtek.com>
References: <20260918232801.119348-1-eexto@aol.com> <2f2f2366-bf64-45d1-911d-6a769be9d7aa@gmail.com> <6ef40cf436a54a319ab228c19a137cc4@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
> Disabling LPS_PG doesn't mean disabling LCLK, I think.

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Indeed. bLPS_PG_En should be LPS_DEEP_MODE_PG which 8821c's
> .lps_deep_mode_supported doesn't declare this.

Ah, got it. Sorry, my mistake.

> First line of block comment should be empty.

Will fix this style in the next revision.

> I'll consult internally to see if we disable deep PS entirely
> for this chip.
> 
> My question is that are you 100% sure this can resolve the problem
> you encountered?

To be transparent: on my HP 15-da0xxx (subsystem 103c:831a), I was originally
using module parameters (disable_lps_deep=y and disable_aspm=y) while debugging
the antenna issue.

After your question, I tested my laptop with upstream default settings
(disable_lps_deep=n, disable_aspm=n, power_save=on). Using ftrace on
rtw_power_mode_change over a 1-hour test, the card entered and left 32kHz
LCLK deep sleep hundreds of times without any freeze or firmware error. So
on my specific HP laptop, deep LPS actually works fine.

I proposed this patch and added the reporters in Cc (Gabriel, Rahul, Mihail,
Ata) because multiple platforms (HP, ASUS TUF, Lenovo, Dell) keep hitting
hard freezes with 8821CE PCIe, and adding DMI quirks one by one is hard
to maintain.

So I can't be 100% sure for their hardware without their confirmation.
We hope someone in Cc can join the discussion and test this patch to see
if it definitively fixes their freeze, which would also help anyone who might
encounter this problem in the future.

Thank you for consulting internally at Realtek. I will hold off on v2
until your internal feedback.

Paolo
