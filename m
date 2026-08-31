Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A30848D86C;
	Mon, 31 Aug 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198853; cv=none; b=fQocKL1uFOzEsnkz0MOtG9PjOoT2JyQpxikeBTR8vRn8VibxagZ/jXUCDyhFOMyWOpwaZd77+M3grNAnQC0WJkClabXwqPEmPacYEv11SNdeqySEBvN81y8S3ZnJcioVZ5QNCqEX7BqY18FzX20EOP2RSV4BYMaqOp1LsOzo8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198853; c=relaxed/simple;
	bh=iLHInvI6q8Z9BRA3BMW/1TCLygVLo9ErXZlPzCgmDWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u6xJy7FJJej+49WYoLpQHQU8KteUsPAUAe3FMTL/NXHfZt4ATFkVtm4TlW6RDgHdrmCqPkaWAViVPfpVUaVuEzKHL4MTat11m44f56NRxW7tiT5ef26QIyYqDGEE49IEGteN9NNy2PczJXRUZ+DJTCrNcBlRc3P5d8W2j38Ghlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDAsJAi9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDAsJAi9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CE81F00ADF;
	Mon, 31 Aug 2026 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198852;
	bh=MISB+ZAo8P4JOZTuYFYiL3GF3jKAv+cKpEYH1imdsv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UDAsJAi9IOvpkfcAlFwdecXo4TvPT13D5TWTyLmijH8PD7juTssI6jYow7sIWQdiB
	 pK3QGCkpkx4zI8bo+nZT3xGeeNmONYrXuCz2LyvQOd7ViFWqWVEYfcsyMU2l4MoYf+
	 6xutuBlm4I//aPuJNBa5qhHRHVRsMZN9WsxSCHAqSvJDLXkpUGttVSNwtfwSSH5piN
	 3MwVKU3MsBypncY1q/57y8/dN7162xWQB5SnkDxbFp6HYV5gDwLL8QhkvwlT0QUPWy
	 dS0VUBgZDaCfxcEh2+a98N1EBiumirHfE5ctDVOCvNOmkUn1VkaDBj2UG9NlYzGW98
	 fthA8Xa2KNbDA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: Fix byte order in v3 14-frequency parser
Date: Mon, 31 Aug 2026 12:53:41 -0500
Message-ID: <178819882980.1411250.6928623119194258853.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827020447.2642830-1-lilinmao@kylinos.cn>
References: <20260827020447.2642830-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 10:04:47 +0800, Linmao Li wrote:
> smem_dram_parse_v3_14freqs_data() uses the little-endian
> freq_khz field directly when scaling the frequency from kHz to Hz. This
> produces byte-swapped values on big-endian systems.
> 
> Convert freq_khz to CPU byte order before using it, as the other DDR
> data parsers do.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smem: Fix byte order in v3 14-frequency parser
      commit: 9f3136c0c5bcb26d5c864f8a5658c1a6f449d351

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
