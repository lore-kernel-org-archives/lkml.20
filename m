Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206177;
	b=CZPhbGAFW94xHkxbxQKfk3kRH5erxMGBcJU5Srk9Lofrbmhp9b15UjCZhViq+CUfhzYc
	 x6b4X3VqWIBFm9tQufE/HSx0uhWX3EA7QlGuMdORwnoWoR0s4HakSXvfbGB3kV3ni6r4V
	 3Lad1B10m0XBBxH4/QetHMH6Qb6GB7YrA9gQbC6RIm1Ytcvzx0AhID1RYsDZuRyU1SIJs
	 /h48kMyn2J5XTYtxw1ZNpRQQnwkboWQMa73iL1oWmyJK9JIVWqTeAaubevymtUtjYVNtc
	 3+d459JOXqni8pO3VOPGdd2tcf1OjepbI5JpEEVRDspFVQoVbsT5nhJpBi5Bx1Tl9fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206177;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ubVAfROa20NibdINJspeiownyQQhZxWkDLzw1XkPqbw=;
	b=xki+O+Q29OnQk4B5jxwuR+UxrJW0BfttTqFYqEANNSLN5p/jC+zbFzQIIUNadve/GpLC
	 cedjKSSE83bHPj1QNAdajtvUyi9doG5v1gF/QWuOwSVNYxCSle8iOHMadGVfbAxnGVqzs
	 HyL7OSY+yAdDE3LiIO1+FDArD0r1h5VN3EhZcMVK0d2s/k2C/wXYczP/z5orW/bDFPyjE
	 n8yDhL8cHWwMOUEJYYbuIUICpP0O3R29+P0w2KQkPo5lpCpmrpjtU2JitxEOe/QWLZNpe
	 r6ib/1tOnZ5uMuSpwzUfsPkf8TPHA6EDquxXV3dGh5hJmem3CwclcUKzDhY9Hwdqo8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QdpOdgjt;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A85606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A85606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QdpOdgjt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nED5IjRRVS9zufEnMoKY+EwjY9VykfLJN7/PFD533sk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794206174; v=1; x=1794810974;
 b=QdpOdgjtixd+BcIyK5mIaHhCDj9c/ugMSlX1jNERO8LlPu/V4HArcZCYA7T+6Ykl1kNR26Dn
 hZsduDFXMVasRteUT6mWP33Wxo9y6EW9SjOr6fCTCgR7RxsCyCyVk7w+xstHC7WQe5q9663Iu5e
 Nw0wHL0a2/D9DLHE6BeKxUXo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30777b2291c593d7;
	Mon, 09 Nov 2026 06:36:13 +0000
X-Mizu-Trace-ID: 30777b2291c593d7
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:36:08 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v3_0/2=5D_wifi=3A_rtw88=3A_firmwa?=
 =?US-ASCII?Q?re_recovery_fixes_and_LPS_hang_handling?=
In-Reply-To: <39750c895e3b4dfa8ef98a28503f25fd@realtek.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com> <9fd1c42c5df94629a21c41dd08645b96@realtek.com> <27E9A60D-26F6-41D6-B74F-7DEF998C8498@linux.dev> <86803b2c13a74ada92ab73e79f38164d@realtek.com> <B1CD522C-2CC2-4913-8175-05F0D25CF65F@linux.dev> <39750c895e3b4dfa8ef98a28503f25fd@realtek.com>
Message-ID: <1AF1A633-859B-42BA-9B2E-4B8081BF09C7@linux.dev>
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

On November 9, 2026 7:30:52 AM GMT+01:00, Ping-Ke Shih <pkshih@realtek.com>
wrote:
>Luka Gejak <luka.gejak@linux.dev> wrote:
>> On November 9, 2026 7:12:52 AM GMT+01:00, Ping-Ke Shih
><pkshih@realtek.com>
>> wrote:
>> >Luka Gejak <luka.gejak@linux.dev> wrote:
>> >> On November 9, 2026 3:30:58 AM GMT+01:00, Ping-Ke Shih
>> ><pkshih@realtek.com>
>> >> wrote:
>> >> >Kalpesh Solanki <skalpesh942@gmail.com> wrote:
>> >> >> Changes in v3:
>> >> >> - Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
>> >> >> - Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
>> >> >>   with Fixes tag.
>> >> >> - In patch 2/2:
>> >> >>   - Count consecutive failures before triggering recovery
>> >> >>     (RTW_PS_HANG_MAX_CNT = 3).
>> >> >>   - Reset ps_hang_cnt on successful LPS leave and in
>> >rtw_core_start().
>> >> >>   - Suppress raw register dump on transient failures to avoid log
>> >spam.
>> >> >
>> >> >The patchset doesn't present in [1] nor [2]. Please wait a while to
>> >send
>> >> >newer version after it recovered.
>> >> >
>> >> >[1] https://patchwork.kernel.org/project/linux-wireless/list/
>> >> >[2] https://lore.kernel.org/linux-wireless/
>> >> >
>> >> >
>> >>
>> >> Hi Ping-Ke,
>> >>
>> >> The linux-wireless list is bugged and nothing is appearing on it
>since
>> >> 2026-11-06 15:46 UTC. Aren't patches accessible due to
>> >> linux-kernel@vger.kernel.org being CC'ed?
>> >
>> >I think not. I sent patches to linux-wireless, not including
>linux-kernel,
>> >before, and the lore and patchwork of linux-wireless can capture the
>> >patches.
>> >
>> >
>> 
>> We are having this conversation on linux-wireless, aren't we? I don't
>see
>> it and my lei isn't picking it up.
>
>I think the mailing list still works, but lore/patchwork got wrong.
>

Possibly, now sure why lei is affected though(I am not sure how lei works).


Best regards,
Luka Gejak
