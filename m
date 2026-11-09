Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211899;
	b=4AwAjQ+jtRw5SOh/uvqOWxg/dabNGIaiTCJ3NL52xMY+EfgrPym3jw0VJXR+9g3IM1V8
	 t3iamP8XxmaFcZa/puhoPM/GWVM9YdH4RSz4tAFjQK4EOKXAK1uMlwA59Y5PD0yYBRbla
	 I/EVkKJxzBTIPxW/IRxtg3G1LeV4mTBmbAFKXoVkPKfOGdx1bjC72px1LYod5pcHNv6uj
	 2G4bi0oONFGmrl4AL2cbdo/6zFkaBkVfw6AFgVXgqmSYVpm7H9rPlpY1f1lz4zDofGdiq
	 087jbkScbolMZ7wUP+Loia0e740b9yxfOtKzCJf4Ab0t42I2fJunMQG6avxefBDKmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mKhvsObZrPPQtj6ZJlFblKsUPwWm8d6ZB8vx+wF7BDc=;
	b=KlNLrWIpaaW8rzO1QRcdisqL/ND1Nud0F4Ls7VMwbzroLjvcFn2YpaqnaBqnCfXl4bet
	 HYikg4KOJ1FqcW6M/hHplcwh2r5+ECTJkqDSk6np4obikgxCIacfFaW/lIHxdLFheNe2O
	 fV/q7DCgx0XmvDOwAtXAal8HRyzf63Y1W4ZKEu3UXKor5BNgWKTQeTh8FEhVWEw4+d99h
	 uUUdxLgJVDgKFWAoIM5141YAS/Fi1WBowkoTMkkSUB6Hr/pslefGGE/yOQaJjjG0OhFnf
	 MKgeYMXAVad29kUY9HgqUBPcYbH3rpd0i7wzNJDjCZG0cKIbIjDChP7xki3uQccv7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6fCsRA0;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE30B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE30B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6fCsRA0
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3acec6677so639386c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211898; x=1794816698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mKhvsObZrPPQtj6ZJlFblKsUPwWm8d6ZB8vx+wF7BDc=;
        b=V6fCsRA0dFS4v9KdWGpEZHQGeDkNgijAvP/htZHms/bgPnMY3z6Ha/VGR+qRiB/tZT
         yeUl+8vboUTroog8qizr4aT5JoSzsb1A9B+hx5IlTjyhSrO1fINSwSsAEOdJzBALMIoW
         IF5gpSB6p+cw1lbtglErG6nL2UspWIuSsX54ttj0B088MtYFVgkKUcNBULAIXFB7HvzR
         WbfqX/V5w9Zb21QDeVu8I3dMvjovmxN1fr8oThYR84B73vwdw8Lik/euRdH2gvc1Uln4
         n5WuThlOsRoGWuuqVn7sq1OQUn5Ex24bBrl/OXDYOzWV+XRyWaq5P0gEPmNTsjIjPKCl
         RzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211898; x=1794816698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKhvsObZrPPQtj6ZJlFblKsUPwWm8d6ZB8vx+wF7BDc=;
        b=kLicAOXI/MOEb5aPi0WqYZDZgPMcQoCTOXe35RHrKmrDr3cvD0HtBga2WVtazcN82H
         +saGA4MbakzY6PMYIpTV1HcNGu9liLBUVH2OXiAkDofSBiu4kaaXgTrnsWt2ErnaqYNY
         /h8ofqR4pEQgJJ2CKSH/UdH8In14/qjQsKHkdga7K9QBIBFBnltURlpW4LZvoIQUzV6R
         EOEICG08z6niJXeZXwdsQMGWV679Kc+TGeaV/s+Uk35Fmr79uorDjHL9UwwI3lbNqVyZ
         MoDmwDtg5j1pQ/GedOaa8Y0nGAxAtNdIB+WBeEsUiD62gkdjgP+5hp3plWgqb5Q+oM4N
         NyWg==
X-Forwarded-Encrypted: i=1; AL+hErEFTnnUSgGkrSFEXpOzBzrvkUjwpSlMKzJ5I3XUD4iiu1g/qHiqm5hKvFxbceqgB8vMsOhr5TZBQjg3aD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3pH/2t5w/q+nHFk4CL6G/oUiyzC580vzlBZ3QxPVFlUKLAhRx
	StwDQMnMqcu2EiA0FAVcAEGyhVLw29uH8IGYgsPRQBBBTZjxcutRtBVy
X-Gm-Gg: AYBFou1VjK6CF7EzmEzeFk2mudl7MMvBfLLTxc8p9KCEQ6DZu1OYYeava+FFwjPYJ7I
	8W2R5klveFX6n+Wikrd4cwLgxydwHcHPw/XXpH/Y3UL9oHT6XBd91J83kKNUdgutS2L4YaHhgH2
	/Vy3MSP3d1ol0AOWBd+EnrReErtTmMzZ/MbTIISIAGC1aKIpyRmDjK72Mm9a2qxSYDSOe+vvlN/
	71OcznDGc5XZ7Y5QpovU5+dRu42U6aHfQb7XH90Mfk5I58ZK1Q0RqsEjQ9uFv/PmXnKl4UIfg5G
	1RbnEfO+cxAUPziyPyLTqP726U7IQLQ0Pzh6uOK3iN28GNfeSN5cJFVDbth16AGCo9XOOFROlzp
	+/5ECGY+la1Lb4XwH03K4+Yb0qZzgAmAwusPQxs3UvMKR3rdelqCD/F4hR9YSV1RsgIJ46oy8hq
	B1n0hCqRrUiH4LWs3oK6gKymgVIBhtMTQVgrtO1nfWzHDsWPonDDrCd17UCN1B0tkLV1NH4OJ8v
	WMGVV1G0sQw7jyarot+Oe0dAS8FsawuPPVL6maRIOAn0NWBlFofaLh1ChfcNnuvRw/VR6NhN2jt
	w+GbF0yZWswiwmNM2R+gKpbsR1jDzWD0bgGyGCIp3fHlUsyyy2Xv4OgpAN5thzMMu9Ml
X-Received: by 2002:a05:7301:da0a:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37256bed190mr5906511eec.14.1794211897671;
        Mon, 09 Nov 2026 00:11:37 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265618e11sm10757848eec.7.2026.11.09.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:11:36 -0800 (PST)
Date: Mon, 9 Nov 2026 00:11:34 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: tegra-kbc - check the pin numbers from the
 device tree
Message-ID: <avGAIkcHMhfvn-0B@google.com>
References: <20261103084135.426629-7-zhugl3@xiaopeng.com>
 <20261105021303.4206-1-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261105021303.4206-1-zhugl3@xiaopeng.com>

On Thu, Nov 05, 2026 at 10:13:03AM +0800, Guanglei Zhu wrote:
> The row and column pin lists are read straight from the device tree
> and used to index the pin configuration array:
> 
> 	for (i = 0; i < num_rows; i++) {
> 		kbc->pin_cfg[rows_cfg[i]].type = PIN_CFG_ROW;
> 		kbc->pin_cfg[rows_cfg[i]].num = i;
> 	}
> 
> The helper only limits how many entries it reads, not what they
> contain. Not all Tegra variants have KBC_MAX_GPIO pins - Tegra114,
> for example, has 11 rows + 8 columns = 19 - and the setup loop only
> initializes pin_cfg[] up to kbc->num_rows_and_columns, so a device
> tree that names a pin the variant does not have makes the row and
> column stores write over pin_cfg entries that were never touched,
> and the later check_pin_cfg() walk reads that stale data back as
> valid configuration.
> 
> Reject pin numbers the variant does not have.
> 
> Fixes: 88390243a993 ("Input: tegra-kbc - add support for rows/columns configuration from dt")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>

Applied, thank you (but dropped stable).

-- 
Dmitry
