Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101E4503FB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582515; cv=none; b=IdrHp13dOyd8FHkgd5YKDUh2O0cN0qZxcb7ILfN6H60B02XsO6QjzV6Xl6SO2bhScTzrPB69XkjW958Ut/Bl7Eld/ceV4AT0u/HgT1ml4EZtOeWQMnE2bVPm2A01+YiJi6KYEUmYWv60BAZAalqQKt4Wje2BvMd9g7VSh9li1R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582515; c=relaxed/simple;
	bh=U8oDFy23h3GtuNU4fyETW9mg1CJyEqTieRM/0+ZshMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBZSUhFosUwYedQ9Aomaga01wqWOdVzeM//vC5kJFGSIJ5hh9+irOou3n5F2x/e/vZuCdfe8rlRUwOC0bXYOXJ1dscK/PqdVAhUjh5Q2s+U6rOy5uYLBwQf1hYMXDMqFGIOf32sMKDOVi1CT/JRlg+jb7V7n+hssQ7wLT1ynKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P09APZIS; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P09APZIS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U8oDFy23h3GtuNU4fyETW9mg1CJyEqTieRM/0+ZshMY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790582507; v=1; x=1791187307;
 b=P09APZISRlgdpogn2bPumDmgdidQPxYU0Q6iftQHZuB8mUgIm3KAMaPz01n+dcfvd4x+ZCf6
 FJwnQwdE296EEckBmQ4BFI9f8aFEg/FAsN7fekXkrCvTUawy6r65S84yDJ5KCIlMbvcX8UGytgS
 HnHhlcUUL2BPbwAZqIM8SkP0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 07b97e32088d0c24;
	Mon, 28 Sep 2026 08:01:47 +0000
X-Mizu-Trace-ID: 07b97e32088d0c24
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 10:01:37 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Martina Krasteva <martinax.krasteva@intel.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] media: i2c: ov9282: fix flash duration to/from
 microseconds conversion
Message-ID: <aroexBUvfckGVSEC@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
 <a9c1046f-8ce0-4968-a66a-e53af1e42013@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9c1046f-8ce0-4968-a66a-e53af1e42013@nxsw.ie>

Hi Bryan,

thanks for your feedback!

On Thu, Sep 17, 2026 at 10:53:09AM +0000, Bryan O'Donoghue wrote:
> On 14/09/2026 20:21, Richard Leitner wrote:
> > Fix the conversion by dropping the constant factor and using the
> > previously introduced ov9282_line_time_ns() helper instead.
> > 
> > Signed-off-by: Richard Leitner<richard.leitner@linux.dev>
> 
> Fixes:
> Cc: stable@vger.kernel.org

Will address this in v2.

Thanks & regards;rl

> 
> ---
> bod
> 
