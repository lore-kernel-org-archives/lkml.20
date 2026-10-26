Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992609;
	b=RnTlah2kKxNr1AgUu2E9O+Jvem25+Qgm8MSHOGEj3x1i+zipAaWjxGQZrE/ggOvtKPVu
	 pn7mwdpCIvZw1AQ76lRecdKJVFqbjdLp1T+2POyeRrgLG/NCZpZ2+Gmth7eoeV8kL20Od
	 mTO+0mgtX4Z49sHxe9b4HysgDn5EfGgliDzszCjp+v89tWjj/esUH+oykY9F166rapVVS
	 A9eondZWEJO33Tf9QB8ph71+QXKF9weu+Cu3/bWY+hQm7r17tpbfTN/Jgal9lBar9QOKD
	 UP1E2miLwTD9UdJ+bVX5gRazMjKP6BW57BleSL+i6cDfvef4Duv75xQBVAPHI7ixllQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
	b=xyp2G9OaJidVbT4NoyvuSeyZwioBJNOchq4MQ54CeSoRihzhsgLw5q+CLhEJY9GCeiGq
	 j1qiZesEVnVpySul6yU2wjfKjj1UsjzEb3MselO3CdQcS19+EXS7cIPt7Pi5zkCQpjOwD
	 2Zfq1mT7wwhiJEZ4tROx5chX0c6TrBWhSsD9KDykRC6FkLKcX+z9NPlG66MHi+Gi32dEG
	 AgTW5vAi695ibdu0qoPBYAmyd+uI1Fl2QuZp/lJk3p8L1hJOkpWieAJ5HH6gyAXPtCFmy
	 ij8XICzE7Ra9riAtaleO2wswTRfFo7pkmTpjJUX8pfiIIcJXNA4b6yWtGJKaOlwm2xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gthIh1AK;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC28606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gthIh1AK
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35943f55c06so3592676eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792992608; x=1793597408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=gthIh1AKAU0A3AJJG069Cbtlgxlem6fGpkULCLsWK1TM7qt0L32vkm4SwAPpsVLD1a
         Zk8fsxIyOoL0yXA8LNGkT+UWyitP8Hdh3MUB2nhVWvwvTVwYxyfVMdGfYMdqf3Dz+EAl
         KyCQZM94tCvzVrcKCvLOvEEblmzKBU1nMInRbR4lFBmO3lXdK2Tn3/6U/HxOOm1TMQLp
         LSoS8W4imx/fQzIYVzdXoML4S/clFhy6X66qFSWkazQ/eFXqIZgWWWFJACbmdvCpl6to
         RDu0QmQB5lIHpCjEl0QCv1WQmBbWZkSqeD2c4QBmLATFw08ZlqSHWoSpHJ7R+tvJLnIQ
         SKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992608; x=1793597408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6OD8mOSD4xUumfZoJOx4KZDALoWc84UxiNE2jvRNJ8o=;
        b=EkcTLu5aTRYLBxprAo3kLRuHGOgy7ej7NNCmN9NI9ddTGwB6meif9GN8cV2PIyKZn/
         PU1Cr0By1DInuMuNZ0tASQ/LP8eKvGrZQr01TWJdy3NSq3qCPQ4kuDE3hGbH5qs+Kaa+
         AVWoU3DeDyclF0uTAIHvedaxW/SliQmkDviC7xPSCoDcfFkoRljYaWlG1ujSMdfiC8Km
         Bqb40Xtn7Swap7zGb3Nj9rPYUVynqRHTNirDFcAc5zt5L5C/dcSUZbShAjQMyPQgT5Pm
         h8VCTRs7OnY37SehQO9xB1hOMWEs8qu8zpGFRhvRKIy6kFnQn7e9ijOjP3mxpJtCSeiV
         uBYg==
X-Forwarded-Encrypted: i=1; AKwUvBzrDyUQVemdW4DPjQY/U4Dq/xPQfTl+xwt2QPFS/tcUDFJ8TsO6YW5gB6Cg9w56bUA1I6O2yGANMz/1+9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC5n7ecxY/ftO6N10719kqB1Rnhh09hIHCv6vHcfIx0kgOrnNE
	ysJ1PJ616FYVH4nRzOgRnbDpOM9BL5w6DuEtmUSrifk82wVLD4wm3lxZJzEbMUtupus=
X-Gm-Gg: AYBFou08jrYSvZlgK1vRLUCT7dsvFpuvLJ5N/J/kdHdOhooGk+1PTf7IDwboedCUnhl
	AwauA5YAt8upUG26nPCTUgP91/tpN6JG6P6FS1TGvKT1m2f43fp5PdrHS6U2b8ihol9ZQPM2dOV
	XRfTn8qfSed6FfeL2XeQ81K7Z7DUtkmyDAM5A80vxomb+ZAOU2XDtLl/AZvjMMPxClvMwVbUaGq
	ZgSUuk5RNixnHWC12ZO91bCPRiGsG8NM7Gz9qUSCtxKRdHPXiCSiM3XC5F1DxNiuqacstYq6rql
	JSWbQ6KVO405kDNOK/3cQuDpjlPTkDEB7yegBtHW1EsJqThvoHaDlluh3mrRoRd8SP8btSGUM/U
	lmG8LIfcFRDHE5fT62xRVg/ByJY9D3uQ4XVZxshiavoTcscQDjH1nWFgC4/aT+kU6uLv1fVPSXw
	Qf8ZfUDtGTeKQ2P0bHw42Y48tCEXc2fnjmBb6HZomGp7gTAJ21qO6rMTb1geJX5CQBJeSpIavDe
	iQVOfw4T8CcXRpR1U9mtBvq3NuIdW9WBtzvN+u+smFBT/58KtYZb8xbUQ==
X-Received: by 2002:a05:7300:c8c7:b0:369:f231:b98f with SMTP id 5a478bee46e88-369f231be73mr5481082eec.4.1792992607224;
        Sun, 25 Oct 2026 22:30:07 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm7075259eec.14.2026.10.25.22.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:30:06 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:00:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>

On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Every S4 speed bin runs the same CPU frequencies but needs its own
> voltage curve, and the bin can only be read through the secure monitor.
> 
> Read the bin from the firmware, select the matching
> "opp-microvolt-speed<bin>" property for all CPUs, then register
> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> on the SoC compatible and needs no node of its own, and S4 is added to
> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> the bin has been applied.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/cpufreq/Kconfig.arm          |  14 ++
>  drivers/cpufreq/Makefile             |   1 +
>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>  5 files changed, 202 insertions(+)
>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c

Is it safe to apply just this one ? I can take this via the PM tree then.

-- 
viresh
