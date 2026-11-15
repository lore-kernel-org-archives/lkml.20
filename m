Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730808;
	b=fBC9Nm61Btl4mb4i2hW018L1/a4TfSUMV9dnE/D/Ri4siBEy9zvSOjqE+tF83NBvhn9M
	 aw4RAgZ2lfpZtVB9jVPs7Z+VIaqdTiZpJl6x0ofhSG7ng/TS8TsbjwI6eQQf7xMxLq2Kj
	 K3egLgcgiZxIdBEJkB8OqUZXht3p7bAFkVdXx2Yxibvmjpocd9PsnU69OaulcIb8FjKF5
	 XP0XNBPEhz3TIW4X2dK7EecjpqNbGpMYUJOsSYZ41ueISpzdEe2/fdSFNi1Cf/QX6SCYk
	 w2G/rC6iA8igkElVF+c/l2UC/m9pKmjtWP/CO5mQL9IpuTR9uevpsD+Vv0TIH/mjbiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:In-Reply-To:
	 Mime-Version:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=cvkRQ9vTEHp2sTanBdWux8S9LLOQ1dWCdfqy76FCS9s=;
	b=NQjRsLgJfV3E25hi2juxvciOfhNwyIiQbuEzQNFa8MWvKi5t6b0uqDM5L5FiPFBlZcGz
	 vkWlUXFzqGpDkkTsGXvMhDwfYEQj7+e/VH5o/lOmFaQ/UceuLYtrxGoAPRMlozroezJxo
	 yQWD+l1aP+VUdjrRbzEoTeKVJxRSRKWJOBft1lYInqmmubzz1uk5T6whorYEXg1Ou7tDE
	 kOOapdLhTWBh66TmdHFjCITX1ktdHDJ1HdvzTwT7t6EGSsINbK+gWAL1f+tymS4w5age8
	 nwoOTbUc5eqONPEfG5uUZMtaemogkwahwxybO/iu+kVsbuWUs1+YdHVpXcmEdyqDvAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C0LwxZF6;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660D606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2660D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C0LwxZF6
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so37236755ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794730807; x=1795335607; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cvkRQ9vTEHp2sTanBdWux8S9LLOQ1dWCdfqy76FCS9s=;
        b=C0LwxZF6+BFl6wgUmpOceGqyxcXU3fj+WC5/Cgs6h9OMxjU5KJcHmONuMZv7DiZX5Z
         7ouvr9YUsPYgzxkRzA4mIrwal94AZW2LseWerMZqopLEsTqxJzI1UcZB+T9yluKFSTPm
         UEEy8X68/7sEeMFquUJJm96w1//g2IJMsevD+D+aZdmp+7KT/om3YmAI7ZOYWW7CagS4
         bRb+DkO7jzmcyMQmeL0KlKD5HBmRDBaf5Ebid8numYxRfknjg6YjPuOKNUY9sQNBMb+n
         hxcLz9/8jxxWvwXJ/40Mp+TsPK1oQ1QoZkCToeA3YpNdmyNot8c1LKjDn5nUgsEFsssG
         CkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794730807; x=1795335607;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvkRQ9vTEHp2sTanBdWux8S9LLOQ1dWCdfqy76FCS9s=;
        b=YlgBOAe1sSR9bxFKOOoTaJoqz+jMEq4z93h7QANFgduFfNUlSxpSKO7mTzUGb7nsqA
         RXnT8RJ1r+cTm1zZrmcKlQc+ZKMb0BwtuDkJsfRt4kmwUqCy6kbQxP8sjOu4CtH5RVBp
         P/f5gTGfwxCvRtHr/2SY6WhgD0SV3ixyVB1da9GHI4K49nQbf4ODyJuc6BNnp9TcB0Eb
         3FDAgq+2kHlKHRK8vHiVHSqDm1MoBBkMUcK0JDCXnFHR4L54kfxLNEf7ciaBWSBKDvGz
         cDI2Xjs4/T6OrLotF6jRSd50Tet4xLDN1ocFuxXRq2C8A3zj66rEnHX/oZjjaSbxbcQP
         u8fg==
X-Forwarded-Encrypted: i=1; AL+hErFEUiLTQtKSRBOLdG86m7A7poqvH8W33jahZhrz7EnxcPki6jFBZhLpQ+EC1iiVE+wWs8YBkscDTCpuKZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lz+mxWSORzLeqyS99SK3wiR+YHqEsRpMpcyXbpoK6DsCKx4ZH
	K6wVsljq1Xxhpj2Ke7vlAIHQ5FfKrNiX1W2YA2UMHx43q6u8X7ho/fkKcWgvHP0VAL8eIsFosC5
	jvbHiuzedtHfcsqANiN9BWA==
X-Received: from plhn3.prod.google.com ([2002:a17:903:1103:b0:2ee:20a7:da27])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2281:b0:2e9:55fc:ded2 with SMTP id d9443c01a7336-2ee0dec63demr78859485ad.52.1794730807271;
 Sun, 15 Nov 2026 00:20:07 -0800 (PST)
In-Reply-To: <99108d6b-ce90-4008-85bf-fef12204faef@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113111202.3551341-1-stanleyjhu@google.com>
 <20261113111202.3551341-2-stanleyjhu@google.com> <99108d6b-ce90-4008-85bf-fef12204faef@acm.org>
Message-ID: <18e82a2906bde9db.3137322e31362e3131332e313435.7ae79.0000sendgmr@google.com>
Date: Sun, 15 Nov 2026 08:20:07 +0000
Subject: Re: [PATCH v2 1/2] scsi: ufs: core: Recover link in
 ufshcd_set_dev_pwr_mode() on timeout
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux-scsi@vger.kernel.org, "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@micron.com>, 
	Peter Wang <peter.wang@mediatek.com>, Brian Kao <powenkao@google.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Hongjie Fang <hongjiefang@asrmicro.com>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Hoyoung Seo <hy50.seo@samsung.com>, John Garry <john.garry@linux.dev>, 
	Hyeoncheol Jeong <hyenc.jeong@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On 11/13/26 12:37 PM, Bart Van Assche wrote:
> One change per patch please.

Agreed. I tried to fix too much in one go. I will split this up
and address it step by step. Please drop this version for now.

Thanks,
Stanley
