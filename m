Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F41541C2E4;
	Tue,  1 Sep 2026 02:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228607; cv=none; b=Ze72t3xL8wQqGEcgE0nCTbmWSQQaiPGUzJwhPu6QL7GLkpB3FtFIF+0n1P2yq3MRW9FsPJeWC7w+/fAOfL1LpKOVJCDcsQ3mTH+f68ayB2o+dmkK3UFEXwli0D1X49cb0kqbOsS9ASTn+MQlfwmimSBp+qchQifzTGdWoceniFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228607; c=relaxed/simple;
	bh=Z6e0TmrJYQl7e7Qhe2Fx5kLOvyrqVVzS1ucPdsA1WD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nDgWJD5VDAWgW/MeFIK2lQaGWP/bn2NDMo+NIi0tL3QiOO6jBVtanYKDktvAw6y7Oe5kmQb5kP70y0ZxM/ZjFaFajgDnTqLGVqV3+37niQjWBATCmVGMzng8yRCn+Lcrwev0bQYPeHPUipcWkWaexmn/nTyx1i1BSeVeY8iZDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP6AFdko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP6AFdko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFE41F00A3D;
	Tue,  1 Sep 2026 02:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228594;
	bh=bimAPeDe9EY8M4BeWqDvjDzZnUyngujHgy9s7JonzWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dP6AFdko2FmGWrzrNIvbn9AvIW+q//7XFrxa90sjETLVMFsPgjTLERQl0vZB+PG8P
	 F3BFJ+B302CbZpN/WUTXxGKlfxDQOnYzoXWQBemtSV52TEZOLW7qlQT1wDGCTCKM9V
	 luQfY21RgAqeH10H0szVTNiRozro+iUO1FVVNFIIXG8zrdQ/ibiUJiDAK//adL+qqM
	 VeEPtTsUOHcaRkn0MQAm78+1ZGRrGYNkppD/QrvBnno6cTl1aa+Lwmv7oFZXRmCOGS
	 8ShKdUhvN8L83LJcAZmbI2Kh+1z9569mWKn2l/N9nqhEwXMwLIYK/xlYSRYL0Zb3ts
	 Ps+Ix8LIwxP0w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	phucduc.bui@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup
Date: Mon, 31 Aug 2026 21:09:30 -0500
Message-ID: <178822856277.1835959.7149857361336023213.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819102630.68991-1-phucduc.bui@gmail.com>
References: <20260819102630.68991-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Aug 2026 17:26:30 +0700, phucduc.bui@gmail.com wrote:
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
> and -EINVAL, should be propagated so that the caller can handle them
> appropriately.
> 
> Propagate negative errors other than -ENXIO.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup
      commit: 1ceb3431910f30334c16e3209ec79aff44ffdc9a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
