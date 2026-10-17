Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6953CF026
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792232469; cv=none; b=iYh1m5ICuwN90rZgFVPtv0NtKSpv6MXIrQNHi/Fb26A8axVNa9bfsmjnbtER6hNoI9lpovFHtqTTTP8apL0mU9IRIJ52ukORpZ6n39u5NckfIjs7R4Hh/VGN1vSMlhOF13cBgdRoXy2v66TN2Z9siVsAky8Irftoe2LfgSE+t38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792232469; c=relaxed/simple;
	bh=o/txFfZ6qREH6HvPvJA5uqvrdC2R4O4pSi9AdfzM0pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkxXhrwy4WkxtdZdXQ1CXjCaxF6BlaY/dIE91BgWTdH9ppHWpVoEq0lpbPUgigAlKswPHvqvSAQjlrbpqMUNPk4i4NASa80mOwfwI45Y+3URTKJWR5R9UJMmL+GNDJvs410xSCFO5etz7yl9zikwouTlCp/MELkOF2+5316aehU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=MfhsvI0k; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="MfhsvI0k"
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C80513F16E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792232458;
	bh=+C0qtXyCjBUJJ5Qb8uii3DzDlBDyGd3v4gWGK+ZJm9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=MfhsvI0kN3wcfUOi+G3dSx+Ya1htqIaixr8vKzhTPFHPOF/vHm6kczYZMqRFbhlvv
	 KhxZvRvz12E45EF9ChBd5hM6NZvfK/rAEUy0v0W93A6vpoRZN4nps7J6yutXe/v29g
	 MMQsi/M22AKw37ZailVeGqZrCmXJU/hxO/RRuwrhSrjT6JtYJb1tPoznrzXoe0b63f
	 kHz7p0DP9VuuTOCZzBFbqJdADpU0SmzCLRF81AdPm8SQeOmtSUjtW2GexfOp1efAzs
	 PbT2Z+paGnpCAaGKR+AyD4HKAsS3sDFE4WmCzaKOb+S2DqxqXdcmoimnOaVQEp7VzQ
	 JFqqVN1BEeUFmy/f+u++jc8pCIhvTSKTbIpUWi7V+FPrpVw8iWMxlxKduuHEQdg9/v
	 5IfYEyNL0R2eja+aDBe4Sxa0NW6q6Gzw5h8ot2DGMBvOb1XeiCSOxcyZJb/Z9RypKv
	 62uCMkt6fB0iAhxslOlVr57VDMTplTwK0iftLrloJf/1eUzMqDYBhaLksSOUEGFtSC
	 lDhGxF7nITTVW4I3F+G6F1PakF/VtponFSJEtMTxdJ8/JsmZSvgw7qsUMJwaWOK4Wc
	 woBTe1zhzlRsQeH2MWdOWSLceU3K72Eb+xReKHJrkqIHB9b8qDF1lMlWoCiXmQ9fKb
	 /MH3FC9FkYJUNwR9/YCGnL5s=
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd61df4951cso696329a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792232457; x=1792837257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C0qtXyCjBUJJ5Qb8uii3DzDlBDyGd3v4gWGK+ZJm9M=;
        b=COXjEtxLCZ+hNsE7+/mVoPMHQe8l9PTkssCfKCliar5SEPCiWvV7qL3XExvfG/2PkI
         0coDpoBjNa+u3sxFm5tuDDig8ji1uOz5Nf/HjkPevtNoRYxcqSmMkeXqG/k2w/cL4qWu
         SeJRTosUeOCdKOUTXukopG87M6ADqkyRLk8ZuVSYb9P1DLxULTijMnfckQYUZnTM0xDF
         8YxSjvSEWZCfL/4RSSxySFcV15z8rw7BhhVDAiORx8AyQ5diIXZTzCCWWeXplmK7ezYx
         5B5M6+bPa+tc8+L0iGatvxzGcbfKNFXxYzy3VRZajIMpaIsVQPKIGAgygQiIE5iC1x2Q
         I4lw==
X-Forwarded-Encrypted: i=1; AKwUvByqUrqt1qg1HmB3czr8bRHFzP9ZNzEU27bprDniHRw0Vh8ZkjEjEY07CyuhNiqMbGFQo7UpBiu1AFfWpTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG2HZMEA/0K1c40wdaIB0dcLummEYUyaB8/BShTpH0wamj4w5L
	N3ce0qgE1ecRjUbp4EaIoem+Lq0NVm1u6VmhoxyhBTPuvMkPcFA/z5fdzBGxm+kFKaW8H0QGu9E
	EdBbrCGC1/mlLW9aeZyTLJwrWYPN/yzzk6/P6tPSx0Ng/EO5+YyUMadBBGuUa8gLjz6NRhltvjr
	lVWp4QRs69gYcwAQ==
X-Gm-Gg: AYBFou3YLjRfUYlLfzGOjiB9r5oTZxBZ9V5WEd29KD5VK8md3mapic2WdsvPX8YkfJV
	BIqzUGoJCNiS9+pxy0uHeJFJo/UcPZmSL1bcU1a00QcEIymZmxM/ltZmBOKwTfHgAGB/h3N9tV5
	k5Nf8LH7hEU5hZwItODoj3iYS4AaYwzzK0QXFX9eaDYj+lI98v/gLR6kjxg6d1WSeQeIjaXAuNC
	uFlNHvHOpZUw+gfGNnrYTjwj04emhTk88cmSiHQ6zU26d+S9QHRfxxl1BwGuK4MpjmE0lBwrlTg
	pnAiVnVKuk/Rtr9PZmKGzVAAZU80fUqGKlFyfKMF4wcKqwvuchcJfE+au+GbiJKkHf7KiHpfvQw
	ggTJ5TImXUA==
X-Received: by 2002:a05:6a20:a121:b0:3e1:5481:5457 with SMTP id adf61e73a8af0-3e2260271afmr1650444637.31.1792232457102;
        Sat, 17 Oct 2026 03:20:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:a121:b0:3e1:5481:5457 with SMTP id adf61e73a8af0-3e2260271afmr1650414637.31.1792232456626;
        Sat, 17 Oct 2026 03:20:56 -0700 (PDT)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497df08sm2115250a12.6.2026.10.17.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:20:55 -0700 (PDT)
From: Changwei Zou <changwei.zou@canonical.com>
To: stephane.debusne@cynove.com
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	herbert@gondor.apana.org.au,
	jeffbarnes@linux.microsoft.com,
	horia.geanta@nxp.com,
	iuliana.prodan@nxp.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	martin.kepplinger-novakovic@ginzinger.com,
	pankaj.gupta@nxp.com,
	sahil.malhotra@nxp.com,
	sahil.malhotra@oss.nxp.com
Subject: Re: [PATCH v2 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Sat, 17 Oct 2026 21:20:47 +1100
Message-ID: <20261017102047.333792-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017081417.2775186-1-stephane.debusne@cynove.com>
References: <20261017081417.2775186-1-stephane.debusne@cynove.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Stephane,

Thank you very much for your help with testing the patch.

In fact, I had previously submitted another patch to fix the bug on the caller side:

https://lore.kernel.org/all/20260731024446.786329-1-changwei.zou@canonical.com/

However, Herbert pointed out:

"In the Crypto API we don't ask the user to provide aligned data. 
In general it's the driver's responsibility to ensure proper alignment."

https://lore.kernel.org/all/am2UMhd5CAhDiKBF@gondor.apana.org.au/

Therefore, I later switched to a driver-side solution.

I'll include your Tested-by tag when I submit the next version. 

Thanks.
