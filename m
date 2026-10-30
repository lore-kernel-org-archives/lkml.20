Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329590;
	b=pzFT9dv4mbQd0PU+4F0PzX3fiEQUrwAqaRwb4fcCz0yUo9mJLHPtWE98FevL7z4gIwXx
	 GddYPx8CoFK8VGFaNX+qi7JTYZaM2a56r4j3q+EPHs0ONlXqXhgKjisBIyvUq7ziVNwT4
	 Ff/J/c8ttFKDKCnuNQHpwdWL0uuFv9jgu8AtlWZ9W/Z5XOg9HSeWe1DxqdenC0Ct7RA/Q
	 hMJDmqzY1w7CERS3N21LphixGsahB+EAM+4zqx2XnvHXvPlU5yck3auDb2nUt1UPenx2I
	 7Bnhvhs+vydBDrHHWFYYQhO4OsAHL7lcDqcGSSqyZaB+9LZK2nOErb8MvnV+VvW/ZYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329590;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZA9rISAqFc0jO/rT0dcYZDWceiwdhq6p/0/wXcgMSWU=;
	b=IQtZhJWcCjUEt5Ji6UF916MMcvRm+Xz10sYZTNAirnZ8NcyxCsVDX8L3bdsLE8RBvrB4
	 +SbF/x+rn1Lilowblw2ka44vQMWE6wfqbT8Isk3s0p6bMx+N74pxUAFacFhq/AwbzcQvj
	 eGHvh0YbxKrIBSzXrsRKCveBCJoUVu4xdVuG+NH2Gzz6QeNEAW0g7s0O1Q8TsJsdA8gJa
	 V8k7fqivGeBUY83bokY0D2JCWNzQq7y65JhdpFzC03HvWW7LQRFhh+Dn2CyuoDPI/G/V4
	 EnT6qJoT9u4b4iwo+/zowEUgZk752RQ9p6P/m6ztGXWjD4Z41SM0YSeU72sIzx6YHRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfNPmUr5;
	arc=none smtp.remote-ip=91.218.175.119
Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80506606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80506606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfNPmUr5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fPuMcO8hnNdMFZooU0iT/ErKR35zBd41Ik7MWnF3abI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793329587; v=1; x=1793934387;
 b=jfNPmUr5zDJpQxy1uuTtX1Z9fAAihyVPH7b4gI+792mrLM8oEWbzi+1d8B+Wtu2ytmRRupEe
 tdytpu0dDlAcpPTH2GTQE3piDeW4hFev3QSYKA9eudmm1+3Yh2rQ5b8Qk19SmxzBcaFEr/FT4n9
 UrQsxm0KEmhAPtSTVDaX8Oxw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c5737e2daac96571;
	Fri, 30 Oct 2026 03:06:26 +0000
X-Mizu-Trace-ID: c5737e2daac96571
X-Migadu-Flow: FLOW_OUT
Message-ID: <f9110c67-227b-4ab7-98f9-a51703c07352@linux.dev>
Date: Fri, 30 Oct 2026 11:06:17 +0800
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
Cc: hongfu.li@linux.dev, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, kees@kernel.org,
 tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/userptr: Convert page APIs to folio equivalents
 in put_pages
To: Tal Zussman <tz2294@columbia.edu>, Hongfu Li <lihongfu@kylinos.cn>
References: <20260723064651.4100-1-hongfu.li@linux.dev>
 <20261029134605.882933-1-tz2294@columbia.edu>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <20261029134605.882933-1-tz2294@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/29/26 9:46 PM, Tal Zussman wrote:
> On Thu, Jul 23, 2026 at 02:46:51PM +0800, Hongfu Li wrote:
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> Cache the folio with page_folio() at the start of the sg_table loop,
>> then use folio helpers directly to eliminate repeated compound_head()
>> lookups inside page API wrappers.
>>
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Hi,
>
> Is there any update on picking this up? It would be great to get this
> in, as it removes the last user of trylock_page() in the tree.

Hi Tal,

You are right, this one never got picked up. I have not received any
review comments on it. It is not abandoned on my side, and if there is
anything that needs fixing, I am happy to send a v2.

> Thanks,
> Tal

-- 
Best regards,
Hongfu

