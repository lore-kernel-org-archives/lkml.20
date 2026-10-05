Received: from mail-oi1-f225.google.com (mail-oi1-f225.google.com [209.85.167.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2339C4C33D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217927; cv=none; b=TCZpQKVlPMhc5EKuwGW75PfDnN7arR4G903sDjymmmILAAGgv7mVL5XI7qmfBypS1QCrPWkVtB1m6UhjDTtLcTOA3Ng2ogDv679Qm/x+955Udw6JF/PE7tJRqDoI4YiDnbDsJuK2oeKz4V2vysMSf9XRbwcewAgK5J+9IT0B9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217927; c=relaxed/simple;
	bh=t1p8IXQWCe6JXrYhb1ZRToxX1eE/YXZFtPZX/xQ9J6g=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=inAVvYX2U/+MS6SvtxKTQjdIv/8Slj4XU3w0QlRfnP8xtXReWwbBS86msIZ0k/y7Zn7NnxmtwMDMWG1rIdw9fVnJT4Oxu3JFaLiq2ds0D0Rec/ICPIV9c2+GUdxgSdAmV7ylWJkTTxfAWHBn9R1k2iU4PnR0400jQD6VDchs8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eOYhOrQU; arc=none smtp.client-ip=209.85.167.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eOYhOrQU"
Received: by mail-oi1-f225.google.com with SMTP id 5614622812f47-4af81963f35so27782b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791217925; x=1791822725;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajrYDjtgXCfiLi8lpPhx25OD/gxlpMH/zqd4lkGdZpI=;
        b=tlhPaqB+NkbISK58ffT32aHXJNrA7xWsolv7/FFAgr4tZgD6+b0uzrf7Vg1NDoTvYb
         /PvwHzdC3eg4ex8PW0AoxZgGxH87OtrKA/e+6cOWRCU7atnWjqJsUGnXfOHdGbV3O5J/
         1l6LrxSAVLEaWrOfiL94bu0efds8JDuWlGNpSTFyiSDM6oJ6dW83I9OekFvS3ruAdl2p
         BkX0XrRzQag80zfcv1bXsS55z0vz1TM2wE4fNnofH5BsC6ivJtUC42jtQekdu8bGuvpW
         ey4RbJp7EE++R7eIVk5qT1432juGjkEwCAFvhSWvnGu+uBY+FSe+bbragSudhqWCXOJ4
         Zr0w==
X-Forwarded-Encrypted: i=1; AKwUvByEtXta+acrkRzXFR7HROhysdcaQmrl5DGAlTzsG2e0OsrcQ2hcU/cPsSKZTnf4orz4OfOtE4h1I9UUWuo=@vger.kernel.org
X-Gm-Message-State: AFuF++mkz5BBGD612qwmPUhzoEEXlijSAQ+COoEAeC+KGRV6BAX7hWbc
	NECi8l9mGOFFlHrO5B4hkmk+bN7j8KNd2jd08fzpJK0ekH26yjzWCQE/rrjYMTm4GguvQohNGiE
	aB84H8jtcRAFAwlwt5dXQxy0mDiU7KR/EqG0nFQgWSlJtEAc4OriK2P7DPz1opeaJmpxn7Y/vTp
	VmLaWE0L1+Gj0NsccUOhU8w6G1pjC7alFy4syhFhHf0rgQ6KXfU8LAth/LMLBfPg63hF4oTc46K
	B4Vrefry9Tsk7WzcUoqS0zjbg==
X-Gm-Gg: AYBFou3dYGIXSj+iKhkyeEOufakS+05AonRtM+VEb+5wEyTc6Fc8KNs83u6MJBZDzag
	kOPtRY8YT6PLTYmld0Fej3/OPzyRGvekcBytKsbm48Rn3QkeZ/73u/q0ov2hq9o79+KojTqIYJt
	Gzv7R/Wbm7WljEzZFb0sQX4/hmPUbZCXIfeSbX5pP0+feK3O6QRLfK+2FkrkwgwT98yFFnzTD9v
	q24F5hRvdYCG1yHO4OHlTC/6TmhU/dpjZlQLfYwZ+JWdO4jPhgC68uQTQ5/TOz59ueHhZbX88Cr
	iVuidealnnDCvpVwiZ/eqL17cYUs2dr6nVpldOKH22oh4svHEqDGce11fYDhJBOCxvuJNx1+n/r
	HOJQDGcaGdBkNEOaJAKwk6k2RBtaKnZgzmiI4dBBxAbK760smLNx1lQW3ypLwkjhMNdih0IPdvJ
	Lqo0FXQNIz/OBGeLXZcQuJdbckwMC53Jw2CkaYmQieGw==
X-Received: by 2002:a05:6808:ece:b0:4e8:92e5:db3b with SMTP id 5614622812f47-4f52a571effmr11048155b6e.35.1791217924750;
        Mon, 05 Oct 2026 09:32:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-49e16ebb15dsm1288949fac.8.2026.10.05.09.32.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:32:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2e2a9fa1fcso253174166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791217922; x=1791822722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajrYDjtgXCfiLi8lpPhx25OD/gxlpMH/zqd4lkGdZpI=;
        b=eOYhOrQUzuJhPoo5k+Uhvq0GfxxgINr6tX7GaKMRI6AASrtdaX9DhfngSgUEAX5Wtw
         YKqnDAcqgGqDD5lxQPSujjLPlc8tvwBfcYtI4uWchiUT7oQUDZUXNfxMou2CQSk40MlB
         ZctPJDvhbEi5fyz334aiR0sByNqERs4AkVng8=
X-Forwarded-Encrypted: i=1; AKwUvByHyb/S6uQmOe7uG2l2eDShKqIppQ5cdnEmE9egXCtPupMRjAos5rfR72eM1WRrI9dHnSbPyyiNmcE/2jw=@vger.kernel.org
X-Received: by 2002:a17:907:720d:b0:c2d:d202:d1ee with SMTP id a640c23a62f3a-c2e4adaee21mr972821266b.36.1791217921803;
        Mon, 05 Oct 2026 09:32:01 -0700 (PDT)
X-Received: by 2002:a17:907:720d:b0:c2d:d202:d1ee with SMTP id a640c23a62f3a-c2e4adaee21mr972819066b.36.1791217921362;
        Mon, 05 Oct 2026 09:32:01 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31563018d8sm99716966b.51.2026.10.05.09.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:32:00 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Nathan Chancellor <nathan@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, <stable@vger.kernel.org>
Date: Mon, 05 Oct 2026 18:31:59 +0200
Message-ID: <1a10ce86418.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261005-brcmsmac-clang-24-constant-conversion-v1-1-a30c5692d582@kernel.org>
References: <20261005-brcmsmac-clang-24-constant-conversion-v1-1-a30c5692d582@kernel.org>
User-Agent: AquaMail/2.7.0 (build: 200700061)
Subject: Re: [PATCH] wifi: brcmsmac: Adjust txpwrindex value in nphy_ipa_rxcal_gaintbl_2GHz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 5 oktober 2026 12:33:07 schreef Nathan Chancellor <nathan@kernel.org>:

> After a recent change in clang to warn on signed char conversions within
> array initializers [1], there is a warning (or error with
> CONFIG_WERROR=y / W=e) from nphy_ipa_rxcal_gaintbl_2GHz:
>
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:224:18: error: 
>  implicit conversion from 'int' to 's8' (aka 'signed char') changes value 
>  from 128 to -128 [-Werror,-Wconstant-conversion]
>    224 |         {0, 0, 0, 0, 0, 128},
>        |         ~               ^~~
>  1 error generated.

[...]

> Cc: stable@vger.kernel.org
> Fixes: a9533e7ea3c4 ("Staging: Add initial release of brcm80211 - Broadcom 
> 802.11n wireless LAN driver.")
> Link: 
> https://github.com/llvm/llvm-project/commit/a5ef934a8d295dc03be3960f2b3744ec2e53238e 
> [1]
> Link: 
> https://lore.kernel.org/1a107e21b08.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com/ 
> [2]

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)



