Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383254;
	b=pywGIPAFeTaqlScq8hlmp26V3YyOPSOTasEEs3nRnW104ZDm40gO0N4pT94HhMsIG4MZ
	 I4qZ3vKIyuGo7tNLhgZ8ZulhtdAR62tKqV8kQuEOBwpWAxBgzPHfv/joXSh44kABC9/QS
	 8f7ycj2JrLC3FVF1JhyJOyXdWX+CYzThm6YHHcH86rD0s4vxDUEZc5/y7XaN9rpjcVUey
	 WVdvYpQrJCJOGP0+bOYT+yIwF4Olklrfd6gZaiV9aG6Tf4DvQ9mBdd30pFvDYCY1uGjMS
	 mOmQqJ7FlJ7a8ue/LjVP1yFABLZ+bPNUxoxAwxT7kgBFqIagHOC9bU+zvNPNNSwg1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383254;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fHUb9m5Ow6YjAqqAsURkBM7o27tlQnhJWUeK7v4QxkY=;
	b=DLXtIBmeaq1MKyM6kIBEsSBv+fJgB12nC3DV8dR1tEB6bctgb074DTDs8P2AuRhGW97b
	 la8GJ8MueZHZ5jm0UmQD4EEfP1vrXKzq3AZ5ik3qZ3ebR4XeSpvxP1RkSnNjFhH57ojPj
	 uz8fgvz50KI2RYcir7WzrVCQU4PG0KBjqmimYrbNiKFSvNsoe+hvrpyN1Uhzfl8VfK05U
	 Pi2mmMZjWcakDsLSrwkTlQ2sVraPloXN/FLx1QUSFH5IEjbUh54UDmFsAbGkM26ymIoVp
	 f/Ab1Qykas+PmksS89ABxd13DjWr+CKfWZ1ruYEjRJcskIgOwIpIsgx1Apy2cvDbRJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BGPd4+o4;
	arc=none smtp.remote-ip=91.218.175.42
Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B574606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B574606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BGPd4+o4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PTNz631996IM6OKo0NQvSOURtqLE/4y9pYnRgYfdFaI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794383252; v=1; x=1794988052;
 b=BGPd4+o4Tzh5I01AsaGa3zo06NwKGF+S1niq5ouMzwTH2X7+jVWcvoa6QKFaHm7N4vX4qbDu
 PHEa6mqNASY/aBuufgy4udDlyMiNVcpoaH3GhFFhNlghAyrxERsxT9gdxXlTLTUyj7wVMETRh2J
 y/JeC0lzwN4yY8gqy7Bzs6pk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a432004f929a3097;
	Wed, 11 Nov 2026 07:47:32 +0000
X-Mizu-Trace-ID: a432004f929a3097
X-Migadu-Flow: FLOW_OUT
Message-ID: <b58bb99d-17a6-42c2-820e-ba37820ffeae@linux.dev>
Date: Wed, 11 Nov 2026 08:45:10 +0100
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
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Consider SDCA FunctionExtension
 ID/Version for firmware name
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261110164807.1671681-1-rf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261110164807.1671681-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 17:48, Richard Fitzgerald wrote:
> This series is a change to the cs35l56 driver with corresponding KUnit
> test code. It considers the SDCA FunctionExtension ID/Version as variant
> identification when searching for a suitable firmware. The intepretation
> of these values matches the way Windows interprets them for the same
> available set of hardware identifiers, to ensure compatible firmware
> identification.
> 
> Richard Fitzgerald (2):
>   ASoC: cs35l56: Use Disco FEID and FEV to qualify firmware filenames
>   ASoC: cs35l56: Add KUnit tests for FEID and FEV firmware names
> 
>  sound/soc/codecs/cs35l56-test.c | 229 +++++++++++++++++++++++++++++++-
>  sound/soc/codecs/cs35l56.c      | 163 ++++++++++++++++++++---
>  sound/soc/codecs/cs35l56.h      |   3 +
>  3 files changed, 370 insertions(+), 25 deletions(-)

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
