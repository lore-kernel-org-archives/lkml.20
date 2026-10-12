Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502AA184A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791763643; cv=none; b=DGaZyWX2ztHtzjnWoeTwe2W86+NrreHDvYj0vQpMzas6LhLQ05TB0H3lRee0ey2nhGaZUnmf7ycHaCSl2AGwFH9xmOfI4WJhFOkEfjE1VMsUuPXb+2N0x8dnwmlrQsi7ZE6+NZngoaVhnr+9I/Wy6a45/QX31m4oSysbizsmDYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791763643; c=relaxed/simple;
	bh=NvU8lTGY5wOw1EfVIjl8TWYGKj/afTUacaEvubBQpBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPBYowstiQmOV2jAYbq85QBIn82b10uPDyCYf8KuQYGI4KKdBHoGbu6S6z2mRPI7EC4ABFs5d9nXm8+010SSSlFj05H/Mf7obX6hthNDxKXMq657eEiymSs99sZ+JtGuv+eexSzJyHyU5jV1qfMdaXLW85F3lu+K2jYB4xLr/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHLGCi3w; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHLGCi3w"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2312409eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763641; x=1792368441; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGay7rJNBB/90A9EPg71UJBrKb3VyPWYiVs9WPdHtBM=;
        b=JHLGCi3wE1HpryGt4QEax5h2SGR1BDCYrZEcI+S2PWcwcwY9u6HuSxxa+9rFaHRe6w
         WGVTdgkZ33jqUs2tnVuxerv9T41/+dOFjs77uAttvz+FtPWswPvxi4eD/AfTAJFesARx
         zuhWC1/Bn515NdKydtZHkE5BOYLb0RzL7KLCkfoIc0njg2WQbPfkQRmoGXWsL9KJ3fHQ
         mxqZP6DPXP2Ep3zw86F2mS9EWq4Cw5LCkjoSPmb2Rf10pacDBXyTDThuZbPwot1l+JoY
         Q4fjQ38y9pCEaMWFwx8Rel7iU+KFyX7UvjoyCn1A1tVYI66ahUlHjArfX+DQtmpbrjxm
         af2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763641; x=1792368441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wGay7rJNBB/90A9EPg71UJBrKb3VyPWYiVs9WPdHtBM=;
        b=i0uSA0oayiceTPCzaD9ECTTrIvK0n7TfzuonS0z2XJpvkv2a2SPjMq+lfPMNC7N8Kh
         rsw9TToc6hWVe0aAgR+phvaKdSx4DSC+YeOc1Nuh/YgN1yNEytu7JA/02Bwp0/IKUYtH
         yq1GULjgKgj0dzkIbmkDAHV3iw088bzgehntxSoOcjNWv1PcqcxkfdZ0jXBsLTSZ4suR
         z9jAhPoWQLNRMdpaQtmqfh7ObQkQ6EtFmuwo7U7lrVWbbQBa//y9hp5KXql45kRLM1Ky
         Lj221htJt+ckXNXKgBZeDapdHEV/4PUfK9ur01YN6vFko8XrhsWKZEPJiiiZj88Qr9vh
         0nAQ==
X-Forwarded-Encrypted: i=1; AKwUvByC7eauLeglJFMiI1Ex4+0B+3PZAJ4o5pmzYSskVbk6LvqFWC+pgzpCGNBRe/6CXFOLQbW9aGQywlrzpPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnWNaccHD5ErgoWeOdAlJdqwxCWbNGU35a4n9/LXJB8u5l3I3G
	jsLb9rIZc9XV8ieLiUsQ6uQFplB3QazDv9qudQj3/EMI39BHqvyqMNfF
X-Gm-Gg: AYBFou1xbwU0m6YBWk30HhxDFnarLNGV7dXZwgF2Ir0LV/HQ74kLyKawJ1jA/eOm3H+
	+l6ystvMHMUrQ0rDEahQDp06tV8kHbyG6qaG7xmCnZ2Taa9+OUMi7f5kKzg45XD/J5cpwPQiy6v
	j22Af8voTrhfDBP5MXwBTwkcG1DsiMBMxi0ItIZH8uR8IAbL1Ak9gjyG0v2iBsGfFL9IeXE/8QD
	YVWrztFCyYfDPMXdWMB881XFP+yAENOXpuauHFOA/kvTCTFaJyamtDPs45DwGSYU5sG9OhOe7Vm
	+LXNHBRyjCUOan2d2zIiDpF7p8QRiP2E1oR86uNgpcRucOsGopa5stg8sfdpyDHesNoXa18qoup
	mRnvZIabKhOUfJRGnYUErg3X5phd5JI9dvhFbMFHKF+x0X3kSW8U52F7yD4tCiuHH/DHDGFHw31
	XNHeHvz4nOy9EQ51NJHOyp/yGdQzr794Y2MWBG/mjtqzfbVXU9QmP69w/nLb+bYuyI9ngFabs6C
	Tw5dZFWRCY//hAhY5GGahJR6z9qgtiClQXMO7CxuNJd5MQ/mxE=
X-Received: by 2002:a05:693c:6218:b0:34d:3ad2:680e with SMTP id 5a478bee46e88-3537df9e261mr12921018eec.14.1791763641210;
        Sun, 11 Oct 2026 17:07:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1ba7esm26650789eec.7.2026.10.11.17.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:07:20 -0700 (PDT)
Date: Sun, 11 Oct 2026 17:07:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>
Subject: Re: [PATCH] Input: reject parent overrides on managed input devices
Message-ID: <aswinjw7Ov6auPrn@google.com>
References: <asmCc1VxVPLIMgY6@google.com>
 <CAAd0S9A6zNJU=BkUgpGtdHBgkcnQ0NyOWb46aDnBuGCf0TKvmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd0S9A6zNJU=BkUgpGtdHBgkcnQ0NyOWb46aDnBuGCf0TKvmA@mail.gmail.com>

On Sun, Oct 11, 2026 at 08:12:47PM +0200, Christian Lamparter wrote:
> On Sat, Oct 10, 2026 at 5:54 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > When an input device is allocated with devm_input_allocate_device(), the
> > owner struct device is set as dev->dev.parent and holds the
> > devm_input_device_release resource. Later, input_register_device()
> > attaches the devm_input_device_unregister resource to dev->dev.parent.
> 
> Ok, why would this be a problem? If something other than the devres
> garbage collection
> callback access the data after it was unregistered... what else is
> supposed to happen
> other than a crash.

If the owner is overridden one possibility is that input device stays
registered while the rest of resources have already been released. Quite
often it is "name" and "phys" pointers. Since the input device stays
registered, userspace can access it, which results in UAF scenarios.
They are reported by syzbot and may serve as an attack vector on a
device.

> 
> for what's worth: this patch seems to be a "spite" response to this:
> https://lore.kernel.org/linux-wireless/20261008-carl9170-reverts-v2-0-3ecb12089797@gmail.com/

Heh, no. I was simply tracking a syzbot report and I have identified 5
drivers that do the wrong thing. 4 of them are input subsystem and I
posted patches and will pick them up through my tree, and one is that
wireless driver that I posed patches (reverts) fixing as well.

I want to make sure we do not introduce any more such cases, so I am
adding a runtime check that will fire if someone will try to add another
such case.

Frankly I do not really care how you will fix your driver. I posted the
patches that should resolve the issue, you are free to take them or come
up with your own. This patch will take care of the issue from my end. 

> 
> I think someone else is working on a separate fix:
> https://lwn.net/Articles/1038523/: "Revocable references for transient devices"
> With todays Patch-Series V14 on: https://lkml.org/lkml/2026/10/11/475
> 
> From what I can tell, this should have been what devres was trying to solve.

No, not really. It solves different use case altogether.

Thanks.

-- 
Dmitry
