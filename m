Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550713;
	b=YgjVBqs6Hs3vzBZAjOrhSTH0wjpvwT2pHqdxYIob5rddD28/gY2hA4+9I8qL49zNlFJR
	 O6ECxABmgor5/UdpTcz44kFY1IHQF17MIuvo5qgEhtpIAGRA3mLczH7SrkDt8cclX21Rm
	 sDT4oV07aZyF+o0Aos9DUk2Qv02/az16r/xJUB4oj8f0hc0JlIE8fdT1r7F66CuukeeOu
	 5L4RlA6UKDXrdlH7zDWba/bcgP+TXO2XngOYigVG1KsuoD529/E/LPEvCzFmfFmCL0pjm
	 XTkTNbZ4oKiE8Tk+PSVu7seoVMSuDiDz5UTIu5rChzRRiBfPCXeu0G+3HGrmwOVy9dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550713;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8fhtiSM4RMXSPkWZ2Ym+TAinvYmR3dBhlVKb++Zid/U=;
	b=fku29fHwEw1w2Q4KvoinbBTq75jLwifO3RHcWlgXmg3uVNAfX+1YrMkn4E2A8GiF6cYH
	 ogEck+UU047M4D1/QQrPrGfsXixD2mptpwfY3chlRX0Z8csMdA+Io7ZRsuMd6Z+I0cqmH
	 9AAYB2ZxYqj8m6TnlEc3SMu+cYUC5PjMphl05iiUYIJd9U5MTUb/A3OB5z1yHc+Yej7ZF
	 GwVwdic5X/2uxsRBIxQdbQUC4AiUvuagRuHIvrw+2Y8YrfPYqLSfC5bMzyT/n/qfHRclW
	 h9ZIv4vY+f1kPgT3rvKph57nggViyGJM5+piF9nldDNyE4J34D/Vwb546JL8woluLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UPv0KjcG;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE5606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EE5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UPv0KjcG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8fhtiSM4RMXSPkWZ2Ym+TAinvYmR3dBhlVKb++Zid/U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794550710; v=1; x=1795155510;
 b=UPv0KjcGCKw2FX6TaL4to0xlRFVjY0mChqj9N3zuAyzD7EB444b4uWLUSUZBiJ1RxWSIKkdk
 /wFJEVIL8/KsCMhYo8wWf7Z6XE4/FruiG145XXVd+nyj4FvsWrseMR5AF/1VTY3CSOEwgTJFc13
 ZS4+/Rz4n4DNcRgBHRB9NnF8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3a5ec91a947c39f8;
	Fri, 13 Nov 2026 06:18:30 +0000
X-Mizu-Trace-ID: 3a5ec91a947c39f8
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 07:18:28 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_2/3=5D_wifi=3A_rtw88=3A_skip_al?=
 =?US-ASCII?Q?ready_reset_station_in_rtw=5Fsta=5Fremove=28=29?=
In-Reply-To: <20261113034704.21283-3-skalpesh942@gmail.com>
References: <20261113034704.21283-1-skalpesh942@gmail.com> <20261113034704.21283-3-skalpesh942@gmail.com>
Message-ID: <5369FA8B-8D0E-490C-8CA4-7D572DF9276A@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 13, 2026 4:47:03 AM GMT+01:00, Kalpesh Solanki
<skalpesh942@gmail.com> wrote:
>During firmware recovery, __fw_recovery_work() iterates over all
>stations and invokes rtw_sta_remove() via rtw_reset_sta_iter().
>
>If recovery is triggered concurrently with station teardown (such as
>during ieee80211_set_disassoc() where mac80211 leaves LPS before
>removing the AP station), rtw_ops_sta_remove() is subsequently called
>for the same station. This causes rtw_sta_remove() to execute twice,
>leading to a double free of si->mask and an underflow of rtwdev->sta_cnt.
>
>Cancel pending rate control work first, as rtw_ops_sta_rc_update() can
>still schedule rc_work after the station was reset. Then check si->vif
>and return early if the station was already reset. Clear si->vif,
>si->mask, and si->use_cfg_mask upon removal to ensure clean teardown
>and avoid a NULL pointer dereference in rtw_rate_mask_cfg() if mac80211
>re-adds the station across recovery restart.
>
>Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
>Cc: stable@vger.kernel.org
>Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
