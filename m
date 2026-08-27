Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A53AFCE1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872371; cv=none; b=MNvFUtDO0j51i5jm8xmgCecEeWL9RL1uCvMOkOsbS/KNqScE7Unl7iq4bCBJdznmVcO/YSY70vLqFe8hZnX6yBOg6KWmlejf4saPvfDFkZ4q8+l32YaP+yUUaJY3dmjGICaWU9x0jmC5Gp0McazRj1VI853TNNrOp6Dosbk9AGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872371; c=relaxed/simple;
	bh=W/VboFtsniwlT13CzTXqyyKAo6bLiMCk0pQp6dNAoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAVjEUGaGTr/vt0GN2IZut/sz+uuiSm5ScaouOwgeaBLHT0g4GjhDarvan1+1UNg2awoGErBL4PAQqSLpNB6PcV3fuw7uiiGjPMb/hvkDaHccPkMsmjbTwpAbnFKfwX5ogQcIKKEOwwlS35TUK7UG05n7pSOsEeFSMUz7TQ4cEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=buVTuGqq; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="buVTuGqq"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so210653a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787872369; x=1788477169; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owiJggVEjqcjWE0DQ/s7zqsjd4JZVI2c130pUmNZmGw=;
        b=buVTuGqqD47M3f4PAj6OgpHPxdbihT5s/5hK1VWsyxLTmynWwOzbsNBTFhFF/2qytx
         +e1pZxOkuKAPI32nBX5rlyFQf1jRTdQ1LWz1tWJMNC9bVML4yg4a7HdndvDimhmhgAN7
         aASBsn69NJiuJu87GwKQpc1PR1TE/LH9DtvePRC3Wpz7rPB85HCQpAb3gzMAwvtoqlwb
         2g6QrdCmkv7F0DUWwFR6C4hiGRTYFeeNKPJtbz39jwKtno5Pd3207JdvRmtP0jxYVjoL
         BeOKNjOOsFzmOe2zicucdxR5wphaV/hzb2wNoVJZRsOQxxfBMM5c4Is6hPrPXh2ajMWd
         FCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872369; x=1788477169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=owiJggVEjqcjWE0DQ/s7zqsjd4JZVI2c130pUmNZmGw=;
        b=mesvcUm9SRJDRBqWAnfMwXbm8PtxjCCBewo1XRoxiZkTNLg36JnUmTZ9dZSw36fwgB
         6e2ufDkV6uxfIRCNFsjeIXnNnmBowbTS/6wh6QoZEAsxKci/CT/AkRL8NgHOViG43BG/
         /f2dgfJmpMTa6uBtyp9zsDRzrnG7nVPN3m0XCKiLwaST/HV/9m07CahdXfLiTABbTL8f
         E7fYm79XLwJOE0CajkBKYvuFS1tl9kwrVfmaL93X9w3e6fI9QdA7b4vMvRjOYD1lb/yU
         /kKcJIXRI4SeGKlJGhFV5WvD0zgrEH2v5RYhLha/Oze1nrjgeCVDPwAqg126D0S9fhmN
         CzTA==
X-Forwarded-Encrypted: i=1; AHgh+RrlDbS7/HiOBIIkJXLo7yo1zA1CWbXV+u+VNVJk1nu8JnLZ7hdTRkPZSa+KtCDq7UfVKTR6q5+RyBMa5tI=@vger.kernel.org
X-Gm-Message-State: AFuF++kKEdoxX8m813oP5EtDMANZPqMKH4SrOVw37s1paYYzGBHqN1Df
	NpkLtlivNXZUHFV9d5yuELswksid7SXhJtpxfKKuKBainfcijLqNKfOBkPvay2yrMEQ=
X-Gm-Gg: AR+sD11SDGfjw4hbbENKcC3GLF6v8/HTXHCt3BwSUkBjTxvFIuq0IB2+PJGv5m7Y3la
	1J0Wpnzw8rd47pYF77JA2B8ZAvOm/s+7wZv8t+F+oRn5mg9W6ZoTXiv3qfSS8PKAC9KdgqWt7cN
	dsn+gNL2qXR4kkOz+vNHuDzZxra+JLHGDp0QdSXVxeB55FsmbhdDFqMxTEBK638x98I3Z6Tjoya
	mRDClSrOdpxvmmyhQsysFwCD2GGj/rS91PK2sVmbnVmZdBEW0jOJp1tz2KdREMKZ/RKdSu5BEdB
	IoUok9f8fF3jQ15NNidA9/f462E3xeap7AVWhJbnaXbd4XTS0t5fDeh8mmWDm4B6HK0ESbA62s5
	iHzl4dyl+PwImlVeYS5ctnFyoRnjO82Mn5nXHrvuejEwPoow9szA9d7E7E3KRxvC4HB6tHzzFfS
	7Cey3d7DKy7V70ktdYUneaZn/pjE+ymxuxicnh9ziRu/Y=
X-Received: by 2002:a17:90b:380a:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-396d0daf810mr4835678a91.5.1787872368810;
        Thu, 27 Aug 2026 16:12:48 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d3c9e4sm4598254a91.2.2026.08.27.16.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:12:48 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:12:47 -0700
From: Joe Damato <joe@dama.to>
To: Michael Chan <michael.chan@broadcom.com>
Cc: netdev@vger.kernel.org, Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Colin Winegarden <colin.winegarden@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, horms@kernel.org,
	linux-kernel@vger.kernel.org, raphaelcf@meta.com,
	stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v3] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apDEb/LIqcrI9LoV@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Colin Winegarden <colin.winegarden@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, horms@kernel.org,
	linux-kernel@vger.kernel.org, raphaelcf@meta.com,
	stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260827185700.2157164-1-joe@dama.to>
 <CACKFLikJiCdjej4ezF=U16Leef3oAjSZGQAyetRnF=nLRvUfZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLikJiCdjej4ezF=U16Leef3oAjSZGQAyetRnF=nLRvUfZA@mail.gmail.com>

On Thu, Aug 27, 2026 at 04:07:16PM -0700, Michael Chan wrote:
> On Thu, Aug 27, 2026 at 11:57 AM Joe Damato <joe@dama.to> wrote:
> 
> > @@ -3831,6 +3834,7 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
> >         int i, rc;
> >
> >         bp->max_tpa = MAX_TPA;
> > +       bp->max_tpa_roundup_size = MAX_TPA;
> 
> This is strictly not needed.  If we return early below, it means the
> chip does not support TPA at all.  We skip allocating the TPA array
> for every ring, so it really makes no difference.
> 
> BNXT_SUPPORTS_TPA() will be false if we return early.  LRO and HW_GRO
> will not be supported.  So I would say it's a false positive from
> Sashiko.  Thanks.

I see, OK.

I suppose that means I'll have to resubmit the v2 over again in 24hr?
