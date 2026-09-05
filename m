Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8056C35E95C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615990; cv=none; b=C8ttVNFf3tRulbdzpTb1XynWlt7LNHOHbzvSxGk6ZOhECgqbPqi3Zd3jWHO9eTMtGH0OTgytsRTlWc1e1s+c0UyznBH0vz5FxAKMMYVpTsDxqVc2D6IQKIkVsQEUpsKihg23bNfSE9TBHJuUE97E6WhlfFEgmbc2tcbEVZglVuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615990; c=relaxed/simple;
	bh=fic2NJ+wRvlw35Uqu9N1aXCkEmWycwiRdnogymaXXEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUvwG5DkuxSD+69QAsy8bUZIyvYj/PnosV6oUfnbmXYpuLkl3+DDjPm+vIqBGEIVyJmQSqzpIKfBHnrZSQNN0VEXk0iy/N2sFS9zezwn1YXNnEOwEZT3K7sS05Rbe1TQTVpVdsy85ni/APjmeWl8Ijqb3Isqjmn7AJ4i/H+8lEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8D7LmKW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8D7LmKW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-853c947bfefso1623566b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788615983; x=1789220783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLJoWhKLSKX1K97rgnMY+/rZOmcVpOz2KWVn6TTt3QQ=;
        b=i8D7LmKWdC4GdJ8eYIqLYvj3RxB+y6CPNGOY0Por1Z/iB0QUALTowhlu+r8qvwUeNp
         kgLrcvDSN+Qcwf6kkODBRHzUC2axX2wC4C1dWn38htS324/9ecDDfs0qa2Tcvl3swOgA
         /m+3WtMZKFQYNGQFNvGUe+5ccco+QZphyJGP3mHexEXTDcGTWifOjKO+by1Arzp34xOv
         bcqVn55nL3S5DD7kXWZdRsiMaAu5R+S4zybAKwwdNwEd5weOro+q/1artrGNXIs21htu
         G80Op9mUg2Z8GyDlBPDkxJDhdGlZkkxg2B5maLjIXIArPqQlRho6CkxmAOW6Kta4Nnla
         Ervw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788615983; x=1789220783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLJoWhKLSKX1K97rgnMY+/rZOmcVpOz2KWVn6TTt3QQ=;
        b=deLa3LKmV0zu34R6BTDCvMOhSoSk1infULYsE3ZXXjiRsv9xi3i3J7eufmrWp1PiA6
         6r81K0UWZHPfLYx9jN0ZpJX4fCht8L8YfuDCCqO8Xpkyk+0H1WAg6ndVA9D7sYnxiUmi
         r1okQ4BNjFYSwN+DYfXydOJ+A2CxTYOnMH/748JwxCF/egkAU2cUFydakOQITSw1g6PP
         MXqF45j8a1ufgsF6KQIxzNrnzkuImEw+UIzkH5vZhRor1xdwPJF7I8oHMT1lQjaUZ0xM
         ULS8SZ5auMeguL/iKBpyUykNHjYIrBMWAWjWGcI9HBRtkGfToHoiTrhwGkjScS13QiIp
         amQA==
X-Forwarded-Encrypted: i=1; AKwUvBx67v3K4Cg4ZE7KGu/p3vZqs1lApzH0LYUi+u7VCBJDnkyyU/Zs/84hVvaVck0akcT2S5LTk8i/A+7Pmt8=@vger.kernel.org
X-Gm-Message-State: AFuF++nk3H26o4DuErpP1idAGNDV5VVW0jx1cuk3G0URfoIXWB1l4ahj
	Feu6j/tA4nvJo1kWQ60RgrxRHItQQ/oSs3DV2PiIgISfc2xIJX/+J5tl
X-Gm-Gg: AYBFou3wKoq4enPqF4MPP/CLN7Uzg8wozpY8Vf5///PDONXZawjU4JTmTtSvZK/yPpC
	B7kyHMxn3DF6wBGmNziv3zcVT8BcW1pSOGPrDyLz6asqaub5kjfQXwx+CfPZ9hUpiQImgbMbh/F
	Hki1Iq/nb3eqjdF8fjHQUfyYyGM2yyahLLhd+s3kzirIue0HCj9EtGc7QcIwoQBrCgBT774Uvc5
	cm6Dn8N6V1ItMjP4RLrcCrrI2fA+zwTILyv7PK3m9iLdls/dM0JuHOlt1g7Gy4ESJ3dzICJODUC
	ujqURZVFo6ON5DweRJG0ZV1prt6Ms6kr0cepa/uUVcfnw5/hNZQaMC2F60FbSyzjcnNVSYYLFmk
	inue/nUqAnr1XsL03peYmH72mr9r6h9SyQSHZ5XevQoDc7TrwWs4pbBM8r0HYVkmCls4l512HCb
	5atDvoVV/VnKO/XoLLyveIarkMvkTV4Z4667cUxIOEepZGYwzz+zu5ovPNFNvaIIQEieAPvpUY1
	6dXVPuxBHtTjJ1Ytm3unR++T/aebQAdDOJSEPmzNHg7MOb0VIQNtQ3+WK3hMZj669GPST/Xw0Q/
	d3FuLsMxiPyWXKiu6DV0dIbp
X-Received: by 2002:a05:6a00:410d:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-86199e9d400mr9036372b3a.1.1788615983466;
        Sat, 05 Sep 2026 06:46:23 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f8bsm2424728b3a.15.2026.09.05.06.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:46:22 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Sat,  5 Sep 2026 22:45:55 +0900
Message-ID: <20260905134555.168362-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905101837.4b7849c5.michal.pecio@gmail.com>
References: <20260905101837.4b7849c5.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

I applied your patch and reproduced the failure with all three debug
functions enabled. Result:

Cluster 1 (ep 2, at the very start of the write, unrelated as you
said): same as before, 4 Stall/Hard-reset pairs, spread over about
323 ms, roughly 22 seconds before the real failure.

Cluster 2 (ep 3, the real failure), with full timestamps this time:

  17:38:44.749474 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.749743 Soft-reset ep 3
  17:38:44.758367 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.758454 Soft-reset ep 3
  17:38:44.768370 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.768577 Soft-reset ep 3
  17:38:44.775052 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.775217 Soft-reset ep 3
  17:38:44.785047 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.785313 Soft-reset ep 3
  17:38:44.790469 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.790732 Soft-reset ep 3
  17:38:44.799187 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.799346 Soft-reset ep 3
  17:38:44.808558 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.808720 Soft-reset ep 3
  17:38:44.819176 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.819317 Soft-reset ep 3
  17:38:44.832378 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.832552 Soft-reset ep 3
  17:38:44.850677 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.850815 Soft-reset ep 3
  17:38:44.861706 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.861938 Hard-reset ep 3
  17:38:44.981704 usb 6-1: reset SuperSpeed USB device number 2
  17:38:44.998378 Stopped on No-op or Link TRB, slot 1 ep 2
  17:38:46.645044 clear err_count at ffffd52c40707000

It survived 11 soft-resets this time instead of 4, then hit the raised
limit and hard-reset on the 12th. The gap between retries grows from
about 9 ms near the start to about 18 ms near the end.

All 12 Transfer error events, the 11 soft-reset ones and the final
hard-reset one, show the exact same TRB address (ffffd52c40703f40)
and the exact same resid (23552).

About 1.8 seconds after the port reset, a different TRB address
(ffffd52c40707000) cleared err_count. cdrecord had already aborted on
the -EPROTO from the first failing URB by that point.

This time the failure also happened much earlier in the write than
last time, at about 12.9 MB instead of 64 MB or 103 MB. Still no
fixed offset.

I still have the full log if you want to see it, and I can also try
capturing usbmon at the same time as this dynamic debug next, if that
would help correlate the two.

Thanks,
wakasio
