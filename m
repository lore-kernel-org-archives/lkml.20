Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB194052C4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436423; cv=none; b=fkBG7PNoQgJJw+1/NvtqRAh+cSrMnADSlRsya6mVhLoJajJj68GCJCawWPNVImRn0vsQ4Xmt5vXnAMGFxx1ertu7DF2Qi7Q49ehz4EcDAgAN19kHETF0gNbKlH+ZkolpIdOCxH6B02sPvMLI+TXB6rwmqkZ4Hc/1SF5yFUY0YPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436423; c=relaxed/simple;
	bh=SzmAPhJSqzo5ihS4UY8Iect4WUU/nMW98tnv+6ln0n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijQwwWsJXZDSqTaD/eytC+z5wQQNtICuZ0UMhPQhmC8mi67Y/7R6MzTlPiP9i+GqkwdM6UaR9bcZQEzEvGZ2AMJkMpKyynJLFnGnUAaMUKBo6kNqh3gA7k//+eoA+F1fsRv+mV+dKmocBJiVUuqgcJhdRiRoi8oZsR+7FLwjsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYGixN6T; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYGixN6T"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so1733305e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790436420; x=1791041220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r93vo6YJEV/n1FD4tzzKSMKvC9BRqIXeipynuzwoWIM=;
        b=BYGixN6TTN3UMH549hokrHRQpoSYjXVP3AGYWJdu+pQHDNv954DFVfkOPC4Z0EhmUK
         5eBPS13/e+runp9s0V8m/5vdYmBiSVhpZi3E2cSnZAHealF3uLKvBu17qK4nLT0EMPLX
         EWQ7wCeq+tGNETu6vQIwqqVVr30EodAKF3EUnX/S2kW7k8sa5+gC2CcDsX5NLi6XKOFU
         Cw4w0w97qqdqX02slJvIcqtufKW7FXh7SF5acuns/otxoiVXKAW0S82UO+3aL6gHQKil
         zOM8xBSYbMOti5fF7sJydss0XH0ghLJvPAOpK1n1vQmRuNT856eavEQ8mGwVGLKA7d8q
         nn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436420; x=1791041220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r93vo6YJEV/n1FD4tzzKSMKvC9BRqIXeipynuzwoWIM=;
        b=1rihfbwiLFMTACxyX88TQIfx7QCquaRy7+eqw3ec5BmH1lee4llSfJdmOoA8ay+OLW
         z7wHF1XtQ8L90uq9Z9lCfEfaU5QYys0wOFGZsR6j6pde7Dbtjir//qnUm80ZtxQFLwj2
         /bSrErK4xJNNtgoCUtYdYHDQX2MwN5navExH39TvDIaanSyclBmXmJyNfbeUph5i7OId
         /slN5q8veITgA2zZSSQbsYoZCA7Dh/q1wIiJdnvHiYtstmKkRylsOelIo5d0ETUKAw21
         vZhDQ9zMRdhPLVhdCxmgQfBfwpyBazwg/9ObEVIgar096pIokxB6yyw3zpEP4ioqSx0w
         tQFw==
X-Forwarded-Encrypted: i=1; AKwUvBxj+Af5poydt829aLMtiFlJjsetgE4ksULzHs3WgeVqCwpTNrSMgdbybbmnlSP+/WxQcIGOmsUP7p9dRr8=@vger.kernel.org
X-Gm-Message-State: AFuF++kPz6mELhzTgaV2wDM0Qel7WewfjZJ379D3gnbAgPPFMDFjxdAX
	pAf2H5g0sGmdsyj73Qbsd5XRy/ATa5N1/FIb7Sb8FzsSPfUmfAjLivDt
X-Gm-Gg: AYBFou1x92nnor51Ypk77z79OSocAiaLGAq9dLBqItFdY8tyXPdMF6yQKYaU5CDsBfF
	HTsuoi5EU55nySgwfWrnvapZX742jntWYjwQ9tUdkLV2UpDn4v2zTVGEiMh4eHHE0+HadHNycZc
	zckp7HMyEpLiSlhZ0l9r6e3cJopD7jVcYbWHAo1ZVMTQrLCbwIZB/Lq3DuKx27/zWcJCmXamdEu
	Yj+7u7h9KdN6NlK1cRGywnsart8WYKRZ5P+/9E3xH2hIZa867DQnXKkgOJLlRik5TT7JEc70NAj
	F845WryCGjLTqbW5eKfDexAJTnZkJGVdZ8NYK+lVPk7PmQtVrszD/Amxnv7KRXYNEFkg5a6XYR3
	EgLoEKyfPUEcKmspd2vApetCxVcok1zUOSYY/wZmIoEM43oz45HCaqpfHf9XnU7G0iJnkj0+8+b
	px03QQITQfBo5wcTbc831mil7AA8h5tFA+wD1befNqMgHSp8JGCPXXxpaO+ZkRi00gGxQIZXlEU
	+5Uz4SyILvA8q89PJPelvFLJbU+vNqGI3pLDitoOK51dZOM6qrW38uSFhx200bJXmADVUpMo8rH
	cySsAW9Ift+idmg75Gm/8isYij1j6fIiarqrM8hqu6SsyIEv4AhRBjiipYNT6b4eXXiOo2dzuNg
	=
X-Received: by 2002:a05:600c:8b31:b0:49f:fd66:5fec with SMTP id 5b1f17b1804b1-49ffd66616bmr28453225e9.0.1790436419906;
        Sat, 26 Sep 2026 08:26:59 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fe71csm94423665e9.2.2026.09.26.08.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:26:59 -0700 (PDT)
Date: Sat, 26 Sep 2026 17:26:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Pierre Gondois <pierre.gondois@arm.com>, Radu Rendec <rrendec@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: allocate the cacheinfo early to fix the
 PREEMPT_RT boot warning
Message-ID: <arfjs5kQjQRb_Ep2@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
 <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>

On Mon, Sep 21, 2026 at 12:11:47AM +0100, Linus Walleij wrote:
> > The series applies unchanged to 7.2.6-rc1 and v6.18.
> 
> OK please rebase on v7.3-rc1 because that's what we're working
> on now.
> 
> After posting that I think you can put this into Russell's
> patch tracker.
> https://www.arm.linux.org.uk/developer/patches/

Hi Linus,

Thanks for the guidance. I rebased the series on v7.3-rc1 and
posted that as v2 [1].

And now all four patches are in Russell's tracker:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9520/1
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9521/1
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9522/1
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9523/1

[1] https://lore.kernel.org/r/20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com/

Karl
