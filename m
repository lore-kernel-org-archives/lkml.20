Received: from outbound.ms.icloud.com (ms-2006e-snip4-11.eps.apple.com [57.103.75.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67653EB0FB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.75.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789901465; cv=none; b=OcRsE9EHOApa/ny+hETMkGemRWuA6QEM/ryfg9tStCEciHehd9+b6p42UNRg3WOrVKb/5yJL2C4Phdjzdj8arhPjZnxzr1rtnYvGMtIMkS92BXVAwJzF1ndNbQZLrSb5e3qycfDEbqlRQGrJg++IUNSCd4edVCleNy9TtneTUYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789901465; c=relaxed/simple;
	bh=egRJ5b7nNc4Ns1L7iB8i+MJYwlWqzkSslKOAvISd6H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImCjBYBmvhPbF+VAm3PP4n0/Lzxu6TEPv4DCgDUQVgJrCfnGNQUnmX2Y5ZgrbXXuQ6cTgvj2GSSqItXTw//jKZE0T7r6/g2VoTSZqbguzxWVCSp2V7VsKg9P6qVSlLIJsWy7k3jPX7zkwN8Bkaac/IxsJOS1FnGmSno8e18yVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=yLmHyOIM; arc=none smtp.client-ip=57.103.75.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="yLmHyOIM"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPS id 7DD80180010D;
	Sun, 20 Sep 2026 10:50:59 +0000 (UTC)
X-ICL-RepId: 01a0be70-cfe5-743c-a40f-0bfcbd3f9845
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZBXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJCldTARROWgdUJ3whCSdJXHxech0KRhMZThtXTVAbXwJCDw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789901463; x=1792493463; bh=WBhLPgrlGgFAfYUVRbZshd/sQEaG2cdzCoRPJ5AG9Bs=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=yLmHyOIMBXapUE8pdFmj9skk9bN+eIqJWIPjk5wyB8bYY9ZAcKaBKTuUL1x03dYWOr4TruMjAH3tSLFiFsWi5NDf30P9yVP9nQ5YNrOu1UUCIx1fcnnK9/pHSlw8vdDo4OqroY4uhnsXR85rqSyeb/NxjLduSqt71A2nnNcngDAhyq+wb7ES6IEo7hnlBfQa7xtPShLuPIQcvGUvy3xsDD42H8b+KaRSj+EgWXMm5DrcV5KLYpweLEXxQLB+q3GmKWyXw4mm+KDkR58sWKvNxBPrnSBdtP5ATBMihNNIGssxxDXeEsTWRLqOV9Igr/vRFWG9To15Z+BLkbYzd0HI8Q==
Received: from m3 (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPSA id CC0AF1800105;
	Sun, 20 Sep 2026 10:50:53 +0000 (UTC)
Date: Sun, 20 Sep 2026 12:50:50 +0200
From: Sofus Forstreuter <sofus.c@icloud.com>
To: Andy Yan <andyshrk@163.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 02/14] dt-bindings: media: add apple,avd
Message-ID: <aq-6ijcLNQ0_z1K5@m3>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-2-49977931f455@icloud.com>
 <490c0413.5a83.1a0bdde450c.Coremail.andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <490c0413.5a83.1a0bdde450c.Coremail.andyshrk@163.com>
X-Proofpoint-GUID: TUTuRvhIyPU2YPOdSF7_ItX2FwVbVyXC
X-Proofpoint-ORIG-GUID: TUTuRvhIyPU2YPOdSF7_ItX2FwVbVyXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE1NyBTYWx0ZWRfXxID0Ug9pFl2x
 Gt2DeK68aaq7XpmlYV2+WNUtQB8P5O5RNnIMRmLz0+j+Qnrcwt69Ih8cYGPBwBPHwzmZAPA+tMP
 iIDuJp90DvmavgoeZq6zTq6OB8Rdq/UaBUa1mrCybaXAK74bXCTg3+YQYqaVdQA2VT7HEWqIGfH
 oihwb0jXk+C+y41V0mSxZboLLBKOP62zrBLU1CxCO7/2EVqof8gQZRET3n396Mxr3I4ELmMiscx
 S48DXCkysUvpTbPRvc8QUlnkSGq7c+KD85p6eUQ2UwZFJcLfierddp3MjgjTSbUO2kdG10is8ML
 xF2lh27FPAsAQpEy40GHii5ZeAXH3nNZGzkM2DzLjqxR7BwseWOSOL4iobHsPk=
X-Authority-Info-Out: v=2.4 cv=ZMLaWH7b c=1 sm=1 tr=0 ts=6aafba94
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=v3ZZPjhaAAAA:8 a=WH1DJqfT7gfZrbUwWXkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-JNJ: AAAAAAABK/4gmxiVowMzIMHXMSy26Rhac+DXdQy6vWvpsOjoMG5ChvcQxkIW75BW4NzgkT4ijfeodeZKHGA+3zfDWuXSWEkgKCZu3+5UEWxxFk3ACHig4MA4J3omOEPweTH3l3ZAnI27iiLAHGS+Zng8MN0ADe+jGtlSAx14k4wo9TvXgPpJmxGwfgcuO0xIfuLLy5iLo94wE1XLoN+vcNXbEAcllKLmxa4Kg2KajS3uJk0IRX+zaM3xJcXBExMVf4icWnA3rJkq91iRpu8E7oQ6z2smV4Xz5gyTGJ7DmNmt+C5mhyxDxfRZs3v9Phu7ipaByTKUX7ep7AnKy/ckFbDg5VX0g3DF9G2VSA7VRCbP6tXTGXgJcPXsAfOudSvj8FCAGL4fGHVtl6k8oBNOObSFi2O36jt9DSic0u84BoGCpWjpvo1n4X6BirBuaN/hzfnsq0w8sMOlSl08PpyAxmiEFtBdbIIzZp5xaVtTlStYNVQnYd+CthVRJdKXZRXr+xuwoMEXcHXLhNdeJGRjC5q1XMHlzrGxM/KeAyVjMB5J8y8I9awlYZV/3JCzjiurBnE530nKnqawJzSWTTJaX/gYX31lx2OX93jXd4ourmN9OfHQqsmgkMLBHIFMoF/45PqMSsM5z5JoBNZKIx1nn9t/IjayMiLI66zLBSVPV5PgdHYT/FaUKpuUrF1/QR0bX37m4x5nRazEAc/skztzF+2+Bnx8JehNQFvcrgcbE70773p+FWv7WIbuX4x/7q04tcBGuHhxlzvV6Qo1C423W5OzVtxOkCWKE7XVmyjd9T0bYo0Wc1H1LOfaG8hvNHwDifxUlDj95Dc3W8yQU9DAPKymZnhB2AQDEFqZkQAEGa0vzpxf2USs/SLhcVQ+8gebzq1u6eZkrgUr7ftbUeUcYIQc3xIAGEP8KrDG8sNnRCgaoZgeVJ3YA5yCalm0SzQKpnyK+vodFriVnwsMmGPdycVe/Znuhtg
 4Sp0WO1J5Nzme1e1NJLyK151VFr3ye+54PDXRNOXrTXX7ECwAD3zhOWIsZnf2fkGAyhC02lHz4W2ZO/BN56OEc0S6uhjnY0ak7Q1twCzliz6ql+8OePQezAqZRzLbu9dpRlFRvKfe0I5iMmvZRN6I+02GmT3NY3WyoNtsYS/NZMwFRIvMJpNhK4XRdC3z68OISgtx3b6rErWteg8x01oYew9drjl9f0WYk873qZfA0pLqX7w+ilfLZmvWESjur5U7xW6YsDNJJoBgKq7/r0TqX843zo3uSasjrX7ZBpO4eurUNLbw3Sq93EML9c+Is7CSzdRN98C7r4SZ1oniUytxqyKj2bMsdAh0HLTAX8dsMPGpKENnyHo2jtlia3CkJ4PUcsGWlJRNdqhU/V4UyxoKWJzmXx/7s3e9ILMuaqmZk+G3rio6EgswHQiU4w2JdJDqzw+PxsVEMvYjfXwGc6KmHA0THVN7nJXUTA==

Hi Andy,

On Sun, Sep 20, 2026 at 04:10:55PM +0800, Andy Yan wrote:
> 
> Hello，
> 
> At 2026-09-18 21:15:07, "Sofus Forstreuter" <sofus.c@icloud.com> wrote:
> >Document the Apple Video Decoder. A hardware video decoder present on
> >Apple hardware.
> >
> >Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> >---
> > .../devicetree/bindings/media/apple,avd.yaml       | 112 +++++++++++++++++++++
> > MAINTAINERS                                        |   1 +
> > 2 files changed, 113 insertions(+)
> >
> >diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Documentation/devicetree/bindings/media/apple,avd.yaml
> >new file mode 100644
> >index 000000000000..34a4129d6a46
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/media/apple,avd.yaml
> >@@ -0,0 +1,112 @@
> >+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >+%YAML 1.2
> >+---
> >+$id: http://devicetree.org/schemas/media/apple,avd.yaml#
> >+$schema: http://devicetree.org/meta-schemas/core.yaml#
> >+
> >+title: Apple Video Decoder (AVD)
> >+
> >+description: |
> >+  AVD is a stateless video decode IP block present on Apple devices.
> >+  Notably it includes an ARM Cortex-M3 and associated DMA controller.
> >+  AVD is capable of decoding H264, H265, VP9 and AV1 on never SoCs.
> 
> Typo： s/never/Newer？
> 

Yes, thanks!
