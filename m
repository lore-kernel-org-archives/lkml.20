Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943452;
	b=PQE6lN0Aa9NQpkhrMfC4S8vJMSrFHIX38DKIFGqKciJznOU/z2KPqYEeHVqzpRYxClhm
	 XKmhgXz33j/de+IDFGwufLKDTFZgA4+Xmc4SLcMnfSCBKY9bWZPejGDr91iRVwRZKtVBA
	 HgkgqXvf+GuMm4Q8VgNOAFwS8oend5Jmfj6WSNSAaZE+YG57K1LxW1heK8AwsgGkIWtrH
	 RYvQ/3nDT0VtxjE2h6rqgLjtQ3WgBJdGGuqEe+FmX2epIchIhbg0RccfSSzER7rBuEdu5
	 hO2zPXnAaSsATPyJrKL3Fi34OtcvK5dd3lWqBMHOBEtzgxUrrnKDZGpfHwEqa5HOHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
	b=MntR9ccGYWM4818f1DEsjXqvZuy2zds/XS4YwTB2RAezUWqQrNriRtc1+H24N2R5I3Z4
	 zrPoUT1cu5q1HK27Gp6/x0dSKMWRnqkmbGa+Rz2NGgp2RZaOIRelAoO1yjcPEtqXQ8IF2
	 DT3vn0x3pB/g2LaSMxiCl77itqSUOXGoTGbgHiYkgUdQiWVbcsZv6A387bCE4pYzA7CCt
	 6/uEewS0vLrET1+Iz46Xm5Oz99Lumj22ZQCmJ8fpNDy0nMuRBYsydNP9Sg8JoPhDiiiG5
	 wxE5AgMXySuy25Xlruoa3Zn1yLfhJFVx3RcJjjYfnhNM0MBeNWu3SftKDIGy/ysZNew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0wSwdnq;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818FD606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818FD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0wSwdnq
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so10050705e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943451; x=1793548251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
        b=L0wSwdnq4B2MyT9qhO5Gp7zLUkq7Bownv3MM2tcgVDrwd8zDrASQ1Zv7dJCb6XrC9r
         80V1h21aweGFPQ/sNib3bjqiPnTugoYb5uhGhx7I0snK6PTRI+4Z93JBlc+z2Nufn1b6
         66UWMFd9qaGceDsWXNgtH000KXf/Rl6c/FAoe4AZQYTC/iGfXzYZovrFTVzqyo5BBjCg
         66psmUiH4FllE8LdXvvd81Gc14XpheP+XOMGl3wvgVJsXT1vig0jbyoRnWo5zNGpEcsv
         mqU9vNeS59Ajlw75uTnlEGr7oo6PLBVmWEhJh6XDYpwT05VXts2D2nBragplrtsjgn/8
         VUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943451; x=1793548251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
        b=twD0rNbmFCpxMpcGyhtGcMwWq8W1npj4RVZTyQ27g/14o4aJIL1ywAEk3C7QlMcmSJ
         t6FPm3fahZNV6G4SDqCpxavjy3a1J96tPKuZ7bQ2Hwp+5rr4okShkxvp5xHnmHI1tNJk
         wgw5En79xSZD5z0LJ1HCB8MRJGfymSzPW3JdqPav9eTpj4+LSsAvqXuCUXcR7CK+yxIz
         Br97cyOc/TYtkOVLyqurC/aBPfitl7s5xo+MQkS8/Fn4n5iB3FjoPmVhZPFe4ninuOGW
         B93DSw83PutXyElvc8+u1op2+i1hhjjC//WnWbeRKtNNYMvbasNO90PBFhxLr/cRA+4U
         ae0g==
X-Forwarded-Encrypted: i=1; AKwUvBzRRWkPtfjyMXqXCyxZMXMEF4Rr2r5iGrgnV7XCueT0TEAsDwv9bNSj+eALDam7+k4/Nxm2AblNw8mYqwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsyVEaBHlksqTGNNtVUQ1c0KNLnzDULtiEFFzoKi6b4oJH2GE4
	L5hYvq8J4pxbWMLdCdJzLwnY5S31r9KMNUChQfW1SUpg+f73purRS/yc
X-Gm-Gg: AYBFou0S1liTGz5Tmz08NjXSoc+snJQFfUvLonWNzb4ke4toywWAmV/T8CCCkGaOe0J
	HEu1I7SYyQwLaGFYPcZ25fL9MPR+QBGlTo1SSL6naU1fi1fp/d6oxGeM0QalyhqX8WhTrrrCYNG
	Ec7OfslQ8sid2LeqSKEkLj2nPgde9Fuzz6lexQ0nE3AVJuvxhELcdch/aLlmoz+9o/SINYTlhvd
	FBT8Ux2+AaTYoIYvoDzfInVIqJVB7868td1vRwIvWitjDgFaMIwar8ks/OrsooYYtHSsukMix4p
	wEmzKhO+vrTAP+R7JxIHHxbC6NagTD8VqmrUx5Kbdz39Py3FmUGbfpbEPv1wGJusLJdSrw9J7Uq
	Xe7ejObBiG+R4ataj+FMLQXlyp/N2DXCcbwzyTTkgfgBZx9WzXeGg460l6T0CzDrnfEjVhTt8ff
	5SVQKu/Z7qtGCY0RprWEoe9rWoHvqtmPcBejMlWlzfOyW4FYQToDAhO1816jsd6rqkow9jx7i0z
	CBy05GrSi49gGkuHP5Hq7++JHW4W2HeUf7SjqbQF20uNJYVJ+flcsU6B4U9Q5eoy+KnQB8AlF8z
	cPEXKLQrq2EoIw==
X-Received: by 2002:a05:600c:a104:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a35c675a4bmr58810335e9.12.1792943450808;
        Sun, 25 Oct 2026 08:50:50 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm137730275e9.6.2026.10.25.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:50:50 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sergey Lebedev <lsa.uz@pm.me>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Sun, 25 Oct 2026 15:50:47 +0000
Message-ID: <20261025155048.42957-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208035122.2147678-1-hao.yao@intel.com>
References: <20251208035122.2147678-1-hao.yao@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hao,

A data point from a second machine: a Surface Pro 9 (Alder Lake-P, IPU6,
8086:465d). Its infrared sensor is the same ST VD55G0 (SMO55F0) that
Sergey reported on for the Surface Pro 11, with 24 MHz in its SSDB, and
INT3472 enables its clock through the _DSM. Without your patch it shows
the same symptom. With Sergey's vd55g0 driver at 396 MHz, every mode
runs at 47.31 fps where the controls give 59.14, and at 600 MHz at 57.20
against 71.49. The driver this machine used before behaves the same way
at both frequencies, so everything the sensor derives runs at four
fifths.

With your v2 applied to the int3472 module and loaded from a cold boot,
nothing changes. Sergey's driver still runs at 57.20 fps at 600 MHz
where its controls give 71.49, and the previous driver still at 57.60.
clk_summary reports INT3472:01-clk at 24000000, so the patch does pass 3
to the _DSM here; this firmware just does not seem to act on it. The
other two cameras, whose SSDBs ask for 19.2 MHz, are unchanged (front
28.64 fps, rear 29.95 fps), so nothing regresses.

So on this machine the patch is harmless but does not fix the clock. I
cannot tell from here whether the Alder Lake _DSM takes a different
value for 24 MHz or only produces 19.2 MHz. If you know of a way to ask
it, I can test it.

Fernando
