Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570670;
	b=glBJYxsU6lB9NwGAD8fBQRFGjD8GC0q+mDQGnmDf9hq7VmZah1zPMxg0as6Nk3tp7tW7
	 9L6KnwWoid2RZJqzEpZjIPxCBiFd80RJHGBLS6ZpRwtFh0tnNFIZI0MlYv66/DrGRZ9a4
	 jkGecTV2/KPCMIH9Pjof8eHNN4LMphqPoa0Q44ffGh4kG+V0wrBsfw/0fyXLvgzluanLo
	 dyL5Q5+NVnQjOcb4q9IkvwhRApKzTNPEgPkkhP+RZwjj4UiaZru6dbwv21XSpJ3omxipI
	 ekBLBjSwfF50dQVrumBn8uM9csoLJLQYVOHW01c2XIbaRkyrFcYs4oS7ujJPjm+Ev6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
	b=fjSSM5C+zI51nWIwV9Xtwfa8+LWxt65EIDhGQDyV+eW2aPxtFV1wpVnbKF3bOxGL5Dtt
	 VEMdfAJOV3H3y3sI6o77cqA4RbiwBRi+r/w0cHxu5mcLhncmHdC0NvcEWe8kBw3FY+oQ7
	 lA58I6xB8V7iNjpvkN8+HQYJkOPtaB64BP6er9kfwP8tjNtonxrAJs5ASLZ8ouvxUSZiF
	 ia4nbSm23Abf8rBpMxhAWuTJOXXliTdxRqbQmse+8SHl85xlOaDNzZr0aTwKDfh+qdla5
	 CTlzXXAAEx0UXrdt2u984H2jG9MSlsduEBd8h8nE1V4t8r1mFU/MjzogrJPNgXXIdOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mirI7PiO;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121C606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A121C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mirI7PiO
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2720425e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792570668; x=1793175468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
        b=mirI7PiO+XQCnRE9N2++lqKfbCgF4FIihHTTB/M7TrBWGcq3wpgYpoMSN3hceX3LnG
         JDZCnd0E3kMB3z0yDlgrC56wFFPJn5UjWEDFE8xkymQg2ayJkFx4exex8WjtScOXf1Al
         J3ZmveV+/R2sTIqs+9cDwbpclvCL1xxyzyBXYXrPFEvqNY22nf8iU+gHd/k185UE7jDm
         xewVjy9zqdK9bhcAcLxjdWVWVu7Z0uvxnJdqTIKFRgDALg7hBs5SfMS30GabrjjW6mZf
         M6RWANTW3NZ64pI7VxNMBo7el1tQT1o29hbR2RjduNHDsEc3N2xJgpNPqkie1I6Znsh3
         Cs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570668; x=1793175468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
        b=dXw6TcOejVyAQjFwXjw/HEFTiklFPQYA6AxAAzMwC4cNFyrOrOcCqf8TPOecthNhqd
         g9apCtLFYq0Zny8Dv7ynwBKWHtPvwiYbJ0aZambuGeGe1PKYjCT/Hot8JtcnK1tGeEjp
         q5uESyWXhajZsfwyLGtlv6PzAKFKcZvy0/lgb82r1KmFdF5dM3phpQOAMErUwGM4ut9I
         jLa+WDqxdVxexRcLUD1g8zjrZcuArUlc1pB0tbDRkAEYtteZmcPL5IzOOLVDkfJdPeiN
         1cz6rgegO8KEWOq//tubpjqsD6yf8C0+7gY7Ez29A31BresSNPrKii0A+u6FVLJOYQFp
         orDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU+Eiab1L/AifoYcr0cmWgtSJo9uBsLBgli05IvEk9Ikr8TsTn9Kme/9QUX4DUm78/srQS9ZIxgzfdPqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbMYj2ns8ZvaJmU7g3iuXJ3Jdqlra5y9oeCpNu65/gfPJi1gPI
	ir/gKSYw+xcZO+oorxynOAuu6XB1cObkWfrIlhbxYUuHuktQl4rCvS3R
X-Gm-Gg: AYBFou0xUQp+x6/SvyjQA93TYMwqEG0QishOXCsO/gSmGpfumlcAVijOo9wZqBROEmz
	Qhd8fAU8jJcV/hKeEaqIfOZo3+9RK1g7Odfor2g2uhvy271w8D8CEkKsa3Av+pKbttfeFBesDKQ
	xGc9P5LgNUTFV16rByIhcWIAVV/Yu5OX4LMdasPQgmznziJYWLi7SanLB3KDF7alnkUEbUmxu2O
	y+ltya9x68va+WEELGON1wzTY4J2Jv2jA1UwB1hYh3DFajSnp4QDNORfa/eM/md18AOeLLMRjBe
	xuVpgDNGjYZZu3OMsFTd2Cs0NcUi66R8xvWXwMDjXwQhHHa7Ka/0COwexuDMGXeDnbphgZIKPLo
	ZbDdByP4+ulCyTKr3eTuvrwJpP9ZAoZv23ZQP7QWfQZIaB+vSH7lqMlJY2yeRT7DgauyWKOREEV
	WUsTERVA07mV6PNr7HU7eWrGd1voZDKfJaOt6J9VXe9oba0qcFIiRRxt0MJWYwiCtPUhBRpolqs
	5cY0ju/1lPTR0QBf4a4HoBaIqP7MaIc0CiYBWoBkVMUMooyzttFjnQhAgD1DCQDFQ==
X-Received: by 2002:a05:600c:c8c:b0:4a1:e489:f8a1 with SMTP id 5b1f17b1804b1-4a1fd89d90cmr22391725e9.2.1792570667667;
        Wed, 21 Oct 2026 01:17:47 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.12])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828c98sm3848877f8f.28.2026.10.21.01.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:17:47 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Wed, 21 Oct 2026 10:17:37 +0200
Message-ID: <179257065767.2798.872990041874023890@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
References: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
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

Sent: https://lore.kernel.org/r/20261021080517.2161-1-okerixx@gmail.com

Narrowed it down meanwhile, with the clamp corner selectable on the
command line: gmxc pinned at max is harmless. gfx pinned at level 11
(0x1c4, the top of the perf table), 12 or 13 fails every time, level 10
and below boots fine. So it isn't "the rail can't follow", it's the gfx
rail sitting at or above the highest level in the table while the
firmware calibrates. CLX being a current limiter, a limit entry would be
my guess, but that's firmware territory.

If the CRD still fails after sync_state, gfx.lvl being held at the top
level by something else would be the first thing I'd check there.

Oleg
