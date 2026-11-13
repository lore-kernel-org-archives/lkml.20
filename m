Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554358;
	b=dfUODIr5WPjXAQhGYyn2HI9PM4l9Fmh2MP0F/ev3yBdy3a0c0XtIEzHAIjNVyJn7w8sx
	 OY/8oNhXUHFm2ZdNVNY5ZJGmjQBSL0rZhLyFb6O7IOad7obL1ZMd1wySVkV4oyH3ps0dm
	 Jv7vAl+RMt9WrGe89oDoFCh+6itVzEwCp+VgfwVEwmmwKMZQCZGD7fyhwoNA2JKqeicHD
	 poC8Uyg12jemqaeXu09oih4aShPpoe/+576iTKzQm9iIiAPyv8n54RyEfpbV+AZiftxRQ
	 UkL6fDKq2zjVUT6js0UEGRiY2gJqpjzBWuFXeIMJE5cuUEt9psStrS1SFlgbZs++Hyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554358;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AWUxsDJaecUXmF5aMikRGI/Ne552mmm401YbAvoyPMg=;
	b=vKcRZXn9XARYKU2cAVNArTjJOl6pS3OL0JQcVCxuoNAu2up7Sru5njDYU9z2nXisiPVc
	 aS3YxksAL5RNorcnNWuR+YrlnyzNHpAoEZBE2X/2zamxuHQCk3q2IhaV38zwvLT5CVjuo
	 GLYJdKhrib8qbKGyXFh6fV/fb5LEfsyQByQ5HY9KxB9YWM+wJExCykTe2qs6s7YpGBKG9
	 wCuNdCwyGEY6fgHF3nKuqYG0A3L1G15T637Ho7YdLzrRzsU53BF3JUdvqSpqbRr82L16X
	 KJvtTa5JUwmJ/EgZdAbSCHHUMt/Th+lwQSsodLmCiPpeKeHMHzHCVCnMxR0oAEuyowg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AH1NeuHi;
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F2606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 111F2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AH1NeuHi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AWUxsDJaecUXmF5aMikRGI/Ne552mmm401YbAvoyPMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554356; v=1; x=1795159156;
 b=AH1NeuHieHa4PwNlp2KcNNP5T6fMmhbjVylrK5Z2ff6jp1ln10/1j1iGz3Kaut3JDcVdPDuH
 nVIdyySV9+4C5Ddgm37cPMxWVkIVo3QDpPDN/6ksSoS8fbBtDHdVrYnnkDA/JxDnTSZcncvjP8M
 eVwu34vYUEWRz35ENVnP89lw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b4870678a27500fa;
	Fri, 13 Nov 2026 07:19:16 +0000
X-Mizu-Trace-ID: b4870678a27500fa
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 08:19:13 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zong-Zhe Yang <kevin_yang@realtek.com>,
 Kalpesh Solanki <skalpesh942@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v5_1/3=5D_wifi=3A_rtw88=3A_clear_RTW?=
 =?US-ASCII?Q?=5FFLAG=5FRESTARTING_on_stop_and_start_failure?=
In-Reply-To: <ee602061ce314b5a9741094b7b93836e@realtek.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com> <20261112131401.236433-2-skalpesh942@gmail.com> <ee602061ce314b5a9741094b7b93836e@realtek.com>
Message-ID: <9D4D810E-69D3-470C-BA90-3BBAC0788CC9@linux.dev>
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

Hi Zong-Zhe,

Thanks for taking a look.

On November 13, 2026 7:52:23 AM GMT+01:00, Zong-Zhe Yang
<kevin_yang@realtek.com> wrote:
> In this case, I saw you clear RTW_FLAG_RESTARTING in rtw_ops_stop.
> However, the reconfig flow might not have even run at that moment.
>
> How about clearing RTW_FLAG_RESTARTING when driver gets
> IEEE80211_RECONFIG_TYPE_SUSPEND?

As far as I can see that misses the stop case. If the last interface
goes down during a recovery, the restart work finds open_count at 0 and
mac80211 sends neither RESTART nor SUSPEND, so the flag would stay set.
Suspend without WoWLAN also goes through drv_stop(), so rtw_ops_stop()
covers both.

Best regards,
Luka Gejak
