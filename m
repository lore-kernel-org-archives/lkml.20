Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935638DC4C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850667; cv=pass; b=L76H6GjP0dyMK3wQ96GF0fhQQb+tQaddZ78O0hmoMcpnOTlWN3/0X9NTz8SWu7g1vYhlVkC/luKTCljO7iGeMFHpPioC2SEFdsCESiw0xzdUbSk9Q8flCyX1Z8fkbzjVGJC9DB6pUojOqONAwO4W2e6vyb2VtiJV7QuVP7iPIH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850667; c=relaxed/simple;
	bh=fG9smriL9Avld9eCP1TXKVywUYOjUPJA2/+J1iN2yo4=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnuOr4Pd0gQTR5RqMxagHqvt5bHLpoqRpQxTvbNUMQ5QtaqNd935x0bG6RRiEUzAzRoOIaDzMC/sI6CQXl3oaX7PhojGnXyTP2WaNTAFi4cr+RBY76Dkn8SeaYatYxU+M2tIuZxfwv4BDPBnnBV5WP/ZkLQe6pRgIVRejCqhcow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=PKmufmWN; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="PKmufmWN"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so1486904e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789850660; cv=none;
        d=google.com; s=arc-20260327;
        b=p8A7/Yo6rcoW6xtSlnej3ERyAEadB/3QUNLw+BTwTQSty+/vco7JlLKr6SA5tuEEOe
         8LRwAyLm7hD35h+vYAqUz90yI/IoHtSyEqpIMxLFo9nQWDOwf1Itha2uTdcWYMf7LLK8
         2RREaVI1/A7vNWVwPv47LDC/QNEAOauCxv86HKHHkT6PN2Ewz1F6ei7WYyFJXL23hPKU
         c3Cz5VcK9DXepwV6i290J/cYxRfqfqqtvBWvRNrm9kVQgU9JEmcZS39snkpOX/l6SRNK
         l7sGQ6jsNh98ml0Xsxo2dtuafk0jWU8WAqhQT54e0RnGtlI243AO7OApR+uo0vzd6upn
         MdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=/eAHbyiob+ZcoG2VDBo0Mr54QnNvtez/xnycfesyT/I=;
        fh=C6U/+4iUboKVnRtbKzBRkoCRN0mUag8TU8VXIH74YY4=;
        b=AOvNXAnpjNIZXsHHhFpJR9C6XEYRcg6j0MqvS4z7wAL1fAZkD792k9yZjIlPDt/qgZ
         fepHD/feMbSf1bmqy7+fHuR78OmBEvMNpGP3vBR2vFjFwd88giinbzrJ+IhXFvyJ+FJn
         gPHH1cQOtlZclMt8qfcmRwRmAZYqLsnXw+U5oN1cEX8La9Ku/O0WgfDAWG3ClGSvSbkR
         NajQGI+1Tb5+gcHHAhXQYWzK/NLuuEs3Xy/ys6/ywb3Oqw6axdKsZ4Q0Az2GLdIcqjVp
         iv9KUkif4T3NZXSoyS67ruheuSuDRTSpwCCHlnJ/4KWogdvA18PE0cCZ+fwTQvq7yRx5
         j+Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789850660; x=1790455460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eAHbyiob+ZcoG2VDBo0Mr54QnNvtez/xnycfesyT/I=;
        b=PKmufmWNhHdeQrpoRwPoNWE2m3XxCk2td6ONe8CwZF/Io6lLaA1q8Ua7LWEG86SSrL
         s8N0GH/XiGjQGnp5zBYG9y1zATK5utuJ/L09FTNnvaLs2jsrjzyGeai5X+CES2GqA5oj
         fiuGRkP+bNNbwmEwzb4ImNBSscPKCXb2IvZrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850660; x=1790455460;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/eAHbyiob+ZcoG2VDBo0Mr54QnNvtez/xnycfesyT/I=;
        b=C5h1U/O29xbYfxv9TOACVw6Qv61bsvUihvG61zc0tNtScPsfOln112RKpJ/Uwrea7Y
         TkL29cphAJiHzGGpvfK6tEHsO9d+nMfZ4F3jEtn7vXP2Sr4t6NC1R2DJYVzBmwOVLCHv
         5CVWbi+LHiGWXawVBJBkL9EPpHkcK4ryRclkXMGCNwO+z0No6t06GcYAPUafBr84AQHL
         hkwvdCoY+jB9bleyXZmjPuwaWs9x3xIjMpga+euT/lvVaL5Yh4RzJvvgM6b59hP8LR7T
         QiSwg8cvr5yrUcbVN5a73jWTA1oyT4uXaZym6utXc2kkjWhs4/110Mcb4Dsm9t8crroH
         eFIg==
X-Forwarded-Encrypted: i=1; AKwUvBzWvZe/Xh7P10iTBzKtrKucHlSmSBndRyGBF4ZvFEzfr4ktxTpW2YixQ0hTV2iFWMJIJKXheXxJeHP1ZlM=@vger.kernel.org
X-Gm-Message-State: AFuF++lg8N2T8BcrMPrxllpCeyklXdBw4aU/b/LM7dWxuT/WBRzX59NW
	CXk98xkWohb8OClw83bPLd7DF0cZCORqUUHGmhrZUau5VXvN3iYwVbP1mivLyTnHS/MdtxqxH5Y
	orlbw3K6weHfkE+qTHDccdrJ7ysA6ZEwxJ2bAIXNmQKRhQp+gs34x
X-Gm-Gg: AYBFou2UHDS2+GYGgvA4qb85ebobUCQwPi6y+9gCEoYOJ7b2eqzKoj3RLYd9vJfcjZk
	JnjUaUTJTIzkTuwTZlic8UT98qpJqmr7Ltbr2/T7Ibjuo8L4UigXGvdHPjAUrMRK/fZEcxjcifG
	bn4weU3CCNQCpcpYfpKm+RLnNHGWj5YJWFUzqqhuFswwBebis60qtH7Kw30L3qF0fbdd2/GejOj
	8M4DuDHEcuoItsQbOXDBIqxSvaJWblGxU1ljxa0Ts+sB7C/hMf2ZdCSm+Sd65VauTBrM9KF0pvW
	3+6DYfbRI1kbOJrvVF7c0VW52hMKFyjZj7WxilUBLbvBGOsjlaU=
X-Received: by 2002:a05:6512:3d1d:b0:5ae:c8da:6254 with SMTP id
 2adb3069b0e04-5b8c18298d5mr1778890e87.22.1789850659945; Sat, 19 Sep 2026
 13:44:19 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 19 Sep 2026 15:44:19 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 19 Sep 2026 15:43:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sat, 19 Sep 2026 14:52:09 -0500
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sat, 19 Sep 2026 14:50:50 -0500
From: Kim Wooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <ca51eb88df7b4e83993af73c2f1e26bb@realtek.com>
References: <20260913-codex-rtw-rx-v2-v2-0-f09c964e0b96@khu.ac.kr> <ca51eb88df7b4e83993af73c2f1e26bb@realtek.com>
Date: Sat, 19 Sep 2026 15:44:19 -0500
X-Gm-Features: AcwNN1XkXEzzYMBLWTykZJpCaY-PNLdTMEUvL7yvSz-NLAkhRJllSBnH9toq11w
Message-ID: <CAH1Bc_wo3PqWiqFcWZX9xB_+99=zHOdCD1VUg0R287Z2B4ESrw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 0/4] wifi: rtl8xxxu: keep RX requests
 available across transient errors
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

Here are the test conditions and results to help with the v3 review. I
have listed the 13 tests reported previously first, followed by the v3
results.

The tests used an RTL8192EU USB adapter on a Raspberry Pi. I adapted the
RX changes to the Pi's existing Linux 6.18.46 RT kernel so they could be
tested on the device.

For the recovery tests below, I checked that all 32 URBs were retained,
reception resumed without restarting the interface, and stop freed the
URBs. The RX completion counts are from after the injected errors ended.

1. clean-fixed-regression
   No faults: receive for 3 seconds, down/up, then receive for another 3
   seconds. PASS: 581 and 246 packets received, with no RX errors.

2. fixed-submit11-errno63-finite
   ENOSR completion errors x32 and EAGAIN submission failures x96. PASS:
   all faults were injected; RX then made 4,699 successful completions.

3. fixed-submit11-errno71-window
   EPROTO for 2 seconds (maximum 1,024), with up to 256 EAGAIN
   submission failures. PASS: 126 completion and 256 submission faults
   were injected; RX then made 5,227 successful completions.

4. fixed-submit11-errno75-finite
   EOVERFLOW completion errors x32 and EAGAIN submission failures x96.
   PASS: all faults were injected; RX then made 3,420 successful
   completions.

5. fixed-submit11-errno84-finite
   EILSEQ completion errors x32 and EAGAIN submission failures x96.
   PASS: all faults were injected; RX then made 4,243 successful
   completions.

6. fixed-submit12-errno62-finite
   ETIME completion errors x32 and ENOMEM submission failures x96. PASS:
   all faults were injected; RX then made 5,340 successful completions.

7. fixed-submit12-errno70-finite
   ECOMM completion errors x32 and ENOMEM submission failures x96. PASS:
   all faults were injected; RX then made 2,848 successful completions.

8. fixed-submit12-errno71-finite
   EPROTO completion errors x32 and ENOMEM submission failures x96.
   PASS: all faults were injected; RX then made 5,321 successful
   completions.

9. fixed-submit12-errno71-finite-control24
   EPROTO completion errors x24, with no submission faults. PASS: RX
   then made 4,921 successful completions.

10. fixed-submit12-errno71-finite-stop
   EPROTO budget 32 and ENOMEM budget 256; stop as soon as a retry is
   pending. PASS: stop saw two retry URBs after two completion faults
   and no submission faults; all RX URBs were released.

11. start-alloc8
   Fail the eighth RX URB allocation with ENOMEM. PASS: start returned
   failure and released its resources; the next start restored the pool
   and reception.

12. start-fatal8
   Fail the eighth RX submission with ENODEV. PASS: start returned
   failure and released its resources; the next start restored the pool
   and reception.

13. start-temporary
   Fail 64 RX submissions with ENOMEM beginning at startup. PASS: start
   succeeded, two delayed retry runs restored the pool and reception,
   and stop released the URBs.

V3 passed 52 tests: 42 from the main test plan, one matched-input
comparison, and nine first-start failure tests after a fresh module
load. Two interrupt-URB tests were not run because the RTL8192EU does
not use that path.

With the same 32-URB pool and 24 injected EPROTO completion errors, the
unpatched driver stalled with eight pending URBs and none in flight. V3
retained all 32 URBs and received 1,225 packets over 30 seconds without
restarting the interface.

Each of the nine first-start tests began before the driver had ever
started after probe. The first start failed and cleaned up; the next
start received packets normally.

Thanks,
Kim Wooseok
