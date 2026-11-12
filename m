Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466605;
	b=A7HkJnUEZ4qYD8mpEHybaoK83o1C34DC9d9mYmMNuz13HEpu2Z5YjkWrTrKtZKn1UMOY
	 cdHEoxh44Ionadc41XpV32r06ZNorxe8iTuGZFuv7Q8mB8r+RIGs5UfyNgzyWfepBiI+f
	 QuGmy6fg6Y56RH7ZGoJoUKRdlmXx2LBg/TmdPlYlRYVsTf8c+ptzyzarRLjUaFpIkvdcg
	 edzwhPBch5AwxQ9syBZa0jAQQXU4EjVh9tEoAGSi/ShoNiRVyKoMWiqb38QXkDAEvB0o5
	 KxiAqZS8Vcc6403+2o/oRN5tHpQMsqt/yahWG+uYgG3qb3QPyXRimKHMg7L+8eQQHsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466605;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Ix74LSl5qRLb02pi/asTcn2VdzYi6cghGTmwBn7ornk=;
	b=bhOob+TUfHeBwgu7FCx0oY8T+5sQMyViw8MBbret6Fpqmel+BCjZaKkJ2D2UopXCAG7R
	 T5cRiHjNwBsR19AqlR8NQvkTSaY0Wt/RPhr3lDQhjengF1yCFsHFRU2PAMSfVxxO9kT6k
	 qAqW1xgJvSvdQl/lWxMA1OK/wOESJfOhnaT9p53hPaIIbvQm8Qe8TBUVNb5rRsejK2DEv
	 /etgZn7LFwzoJP47urIDWQuZHKH4wnOR89GYO5YAgBfLwWeoeLq48R5Eaejp8H9NeUlTH
	 sV1FGw4u/iyuVgVXm3Fq34n5FAwpzt6NTLFaF2RnELMkmPH9TD3PRJUa+ZbLaqTwzzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMOg96us;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A060606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A060606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMOg96us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794466605; x=1826002605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8iTWUlQ4QhM12UeFeyZ/FZKti6wV6wr0cS46tNo0NpQ=;
  b=cMOg96ustU9jOosciEqrpLP4w2Udo7IObRQsJL4Z1dK9OE1jWiu/LYNM
   q+e3lVtUqvJWqTokSoQemV1V9Y49ZLg86tf2nvoMy+IGzr4TYsGczbL+H
   W0A2LmDv+hdQTiZshcLoyTYdYcUDx9Z0vvNIqdqVqTOru5nKVgofk8bZI
   IDlebYxc69l5xe4JF0ttRoEsPGJ2yEINxVbHjiHcl6qVhhPSWA0PsBdr6
   9UJ7iE11g+sJW0I+5JM5uBpsa7ciow2moCqif0nb/UGmC9ZSc8EUed3SV
   Wk9CCKcsj+/vswD1Ny/VQ6iLt7Z4lnnw97JXlnRNZx5I3GAuJ6F79gOmQ
   w==;
X-CSE-ConnectionGUID: yFdLJYQNSWaP2mYaGX6JTQ==
X-CSE-MsgGUID: rJ0LCoO1T2OnnfVvBpU2yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3275379"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3275379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 22:56:44 -0800
X-CSE-ConnectionGUID: ZBTbt0LGSpKdX4glZ/3O6A==
X-CSE-MsgGUID: 0VodtLolQEK0/fsGAxoFpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8683592"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 22:56:42 -0800
Date: Thu, 12 Nov 2026 08:56:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v1 2/4] regmap: Drop never used devm_regmap_*_free() APIs
Message-ID: <avVjKPairv4zkB4o@ashevche-desk.local>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
 <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
 <179442294226.513646.6459407661987242086.b4-review@b4>
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
In-Reply-To: <179442294226.513646.6459407661987242086.b4-review@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 11, 2026 at 06:49:02PM +0000, Mark Brown wrote:
> > devm_regmap_field_free() was introduced in 2013 and was never ever used.
> > devm_regmap_field_bulk_free() was introduced in 2020 and the same story.
> > 
> > Drop never used APIs.
> 
> I tend to think that if we have allocation functions we should have
> matching release functions, this avoids cross tree annoyances and bugs
> due to people using inappropriate release functions which actually
> exist rather than adding the ones they should use.

In general yes, but for devm_*() it makes not much sense as proven by dozens
of dropped "release/free" type of devm_*() calls in the past. Also as commit
message says for more than 10 years nobody used it even once. What does make
you think there eventually be at least a single user?

-- 
With Best Regards,
Andy Shevchenko


