Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637919;
	b=YawWVUlY5SN5NwydBGQttRQP9pTxFYOU/Gejnmno5uSz/6pdVS5y7BSx109h+X7mlhaG
	 yxC8KyABEBQ4dcjFs6JhIEeBmvbdwzIOQ8kQX3M30y1Zj/BDRStZ0AJjM+0KyDsQW1MOf
	 WHHPW2ccPm7A1sdHbL3VaZ/tAWMGrymiPpGYK3gvRB6TNX68cuXum9Ku+BcS+2VX/CBdA
	 QmiORG9TM0JRrh5QutEqdQFpjUDK0idfdFGFiQQIY/swEXF7yGz6FfHF0bGufjmZLT6hi
	 RiVuscLd0M3CzNeJqtDCVo0a6vcSem87Ya8FnE96WWtd79TKUcamA+HIDfAggtl7ltQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XdVsUglm3xnm6Ps5OdJgbVUyAyNc27jKuQPYlZNCoDo=;
	b=4xWKa1zDll+LrmCeAVsaVlsUpX73KOXZAVVPb+NAaYmJ9DLywwDTEFb1EtduYFHWjRTo
	 w/TV1ztJGXgEOFjbrgEPg9odiZExMcWkx1LoiG/LwBdqjhqKPf3tnEUPpDDZtuaXpLdOn
	 7U/xVfIFlZZkBBXzVITcqqPccwuO/oI8QwQFTsJihtRtXCReT2Fw83S3Xxf/Hxvho6ovs
	 i7hjsRhup973ID68ft0mYbzAzKeDQ9Dy6+VbCo1vsvdMofAGav3/mz9Zcs6ev1fa3LwAv
	 L6I44AXFwGkoPa3TwEqsB6PBKifbb9pTkUoOyuNcEcEH4YcVqifrqi6h/NdqDUq3Yyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLSaVgKX;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ABC606CEC7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0ABC606CEC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLSaVgKX
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-676858d42f8so2817685d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793637918; x=1794242718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XdVsUglm3xnm6Ps5OdJgbVUyAyNc27jKuQPYlZNCoDo=;
        b=sLSaVgKXsq13bH8zzBjC5apiSlcdoYLWH8f23SfQCthTYTWMy3x65AoA5aB4jfXnyz
         CNmmVR7ms+KH2SFAWiVLg/23J+ZDsgBDyW9cKwqNGpdx1JZN8vbxfl2pcFQR8KspKuv5
         tLM8NmFByC9IRnUiN9yx+Ib5CmMFmyR8uA0qN16wYAfeXi77oMEA9tsqHqJSo5xl0RSd
         IuOBB18w/ra4MzlKxaTx32r0EKRTx6K/MT/7G3yEHRDgrwr3UAjuaRstjibdpbNy7Qo5
         K4QFikn7GUFqXUNtH21uedRMNTxxRFu5/01z8StYXQltrUPfYW6Qn9ANrtF1sJ9iwVmW
         LAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637918; x=1794242718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdVsUglm3xnm6Ps5OdJgbVUyAyNc27jKuQPYlZNCoDo=;
        b=MVZWxfN6WlETM3CXEs8Za+9Y29keFfWBEJB40oGW/zuUS/US2dW3zgpGnmvFnWyGfp
         VkmeRPzgWq6wv+UEy/0dkCCregwJLtzhLpBr3ZQKE3NROB+YZMgDy84qwPqH2TBIaA03
         i4bc3db/KXpAyzu+rkPK6jMCBM1D6d0nGZ0+/Y3yDM5nbFfu0GSE+Y5+L3HmDd11aFLh
         LMS6+bQUzaOHlt455tPxVMH9QhMA3lyPwHHPzYXh2KaQmvEDeyeWgAbJjxphDiDMYxIy
         TPTJ56d4KEegMh7gjrbYfT3ngHytAZFR3kHbNoonmH48B90mde0jqSvrznvc83CujL68
         We8g==
X-Forwarded-Encrypted: i=1; AKwUvByZA9LXOry/Ya7leZ3sngUm1gEvSaXE2/2E4DFhf8qcDkV/z95wpJgEWNKnPPgyOqHZVnMCD7Udv22Eeo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nNo6DZc9HEmuqlZu2yI0lN16HW1AsT1d9Hbnrj9s9dqJWAeCR
	ssNV0deRfwhEUciUoElY6N/hg41bdix2kd+ecXaZdgeDby5ahza4KY0mp+fjHg==
X-Gm-Gg: AYBFou3002LAhnOyjwofmjpf/Ndj1QT2ZRKfLZKIlrELFXNjEISHhdaZ4+L+Rkm/uf/
	aQ4F/1QegR/HtE9H26zur/F9yL+2ChnZXBC6TZnjTBGHOD0mYKUckUtQjmSLe0vdvU6NHmHs2vv
	8/3UuvZg5mPAAwcLFFRgVR+twFJ8iIOvrwWFBsMes8Jp26Xxma0YFz4L+rB2DffDWTsDeqLe//1
	a0XtIGGlLPZsduyiJNZIySbDaAEK7fEcWhzJwaNhfdF33f4cYvaRcJpuHNN0MCmX9Xci1czWU6J
	/tH3wVDOaYEw8Rn9EY2AubnymD1S7AyLaoRd6ztmjz9mtfsocboaMcfEcG6dctcqH71AR8kNl2K
	6wutF/8+8uSb3wtHIj0oAmbO+Fgwgh4CjlDFwOjgIc27il31mtCkwsUKQEAb/tHJQ7D5MTSaXNa
	OP2vaO5821oTgsataJ7UQFmKJaoRCNw8OI1NwLfGpMzA6UwEa0OGrw2pRsCtD03QLqDyhVlvoQN
	zhdLnfKvl3erNULfsK+/gjCNrtnkmTBSQ+jvrSabE27qOuVYZPwiVRZKW/UmG/+lTrLEe1QHCOT
	SRyuA61fvXsfRkutlclkj3KoRVixhZblxJ7D4Yp5LLDe+NIbWjEH4LzaIw==
X-Received: by 2002:a05:690e:4547:10b0:677:ae43:8182 with SMTP id 956f58d0204a3-67ba4eeabc6mr3625211d50.37.1793637917731;
        Mon, 02 Nov 2026 08:45:17 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.200])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf270946sm5286049d50.8.2026.11.02.08.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:45:16 -0800 (PST)
Date: Mon, 2 Nov 2026 11:45:12 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Add newlines to sysfs output
Message-ID: <aui-GOB6USw2ziOt@daniel-HP-Stream-Laptop-14>
References: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>
 <2026102808-stunning-headgear-4355@gregkh>
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
In-Reply-To: <2026102808-stunning-headgear-4355@gregkh>

On Wed, Oct 28, 2026 at 05:19:45AM +0100, Greg KH wrote:
> On Tue, Oct 27, 2026 at 06:31:40PM -0400, Daniel West wrote:
> > >From 6376e59cb4d0fa2d57ff7f4fb2ce6cdb8bb1d03a Mon Sep 17 00:00:00 2001
> > From: Daniel West <daniel.west.dev@gmail.com>
> > Date: Tue, 27 Oct 2026 15:53:19 -0400
> > Subject: [PATCH] staging: greybus: Add newlines to sysfs output
> 
> This shouldn't be here in the body of the email, right?
> 
> > 
> > Add terminating newlines to the sysfs_emit attributes in the Greybus audio manager per warnings from checkpatch.
> 
> Didn't checkpatch warn you about too long of lines here?
> 
> > 
> > WARNING: return sysfs_emit(...) formats should include a terminating newline
> 
> Please read the archives for why this warning is ok to ignore here.
> 
> thanks,
> 
> greg k-h

Thank you very much for the contructive feedback. I have reviewed
the archives and it makes sense. I will drop the patch.

Thanks again,
Daniel W
