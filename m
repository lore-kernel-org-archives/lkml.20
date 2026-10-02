Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54167E0FF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 03:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912995; cv=pass; b=pFdJig8tdyCm2oUhTNcdRcboBDeRqTyLPQaduRnuehzsER4NZ82/xY3OHQJPge2UPoDXO0l0RO5G9l9DB0kOoVZg0xd7NAGib7RLN7HTG5YNIkbZiU2PfUIrGC/qyENUpY8lr3pBgo3jzjW4W+6uf/8SG+WT/8gbd5ao5V//l1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912995; c=relaxed/simple;
	bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAqXUDFXipuZ7ZKw3QdQ19sQlS9fXtHITZ4er3IuAhzNJInc8VbcDjep3vyGG9LrM+z3f+sx8VuH9NrPwsl/RK6tbGL8tYqoZDOIOGXvokDCNFWYKdIfiS1LPh9Z7OKGbu54XHiWnblWdr95SwlJYBSENF7VHr96w9VyHFD1rMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edWMzXlL; arc=pass smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edWMzXlL"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a87d6580e7so652331fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 20:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790912992; cv=none;
        d=google.com; s=arc-20260327;
        b=UITbueO4BmxitbLyTK5MDWxYn+6TLx4uScZBvvuRti9f4u7X2ocMEB9q4GcD7EbNTi
         So6p9WEw5gz88ZoVdvfi0FhD+y0wAETed9lGt/dbotw0f6HKo/bSC5Nbs7Ywq1E96sEx
         5FIHrmfqv5aW2fmWDEfXheHT9YFH/k6ZRaImjnwSmEYGaQjCo62kIyHnU6VVwTnQ+r3g
         Jh1kCA7Nz1SMG3Lap3t9p/zpx4eRWv/jx5Wfx1piakHIJCIvfvAeUnA5joJm2e+c2zTm
         RQJ//8dByUEivW8BKBwQxntSigO+/WslgfyDEAqIHPyLwkP7PS6FQVOmEStyi+qRZ4Aw
         kt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        fh=nK5nTIKeyBY6Og77gVs4oK8HNj+zISiExP+8F50cdOU=;
        b=dZ5TL+7ofW/XJ//0Os/tSGlnLVrtA+/z5pUoGN/+Q57JpUEFYoQry2RdCkbTHKqI6H
         UYgQ1yGm7uXxAxPVCz8KunckvIa9i+HCFyAyhBQ+TR9mENvOTN3L9i5zuu9v8xJbIiD0
         5YsMfuWkPZiFyKfBAgMQfZeZ+nAbh0My6gWDGvOVR7odetkNcBnmdKs9wjzpBOZYLOXc
         6zQ1eaxSVcrfyg+VdK+je8yh6QAuZ25VcOWU5znarex3RI3x9MjobNF2W/A6qzdcbxCz
         jfoSRSh2mBnSOy13NeTVOphJ+3CSbIuHyqQrtZDLZluzUElDruiJdyEYqCkRgduzCnmK
         C3qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790912992; x=1791517792; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=edWMzXlL1nhlQBtBa+b4NMTH8Y61/TO2fG09UGW0kQ5Pmcu02Xo9QNDhmjxNWeYDNx
         RgUDHUk3kvWr64J7RtmX4N3kdzId2LMR7x9lSfW2I3qoWKrA1VeSmMGLkUu97dRzsNSd
         Ixts6sj3Rhj7kXEyFqoffyVoiW13gKPR9Rpbkl5MwyAtgdAAxrGdjxoQjUZ6Vc2MRkaA
         HWoZGO14TJs5BY24/hBdYYgFFXWTCPYscJ9uodXy6e70ixkncpQYlnvb/Kxmtya8hQTY
         rgjQU+atgBw2rISxW0sqGV+l8X7F7PvclVjIZIcG1a1CYoVyZvPiwjivWeixybYSnuIy
         tRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790912992; x=1791517792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=NnFfY3E71E8ARgtiIBgoN1fxVsEnGbJTMGRRkVovL2A2BJn/hgqUGrcbX0SaTvcIep
         QQSbbStKfioxyBqORBfPnPt764zftfVDT2H6FOkEOiLdsLSN/qo6yTSgwRlckDkuINE6
         D6KqrfJ5bxNQcMxCvnNDumdfOig1kTUOsDaJbzgcHkxtJjQw/f7iJ3tOoZb1wlEztIvb
         +QYK7y/OgUBRWUn+P/zB62fcP7tTfUApQqlMdYObeFPbY5DOH6YZtaXH6CLcV4gyUrbi
         BjiZUwougJ4lkyHCqpDVxkeh9u65RN0nT2rnV8P/gwNr+BGwqLNDll0Wq7q/ysqIW3sW
         uWag==
X-Forwarded-Encrypted: i=1; AKwUvBzSS9v35pEvl/DoJ5ARUSCzE9OcGb9jEzhvcUW7ePOai5td+0/Ct5mbRac13urpfMEfM4nYfnhcC28Jf7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMYL9hFvvxb9McWD/QwWw5UffN2MnFXyUwK76pjM55src+d3uK
	cxrQIl4DxPYDv+iatHKcSwAaWv24JDNVRVBjowKelswSPFbDL9OOq8Gaju9wqQp4aSLbzObO+rS
	/eRIvNMu/b13ZkjmryYblxvha+FjdtrtuwkfMANo=
X-Gm-Gg: AYBFou0naJAyECRVHVDJvs4k3lfe4PELMdZYjUPeD/x37WQojTWTDlg+yW/KpuCvndZ
	cRp55KKhygh+33HOMXj2kdehiIAD/g7P+dRpup2a2OoUrFL+OxcS42eESutzD4GdgA+SNUHgmti
	3LGikftwHdI00qF/4k6KQRRhJNaGJ8SKeRkh8UL0649BvcB+xGqx+AJnmLcVM2eXFcFcRh7U+hI
	e/zZe3AkksuuHlcINn5i953F3hITRvd43Qah0zsoUpwuLaOtXkdPQX3f77Tk9ZmPjp7jfqCa6Uo
	Z+yC0jYACbh4PL3HuHMQ/CajGp1TrgvhTPch/ecbnLkrLYH0xFFTChw+vOWD4IHV7uxAaNll0M8
	9vsE2rqrbSzTgbDbm0+fEdnZs/ZdJsYoNm4lu
X-Received: by 2002:a05:651c:1b84:b0:3a6:629e:447c with SMTP id
 38308e7fff4ca-3a8827de31amr2384311fa.1.1790912991548; Thu, 01 Oct 2026
 20:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
In-Reply-To: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 2 Oct 2026 11:49:39 +0800
X-Gm-Features: AclHuK9nOE7Cp6JUOFi-QxVBuGMkiu_Zk5X9AVbxMGFwo-WwiNAL3M8EJdWroT8
Message-ID: <CAKspUhKOwuXyweSk_EsBTTNKrUbDy4ATkHjEPSObA=zm-Hu7jw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
> This is a continuation of patch [1]. The same patch was sent before [2],
> and an overlay was suggested, altought it was not sent. Therefore I am
> sending this overlay now.

Thanks for picking this up. [2] was mine, for the Duo 256M; the overlay
rework stalled while I waited for the IO board, which has now arrived.
I will send the matching overlay for sg2002-milkv-duo256m in the same
shape as this one, so the two boards stay consistent.

One note, not a blocker for this patch: the internal PHY under the mdio
node this overlay enables is named phy@0 but has reg = <1> -- which is
also why it shows up as mdio_mux-0.0:01 in your log. 2/2 of my earlier
series [3] fixes the node name in cv180x.dtsi, so it covers CV1800B as
well, and already has Inochi's Reviewed-by. I will carry it in my
overlay series unless it lands first.

Reviewed-by: Chen-Yu Yeh <chenyou910331@gmail.com>

[3] https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/
