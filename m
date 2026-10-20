Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.77.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489162;
	b=mD5w4HAJijg5l5hfj25gg7mHDyedjblJssImRGI4I0WURfX8/1KxvbqcAjOtyrpZ9hJI
	 ctx1GRxROdAcjKuJRTFbpFMuQoG6Svhh+OJOiJZ5cP2ctDjw/7xeh0nBZ/uBZLgP7LHvo
	 0Ne3q77rR0j49++pfb9Z5usCv3t8AmTInB5dVZSCnoZauNKUZuEgL/bFVqQQiTTVRKfCZ
	 EnLXo7FNxMyaK+TRGIMGVAzuOtJPhl++9RCS8f9gx9s8RHWFbfaWZ1Z7WLB4RWb3yWfiV
	 4pzkZ2zaTE00J7Lz8VWoniaTnhlO5kMy9H3tPiw/TaQ0YXfNNt3YLY5RI553hcEWsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489162;
	h=DMARC-Filter:Received:Received:X-ICL-RepId:X-Suspected-Spam:
	 X-ICL-Out-Info:Dkim-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Info-Out:X-JNJ;
	bh=BaRJoFp820wGDuLIad4CqTTahL72+upV0QSxufpoJyI=;
	b=TjLVGO8rVt7dMmt9UqWU2wdF1Od3cwAkW0gDGEcn/6SGZVcwXxR12RGQk1c33mLm9PuG
	 kvixUnpyjRT7WZEABAnGe7sG/hHzyNJvhFerQVu1j8jh05shuETWD+P5BkQtdens9PoJL
	 9JqzRZMVTpbZoVJ1LtO/crvll1d7IHg07Ah43xxXeCmpgQewfvHPGsgCgn5RQmJc4hwSE
	 Tbd3MXoM2wBkfHOD29QMF/XCCh0dGxJL+9Uce9LwH3wLqV2w2dx6Lyp8opB7tVE2fqyvA
	 +tsTz2dM6u0SvY5zFg2YGF7AlbGgThiEaHPO9I8Xh2tv0/KeVsAY2BBYTvXTnnYQfBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=bTf6u2bO;
	arc=none smtp.remote-ip=57.103.77.9
Received: from outbound.ci.icloud.com (npq-east2-cluster1-host3-snip4-6.eps.apple.com [57.103.77.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF7360A261A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF7360A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=bTf6u2bO
Received: from outbound.st.icloud.com (unknown [10.168.160.109])
	by p00-icloudmta-junk-forwarder-us-central-1k-2 (Postfix) with ESMTPS id 3EB5718000B8;
	Tue, 20 Oct 2026 09:39:20 +0000 (UTC)
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 5B00018006A6;
	Tue, 20 Oct 2026 09:39:15 +0000 (UTC)
X-ICL-RepId: 01a158ad-ea9e-77be-a574-0d91f7a53b9e
X-Suspected-Spam: true
X-ICL-Out-Info: HUtFB0MEWwJACUgHTUQeDxhcEV4JVgdeUEoRQ1APXxxCCkAdXwJFAUAZHVdQRARUBUpWUC1eCF4fTBwdDlgGEhZdRVoOWwRHFBcbXAAXGVFNCE4TBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQNAC0geDEEPHwYKVQZAD15RElgZAVwFXlZIeRFQAVgeVl5aF15TFx9LAFxFWg5bBEcU
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489160; x=1824025160; bh=BaRJoFp820wGDuLIad4CqTTahL72+upV0QSxufpoJyI=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=bTf6u2bO/DseEvQFT6gPNsMQWPGW/ecZInU2RKc7O7SZ7gtEN+qU8e5llFeUgbRn1N9fCUxqyDHuN47rQMO7L5Ce5XH+dibZ3bPknNCvQh6HajhYiiHwBMWir7kKP5hX9fCC4EvDYbO53+tDbiTGhrGwofgfpbvFT7+LNQjTATAi1iVOuINiWs0La505JIgus2xuseplnISxLEncnCRKbbeoosQFIJI1udVLvhTAL+Ml/MFiYxbJ0DbOSqZxqOb3RUll9e9qSGmxzB548NsIMNm54SAMyyc/IWfLJjD0gtOlyoUIOE+BZLIesUFHZJeFsFsvhaOsvbcXy/osSgDldw==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 606B51800691;
	Tue, 20 Oct 2026 09:39:12 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:46 +0200
Subject: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: P1RivSia7mvEILQX6piLNZtW-SnVAnzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXz+qusdGMe59Q
 ozmhUAeZVGFtjJ7LZxj4dFtSo8qgNqmO0OL0baefzgRvjZTq/5cucMSoq/z/8J8lBtDkgrDX9j4
 1EsxoSXuLQzxiyMpbJ1j7wT/6IEchJ5iODWEOyljDRBuhFXH2//43XO5IKIU3vptv8FglOlc06j
 yZFlF2Xk96YShgrVG+owN1OprCKlwjagJQb7xbW8ayNwz3e2uogb6bJwpokYrGwYoTa5f1TxL+R
 c4gB/qJ55u8UVyLlYmq5vAvc8dkRNMCkkoLjH2W9L70cd+FqKqAbjlq7dRUIBk+ibqqQ0xqPLo3
 5LjXXb8b65ji6PclhZikg0MVgVDSAh8jJO+fQ6dd2MgcuRa+Vb7l2OMMv7Dskc=
X-Proofpoint-ORIG-GUID: P1RivSia7mvEILQX6piLNZtW-SnVAnzC
X-Authority-Info-Out: v=2.4 cv=UMfQ3Sfy c=1 sm=1 tr=0 ts=6ad736c5
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=AhhewsDm9b8M-hAPyywA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABtqijtwkJwGZwKjPwmzt2BpWebcDONZPRT27B7PKKItBFlOb8iyd7Ca2wsaquft/g8+HOoUpfV61jBB8Hvartcyp0aCJRNhsAd1fb754NpfnptkT0RXyXM56vxoDeUTnZlgcyWdoo7CuhRWd74RW3JTmyhHGPxZPV8h0QPaSYnMBVlDWPWIMXjCJ2p53ROJTInalQYSBk9AhmeTwTuYN/OmnpWax3a5pOwy2U+FF8gknU8ODLIg/zy9HdLI3VLtosTWFok49BnUHMzHXcE+uGvgIFKHGDYYLTxUCweRqbud//Fzq1CjLczHeWgNjWCIHekgP/lSEehG37rFQxRE4yNDzluQi+mh4oM0lLSg8M42O1dBB54flGlruOdi854DudcVWb4Br9VTv43Qf/muc9XXu7NepFSWkKGqBig83Cef2vXMbYM0TFcflr5JLQRyJ6fUhueDDBWqrYe5ynlkxiZj3xJM2ghiMOBiVIVbLoquYXXPeAknE9oAGjnUSRbJ6rekDRpCyzmHIGU9PEfiYG1CXfH/xZOtjFB99nNrIQqQBpOR2I/kyCL5RIo7IFhteE3T4bubTUNiS7nXeqAOtAcE0U4YEvxsisrjOztmdXWMNoqvoh79RWagBEFQE86RUTe+pCTdklsObNslx2tw5mxw6p65BIl6JggFDphSl8M6tKVpUJgUOU2OFl2sY8Xm4OsBg4kPwkLaP5nVFDNs0xKgtMovzPeNWVrS2aoH+soRkYdBHRo+26xLmN55bhtSc8hqi7VwRR+5HYiEkYsC8nyGMgzo+42RUSxBpLhbmWzRvdFGWsEzDxsTi0Fgk4vdOEW6kXOFbFMZsSSOdtHxk8HQpF3zvlSbZmjzv+bIfNh8sEuZ1dTEQHTZiWneJJ/tLGducKwYoY/eg2b4lgVOTZRaLKn4Um9Oa7A2f3qTkUkD8w8A==

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 922cf74c4eb8..384ff77771ea 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
 	 * According to the spec, tile_cols_log2 shall be less than or equal
 	 * to 6.
 	 */
-	if (frame->tile_cols_log2 > 6)
+	if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
 		return -EINVAL;
 
 	if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

-- 
2.55.0

