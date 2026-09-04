Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AF94A1DF9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530083; cv=none; b=ITjOfFDUJmRhBQ4JAwzG8c4deN/dyWhL/HuRJuOD8MCwHNHl3tPSqKzor5cjYlU4KRy5Q6c2Irs6nRUEOZiOAGs2gewA2Ww0dgV05sj9DxNpww25FDeONjtW9vegnP8xSjYE4b1BzJFFVZgexBFSO9X4TI0HJqDaXr7ZZcHLPrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530083; c=relaxed/simple;
	bh=7DSSTy684ynNrJQaKF2fakA6DNXRZF3bwdhsuFWBHCI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kf6UyUSJaij1ciSrtIyzuTAcAQIFX7P/yainFbGKKHdH2dWkEzLMUpkhMV5iy1A/r/JjkioiQyn7q+3O8ElNyZ15LzQ1aiJurF9YnUWnMOcfF4+WtAtEPOnRhY6nrKSKBqugQ39y4oSv5HQjI8UBp+4Ad2TlCmVISEJr7HUsDZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmaBCs1C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmaBCs1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC3A1F00A3D;
	Fri,  4 Sep 2026 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530082;
	bh=6xFlDqgj+7IPtto9fJVKoN7wW6UvRYgPIe7Ac0aUbRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TmaBCs1CEeC/C1KYKJ6PD2fQfkERgH+0y/9fTEl17VLYixt6CnT8SYS+X51gXjh6Z
	 CYii+PXn0vNpQLrNLqbh5SJZM2wpTlELblBC4T/ejVJtdrJouEyF0AfpQ4dUz8AnIU
	 losxn4T0Hd3FMaLNy+SNdhVv+L9/divl2QxP9UV2slS0m+DJsvguaqMprUQCkST9Hi
	 XtuTq7cB8DMwer0iLmBVaTNaOziQKoi+wYN4NkzGam50QOvRzO9UpD/HvqGLS9dqsz
	 V6Amn45hvIxvxtINVqx9zmePqN7zty17DBVXi/n+tSgwMmthOarIFqXeX3ZVOVMGZV
	 cQazZRinsPPdA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mmayer@broadcom.com, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260815134559.47888-1-pengpeng@iscas.ac.cn>
References: <20260815134559.47888-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] memory: brcmstb_dpfe: validate firmware section
 sizes
Message-Id: <178853007977.24196.3488069210223537136.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:54:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sat, 15 Aug 2026 21:45:59 +0800, Pengpeng Hou wrote:
> The firmware header is read before the image has been shown to contain a
> complete header. In addition, the final size check adds two
> firmware-provided u32 section lengths before comparing the result with
> fw->size, so the addition can wrap.
> 
> Reject images shorter than the fixed header and checksum before reading
> the header. Then derive the available payload length with subtraction and
> require the two declared sections to fill it exactly.
> 
> [...]

Applied, thanks!

[1/1] memory: brcmstb_dpfe: validate firmware section sizes
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e61c1a1103e2617e8f86288368911a8591e35c1e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

