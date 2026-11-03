Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714385;
	b=Iy2/nkaoGk4SHpXAk6EbVZrVhAo9DThnTD4keAw7ZSTPRxWSBERO4kLLldd0EE1yUzNU
	 09AKqEx3+5q5tRbzN+MsgBDxV/YFZUQekchpxuQisBLselQZhTGwHO0Qe/8+89co7r5+V
	 7PJ4vfJuvsC3cYHLDpAOLQ44WFE1/j2GM4pUBZB+eGLgtIHKE1pVckOosbIMPFEnac7oc
	 OfEzBsdtDpwMrPyREbarsHb9ptQf4hV50MZOjFAZV39VqPqGJCWXojyNpY7wnc7BUHVZl
	 8nvWvPvJIbKrCnTBIFRnapFcYz33sdsxhc6WhKLpFz3O7PbP7iPuqRxcbchYcaA3vQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714385;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
	b=Pf7W9zuWccB5wMr9/PhQdAurbw4zmWcOvE74kePsxjz93soge9yfGtCzXEAZtLiJx2Bf
	 LuNLc6IiulcMuhQjYMBC7LlIQf8px2QIBWT7vK/5PWCrkl0dMBhnr2oat0ltI6hd3ch1t
	 r8As4w24tuDx+AL960FjlI6/rEXETi3OoU20+/hHaQlHrt6pxhDt9XFMwQrl4U9xJ5M0j
	 IHt/OAft0TkXmQW0JCzbQ7eDCBueMyQ573KL+qIOuupkmKebx6H1rrACyO/WoEKtQtLtH
	 kpuQ2OPNXc0K09K1IlGTekjYOTxyZJps6PvcsrkhXQOv7CsJTkLe3kW7NdPqq5q2I7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eeDjGu8i;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5F606D834
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C5F606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eeDjGu8i
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so3042650a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714385; x=1794319185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
        b=jfJnEJgkcBPeDm0bIW44ypI6eMAkhKUY9nK/o+SCvRVgIxDnk/uCOwZNsjsJhleL7h
         OOj/AuCciywUjb23TsbSXKaAENrllk2EqNQpEgd9K5kLkOc/glQqaE2VOUf0bB82lVqp
         t3ElNf6m+hh1X4yuOroL69v4MzPrHkBvYLCJnSGSVdB9EYeHRR3C9PmrefQ2vSWKSGoV
         zlFVmJExbsaFQS2raIe2rPIsN5ROrjDiKAKs9Uo8S/+zj6SlMkjATTtK+vG5FNNs498X
         UkY7Z73x9jlo6kDpnwgbdj5fi0gq6LwG7/ve+cJT37f6JhwaBmzR8+8mkUllrZ/MU6S1
         wQuw==
X-Forwarded-Encrypted: i=1; AKwUvBwx1kkmlYAMmntWErRcL2zoUHX2QaL9fXef90HWKOIjyexvyDwb/aRVGLKEyWq755zbSzOFBsug95VAaOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nFSLf7ZJLAEvYIQeJ6qbVeGR9uaLneZsfQSKVNDhvm4PItavG
	tYsxMxfBiiTpZHhtHAwKgfqbHwDknv7TY7D2SeHlutnHZjiHHZBU2vfvX1OPZEri92EKfuy0fk6
	YyKglqgAUEnJXQbeOgowBoqGxVnlfgJZ4XkwimizqbA4qsFd6E0y4dhTYGLCTnDTwbT8dfm0SI0
	M+NNEWyA0Z7LYBdmo8Ak9T96F7Qs10NkwRbWXcXiPJdvYYn2E6GeJBYGNCt+gpOaFffyq6z6cCc
	bMp+t9eWhqmC89KN+DfjMl36Q==
X-Gm-Gg: AYBFou3LzxHOeIUCPCnodFXJgbgnxLllWszHV9QOBrh94Yd7BOX25iCyOhpluV40tTM
	MFnngBkKNTQcCRLp1YTtOKmkZdVsSTqGPPAp6bLZVUXp+cIrPHKd/JzkCCIhYjROrWC1QwvOoZ/
	ZH9hOfItVNP5SFf3sFZdIObePZjxeOsJ1GdI/2r3mWWCOHi97nBt2MTUZ/Q/88ctrUlz0MMohqy
	i4q86Ozh0mnycvczjedXUeXHRzQI2YAcul/9ggiV0YGaWC6/+3gIGIpmBwTTZGOc+mBRB/daVO2
	iTUgxFA+nuS6xneHRSdkiHPhTv+EXISNlQwd39+ZZP9w5oAJu7BnYTyTbCulJB+0szGibtp6EW8
	s4ScyA08chOIwoPO6v6TiYRY/e348L1S8ctZFYEYBo9Hcc5M+WP6k1F2ulPATqRlqpAQWKUCxPg
	/Nd+p8RsL87V9mDc8Jg/8H5H5RWQLqmyG6sNKPP3Y=
X-Received: by 2002:a17:90b:3c0c:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3ae89721e16mr10411092a91.13.1793714384666;
        Tue, 03 Nov 2026 05:59:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c8297absm1936845a91.4.2026.11.03.05.59.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4029526c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714383; x=1794319183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
        b=eeDjGu8i626ywMWsC59NcSQKW2UIVjT7DC1IeTC1ssUNVkLLiCocmLBJL+KrAZ4Gx9
         9Zix8yQZjzoFgqJy3tG274SoaGz+WZkFKd3iWCDDmLkvjSVrdzKurWiu+laVs7mfZdIj
         0N0PvuMh7tHUxMhouuEw5iixQ3HpowdvAklto=
X-Forwarded-Encrypted: i=1; AKwUvBwmZ2ez0kO0eLrwRHm5A6QmxIttOQd3tElTaY2WnZ1OM8l6ewMpjSTNMoJk+akDxNYLReoxSdtjWEZSd3Q=@vger.kernel.org
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr19489900c88.35.1793714382821;
        Tue, 03 Nov 2026 05:59:42 -0800 (PST)
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr19489867c88.35.1793714382225;
        Tue, 03 Nov 2026 05:59:42 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:40 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 07/13] wifi: brcmfmac: Use event_msgs_ext for event masks
Date: Tue,  3 Nov 2026 14:58:52 +0100
Message-ID: <20261103135856.3676311-9-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-7-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-7-b5cbc2cde2fb@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:42 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware rejects the legacy event_msgs query during preinit but
> supports the structured event_msgs_ext command.
>
> Probe event_msgs_ext during feature detection and initialize the event
> mask after feature flags are set. Use the extended command when
> supported and retain the legacy path otherwise.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  23 ----
>  .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c |  39 +++++++
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++++++++++++++++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  26 +++++
>  7 files changed, 199 insertions(+), 27 deletions(-)
