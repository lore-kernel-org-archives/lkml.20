Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A88309EE2;
	Sun, 13 Sep 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789293281; cv=none; b=JLDujWlmhN9st6aEMPeVNhVtBKITaxNNTvdmWGqN5vKgcRR4U3EokdkR+dykS+P7iCL58bR3UcSktUyxbgebURAuxzjzwuEkk+YbTVkglePBXDNQdBwttyP/A8y4VqmqwR6gGdSX47cRGDDDtx2o4wowejsuPLCkBsrWhlbedz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789293281; c=relaxed/simple;
	bh=q43/sb9n50B3AtpKAIGs7p4wTxhXp9QDvV9VFd/lJ44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ey6gXh+3IpHBv1+NOOB+xAvTACn6axlDsyII9I6qPm+TpnvFij/zhmEeIPeFzY7OsMD4t+71ikJFWesRM7IqCuD0lD8OWLkdUKAv9kbIWQi6+9H/bCXQecbzAaoD0FH2cMPwngXokI1CNWJ60OuuCdktLnPhweSq9FLQJtqYI1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=YI4avdcQ; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="YI4avdcQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1kSaukhH+aq/s3s0///qjM3E4iFd6eKQKLQRVCZexAM=; b=YI4avdcQ3bpefrDNPXxoYGAuZ9
	+SVYeimN8SOvPLapzEXpWP5XcmzruB4l0r9ZukeSPa/rwiag/YevcW9b2tgh6yx1VZdrb1BJZpZ+y
	gVWh2VPuOnjhdNSsenZmnS5qqzVe2hshIKi2C2UUSq7jIsIOBYFYXXvtuef0OuUDIccs=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5guq-0000000Fei3-1Qpc;
	Sun, 13 Sep 2026 12:54:29 +0300
Message-ID: <ad3c2af3-f92d-4818-9c58-00ac04373503@minlexx.ru>
Date: Sun, 13 Sep 2026 12:54:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add driver for Novatek NT35596S panel
To: David Heidelberg <david@ixit.cz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Molly Sophia <mollysophia379@gmail.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
 <477ff72a-fe0b-4c23-8448-a0ec87c7e039@oss.qualcomm.com>
 <2e2cdb59-1b0e-435e-917a-0490fad29879@ixit.cz>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <2e2cdb59-1b0e-435e-917a-0490fad29879@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.09.2026 23:10, David Heidelberg wrote:
> 
> X> Ok, I found out in the meantime that Alexey is working on refactoring
> X> nt36672a, so we’ll coordinate. I’ll likely need to rebase this 
> changeset on
> X> top of the refactored nt36672a, or possibly move it into a separate 
> driver.
> X>
> X> See https://github.com/sdm660-mainline/linux/pull/114/commits
> 
> I think it fits even more after refactoring. I hope Alexey will post the
> refactorings soon.
> 
> I'm afraid Alexey didn't :) (+Cc)
> 
> David
> 
> P.S. I don't have the hardware so I don't want to do a risky changes.
> 

The rework: https://patchwork.kernel.org/series/1163701/

But there will be at least v2, I'm feeling it..

--
Regards,
Alexey Minnekhanov
