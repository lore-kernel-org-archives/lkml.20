Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E95187FC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682852; cv=none; b=Y3IzcbIGtch0n8cWifBvsxWWdVby6S2q2KONM6YHoWcm0H8PVsEH1a2gJw+aYEYs7AT4icGN6YVLBlEtQw+zBZCcJTO+nSUHg6qw+ir0xzcbqgs8tpypq7E9ZqvpMvshloN2HkU1k1ndrLUnYLsj+Ruvy4E24drYky0Wjpqo+Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682852; c=relaxed/simple;
	bh=6sziIVdTu4ZPVOjNw6ZKDgiA/Sqd6hn3LEOmfZ9gpBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI+bym300eB3yrS5rrDD3GFC/1BiQeCYZEUD87RZGPfkZwI7pfighnxE567bwgeKOPRMVrRQ4R7ga8YoJEzPs39NeExu6yRb6OC6Ej1Cpq7kqxvM4goteBiE80vNu1I+BrK/WezXIkCh+dm5rEa2cyzXjZIQ4OXmE90/B4EOknQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cFnD2yCT; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cFnD2yCT"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so6077926a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790682849; x=1791287649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c84a9eMo0Dm/JWepc2tnRlDWvnvh5DqhzAwWVPo2EM0=;
        b=cFnD2yCTEuYHI4SMsphhngDTAkQO+fRn0xwOYR9HOwfhj2woeS3yPUW9XdpqY9gvWn
         hdpjOrmmghQWOVHvU4AjJXnxvJKtht0IV6zyosG0wEYrGfzsPmsPHUm3sr2SZJTS7em9
         hKeE0v/tEJHr6ecjVVfOUQHpMxXHcpCaPs8e8/f8b3yB8UPdjJxY3MQOpNqD53M018gS
         vE+MF2t0pwylxnEARYETbgSh4FaFm/0fNSIccYrzWs1Tc/aqRB1tHN59gdb9EHPYu8Oj
         5ATCHWMvdKdEKr0qzXvZtCZoAL6DqyI+DIkHujznFeqAXU2hNlCcbITyAjKL3Qxm7rXI
         /ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682849; x=1791287649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c84a9eMo0Dm/JWepc2tnRlDWvnvh5DqhzAwWVPo2EM0=;
        b=Iar0KBeDUO2P5MRBF0d8rGm466/FXzMduM6uZC/PX6pWFcJelvYe8rJ/JFUqx+V04F
         guN1jXgVdT/XdvLmaoRf5bhg7u6Ib+a2RMTRBBbPSOAuUCx872O2lexB6zMgbssttx6n
         Tm57h9ONdyXzzQMKMyb04yxKL9PoIrZ792+8Brx/LJ15FJpLe133xbmllc05DUQhvFsI
         wZzv85alfFHyQRAoVh/BYrb0EUDOs/O+HDCkW22VSHrspE4hXOW+IgEuFqT8yXd9hpRL
         PfJ5Umb0gPgKwFbCkgt0iV9Q6Uw/9zQa5B9zGbb9xKjSD6aXqEjHjcHKFGOF3cVSDz9Q
         qUxg==
X-Forwarded-Encrypted: i=1; AKwUvBxGVF7tgPcb7wcRT0RBKac6aD+/KCVomSe/QHN641m4jJ15+MGRXkmwkeDawAnUoA4eejwwAkmLffmFi+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCi0rXEiZ5RZTHxcVA9coPbB/rDqCf/JY2z900pnrMQu/iOFOQ
	0HHlSUp1trEfYcnQjBEOmiAt0AKpDPb+MUTkB2PmIszMPmCbBRtLElalDMz0s8V/zk0=
X-Gm-Gg: AYBFou2mDdaKwS4HW2ipyv36jho+tju6bus4A+U5JcrVNOzwWZT82Ua0un2A+hADdw9
	GtuKmuI5i+/WUFNMS/PcA0d0faX4Li/QxCqGnovl0I6BTjFAFK0HBb5HSQmWihezCYRYFj7mgvM
	SlQMmiEanIKMB/FIl10Dxso+Xz1uyJH/lXNRLLNnUFg8HxJGBOCb6iIOJ2R+IoH1Lw/fjv+hNrR
	qDcLVkUYIlEaEHqvaQeZJjdXUySLQvNTFk+pqXJO/UXga6LUVAmILtGNMf8BqqfTOHPUmN5mVty
	GbgLA/xN0NxwnIsHMHZ07SDBsifj0dfc6/wL6Mjuz7f2J7pLSxcXcQbjYgL/XPy4nmd9g4gtomo
	1dkmEXzRu2TORv44ikFpmXD68gDBwRhnirsIPB7WdmIdNHuOkO4gIFVGEyHKC2uq4kil32ZdhPw
	IQ50dpazHUGRIviikiXgUx0zLc3VfEJkWVS0epV+07oIZW51IGjpNzQULsMrW/jCqIBviFiKn74
	8w=
X-Received: by 2002:a05:6402:27cd:b0:6aa:f129:b193 with SMTP id 4fb4d7f45d1cf-6aaf129c2ebmr9300291a12.22.1790682848790;
        Tue, 29 Sep 2026 04:54:08 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9048ebfsm707949a12.30.2026.09.29.04.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:54:07 -0700 (PDT)
Message-ID: <50a0338e-e395-407c-bccd-cfb90f113e58@linaro.org>
Date: Tue, 29 Sep 2026 12:54:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf arm-spe: Add Neoverse V3AE data source decoding
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kieran Hejmadi <kieran.hejmadi@arm.com>
References: <20260928-perf_arm_spe_add_neoverse_v3ae-v1-1-738c9ed12d31@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260928-perf_arm_spe_add_neoverse_v3ae-v1-1-738c9ed12d31@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/09/2026 17:12, Leo Yan wrote:
> Add all Neoverse V3AE revisions to the list so the common decoder can
> populate the memory source and snoop information.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 7805a1a98a89a2853ad02ee7751472eddb1054ed..8d95df23be6f654caee77e9d155af7ebf5129c91 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -626,6 +626,7 @@ static const struct midr_range common_ds_encoding_cpus[] = {
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
>   	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
> +	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
>   	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>   	{},
>   };
> 
> ---
> base-commit: 0ae6fc78c5ce0dfd18d8712a50f0fd4602eff103
> change-id: 20260928-perf_arm_spe_add_neoverse_v3ae-917f280b2c7c
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>

