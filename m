Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9173ADB99
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273545; cv=none; b=e7IhdT5oREb9gAArpuhXYn67n9IApXPW+cHQXZhXbwbK2ai7XAXX+BNFnccJRYY0ANPlT4JUdWW9B/Jl9Ny8gQFdVYibL+vT00G2peYqzFC+9Dj6uOwOmdiA8NPpvKlakeyhVc+mY3cR8QqgAyMJW0bzDaJq7zNzoATugN2UVew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273545; c=relaxed/simple;
	bh=r7u/T8ZNDl+uyzR2azorBU8CNtdm7Pa6QjDI1TYLCHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxMoroNlV3JMdwX6eqP9tGBPzLhAZPQvAqCSeHWaiUmHYmsYj947ge5dMpC5x5tBfcHmktnMDoJFSf8M6cMkuortv7m9Ox6fqGo/P4ZWwWgHbtLJuNyC5LjLqt4m7rdFsnf/RdTfvDyLvtJQFPHgU4lmpBvaamznnjZLiOtRXOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlQzTFnZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlQzTFnZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d7200b2e15so51789885ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273540; x=1788878340; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCP5v9cunsDtMZ+MfTVTBSIXh7DdS+GKm7AnmrVBdkY=;
        b=jlQzTFnZya/qB4/QtBk+PM6Is5EjGveLROpLsdjL3an/EeuOWM7DADPFnpcyPrmlyA
         4DE1ZB3+UIdHtJCP2sD1WBeTY6wkwg3i3j+QmPsvMc5kAg8QMskMwW/SCElk5t4j7Pw0
         QrxSFvfWIhVw9RLr1dw2/5gOC53g9wmXU6pQywBrcw+w3tu1EtbIh3LTMqlXripBTQMg
         al5htYBkzUeBPzZA/RHvvwW3HlSPX/Q16yt0rwt1EKg4wYX00JTb9GqCCzx4p1gLSLne
         J3X+2kAHPUMFQRJykhRlJUC35rkrpksUgQa57byGf3LO/VC1GalA4R/tckVjHQanLH6a
         nY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273540; x=1788878340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WCP5v9cunsDtMZ+MfTVTBSIXh7DdS+GKm7AnmrVBdkY=;
        b=LTs6YgO5k5ojMQ3TH0PzDBmcSJYxGj+1taOXYFsQVF91Pllhhx9ciXKvyEXyU1xQIy
         i8RijBxjnYhiAdFZ9VzmVctxhCwZQ5+Uw9yU5hwb7Zg21CqYYqFjIuRyE7vrb1MtluZF
         zisofdpXdV0kY1SQt1xk3ovqzo70uEsFC558R08ofiq012Cfa4aQHB6OEIiLScEbGYC9
         v4cfRbyTOeSxpvTz3Vi6APQ+hyjlV3ZXSd4Nksx4m0aljO/0BNQLi789nGhqmRMdZn47
         yr5BPrWuVs/120DH6Mspu/qTVrLYIBAhlxehoh+LvR+eZ/FOC4K8FBSI2H4gLLlKpDEB
         nQfw==
X-Forwarded-Encrypted: i=1; AKwUvByHPsY0CPlTzvaSz6U2wpzwBHOvg81R3Gujj1wCRdiZZvEUjNq41RHfKlahmteJWvO3r2PCVsx9+EL+RE0=@vger.kernel.org
X-Gm-Message-State: AFuF++kE/o/cXiPyy05ViBmznTkGgkOQxPexmmQrvTPY0I0Xw/K5xUQT
	wP6GRypoQL0miktzlhHi1G1YfAqzf7sHzAAtIERXGMeGZYzvwt3gnyGCnkugv3ns
X-Gm-Gg: AYBFou0xhaPbwAw0yYbYI8I3i1IMHhjuACwvn3WAlnvJdKBNccPG2ksU/AwUV5PnkU7
	acZ880Gxw8IvZxcOo8dEE+Nz/YPhCkE7ruTd7n9Pfa+U0nF2COI8qqTlaWd0VvX8Z0UhZc886Tc
	Y33Rq4Fj+e+siWC5OIaT+fxFUfUz5wwFva6iIe85MonjUpVsBD0STz73CQbcFXFxg2MygZeurDw
	QTUC4Ekweg7O08wM3Hr+GvfGwX4LXgwfe8+HulB7IbetLTywb8kQHiNxyFAJ8GnMpCf5aR9Xz0A
	jei8EMWl2hl1gJGzMEURyE+YCB/RQDiTuIgfFjUU2iwY9B07tt1ojnKQEHmqpBVGr7ZmZuxdVla
	iyJfnHkNunTDkDo+DVdntLZcEERmcXG93G+pxPf2GOLviW1beYsqNcbI/VljCfNNjnDbPnCyFe/
	QhreTpEkbQ4N29PxvickchH84XHsxT4uBW4n5DSkmxPUfzciVgrY7u8hIowiaT4/dxtzoTbK+m/
	CPoe/tJjv1+OXtDCWj/is2c9NWmNb6PVIbIwzt+
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4cc:be65 with SMTP id d9443c01a7336-2d94a905007mr122769805ad.18.1788273540146;
        Tue, 01 Sep 2026 07:39:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b762:f84d:c25e:f7ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm32279537eec.4.2026.09.01.07.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:38:59 -0700 (PDT)
Date: Tue, 1 Sep 2026 07:38:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?SXbDoW4=?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: fix two kernel stack disclosures via ioctl
Message-ID: <apbjbbhmvd68v9oQ@google.com>
References: <20260901130629.24078-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901130629.24078-1-ivanrwcm25@gmail.com>

On Tue, Sep 01, 2026 at 10:06:26AM -0300, Iván Ezequiel Rodriguez wrote:
> Two places in the input layer copy a user supplied, possibly short
> buffer into an uninitialized on-stack structure and then keep the whole
> structure, including the part that was never written. In both cases the
> stale stack bytes can be read back from userspace.
> 
> Patch 1: EVIOCSABS copies min(_IOC_SIZE(cmd), sizeof(struct
> input_absinfo)) bytes into an uninitialized struct and stores the result
> in dev->absinfo[]. EVIOCGABS returns it. Only the resolution field is
> currently cleared for short sizes.
> 
> Patch 2: the compat path of input_ff_effect_from_user() aliases the
> native struct ff_effect with the smaller struct ff_effect_compat and
> copies only the compat sized prefix, leaving the tail untouched.
> input_ff_upload() stores the full structure, which a uinput based force
> feedback daemon can read back via UI_BEGIN_FF_UPLOAD.
> 
> Both are fixed by zeroing the structure before the copy. The patches are
> independent of each other.
> 
> Compile tested on x86_64 with CONFIG_INPUT_EVDEV, CONFIG_INPUT_UINPUT
> and CONFIG_IA32_EMULATION enabled.

Applied the lot, thank you.

-- 
Dmitry
