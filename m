Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E4F233920
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.197
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788055304; cv=pass; b=KCIB6eO5NbTPeGDXtNXrGw6uV0I2hHWSyUvBulZVcKuj/qFgLOp2BxBibQ3HFPuTh7EQetDvZc13NgcfQ33l01qxPET0mA1GJEQWQ/WMBbawf/s3aKmDzI5FbNR3rcl9+9BsRtUfb99GcrtneP20df5YMmNUwVbz0imffEJsuEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788055304; c=relaxed/simple;
	bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rl5rGLIa4IH2ajopoMOnEdoESTD/jx9P6m4PFn77Gsa2ZfzSAOx/HJ4XPgQ1bHxXcaFN7fcVpQrBEvy+GwKKCEtvMRaTATKXIEzm1a9m/mQfrGqjgDr2LNfHdt2FT3nU5HGPcEIA1v+ruEU28Waa1vlDvNzRadjxgwHh/czhf+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFcAhEXs; arc=pass smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFcAhEXs"
Received: by mail-oi2-f5.google.com with SMTP id 46e09a7af769-7f4e10aa28cso429051a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788055302; cv=none;
        d=google.com; s=arc-20260327;
        b=ZtaZXUXAi8oIBooAK1oJW4MuZMaGREo+rBYu2hXRjRDYA1m+TM2m7tWJzBB9C3GJ/x
         uoM3t+CKBVA/UDm775s3L5IKnkemrQssjtWb1W4C9xpRhImKE9brQqkEFt6k4CfU/uEe
         Z4c9NbkIBXEgxhjw9/6eGaxOdT6sSyP3LNJoAmnIkTbtUK7Ykc/FoAuMGLINU3MNMg66
         DzavXg4iWNHVLXo5h2r/QcGdA9yBrOGoaAwV5YiW/AKwoIJ5nDyfkHho408kl3cpkU5T
         VH6ZlY43HtWPiBJpR9iq3qewr9Ohc4oeKZpkiWoK1EdgWVLixHTpkid9GE3b7lI5aSDv
         A+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        fh=JKQ0zZpG7+rw2V14D2baDElfNife5Cxs8HD7tmOmeUg=;
        b=VAVBtPUL7kTaOL+BLrkU5K32pgzedIN12Os5v2IIKA3ZY2dDlvUdZySQ99Hg54iX8d
         UYZxz+02abn+WpYLac8t4NAgUXVi0hoc8/I6H4ZyQKmN9/8PCABdK+bLW3P8iXgrNUR/
         GDWArN96c+kU3tHv0tAbdgqrHNevcfKaQtM/F/qhO8ukmT6Swqj/jdDPOxUrmuffp/5R
         afXP2oIUMOgomfW/QK3NgPyXT97qTHL75kdg+ew5Jcav/g5oYi+bsPER+tJmBfINdANy
         rRfF7ca293MbZfOAfFea05kpyeWAjuybVvBNOC/sLrHqHKnXgzV0RwsNoiS4zyZYdMkM
         ay5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788055302; x=1788660102; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        b=XFcAhEXs24uI+CzAKLVDlyhSGSoVGmqtIdfIKd4sXqcxCkUCv9yRRnJO3dPqEZjjNi
         XzyW5jNMhWHsaJZmoFYP5+ZqukZjcdO0fj/eEgu4wX1m1/RncJWwDPwLGpbeVvo90wtO
         Az4td3zc2S0JjL1eWqZel6DVfsp//EVsWkILP4U5XE8lMtVSREifyrj2pTkTJGqA5srY
         WDSfrpt4UDyBkWbvefXWE40Zc53zcZsm4iayh7GYqvDZQdO/qUAYbwOg6OiPQ1vTzBQq
         0p4Qtvac4dWe0jRAU1ebj0a6SnHuIeu+MopPMwt1qKN1Jl/GAJNym1Uk9bdDM4rC6q35
         Kwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788055302; x=1788660102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        b=B4jPix0zF/SCDBCIS7tDDp04je7vfI/jw89de+46nTvxjdwBSTtRpmKsWuXdhwlXxa
         DcKXzppWTorqIAWxwF46HwuQF5kDHz8U5oVm3QLl+JYBYHs+m7vTEImRrJ/ccC0r8xXm
         Rx/7bzjhQUnMhc8IPn0TS/ovlildZP+K1/oww4E08Mdwe5Cp+pDAKMi4wIkkP5DS2tcr
         Mxocjz59foqXWJ0/4UcELCJtt9OGNavo5UqYG+8+sjJBjbKj4B3rTLEDHvuYhdOIl4oV
         9CbYm2LZ6dGcwr2M2+RRebhkhbYccO6Jd9e0FwXuMY7DVqNPLvuWtiZzrOp+0PZwBeaf
         r8gA==
X-Forwarded-Encrypted: i=1; AHgh+Rpxkb5/rIrgooNAd8ahmKPZBzN8h780wLVzx+83ee6QTDIB4ICZB0a+UMnkY3XmSnTveTvqO/goFXJUe2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++njC02KVr9i5q1WRH76pLx0A6PW3NF9weA+e9e4l/xox5zcNKUB
	WBIGZOMYhXRIE9QmQbU1OWeQL9JswFCq6hQFp6qe82DJ53l4wHbcSoiJ1kCkmNCRV4XKSuRPYCN
	Jg805ZmwR5N8q8QVtpzep5uyxCJAws/Y=
X-Gm-Gg: AR+sD128aF0LKkJDHidpx6T4RXVlTMCvXEP85U/VqGrPG9cW+/NdKcH8XxCEsrVuywm
	eAZfrK8PEc56FcRO4xtJi4Dm7OpQ50yoRQdZjErKp02QkT8fpJUkeQUUjbBdKvZVRswoIIzAqB/
	iECXA5wFS4b+sn0spZu2uNBEvZ6gSaVcpAYWBri74XmurfYB84AVy0HguTXiOFBNZGMEQaJZJLl
	Yuf+tOvFd7Ti9cGVL84oEpEvctGwee02qs03FkW+HwS2b2U3J1YMP4QIaAAvARbGZG3Mwse+OcI
	Os9aknWCmlfOOo7puxTLKuoJ1K3ODidx3ulN0LuwkufhoJNcWgUBMM2F5V/6CYoq793rzjBEYFB
	wLGI=
X-Received: by 2002:a05:6808:178e:b0:4b2:b653:87ff with SMTP id
 5614622812f47-4b39803b2ffmr20583581b6e.7.1788055301793; Sat, 29 Aug 2026
 19:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729011001.16999-1-dennylin0707@gmail.com> <22f01d3e-85ad-43ec-aa01-e5f3eced8703@oss.qualcomm.com>
In-Reply-To: <22f01d3e-85ad-43ec-aa01-e5f3eced8703@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Sat, 29 Aug 2026 19:01:31 -0700
X-Gm-Features: AcwNN1WiAb0Q13f1dUbx3G0x5k62j7uinaHZOIU1052lWkiaCapBUbdu9a4BAPw
Message-ID: <CAGEkeHdG2KkyR3ZV8aB31Ymcsg==Qyyqf3Jbyg+XJu4CvfLjOw@mail.gmail.com>
Subject: Re: [PATCH v6] media: qcom: iris: move OPP handling to VPU power transaction
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is an existing "issue" in the driver

Thanks for the review.

I understand that iris_opp_set_rate(0) only selects the lowest OPP
and does not actually drop the performance-state vote, which is handled
when the device runtime-suspends.

I will keep the OPP ownership change in iris_vpu_power_on() separate from
this existing behavior. Would you prefer the actual OPP release to be
addressed in a separate follow-up patch?

Thanks,
Hungyu Lin
