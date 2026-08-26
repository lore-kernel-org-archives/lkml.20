Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7A495028
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784454; cv=none; b=j90XeL3YRZ+qQpPwc5xPBEqeZV5UrJRP1CiEGxzXI849FFvg3fbp8tFsHw5KbT/atCQW2wAR3i3pBGkIrWi3vgtti0TCBpNbPDYiSZrBma1HaXiKLcDc3WLdMMteAd/IrmcpRL53XiMDQNIgrE8Br0peW43JrpaIrd6SypbbwJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784454; c=relaxed/simple;
	bh=2EcuMs66WwABTo276zaU8YY0oG0+APm8TfsrfqLZRKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBGFHi3w5SfiGMVC2yihJ9+yNqVPxMoShikRTAI/mV/Vcp0GpEmCi7c6846HOoi24VrkRfgtJFIC4qzVs6eqC9OrQpP1k89WUeMoaoMCkUCHmE1EdRELFLJHO1VnWsJr8cf1yb+0AijRW3GdKDa9sgDMwLp7Sp8BqrsAQ9kJhCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOp6ccNo; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOp6ccNo"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-930f72317a6so81768685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787784451; x=1788389251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGmlfvg3E3qxAvzs/3LCBaMCVhVs8joJvhg37L20skQ=;
        b=XOp6ccNoKtBXhzBtOMC5L+FG3S5LlEBkp9kGcirJ6sZdn/oTW0HG+1ewWJEB0SSwJu
         +6VLqv2G/fhm4yhapmqFp1qH136c2o9KcTYnI0Z3u3/FjaU1Gh+pMRFi9HS6u69+G/3w
         MBBgz1ccBMbG2dDctM5XdYvRq/s8mBsnkLWbouHtW31pm7fKIfefh2G+Dg/OAHgo0AoM
         LWzD/yRcrc+YVQ8zceH1dB/eUwxd0/F/FhFw8AoZgclnCFxgvzGn8O8rrwgKbhyynjhu
         Zv0nXyJxJPn7k9wcp/6ISfi83dlEypLSqmg4jy2NWyyhF3oHlB42ltoz8iHF6jijDqWW
         m0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787784451; x=1788389251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGmlfvg3E3qxAvzs/3LCBaMCVhVs8joJvhg37L20skQ=;
        b=B52Z7d9Amh3KiwR8PVZxQkq9fj4Tca0sxdUM5claRgt97Xs4j0BClIYv1XX/NVpzYa
         bokIdb4XvCtIlXGCAUpwItXzAE3pXoCatwYbj2ENL+yt3nEu2Od97oaTvfaGryd1cCp9
         s7ThV6cmPRu0I/FgPZyTDRl+IPRGfLdONi/oIPSKBieMzhx61cORnPeRkGPw9iwFQkZp
         xsu8VHCIUMRNhgXgLc9UMXInImkf/L8B9tgrb7oVjbxlSQu0kfe3q2/ecf1NIc0FjH8K
         USEQ7cU7Y+5hjWkvPCsqqHxyncYQ/ncEuDVmxwnTt40qRj9Zini6DneaoRvR1QtdOvuf
         CSvA==
X-Forwarded-Encrypted: i=1; AHgh+RoyIpvMQc9QF9K+EIaU3+EILgGsBI5nZ0wzU6vAL0x0djzQ4tSRYKiP1QkQXhDRGw1WDqvfXpukZH7oobY=@vger.kernel.org
X-Gm-Message-State: AFuF++kierguetcoKIa4CHC2CO9iMd1XWhBfcraJHlgKFRCZ60witTtW
	ML5KOu0jloZy5pws37PAzGwVbE+7HBMmcvk0e706UDV1itXJDk4biyqA04m+jMSf
X-Gm-Gg: AR+sD11N8Hk9Pv4eZEd+PniFWs5XaWLvjoiWfP9KivcHd9ym3yf7qOZKliXE/MxPb+B
	7HyYzBfsF2OLJcjbo6c2AdA8WxL7JBsXRN+R35+woCH8LfhJgV0HCxMFbBaxf9BdnEPXSOzH4fe
	+cVvcEyGxQCQ5CW2iu8rr33+1VQA0ZPjjbB7cMoLyn1DYEEfubdAmL5wwU+grO6t4bj0hQrZdRN
	zgdWmHuaX6OWYRvaIniARrR8uSZ4ci7Fqe4jpVb1IY5ztV00P/py/u7MBanMydOdnoGDHJzocqe
	JX/E1WN0XyfhVFYbbIvBSuZXDk7wvC//WAphDkIaO77j4+cN69PIcKXuDfvjPtB3/ZvYvtDowmv
	8Eimu8Uo4KLzAuflC/CHkr9U1H2Rj5o1WywLKgW5ylpNIrdE76J2JYguiKRc7qyhXDp4g7AqdwA
	sGu5IBzLj+1d0CZTZ/KfZbaRuC7y9vOokhLvUk3oBOhPXSGO4F8DCXkjaCuGErbiwSL7VRkxdYn
	0JNhbkO8jyC5yJVDIh9J6I=
X-Received: by 2002:a05:620a:7085:b0:914:b9a2:f29d with SMTP id af79cd13be357-9378041f08dmr1088154485a.37.1787784450800;
        Wed, 26 Aug 2026 15:47:30 -0700 (PDT)
Received: from CW-D0XG2Q16P7-L ([2600:4041:5d54:8900:dd0a:e212:7941:39d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e30cd96sm317290185a.6.2026.08.26.15.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:47:30 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:47:11 -0400
From: Maxi Saparov <maxi.saparov@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Seth Forshee <sforshee@nvidia.com>, Serapheim Dimitropoulos <sdimitropoulos@coreweave.com>, 
	Maxi Saparov <masaparov@coreweave.com>
Subject: Re: [PATCH] firmware: arm_ffa: Unmap RxTx buffers on device shutdown
Message-ID: <ao9sWrszkXwj5-PK@CW-D0XG2Q16P7-L>
References: <20260826222337.73480-1-maxi.saparov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826222337.73480-1-maxi.saparov@gmail.com>

Apologies, I failed to spot Carol's earlier patch for the same
problem before sending this:

  https://lore.kernel.org/all/20260818224404.3694580-1-csoto@nvidia.com/

Please disregard my patch in favor of that one. It covers more than
mine does.

Some corroborating data from our side, in case it helps that patch
along. We hit this on NVIDIA GB200 systems in production diagnostics:
after a kexec from a kernel with FF-A active, the next kernel's
FFA_RXTX_MAP is denied and the driver fails to probe until a full
system reset. I can also confirm Carol's observation that unmapping
the buffers alone is not enough. The notification bitmap is retained
by the SPMC in the same way, so the cleanup has to cover both.

Happy to provide Tested-by on the next revision of Carol's patch.

Maxi
