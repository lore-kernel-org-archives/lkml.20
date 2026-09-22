Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6B53A387;
	Tue, 22 Sep 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075717; cv=none; b=tOWa0lc2nl828VPh6KFcsOyYxfUb8uvdBkYsvYZyPXm9WrPmoLsWsqkGF7TepYy5cG9TC83g7SpkUa9xoCO7Y74wAmpEDN4YrVxANMQ5f/WGv0+o17y8AcP7f2+/GmcdSWxeui4FzbuVwRifVL2o8PRsLrX1sdjXpEjI6058yFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075717; c=relaxed/simple;
	bh=x5VtagHHuwEct6BbcjSyAku03EG8qanLrhuCF8ZtCxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mG/RKgdAl/h0tYh0kO8EOaCayntQ2d1Ee9Y/2z9VVtLtQ4h5dHmMIZ2JdRcIlFMfrQ7LjrwiZKErzUgS0pyW0e1/U1NNrjq00brZ8gVXjpnq6LO6Ln5ixMs2kd24Td/6MGhkvJ++uRLlotEMbVZD6QKafGgWQZeD6wp228QtYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuoPRNj/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuoPRNj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790075715; x=1821611715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5VtagHHuwEct6BbcjSyAku03EG8qanLrhuCF8ZtCxs=;
  b=QuoPRNj/jG5aLwHQCWKUkLcJR7IvtkVthLuXsn8ynq3VWS0SmuxyzsiP
   uawsItBa4rBJt7PAH8HyAUd9FLnNwT7hJ+VhMNWuPJ63ET49mrwyF7ukL
   uQ4+dPuY87Z7cXO9FS+3BVPQdMOnXoWnEtTtILj8L1YEYst4vhK4SCpkP
   MY433GQNU+H3wOam2bzocM8LDtevqxhXbAXKwztTrs1PWOrSFUjCBXZ2t
   CLilIXZsy7UKp9dD5jqWZtR9f6rT+Qq4Co635zDlmEhIfj51Q1FXP6DuB
   gWxlf+9iT4x71CmYPxeL+O3On1m7MXwJUJyeRg/k2uRRQeq4nVZjW96D3
   Q==;
X-CSE-ConnectionGUID: 1b4lx2cOQea4ea4hnGnwNQ==
X-CSE-MsgGUID: SwjRCypbSCCk89S09NLNoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90536546"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90536546"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:15:15 -0700
X-CSE-ConnectionGUID: uZepsCPQSsSIkR4XESSfYg==
X-CSE-MsgGUID: AJpNamcSS5Gj94TmixDrJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4193956"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 22 Sep 2026 04:15:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D45DF99; Tue, 22 Sep 2026 13:15:07 +0200 (CEST)
Date: Tue, 22 Sep 2026 13:15:07 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Seungjin Bae <eeodqql09@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Li Jun <jun.li@nxp.com>, Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: usb: typec: tcpm: type-mismatched PDO handling in
 tcpm_pd_build_request()
Message-ID: <arJjO3riWgdVKt0U@black.igk.intel.com>
References: <20260920212934.392398-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920212934.392398-2-eeodqql09@gmail.com>

+Badhri, and also RD and Amit

On Sun, Sep 20, 2026 at 05:29:35PM -0400, Seungjin Bae wrote:
> Hi,
> 
> I found that tcpm_pd_select_pdo() can match a source and sink PDO of
> different types. Before sending a fix, I would like to ask whether
> this type-mixed match is intended, and if not, whether you would
> prefer a same-type check in tcpm_pd_select_pdo() or explicit type
> handling in tcpm_pd_build_request().

I think a patch would have been fine. You can always mark it as RFC if
uncertain.

Thanks,

> The tcpm_pd_select_pdo() function matches a source PDO against a sink
> PDO using their voltage ranges only, without checking that the two
> PDOs are of the same type. A source PDO and a sink PDO of different
> types (e.g. a Battery source PDO and a Fixed sink PDO) can therefore
> be matched as long as their voltage ranges overlap.
> 
> tcpm_pd_build_request() then combines the matched pair with
> min_power()/min_current(), which apply the same accessor to both
> operands. pdo_max_current() and pdo_max_power() decode the same bits
> (9:0) of the PDO but scale them differently (x10 mA vs x250 mW), so
> when the matched types differ, the sink operand is decoded with the
> wrong accessor. This misreads the sink's capability and weakens the
> min() bound intended to cap the request to the sink's limit.
> 
> This type-mixed match became possible after commit 53fe0de9a35d
> ("usb: typec: tcpm: pdo matching optimization") relaxed the match to
> voltage range only; the min_power()/min_current() macros still assume
> a matched pair shares the same type.
> 
> I have not observed this on real hardware; I found it by static
> analysis.

-- 
heikki
