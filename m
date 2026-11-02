Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589534;
	b=zYLPRXKyVIMOzeMTAquCP3r6HQshh8x1vmoFM88ZuSf7nz/67nGcEMM4mwUHPWzax82p
	 +u8LDOCCwJ5jZuLO0tv0ZveKg5DO2QrEYwPIxZC0bVtPcWs/cJVFOEaqjll4qP6kKunnJ
	 vP67zAW7Biobu6yQ2zA4RZeg0FH6W7C5UT1P44AiJwPa4+/1assVsFEv7TmNfoZTMqcv5
	 BLmZcRa6wNDNBDFyfSEFdbqcWLMYQPjASUrl6YCbmqdHtIwpAwzrVezkRNrn85EF8JwT0
	 vjum9DdMX024ue1orX2OwzilKisH6GkJBId75bM2mC5fFHJvxjlEiwD4ihP7/HD+zKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
	b=GzqfRrPelQ7ay6WNw47CcLX3NBISOV7vl8tWwmZRpT+WGfIQeDoDbi5TVOPqFLYvEK9U
	 qY9xbnDlKfy68BfjnAtlCOOUVNoAa6W+r2mr0REgrC852HDsATmGwEwW41X80VuOwUjWb
	 EM22VbUNoDMYfoNDCvrWVsKRfHixHlsNBeKNbtVHgJvPg1CdjQhQZ5nrkkROaXFc6O7ji
	 P2oQ0Uo1lMplXrtoEsZTXUWikWBer8jVsq9dOxPhoqmsC6b9Egfg0v9PUGNAIdzK3PkMD
	 W2krfPVw52avkl97bbuOeV10Gk+tvcWUD4zm0lihPDsBHwM3wr/TwGiWfyAsRSbqqbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E845606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E845606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so3838642eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589533; x=1794194333; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=HzdV9ohTmNFyqmLLsDCqmODyoy6Sx31mv0ijemiLjdQg7hHw0X40I2CBE+mz0w6uWC
         aNYtC6Yu5CBBGxnEVhvE/Y4P6wEZVejk2WgvWSIhziXfRTXvLOnmEUo9UxTr7iP4XE/3
         2eEplDFJDBFyraV/0AW3CWGNlYcrVqQIpT2k2nOGcHrMMk5JghogbQjvZYX+UKpoAakp
         Y1Cxg2O0X+lnxVEt7t0wL7ZtoESdT4GuM4+mampJwV4M+gY1pIlnVR9DJfvSBaw9QIpW
         NQcWRXEroXcZLMc6vUr7ZvMWPYeFlup5uPOXrbCj0dmNQE52XCFrdmOQbDZhTClfxJTa
         y+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589533; x=1794194333;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=mYMQ7750rPT9RVf4sZdSwEMQsVxI6Sq6EA2hzLcfjObEevFfovxL8V9bAFt7EanqJ3
         pC0/bUCsxKbH4sHoE0UzYLWiGznyP2x0ipdiJStI0dozuzQ+WCB3yTTn/GfVUrao0Dhp
         3rSzo9zfh1HEqJO695IOWJZLAEmD97Ysk/Xh3rw+cGvF6F1ZmcOBS3x6CWo0D9okAhca
         r1HcNO/cIgj69RZdK7lZQ0Pe+ujflww4SnwHKpAprwmIDsbnO3TRHmVYXK4+1hEL++de
         QTcNziVdphzR2y1Y33Mxdgn6gx85F9l+pC2WfADidZzToE87RWhmNjrYShSL5u5StuJd
         5pYA==
X-Forwarded-Encrypted: i=1; AKwUvByErqvh9poDM7gfirt1GkOXbXA9fVGuDE3m6yxtVeALmsgQn60qSrns5yjx4h4Wdl9ydjjFsqzUJlsAK0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pnXXCKvL5mU1UvblA59tNeGpbP26eayyZHTMmpmpKchCjm376
	vTjKJhF68WBQAFyuLqOiwwSjdApuFkLaV2TkHhCG9Uu8onIKfMyH9ymHdUsXXw==
X-Gm-Gg: AYBFou3nrlztg8O1Hk0WJ7EmRnXVsBqo+dvhKd4YXQJOmrZyKMB8lbS3IkdExWxxtgA
	fVBSUh/E5TEBaPjDWitTIro7aVJdAIfzwlf74I5DKdICoOPexMP+dO+/gl4/SLUipUnOum1s/Lq
	GrPdRhBbDsfoB93iqWW9nsTeg3Ov2ra8mlvggAfcXniNmdajf9WYehW7e4MXZxiJqYmmlSrd7AU
	Iv7L3OSZMorb02YHxbXdeBSuqdhZJRDyJ6XfviXtmc6KIoPu+RJ26Z5KJgXRgttTsHJ5WBlnwR6
	2Fhzl4o59PtwpstQUJdTVt2FAX0JnmibGkTkLfFWMaFPzfMWf+sRv81UGKbEHyj7xqd3dJ3jERS
	6XyVACjYIw74N4bSeoQHl0JzFIzPuI/5PbJLyc/sXbYeJRcl2NAD0xy0WwJ9ySYm82YMoe1E6Hz
	gB5Akhh5w+EIdtyxFYatS+huOp2l6oaGK1VOG6fc5p60utw0PGH1OnW09O3F9YSWjBh3O9n5qkl
	AdKuoWeKskrrnmHGDcyo54SDF2srno6zs5Elmmi28/ybW51Gq3YeCeKLViuKXTGSeZathiuhJ6l
	6aidkAf4odyDsTjVmAZX7DoRZ2k31hAmB0xlGXI1Hflq6qW93SomhKqHB5f999u5nbFNims=
X-Received: by 2002:a05:693c:20d0:20b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a42435927mr13964731eec.40.1793589533040;
        Sun, 01 Nov 2026 19:18:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm33411882eec.24.2026.11.01.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:18:52 -0800 (PST)
Date: Sun, 01 Nov 2026 19:18:51 -0800
Message-ID: <4590302cb7f26ea6173018f5d7083977@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Input: support for STM FTS5
In-Reply-To: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi David,

On Fri, Sep 25, 2026 at 11:22:18PM +0200, David Heidelberg wrote:
> Used on various phones. Minimal viable driver.
>
> Includes device-tree enabling touchscreen on Pixel 3.
> Also, tested on Xiaomi Mi 8 (device-tree is not yet inside the mainline).

I applied patches 1 through 4 (leaving patch 5/5 for the Qualcomm SoC
tree) with a few small adjustments folded in:

 - In patch 1/5, added a missing trailing newline to the reset timeout
   error message and fixed a typo in the comment in stmfts_power_on().
 - In patch 3/5, wrapped "const: st,stmfts5" under "contains:" in the
   allOf condition so the check keeps working if a fallback compatible
   is added later.
 - In patch 4/5:
   - moved ABS_MT_TOOL_TYPE setup from stmfts_setup_input() to
     stmfts5_setup_input() since FTS4 does not report tool types;
   - dropped the undocumented "stylus-enabled" property check so stylus
     contacts unconditionally report MT_TOOL_PEN;
   - checked X and Y resolutions independently before applying the
     10 units/mm fallback;
   - added a check for !sdata->ops in stmfts_probe();
   - fixed the GPIO name in the "mode-switch" error message and a couple
     of minor comment/log formatting nits.

I will also send out a few separate follow-up patches shortly: one
teaching touchscreen_parse_properties() to parse touchscreen-x-mm and
touchscreen-y-mm directly so drivers do not have to open-code resolution
handling, plus a few fixes in stmfts (not aborting FIFO parsing early on
non-touch events, validating the 4-bit slot ID against
STMFTS_MAX_FINGERS, and switching coordinate reporting to
touchscreen_report_pos() so axis inversion and swapping properties are
honored).

Thanks.

-- 
Dmitry
