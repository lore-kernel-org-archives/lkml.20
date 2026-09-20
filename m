Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3123CC7EA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876931; cv=none; b=TGlGCrIlpvLuDjArR9hjswz/rZehgb6LvVIuW930r/HRYzLWYTuoiqZYN6broaR+IssJufoNSDp2sbh4aNGdGCT5QSctK5dffFZPLmej2eFEAdhmwSLAHjFNnN4NE8nBSHXN1hRg1+WZZM4VdVG2B9eaJFUcNNoKCcAHmxwvDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876931; c=relaxed/simple;
	bh=ja62orH3qdNuVp1tYwk+qTD0ossolEOh5lI5xEbsuoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TInpxqND+IR0mpxSi64QaNZvzWc+EqCyECjFIrPvnVoEY3Ql7PErZGssO97iwmeBRaUjo7aWOhhkWmvvHGaSFJhCf/uPo36Ui0YYb1q+9Zt1bZuxXAKNzoA7jTqJ24PENUlO616Ao8igWM2L4BdDFPguQhtnLUbABMvieRnJkG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zrk+SCGg; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zrk+SCGg"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a147688bso2056267a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789876929; x=1790481729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5QJaKEYYa0kSl1fGgyUvaM13oMrnXDQtarpxehh6V0=;
        b=Zrk+SCGgCGFgcMzbjqY6qnVzwygZRCi10K/rH+xgqiRWb5lxmvdsL8ku5dZkkd8zsx
         DQcMUoS2pXmhToQeWXrzlnBnnlS1i/d2bb53cZEZ4iQoaXTl75YdE/7sSq/XN2VMxh46
         9S+Yz7g4SNeXbMbZ5MpEb0fSZH9v6Ebi+R4NHCCcawbFFKgxXr7FEy+Fu8RqfcZ5BuM/
         X3bxRv5NsfpslIwrcGpOUXpolXSz38CyShy2lI7+hVVFCPfxbhybh6ALM0+0iM2pGYKG
         Q7DYS42bFDWnUtcoQapJd/b5lbWigtWB2jpJXpy4FWaoOlRKZ7yS8aYUMNFQEW/qCKQh
         PWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789876929; x=1790481729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5QJaKEYYa0kSl1fGgyUvaM13oMrnXDQtarpxehh6V0=;
        b=QtRAUAmPIT5J6YRmtdb5LsrXpoLLRPZJ4e1rcGLZQUMseH5SOAaEtFzNsOxPB0cFFG
         w9EQBdDK/Tq3lb82XZkISwSOPwJe4cp6mIgFNp4ne2Dlm6m9G8GpjLJKn2rooUIkWhP4
         HXGj9FgKDHIbQ/XThUWy1j54JzEp32RDnSDN32DWQUYUq7kvu/13KL3MH0JiUuDV5C+G
         yFei20n1CWvniSeTyqWhWfUTNWJYc4XC1F8Zj4Xx5MyaodidfcnG/mpx9VHPfDuNqayr
         mEsxXyvXeGWVqF0KNxR+Gbyq1ATTrEE/AgaYpU+quAMxsKqvFCi6ocklRwyG6RFs+8/1
         Cdtw==
X-Forwarded-Encrypted: i=1; AKwUvBwZrNkxpsSXzVYsc4C60qzvyShB4hEgmRxUgtQd3+p9As2nqsWszOGb5Z9IjjHpU9ZfK3tPWGWA/sBitDk=@vger.kernel.org
X-Gm-Message-State: AFuF++lWYpP8Ov1uWIqB5TxYcXBmduUMVv2M/L9QXudpuXtBu2a0iEen
	d9chPpTkKds8BRjJzzwJGnfQFbiscrRscf9bH4W2oaVJZyB3oNUgXv5lOFDjqBPZ
X-Gm-Gg: AYBFou1GnuZl+IWtOCRyZ4lC/0VtZ84OZl1HvJd0S/ppWsolMtqHDNdHncN+92qX39W
	6xtdMEyM1KtZ/QqTl3L585GPYtnCcakhtmm1uABOAo+Wgiprh1NtqVUjvg378Bf4D4dlRU/J8Oc
	6mw7RAbNWNCq+DVSuywBrExGnD3y9oCLRYXNcZz7XhRt2NHDixBpslI2pMsXP2YPvToINZWL7Yl
	toqJPOYyQmI2Z20/B9Vd/zNL5yuSd0jkmZzvwbBxfHeH0eagMqX8BYa/9tceikk8OwpBrGJ32mW
	JdKQk/zDWPujLTbefMESIldz4zn/pNtzTR4UbJhMC5Actg3WJqEab5XMuYZ96NmW01Ki3OElQoU
	rA0EaqDVK9VaLh6RZH8BWoXvBlOwy5GppT55VnoDXDlspfJqSOgTu13zvtlQG2XH27WVs4kXI7X
	LrzxcGCGNfrADT712MuKklPKibkaQ36zCbmj3+0PlwWN9kdJuDwE88GvGRIUH3yN7opB/rL0N/0
	gd5V72UXpHM7fOgzRs/8RtZ+C9nRuFlz5oOmodc
X-Received: by 2002:a17:90b:2882:b0:39e:4c81:6c95 with SMTP id 98e67ed59e1d1-39e54f3d98fmr11714645a91.27.1789876929055;
        Sat, 19 Sep 2026 21:02:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7836:19f2:c781:88b2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318c49dsm9418565eec.22.2026.09.19.21.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:02:08 -0700 (PDT)
Date: Sat, 19 Sep 2026 21:02:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: jayakumar.lkml@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: wacom_w8001 - validate index before storing data
 byte
Message-ID: <aq9aQzLGtt0MNWjJ@google.com>
References: <20260919192152.271808-2-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919192152.271808-2-meatuni001@gmail.com>

Hi Muhammad,

On Sun, Sep 20, 2026 at 12:21:53AM +0500, Muhammad Bilal wrote:
> w8001_interrupt() stores every incoming byte at w8001->data[w8001->idx]
> before the following switch on w8001->idx++ has a chance to detect an
> invalid packet and reset idx. The switch only resets idx for the
> specific packet lengths it recognizes; once idx has advanced past all
> of those (W8001_PKTLEN_TOUCH2FG - 1 at most), any further byte falls
> into default, where idx is only reset for pen-only devices without a
> touch_dev (the ThinkPad X60 workaround). A touch-capable device fed a
> malformed or overlong packet therefore has nothing to stop idx from
> growing without bound, and w8001->data[w8001->idx] = data runs past
> the end of the W8001_MAX_LENGTH-sized array.

This analysis does not match the code.

w8001->idx starts at 0 and is incremented by 1 on each invocation via
switch (w8001->idx++). To advance past W8001_PKTLEN_TOUCH2FG - 1 (12),
w8001->idx would first have to pass through 12, which matches:

	/* 2 finger touch packet */
	case W8001_PKTLEN_TOUCH2FG - 1:
		w8001->idx = 0;
		parse_multi_touch(w8001);
		break;

Unlike the shorter packet length cases, this case has no conditional
break and unconditionally resets w8001->idx to 0. Since W8001_MAX_LENGTH
is 13 (matching W8001_PKTLEN_TOUCH2FG), w8001->idx is always in the
[0, 12] range when entering w8001_interrupt().

As a result, w8001->idx >= W8001_MAX_LENGTH is unreachable and the array
store cannot go out of bounds.

Thanks.

-- 
Dmitry
