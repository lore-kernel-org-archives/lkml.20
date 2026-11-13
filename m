Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559150;
	b=0VSn9qlCLtqkcsOr1FOa40A/lz6cwuVqSQ0HIQYRGxbW/5hkYNsvSYcStaMmFqAZ/CRr
	 7PinLBpJEIG+ysRlZQhLhuI+i8D/Gi1S8kb18d4pzE1s8sX5/s4wk3QxAhiiIUgUPLn1S
	 7eLtYxn7uXe4rYQmCtN/d4+yLAion3f7dwJ04tQqe1iDOd9lQYU2jGh5ZkQgQiAr6S2Ya
	 ScJVdvOIMUueDvf+i8xaYJpCvoX2KX8+mEb9jNWi175NePA5Vx5khpkkf9VdJVVroOVd5
	 /oTbrl5KFcJ9H0xSku9qW5jb2O+D21D1wJGFIGK9sKbHzzIuOwR66DcKaWG1MM7SR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559150;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1r0OgxKizKImcA/Ft8uKBN3WYC6jGc6YEeV4L0Lb72k=;
	b=m5JrHzlx5mVsohNLAWCxtjawa0zha+Vu/4U0bQl9wbNjn5MCAh+rDVIytraGtLqbOn8M
	 yF/IehZDEOOBis+03Irgu0EhBqVmyDNNXfwetrbsdlO4oCWGfGml0XqWeZhOg/steOixE
	 iplxurznehIR64JvpN1dvYX7f1u7sr2eTz1t74PQGKpFOZc6v/pYl1592KZTq3wmXFwyP
	 ZINq8YyV25Rq9yw0k4OU50xuf2Y4hXYPkRh/oVGURLLP2hQcpCJTBG+ocuk61VCKYQGPp
	 Wi970UPE4few3/3QSpyQeJDy2HLYLsWMqIxgI68xt8DmitSk+9N1obHb3xuD2dgqwdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RxrlZ5so;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835B6606B1CA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835B6606B1CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RxrlZ5so
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IwsEcXCXpDBtVOqX95LYubK4Dq7YpA/j6PRlrfIU4xQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794559147; v=1; x=1795163947;
 b=RxrlZ5soRKeBu6a9iMuGQgznL+mB40qoeBhCcbuu6ckfJaGFx6wjz8oC8FQspoDZzPZPAiPn
 QtRWvVSbBvN/ITD0RWrkis1crxkrmkCnL/xESqdwTrHj8zFN13g2dKr+HniMkvaHhM6y2MNUCIt
 8C6WjPQTpEY8LWL97EGUvNQM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9518f2913e5d6754;
	Fri, 13 Nov 2026 08:39:07 +0000
X-Mizu-Trace-ID: 9518f2913e5d6754
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:39:01 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_5/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <CABOQOSUj9R1qHJh5M=TBi8Mn2YP68cuYns93R8jS0qK8FXZC0Q@mail.gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-6-hjf3108@gmail.com> <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev> <CABOQOSUj9R1qHJh5M=TBi8Mn2YP68cuYns93R8jS0qK8FXZC0Q@mail.gmail.com>
Message-ID: <52B548C9-3F5A-424E-B523-E8D51CFD8000@linux.dev>
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

On November 13, 2026 9:16:33 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Fri, 13 Nov 2026 at 16:10, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> Hi Jie Feng,
>>
>> Thanks for the patch. One small question below.
>>
>> On November 12, 2026 6:32:44 PM GMT+01:00, Ho Jie Feng
><hjf3108@gmail.com>
>> wrote:
>>
>> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> > index c8008cf43d..c8f5cdf31c 100644
>> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>>
>> [ ... ]
>>
>> > +static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8
>factor)
>> > +{
>> > +     factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
>> > +
>> > +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
>> > +                 ((8192 << factor) - 1) | BIT(31));
>> > +}
>>
>> What does BIT(31) do here? I see the vendor driver sets it too, so I
>> think it is right, but a define in reg.h or a short comment would make
>> it easier to follow. The same goes for rtw8821a_set_ampdu_factor().
>I reviewed it again and saw it, so I added it to be at parity with the
>vendor code.
>

Can you add a define in reg.h or a short comment, as that would make it
more readable?

Best regards,
Luka Gejak
