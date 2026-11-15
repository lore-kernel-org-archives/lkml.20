Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708626;
	b=EGCmJ651EGbxC+L2J+d8unFe7nyErBKFJAtI6wdu35p/zMNns4/sTLemmYgsF6at0wQ6
	 7rtJehzz+oYkcAmt4f4ZW6ejPBvEZd7QM8x5i0YeQBHGZOKBcDHeYalYI6kLi3u03zTMb
	 Ag76BtgLZfneGdenu9lPdhx0HGc2Ip5T9cfaBqGkXt/G+8/jrg3WFgj3yeIH1CbmYfqh7
	 1PQojHHZh50TNTgT4fKY2Xsqgvxx2tK6fMpVKvT0zcNZBbDIhqGxKTbIubhPfXgBfqTSm
	 8Kjl6nJoBap0nnzGVCHwpJbaj6q9nOOslfThyd7O60aoy1XFymxSnJ9NVzr6qQ5FJ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Dlr8BYW4D9uRE2kBdvPJxDIlvh4ufcRQvKzhTZs/K1Y=;
	b=YAbZZmhzk+M/SfU1lSr4ivDH2HJ0eEI/vIukTdbnotAU9xwYIJrFIN2hcFfxap/XDveX
	 nLhnne1Z8wtMLS/4JIHmtVxHXGeo0+uRdj34p2q8u1OdWlJkOybeD5ajS10BQci1aANgz
	 bHpP8d466Ad1e5+Az4ZPVWmqo+NwHmEF35IKJceVj8sjVrrgd/s0eR3L0lqNtgdXfgSwP
	 XCAFKxzIQw5+u6pt/QFR605KBY2t6CqXranx12ytjrNepXYKSl2dRERi++kQtQRO3TLFa
	 EAaqy/0TkmtOqukARxiSZk1M806TcgGRZVvuD9v7gqecn0SUIoqybPBKxouyrWi8ECg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txxkvDyO;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A0606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102A0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txxkvDyO
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4697404c2bso332794966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794708624; x=1795313424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dlr8BYW4D9uRE2kBdvPJxDIlvh4ufcRQvKzhTZs/K1Y=;
        b=txxkvDyOusSB3/VwzuNOTJgzeLQw9KkCBACEspjdt3MsKzdy9hdSWY85SJ4YE5Wjna
         /h4bpo/UXO06tEB2cLUjjB/MI8OtA0++yvXfTUcmj+K48YDI17uQGUGCzNcU/3h8daBa
         6DNisaR0TU58PV6uwD8Yjn/qbhvdiexoVERZJi4nEyo1U/ahQEtYFyaI+A4+tnvZ4Xxr
         SHHSG7rHXn5UkQrpK/SNmoPSjbcxN0C780tLp4XD/IOvxl0Hq28F8mOCDyLMsYqwoQQL
         MpFCujzcEfpXMnx/VgnyCZn/FxOK792bWWuhLEOCsfRfUGsNBPuCgVyAVqn8ksxBSNl6
         A54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794708624; x=1795313424;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dlr8BYW4D9uRE2kBdvPJxDIlvh4ufcRQvKzhTZs/K1Y=;
        b=S7BsWNtnJFfJVASRA4jL/d/lSu95oHzW8vKqW3e12Oa8kriL4TCLNgyfZL7HQKuPuw
         P43L+iyHXDbmEwqeJkPZPpPwliE2e1+80dwAeMctPYQiPqgoP7klKDYq+pJ0SVLEANsw
         Gt16Hc+CxRfKYW32U2iw5W1tKY6HSVWWQcKUPy3Fxzfyy6QyZl3vwZsqGW43Dd2uAsxB
         iuHqcjdBfgMctTi4+6sm253GoqNLYqIvgrfjD14++v+a2N35kjTR4CDy/JTor9SJYZXX
         fz9mv9XJpUXrsNeeN9J/1SfIemY6Srcjf66PO3JzfmbzptNNzTl30YHJEGurV1Y4uR/W
         ebLQ==
X-Forwarded-Encrypted: i=1; AL+hErFPYtmBM2YHcXz53+XUS1mS65Q+wJ6BuLBL9DBPzc9nm98vnt0q+oR0VTfOl/nQKm7AOF9fHyfUJBByen8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+faPCKcrfbCEnoVnEhhbiagwvUPfQAhowwpeZAPIuYmfV4+GnM
	LpXc/VC4dyxZaUajij7ygRuKUDeZpCTN5CMJu3WgqIKu2w0zz4vBGBY=
X-Gm-Gg: AYBFou1du72n0+ffOopmszslecKqbP5nSavLciHnZHT7x01dkZbw9IRgOY4RgsVm8zA
	HZarf4SW+NN0XOSiIIVbcrVWLoKT4CcTIj3Jn9wZZO0ZWH+ptIPOzyHTRRSEb5zxIHplB5bE5kA
	mfi8UvRkUdgBoUB2wPK/B0Ggj/0YjGoL0O02gusQMpeUPINndB1kljwT99lY+kOJBhHzi6L8MDk
	nY73FAUmu3Ovk5y/fy/5nwESX5A/ugS0DlWYdT/sPt7Ictg/JGAqWI/kaO+A05b6IuYFl3QJoSb
	zhuPLrBp1M0PQRrTCO+AHXlGeB0oOfYmW2ZYALPV+ABfLMFpMaS/xjIqy3571goMs75BCL6aoix
	grJ8Ec+KfgVd/hNJQ9tuOCyTulssny92/lO6C4rI2hoSYZfkfZk2Tn0R0uP4nfYDvNx8J2BXYQ2
	QNOj8LW2LHu5pNl2quxQZgof/zRBrkO9tOgyxj/MKWhnMxHp9PlQqVOwg9LQEMW4jqunddgwUoF
	P+YwF3bBldtsjwYE1XSPcKN6e8j0nwROGS2+EzaIB13kFF4V8B7MmjUn1Jvwv9P0Ecfj7l3Io8R
	bYWT7HtForOqEeyTbdWXn+tfz3ZkMb2WNCJa4efhIfMptGakcbKU47t8Ru+/DvYzV00YImp5FN1
	L0dCsIjdFMSSS8atn1KheDjLu9A==
X-Received: by 2002:a17:906:f5a8:b0:c50:5e90:5ea7 with SMTP id a640c23a62f3a-c5096853f0cmr525580166b.49.1794708624326;
        Sat, 14 Nov 2026 18:10:24 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c6a5924bsm2665270a12.18.2026.11.14.18.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:10:23 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle states
Date: Sun, 15 Nov 2026 03:10:11 +0100
Message-ID: <20261115021019.731462-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Barnabás,

I should have put you on Cc of this series, sorry. After sending it I
looked at your sm61x5 7.3-develop branch and saw that you have cpufreq
for SM6125 there as well, done differently, so I would like to sort this
out with you rather than have two versions on the list.

The differences as far as I can see:

- Your branch gives qcom,sm6125-cpufreq-hw its own soc data in the
  driver (lut_max_entries = 12) and makes the clocks optional, with
  19.2 MHz and 300 MHz as defaults. This series uses the generic
  qcom,cpufreq-hw fallback like SM6115 does, and takes "xo" from rpmcc
  and "alternate" from GCC GPLL0_OUT_EARLY, so it needs no driver change.

- I booted your branch (cdcfb1386, plus the laurel-sprout board part
  for mpss and wifi) on my Mi A3 to compare. Both versions give exactly
  the same tables:

    policy0: 300000 614400 864000 1017600 1305600 1420800 1612800 1804800
    policy4: 300000 652800 902400 1056000 1401600 1536000 1804800 2016000

  With the generic data the LUT read stops at the first repeated row, so
  the 40 row limit is never reached on this phone. Did you see it cause
  a problem on another device, or is the 12 from the downstream
  max-lut-entries? If some SM6125 board fills all 12 rows I see why the
  limit matters, and I am happy to rework this series or to drop the
  cpufreq part in favour of yours, whichever you and the maintainers
  prefer.

Beyond cpufreq: on that boot your mpss and wifi nodes worked on
laurel-sprout with only the board enablement added (firmware-name and
the four WCN3990 supplies): the modem came up and wlan0 associated. Two
things I noticed, in case they are useful:

- the modem crashed twice during startup ("fatal error without message"
  at 103 s and 145 s), recovered both times and then stayed up;
- ModemManager did not find a modem. On my own tree, which also has the
  IPA node and a dynamically allocated rmtfs region, it registers and I
  see no crashes. I have not tried to find out which difference matters.

I have modem, WiFi, ADSP/CDSP, Bluetooth and IPA device tree running on
this phone on next-20261113, but since you have modem and WiFi in
progress I will not post those. I can test your patches on laurel-sprout
and reply with Tested-by, and if it helps I can send the parts you do
not have yet (for example Bluetooth, ADSP/CDSP or the laurel-sprout
board enablement). Just tell me what would be useful.

Thanks,
Majid
