Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892454;
	b=oDrnmRvKWlNg8nwhvdtwHY1MIC+foF6W5TOorAQxABVNcsWhNmQmvshN9af4nGdjAYyY
	 hQs8m4FXgacjlRPNzDZxbGNRVo5H+rki0wU/7i3iqfBd3Nv5mMPLOZwN4XIO87ppiQHy+
	 qqZ5YXkmSdSToU4snLOHssDhlWJLKLaCAYE2P1FYJSa1O0fS02xtv4ejTdgx0qK0dtFHF
	 UtBkxDqtVP4MwvS3u0Jw1EyXso0VSeO9wnQjAJvE5UMGTz6EqpROb4UsdQBD/aEe29vjh
	 vHDqCvDxJFzBn0VBNDMAWQGxz2d0lU0dQRMPFteO6XkAPR7vGbqOEA0frBaQstxCDCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
	b=DepiGENQd+s5+n03hZxITUEv3W0+1W4zkD6+JtAPYxk7qxDJytaqLbDTqy+QreKNLoEX
	 /D/3nCiCmvp1T3Wnide9V8rznMG9bHrw1FGR+58orU3TYrFija4zxhmlCk6qleb3G5xpV
	 oONQvNuYePXKsMl5mdxUqqq8V3saJ9l7mPFNoPbJ00Z4ut+JsoLrvHIbCEZf4MPiiuwk9
	 RKBQE6D8eFNUeclXSn5zeWQETNqnPqOVUuC/3i6PQP84MJ2mUyUvsMZvc9sAIzSyoNDDb
	 hNFrnfWubRxwfuH6QNYU2eNXaOJTdvh1RDevjlumnvwKtoX58Zfi8LDh4gZK/TfI+Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TE4Vgrdz;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDDD606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDDD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TE4Vgrdz
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2208202a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892453; x=1795497253;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=eRxNTadvgaCeHSWPcZni5xgtIg6wS0k8MaaASzVv8GK90Clud6GX71YZFLj1YEA8ZQ
         yQy3uKq9QLl7yRv4QlwQEBc6qZ8bKG7hs4hLweevDIQUroXwDZ1NU94PvnI2dEguT7Po
         UJjtr1l6ePx8TkmhuhRaKUGf3JTSvXR5mNh//lag/KaDYYnSuYDHseyRlJ7voMYyRYcq
         umthgZjPYkdhCgv+PRrib2nIBxDgc8L26yeugfcxH9NcgaDT7UUXd4tMIbD5Hfc0cwjz
         qXxhISWlJj/XPVeaqirIh6DvSoJAlivQw6g/H6b4Nc4PBwHpmJysRAhn3F44WA3OqQiS
         4ouw==
X-Forwarded-Encrypted: i=1; AL+hErFT6WHW0y5h2eMJy6W1C2oOuM95wFWzNf1QxYDfip/bLboxsx42RjJmWLzm2gR5kM7C2pXZfpiCWhqtCGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HCu5YrYcSwZm6fG8DW2HJho/DtiiHvtHAJyx5ELnzXIFbn/e2
	gI3BZqy0BlQdex15hBUflXBSAgGXF1Rf8vfQ894hqi85XcECZRNa6B4ZkJPZ8SfThgezpG+ch6P
	uf0GknnqCKVhtM5EWFmgKLcgnq6dgvUKDXfDTgUYYxjIvmelYRE4DA97mn5qkRDcfqDB/TgWeCz
	+p5FMWyk/8T005Y8w0hyiG5cqQHO2td3yz/Bx9YHeHB4nyr+tzTDrF3+g3l0MpEgWJGxMZI8UoN
	KI8IFuLOX6HPOWe
X-Gm-Gg: AZFdTZcUSPAkkdeoRyS4vC/2XqjuAXow4QxEL1kFQhQZZ3pA0lB3z2W0eILmaN9fYxN
	5/5lszxREkDT00XEs3EcYQDCqSjnnkfFSWV9SXTYeRS9P8lP5LcK8u0lBDDpxQrrSWCLZ+sfL9R
	2JEd/5+u9J0lfZiudzOY52gPanKuRIFkZblmJr32qhtINd0/xfZ3a1U7AwLQMWypvWX4vm30X6G
	S6i1zFdRXrVE1WQ/aMslVuXhP98t1BQoELmCKDvJAGQ5lCCFucVG7rReNZ+gail7xcOdmt1cGMG
	Tt3aYhKonFdBhDww2UBkTVFwQELvyIUdZoYP86oazWqvFaZe2WNrn/Uelj5OTc++O6A5CM6k2XL
	jCXS67eYkVQ4Gtdg48MXXQ8f76uFo7LHyRCV2BeAilPMnbIb0Pj9Xi5NidMtcPPtw+qyu7DA4ax
	CwLJBgtpd0KjANSz4XtwCW5PMLd6bcrC/l
X-Received: by 2002:a17:90b:4b12:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b1b0b87a53mr12408205a91.43.1794892453092;
        Mon, 16 Nov 2026 21:14:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm1040407a91.7.2026.11.16.21.14.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:14:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b0ebd98cso376263a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794892451; x=1795497251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=TE4VgrdzvpAk2lcybyJMss0r8q2dgHV33+JsB2u9c+y6OLS1zAFbDia69YNoncSV3r
         ZOCqrfRTnhbWgOBN6nITp+N2d+yss0kUMCifvRwb4e2UD8OuwSfXVMF+HO9wJWF3ZsTP
         8/vuUWb/dNalVVEDLyWbvdzwW410p3k2wFdlA=
X-Forwarded-Encrypted: i=1; AL+hErGcPoZfPYVutjjpHK32Fb9cwIoFrXS3C8lQSNm+1YbgnO9gNekfnqBhyvUZ8qPOJEaiMdheAbtKHFP3clg=@vger.kernel.org
X-Received: by 2002:a17:90b:4b12:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b1b0b87a53mr12408137a91.43.1794892451145;
        Mon, 16 Nov 2026 21:14:11 -0800 (PST)
X-Received: by 2002:a17:90b:4b12:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b1b0b87a53mr12408109a91.43.1794892450642;
        Mon, 16 Nov 2026 21:14:10 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm2060878a91.3.2026.11.16.21.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:14:07 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	dri-devel@lists.freedesktop.org,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: do not hand the embedded sg_table to the PRIME core
Date: Tue, 17 Nov 2026 00:14:05 -0500
Message-ID: <179487959551.2515856.12728307164349809612@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923122601.438892-1-qwe.aldo@gmail.com>
References: <20260923122601.438892-1-qwe.aldo@gmail.com>
Content-Type: text/plain; charset="utf-8"
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Thank you. Applied to drm-misc-fixes.

z
