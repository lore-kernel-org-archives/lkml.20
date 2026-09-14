Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC1D33998
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348872; cv=none; b=Pu4snJDILJPw5AUSV7nH1/pLvlto1ki/WWcYt84/MA1JJfzUbgzgXqpC+5eM1H1CBR+70pCfPvIGSIOLd3sIOHfBL9tHRwW0jom0GJg1q5dsK76dodcY037ZP9HyPzcw/PVZrA/677xvBm7ddD2GATAVfsxKMfd70FtRbMMKrMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348872; c=relaxed/simple;
	bh=p0TdEI9Odp+HHX8ZliRHfs3GoCnFdxCkjA3b83mrZts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edPlagBqsuzgyw2aOF7NKVTifKsGGAKti6HhR2aC6Of6nNUaZL7QXBzrQ6xo1gsdX341LTq5llhSeN962+r8/cUeuc+04UBy8iAyviFfxWuyWWuf59vbYQ8lmnxZF5+j9Q8Vw5bJHM2Xe4y1AhoGlGvTDOTXw/ERXScybr5CfgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UR1FIwaH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UR1FIwaH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so2676794a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789348870; x=1789953670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Na/Qz2DkaG9+GH7sd5UZU98HUu9w7cEHSlbtgyG7FmU=;
        b=UR1FIwaHbQqvvGwhA7ZukWACEp8dyjAhz/4kqGJdsBWASse96+bzT1OXg+7BzDsK/7
         iwwt39m94tmCfXy9vAWe+d6AUWEbzaSQBiZ84uagSvCCx22Z7SzF597AZ7JbXxUEuUGb
         s/8Wn2PWp9TGNYBDFxUGsLaxtsH+zdoxRiTKLnLp1ERFvC3XyiKFB0aBhstgr2ACdyqf
         IUMtH0imgHEPr/ooQqjpAj2NR367NDwu8aEBF2q4znzEAVVL61f3biMAljBPUe45adwK
         aU6TW/xccIiXg+S+Lqgm+QYGsrfDRefyQcXzOy1H8lR1uZ2L/mCd79ObDOvI1XPYLNeK
         q5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348870; x=1789953670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Na/Qz2DkaG9+GH7sd5UZU98HUu9w7cEHSlbtgyG7FmU=;
        b=tUfEUE3bMl6UYrjjWlB6o7TaIzdg6J/+gXAD4ahkrCNkO8iw/y2+co4Bo2Q0TCqT8T
         v3O3YUk/kN+xx2ySAQ2UesfyRCIG30ujSHs9M86zuRYIBjZYLSZEXfbZEBdxfoQmiL6S
         9N3PAEviZLwje7nGJl+d3GFMxY0YRnd8OCoQsxGSb+IlZqUV/WVvS4jvEgxzkHLZs3Qv
         Tqu8CI2TUOkU898pz1yy29TN4u1nj7bskpuIztM/s1t490BQuKxtGVPuzqDy38JwL9PL
         idvjueYGROUN7czND3XtFNWRrxX1LE4zPczBDLzOml7F7QvO71lD/qnKr+om7p2daFXA
         VsyA==
X-Forwarded-Encrypted: i=1; AKwUvBzkn595dCQORYpTIJtQXN5+WLsgt7XxMWvgK30L33i9UFBPgTc4JfRQSl4BKvSCKnl5yS/k20O7OXc/zJo=@vger.kernel.org
X-Gm-Message-State: AFuF++m9F4ru//H29xOMmnMy6T5MUlu2VYC6ZXcr1X+8CbpPgnHuSI0U
	1ngz4ybkV0/Z+ekDUO7yu+MOTLi5lT3++7M0hvRDYkHKRJyQ5DHxJ6P1
X-Gm-Gg: AYBFou3ElIKAYeS7Fli9VML5pZjQCv5UN3roDEFe9BcIPiLZYNe4S1E4f/BDoPI0I8U
	b7JyXUmkfrdwlv/d6qspzf1yDXGlJWnpQ0iZHanadZ31a+1Zqe/H5V4LKZSQ3/fgxKGxE8oL6VB
	JIlnVnPz0Wb/MPu671kRHQrd+QMlkAcqExRlgb65jg8otpk4pB6+aSExeWduTZOqJw3lMWK93gA
	WxGgyf02uN9FUfawx64Vq/4oFDmnSYp/1B7jogWa+oWow7MtrFekzhd/g7tgncXSg/OqWIoY1YJ
	NKbbKy0sMn8UtBoEqU1uug7TLtLH3v6pQwzrMWjW5lfQeEktpnLsVM9JnkmaQgYa0vj71gGEv+N
	5gpVNe4SNFDh/fJYyM4p0zPTsatpvRoX9cRKbaWAjOWJ76oFWbWBGP9DCDAroap6loLk9jzY6h3
	lez7RK/jE9ZllPQsFfttSq3PCoSfT53hqfywMoFiojwJ3q0iAGpNOpwjPcZTaSFeUPLHfpi4nGO
	GOHYBIg4VYm8i0xAA6sk9DVKxIf+TGW6EVtejNmcwpMjuxpqCY=
X-Received: by 2002:a17:90b:2f07:b0:39d:8b8c:3783 with SMTP id 98e67ed59e1d1-39dd54786acmr4925020a91.6.1789348870069;
        Sun, 13 Sep 2026 18:21:10 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm23055666c88.13.2026.09.13.18.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:21:09 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:21:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erich Sartison <byt.es@mailbox.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for Victrix Pro BFG Controller
Message-ID: <aqdL5wRZxLy60T-N@google.com>
References: <20260903103137.630170-1-byt.es@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903103137.630170-1-byt.es@mailbox.org>

On Thu, Sep 03, 2026 at 12:31:37PM +0200, Erich Sartison wrote:
> The controller doesn't currently work via USB-cable.
> 
> Signed-off-by: Erich Sartison <byt.es@mailbox.org>

Applied, thank you.

-- 
Dmitry
