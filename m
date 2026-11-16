Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816416;
	b=WAeAoOvx+2/yQa5S5M2G1+XUcSyQDGuAQZrFyHCwxH2/XZ4cDeQBLaDoLeQBFE2YkdgS
	 CWuDie9zMHSkgVN9c+WBgWZ8Uptp28oob+TS3yV/MaI1dGDdxoDDc/SX3Qrpysulpze5W
	 UZwKFqbyuAq2EqRAtmKL6f2iDajNCsQ3l6rZzYlfAfkkX/1BWyuqF0kXX+Ag45ebeJrJ/
	 kKgFmeGYLPU8yQhs6PV3GqsAezbjnRFYUsS1Sl6Q6tq9HewsowbQhpzmnXERWcZGaLA8P
	 XCQ3frDIDHE5tsrTJNty8Yj+pgElLIPr/199Icc2Fk/LKpvE37aBba03dSEXMvf+99g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816416;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mXEm4ni7IMYJDYClmIxXaOLYx9r6MmPpSBwKJoKyoGg=;
	b=ouhTiPlZQav/EgPMZZsWifmG/69lHQCEb9gvMRxnilBfjorgCZep7z9IYEk+0F3UHRbh
	 Br4Gk1ntPI3YEJAu2q9bUIbw71Rp8BoRHumuob6r53f229zFimoOEMPtZ5aCF5uA8JmnC
	 5SyKpQX3H+emLusWCkd6YpzxjtbcbBO0ZiMcu8XXw8ADtYkWG08v6S+2iJ5Ls+idrsDYj
	 jQmAMZJrqj+tx5rtb1ix9cbV8MOFjfvTVpVCHg3PaIQsZ/mlEjbv1uGcudew+m/LWrsJy
	 rQOyLApI98ItxFPT2K7tn/JENb1ujRALA35P59CXrmEX2Jl3V8F+qbwKiinYFHxkxdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YS7RHOwA;
	arc=none smtp.remote-ip=91.218.175.156
Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDA0606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDA0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YS7RHOwA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mXEm4ni7IMYJDYClmIxXaOLYx9r6MmPpSBwKJoKyoGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794816413; v=1; x=1795421213;
 b=YS7RHOwAubclZJWRLzxzjt9qv3Td5KTpEb61nrPdiuDnrAUkqDxfHGJwPYnjdDcZSuEY83+j
 2zQRf5ThYhCwY+hJOPxKM62lCMAzLqHA5950YZ4di5U2avmx+JWYxGs8qmgmQ+Fd7tzvn/EPA31
 zwckg7aBml682T09GOlOQEMA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49a111c8c3a0b835;
	Mon, 16 Nov 2026 08:06:53 +0000
X-Mizu-Trace-ID: 49a111c8c3a0b835
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 09:06:48 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_1/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8814a=3A_enable_STBC_for_HT_transmissions?=
In-Reply-To: <CABOQOSU4Oebap-U=6oGa_VQsZwm4szumK93XFJ__w0Q4f25=iQ@mail.gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-2-hjf3108@gmail.com> <56FC313D-ADEF-48B2-BBF5-A4DFAC129C3A@linux.dev> <CABOQOSU4Oebap-U=6oGa_VQsZwm4szumK93XFJ__w0Q4f25=iQ@mail.gmail.com>
Message-ID: <4E88B598-B337-49A2-92E5-AE122A6B1D85@linux.dev>
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

On November 16, 2026 7:54:02 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Sun, 15 Nov 2026 at 05:35, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> Hi Jie Feng,
>>
>> Thanks for the update. Two comments below.
>>
>> On November 15, 2026 12:43:27 PM GMT+01:00, Ho Jie Feng
><hjf3108@gmail.com>
>> wrote:
>>
>> > 8812a and 8814a support STBC, enable it.
>>
>> Could you mention here that this enables HT TX STBC on these chips? As
>> far as I can see, VHT TX STBC was already advertised when more than one
>RF
>> path is available, so that would make the scope clearer.
>The commit subject line already mentions HT explicitly, do you think
>it will be better
>to put it again in the description too?

The subject makes the HT scope clear. I think it would still help to
explain that these chips already advertised VHT TX STBC but did not
advertise it for HT. That would give the change a little more context.

>
>> [ ... ]
>>
>> > Tested on RTL8812AU, STBC packets were captured in monitor mode.
>>
>> Were these HT transmissions from the RTL8812AU, for example on 2.4 GHz
>> or with an HT only AP? As far as I can see, we already advertise VHT TX
>> STBC on this chip, so a VHT capture would not confirm the change here.
>Yes it is a HT only AP, I see HT STBC packets in the capture.
>

Thanks, that answers my question.

Best regards,
Luka Gejak
