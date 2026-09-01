Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF8C37F007
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253333; cv=none; b=Uea5zTsoAdMlJJCgT427TJBG9hyRvb2qPFvR6thUUivA9nTMrdPqBlcwdY0E7GnidUrEDBBgUk/t7dGvi4Tk6a885YhHyOQqbseLOcQqGcxZJfXdMO/ZQwlOKyNluMX5bxR2mD7oyQ+Zf8PSWboRxisBwtTwze2UAZTwtDFWNis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253333; c=relaxed/simple;
	bh=BXlJbCEi6gghch6dYwny4m8jmf01Ie7bCbCfesUB+0w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0tkseH7J9TTRlqFSMop0CKGwr0xtFpeIUK+43l8m09NmA/rFd3rbiWWRfrSsC4TTQ/6lFLGA1hb6Hr3k4TKphG3Il422wiWzFjBrx1rGN4C6oOwVnacHTfhfSVdZFABBGYEKUBc4WQYUCGw7f6Q+7nezuRzIQIP6PX/AXwiSos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmoeU9y0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmoeU9y0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58441F000E9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788253331;
	bh=BXlJbCEi6gghch6dYwny4m8jmf01Ie7bCbCfesUB+0w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OmoeU9y08Rew/WJVX+cE/6GRW0CAUyUe+zwXOEPOaLlbU98K/Zw+PFL9i4MPtLeSt
	 P6zDV/E4j7cRg5HiPpibeWFETS+bPY4vUNn4bnbOW50OvfsVBUrz5jpQAJUllNRcZu
	 qQuZwOF3j4bJnM3blnq+qoUABLqlfL+SZikpTGkrrvGqp7fSUabQByLvrip9be36kC
	 zhRh9QjulU9d/C0Mh7FsyJwvtmixrhhzIxpX+YZEhFVwDujOsrLW2K5A7tq/iwRgR+
	 6fYA04sI1dubD9UaqeuCQPXMPzxq7MHZgP9UR+ybeHtrp6DN8KPS8ciwUdB9ywHUR2
	 HrdgsCNW39iCQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so4868726e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwo4VfMNFx786sRQw9gYEYX5TiA9gYS+VPTQq2URGrCdLtQeju93F4EV7SskqZ6XIJJNMxomeNy55s6ESw=@vger.kernel.org
X-Gm-Message-State: AFuF++nltRkj1IKHphTY6xC9E2nSh/BHFS8t2wZir8DtISBgekRaN1bM
	Ina6S1ByI2W1hPxz/BrbZ8gu2SQ5Was5SCVCiGLa6HNqdCsJCetlXNMHATIQ1DcoP0JwJwHCeAF
	vSwBNjF2k2qZxpenVC6dsVK6yoxxs8kwG29eOcrtC8A==
X-Received: by 2002:a05:6512:2347:b0:5b5:e265:5215 with SMTP id
 2adb3069b0e04-5b60420477dmr415842e87.22.1788253330516; Tue, 01 Sep 2026
 02:02:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 02:02:09 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 02:02:09 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260807175041.3299349-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807175041.3299349-1-julianbraha@gmail.com>
Date: Tue, 1 Sep 2026 02:02:09 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdi-q_P9fpQukVPRXREPAO2VFHOwS7EoY5D050X-2ckfg@mail.gmail.com>
X-Gm-Features: AcwNN1VWtBOTEG04afhQpw7eoJFOOGhkAMer2IfyIEsN0kXsao7L-VQZEx0Wr3U
Message-ID: <CAMRc=Mdi-q_P9fpQukVPRXREPAO2VFHOwS7EoY5D050X-2ckfg@mail.gmail.com>
Subject: Re: [PATCH v3] tee: remove TZMEM_MODE_GENERIC
To: Julian Braha <julianbraha@gmail.com>
Cc: sumit.garg@kernel.org, arnd@arndb.de, geert+renesas@glider.be, 
	amirreza.zarrabi@oss.qualcomm.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, quic_eberman@quicinc.com, andersson@kernel.org, 
	brgl@kernel.org, harshal.dev@oss.qualcomm.com, nathan@kernel.org, 
	nsc@kernel.org, jani.nikula@linux.intel.com, kees@kernel.org, 
	amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Aug 2026 19:50:41 +0200, Julian Braha <julianbraha@gmail.com> said:
> 'select' does not work on config options in a 'choice', so currently it is
> possible to enable QCOMTEE without QCOM_TZMEM_MODE_SHMBRIDGE, even though
> this is needed at runtime.
>
> There are no users of the generic allocator option,
> QCOM_TZMEM_MODE_GENERIC, so let's remove it. Then, we can remove the
> containing choice..endchoice, which allows the 'select' to work as
> intended.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
