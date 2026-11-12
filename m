Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475556;
	b=X5QOxWC76LGNeEbVYempwAd/G6X57LQsOIZPE/Aiawp7n+2+fWbyLyO2xGC1WbLbcGPp
	 d26qWvoGN48JcF8qR0veFuByzZNA8aG0f7GwvvFSXFANScWcOXhHkIaSrAx5oNdq6Mn41
	 2ia4IZYJeTjSIjSTgAL2hlLdBpLvXbIpn+jIrHDDW5MRKUFPlfOh/BAjkPA9JrugO5siL
	 RcU3ttc9q7MRF+E5/kZGNmlWAPhRgnRpCG/GzR/ZH5/z+usmX+FqFSfYaZLNT0t4/9F5m
	 DRh67I/iUhfZ3GMcjzclBGVQFly2LSSsaAwZ4Tt14aBE/7aUCYNaj5+S7rIROmm/k+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475556;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EZx8Jw7PIP5EkW4qNXiCINH2MnOdwdHG8FWpIk2/UBs=;
	b=XuTHJd1hUkaNrDm9lkNIPFIdxva27bYFN1o6vrCdcnH+1XC7IDK13WU5rMYJCslagiG9
	 pwXrHbL6E6Ir3EoaVgv6E8TkPBGaXacQSIppYyMKhyk1LEyjLOZOeq6GDoLUcKK7SBX9j
	 Rw/0G+AMj/Cho0aNeGJ0JjaIkINtcEYoGTbFjeF+eTE1kTyX7Cxbn1h56e7bomgvSYGzc
	 N1WYVT/PQ6joeRK19z4nmdwEpgQxeQpYYhZLPrcDjTsVIV6nHQUFc7i2yf4eMwNLsmEXZ
	 wjU8dCjhx14lsncCgeLvJDPjOeU6Zk/6L8CcX7bNpob4NDSPjMhIkkq8CqCkLWhpV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOx9NI9I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14904606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOx9NI9I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BF11F00A05;
	Thu, 12 Nov 2026 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475555;
	bh=EZx8Jw7PIP5EkW4qNXiCINH2MnOdwdHG8FWpIk2/UBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DOx9NI9I4ddcEPPQnoAjTiQ22Ws+dQcJWle2kV0VS546QDyGUjb4PiC3qylGxT2ZB
	 wfCOaapLfkWztw6H9dqA8Z5QmEgCbEQi9MjmcU51sVi1IfN/0YhNJL43dHgnOFaO1W
	 QWoVUfNWMDSL1WiWJEpNouHq3fadIwXYp4FqthBNBpAzIhFZ48q3P32/HimqGmhTpK
	 Gi+q9Z0h+TFtaptREw30JVyIhscF4Atx6Ferp4kLGmdEE4zvUnrEdCmm+oN7LJ9jVi
	 KBJCBKLDslSbxGxYHFcEmhtPbysdHJQNGkju1T5PjLKjTDoztFpJHuH+NOPGg9VNdm
	 3cHDDC6rD9dQw==
Message-ID: <131ad9de-a475-4848-978d-08cc98c26013@kernel.org>
Date: Thu, 12 Nov 2026 10:25:50 +0100
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
Subject: Re: [PATCH] drm/amdgpu/atom: do not dereference NULL vbios string
 pointer
To: Alex Deucher <alexdeucher@gmail.com>,
 Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.com"
 <simona@ffwll.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4VYoOFUjYIK--SKrUsijHVOOHA6ruEc8z_hXR_OMj7syXD6492lPaEKmsRRV3iLW1QAkn2X29F7_-lVKnIx4vUE1KQtKx8Zdk8sX_rFaZIA=@proton.me>
 <CADnq5_Mp0dxiK1cJOgkCcHap_0y4GhwnW0E52PR7gkySnkMk3g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CADnq5_Mp0dxiK1cJOgkCcHap_0y4GhwnW0E52PR7gkySnkMk3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2026 17:57, Alex Deucher wrote:
> On Mon, Nov 9, 2026 at 4:41 AM Noah Weinberger
> <NoahWeinberger2003@proton.me> wrote:
>>
>> Hello,
>>
>> In atom_get_vbios_pn(), when the part-number string is empty and
>> atom_find_str_in_rom() cannot find the ATOMBIOS anchor, the fallback
>> computes NULL + sizeof(BIOS_ATOM_PREFIX) - 1, i.e. (unsigned char *)8:
>>
>>     vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
>>     if (vbios_str == NULL)
>>             vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
>>
>> The subsequent range check is false for a near-NULL pointer, so the
>> value survives and *vbios_str dereferences address 8 - a NULL-page oops
>> during probe with a malformed VBIOS that passes the magic checks. The
>> recent hardening of the neighboring date/version/build helpers closed
>> their OOB reads; this fallback path was left intact.
>>
>> Simply leave the part number empty when the anchor is not found.
>>
>> Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07), drivers/gpu/drm/amd/amdgpu/atom.c:1491-1503 (atom_get_vbios_pn).
>> Pointer-arithmetic-on-NULL is pre-existing; this window's hardening series made it the sole fallback outcome.
>>
>> This was found during an assisted (AI-supported) static source review of
>> mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); every code path cited below was re-verified by the
>> reporter against that tree. The patch below has NOT been compiled and has
>> NOT been runtime tested, and no reproducer was produced - the triggering
>> conditions are described above instead. Please treat this as a report for
>> verification rather than a battle-tested fix.
>>
>> Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
> 
> Missing your Signed-off-by.

That is not a patch, but a report. It wasn't tested, wasn't even
verified and is possible that it is LLM slop like the rest.

Best regards,
Krzysztof
