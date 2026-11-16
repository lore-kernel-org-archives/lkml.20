Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836935;
	b=AisX01hLzcIY9tLHNYykATy4HGfE0zX7qqtqoFfWbaIkfYQ/WiOfe4JAoVu9f5JbOJLD
	 Smwqz6Dpay8WFSEis5kDKE/942pM/bpcgtZe6jJ12OQ5vJh8C9xMHoX6NgX4DMam407FT
	 IGVXqXFFtmIMvc64QOMrufXNWG8oxNeYKiiQUUI6FRsl1uz5S1Y/DbHjJttfEfJsLBF6V
	 tkQdhyr7u74XDb4Yw9zwv6YP3+RL8vZXmXxW6KZZsHO5SDgwCAALnuJBD+h/Pk6dn9HoY
	 wOVFI7kZzvYBN/XxIZAOsPCUFdwsHTGJ67r9RsJXTMEFpVwuDiYXjNVtpIFhNT4gPEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836935;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MobKKWivxsd3PRwAP5kP2Gn6k8dBPxp5I0oVzLlSErE=;
	b=t37T7bQ1zYU6I7KO9aIIB4NWR/IrwkScUe8EqQ+k19Dmmnl1VxDYkAwQ+MD1ogBNMTAX
	 Lr6CHeUfNqfXuK94V5G5DQlro7zY4E4DV5oVv2FXurjzeORMAl1ZINWVu0Ki9Q+SeeToc
	 k/jAtzlSYMR4CBnVxCSLJzLYrbxdO5uaa/nJFwTcw8YxVeRcDlSwFNUbrmKt7zGBHmfc5
	 /U+Pnhlx7hQejiQ0Yi9qrc74NIgPz9AFzG40k5UoPpdS/qiP35qzyJks9KksQxzHj7mN7
	 3MTCCXArYEF/HOQUaTeZh8qJQXHaoJ+vaTJdqWdKxWmX1NkphaNfkzKCYfl6IcoWVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XVjf1zYR;
	arc=none smtp.remote-ip=95.215.58.17
Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2636D606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2636D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XVjf1zYR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WGk5S0u6hRlPF/4UQc+lsqMiC10tcxIj2nMSMP2EKbM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794836932; v=1; x=1795441732;
 b=XVjf1zYRqTc6fOE/4lSKDKbuLljlEM8FCSTWtGsS2ZtH7KPQDeSumVnddoYBqYXS5Y4mc2SQ
 0bphSVTnmYFnJgEQy392S/D68TYu4cTrr5zjhdcCoMjm1UXyqopB12rAMeE2dIv/ytuTtZ/TQmz
 68S2M1SQtGqKISVJQYslUwuI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a196113b76863a54;
	Mon, 16 Nov 2026 13:48:52 +0000
X-Mizu-Trace-ID: a196113b76863a54
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 14:48:45 +0100
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/8] media: i2c: ov9282: fix strobe timing and control
 handling
Message-ID: <avsJn4mRwTHJWjJk@bombadil>
References: <20261110-ov9282-fixes-v3-0-cb6df80cbc22@linux.dev>
 <avr2lDQxiFnv2Gq8@kekkonen.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avr2lDQxiFnv2Gq8@kekkonen.localdomain>

Hi Sakari,

On Mon, Nov 16, 2026 at 02:27:00PM +0200, Sakari Ailus wrote:
> Hi Richard,
> 
> On Tue, Nov 10, 2026 at 02:10:09PM +0100, Richard Leitner wrote:
> > This series fixes a set of related issues in the OV9282 strobe timing
> > and control handling code.
> > 
> > The driver updated exposure- and flash duration-related control ranges
> > in several places, but some of those updates used an incorrect timebase
> > or were triggered too late, which could leave the controls clamped
> > against stale values.
> > 
> > The series:
> > - checks the return value of the exposure range update
> > - drops the redundant vblank field
> > - converts probe error messages to dev_err_probe()
> > - fixes the 8-bit pixel rate (192 MHz instead of 200 MHz) and the
> >   corresponding line time calculation
> > - treats the strobe frame span as a line count and converts the flash
> >   duration accordingly
> > - fixes the flash duration range (min/max/default) and refreshes it on
> >   HBLANK changes, independent of the sensor power state
> > - refreshes the exposure and flash duration ranges on mode changes
> > - reprograms the strobe span when HBLANK changes
> > 
> > This series was tested with an ov9282 sensor on a vision components camera
> > module attached to an i.MX8MP mainboard in a defined (dark) environment
> > with a custom made LED flash pcb.
> > 
> > Any feedback is warmly welcome.
> 
> Can you fix the issues 0-day bot found? I think the patches seem fine
> otherwise.

Sure. I will send a v4 in a few minutes. Thanks for the reminder!

regards;rl

> 
> -- 
> Regards,
> 
> Sakari Ailus
