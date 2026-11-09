Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205316;
	b=U+Nyb3jw6/hCetufZHl5HYe4C3RUY0CGEhV53mSzT1+sMseTaH++KgAJaxioe4Z/nqSR
	 Bh3Z4+O7ugM4/Id85ply0jZlN2qDPtG7URM1ZWI9glfH6Xk6HOdIPnkiQDjpK8oU0kh0l
	 AmkchS0w0oz2Xs/yyQZUmuDbeV2uHg7lp8EEQA49wm3fhZBzgZLtsqbGmOvyyP1EizSGY
	 Qj+MR73Y/hiwCpoly3IKhtpyh8CVkmnM0czn6mSfsSUCM8woZ9Bj1rK85xMu6Ka7s2+lt
	 tMgFfx/4U2Uv5+CFNtpmSw7uCdFofysMbkpC8uBOIVyRDXqK4H+B9mvAS8rb9Ynn1ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205316;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X4oPqQzUTCF258jLwJeEbnqRkkLBozRE8pL/5tusbYg=;
	b=e/0f6KoVzyhd7Y+1X/fUHabQPP7LhFawpxjtHEGlNbBaeX1Cmbhq4oShdz0bC4EwHbCe
	 mpd2wYxL8mwqEVJg8G1HpH2PGQ9Ne/xnKw49D5UmVRzT+tM1RNigmtcZaN9yPaK40obfK
	 olbpiN31SdsGqQIOQN6xbVGse5iPwsS2hDuNKMkgRdvyDHeGR0bwPF4chMdivamUY5p8/
	 2qCBenlCP1jevszMT4/j7xYGI/7ZK5YdjxfyAKL8VtUGCkMzV+osW96Vy3FkW+PSa3ayB
	 JAgsOD34Zibu2mbCIvye34LsYmi73vGFUz97ifg/AIbnz81ZAjmjU3atTgmaJ2d5WBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GoiJvpCp;
	arc=none smtp.remote-ip=95.215.58.68
Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE6606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GoiJvpCp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MsYBkJeOLSfLNgzVOHX6M1aMi6+tZkDhL2lyZNSd2Y8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794205313; v=1; x=1794810113;
 b=GoiJvpCpgiAfmSVZlipl4wwZc2ZlBoOjRbb5Xa6TfSjFh9iVnnzFb8HDG1vZ/BmIwubONSyx
 9NQPdS15fZtT9GN4+ZqUJUt4UYdqfnM+Y6QCmjcDn/8hWY/MObP2CXTnc+6w0slhjdMy1K3dMa9
 AAifiaNTWSJg7gsFUYE4kkw4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a5b9ee4d79ad13a;
	Mon, 09 Nov 2026 06:21:53 +0000
X-Mizu-Trace-ID: 1a5b9ee4d79ad13a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:21:48 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v3_0/2=5D_wifi=3A_rtw88=3A_firmwa?=
 =?US-ASCII?Q?re_recovery_fixes_and_LPS_hang_handling?=
In-Reply-To: <86803b2c13a74ada92ab73e79f38164d@realtek.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com> <9fd1c42c5df94629a21c41dd08645b96@realtek.com> <27E9A60D-26F6-41D6-B74F-7DEF998C8498@linux.dev> <86803b2c13a74ada92ab73e79f38164d@realtek.com>
Message-ID: <B1CD522C-2CC2-4913-8175-05F0D25CF65F@linux.dev>
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

On November 9, 2026 7:12:52 AM GMT+01:00, Ping-Ke Shih <pkshih@realtek.com>
wrote:
>Luka Gejak <luka.gejak@linux.dev> wrote:
>> On November 9, 2026 3:30:58 AM GMT+01:00, Ping-Ke Shih
><pkshih@realtek.com>
>> wrote:
>> >Kalpesh Solanki <skalpesh942@gmail.com> wrote:
>> >> Changes in v3:
>> >> - Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
>> >> - Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
>> >>   with Fixes tag.
>> >> - In patch 2/2:
>> >>   - Count consecutive failures before triggering recovery
>> >>     (RTW_PS_HANG_MAX_CNT = 3).
>> >>   - Reset ps_hang_cnt on successful LPS leave and in
>rtw_core_start().
>> >>   - Suppress raw register dump on transient failures to avoid log
>spam.
>> >
>> >The patchset doesn't present in [1] nor [2]. Please wait a while to
>send
>> >newer version after it recovered.
>> >
>> >[1] https://patchwork.kernel.org/project/linux-wireless/list/
>> >[2] https://lore.kernel.org/linux-wireless/
>> >
>> >
>> 
>> Hi Ping-Ke,
>> 
>> The linux-wireless list is bugged and nothing is appearing on it since
>> 2026-11-06 15:46 UTC. Aren't patches accessible due to
>> linux-kernel@vger.kernel.org being CC'ed?
>
>I think not. I sent patches to linux-wireless, not including linux-kernel,
>before, and the lore and patchwork of linux-wireless can capture the
>patches. 
>
>

We are having this conversation on linux-wireless, aren't we? I don't see
it and my lei isn't picking it up.


Best regards,
Luka Gejak
