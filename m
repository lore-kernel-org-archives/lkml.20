Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6152D0C8F;
	Fri,  9 Oct 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537382; cv=none; b=oeEqfxCkt07DfaT+aQq8lx2Ru15z7UrgVdL6zsI7PjHUcizVQooILcyZD2Dkyp/YjgyfE9BoRz2mggPY4sp5e8Z/2+W1XceEjvf5+ruH9s+ukhlE8H7KrdcK4FOyt3inNzef1xq2JOQ0arJ6Cb7/sz+Fn6iwbCOS69OLPeTUjCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537382; c=relaxed/simple;
	bh=0B+1pOJWk5K5lH3NiBp1RyPADVEdbT8v/z8mxhQWGWQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=EYJFf0eTdfI3k6oY0VluTe2z9HUiImNIs25ghyS6kwhK/NLICkk9XEvhWOw7XsqmfKH6OVZJLE+WPHSfa4FVp1xVaJQm/hcUVVC8WaFVmEdZ48qZd5vmZ7PaeqJ4QKCZBQqLWLcE92Otljwm+a9Yh0QPYH5jOaQWH9qFUZg9Hoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ypkrenua; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ypkrenua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3D81F000FF;
	Fri,  9 Oct 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537378;
	bh=uIm23wQEM0Mw/ycgg/93BT/fPLY7+Nb56cELdkjjML8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YpkrenuaWecO/eZ8sFBJ2NHH+dIaRWs522jztqa7hWC50/eBfpatqntcEBqgZPvlb
	 7k155/3q+4JKppn4E2DdatOVgadv2okvKdfQeO7sox2PrXAoZlEFaewX4SF85qhS7v
	 iK509mv+w50Ohleq0yyK1EPr1LoYknv6/rZ+ItfZr1cHjL+gLdJD1KwRiioskUXNSU
	 L46L+rSleC4ixNm4NfxTYm3QTPN51Fc6omc7qIPVN4DEw2ZZo87+JaxLHZy7RMW6Jq
	 tdhrdTUOC4qJ1fz2JEMCKrUXVAh/Vw69SHDoAmewiVuy5bGGbPqWTh4bNND3VZgL2x
	 SO845U6y59lcg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] media: venus: vdec: Start capture after a seek
 that streams CAPTURE first
From: bod@kernel.org
To: David Heidelberg <david@ixit.cz>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928-venus-vdec-eos-v1-2-6e9eb3ce9849@ixit.cz>
References: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
 <20260928-venus-vdec-eos-v1-2-6e9eb3ce9849@ixit.cz>
Date: Fri, 09 Oct 2026 10:16:14 +0100
Message-Id: <179153737482.2596899.8050983650709172841.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=bod@kernel.org;
 h=from:subject:message-id; bh=0B+1pOJWk5K5lH3NiBp1RyPADVEdbT8v/z8mxhQWGWQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqyLDfiD/YOCe70sudhavDGP1TtXyrXJMYXp2H0
 NA6MwK9SZWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasiw3wAKCRAicTuzoY3I
 OrnlD/9hE1OZd1KKvlYK0W3UqTYWuaRB5ez6hcFZTYWomyNuV4/bkCXqiP1VcH9fYQj23QvaqgX
 NKjsw7xTCQopeq5z3a6lxdaLDZ4PENi9u5uR7MAzQ/eBqkR7UY7Hr8HFg2wvpjqIUtinYZVZlA7
 H2xiWMQIgZrvrMyJ7tk/dBCbXNDvn3FMH2VfcKommzN4/8ClqI0L3B3a9NIPUgX3Yymqe3XHnFi
 a5bK4J6TJ6soOKdKgAgiA05JhqeK/MmPbxwZRiUiylYpllhegY5fF5quhaxamkAat2NKe190TMh
 B+t1vqNv3lBcAmKQIZb1L/qVAROZX5BXy8TGuGrqd9Z0jzYgtG2IHkojpqP2haxNVWmt4uojmde
 owPypNX3O8H2rG2Q2BeKRhzZuoh5MZX7uqRxnz7V3bi6ZPOkOY8PNnYfF3+UbiR9wbyWTpNdaDN
 WVwr5jRbV6E4EWStsEaya7/+2fVqI32xcPjYuMq9xuktygzo5k+ykwcZnVxRClGEsIbksYqITDB
 RoSK5T+PSfmHnPC7cNROnAVmbT4emSdtVNP3ROc/z9cm52C3+9JTMa4WfTvjHJe+NqAAmE9cM7k
 DsUfHR+ROmkYUW1I8KE7+yRvukP0g0JG1GDi6XtIXmBacb4RH4jIx23cPAOMeuHh2zCz93Ax0z2
 kljWHpa9OUxY9tA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-09-28 23:40 +0200, David Heidelberg wrote:
> After both queues are streamed off, the decoder sits in
> VENUS_DEC_STATE_SEEK. vdec_start_capture() does nothing while OUTPUT is
> not streaming, and when OUTPUT is streamed on again, the SEEK path only
> queues the DPB buffers if the capture side was already started. So an
> application that streams on CAPTURE before OUTPUT gets a decoder that
> never receives DPB or capture buffers: the firmware consumes the
> bitstream and no frame is ever returned.
> 
> The stateful decoder interface does not require either order, and
> GStreamer restarts with CAPTURE first. Finish the capture start from the
> OUTPUT SEEK path when the CAPTURE queue is already streaming, the same
> way vdec_start_capture() does in VENUS_DEC_STATE_DECODING.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

This one is certainly missing at least a Fixes:
---
bod

