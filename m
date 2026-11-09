Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206749;
	b=fDDCVlzemoxjOBVsOpmBDlopTOqp6/02qHKBAphJXw5njR9DdwmL7NZLrFnMz645gVIy
	 XFRpJ0r3oe7Y9aFSHWvL2o2oHgHjukVTluK81kZsDqvCSC4DUJhkTkvNQVSxpNHimcdns
	 VQzk12w3xVj3xcgXhQgv0ULQAwN+9g6qZ6GdsJ4T8VNgrYtVSTj3u9wmVDUkGTX/z+Fd2
	 ORdofUZbPR7Yx3lBpkHI1IVfG/8ziV2fAgkGpWN9i0KyIQuwkM1jP+cyIiALGNDtSYFSl
	 gQaZ3mn0V8KKxQm3SQS0uv6610idKgKROt8F0Ygde7M+lojU9/U4DULSePdzyt9LqbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
	b=MN1UXRz20pJy1fklr81q/cTFhcHvv4Aqg/JkiDP0b58irhskNUJjRU24S5e6f1leZiLb
	 M6xFq2oTF4U2ffTZMhhKRjrauPmeDO9XUyex6j7W2LRHNOVf5sfLm2x9yJ04VDDXZo6TN
	 Vj7wbKrEq4/jDXQBSeu2DCjfabbcN2j3g9kVZ1xYcdzfzgHLQDSttYfvpN6VW5XqzsWgv
	 RYJLOF0dFyLqqe7qBCjpLnWEUJiV+tHsLbAKedOKlOczrk4rpB6jYtWqT1WCzi7nN9oyY
	 TZ6xfINn17THDv8uy/+5fAfQuywAvOiD8VaSWoGRYDYNmDvOJ48Pw7a01nNwEJvCzAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVTyJbIB;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28C8606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28C8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVTyJbIB
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49134c8509fso402890f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794206747; x=1794811547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
        b=wVTyJbIBW8123YwTpvcYXtYZ2PFI3g3DMU5rLfnSrNe+HxYzRz+SKdSW1fiimbF32t
         plqF1bSOfaXVme8V1AdPppWM+sVNPic0XqMKTs56dWyGdMo5PKa3aL+ZrCFlb7D+oDrj
         FveVWWGHm4ABApszy5NPmEOT884aXB0s+eO4jfRhIzJX3TmkM/4M03qCEyCn24Lmrxe+
         pZLVVhvkm2K3a2fY9Bs82fe0wRe+j0WAYw+trXLNoCQQuuNQTCm1RADlxpY++6iqlRAo
         UOkbabAvXrf7/D9DnEE6s70XcI7pgicycuil9GZe8fhZ0+NP1FCH6XPvvYRI9pPyXA85
         tgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794206747; x=1794811547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
        b=aBsoSgDcbIy+CM+XBv8CrqfuXPVwsJ3/94f6IwZkg5bel9/HsAnqt04XXhE2QOEdiP
         i5EwEtn64Vc+0DZ8sOp0TR9ORFQ2J7ML9I0bNuW1VV7siZ2turbfY3Dk8VipCUMSK6Ou
         BGWFSOI1NC4jA5nJDuIvRh4GZbTcHuqXpmZatWrn+4LPVSuYvn0KUx4a8YBoADYAmvgY
         AFXKTS0xnVu/CwEdGnxEyTjkerGdY8at3TZxAqY+JRFcADzZf2Org8gsK7n1XSE4QRIZ
         HTl5wVcI4I+nG9ODSA7bfILHULH6pjl5nVAGHXKjoib352sEfnEQ5+icRmZ0vyBSpr73
         n2LQ==
X-Forwarded-Encrypted: i=1; AL+hErEzQbJpCVGQD6tmLIhlpXDhGp+TJNMA4w6V79zkimG7b0hDCq4jSrRsthMVg2FFsoNLaWrtnuSAbF9En5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z96fQtd2Jq0Zh50QaKSaHu+sS/P66kIwkWVriCrH8S47IQg8iWj
	S/QItlKSrs43F0QeHpggt1rG14WWq5yMlmrqgAOFUQOdFgwynZh5lZcJrEMQFrzwwKAuuJj8
X-Gm-Gg: AYBFou2WEn6TnCgfPgghJ2JGojlYs4sOUqj5AayI71HIuQ3VGNtJiuGpe+gagLKH0HR
	dAwVGjQCagPQ3je8kQc339IvcG/rVMZnPd7vOehy2BPLBQuBcBEoj34wRcYtRIblFhEKgc0fwDd
	IjNVZftgGmxCH04ATn4ztusiFR9iTKZV/iPiSCXoVCTHPeamqnOVbd45vQAZDlXYpnV7ApAspiN
	2X3msbEG9oHOm/6McRwB3WLizePtl7KvOxAsYoGbrX3FCDb9CwVMk/CDlS+lcWYhXwBbRczasd7
	5e8U71UcvOCx49RSG3N+PHC5noCBaxKGr3C9gN8eyu1mHjkt/B6V7THUaJdfr7pqOW45+uxKFa9
	Bq+cvMmTE+wdVaIq/YK7T4A6Ltq3WPHicN/H+Fq2nw1zdwwkiuyCJzvt359Yn+FSSvD/j0E97Jo
	oU1zt6gp0ordEjI7DwctTBLD7N9CyMzty4pkJT+NScVUsZEzny2BuF7R/O5v3pne8VnRcmfIqvq
	zp4fUCG20Drn3QSvFRw+TpoT7B+cZ3snYYrb53xM292bz1rDnjtfMWZBVBYgDcWDOVuloSZzdlK
	Lxho0u46S6+JLsFobAQdWb978Ik8Jzwm9ilCN+na0du6maacHDS0EPOSLtIEnhKFZUNhsjeIF0V
	GsFDdy6dDEpHgVgM2QihT2W0JmXx1vxfwPjnLqCZglb1UPaot8Q0Upx3SUr2Tf5EeEVlBN+6Sfr
	T0BF6BJFINp74=
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5438445f8f.49.1794206747118;
        Sun, 08 Nov 2026 22:45:47 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186eb9sm7827905f8f.35.2026.11.08.22.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:45:46 -0800 (PST)
Date: Mon, 9 Nov 2026 09:45:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout
 comment
Message-ID: <avFsFu5YzloDMbNb@stanley.mountain>
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
 <20261109061223.17144-1-lamemorupisi12@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109061223.17144-1-lamemorupisi12@gmail.com>

On Mon, Nov 09, 2026 at 06:12:23AM +0000, Lame Morupisi wrote:
> Clarify the description of the MIPI frame memory layout by
> explaining the meaning of optional fields and payload words.
> 
> Leave the frame layout diagram unchanged to preserve its
> existing representation.
> 
> Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
> ---

Why are you sending a v2?

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

The lines are not aligned now.

regards,
dan carpenter


