Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60234E3228
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609368; cv=none; b=JgyBiuUNf8oo4jO6Vw9/riqfonxgP2RnFGlG8tQxM0kqInFu8cIiH9EKszS5jxcToQmbYX2D9AqHBBcyxb1anqSqAfssVhyK5zrJFSjY9PBy8tKEWENMs0tYUUG0tOp5h1Sh9Vbk/HzIqFs3MdITL+qQ+EFxGEVGPPmv35bvxxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609368; c=relaxed/simple;
	bh=ZGTqX/V3A7+pSQBUrbSGYy4dkvvsIq/MXTHZzDBpVKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qr2rrjiNFSykOd1dt525nfnc2eOEv/zqM9egHJW4ujApeMVHKV9e4h9OSsGDfzTL0jlAKBMd1Oj2AwxPvQ3ovT8I2vFcfBTGmWanbUFLOGROFn/lTKmO4soLlpVstxUdxxINE2/+20QPKq/Wz2TuNTKFDL7Hv+KwUGV4QenOIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyevCtLC; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyevCtLC"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d33d80855eso2219161eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609365; x=1791214165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=439vP/WbZoAeuMZHqhmtvrcDG33tpc5B/KPDDo2RdEM=;
        b=CyevCtLCIx4tP0tTmrXLX9M3isF3XkC6BsClQPJ7OBwVyel/CHkfUdtaqxN++pCo18
         zPKjSxPyOFhmAOHP6OyRWiQSOPSPnI+mqpaSW2nBsdvF0RAl/f5MJZpYLuh0Z33SBTIs
         AtckOwMFvJR3O80dqIza05pA1c1421O8qRpYX66INx0nrkTaX/nqHM2mPw/VxqZTjVDm
         PrhMqF2vEIQDS2rWYg5XilJSWQ4h/11LakE+vRVf+8U2Mn8tt08Ef53hg+slfLkGkouW
         VUxSiBw3Psu1L8t8tFebPV8znyZmnRS8S/xVGLuDncVlCcZNcoIfH5F+/0Us+8sl6xSK
         zsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609365; x=1791214165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=439vP/WbZoAeuMZHqhmtvrcDG33tpc5B/KPDDo2RdEM=;
        b=RSQLcyslepn9kqkTOpH0CECT7UAgXpsq4PBTYQgK1+tjJzapddP4NagAXfH+bY7FLX
         STl+Stf6/4QYlh6dlAr121OxK5rlUbYnIVRPn0BIj4s7TsdOZqTsXTGYCvKRK/UWoR/T
         CmP4yekm8rX/Hni0ibTCTL3xUTtKctTY/4jBIruyRI3GOytlQ6YGBaefnQDjHR9mYoYy
         sBuvkPbhcc4piUznWtUt81yX0mXXt1CUAubyVaUfGkJYWzbslu0DkNjfV9Mq92EqTsEF
         3ljxcletDa9Gc4jmzaBkORxnuyipRscz8fdYJXT35CiUVXxf2Kjt8mWvBo4Ytp7goxCU
         XtsA==
X-Forwarded-Encrypted: i=1; AKwUvBx/GTXez9SVrgP+nKvqp08FU4/5NEA1p1UZ6DXCF/bIL59xbk908XLQLdnD8vv+PGZAzSfQDdZNYKTYN1w=@vger.kernel.org
X-Gm-Message-State: AFuF++nHgnH8woJUZDyVCtsJ3xGlCj4fHqDPSGepnyv/8QdYKwjhX7cQ
	/XBQ/h5ZCSUJel5mMcjwmeJ0V35N37g/FR9MN54hRvzykkKaREGA1Brt
X-Gm-Gg: AYBFou1WBbPnNHNYH7ztDAQF76+wR7mhzWwrhNKVYTfFratQofnZtY6Q45OA9A5oE0p
	izvRLCe7x+i94WUAQfdeVusX18CrFe1cLrSKAT1G7HDC0UAo36OK/T09vpmDfGfIx1NaVTSC8QS
	sM4wzifhPqmJdeTbVrczEYWFGTtolSPL536SV9SYi7QnWkJ/B/uAUTwlVqYx/J5M9YufVMqX7zt
	2uAd3Tt5Jf8ZTbjr0imUPlokhK+9nX/hwSGu+yfHPHA8qwW1sHWw/D1ulTXELbdgR9sDBIapkHg
	DJir8TnTPLxkrgs3nR/kgiXEoqF3gwaoKhNLYVfQ3npR0RRn/EbBPLWfuS2JHRCiq9IvNDyJNVi
	ONgyQG0zzm/U9jEMmzVL9Z1oQSi3StkH1Im2yklz4uo3BehQaoEqb0PAK5WBG25kPcv2YljTdHu
	X5rciNHYMD0EhQt+uZLIyxN/w829pl575t/Rv4DlJqsa5dp0kTxz9pc4NFqYfndApVmnkQOTxfw
	rKU8qtFUVD2x406mE1cPQ==
X-Received: by 2002:a05:6820:a04:b0:6d8:28f1:142c with SMTP id 006d021491bc7-6d828f1199dmr3788578eaf.16.1790609365130;
        Mon, 28 Sep 2026 08:29:25 -0700 (PDT)
Received: from cachyos-SlimIce.lan ([2607:fb90:9a26:9349::e71])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d88368ff0fsm5124435eaf.15.2026.09.28.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:29:23 -0700 (PDT)
From: Jared Wuerzburger <jwuerz@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: imu: st_lsm6dsx: Add ACPI ID SMOCF05 for LSM6DS3TR-C
Date: Mon, 28 Sep 2026 10:29:01 -0500
Message-ID: <20260928152901.69000-1-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arovrVYSgU64DM5o@ashevche-desk.local>
References: <20260927220559.24169-1-jwuerz@gmail.com> <20260927220559.24169-3-jwuerz@gmail.com> <arovrVYSgU64DM5o@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 12:13:17PM +0300, Andy Shevchenko wrote:
> On Sun, Sep 27, 2026 at 05:05:59PM -0500, Jared Wuerzburger wrote:

...

> > Relevant part of the DSDT, identical on both models (full excerpt in
> > the cover letter):
>
> Don't refer to the cover letter in the commit message. Most will not understand
> this pointer.

Makes sense, I'll drop it.

> >   Scope (_SB.I2CD) { Device (STS) {

...

> Just ask maintainer to add a Link tag to the series instead.

Will do. In v4 the short excerpt stays in the commit message, without
the pointer, and I'll ask Jonathan below the --- line to add a Link:
to the series when applying, so the full excerpt in the cover letter
stays reachable from the commit.

> > Both I2C resources describe the same address, and the driver uses the
> > first one. The vendor-specific SLA0/SLG0 mount matrices are not parsed
> > here; the accelerometer orientation is handled in userspace through
> > the systemd hwdb, as for SMOCF00.
>
> Hmm... But is that wrong? I mean does ACPI provide the correct data in mount
> matrix?

Good question, and it made me check more carefully: X and Y are right,
Z isn't. SLA0 (-1 0 0; 0 -1 0; 0 0 -1) matches the Windows sensor
convention, which reports the gravity vector (Z = -1g with the screen
facing up). SLG0 being identity fits that: SLA0's negation is a sign
convention, not a mounting rotation. With it applied via hwdb,
auto-rotation on my V3 is correct (that only depends on the X and Y
signs), but iio-sensor-proxy reports the tilt inverted: "tilted-down"
with the screen leaning back. With -1 0 0; 0 -1 0; 0 0 1, a plain
180 degree rotation about Z, orientation and tilt are both right. That
means the systemd hwdb entry that went in today [1] has the wrong Z
sign; the fix is here [2].

So the firmware values can't be used as a mount matrix as they are;
reading SLA0 like ROTM, as v2 did, would have exported the same wrong
Z. That's one more reason I'd keep this series to the ID and leave the
orientation to hwdb, as was done for SMOCF00. If you'd still like the
firmware data used in the driver, I'm happy to look at it as a
follow-up, but it would need translating from the Windows convention
rather than using it as a mount matrix.

> > Link: https://github.com/mudkipme/awesome-minisforum-v3/issues/2
>
> Closes?

Yes, I'll switch it to Closes: in v4.

> > Assisted-by: Claude:claude-opus-5-5
>
> Assisted-by: LLM

Will fix, same as in 1/2.

[1] https://github.com/systemd/systemd/pull/43935
[2] https://github.com/systemd/systemd/pull/43941

Jared
