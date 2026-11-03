Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793724275;
	b=ZPJQOpKDCMy+DBjxhTglvHVrzK9KRvB0zYDrKuE4Mz2s/PJA7dqbyqK1HnVobkNfykXO
	 GHy8kUBS6DSalENbE6D4Tw35FVNIk859VDVdTX5C7tQj/KPIGASaMLwS97QjMVHFV5KwK
	 bQe2qxRnZBFzb2DrPTHM3Qsu544E8JP4DFPYfesIiiUToNhhIYo0VnlqNI+dgvuLaoR9p
	 P9Sj+KqYHX4AR8Joa9OoAWE5TZckjiyYyHkmgNMsi/K/iuE8VEj8/vwJENv6AV+Rw9VKp
	 KZrZ13czsD1T+3HzcpAfqvvYdPrfy/grh1rMUtFfZl32D4H+VWOf9BF6N+qbGagGm3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=;
	b=UrmcXP5fpnapkF9jlT9TkBSnlOLdT6W6YTj0xyGYzxMej6ljnbfag5byd61lOKrEdgFr
	 nCPE12p7SKUMnn8a9JO7SvHKbJOh6wPQUwlzHsrDvQvTK514ogAbBC3yQi5VFVWVpCslQ
	 gYSkW8SRRm/yeGdXgtAuCvsB3tIUHFE8TLThAFIh621v0Srho5Aqdo7WaKQT3eaimMD+f
	 2LAKVTh/aE2kl3C5qFKbyPKVYj2wXbdEvRvPwcGqxLxfYvXutNBGnrofw6woWuTaZeBwl
	 rS/xJ+q6FURuOLReWBdbP7ZP3W0X7Rfc6R3I5gAvYXQfdkH2727FDkPZhca+pRR4m+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nagashi.ma;
	spf=pass smtp.mailfrom=nagashi.ma;
	dkim=pass header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=OKQYqAhI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0072D6082BE2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0072D6082BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=OKQYqAhI
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4ceb15dfd7so191738066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:44:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793724273; cv=none;
        d=google.com; s=arc-20260327;
        b=cFI52RYhDXwB/l0oAYw07SqGBLsiw7cTWFNc7HYL8PQKaxfie5+b+5TjyYju8RRymo
         6s2n2ENEkNCpaXWLSCu8O7TwhyoTHY2+QftXAMuGLrr4rk/3XqhTeKEBKRbAClA065N/
         EP3p2cHaJ1i4bzH5YwPRkXkW0KNJYyI9WN7hcYbrDkNXJuVTpdVmdBzAhinUawXaexUu
         0q3xLGjsVYcn4KZEfP71RGGvm/wddxDwdYprOc02hzkoF74QUx/vMl2Y+TqiASnKXOQL
         1VS223cuGZJ1cg8aPiEV2vC4oybSLAGScq+ttxnzg2F4o1C7MYVt61do19SQbYgTXAI3
         vmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=;
        fh=nEZuJrlP+oUGfvuOVBuyvpcGJfcqhw0HRjP8hUM6Pgk=;
        b=HBbGPutmdVEVXAggJXHnKPNNo3JT1Dlmc9RCyqudxh+aJVVJOiKBEHbK1s5SZCkf4e
         Cc+UDYJoyVhpiXBLYUwm1mAqEfj75a/HaSO8MaB0wrOoun7iNzC7sll3ogTPlFa03e3c
         HVvsDxybzRRmQeFu7PIM4+s4qNMTVmrWhqX6dxAJhAUNzCCEatmvYzp00KQOt/TY92b1
         E/VqnCZcZGZ8gOPCEZLptTT98oSDtZ+xvUZLLJBHv65J5yDk/w+KxloHxucxnKXw7NYa
         uAVucbHaEyVO3LPubDf1cVCUQF8X4pTkAbM4eog9LVTbeUC0L8hqJZhoCZz6a6tUnxzm
         +/5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1793724273; x=1794329073; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=;
        b=OKQYqAhI8ZC0gkujkJ8+ll9rX4dVBYsezwiyOeNdZJMMtMfdkTmR2Mr3m7tuXk4xmR
         2MRRIlKgS+QpLwX5Ce46ZiNnQSyZ4npabPiff0xvhMksrOqCN8dSDSDm5i/OL1d7J8wS
         PFSUDshK+0ER2pplNS217hIQALKwf0s1owd3uA17EqdLk6XC+PLaNE3sdWptm08SvxQg
         14CEoD9VEu99sTmHt4Q16JT076NTYzZYpUNuylCxPLtfyXlbC1TMf0Bc1PaznmqsdEOJ
         dOMY9OhTUD97CvaPH3UEV9CXKYLsgaiv2bWPQKaMbe2pNveEWJdC269k8MstNbPm7QQk
         NCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724273; x=1794329073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Un7Sh/vOuUsV6xn2dwiqUFHaUUkNjRn1fxqbgvpHoaU=;
        b=uTDUjvNXI/sfmdI6dCD/LPHHzyY8sz7kq3ePBDN9Jd4tWYR6uiLANKti0JWLj35aSf
         tLloZKNazOOzVxpUd/aRSrQZ+Sqkc+7Cg9ZjImZr9wt+2jRxCNOGfKuFN++QGgRzoD5a
         vOiwQ75CnDuaet3BdFhYnFDHmtyXIh5TF2PhWU4ZLgY+yIps+oHUmKhZdBhSt1qRcudj
         pJ06/Nt3XKBGv7MUUQYfAI1NL/MsUuaufqYGnrDcwvCJl6Sv4x7SUEgyJ1lMx0DQyTjs
         q8Q653KeoBUbF08eCLSuh6WPttYMD54xSn88KvFUGkh2YAeOXh45KTF9IDlawXYexWub
         BaIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/KHghaG2fYrRWcFePCi/b7noj0BzQ46TfoFjyIVbusZt/naM1EI2gvdqWf6FlWUqhST526+o2y3nrHPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lG6mTsqmbyExFjemI/c5aT8ItbzxYJqNqIOtNzH5QDRnf37ln
	QINKDkTOF/eLtwJKo3VFDGDgWI2sZn2f2SVOtNIO8LyqYlp33pglP71Xxbpvc0K0IHPNSKgMdnl
	1d4vikztGfSBaOw6qCzPjjWJlU/wKYvb7mRE7Ss7K
X-Gm-Gg: AYBFou27p3XWKgHn5/UPykVWbCU+BFggbqcSDKvT8UmSd6dlnK3KDLP7CR8+JD+dFPm
	rmnDMT30xkOCwDMQXj+nft9pFzTcXgIG8i5x+Fd5Cra6NUCe5Q/lzNO2Mz4StzEmNJnJOO5M4am
	Lz7Tb+GYz50tGdNyIpn3nAH4xacaWOyFIQnItGw6yd9Wye45nPDV6KTZySk3vLE59Pp/6CRh6yr
	YmbgqhpNovtk5QP/7xpwQa9XnAs91oLRAt7ePGjcJh+EBctUDnTyVCtfrPDXEiD5sIZfO4b6Oci
	GfzrUmLEUcEbyyou0HFgEJieX6I+rO2MdHk9PgZUDWtx2+WxY0Ep2p7Q5xxUQm1ph2d4sLKjedG
	hWLQTWQXG3zUpHwuyGzJYApk9EcxJDaZGvJ3lw6ccr4Zk/v0d2oiGhe5R+EJjbsEGM7jvdUzabB
	JJGsxMQbFHCo2aHGw7jWH2HJxWb0ebMSOsG5YW4PxojUVxsOolC/YdS6qF
X-Received: by 2002:a17:907:2d8e:b0:c42:102f:15df with SMTP id
 a640c23a62f3a-c4ca7a0dc8cmr1250439166b.8.1793724272776; Tue, 03 Nov 2026
 08:44:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
 <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com> <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
 <CACB3TC+NVYPbNKeOu9aAnRaCUTTon4PAO+kp_QbLqL6qd37aeA@mail.gmail.com> <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com>
In-Reply-To: <CAFEp6-0AJ3uGn0pR7y7+PLhjf6AMYb2aBvPpq9J3QFRk9XJv1Q@mail.gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Wed, 4 Nov 2026 01:44:06 +0900
X-Gm-Features: AclHuK97lyxSBpGOAJS72d3gT5RDULXKKysd-w5qBGIFB_PFqSCBaZ_ICIFvFWc
Message-ID: <CACB3TCKw=BCtRpJQ6N=moO+qpVu-Zd+J8LfV6S8pX1JiKS5+7w@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Conn O'Griofa" <connogriofa@gmail.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Fabricio Akio <fabricioakio@gmail.com>, Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"

Hi Loic,

On Tue, Nov 3, 2026 at 2:46 PM Loic Poulain wrote:
> If Linux-firmware ships 01387, someone will need to confirm that the
> MFP capability addition works with that specific firmware version. For
> QCM2290, I can probably test it myself and provide a Tested-by tag if
> you can describe the expected testing procedure.
>
> Yes, to Jeff.

Thanks. Then I'll start with the qcm2290 file only, and leave the
shared 01387 file until someone can test it on a db845c or an axolotl.
Note that qrb4210/firmware-5.bin is a link to the qcm2290 file, so the
change covers both.

Test procedure:

1. With the current file, dmesg shows these features (crc32 a79c5b24):
     wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel
   Connect to a 5 GHz WPA3-SAE AP (PMF on) and run iperf3 to a wired
   host, up and down (-R). Do the same with WPA2 on the same AP.

2. Make the new file (qca-swiss-army-knife ath10k-fwencoder):
  F=wowlan,mgmt-tx-by-ref,non-bmi,single-chan-info-per-channel,mfp-support
  cp firmware-5.bin firmware-5.mfp.bin
  ath10k-fwencoder --modify --timestamp=1706616060 \
      --features=$F firmware-5.mfp.bin
   md5sum: 58982403c9c56a4b888fe0ab3104d7de. Only one byte changes
   (offset 33, 0x00 -> 0x10). Without --timestamp the tool writes the
   current time and the md5sum changes.

3. Put it in place of ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin and
   reboot (ath10k reads the features only at probe). dmesg should show
   these features (crc32 f9e8f071):
     wowlan,mfp,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel

4. Repeat the iperf3 runs. Also disconnect and reconnect to the WPA3 AP
   about 10 times, note how long each reconnect takes, and check dmesg
   for "firmware crashed".

On my comma four (WLAN.HL.2.0.c10-00459), adding only this bit to
its firmware-5.bin, with the kernel unchanged, took WPA3 from 22.6-31.6
Mbit/s up and 21.6-21.7 down to 273.8-287.7 up and 242.5-243.7 down,
close to WPA2. Without the bit, ADDBA Requests went out unprotected and
no Block Ack was set up, and with one AP a reconnect took about 24 s;
with the bit it took 1-5 s.

A failure would be an association failure or a firmware crash. If WPA3
is already close to WPA2 with the current file, please tell me too:
then this firmware may not need the bit, and the test only shows that
it does no harm. A monitor-mode capture is optional; with the new file
the ADDBA Request frames should be protected.

If it works, I'll send the file to the ath10k list, to Jeff with you
in CC, with your Tested-by.

I worked through this with Claude (AI). English is hard for me, so AI
helped write the English. I ran all the device tests myself on my comma
four.

Thanks,
Shunsuke Nagashima <shunsuke@nagashi.ma>
