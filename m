Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534610;
	b=qRKY58wMRhfEAPM1XrJOwbihqZ37f2cD6+ZV7hs086aRMk59MNdM6uZMQj7OwQJCJw9N
	 A4p/gLDJqvic/nLTPfk3yTdMQGpXlhoBIBIPDWEZRebq0ducErrT3Q1yRHWouYKpwOVbf
	 DR01n2WrhVCMa1a6WcZROumEXU9y1FsGKh5Q+lRXtaC3QrwwZbe6DWNX5iq79YgeLxD0I
	 X4Gu/Q4kVQEzFnjJpD9J4LTqR94gcwemsHOzWmbOxqctWlhx/Pw2IjxsrCuV3KplgY53T
	 EW2vqwVLBgswUj7KJwiGz3GqJXlbllB+6wOEy0XEUTw53sS438sEHr6w2UPHsthDoFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
	b=4hANykhVlpWRkiGeGd/QNPxkWvwbr5Ps7JaO99rDC3JYMgoMqBRbbHa4WRrVc9cyVw+H
	 RQIYk67JI3NWAvXDl/6R9ZHwS1WB2zNQersY4R8ewGv/UP1KajBfqmoXxKaANzQMDQsj8
	 TuXSPie5ztIB4F6la227fC5vxTrM3J9JbdME5lDwWkWsvB8itCx/ZUcrf6hCxidYSWYUv
	 ndC2QEHTt/hPDeGECvrfvO2oEsWrFyxQ8XXqUOX0bJ1fGuRkBKX1c1mykb9M22rgxqkEJ
	 vL6XAikeUez5MsscltJJwhqqqOFHxWxYKbv/bjw/WmNqQ1h5SG/StxOmj0sgF9ryBfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=tWp0rI71;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A40606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=tWp0rI71
Received: by mail-oo2-f7.google.com with SMTP id 46e09a7af769-8615bd716c4so221241a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1794534609; x=1795139409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
        b=tWp0rI719UU142KQhb1yPGUl22F17Sh1JUxpA4NsFc6kEp0tYVQHnx5pXkb/LVfX1f
         apiUvZt7erHl1d1SZQPcXchXhdJwr031RgMcmeLjD2AqxA/cjX+tXAMgMye2C4J01kmW
         4VCNg4tNBzaeV2/xYB+XAyTMxKM8cJPuALGzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794534609; x=1795139409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzinTeqzEqx9VDWaxVqJ4vfjVAjHu7CF3CCxvyfyEck=;
        b=zgB/fzkt2fLKuaPX2xhu+jI2wc1EUHItKfnULVG2YLPtxJuNS99kD+NDSL2tBA35Fv
         EsIKHAF1W/sZEBGmtwMWp/KQO5h0Q1rmYMx6D7OtB/c+zXIxfgCDnTNSNWmOdTR2xv9j
         uSxeC0CUjOcGiRQpfkli6iY0MNEvKZ1jsIhKhEIE5VNqIRTkbknm533APZ90WbzpjGSI
         iTUKNHS21uAfNbzaysghjtvU8kXIE9k1xirHO5sfQhjmsXsX0z0QNreZXSZQv2WDMnbi
         nEZD/qy5XON7fFaxDRMgh+9tyOWe912983yLv1/GTUVYsIxwyzeKKbE7XtZgUYtvqjNs
         el0A==
X-Forwarded-Encrypted: i=1; AL+hErFiSOSODa1hPMyvuaGld48gA8OUUhhy2+0H4HhXq2fx/hk6lxjoWJaSJjiXjma+J2LpprSOwRAG6k1M+cA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ptKnZM7JnJzoeUOSO8bR3grBH6sY/z4U2oeP+cBfWxRtQMv8t
	Rc4a27U7R8qsn64H1V4C+SwYZO4QpKgEyDtbCbtWxcjFEArS4kh4ZofkIHi6veltbw==
X-Gm-Gg: AYBFou3fVaoJ6FaJk9+QfYW2r1Jx5PRTO/W8ubb91vu27iSvwkJ0OUEaGFweZH+jAJg
	olpkj4OG1JH2+wmsERozky8IUGoMfbppE9LfPN6zYlX4AZykV3656SmJacbsZleL2iAzQn7W2Id
	d/kQ2WbeuzOR17/TI4d2OoEf+7t2y6g9I8q4ZrEJNmFEKFoupMJdWWbHOP6OxWir29+AHll2Jbu
	TdL95SwqGDp27bMaom23Q/DGAftRfuZDaSkQjwBOAKHffVoLnCGCYjXEMFUAP3e27mYTw2vgxwf
	KpA1JInEg52Q1EtOW3qc56p/IAlErBcF1oVThQ1jh2jC0KIg9MvjiGVA46+/g5uNShNHhAfDT7n
	8pJ3EQDNgmOeDHNvKTDSyyDmc+9JfENXWVWE49O6/PTBUf70DVaBA0rfifi0x0HwUBAJCE05Vhe
	NlEquue4JIHpRl2Z7AwFIqVJQcz+V8ojR7J5Yrg0ZY4Qk6Rv4+To/WGVXhkoI2jvqiaR5j7c/3R
	xM0Apu6LB5qatrXqk1c/Sd0ICXklEZWjjWo2dGqHUNwn5PMU7AYO5nrvvVJvU/gdjgrEHjWdIya
	Y17idG+BWjRYP/W4lukwkXiQImMIvHlUGv7LZDXR3iGsmlTOsC248fQWRgFJeVAb9Z/lb/MtkKN
	SUOxdo3mQq6btooqrUTRw7XRCMnSq+vp70ExLr8y606y93OwAanbZVd8J7gmSRIrQZiFAiM1WW5
	lrxf53U6HiI1lznKC62pooH97/me7eMh9r/fJrUWG5jJLG4iFyy8Evtq6SrSFFN9dKdNlBmTZeJ
	fGjb2/A
X-Received: by 2002:a05:6808:23d3:b0:4f1:a873:6efc with SMTP id 5614622812f47-56e65a25c0dmr969736b6e.64.1794534608616;
        Thu, 12 Nov 2026 17:50:08 -0800 (PST)
Received: from [192.168.0.45] ([187.14.251.153])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm811902b6e.9.2026.11.12.17.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:50:06 -0800 (PST)
Message-ID: <3e1c4b83-9eeb-4425-8231-216bf6c96038@nilk.net>
Date: Thu, 12 Nov 2026 18:50:04 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ipu6: Keep psys out of direct-complete on system
 suspend
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
 "Sapre, Sarang" <sarang.sapre@intel.com>,
 Divyamani Tripathi <divyamani.tripathi@intel.com>,
 Manik Bajpai <manik.bajpai@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261017-psys-ipu6-v1-1-56e333f6ed04@nilk.net>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20261017-psys-ipu6-v1-1-56e333f6ed04@nilk.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, Oct 17, 2026 at 04:13:38PM -0600, Chris Simpson wrote:
> Since commit a1fa010b3c9f ("driver core: auxiliary bus: Drop
> auxiliary_dev_pm_ops"), the auxiliary bus has no dev_pm_ops. The psys
> auxiliary device has no driver in mainline, and its PM domain,
> ipu6_bus_pm_domain, has only runtime PM callbacks. So
> device_pm_check_callbacks() now sets power.no_pm_callbacks for psys,
> and device_prepare() puts it in direct-complete.

[...]

Hi Sakari,

Gentle ping on this one. It fixes a regression since v7.1, still
applies cleanly to v7.4-rc2 and to media-committers next, and the code
it touches is unchanged in both. Please let me know if you'd like any
changes or a resend.

Thanks,
Chris
