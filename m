Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B0537CD59
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202038; cv=none; b=PkMkIe/mSqo82qgiFYg0suXzbTnUEbRrWxymf1IK4OeaSSVaAZVLTyImD8/8E0OdWR0qPvgwNfC05v3P0Z9GQnKDojslCoQsOk9YwuxsEZWnrqgjaPhBQ8qycgE2nWzqExHHmB96dcuK1+N6Up0PlqlqozRkagOZT4zHKl4vzXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202038; c=relaxed/simple;
	bh=eFVJqFjYCH3QC3ars0bbJAzWOw1C3Sqfnl6vgAE0qJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIG5pTxKqKWzqfEeIoy3jH/LcK5/+ZkNNmF83sPgQ4Xep8UV/1SC8azqaCgBWTEaxLiViZvsX0rWqvPiziPLt5d+lw/+wldYSHOmji3ZgVV6wNwHDejtS+F1eIUJyK2BwwlvVuZJjf9XbKD0GWHs0Wo8/Kn3laDlr4cTPJapBsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFv5mSFl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFv5mSFl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d8f265cbe6so21801815ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788202036; x=1788806836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MlGtvQtKgpmUi5+9i9242pcEQrNhHwznKt4hL0QuTVc=;
        b=VFv5mSFlAhoGcimmB4/cv/LnCPZ1kvy5K8cu/kmcAyd6V6qwxa3ouipivRHa5IB3E1
         qD5VBelDAuFkYKASGHREQCs6Aj5J6gmlcB/mCn6hnFvZErM5iCIOlVaTwU/zHzdO2HL0
         6pNl684bBEYkkbqtMCKbTUQnjgz8LVxU7D061ENYWtu5WcYicSzsRcCXtn93jnkPoflC
         VTVW8uR+Y5oBj7v1E6E2SzKEcYKih7oayEHiyLpTEWq1IBd25F0KIzEQE+huIgIEMQfn
         MpV4Xty4zQfhF7qNlZdGwgQHhogxO0SW2zQxbuFXmHHX2QnnYYkikN6LiKBOa8hbKDr7
         uyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202036; x=1788806836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlGtvQtKgpmUi5+9i9242pcEQrNhHwznKt4hL0QuTVc=;
        b=FAMj79yym3VON2C87L+y67E1IVMpceRcApaBwedfAEr7ixQ+n7kVHxrO1Te4lJaaUp
         WQWNdfX4i4IFKDbItcagGT88e9MJAMbIVsB0AwQf+z73nQqhN3EBr1Yx0oaHK/6AmAfb
         jfYYVxuPt9o6s4pD5xOagRXkSiGZfJfPoI9gVTYPGwmybXBdeHMm6PaOpII4fulxQ3Ho
         RnuwTq7mnW/iQAlskA2bmbse034zZpDzhWmyiOUgnj3YEOu8ENotA00xQ32C2S66W3E4
         MRgNtbGpKiXZm+A+rsCBhPQjBRRgKcSo6nW6BLNGHdawjfmJyGuEQAVBpLyuh7VyvjBj
         ru4g==
X-Gm-Message-State: AFuF++mLUlYf/Ny/9mWscCX/O32rFV2hTdhC7BCsHnsX4bFSHBnI+y9S
	SmVbaW+OsLWPb02bUtbqi4wn+tFKZj05/c3GZU3+Zkq2WqfZ8BHm1wBh+p4x/A==
X-Gm-Gg: AYBFou38xLipG9yJMup/bA+dRg4IoDEb6tPm8w+jTTfSAn849ZTt6laEneySj+LAqOn
	uuAG8ew/pdnSL/Ro+CjrCkoeD67f8ArO+QN+Chrg773yMWS8O5PaaSebIe6WVpM5SNJx+Ajyz5p
	qO7UoS34tdHgVq9EiBU2I+2TzkfdzhpeRQdgiR7wnTJd912Ne3mDRGme8WhxSM4v9c8+IqyxXRb
	VOndE/FOF37WqTb+4BSs21eTO/0D+K9hpoT/tyT3MaoaeiefQdJOwZ82aJf4C0T6R/bVSWdJ7yW
	5na8zhqeTsFoD8gAlIlemb34Lihd4pDrz/IQVa2Yvbl1D6lPIhGB0scrB0QsZ4lkEVtzW/4ofdx
	CAx3+fUBy4P710nkbdAPyvPn/GDc2bPdJyOiSqQ3xZufk3tvN3pXAqCw7tJzDz1M1RlfqQrjefW
	nc51+knkVYCg0Ch0kuQ1ePR/SghmnwUJFY34H7ilABKx+6VzcT/HEdIR6SD5EgHlSZ1ETNq+9Pe
	g==
X-Received: by 2002:a17:903:1b0e:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2d74ddc6da3mr455182625ad.9.1788202036193;
        Mon, 31 Aug 2026 11:47:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm17555601eec.12.2026.08.31.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:47:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 11:47:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] MAINTAINERS: Update URI for watchdog tree
Message-ID: <c2e2247d-9bf9-4a8f-83c9-2bcad1896979@roeck-us.net>
References: <20260831153646.396038-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831153646.396038-1-antonio.borneo@foss.st.com>

On Mon, Aug 31, 2026 at 05:36:46PM +0200, Antonio Borneo wrote:
> The old git repository
> 	git://www.linux-watchdog.org/linux-watchdog.git
> is not accessible anymore, while the development of the watchdog
> framework is currently handled in git.kernel.org by Guenter's
> linux-staging repository.
> 
> Update the URI.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Applied.

Thanks,
Guenter
