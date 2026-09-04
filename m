Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885E41D107;
	Fri,  4 Sep 2026 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557629; cv=none; b=AKdFZxg0R7OV6b2e8uLhJZFYtVHOc20KpmMwpAmgMuU4suaCdCwBnOZG/YlGQZhmw+4cupzNqjJN/jIfMqwqrBwmemHnAMOi3eNYe/BHewzM84O2SqS2Xh48V70kXAONex4EMGoBoouRthNvNoOoMVuhYXUjTsaH4RH/NiM4G+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557629; c=relaxed/simple;
	bh=HdLEIcrlPEOevBZtHHMnslP+T5MfNB113yuLUv+KiwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVmTdJRxWiQFZYCtqpicAP3TGfOEe2+GI/oakbSIgAfZTce/wGpg+T3/qG3YwWOFjwG85keh+2wl1ngUrsaBOPsfw8IFBT1S3DZFmVCSoSwsJxYiyWmkzLyWznY5751uhiyVk8PViDrPFQvbceNHaWCd4e12z1nJi50Kpl30VBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q8xxM+g/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q8xxM+g/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sSvUpFWW8JKivVwdga+J27ilaaR4NlD5+m5+kzr85ck=; b=Q8xxM+g/XRTlD/9/RWDWMxhIdQ
	bnmSadAa2Ncj8VuBv8mLITJWBKQhrtzOacFJLsE7wLwNQLUZ+JXSSVLyp0V7pnUKmJ76YqizAsB1L
	VlOBLMSfLsqZKM7PFZJNGxBghxCZa+kFSvlcUMEiA2yMsSLBf/NDkpjIj926gWvjzzhqdsS7jatx9
	DkoSAos+kdj2SqJCEdSJm20qvmbdfcHDI4CguzyYMend6CFvF7PH0i2OzwYYIaVOnl9iBfLARbiuN
	QdKW74TRe36Jktr31Xu2+ikPSvhI4fXsik1ZY5YYbbtArVwNCMBdmmuxLJLl7hOPd2tBIFSDDtRb+
	USyUXpqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bXe-00000003Kbx-3waM;
	Fri, 04 Sep 2026 21:33:46 +0000
Message-ID: <5ebd634e-6d57-4f71-835e-9ff919fef927@infradead.org>
Date: Fri, 4 Sep 2026 14:33:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 4 (include/drm/drm_connector.h)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <apscSgtnBigG5gt0@sirena.co.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <apscSgtnBigG5gt0@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 12:30 PM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260903:
> 

New warnings in 'make htmldocs':

WARNING: ../include/drm/drm_connector.h:292 struct member 'cnmvrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ../include/drm/drm_connector.h:292 struct member 'cinema_vrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ../include/drm/drm_connector.h:292 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')
WARNING: ../include/drm/drm_connector.h:292 Excess struct member 'mcinema_vrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cinema_vrr', 'cnmvrr')

Please repair.

-- 
~Randy

