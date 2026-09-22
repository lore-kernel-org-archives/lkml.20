Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6E372ECB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051589; cv=none; b=d2a8VmA+yRPm9U1kOT2P6Ma+YLV1IwPng6+NxYIRmjPy6t4rH2MDN9aSx3uH7I4376QTi7KK1yolryE7YZo+7nU2NRiyKV5rojXXQCL/IoUOI+zUNYBjb9gFR0YW/jy45XI0tX8EC4rSBibINZuyCVTkx1+ds+DjJGaj1uvwjNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051589; c=relaxed/simple;
	bh=jOsq6u4GxP4+4otPjCoyuUQDELVcpp12xkpbUnN0QYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7CaCC3/YpC4EUhudzf9Tc/RABK8FJ9KqaeWBcEydPcG/kjjZm5hfJNb4Pf+l7e/MovsG/1p66DebGCXeCx7i6tyQi6OEd0QTJTAeFIEoBZOQrqq+JO/dscB3RCqdMpGAaA3EQIXzlCaQCJLMBKMh4+PxbC5SddvT5ebj76syoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=SwwFKotn; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="SwwFKotn"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910c9ff1fso408570385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790051586; x=1790656386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOsq6u4GxP4+4otPjCoyuUQDELVcpp12xkpbUnN0QYI=;
        b=SwwFKotnPBXyAbiOip6KsvyrvaAEbPUrIfT80hNkZjo47vt2S7zb46+DsrO824Kju8
         puzQblb2Wd8o/O/NwysSgAn5MJOykWDfo/D4/aXt2o756MdsFmrk6Nu/TEZqUeAYjumz
         MzUTkori8hd3yjHDVyWBCSicVhkOnCraKpaS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051586; x=1790656386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOsq6u4GxP4+4otPjCoyuUQDELVcpp12xkpbUnN0QYI=;
        b=RbxUI/vWhRqZv+b8dPzjL7AAW1IF8TwcjUXjGlYjGpoekmAVi/Tk2qS8OxGF8ueUDL
         GoRcxuuFitno8RmXnPjGfprMg6sd63DGbQWk90RsDMcyndiPsGcMx9HHAePDJFt2j8bv
         C7p2q6/w5GLQQNubjUx9DpBBtzKr/xEZsVTMlYyLAInGiHZB58kxTd/rRJ5YfH4mfL0n
         pbQ8pEGGEY+3xFoGFV1hb4vD/ev4tMMR9Nv0a8r/7imXNk14wKOao12SV/vptO6RrwH5
         1XG659hh4TyD8pmtMViAxFP3TDFinlvu/JCiT/DGDtWqLCoKRzSq+33T499WNAx8trH+
         3zcg==
X-Forwarded-Encrypted: i=1; AKwUvBxfo8zCcsAyM5fkZ5fRqhg6b+q8LVXur0aFIt73DS5rBiFLChdrYpuQU4IAdzug4V+EyApxTHM4MDimAIo=@vger.kernel.org
X-Gm-Message-State: AFuF++nBA8lMw2r4xhNUMTsjG3cmzmXTBR/zizXqylZ8WIYswWMVBj2T
	gYuXl3YluCeALrVOOunhmOIKSBjjDwyLGs8mz+6kkWPCn/3GYnGFkPCrHfDNO+Mn0W0=
X-Gm-Gg: AYBFou2TZAI0349xAhYJAZbg6prHLWQYegcLeYoRf6VJEzQ2Z+Gm8+V+TshJr8XlOL0
	Zx/8t/5YbsuydUfptlo+CgPP8ensGEXf0ILuyg6Rb+HHVrFIhYzUUOjeb/2m3GySIBxOOj+GeV4
	CEqMV3nu+QuACIg8Qz/q26344jfHuKz6B4ycVXI79UK3iPhaJLywYSCgNIwpFDIjgl0UxzvwZmm
	t/KhtLM2OaX9rcbMx1KRV+Im/g/+Jj463UfwlaUXxW05w7t2n9mEhxUG3GJOOL1chTCFp5qROds
	8pTa03B86xgLVI55idUKpVjkoSRPAgkinfEs92Q1K5D+tSBomYr8ITfdCtRH596UVG3GrwCxzuC
	E/r4yHEIect4016e5IR1E7rNODah4E2aRDfrBmjiSc7gwQU4kWhr4r+76qu72dJo9c1O6+etDz5
	DU7DOZHlX7ABD+ZpeA8V1IGWvx/+sNtmpxuLPTRMoSBVp+bxTBovSxqDMqb4qV1/wVU2WDZG02u
	tTlk5aETjX9hh4nlGx+IZ9ePc9O6JqJTxWzwBz2hWB9qn9tmlO6DQ==
X-Received: by 2002:a05:620a:44ca:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c15d583a0mr373213285a.2.1790051586610;
        Mon, 21 Sep 2026 21:33:06 -0700 (PDT)
Received: from com-94485 ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1cf0e6bbsm45125785a.1.2026.09.21.21.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:06 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:33:02 -0700
From: Jeff Jo <jeffjo@openai.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an
 old ACK
Message-ID: <arIE_i8Ysz5nOI2W@com-94485>
References: <20260921222609.50824-4-jeffjo@openai.com>
 <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>

On Tue, Sep 22, 2026 at 02:08:47AM +0200, Eric Dumazet wrote:
> Note: Even with existing packetdrill binaries in the wild that don't
> check TS ecr,
> tp->rx_opt.ts_recent is still directly testable in pure .pkt via PAWS
> (tcp_paws_discard()),
> the same way tcp_ts_recent_invalid_ack.pkt works:

Thanks for the feedback. I'll send a v2 series tomorrow removing the
redundant SYN_RECV check and replacing the test with a plain .pkt test
that uses PAWS for the assertion. I've verified that the revised test
detects the bug with unmodified packetdrill and passes with the
simplified kernel fix.

For the PAWS probe, I used TSval 300998 rather than 300999, since
Linux's one-tick PAWS tolerance allows the latter through.

I'll follow up with a separate packetdrill fix. How does that sound?
