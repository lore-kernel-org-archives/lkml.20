Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313648;
	b=TogTtg52SJ/1WO+/mQO5tM7I6pUB7of+hOnG2WRoozdVYAJ6D+ojUeyXQvSB+tOm/6cS
	 Onpsm17uWqR926gpzC1FQx86PAgwsfaWjQ+DWADLZ5dRwK+s6AwvdlsuCDlp16FwXWeT2
	 mlvpxqxObMOtUBoMlElSveZK8g4qgfOzQl2X8lbKV70i+W8oazgUH8NN1d+zuhHV4bbGZ
	 d39uHLdcHhJq/SALYquB/P9AnJOyuTkNPOLK+DBBQHpXdbA/SSMUNfWBW6U6OlRWQMAqv
	 3u30+BiAal30S7gY0ARbCV/gtnAQ46r1GixpXBdyWkWkOV8Dvo+gRT0QZaZolUzgl8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=v26TLKrWvhVgWLQBFxdA5doS6zBCcx6klRRGMpDzDpQ=;
	b=PWwxVXWZEUId6Leqqhv7/ElIIvFoBb6O+KUwWFXjZP8jibHfT8M1bqHeap/U++WZXvUN
	 43P+bONaBZRj6rzo6P8CGUvL2qemGHwcGV5gp1bmL8V7IMETqsrGtQwA7RSFu9kEEp48B
	 HKHJ2w3uVp3+fTCsCyYjKK8z7BB65mpdp/mo5H9l2QIruQVcjPn/v0RI9bJifGrP41lMR
	 ltHtC2CCPdC1um9b2La6t8+7HK/ogHHvHBYL/PFt5S0LtgiP5talS3WkhmsHGPD+OZKPV
	 zld8Yg+p36rq+rDdkcWApbs65va27G5UMH59KGne+NTMKtsIccuOXM+IEBhN5w4rzKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HoGP2nR5;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C03606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C03606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HoGP2nR5
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso647515e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313642; x=1793918442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v26TLKrWvhVgWLQBFxdA5doS6zBCcx6klRRGMpDzDpQ=;
        b=HoGP2nR5HnnMREdHMmKLvXlJ8MTuqKsOFRx/lsPQVihkPjTkdxtrbcPTGdJogArE++
         gS1jk7/zpISKJW3LOSu+IC6Xr4H+IEO/h11hg+rnVy1EEoEvHdz2n1YGscTVT5IJltWa
         Zo7bmfcQDSNDoeC4p8dmRgYgYkMZOnHEIEvbY5fywv1NhzyId/5XGTosysU25Ku8Zzq9
         CuMgQAAwBDMwqaUVvbdHwYlvfNq/rGLbQlAz0RzGxv7dr0tyxyLckapmeBee79gdzeBJ
         Z7KwK2wybM5BJviJt2alV9iPY36Nx4LHT8LgdHLflIoiDZNACbWhvL4gH5IRJjeEsJ2D
         Zz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313642; x=1793918442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v26TLKrWvhVgWLQBFxdA5doS6zBCcx6klRRGMpDzDpQ=;
        b=TPM/+xVmPyjsp3DI/hkx+WeaMv3YBZku/MJjDcSXj1naBVj0e/YxfycyKGZf3E3ufV
         ImYmx/MbOIbN6eiDxoPpReNU/LwGwmzMOBrxNzIXgZaH6Bclnl4iFWojIDd0ZN8Qa7TG
         wJ9iYSrwRrTqXM+f615NxrHkNBiTeSdUFJR3GHE8qBfeZOu1/HsSFc4rG2gi0KdKedER
         TOAYm0+IEkKRe3VloUcdHSPH0g5DQzpKCqa0sJjzRStBhfmXGp6M/gWbMqa1CsV2XuWN
         L+BM5ahV+eXGuK1fX4akow+UdSCLcdBbyQDLFLTJbNFEbiG1EO335v3udOMyeyiFTtss
         ADPw==
X-Forwarded-Encrypted: i=1; AKwUvByIoV637yRLL5l4GOZYB05Adc2uFvoMYOuhpKFNL1oTHUZ8g3Mb0W50hwerASVq3+yAIQdkPbc2X73XEuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKmzkj6VNYiefnwSh6ecWWOgAYUvrGbrUH6EK6wQ1K80KnayaW
	AWqA0baN71SBwE6B0bBG7FO/aUTpFYK7qKW3EvWfO7731nvw0KfBSGZG
X-Gm-Gg: AYBFou1WPSffYWo6clvSo47jL06txNpPgtabVsEg3EzHdjzJuJETpKg+F/Xa0RW+x/c
	zSa01MRipE78dLahXE65D6kpArjkf4FS8sWGHUDQ3SaadRo/Q9usP7Hs7YmucupW98EQj84m+GN
	qtHMv1tOZadXZqdS2rDbg16stKG2IiM1Lj2dKzFzYymzvYZJ//8jHPgQgh5KkCnRyzItQbQNouL
	aRd2+g8uin8txJRbb7CwiaOjRPUVjgypO5JXaiek2hyN+mvymcEo2SQ8VJBEnpCjh1Jnete3i9h
	4bCXbzzsKPi3lPcFgJQ05Q6RSZKQTeG+ZAd/nZ4rrKZzJWzA4fQJ4/zeiJWyIIX4gz36uSLnr6I
	d3Dg7Ad7W04W/+AvVNLOiiTt82Gn1Jp/SIFQz1Y3odObo5oijh9PftjGdljwdO7DdPuZ0CECHqJ
	EwHqNdAvw6fjNt6+7OGGkBRMwaJI+IiQJcqwaMhBQUazFXLcCHXgeBK8d6STceoDMwEg1ZvK+sI
	1vo2FCKliHS/PNHGwCB+Jqc7NhZdgTs8/dcyj2SUtH/izBWHfxGkcV4JbqPvuU6UHvUFBToU2tJ
	ej4N6OpCrd3F+mFXlx0IDsvM4ZwovvMWRMByORc=
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr8730515e9.0.1793313641519;
        Thu, 29 Oct 2026 15:40:41 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm91144645e9.15.2026.10.29.15.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:40:41 -0700 (PDT)
Message-ID: <14736869-57ed-43df-986b-8b24ea9772dc@gmail.com>
Date: Fri, 30 Oct 2026 01:40:39 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] netdevsim: reject port addition and clean up ports
 after a failed reload
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abini <pabeni@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>,
 syzbot+88435e204734072bf39a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261029145844.231018-1-omermetekaya0@gmail.com>
 <CAHS8izORg8OR8TyWBHmZsgFBtM3+qh7gXCJxifk1QGs13Q=ygw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <CAHS8izORg8OR8TyWBHmZsgFBtM3+qh7gXCJxifk1QGs13Q=ygw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



> 
> net and CC stable for a netdev sim bug is extremely overkill. move to
> net-next with the AI-review comments fixed, if any. Thanks!
> 
Ah right, I thought I should put every bugfix to net. Thank you for
informing me.

Thanks!
Ömer
