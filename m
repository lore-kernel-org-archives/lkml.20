Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C265042047A;
	Wed,  2 Sep 2026 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353417; cv=none; b=HrHEWY7GIsZonVjNZ3ssft78p7lI3TRK+He+lj8J8sRXelmt7MrwOmoDzH6cAsQJ0KT3E2qOfEkn95G9GhWPILKBDSA0ahJYnVI/4km/yLIUccfbD9Hx+glaXlhAyzlxcHauoveEz/VXmPA0pmhgnuV4MbWEh4x0/COtp2HFuKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353417; c=relaxed/simple;
	bh=bC0So/oGIBlgYzSeGTNd+FFWlDFdHeQ0H9V+bZH1hKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhFLLk/+oOtRuB+8aaJZ56IEPhHFiWF+ycTW3w4K0XdZM15HnS80NNsUtXfnC3MRhOa8Vh1cearRk68r9VO5fQnjCEMbvcQPiSrTbbQIPT/rurxGOdp9aZBdmcz/LD9S/pHq+1aidJikapFL+6M1VaN4UE13B2ify9nBLeQ91cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNRtiETn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNRtiETn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788353415; x=1819889415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bC0So/oGIBlgYzSeGTNd+FFWlDFdHeQ0H9V+bZH1hKg=;
  b=NNRtiETnvM6FpYvW4yLH3cR20BkDQHmvTnub6zU3RKExZXD3M0CMicSP
   Ui+S6FZs3ybVaCWFqwH22RSlArykloaHkuvaLyp5qygnw+jMv4xX8oqn7
   hTfcoB4CxxLk1dAFBAzR6bXJqoAZcexNI9G+IWYJjlTRjLcsQa5q9hQUH
   HpLPwY50+y4SC2i836mv8SiCE930z6m/yEJyCx0kytc43Q58FUXP0Ndva
   nvAnQzKQbX+3a1iR6ecldbpCEzpHlfXj1Ng0yJ/3BasmOK2o1kfW2mkdZ
   ICKZG95liCrXUPgxK4dBdtvzkE3VhqdcK+SNTANTYB3TKvUj2/ZnBoDOR
   A==;
X-CSE-ConnectionGUID: iabjv0p1TPKiownPXSA76w==
X-CSE-MsgGUID: TyCvUwelQpG9b0SXwjkcfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88830465"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88830465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:50:14 -0700
X-CSE-ConnectionGUID: FctDod33QHGNPm3zDn42yQ==
X-CSE-MsgGUID: gwcjabbfSvGIgHiUUlEswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269966976"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2026 05:50:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D597C99; Wed, 02 Sep 2026 14:50:10 +0200 (CEST)
Date: Wed, 2 Sep 2026 14:50:10 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andrei Rusu de Castro <arc@empyreal.works>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com, Sanath.S@amd.com, Basavaraj.Natikar@amd.com,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 1/2] thunderbolt: Do not warn when a reset clears ring
 interrupts
Message-ID: <20260902125010.GK106095@black.igk.intel.com>
References: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
 <20260902-thunderbolt-1-c48cd6e7@empyreal.works>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902-thunderbolt-1-c48cd6e7@empyreal.works>

+Mario

Hi,

On Wed, Sep 02, 2026 at 12:34:13PM +0000, Andrei Rusu de Castro wrote:
> The AMD DMA-teardown quirk resets the host interface before USB4NET
> stops its service rings. The reset clears ring interrupt bits while the
> rings remain logically running. When tb_ring_stop() later disables the
> interrupt, the register update is a no-op and emits a dev_WARN() splat.

Yes it should not do that. It's too "big hammer" and we should avoid that
if possible. There is also the deadlock that resulted this series:

https://lore.kernel.org/linux-usb/20260825214237.4179813-1-juan.martinez@amd.com/

But that still kills the whole host interface if there are other users,
like USB4STREAM using the rings at the same time. I suggested that we do
the reset when the rings are idle and while they are not and we have spare
rings we hand off those instead:

https://lore.kernel.org/linux-usb/20260902054800.GI106095@black.igk.intel.com/

We still need confirmation from AMD if this even solves the problem or is
it hanging the whole host interface and not just a single ring.

> The path teardown order is required. Stopping a ring first clears its
> descriptor base and unmaps its frame buffers, so pending path traffic
> can no longer drain and some host routers never clear their pending bit.
> 
> Keep the warning for genuine software-state drift. Increment a host
> interface generation after each eligible reset and sample it when an
> interrupt-backed ring starts. Excuse a redundant disable only when that
> ring crossed a reset. Duplicate enables, duplicate disables without a
> reset, rings started after a reset, ineligible resets, and double
> software stops retain their existing warnings.
> 
> The generation sample precedes interrupt enable while holding the NHI
> lock. A reset racing with ring start is therefore observed as newer than
> the sample and attributed to that ring.
> 
> Source and call-graph analysis identified the reset and
> ring-teardown ordering. The change was compile-tested; KUnit coverage is
> added separately. It has not run on affected peer-host XDomain hardware
> because the attached USB4 device is a hub and does not form that path.

This looks pretty much like LLM generated so if that's the case you should
add proper assisted-by.

Anyways I don't think we want to do this just yet if we can avoid resetting
the host interace behind everyones back.
