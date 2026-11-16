Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.68.154.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847799;
	b=zIkWLxL3fQfEAC8qamRBSReRKAKvu8CUrofY6LN57YoAK/MrGd4cy/lG/8Z61PS+Er6B
	 6CgW8dFKHPrwdYkwQOgaeP5Np/DDPhs8NSwGTh7lf/W6xLmB/Tm5kDHah9qC7CKo9dWeJ
	 MzsnirYNlzRU9J8ALSWwCJOGtaVehNt+ruUmlBtIq+oGufuNcYKavBxrP+yyy9+NlHVSP
	 iNoAzzBQAT3RjiF/UttQXOeAtqbTDKDQuVJIueAF9+7sbc8Kbv4zQtzS9nkk7SdZReBgR
	 zCZeq8JfD0kegUiwplRbD6GTuAU0vI4FqhblC2uR2BKJnM889EION73JiV3XDOA/1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847799;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z3Zzcxxpelx4gEL/kT3/ZLWHYXMTo8mzCTcRc+QcWaI=;
	b=4f2TWGu74jGia4kI7e0LBfYD7GysmGcGBrU3erpfozoGnr/1TZxp4ZQGnOOb0hwdLplK
	 h8iN240x24JUkHU61UGGblaG8pZ6HElDrm0aZlDbv155E3AjSmmpdYCFnyiAu6w9ENHfp
	 YB0cyocVqtzKaH3hHZ7KxrcqSPksxEp0GiMrcvGTkOUydbJ4Dk8kJa1XQ14o3vl2eJnM3
	 x/Ua+5cp9CM3qBsnSLaADV0uYgFpCcAKK2KizmYSt+N676a3g+kwmHTe8G3deblJQZfdl
	 Jly3A3MXVfIrD29zx09N3IVG5Dd388DPQdaZ6sYEOdGYKpFXn3k1fom2NeONp3kw5PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fromdisposition.org;
	spf=pass smtp.mailfrom=fromdisposition.org;
	dkim=pass header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=bhWL4nsU;
	arc=none smtp.remote-ip=51.68.154.128
Received: from 4do.net (4do.net [51.68.154.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA08606A31C;
	Mon, 16 Nov 2026 16:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=bhWL4nsU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fromdisposition.org;
	s=mail; t=1794847796;
	bh=Z3Zzcxxpelx4gEL/kT3/ZLWHYXMTo8mzCTcRc+QcWaI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bhWL4nsUV1SCCKT9MhEA+cUPtbzrmzj2Fxa2fgEy49BJUFchTQ3kFm/syglXnhaRP
	 gbNoKWRkoC6rMHPethxI0ohjh7eKQUSRkgXd9eHGxb27CO59rkKiBE32z7R+l8SWtO
	 +MoLNPSNR+hBas8X9reAuW8blpMbM0bfBgipUzHOAXaYcou8kZW1PWVPLmXSe9rH68
	 Dm9/fFC+5XVm1c16GvA7154m7kR/wqHyqza9SkH7E++4OlieCAjOf1edXRXcYSOETz
	 9EDN56okjTLO0v46bNgbkHgkfUhnlI+Tm8+aoQhqdZ7t0OITrjHvPNWGqvhtWr/fAB
	 l0LoBwt1tSkeg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 16:49:55 +0000
From: Demeter Barna <me@fromdisposition.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Michael McAllister <me@michaelmcallister.org>, Srinivas Kandagatla
 <srini@kernel.org>, Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
In-Reply-To: <b9143689-e390-463d-b486-ffd468be0805@oss.qualcomm.com>
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
 <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
 <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
 <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
 <b9143689-e390-463d-b486-ffd468be0805@oss.qualcomm.com>
Message-ID: <b6287bf200500db6b8f358b22bfe99e7@fromdisposition.org>
X-Sender: me@fromdisposition.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-16 15:02, Srinivas Kandagatla wrote:
> If its easy, Could you try:

Tried it: mode 0 behaves the same as mode 23 and as without the patch.
S24_LE playback is still 48 dB below S16_LE (the same samples shifted
into bits 31:8 play at the S16_LE level), and S24_LE capture still
comes back in bits 31:8. So the mode doesn't seem to matter on this DSP.
