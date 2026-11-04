Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836368;
	b=K61Ku9ZUKGTOYYO3d6cDR74vS0+VIblVCPDT/Q+pgGwX+GDBhIim2KhchYBlrJgTjZjf
	 iMNvuVgw7V6Eg2WgyeR6EfhRyoIPBPM5DAnbrv+CZlkCBQ9BUrZlmCqeAyT1fwE+EB+0i
	 74Ea4mtvy+cSCHrly55ZTImss7eGq89dzgE13BUB6IfU9dpEjVzkts8Jn7EyZPXKunrDy
	 Sk3wDW/zHIQUDMlOroHs8BTIn1FXJR5KRUBHRNFyxPb6pnxDOR/xtcKgF6y87g2JECv/i
	 jAzXigci2M6RNU5u0bVbGUfVm2jwRGvGiLZi/M6CGbkfncT5Fi7p+EFXqtfZQ6tsS0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GCBkedzgVlQqMi1kz++iUtIpIacOFXvDUza6lGua/T0=;
	b=49OZf698RdQiefqGnc7+JuWfpBQuFR3AVIktvn8AdvDq5LqTGneV3IQkb0FHASr/WwvS
	 y+1mfZ/An9x1u6ZV8/d1jdg/yihXG4SDJ1nqX0mFpV645quevCGPf957XLxCvEWoMEJAq
	 cu1OS2PDsnbLk2KjOVBNugcjAgk/vxJYUFcB2Hj66N2QzLmfbNg1jMpqS9yJ3DAW6yMDO
	 joOuzT4+6DHeG7yckLAhUj6kn+4gk4D+sDJqabJGUQLOq4Cqbk8xU6IylaB9Fr3syGAEc
	 GUqzjEcpcGk5ppbQhJ8Zc2UmRnxK6/J8ddqmFWgFeL+EChiu58JLyHcW5XuN6AbHM5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APNcuOLA;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298EA606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APNcuOLA
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so1594365c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793836367; x=1794441167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GCBkedzgVlQqMi1kz++iUtIpIacOFXvDUza6lGua/T0=;
        b=APNcuOLANR3tXkFYFrqmLoAVFs9VbmwMK/1tF/C2bbYpl15hrlGP9+jh8MHtqM41Xs
         wX+ZSp9Y/3Tklu64K+XcpQQUro2nztcBc6Q394I4u87LUdCImgwSEFQVr2qAvdYnBPtM
         Cu2C4HKZseSvAcqJNy+0ZYjREj0DyjWd6qdAkGOfjmT6AdA+Z6ASOtrF0eMUC85aHhAh
         S2HlDXsFrSfvY9obHVU+CX2YdkXbcz+TdxsmYflz247QFwgmMcGNL1hwKsqDKMSlwBP3
         mMcsMcIr7FmFC6EsKeZbFotAEeKF8iCsOhcgZwIft+Edp0A7rGP9iIDDN1sW6kMij4IK
         H4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836367; x=1794441167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCBkedzgVlQqMi1kz++iUtIpIacOFXvDUza6lGua/T0=;
        b=EH7YElIFSMXudHuUrW39s/OfdxxqProzF+c+Hmp5MV2cxxlKMuBUdBHEcSXUFjjhT0
         mkeBfqY/SoFNqj+H579zXZhz1j0lZJa/P4Rz6ovkoXK5SrEM0nLTietvTWzZq7r1AylO
         V9A1XCE3BnCVhBAIIvKGwIRiRP9Uqsw/75yNuOTitFnCXbRhIeLmyYOVuFXuhgNedn6E
         +TgdErbzYV2Jm1E3nHh+jkxMvH4twzDADrxefCWhF2EO+G6N9Cm/KsWBH23mYTZP3ShZ
         gpkzQcnaqqLSfowBa1R18+stgrJcy5BgGlDcySlSDyG7cmCDBBaU4WlpZax24s9MVeSn
         FH9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5LAut2kXyekqY0Kj+OudAQIEXPq58p+vG8XsgFBg2mfAYHjsTqQhIfhH9+66Kgk74AyOsKr5gzRF9g5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TZTbY9a0gTcK218cMjBJc/WLp3MEjct9Y4Ox0SZSq7t3bsMrC
	YH5ArLuSiGBBeJ1XecMfcyb3/g5npUNCLqFJlRB4Dibf2RK8w3NUTH4m
X-Gm-Gg: AYBFou3qRILuJyY6jtw4g1DWFgO3PvL62jtJamh71CLKJSICXG9Mzd6wVjQtO6OBmkO
	rlbk6dOz1ud3tDks7gKCK2XZrisUgC2G3+Le+XWqpwpw3p//p/auXxVhkwuQ8Wo7PillbakKW9f
	N8t2wfjzGl4Rxz4ekBWG7Vph6wNj24TeFbeoumQmr4AKaPdrVT40YGsGWN/Crc4oOUZQvjQlFSp
	ciU07CANvURYKAe0PKLJ6tMjWIU6wQQkba16HsmtPV+l7n1uGyf+I4CFhohbn+PY11ttpmlQqFS
	QZGvWL5PqpuC5eMd9O1AAYkLZkXJcQJKbFYvLS+emhavOinjnfhNbeMxgpTBRCLDMYyJhFJ0zpe
	XGPf3lCu+Jd2d2WmQ+LBCri9S9F9NagpmBrMNX9dOGD1Jh91F6iBlfH//p5dWWB2ueVXsfroOK6
	kz9s91OhYBD1cyYeba+lS/MgeONAlTyfTt9sHErbTAXZ9EGee+u/VKHosSCJuXfTABEm0k+aiod
	lazrK5E5P91AK22p7XFk4Koptqeb1Zk2gJJMgyGigKGQ21wSZtxX3Sa0HvpWKxnV4m8leHoLsZy
	l4GQtkA0Em/8q4T6yqAtbvq8KPAEdkN79QLLsoCV1zCpWImx/CzbmVQbdTp0fk+RDuukgxNan6s
	rltspCpZ4sExutGs=
X-Received: by 2002:a05:701b:428a:20b0:17b:fed6:7449 with SMTP id a92af1059eb24-1ac5da7725fmr28530265c88.47.1793836367131;
        Wed, 04 Nov 2026 15:52:47 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm10107500eec.29.2026.11.04.15.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:52:46 -0800 (PST)
Date: Wed, 4 Nov 2026 15:52:43 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com, stable@vger.kernel.org
Subject: Re: [PATCH] Input: mt6779-keypad - check the reported row and column
Message-ID: <auvFSNx_RS60_tO0@google.com>
References: <20261103084135.426629-1-zhugl3@xiaopeng.com>
 <20261103084135.426629-6-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261103084135.426629-6-zhugl3@xiaopeng.com>

On Tue, Nov 03, 2026 at 04:41:33PM +0800, Guanglei Zhu wrote:
> The interrupt handler turns register bits into a matrix position
> and indexes the keycode array with it:
> 
> 		keypad->calc_row_col(key, &row, &col);
> 
> 		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
> 		...
> 		input_report_key(keypad->input_dev, keycode[scancode], pressed);
> 
> The keycode array is sized after the rows and columns the device
> tree declared, but neither the probe nor the handler checks that a
> reported position actually fits those dimensions. A register glitch
> or a matrix smaller than the hardware's fixed layout indexes past
> the array and reports whatever sits there as a key code.
> 
> Skip positions outside the declared matrix.
> 
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>

Applied, thank you.

-- 
Dmitry
