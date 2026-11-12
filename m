Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518936;
	b=hUiilEvxmYUXFPYi8Px8EmkN67RRXQ/4J/J4p0PK40bFxlG2EsRKveQnDQvkNLJq+KZd
	 c0mC7Ci1nE3MbXheFm8PmOGs1/M5Mj4PCWfAltk/G4L/wxDxR/bFXQZeA7f21GrJ5Cjqb
	 Z123hfsf4VnGtUMC1MqaBtz64fd5Jj1stxUDeBJPEWtnm9r/NxYBaDfmF6DhDKXABu0iD
	 P/pnj9Xh7giYzMjpwCuv7r6DXax/rvYJ7QqzBIYXvxIGa92rru6iaDn3yuRy/nCquE+Pi
	 xRo/pRgDMnmHv+h/BB7B2ylMxfXWNoUfsSANHUo6OMAzKOYMgaIFEzvuN2o0e6BwXgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518936;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pzlq5o6tDF2OByZqSgFIlv+mTgpxtocxWTJ+jzA91r0=;
	b=GjvT6dphAtoQpuMkQHwN50IYeTchZl0rzIdXlOrXwbeCjnZzMiIRdj5VhzRlS0BTK1Yz
	 nYFPHY2XrFwYNMAQyt3ZAOA7ySA73hLYzIBKtCSXnlFs6wmPaJTmI6IvZOyxlEkxPZd5J
	 D73Tn5g3LNszjSwhCIrzwz0iQM7wJKkqC/KBKEgeqqRd28z4m60cVHLAsoe4Vqr1AoFET
	 /IrRCasDkZ0S1s72h/AHND3EDgr7ugVbezSSMEbOJdDX8QLscHINmTrIHHFvSZxiz7yZJ
	 9rYLPX0Gff3Gkpr0fgYSaTckptuLYcnmlFxUxiFGNeIiBAASNicSfQZ81mGb8bzKOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K8YJUhHq;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1276A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K8YJUhHq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pzlq5o6tDF2OByZqSgFIlv+mTgpxtocxWTJ+jzA91r0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794518933; v=1; x=1795123733;
 b=K8YJUhHqGxA7XgVfSepSKM8fkrUqXgSYLqwGVmNpKneIDVmRTOTBnE6MmtKFYFSllf6I7geg
 jeb8RjD5PwnFOsup1dZOLPulv1vY78TNLD5ITrrXC0s+DfJCuDsAsOfcz5MT3VJrm3v3RA5c5Ap
 x3vdhc3shB/6Rs8WrNdDj5T8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 831542d396af7fc5;
	Thu, 12 Nov 2026 21:28:52 +0000
X-Mizu-Trace-ID: 831542d396af7fc5
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 22:28:50 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_1/3=5D_wifi=3A_rtw88=3A_clear_RTW?=
 =?US-ASCII?Q?=5FFLAG=5FRESTARTING_on_stop_and_start_failure?=
In-Reply-To: <20261112131401.236433-2-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com> <20261112131401.236433-2-skalpesh942@gmail.com>
Message-ID: <24B0555C-4ED8-4403-BBD1-0E82611F0BFE@linux.dev>
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

On November 12, 2026 2:13:59 PM GMT+01:00, Kalpesh Solanki
<skalpesh942@gmail.com> wrote:
>When mac80211 stops or suspends the device without WoWLAN,
>drv_reconfig_complete() is never invoked with
>IEEE80211_RECONFIG_TYPE_RESTART. If firmware recovery was in flight
>during this transition, RTW_FLAG_RESTARTING remains set permanently,
>blocking all subsequent firmware recoveries until the module is reloaded.
>
>Similarly, if rtw_core_start() fails during drv_start() in a recovery
>restart, local->started remains false. When mac80211 cleans up via
>cfg80211_shutdown_all_interfaces(), drv_stop() returns early without
>calling rtw_ops_stop(), leaving RTW_FLAG_RESTARTING set permanently on
>hardware that failed to recover.
>
>Clear RTW_FLAG_RESTARTING in rtw_ops_stop(), as well as in
>rtw_ops_start() when rtw_core_start() returns an error, ensuring the
>driver always exits the restarting state on error or teardown.
>
>Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
>Cc: stable@vger.kernel.org
>Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
>---

You seem to have missed it in v4 so please pick up this tag in v6.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
