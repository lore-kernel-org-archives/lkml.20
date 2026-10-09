Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C749B5DC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538336; cv=none; b=g2Rtha7QIXq3Z8mZJnvm7HvrTk/7hfbvVxsugvWy4d96KjAHSmiVV33X8THTezLGrds+w0MspNSVZ2EhW0lHJCnP3SzC3UUlegO7gBeTtxePZ6z9694OBEEpFJ3yguzxMUggMMDRr2vav1MD8n1SxcYnRH7Dl1ly2R85qQRa2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538336; c=relaxed/simple;
	bh=Z/FLiYR8qfF6FfAeFUqRE3m0pH9vpxLOJqGiHvo41PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHdWoljL2m44G6iwT8vbh9vE1ecx2YoHLwm4+NhwyqTbF8owdAeF5HSgsfFW02Kd8+aBSmCFwuu4eJAY/UmToFJ0iDWsVwG7gT2chMFM6tVXHOdHWU1zQUzwRhJBkmEHhg6JNfofkodWbJi8sC4pz7erGAgd4Na0dKg9hDpxgjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH6ZxjVd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH6ZxjVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D25F1F000FF;
	Fri,  9 Oct 2026 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538332;
	bh=ENBRNg6BexirER+Jc3kf6eKiCZvAltZIqY6YqCZtb5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jH6ZxjVdMPwpZg2LrocpBm5BCxRQ9f1tq/koBd4LaSF0U6NRDnw9NfORdwhQp/i4C
	 /2fix8o1OwdIzj9G2RtMnLREs8/gKDwJVL8OSpBkUE3ot1i8gffY0jTLV71P0lkvKC
	 Y11Dvtf7ScABY3CUliSw1xaFJ95GuRr/tfXIYh3+XhAD+U4+6OTMd1e2x33QBkngOb
	 ziEYcQTmjWskGoCgBSGi5QGHTBEBxdvvUgoznKLvcj1dkNKbAZy0gfRcKrxQjkYJ+q
	 7uKm7yY9b4VbdlirJ0oIavdU7g1xJqcKGrK9rioBbz12IhwNvHckUQwaU8uU1TWtW5
	 flJOcErGmY/pQ==
Message-ID: <8d0fd503-4f4f-4cd1-9ae8-08ecd478b8cb@kernel.org>
Date: Fri, 9 Oct 2026 11:32:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISCV: canaan: Deprecated (oficially) the K210
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20261009-ee797bb64a30cf907f583aca@squawk>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20261009-ee797bb64a30cf907f583aca@squawk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/10/09 11:29, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Two years ago, at LPC, the only known user of the k210, Damien, gave his
> okay to delete the platform from the kernel but this never actually took
> place. Deprecate the platform now, marking it as broken so that users
> will have to explicitly re-enable it on updating their kernels.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Sad... But yeah, this platform never was really super useful in itself, beside
the code cleanups it generated.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
