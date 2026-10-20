Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504434;
	b=iueaVXkOiHsTSkzEgP+q8UCOCK2PvG5rzx1eNVVLZebJSl/Fsf+567fmFRpkRE9Idvk/
	 hgjLBFiQTEW7gs68X0L8SECegthm5Gt1ZT7messydc0jtIvuyG2fUtyiM/KSJzh4N2wga
	 fUe3stNsp+1wfLQaxxuVVym79ddaGTpbgdUxiDE0eXI2ymKMWa6JP8cEhLkosxSLH+T2T
	 ZmWMZwHWc1TAhBVlr/9vQslpH46Rt/VSPrOapgqL6g4h1+luKI3YxJAXRONMSinBB4WSK
	 weTLTKnFJ5FQ+e9FnXdpIB6WZAnWQyjkDIayppEE7sgGnma4/5gNYcL25qFlKI8Ctig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=F4S/z3wLn6j43Kaqn3bJJAq9gOmklL0Dy1KFsPWVhCQ=;
	b=raexan0nAz6nHFKG0NoT4GIbJBDXXeClElxBtbm7vxVFlBH7Wqo9f9AEkw8lhdiWxC+w
	 +w29CqjkU4iEEb5KmQg7zq/WM/ke82NselFbRpLw1CjmWq1sfuT0ghoHSZ8czyF8CaXRY
	 v2aKNW1TqujQiaod4lSh+fIAzhemQYk2+06n5gANUj6h7uJJLB0fSV2UUhoQBiFeD1kOn
	 x0rXwXkxI2wph+ekbGC00795yJC0VrQf5Mmrhsocc8VqlHK9gSUW2vbjJWbIg8m7wpcmt
	 jKVFs/74WEhiTOhTONr8z3uyJr420e6ir85x80kJ9DHSM1OcoMwF3lv4DiFhw7GGnuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DNI/c0Gl";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616B606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9616B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DNI/c0Gl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so27765975e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504433; x=1793109233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F4S/z3wLn6j43Kaqn3bJJAq9gOmklL0Dy1KFsPWVhCQ=;
        b=DNI/c0Glu19KVbXdrcsZDBVHr/o1y1q7ftTjBHkscyJsr4xq1wT6ttvP4qz0Boqcha
         ZH/mF1PJxNuvG1Y8GnpqjBvq1dSum/g6n+7gciaY1PYXG21EONxrGtcj7dMUTnv1dWgE
         QLEmfb3MeaSfVRnUt1O2RwqyAmC/UI5+caKFEHj9PKiKjQ7J/M4meo/dZ9/QQ+MBD71l
         4lXkr0O6shR14m3dDEjqtcsNfsJ6qY984Q8/6fKZ2boar+feHOdFlaSECZrsOCd1E+JS
         Ly9307HnZCJ27m+OIHMt1NKv8IlYYdPvGKEUgsCWpFYLjQcyxQsKBdFf84lQRSvaLF+L
         1Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504433; x=1793109233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4S/z3wLn6j43Kaqn3bJJAq9gOmklL0Dy1KFsPWVhCQ=;
        b=eda5aoEjhv7RKJk7HbPHbsWIi87bSuM5rZBkTl/zHvB1aWfc1yzIRMV0aHf5RLMrD7
         5O6h2PE01Rcc+IKSmE0AmiIp7N0LJhnwss4Et3NaoRTh+2kpHpIzTlA+iT/zwu5Uji8a
         N0Lc8OsTcWU02cytQpcbthdwpGJUJx7nJ3z2GiuJ7F/tWqwz+jHv8TQ4AbTm8ZSbTVI3
         COZxX/pLv5NQyuWwq50avLXnkOZ7fwEhaMmXEKtD6G/fB9awopLmY1PQvRb0slg4HEFH
         EBLToGByyzlUYWyL3468jzAKtarqP2hGCOk47ww0LhoKN0qeAyBS/XTm4WIS33Y+o/8W
         NVYA==
X-Forwarded-Encrypted: i=1; AKwUvByrbhjdjQeTjGPKMqje34si6z34lzVja/MRv1UajUGsOR23AuMHx/Q4VvAGUqUuGW/UQHDmOGqcKI0AfLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrBdo0DyiaN35/Ip/eP1B2LsNKALchve0bmwEVlU3nvnmyEATo
	aUpVRZh+HOudEBWLnuZpQL6koQY1nECMHxZk0hmkgMAQNDcDxcsm3/Yg
X-Gm-Gg: AYBFou2TVGamGwjoIIghu+a02crw/Sqh9rkaCBrpkG3YcNwYfdy9aW6JfRhnRWmlYk3
	GfhQw/KUtp3zDts1savy6ad0Vlqf5Vg1xdrMlgvjnq5rKJEwpYiM1o7N9kiOlJaA91cMgCux+/d
	34zQkiDutg1EYhza13WxJb8cokVRbCNAsD62Q3hH0lgtjIy+LukIGlMEO8oiW4PZxDK7qNmPv3Q
	nwQ0foUAL2ZKxoA1SGNiwq33CWbkz/uk3J/P/k6osSBT0/ap+IuSM+RjhtRU9NeeeXjD9+xSBzz
	GfLeZ1DFKwM0jeqrOYTU/PGuQHHHiBORQ4XOMZStFAS2IAKu5RDKRsyuutBeF9ctLZ2JFdgLp5q
	jJoqIsyvON3MpIkBw3yjxsAzOLocqgIP/dTtifnmoO+3JqyJLuzbd1ZrQoL4ZdzIuLiHmtdGgc7
	jK2vYka5Lt8Bo12edwYEGyyl2PR8tBZsPQFSK9mpEUMYOBkT9RNDjXcpX3/Z+RU6acEU12yskSu
	OoNeg==
X-Received: by 2002:a05:600c:4e0d:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a1e7ce1570mr128096285e9.2.1792504432871;
        Tue, 20 Oct 2026 06:53:52 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb6d82sm68132705e9.5.2026.10.20.06.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:53:52 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:53:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: s.grosjean@peak-system.fr
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan =?iso-8859-1?Q?G=FCnther?= <stefangun@pm.me>,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 00/10] can: peak_usb: fixes, cleanup and input
 validation hardening
Message-ID: <atdybEUQ9EUdZ9A4@stanley.mountain>
References: <20261020-canfd_check_channel_idx-v5-0-a62b35b867f0@peak-system.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-canfd_check_channel_idx-v5-0-a62b35b867f0@peak-system.fr>

Could you please slow down.  Only resend once per day.  Otherwise it's
a bit like involuntary pair programming for people who are on the list.

regards,
dan carpenter

