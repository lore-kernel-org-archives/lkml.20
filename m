Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF542AD37
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500590; cv=none; b=KSjvn75WcneHLLOr4FwvVHzb7rOpQ9YG+d4Ega4dK+m2NcUsX9Cx+KrLRDT9TXmHkifxZlel6dYnEqrk31vl38I1GDeNxqMDXTCJR3AjuiZ936yu/PPZbFtH5jxZbZLjqtF1HgDAX/pjYMiRy4QP+lGffSXweDlu34N9dfOr5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500590; c=relaxed/simple;
	bh=WKOAdQYFmbJHqAPATl7qzYWXuN0szCi6+F+swb/3dYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVxXeYRTEoEsqv1TeH55aX3b2vXl1RUbuRaobw3IYnD7N6CawLw+bWQYccMvDCJzD2h0SgLM0euJWGoAKgK1GfSWiidmEtpXXzmkRpVnMZPYBvTBUhWh7cZdwRWb7v79jZbsXDIckMkrrjjo6ETCkujvTeH9hquv0/8B1Lem/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxvvzzw9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bxvvzzw9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38511175ad3so549729a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788500588; x=1789105388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fyaQ4vR8zK9HgI6ETSL4jxpRT+46yI+OILInPbjhckM=;
        b=Bxvvzzw9/oYjHI2POVeFHDI+04X/NkDJ69a3ZBfe5+WT8QONin2aUmcPkY4QmT+vZr
         pNZJukUA/pD8n5JiDaa87n0abIvL2g3fss+CA6lyDp9Go8r7nUpN9afrzZuM/X3ATpnY
         3PPQS/XAc3NN4sWFMoQdaK77hxZGmpgk3fsYLKorGVoWrgaAKTGdJcCV7S0WG1h3rRVb
         X8UzkYwgjKvxlFRnjcA4ikqfR1+i+JNjjmdZp+nXZNKwl2qi/TfA+tCxKgUiduJp1tO2
         jXwgI4rGfCLbTVa06KB589AlPN3+r2CmdVdvKQSAjQEKyF9t42gl9gbPZ6eM01nGKC3I
         V73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500588; x=1789105388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyaQ4vR8zK9HgI6ETSL4jxpRT+46yI+OILInPbjhckM=;
        b=CwVz1a/swlrC2Tlf1UqyTMrfjpvLn+F7+SkQBFjlui4avrVr3OIYoO/SitDNRIJi3O
         XCbPXAZD7o0ODVCViGz9B9uncAmV2JMtC/hOF//RNPMPE9nQUw5ZdKyAutlyk9EwZ3PM
         6qgElfVCL0gqWvy80MJZVVJZUB/yF5ZhYimj64hIf883FkBwcWFLwWbXY88uyx57UlcU
         1aNhpD/srKrMDyR0yPvnVaRlOEHz3pCCAzEEwcSfZ972se2YvFdGxRMKD7/eBCceTRzL
         gCyEi91p2dgFWFSs+i3mmOLYT48Vb8TAbvpk/xtsLQncfAkDN9/x8yHKcd1a0Sf7wG3v
         nn1g==
X-Forwarded-Encrypted: i=1; AKwUvBx7XOQX3ne8qSdBneWO7jPIxYm9fXpAbVcBVZTI2nbgqgTQ5DdBDZshELRjEv7WcJAOjHxbFcawdhL0hT8=@vger.kernel.org
X-Gm-Message-State: AFuF++lt/bs9/pwinTx5TgBiS16cCmkY1DrSI5BUYz8E2R2oAAKKLWPI
	w4qUipXWswzFQa9P248qpL1RUPYZndtxe+S2b3oah6joPInrZKUf9SAcmut8coJ+
X-Gm-Gg: AYBFou1IyHvD579PRkz0VAXiWL/MVXMBz2Akr3zMX4Nqk70iyn2rINKBs0CzVeVl4Kj
	Ind5isoyKqQrNWtKoN3gXD7R6/SAPv0+LbzA/Im7qfWjuQM/RjcMK0G59K8jNMGDcMrSpKcmGCA
	7i8TQ193YoA/bRCIG1hybcaTXjRQpvfAKqTyVtL8RAxcRT8zrhUKKlfUqOqSr9Jp1rojCXwkAYa
	r8DB13YGU/dFs0t4jBde3N5eoJLfG2UDaPse0WS0FXEDf0EQb/PJ/aCsSGYshSKtnNOKk1Fhnhv
	GhqwVshJW1daNFhSQbx6XdPgUEpdtEmU5yXupE5gD8roO9UhE+xvhblKwnoW9ncEimiXxgxjAMA
	MhcpFHF0aJ+LkLaxafedbprl5u2ipawYdtjIRTb4zkcWJfWgryZF+UD/OF/2T7efMZkXenuCgR6
	f+tH9yAEblch0ShT562tR28bQJWLT4jP09fMHWulmx5d8edbrhslZzfDTjxgkQsrnGM+sDCHEqN
	ULLvoFeIR2rCXLmtsbQ8+A4iJQ/EfMWH2go
X-Received: by 2002:a17:90b:4a49:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39b26100cd2mr5232253a91.2.1788500588005;
        Thu, 03 Sep 2026 22:43:08 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.52.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm2556683a91.15.2026.09.03.22.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:07 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Power9 pseries boot hang in v7.2-rc6, narrowed to
 PowerPC GENERIC_ENTRY conversion window
Message-ID: <appZ1UB1tzKz3IY9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <96dae110-f79b-4e54-8a9b-514369019b5d@linux.ibm.com>
 <e27eeaf4-c2c9-4ef7-9e1c-0a5fb45755d0@linux.ibm.com>
 <6d1b5f38-f4e4-46ca-88b4-7c18dd6c6280@linux.ibm.com>
 <anq72IebDSu-wWbb@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <ansZjSJMWMV8DDF-@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <2f7e6c34-7258-4b20-a38e-cedebccb835f@linux.ibm.com>
 <985770a7-e488-456a-a9fa-aa71f1cbafd5@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985770a7-e488-456a-a9fa-aa71f1cbafd5@leemhuis.info>

On Thu, Sep 03, 2026 at 01:22:35PM +0200, Thorsten Leemhuis wrote:
> On 8/12/26 07:16, Venkat Rao Bagalkote wrote:
> > On 11/08/26 6:16 pm, Mukesh Kumar Chaurasiya wrote:
> >> On Tue, Aug 11, 2026 at 11:37:45AM +0530, Mukesh Kumar Chaurasiya wrote:
> >>> On Mon, Aug 10, 2026 at 05:19:27PM +0530, Venkat Rao Bagalkote wrote:
> >>>> On 04/08/26 8:23 pm, Shrikanth Hegde wrote:
> >>>>> On 8/4/26 2:04 PM, Venkat Rao Bagalkote wrote:
> >>>>>>
> >>>>>> I'm seeing a boot regression on a Power9 pseries LPAR. The system
> >>>>>> hangs very early during boot after:
> >>>>>>
> >>>>>> Quiescing Open Firmware ...
> >>>>>> Booting Linux via __start() ...
> >>>>>>
> >>>>> That is strange. not sure where to look at without any logs.
> >>>>> Is it a specific config that fails or this specific LPAR that fails?
> >>>>>
> >>> Is this a specific lpar or all power9 pseries are exhibiting same
> >>> behaviour?
> > Its specific to a lpar.
> >>
> >> Can you try the below fix?
> > [...]
> >
> > I tired this fix, but issue still persists.
> This regression made it to my list of tracked regression -- and it looks
> like this stalled. Is that the case? Or was this resolved meanwhile?
> 
> Ciao, Thorsten

Hey Thorsten,
I am working on this, as of now I have a theory that the RMA size
boundry is being crossed by something and causing this thing.

For now the workaround is disabling KASAN. Can you also confirm the
same.
Can I also know the compiler version you are using?

Regards,
Mukesh
