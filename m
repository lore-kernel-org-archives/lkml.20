Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552B3B3BFC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030338; cv=none; b=Svtg4+3IM1FzeUy4pzITKghILkdcxRYeY/UDEJumE9R3XNUZrZ26ki6OWxKwrqYIQj0GaAwmAG2HBHjuz4ppUaGlPk+CTOpOl9sSEstgFBhI0yY7J/DBXvUGEkMwpEo1p/D0MaJNBSqNoOLdeEJTxm5Fv9M0S/r/HFhqreiNue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030338; c=relaxed/simple;
	bh=WoflgdutCHX+75m/8u4RqTEViaYItTF1x/KEbFMWUDk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=slC34zebeQIP3DG0VFiJvdSwW+FixzHmaKYI9E5iBnWXGSK9UZJA52LlP7hRAalDupWkNZvtzsIwXq+bqB/VVTSPrMkbb4wqOQp1OlM4uoKd9MCx4+vujhXRvX7OpdrWKa2uWtk2HzitKjG+GygQ09cwADkNabIz3E5EVHzb5Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=anJHCpp9; arc=none smtp.client-ip=95.215.58.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="anJHCpp9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WoflgdutCHX+75m/8u4RqTEViaYItTF1x/KEbFMWUDk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792030332; v=1; x=1792635132;
 b=anJHCpp9AormFyhTpIgBPCBgDUBQTPwHY00sub3Mn0GzAHgGLalCsbOWJEtxqpJ3309YkoOg
 RIvt8wgCmEdmSHC3BEAKSiy7eI80/jDHFSI/RnwjRPxLCEL7aYxjYzgkV7Nkbq15GfP4SyERvgN
 cKfKqqTtSHTCGIjCDQlliRh4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7aab8d1b515bf6fe;
	Thu, 15 Oct 2026 02:12:12 +0000
X-Mizu-Trace-ID: 7aab8d1b515bf6fe
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/2] mm: memcontrol: remove mod_memcg_page_state()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261014-memcg-unused-page-helpers-v1-1-240b37c53831@columbia.edu>
Date: Thu, 15 Oct 2026 10:11:21 +0800
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <B55F574A-498B-4E97-8CE0-CA975A23A5EC@linux.dev>
References: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
 <20261014-memcg-unused-page-helpers-v1-1-240b37c53831@columbia.edu>
To: Tal Zussman <tz2294@columbia.edu>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 15, 2026, at 01:08, Tal Zussman <tz2294@columbia.edu> wrote:
> 
> The last caller was removed in commit c466412c73c3 ("mm: memcontrol:
> switch to native NR_VMALLOC vmstat counter"). Remove it.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

