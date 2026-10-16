Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DD13DB335
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156841; cv=none; b=Abc6PA23oiholE9iUbVowCOpzuC967p6mVmp7SiuTmfwBRY+YKw4NLjlrgBuDHjGch7x9U7gt0Z9R1MAb8OvnR4eE2EUam/y+P6mQM0eoM7HTHksVXHpDOQyBCOhmMCtT90OKgwLlaFvlerz1CZEWRMaP1qCvzlDIvyReKAsR5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156841; c=relaxed/simple;
	bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcMGIN+yB5TYS5PJQDbr22ji3nH7HAscwjRnzTS0TQNyefo6K4ujBUPOCIRERYyYfCuQ6BybJwfOkvTaa1lxdwy+gFz2IAUXQ0018fgY83NKr8+HRS795XtOMVg/m9EUxJKcDTHHdrc0odA5+6NhKaNlkpy4artIPo2VlhgTf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZervzatF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZervzatF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8fe8e343fso27777395ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792156839; x=1792761639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
        b=ZervzatFkoo2sXjhZ1M4J+7RUPhjB20lIDF0+czu65Gjrr9NrUEmc51GmMWp5zbm2x
         HhdULtZrHnurc2nJtN9M11X4rRFICm+1nhuggXWKHZy8K/t4wp4HYusiCw0LSjXXIRLw
         +0zpn2VClUnOQW0t5gDM2gdBhZONmtLeNvctPIeGXJXzvB73Vg+mohA8D6BV6lkXm89M
         rtF5P4OTnQKSpGQ8Ofxri8bxU86XUrfKEOlwcEYK+06njysL8IDVgpxkfFnUdarMGlaz
         ddExseChODmoo++5Ie9apti65rLv0VvOOuviKi7nznOysmcYJ1aYtCgxRweNEK+bwe14
         libQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156839; x=1792761639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
        b=kpN8NCtnPs8Iu89TBk6vuh8n0Mfv2Z7is/0cQOi/5QArf0ouwnx4enggVStj5wzn/7
         gEvGsZ0r0zjXNby7Os54S5EdXg3lyV9YjgNqp6gCkcTbRID0nU2Lln55FZggjMM6Rp7l
         UjBFLXKB8KHv/x4T7i47XSrOuUAGhewRvMK1BsyyqDfuFfP3uZfqaaxxjU3FC35MO0xu
         R2SlWgQARAXo7dafmQX+7JlA8RNIG4SFg0NGdKL3idsKroCiqioEGVJD5HN3K90dOULG
         ipizSrxjEHTZQ/He4c6p/8EP2pardLPnTq/uO6f26YEcWuKwfH9MVZg0wrFcoGmgAdXk
         dMhg==
X-Forwarded-Encrypted: i=1; AKwUvBwThYPQ2ItZAFca+k+aBxcXnETQngeGVlb0I1iHF/aXfeRksFiM4bf1RSK7NnPcNbNRFWKCdIW1du+Qi3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUxx6PDsROtiYeeWyZCvfNkcuYaidCkCOlAmgXPfkzeoLMiS42
	4Dng5b/pSE9YXQMVhSk1PMfyhuXq3j3M+gvswaeirqQ0VjnfFnVOZz3j
X-Gm-Gg: AYBFou2S0HBDvYSDn6tV0Rg/zqDUoaw5V3kD6kasBI4A9KuJI+AnPP2PRQZaF4i6L+3
	4+Rv4QoRssikA2i2ZCm8MbFGAan9BmMVzY/jxvXdPblt/hEBM5MowFK9D1x5Gp+wJ5CjI+wtsdG
	JENpfXCHef3auwSPMBUvqZzfeXC6C+ElK0+Oiusl5fHJ8RCbWmc2WYks5RWXWRdDnwUrX/nD7PH
	WFkHST12RZ1Rox6HenLexoj9jiuBjISgfzzpKO/AI6ic02PB/4H8KTv5CV1INdMtuICtT9SlgrE
	7lK4AkdtYEUblod5IzXjhk20nrciNYgV1GQfaRnBrKA7OCxRFjx3At9kNPX1OIJvUtT/K/jZHUp
	d5CmcqCMDChGUfcNLOGIbVq6+hW/E4qLrTK6XbH9kkTLxsvPKHm8+JuweW6LzVniveYg6j8hBYt
	8vn3KdsOsUxGvvfoRY9hLBXZORBgN0Vdj+ramgfvB7F49GMkSFEC+e9M6jzam0g5EHEq2fx6AwJ
	KmI7rSHgkPoOQ==
X-Received: by 2002:a17:902:ea0a:b0:2e9:492e:1688 with SMTP id d9443c01a7336-2e9492e1786mr75900865ad.8.1792156839354;
        Fri, 16 Oct 2026 06:20:39 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8997edsm10013245ad.63.2026.10.16.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:20:38 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 16 Oct 2026 22:20:33 +0900
Message-ID: <20261016132034.711-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
References: <20261016124600.31-1-26rote@gmail.com> <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/16/26 3:14 PM, Konrad Dybcio wrote:
> Please remember about Assisted-by tags if they apply in your case

It does apply: I used an LLM for the analysis and for writing the
patch. I left the tag off after "docs: remove Assisted-by references"
was queued in docs-next, but I can add it back in v2 or note it below
the "---", whichever you prefer.

Thanks,
Joonhoe Kim
