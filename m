Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359938;
	b=Rs6iCi1wkLmmnhzWvG0KSAatcNdmFVgqAwHKqyikh2MSpk04VhOpodBLmyQxTWk9GXHR
	 AuBxBumbHHcsHn/ZiV2Y0bVcyFZTyv/KVM759xOcbXHZ6V8XmlqAetrmxsVseUNkLwjGf
	 YD6q7KMSVPaY9ee+OuUzfYgxa/4EmGoVdCBSCa0Yqwf8BQVT4+kFuI+SUlL5OEpwNgFut
	 6nPae2BaoiRkvPlCQk+UnJHWQtrrPXyrgy1OPVLM7sSRp3il6MhtIBGDj4kJwVPfuusPu
	 Ql4Iubi+n0XHG0qTa5txw9Yh/JEU4lC+radxskmLCZv3UEX03dgZXk8SIvxtAP/mOzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=OeB6ued/+lD0orJhDR5wIi7Ahcx+qtctB/2Nl1HxV3A=;
	b=tVEw99BsLR6xcb92LkJowkvJKdGAZBakqLBbVAYsrxSVZUv9rsfPxSqa0eEYcAqWIRgw
	 pyRgnk/wTCXKhulTho8fkJhTVNLKUghicR8qiplMgMPQ2mir0egvJXp2wwRrysjOift5B
	 6jTuf1UuSuv7PjskPD5rqqNmeiinjZ8oV4cjL6v/jLBpMm/bHAUx2T76dUN5mJw3PcJGL
	 cVe6M9htLvYJPDtEXFSnkhh98xyVm9LtpbeHrvrKPlY5V9r7zDY1stOCB+vUKoFjTawHy
	 LOtlF9WSmGYvO/vkDBhYJi3A1XN1m8ox6HilFxy7hluo2N4RkfuiMWvhTdFZFkLKa4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aOiFyKhU;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722EE606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722EE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aOiFyKhU
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so276956a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359938; x=1793964738; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OeB6ued/+lD0orJhDR5wIi7Ahcx+qtctB/2Nl1HxV3A=;
        b=aOiFyKhUrjhgArbDyxY3+ihBTaTeD2kFsbbrIVxgVx56pVQlL9P4DhDQHho+/9vfsE
         u7mQd4beU/kGxGWD39ttZca27ShqtZBG+MnrRdrtZ0LFT9mCJAOLlqdNxKti2LMqELRd
         Ph4qWFDwc1AL4nLH8E5rlyMUnhxbT1sM8r+F0uVqTef3rBfW86VRJ/f9ZszOPTcluaLq
         kL63v8pUCUQ2t9batDTI2rvAK+m7MLPEYDWlvsAdwpRHMXPC8jjnR+eWZ/39oy1cpxpW
         c6empdu2YMTGZWrhiKfXf6WZ5YvP2JQhAXw5r9KfqG9z/WvOkQTM3PXj9aCqaDe7G6vt
         nSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359938; x=1793964738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OeB6ued/+lD0orJhDR5wIi7Ahcx+qtctB/2Nl1HxV3A=;
        b=Pofg4FNsBe702g5GQz8j8I6GmkwxU4aTP1LEKtcRhO3WoBjPlrzQvVtLN9AVSsIZV5
         ndDtSzOhf30qBItdBORe10SUxKx4Qh6Y4pbO3F/nZttT9+y4U+bLLtOiz0l1Nq8M9sMT
         xDFW6D7xP9wDTAUX8INwYbR1u0nn34WniDbL/AHLpg23DyarFHjJbQIsBiu1LTFUAIjp
         HRJutb2qYbPcAjQmjEw3faJNwLWEs9bstZQqaEZI3Jb/hURjxhbZUqo+DiqCZDsy2tph
         lP0AGyQABxZoRtbx+Q+eOKmY3++n+iNT/EN8s88FMHjLYgVb4heY7RJX+1oiXkoXRFIE
         h3jw==
X-Forwarded-Encrypted: i=1; AKwUvBy3ZcaWPdDtd7Quwywj9eAkeUfvEE03yvwfDU2zq/Q4yXQMBtxFofQ3hkPPV/2euQoJChS2HXgKxm8m25E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdQeLf4VBIp+u9lM471CSX5cJKuBlXeJjLMIafd8MbTqJmpUxn
	E9ookuzvHIzVHG7CK+uJsXqylSbkGYcD+TjPr/s+RJrt1u7rpnqpgN8+
X-Gm-Gg: AYBFou1Apm8f1gXEogsMxRGAUc79RMePvS9sH/yol1D/oCKAtlYUQgAf1Z7hhZJdT1Y
	UmXMPBQKY/p0HH8vJs52NQJKWNbn7uS8Rhqw23sANQHNzDEBBB4L60aM94Xtbh2ldiqGk1gdfAJ
	flV9NUbtMqyJsM0daw6JBTZNI0RLK6JGnKlCkGlCDhZG6vzvqmS5Nuycje5VJBDXmcTQa5rQFDc
	dDMjzC/j830xs4+vreaaZPrIYKabCpHkUr38yHlUum2BLcJNLUQMHFBdDLSJovrfjWQJ8ciaMJr
	W1kWovS/xUou4mS6xwYrdH6o/yoLWZf1Zm5g7078xkjmg8CwTWm9oUdDD5L5ayeDqfB8NsCiAL1
	6+mWG/l1hWSVCUYYAKYfzBbk4wIwsDhi2RAXpd+OL9HrYPSLrm9wC5y8B/SS47Pm4aRjnj+W4d8
	99WLb/4377bXcZeZRAgirRd8EDGj9S3K4PdfBFJP74MivQdrtLiCPNnQd7aqMLSrm3PHcS0lSRA
	JQIz8T16CRW3KgPtqlZ1yMbWkTrcZDTe5eSNw16Mwqb+MkmQJ5cKzC6iUbxCxON3pL+8T5t0aRd
	F4nubNzn8sBQaYOBf062V3377YvP8eh61v/m36woa6n2ZwihTKXV0Q9R
X-Received: by 2002:a17:90b:17c5:b0:3ac:7c52:faf6 with SMTP id 98e67ed59e1d1-3ae89574d7emr1504433a91.1.1793359937853;
        Fri, 30 Oct 2026 04:32:17 -0700 (PDT)
Received: from hsj-2U-Workstation ([220.248.78.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ecaf5sm3774756a91.16.2026.10.30.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:32:17 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:31:55 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Huang Shijie <huangsj@hygon.cn>, peterz@infradead.org, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, zhongyuan@hygon.cn,
	fangbaoshun@hygon.cn, yingzhiwei@hygon.cn, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
	tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, liuqi@hygon.cn, lijing@hygon.cn,
	wangfengyu@hygon.cn, wujianyong@hygon.cn, 1537577747@qq.com
Subject: Re: [PATCH] perf/amd/ibs: add phy_addr_only software filter for
 ibs_op
Message-ID: <auSAK3OuOOqWtKfZ@hsj-2U-Workstation>
References: <20260902085251.4046240-1-huangsj@hygon.cn>
 <auMrUXp42Djz3zu9@hsj-2U-Workstation>
 <f151155a-54c1-41b1-8905-2347a1404001@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f151155a-54c1-41b1-8905-2347a1404001@amd.com>

在 Fri, Oct 30, 2026 at 09:45:03AM +0530，Ravi Bangoria 写道：
> 
> The BPF filter is giving more accurate data here because neither kernel
> nor userspace should access the first physical page:
> 
>   $ sudo head -1 /proc/iomem
>   00000000-00000fff : Reserved

Yes.
But I can change the patch to skip the first physical page too.

Thanks
Huang Shijie
