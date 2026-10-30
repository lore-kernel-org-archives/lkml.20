Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372580;
	b=beNHvrX+WJyMELdVaZjCPH+JH2bn9p3EbS8RDyMa9QxvTC0RSmpk6nxqMAQTH2FO0YQJ
	 VtmnXXO7YIizyMsnQkBpZnndERGHMrORZNHldNuvsCRHIja+HZXY7+xg40bkRAcx+Zju/
	 JobyjUpIbW9JvCMOp/tBRkz8q9gzEPlETLGeo5ZhzdKXY1+vLCJ12NDoyRHTgdd82W0iy
	 R4nC8s6Ch9Ths4e9tqGpO1FECGfpTgmSMNW+TrIqYeASFovqRGpRzXd4+2iv9u0wrg3BI
	 EQXB4Q1bfqYjuhHAp/kTkozaqYp5jJczh0jC83nn7oJ4sHZMtMKsJ/c3/5fXeRfW0fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
	b=JsKr/WMTSXxFHx6ImcLKeJWGWyELF1er4b3L5ytdTw9aTtRAS7fetJM5WO/gSLkSAvQ7
	 Ligk/ofn1HVe+G6i+40cSGsTpkgnNN5SrY7cEc6xjxL1GEA6FixtNo7qzwjAxevgwPSSx
	 wPbpGscmo1AOs8s5idrUl+qTAkJHhkZhtaGQPhHbcgZSidhIbfokAPKprt3RVpt468YG5
	 kiVZZo83o9h8CWN822ze7TvuhKFMcS90KCkfsAMralqhaXHzQq1fzpFvbH2lwTC99l1Cf
	 xjcosYoVSZbGcHPSjJISacSlGv/bJf6p/g2civv8ZIo2+4HM1hjRAWjsldpAPb3yczA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wwfcN5xh;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB89606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=wwfcN5xh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6262745e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793372577; x=1793977377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
        b=wwfcN5xhJxmJIEs/AzLSOKGoZTkD6+8NGP2qYbyNFhJ3ZePhPC12lXgsmIHSzpBzcO
         71d0fBrr1/B0EVWRwTU4JSXXvJ/Wr1eHyWOr6vbvgmdkDIWvglRqf4i9q++G0XE3NJ8i
         S2xNR+q8cf0+NqHemf9xQpAofRPyggoeqvaCmnZTKQtViK6XnkkmWIqV5NXQQ7TxzVF2
         ZZ0TVZcs3kkfzqhYZ3v4MGg348nCq3l3bT/bwopwha2MLL2cYn1f5N9xcPZtRK96BFm0
         9J6dNo27JRTdybTsDSGt55KhTK18zZR2Ab+2mEsVjSiKfFzKHINGh8jYyPI2Ol1FvCLG
         s7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372577; x=1793977377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD3FTctKH+htDtI40/USwM/+YwDf042Qy6l0BgbuGzY=;
        b=pOWJEru7Nkh/oTltfWsoXDpZnzkMbEu/JODzUklwuusc/0z5sSyctf8FdWb8ksm4v0
         zJfVJmnpLqMqoDkrD0Casr2/FJ4+MxOlN9SKnVA9+pHLOoQNQf3ff3vdDxYzhGR18TDl
         813S4Ti9emNif1sNwc99T3dGYwxHJS6+Oun2rrNiB9sB3jV/K3ARY3JUmtEybwKW1BCC
         6KMccGWEv34VgL71YqVnCcI5nnryPVyYP/dbggT2c2XKf7ojjCFn0xubKW7IiYwBWJ2l
         tTeuv1b9DIOIHoTfmMo8IAAewy50nM4mEErjhC8BOdVuSuK3lDrWjqrmRLFG3NQNhnXj
         A5zA==
X-Forwarded-Encrypted: i=1; AKwUvBygBwkVlmfZznaJMh9sGyAA9SlR9mc+aQW82fXLkvlcq8F8TnFIOpU8OheNmvKkEVjpeEIHn2q9cjIz4qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmqj9q1fq5PZK9E1Pi3gc0DbUP/G7D3CLLsfwDPKlPjVQMlXGA
	FhjJO0Lrxcq1Yt1Fv2j1MD4tFULZpeM9YqhXMR2a4HWga/St/JRvUDx2rRhU8Cd4f/w=
X-Gm-Gg: AYBFou0YAVaSF18ELI/Ntqw/GBz9/XCltxzCKf8+oQp7gs72luwO9W9yIkx3SOfZ7Q6
	CAASF7Ad99ILkhn/huECkpsftFSr4wfAwUeOI9Rl7QPSyQk6LggTxm8wcX8tB/GAHqjRkjtVXV+
	UvGgPCSujTTBl8B2WEp+aQjFFHitsueKkx+ZX80YkIM9Rxuiv3sa4pTfwHJrESq1l32cNvhN25Z
	Diw9k0KsJb7K6laHzXu1gAbZ9BADja6JDc0OYTYV8Yx5IqOORvPv7QHU4LaYb5OZlaExAEClPld
	F/qcmuL/XQjNggOqAssEwZrmcnDKMDOijJzk8cusZ4a6Lbq0NDH+Qq+hQF/TeQYHGM6nrNWdkGc
	m3mK6VHczOtXBSfKgXa8ukLskLGi/Wa8BQT3+WsQLKI4agKdeHlACYbccRTTXVzVF1XyeaXMit6
	BLIFbsMqlvITVjy0XiSHG6qaqP2WjwgzCJkF2vMUwyJt0Ladn5tAQlYtSus6U71etmBQTUCuKQV
	pyMx2I9k4Hf+9X0ZcHrwjQQJPSu4YHwW9jyv+gxtR6ijbs1+3XMrV52nqzRSOns2/VrEnxkv5wR
	sT6VsgwhjTZ+GLRyg5S2CMKv9vPvtH1w8m97y16i
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr55863395e9.31.1793372577101;
        Fri, 30 Oct 2026 08:02:57 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm3623785f8f.36.2026.10.30.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:02:56 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:02:52 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 14/20] attestation: Add the base family specification
 and generated files
Message-ID: <auSxhgC30bubNJpI@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-15-jiri@resnulli.us>
 <179302367452.58760.3782556786585774917.b4-review@b4>
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
In-Reply-To: <179302367452.58760.3782556786585774917.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:

[..]


>> +++ b/Documentation/ctlv/abi/ctlv-attestation.yaml
>> @@ -0,0 +1,184 @@
>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>> +%YAML 1.2
>> +---
>> +# Checked-in ABI snapshot of the ctlv-attestation family, written by
>> +# "make -C tools/ctlv abi-update".
>> +#
>> +# The checker compares this family's declarations and inherited stub fills
>> +# against this file. Updating it is how a UAPI change gets reviewed; an update
>> +# that removes or renumbers anything, narrows a bound, or makes a placement
>> +# required is an ABI break, whatever this file says afterwards.
>
>Have the generator emit a line showing the original yaml file this was
>generated from?

Okay.

[..]
