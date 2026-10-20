Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481271;
	b=Sqc4g96xwkvr4AjK7i9R4naRpuG9pwIyeJx4Ls3h41X1OkCM6iQNwGq0aFufBZLBiEbk
	 jSErO9KkbO49z1twHs8OQHJIUK8+NDdjpRG1J6SfKpR9tH0K4Ih1DXO1isekejY+/36n3
	 vNIe2O/PImBSnGUr8vEeGv/m+u4MM0Y0EW04+7TZHg1F/YsdmpN3dB6j/nU/CUBVsMPw1
	 4LiNLmQIO0SXq9fUQT3mbxBZSrrf9L0Zw/Q7EmIOBnCC7iITSSZxKfrPCMSh1To8zLaXf
	 a+vnSv5GDYC16R0Rny2fD9GFrEYw8+3ClFaPq3ZdTqtU+bQEdoouf06AcUay8+Xtt5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481271;
	h=DMARC-Filter:DKIM-Signature:Message-Id:References:In-Reply-To:To:
	 From:User-Agent:Received:Subject:Date:Content-Transfer-Encoding:
	 Content-Type:X-Lms-Return-Path:Reply-To:Cc:Mime-Version:
	 X-Original-From;
	bh=3S6mAr4+Lbhhy7SvwBbseGpP4oIDnA2UNbYnrtUDz38=;
	b=BvSnoVxUikxt15mJPQrSbQH0iqZwnF7SZhljehvCBNyL4VjTnoPrvUKTTEQp8oaecI0V
	 6FkBF0E+u88s25cZLqYpDon/1iRW8iylQ9X9K1+2/mEScxo5xAm+QgqvmqBZmAjhuaSXS
	 Z6KT6lXxc2xL8/OrS5TduoXbrVhwJ5K6W3HvDdzPUccw/3dUHqQXFj5hs3X0odLU9MvB8
	 F3HPSOKp7BM8ut+2fh1cmEROlCY9gbBgEIFu3uDGKMbESEtiqm+RnGg8pYn4SPXy5liPh
	 bQ7MhOhKxb2BxaZJ7g1/bpqmcJx3zxU6ueYGtl/MQtef/siVB0UQAd+drDa3jppWULA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=fh2cEb3w;
	arc=none smtp.remote-ip=209.127.231.41
Received: from va-2-41.ptr.blmpb.com (va-2-41.ptr.blmpb.com [209.127.231.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=fh2cEb3w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1792481263;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=3S6mAr4+Lbhhy7SvwBbseGpP4oIDnA2UNbYnrtUDz38=;
 b=fh2cEb3w2GA/upVC+ovucD4sGv+63y/kT68iG3S1VmeDMavPpnIezkwYH7NhkujApEzdcb
 qWsNIUg1navYKe0F6htO2E4UZyPnAytISd1nO24xd6FusuAWeAypmwIqraWDnfzvcHgXiV
 mGPdngvS6/J6xrEAI85Qq1Pj9Nb1l70touVS2gN92u1ypqJnJ0RUngsiA5f4YumxkJYlES
 HnrDf52MUTlhYK88HFX2swcbNubOvcpv06uZEysvK6us7zcnIfkqDxH2imjnBzes8YmL+m
 hRwP3X3+W/KJcIIHc4/C7F8hRbTWZmwnNI6uSYPogbw/L+U5c7yf7KTqfj9Hug==
Message-Id: <be3187cd-c163-468f-b7a5-775cb2e57510@fygo.io>
References: <20260922060928.3486799-1-dayou5941@163.com> <fb8edfb3-ce4c-4b3d-87f8-70552626311f@fygo.io> <59377ab5.6b99.1a11f8ceb72.Coremail.dayou5941@163.com>
In-Reply-To: <59377ab5.6b99.1a11f8ceb72.Coremail.dayou5941@163.com>
To: =?utf-8?q?=E6=9D=8E=E4=BD=91=E9=B8=BF?= <dayou5941@163.com>, 
	"yu kuai" <yukuai@fygo.io>
From: "yu kuai" <yukuai@fygo.io>
User-Agent: Mozilla Thunderbird
Received: from [192.168.1.104] ([39.182.0.21]) by smtp.larksuite.com with ESMTPS; Tue, 20 Oct 2026 07:27:41 +0000
Subject: Re: [PATCH v2] md/raid5: use dedicated llist for stripe plug
Date: Tue, 20 Oct 2026 15:27:38 +0800
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ad717ee+ae03e9+vger.kernel.org+yukuai@fygo.io>
Reply-To: yukuai@fygo.io
Cc: <song@kernel.org>, <magiclinan@didiglobal.com>, <xiao@kernel.org>, 
	<linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Li Youhong" <liyouhong@kylinos.cn>, <stable@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: yu kuai <yukuai@fygo.io>

Hi,

=E5=9C=A8 2026/10/9 15:24, =E6=9D=8E=E4=BD=91=E9=B8=BF =E5=86=99=E9=81=93:
> llist_for_each_entry_safe()
> does not walk a NULL node, so I think an extra NULL check is not
> necessary.

A NULL check can still avoid an unnecessary spin_lock, I think this will
make sense.

--=20
Thanks,
Kuai
