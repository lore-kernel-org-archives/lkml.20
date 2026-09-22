Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308AE35A395
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048287; cv=none; b=U/BREMUmPGBcbTFIu/i8QTqTu1c+MDpUIjE43nHlcZXtGdHBBNX0jpDxxl7r+8XEppnogxKwQkLPqhXYtS/eOJ2ulvYq3eImeALsV+M98kcN47sjlmKNdWDEzB5CvbFdbDbjwYuz8SUcxROf4I4LrE3JUeDQC6+fekKiTHBPbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048287; c=relaxed/simple;
	bh=2Sit3yjN/GWAbdTHlI2AQIlIrquV4mQqFiv0Dgnepec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1JjSDwPTcbRDf9RU38sKO/2R3+BQvcwjSQmHUBWVBFS1SmJACzxJi7sjErjIEjkcinyCcrhbLs8+kIn1x3iQWdVEnP2MSZmTt+mQkfu9l/0oIM8lIH4O4suaWIMieZ4JG8LdxM0gFw9NxPazFubEKS8+mUQRxOfpF7Y4aACCYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLUtl4yB; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLUtl4yB"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso553966a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048285; x=1790653085; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIMk5ipKoZWRD7DzzBr8ps4MQh4Scmpp0BDfJZnXK0g=;
        b=tLUtl4yBjDCGsz2KVyIkqDaNh8qO5flVWZFGbU9N0NQz2n4eZstwY41dNsoOr2w81m
         rpp2o0kGwNz7A34eBvYTMgSUouwWOXEh8q4A0a27bzGDh2ZWrRpSLAOQfwfhAMTl+R4o
         B+v74w0R+FhDhOxBMBtd1qMJURyzogZkkCK+1bQRiBFqTMLO7XTITFIaEU/khYEiJvCC
         XuplogjZfiezrtp6WatDE3rUAiwMhI1qR/kFV1xrNJMv6eSSt+F7IhvevMUMdu9d5lR0
         6SDhcwZMn5DSXmuGcCm9ebRgnxXKIGztUTSR0TNuRBlLw++QxV/zxbCnlBPjZDL3/HBW
         ssNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048285; x=1790653085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BIMk5ipKoZWRD7DzzBr8ps4MQh4Scmpp0BDfJZnXK0g=;
        b=v+LQqN27FVSvWwimDuULlYeWFlvsAfWE0Q6S8xqmmcRbcXsX6Zp0qh2vRN44K/TEuc
         xa+t+PGsRk58cmXhLoE0cYlWdDtursZ1scdf1PPvBdZ0gLVr8WnXFTPKY//6+Rc/snIl
         UdkHc7IfADOZq22AZ53A/vkJ/40oHpF52qcADKX/rGIwMAN3+RMCRYu4sIvUDy5KKE6e
         0FZb29XLilL7aGtQxK9CHjwIyQhXkGzRmx9iSAC6TlMO+las4niuNdRXLKYhBQw4vbXO
         WExsd2L1Ozng6zXTkfizYpztINY5PrCiSHjmvR8H+junfrQ6RxONhTx4m266/5yNMpUI
         bntw==
X-Forwarded-Encrypted: i=1; AKwUvBwrHb+5lF8DlilXzHbECvjMtbuKsFFI0oMp1hrBFRTjZA1sPRXo6HP5WJ2/uhxJKHuRAfXS5hZh5yO2pJU=@vger.kernel.org
X-Gm-Message-State: AFuF++mKdZaYhpoHlTQfdc/x8Vtqf2bgUVBJ06JQla7AtEJo0JxGx4NG
	/0RAfD0nbVX29ImXl/VDsGckSCyVNuuyjw3tfVqeCN4TcEJHHZjgkLlN
X-Gm-Gg: AYBFou0N5zI+ZOfADTMXGTdy4qGdb74RAwVWdXmHQ50KyzxlK1FCU2GJOAl3swcBFE6
	A2n7Y8r0IldYqk/DlMMDkYpbFwT+MMxwpkL7eurwH7ju4QcEsS0RmbICOP19Ya+a0zPm7xOlC4V
	uKSzPOh9zdorcj8rCbzmZabhnd94F+NhZdoixuFTB+a9DkAWnfJuN8uTPH/asDAGyZ3emL4qUrk
	mIXNhPo4+98cChz7DT+TUKu8TEIGo8FMKF5p1WmPl0P/lTVAYrTBofV3/nzeT0YcN1g8Cuxu/Va
	yR1RkRtUAV/IYZuvH/Glg75NmxebyQpQKsa09mNI7juxbpy2nSMSUaI9OF66syHBREeUmIHRJ72
	zk7TMSz5yi6AnIJ26VlOcl9RBZ6bsOV5Z5+/lJyHL/l2ibNzcCj3XN2lEabEDE62wpyIotNNuqS
	SyDBoghiT7n7aHBkys+yplb8oq9KdW6RPMLj4wmwqvjB1sMFQcy944FJsr8AcFf+fxClNlVLYbp
	WHSwWJvB0lo1GgdmaNV3R/3wsIQuSuvr89AxAxO
X-Received: by 2002:a05:6300:8811:b0:3dd:a007:cb2c with SMTP id adf61e73a8af0-3dda007d26emr13269696637.40.1790048285330;
        Mon, 21 Sep 2026 20:38:05 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e1a7:4f7b:11d4:34fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613154bdsm1298997eec.24.2026.09.21.20.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:38:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 20:38:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: cryolitia.pukngae@linux.dev, kees+treewide@kernel.org, 
	DongLin_Lyu@outlook.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - rate-limit unknown key warnings
Message-ID: <arH309acsp-cMzIW@google.com>
References: <20260921131934.677541-1-zhangheng@kylinos.cn>
 <arFZdtgmZXcK9k1V@google.com>
 <3aa95d2e-9398-482a-8bd5-876ef1e2ce89@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3aa95d2e-9398-482a-8bd5-876ef1e2ce89@kylinos.cn>

On Tue, Sep 22, 2026 at 10:12:15AM +0800, Zhang Heng wrote:
> Thanks for your reply. This fix should be handled in userspace. It’s just
> that for ordinary users, they see a lot of warning messages after pressing
> keys, so perhaps it would be better to limit the output. I also agree with
> you that this patch is not necessary—after all, the benefit of this patch is
> indeed limited. If the patch is not merged, I’m fine with that.

If you submit a patch to systemd's 60-keyboard.hwdb introducing the
mapping you will solve this issue for users.

Thanks.

-- 
Dmitry
