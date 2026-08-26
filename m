Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D33B058E;
	Wed, 26 Aug 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775185; cv=none; b=dM5rIS1i1mnWMgIPElSBMlTzV1gH8iZygRyHzYOas97RTM8A73Lz6jmMHrjUq2Jj7vusMtkOOj2zFWwcSKQehJ+mYPj1HeBIAUmyZmr89+RQ0Zyeza8FYO8nVSmU2JI+3DfgALOQrs6jdTEvtRSgy5RC/B/wLmrixmt8vRE+N6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775185; c=relaxed/simple;
	bh=LDMs7gSle0lyiqX72kem48vDFieKIgrgVU1BTFLr9Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFY8FbcR8EbSgrYvbYWLHvv3d451fyEbdek2n9IV8ums3cvIKIyaMEIltqQyYUerEJEO3dVlWHWNO5GKj628fsyMEHUsUB9ocdIODuOzRwMcZ68QHyWaxFDAWjs9JUGlxWeIOBazEegeLNVJVIgt3WmdVBQUCVwJEoF/TWuk7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWa2eaT3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWa2eaT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787775183; x=1819311183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LDMs7gSle0lyiqX72kem48vDFieKIgrgVU1BTFLr9Fs=;
  b=kWa2eaT3t0XxkrJqMBavcqGbpnsdLgl3bXqd5PwF9zJPTK8KJQ5cAiLu
   cgeaFcFHcC7vhxwgw3dfLCU4FntvWbSqCB/ZIu6Jtke0S9PwfWTvG2CFt
   Zz4Q3o5EkEqn2wefwK7hWGAMehx9mqEj3GEmeNpbxzicNROqSgSgZSEkf
   ZIKdc9YBJ9f/rw9jRCzpFQM7CbS47YWc9KTwLJMqYMGyYjJwBs520YoN1
   VT6auOtNToON7A419bJar45jN0NiYGSBHd6ygoA9NNspLsmVFFa1hACJ3
   RBxBP+d6HhucIwD9/Z7U1nIApm1oEKPN8wC8qNTCFR4incbUUoi0+pTQB
   g==;
X-CSE-ConnectionGUID: EFWjAWzcQs625HwwOaUWNA==
X-CSE-MsgGUID: d16QtXL1TLKi0IUabglrIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87209967"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="87209967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 13:13:01 -0700
X-CSE-ConnectionGUID: +xVZBjtEQQKh96mnxngFvA==
X-CSE-MsgGUID: mH4Qdk5gT/+/zUNjSOJjKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="291194289"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.97])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 13:12:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1217A11F82E;
	Wed, 26 Aug 2026 23:13:11 +0300 (EEST)
Date: Wed, 26 Aug 2026 23:13:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: Alexander Martinz <amartinz@shiftphones.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: dongwoon,dw9714:
 Document DW9714A and V variant
Message-ID: <ao9I1jtPJZKj6C0J@kekkonen.localdomain>
References: <20260803-dw9714v-v3-0-8e10278dcd0d@ixit.cz>
 <20260803-dw9714v-v3-1-8e10278dcd0d@ixit.cz>
 <anmcEvEwld-ZV9WE@kekkonen.localdomain>
 <de220aa4-2bf1-4cf3-8d59-904fefa7e815@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de220aa4-2bf1-4cf3-8d59-904fefa7e815@ixit.cz>

Hi David,

On Mon, Aug 10, 2026 at 12:24:58PM +0200, David Heidelberg wrote:
> On 10/08/2026 11:38, Sakari Ailus wrote:
> > Hi David,
> > 
> > On Mon, Aug 03, 2026 at 11:50:25AM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > DW9714A is successor of DW9714 and DW9714V is successor of the DW9714A.
> > > 
> > > All actuators are backward compatible, but they do introduce new features,
> > > such as Smart Actuator Control (SAC) mode which can minimize the
> > > mechanical vibration and achieve very fast mechanical settling time.
> > > Support for SAC can be implemented in the future.
> > 
> > What kind of configuration does SAC require? Such things generally aren't
> > configured from the userspace, compare e.g. with the dw9719 bindings
> > discussion.
> 
> I don't have extra deep insight (except basic how the sensor works).
> 
> By default all dw9714* sensors starts in the default "legacy" mode.
> 
> The clanker after looking at datasheets and kernel struct produced, if it
> make sense:
> 
> the mode and the vibration period (SAC_CFG/PRESC/SACT) have to match
> the mechanical tVIB of the actuator and lens assembly of the given camera
> module, the same way dongwoon,aac-mode/aac-timing/clock-presc do for
> dongwoon,dw9768 and dongwoon,sac-mode/vcm-prescale for dongwoon,dw9719.
> Those properties are left out until there is driver support and measured
> values; note the DW9714V mode set differs from DW9719's, so its enum cannot
> be reused as is.

I guess this is fine, but without the configuration there's not much
benefit knowing the VCM is actually a bit more sophisticated one.

-- 
Regards,

Sakari Ailus
