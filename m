Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591770;
	b=mqv4uSovjN+oDoa3EIRIFhbk2iVAron4fAjONgkFrjIDShP9WqQwvyMAEcfpLVNTE88N
	 JN07OVvP1B4Ep4fpnQLs8NbhBUt3QJyEi7p+IJWvoRuPiXUd9MJASyvRfmT0r+UZKv8+J
	 YHBZGS+Eqg7ZbJW3mgE0grh6YkqMHuAiVOgow00B9xcjwQCDHKJSIFcRIXZQGrKZYmLxX
	 5UZF/jA+uqsebWvlq6OODDSb+A1COKlGIZV9dXsGXrdoWm3pIEHkr0IqJGHvkLV4F8ZTD
	 LTtoMrQ6Bbghp5clgqV1pNZrGpMS7PXsaR+EH4qQzY1nzh5968v/u8wiMXlRTqzOc1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591770;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jV+E5hgrLfXv6Faf4pDdJ1s/g+vMPTmOhUFdOw/h8JU=;
	b=RHlg+Lr1N+QJEiydVT2jzl6z1751Vp5UcNMCJqmOFLkewLqFmFS4lbsdncd+cEVCy62x
	 8FAtC4sFEHTAv4hatuiz43HtMEhXPd9YmMwkjWFp5mAGVEZvqLwkyYO58ne9sIJE7ZWhr
	 Cc67DMkAG/2uA0lIKV5jk+6F5b1Qk8Gqh/4CQCC5o7iN6P9z6ASA/tA8OK+3ZSrym+1Tq
	 rAGS5uWTS5XqZl28Rh1sWBHwuCoFBSZ+yeZy9vBbAoMPGOpH3LzK0t8lv8RmGDL80fOmY
	 3TWvs2u3PTJ9MAdxddmizk6SeYxnBfagW4Q/DBw8eehgYJNQdFNR8J4lPWxFAaGyS/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nRyNP+mU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710F7606A31D;
	Wed, 21 Oct 2026 14:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710F7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nRyNP+mU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 874E016F8;
	Wed, 21 Oct 2026 07:09:25 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53AB33F7D8;
	Wed, 21 Oct 2026 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792591768; bh=0d2Lro54I4BgAUW59sSpcEpUuaxJGf2RyvXWi+lI4fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRyNP+mUggYQKcCkq7L7Ggl76eA8AkUSgZbNIhdt/vkhChAIAfxtCBg4rW7Pql1QS
	 PPHfklJdT5Wo+KLQ0fSXPvyJQS6i8z4vLaKVZ6gYYbU7yrlBVTylpzE+A6MmdEVVPG
	 ezKv9kcDnr0c9hNyIwZPV15SYmzRFyRsu1FADpXQ=
Date: Wed, 21 Oct 2026 15:09:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] coresight: syscfg: Fail to enable a configuration
 not loaded on the device
Message-ID: <20261021140926.GG26205@e132581.arm.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-2-aaupov@fb.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012230527.750567-2-aaupov@fb.com>

On Mon, Oct 12, 2026 at 04:05:20PM -0700, Amir Ayupov wrote:
> cscfg_csdev_enable_active_config() looks up the selected configuration in
> the device's loaded configurations, and returns success when it is not
> there. A configuration is only loaded on devices that match at least one
> of its features, so a perf session or sysfs enable that selects it on any
> other device runs without the configuration, with no error.
> 
> Return -EINVAL instead, so enabling the source fails on that device. The
> function is only called with a non-zero configuration hash, so sources
> enabled without a configuration are unaffected.
> 
> Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>
