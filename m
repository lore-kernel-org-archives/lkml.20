Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076987;
	b=cm2kseWAIqvNyKHMPkdlcl8CYF/z9dtKUm1ZJ1Uv/ySjk2LsngbcDuf0AJ4xH/rPLAVQ
	 N49PlKeNzOVOImNubcjWGUAmo5I1UtZl+Kv5yb3alYv7JcNVJv/+dS4xAKvB7oqlie3Fl
	 qB7HO91OUYHSe5hFt8tfy5ye+RJjQmK1P8vRYDk4VuccnUCoRW/SAZtCoeuf4lWNch73D
	 rsEd8gwzGNPK52huHQaE5lN/qCB1ghKTvOZTacgbVZ4S+xuvnOqNYBL3/lT99I9Qq/ACB
	 5bQ7MFm/9lDCnG6mSiHNP60zb/Z01T7CEDw0peDEKEqbAVze0XcPSbixUn1jtRWP1JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076987;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WPe+QkqQEWfbrRJG0Dlk8Dh/oJj6JFnhcm/wUcG+CUE=;
	b=FFBAnanxLSkAFDTJG3QMMM4Eppcdy0HbscnfZ1jjYizZxa1eiLfes+P2qY9GKU8oha0I
	 sG4Qkki1r9HiI2783QHeJn4NeZpFaGHw7h/vRdnsEND1qfeHhgZJSiLb0HHhM+WvSfRRb
	 ELzubICnaSBbDtvG9HlvegJFp6zZWXF6F3oJbcKj3+xjQLf7CLMayghXTt9u+SAzIjlFM
	 zMpIiSOBGzwwlsqgP7epIyzqyBoGtFHjksHsb2eu49Z+H1jODfw8GTYco6XcVtOVzjH/x
	 xUA3GXUOMSJLrke+joyeeOaxuPrA908iiWM3hlHKGPBwwAzJR9QV8pclAbD6Di6T/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TZFBywsi;
	arc=none smtp.remote-ip=91.218.175.5
Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F7B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TZFBywsi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jju6/zoBjCAQzWEUQqLbq8Z0mePGNeIApBT1PdmuGkQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793076983; v=1; x=1793681783;
 b=TZFBywsiO70wrcP2TlLaBfEHCCIyauxia9wJNSif0dFS0TYqGT83vevnTD4j10qjyyMGGqMg
 +lsqBzSpHRz1/E2Bcqf0eDrKUtfhmF1M7dVE08Jh+klQfJmYxKOS9i6kO4QaqiWhCP65gQHMdiQ
 ebaCAEnW2DNIEId4JVI71ilE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09833c5367a263d8;
	Tue, 27 Oct 2026 04:56:23 +0000
X-Mizu-Trace-ID: 09833c5367a263d8
X-Migadu-Flow: FLOW_OUT
Date: Tue, 27 Oct 2026 12:56:18 +0800
From: Li Wang <li.wang@linux.dev>
To: Andrea Cervesato <andrea.cervesato@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] MAINTAINERS: Update Andrea Cervesato's email
 for LTP
Message-ID: <auAuxMRJrylrGqCP@linux.dev>
Mail-Followup-To: Andrea Cervesato <andrea.cervesato@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, ltp@lists.linux.it
References: <20261026-acer_maintainers-v2-1-4cf0f350fdf1@linux.dev>
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
In-Reply-To: <20261026-acer_maintainers-v2-1-4cf0f350fdf1@linux.dev>

On Mon, Oct 26, 2026 at 11:47:17AM +0100, Andrea Cervesato wrote:
> I'm not working for SUSE anymore and I will use linux.dev email to
> develop and maintain Linux Test Project. Also update .mailmap.
> 
> Signed-off-by: Andrea Cervesato <andrea.cervesato@linux.dev>

Reviewed-by: Li Wang (Hieco) <li.wang@linux.dev>

-- 
Regards,
Li Wang
