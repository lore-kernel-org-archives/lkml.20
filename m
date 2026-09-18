Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43C38E5C5;
	Fri, 18 Sep 2026 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713904; cv=none; b=D9zgAgoGkTrKSRgEonMlGUFYDzUP6i4DjcOh264uilvWOxIXqfKUq6OBnne0pzgIZcqwJrpuRCxahd98AfsLSGkOeqt+SzkfCMf4RlsGKVpxp7YgDrNcdZ4f5Tey7PV6SkT5j/9m1AabTqpd05fOWjd/x4Z91RnUqmmsTRi0kNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713904; c=relaxed/simple;
	bh=DzNuSGeZ/DolGL5u8O2gqaTmdQDHaPMhZDPatt02kO4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AfL9Tw1YGuQkRiQd+JUqSdZ8K+gNSYlcd/zxAtcJalQpLsCxm55gHeSD+Qk9kkc/4O5Z7Cgyib0LNDpxrBPgrkRtCfaRMt2Yh3p6CGRRuQCuUvUkU7jBab9YTH0TMjlb8hb8HSjRgAWXJ4c7/BL+nzqQk2bsD5XqJeoosQz0NtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOq+HnsZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOq+HnsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4361F000FF;
	Fri, 18 Sep 2026 06:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789713902;
	bh=BupREwgr8lIWPTO67ce1QyKMJSvgG137+DPZFjLq88U=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=QOq+HnsZgFvQ0FRxFgP9jioiA8WkxyQe2IRZZxNiteQZCF+wE1vpQfrSuaijLojvL
	 WXPS6w/8eb8jUOIq/FFBbxnn/P6I5No/icMjocrphwJ0R7KraeC6IQi6+vWWivZXII
	 773egRdRESr/qsrQGk0/iufHrngS1FB7LAD6IBtEVQ3wOXGfkD7kWfUucJBniOO+zF
	 vwtFZuOZ0h4jcBHa6fZGheW6HgH5L1ngWQromEaQPBB9KghhKxOJpFiVtHk/zWZa8e
	 NEww3iNkswbvrcf7lGd2H+9Pj6fnvadxzN5RKgkY8lojv09OrBkqzmE8QkPZZsJR09
	 ExYoKoYoTgMYQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pan Chuang <panchuang@vivo.com>
In-Reply-To: <20260716132227.589778-1-panchuang@vivo.com>
References: <20260716132227.589778-1-panchuang@vivo.com>
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Remove redundant
 dev_err_probe()
Message-Id: <178971390167.472168.15708697692953474439.b4-ty@kernel.org>
Date: Fri, 18 Sep 2026 07:45:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 16 Jul 2026 21:22:27 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.
> 
> 

Applied, thanks!

[1/1] slimbus: qcom-ngd-ctrl: Remove redundant dev_err_probe()
      commit: 37052fa3297966e28e6f0903c6ba448b2afaf8f9

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

