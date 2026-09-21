Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA147986D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031364; cv=none; b=tkbVJs/8v5Xa4NtX+WirInNIAG/c7RPa2dKkpeDqyxv7TO4bMa74f1YgzsH241E8/G5V3+QNWvouVLt2cNcamHPvATbkLdxL4xKMVr9VmejSdSq+JxanG5oSrLRsSlyafhcHb+495B3kno+7eaeABd/+2CW/ycES9dnf3axWE/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031364; c=relaxed/simple;
	bh=vFb0s8fL44YTlDkGDFCDrZiqpDKoxKlGjsgafYTpl1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNAfDVJRZcsEWtXD5mUm/vjg0LPJVYMWu6loFAuYeIOA+IEQxWK0Rn5IiCALRbauj1z3GI/g1ww+NYqXE5UQZ8gt8OF1pdcy7K+HZW4ooa1fTG3lldte47ZDu/A1GjailOnCL3RLekuvlZ/KtwVCilClAYyg4gFMyL0bVuo6C9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZphIYVoF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZphIYVoF"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so41825465ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790031362; x=1790636162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y2KVqETD0PLe5DSffZm3q7gbgMSzknmXwrxtUM2zolA=;
        b=ZphIYVoFhstelDlX7de9lq4b86qvbQnrbGl/N5SgWALIvYofYN5p8I48X5BZRv1j0m
         ekM3YqzrDWlKIXWjPCzAyBKn3qtweTIolAh9bydtkKBriFqfxKzcEyD37TY3XO4B4/1M
         UBsOd1DqMwpKTbc8IYCLZjBO9S86aQsKAIQPA26WInslGKe7UMTKwxF1UNs/7TEEFJiJ
         eeh7nNek/IgnQgE2ZAz62x8B1/u/wBKuSQXrG7JgsSHE6cPgavg4YmAeR2qDGmI5A8ch
         07/ZN6+aWkyzQ55MHbjjYS0zqEwPr/eU58dlec6TLMsZJoOmEINRfKLARZ3TFsunhrQI
         9YYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790031362; x=1790636162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2KVqETD0PLe5DSffZm3q7gbgMSzknmXwrxtUM2zolA=;
        b=qsd20QFAl7ZMJnhxr+G31/86BUnIrnPLbIWV/zKjoqsqA8qszaJwc7VAlgA53EE7kK
         jG/Jxj/761xnvP4TwRMHG0q2jJ0e44GFdYXzIMPmlsJlF0OKJoi8CQollyVE4LckpX6s
         AhNQ3Pk3++11SE3goGLclnFJ3rrlVxvB6YxDHymJPiffpuCypCKP6dXV18oKsM8U+3t+
         ft+qUTkzr9XDOCW6hyqDy2NYHfvMNqEBSsYgNFErD2ufC0bXlSfgJ5dSloB49Ta5ApLd
         2x7VF/7LGELrSVuSB2dLxxIzPMyGJx/gwAPS2azMb92nOhP9gXaRtARtjd/9fTYm3vsG
         5How==
X-Forwarded-Encrypted: i=1; AKwUvBw5sdk+eq+bp4TYajv6JI9Q0xxipAGcGw7rWBRgdlqwrBsAIqvvdVr7VdQhFQb22Lu5T9sdYENXxXe5+Yo=@vger.kernel.org
X-Gm-Message-State: AFuF++klibwd3p1Yb3gYTwwU8Eu6SnYDEWEfE1Eok+Zs3EaxKk5c2GjH
	VixjxWrlhIGl9s5T39lteFHvgCKC4ymFvXMsTo7C3G/QWlOmNYjZG++S
X-Gm-Gg: AYBFou0Rg1dPE2TwMhMbKkEX0NdMnH4M1ka2wWNBaklusW+kkELLN2j5O3+EQSjyDgB
	ZWaUJkt48JMAROpZAdS8t4c2WFruT7XsIb9dA5YT/1sXX45ywD4RQMd5S4m/cDy/GNaMGNRkwIw
	CUm0vUqxy6aFl9gHFN1QP11PkfgmWWQo8pyFXAeBY/xooS8WzECd1dmiCNIRdPEXQu8SYasQJWb
	2DxSPEGbGp0jWpCnTxGzTJk7mzwoKR0Gj7j6Uz14/14TqZnCMigghGprqFtnlmRECBFOYkLNkEj
	yn5WTzSp0WUuBlIgirZRJnth6YnlIsJqSkp05KY6okIGpz+FT6BsTVPWBjEO4D8tE8y+nbOH1+r
	lPhfCyTPDd57jlDIBcF9RqrkxvfbnhQYg1YLOynynyaebKdP6PY6dNdxhuljuPB5POWhMyxvjlk
	XM1nJUolyViY3UGi9ZgTCX3tY7aopBZwUvNIgf5aZ/5qid5PW3eA9HCNkN+mDbrHs5lN0KHlGz/
	Tgh6ioftcpXFIY7gw+r3CVCLq6pe6ZCgJTre2qM
X-Received: by 2002:a17:903:1a4e:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2df5b26c9e3mr5826985ad.40.1790031362176;
        Mon, 21 Sep 2026 15:56:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e1a7:4f7b:11d4:34fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129b3a9sm183847eec.13.2026.09.21.15.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:56:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:55:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>, 
	Kees Cook <kees+treewide@kernel.org>, Zeyu WANG <zeyu.thomas.wang@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ariel Silver <arielsilver77@gmail.com>, 
	Donglin Lyu <DongLin_Lyu@outlook.com>, Alexei Turtanov <9alexei9@gmail.com>, 
	Zhefu Zhang <a723356@gmail.com>, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - use __assign_bit() where applicable
Message-ID: <arG190_ETQKrSSXS@google.com>
References: <20260919130741.3041442-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919130741.3041442-1-peng.fan@oss.nxp.com>

On Sat, Sep 19, 2026 at 09:07:36PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with __set_bit/__clear_bit to the
> __assign_bit API.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thank you.

-- 
Dmitry
