Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788E249A3C7;
	Fri,  9 Oct 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537348; cv=none; b=si8XnVwmQTnUdfNrn1o5x6zCRc7UW6m9syAT3wJM0fO/UPOx4rIhyu+jNXOdR+skJlHvL/VVb3+Ij8LvAmUKUjfEwhqPynwZ+ehn2dA0FbxcJNkmJVSE4PLKi688KGRhEw3NKFB81eAc3qFkc1Jejfq2x4pBP2hwYp3/9kLAfKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537348; c=relaxed/simple;
	bh=Uptdb4wnm7Hktsc+CIUeQHCCDZvWUptMFpMTKRolJBA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pxEvA456/oM+F99vCYzCEXQ9D4XO+SQXRIZW8BffRiXo/awpUzMkHsGVoaqaZ60WvWfqwu6ysLBdtKkBuzAukSXvgW3WJRYh/mRREketdT+00sK89sDGryR+eEsoSd+mGwWBUeHv5KkEJ0Pse4o3l/UNFv5/4wJBHju6Pd3pbPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pv9QjBwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pv9QjBwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C41F000FF;
	Fri,  9 Oct 2026 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537342;
	bh=d7hSU9X57x8MpJewi+PApmIPs65c0qIbend5wVtyB04=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Pv9QjBwBLxssQLrMu6Dtps2mulpJG0OV3YbzJYrk8pa4kvt5WhwkXYwBI+s3Eu5Oe
	 8TAm+IhAdsfE7IL1ZGMZfQbJMv5Y7ayMgPWK8WM0HoWuIa5rpLqIvJEpp3xtVRGkb9
	 fkOFaTgyPUk7gAAmNZ4+k181mESG3Lq43lAIAVcCsAbDRchZTdkRLKIM1kz9lzO35F
	 kepyDv7jvPRnxY8AV7jWj6n6nbvv5jZVz4pTlSIyjVlOr8VZkH6qFC6pzo7ZyFXNz2
	 m/eVSPJlJUAyt5hrmeKRmKIy4Q35XjwL6OMaRGfbKeaY93AK9cwSZxIfVwBX3zNSV0
	 FdqKamgW+OEjA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] media: venus: vdec: signal EOS with a real buffer
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
In-Reply-To: <20260928-venus-vdec-eos-v1-1-6e9eb3ce9849@ixit.cz>
References: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
 <20260928-venus-vdec-eos-v1-1-6e9eb3ce9849@ixit.cz>
Date: Fri, 09 Oct 2026 10:15:37 +0100
Message-Id: <179153733762.2596899.11570084120645960007.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=bod@kernel.org;
 h=from:subject:message-id; bh=Uptdb4wnm7Hktsc+CIUeQHCCDZvWUptMFpMTKRolJBA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqyLC5Y5+PWvovxqsj2H1hRloDpYGNCp3HawIln
 ub/t0jKqJeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasiwuQAKCRAicTuzoY3I
 OjqXD/0QmaLes7DoNlKraRCqkq/6LHQfFsEfIhFvBX1f7U/a1nFGeHWpfLqDX9nWOrvhDR0MF0g
 UQTBDkRgsEwosi67txJji23H7MzCrAuUOYRX4qc94Ov5txVEE3VAul14jPb7OuOZtxNOQt2ZwC8
 YSKbLPRbcXjDinmUnPxQBIRF5GxCPO7/a7PTAck4SPIUiTwBq18nT3UKBtRw8GEw7q0aDM+/XvW
 FsBrZqh6AwVrPe7PZVdfbspGMqRktLz/mO6Ew0IBEQzGzc/f6VPyI4k7DL5yOjvnw0O+hC96MjT
 cipdD8qGHNrAc5JYsinbB39WS2veWyjbnltGfu30Ra8/UbCPZ6fcf1vvVyc9fdipdJiuDze1o8j
 XNlx2Gjw8m9/JussNVYfRFTPC5T1d65fZEEVlrjp2CWCDJ0VnEOC33AT6lbm2+hlB9zL03ZZOKx
 4h5fBS/lmYNend5UiVHZCrGqQVKdkH55PlIkpPOSgmuqjgQFAH0Chmg4J0U8Pt8yFQWJPq/q2ov
 HNXkS9YjxhJ64XUlhBkVDW92NPf4JMiFCUWzhyiv1jqs+Tq0qhcjeNIAW9hbPGMjZgWCouucaZH
 2gXdlAYFEfAYgpN/8dffuFRuMHVIDlSKUNzNd+7gjAdrtcIMh4qr5J3Z04LLuSEFAgXnVe1+c7I
 d2+wAOfB1wDmatw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-09-28 23:40 +0200, David Heidelberg wrote:
> The decoder tells the firmware about the end of the stream with an empty
> buffer command whose address is a dummy (0xdeadb000), because the host
> has no input buffer to name. The SDM845 (Venus v4) firmware validates
> that address and rejects it:
> 
>   IsBufferProtected(1087): VenusCoreCtrl: CP_UNKNOWN, buffer straddles
>   CP & non-CP regions
>   vDec_EmptyBuffer(1932): Invalidate buffer in ETB
> 
> and raises HFI_ERR_SESSION_FATAL, reported by the driver as
> 
>   qcom-venus aa00000.video-codec: session error: event id:1001 (deadb000)
> 
> Both queues are then put into an error state, so the drain never
> completes and every V4L2_DEC_CMD_STOP ends the stream with an error:
> GStreamer's poll() fails at end of file, ffmpeg aborts.
> 
> Allocate a small buffer the first time a decoder instance is drained and
> use its device address for the EOS command, so the firmware gets an
> address that is mapped and outside the protected regions. The firmware
> then drains normally: all frames are returned and the last capture
> buffer carries V4L2_BUF_FLAG_LAST. The NULL address used by old IRIS2
> firmware is left alone.
> 
> Assisted-by: LLM
> Fixes: beac82904a87 ("media: venus: make decoder compliant with stateful codec API")
> Signed-off-by: David Heidelberg <david@ixit.cz>

The logic stacks up as I read it but, I want to see this a) work on sdm845
and b) not break on sm8250 before applying.


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

