Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792836435;
	b=bS+9R+UN/aPbUPbpkWXsDJRZqVxox6GcJP3PWJ0lum8U3c9UoASrNZCV9dlb5R00Ol0z
	 yWnVTmNI344i6xavmxHzZLIJcVftUrHMdVirFcRDKZozVk5iDlKPuc11MKckFsbdW5Vdb
	 kIu+cy/g+JLBRJO+u5iYqDKAVeyUapk77AFvT4Tjd03eZ/RCQX+WauQ7yg4hX3S+BCPjS
	 BGtpHNgKt6bRRhKnZgXhXnFANXd2Iegfgtti3JpA8/Gra06Rr5ejRFyHcu7/LVuU87NY6
	 Im1IF+Yz4ESenomPsRvQvow7Otafgrw/9LwKvItV26s8Ryy/5PskxJRtp77tlKkEHhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792836435;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=wiysUtLk3lfEVPST58NT/imQAcUbTWAJDWvjbp8HbtA=;
	b=kJekqpNeTQu9WMVn6B4PQTVVLpis2Uy0Qv7KehzkU0BVP3ps49leoM8l+Yn4cGE1cpAR
	 vH0o2oFLWQzvVw9lBfgaFkBrxTxCM9huN/LrTGeQsVV6jv4I/w+2+LMML5aump8vEi/WI
	 BhAc6qQ+r1Xg0ThJPN74rRC0Ss9YHTyAqBViN7o0H1krIboAMeJ3xxtu+Q5PZ4ACxMGYa
	 F3YjOTlyJoTJ++qI7NOJVWS72+9OV9OBsj3immo4dvvQMNM79sIG7dfM7YlCH+bKo7o5f
	 PbxQKq8lzt+j3SPFEWII4Q/sEDLZgooSB0sgdmiJDrE4BR0aj0lUESMdQZkUVK0CkRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzRwirMB;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4882D606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4882D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzRwirMB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792836435; x=1824372435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xw2jl1jyMe1f5nKxN19T6Qbsz3XJiNKnasIRdKdxcTo=;
  b=IzRwirMB9ECgIXpbLkPj0EDIf/8IPJu7uvxPKBK/tAeug8uT9qsGKBDS
   O0loKsri+v/J8yCTPuI6MQPeY9uvlfwkfDJ6he3+eyiLQH6iBvqbrStmi
   ZIkTbg/KLLB2Y2ToE6jxMKE8r+NDwMq1t9qu9wwKJa4jjrV4h0AnSzp/1
   ipzvJ753Gx08OHzChYoH1Ts5mEQhLMaWcrb2HqSfyQc6rsmSuSDDq9kJZ
   lYCdCMgEO/PQfc/CZuXo0JROm2G4Zqb1gbCacsJcl6/F7O0BLT+bRhd9W
   Jc7CD7O8AZafTd42dqlCLjcuGQdj5Nhem3Mao+1hlG4q9pnQnSOQPQ58N
   A==;
X-CSE-ConnectionGUID: YDRGptPTSfGIupu/ZcUzeg==
X-CSE-MsgGUID: WBxAZRpGS1Spb0oZp+7u5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1465379"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1465379"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 03:07:14 -0700
X-CSE-ConnectionGUID: E3E/STo6Qmy4CYk2ai8pKw==
X-CSE-MsgGUID: X/cayD43TFSvhu/87nJSSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="5655144"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 03:07:11 -0700
Date: Sat, 24 Oct 2026 13:07:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <atyDTcu92iqtQ0h3@ashevche-desk.local>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
 <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
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
In-Reply-To: <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 23, 2026 at 06:46:24PM +0200, Sebastian Andrzej Siewior wrote:
> __sprint_symbol() is supposed to resolve the passed address to a symbol
> name. If the symbol can not be resolved it will print the actual pointer
> that was passed. The pointer policy is to not reveal actual pointer
> values.
> For post-mortem analysis the pointer in the backtrace shouldn't be
> relevant. In BUG(), WARN() and panic() related backtraces the PC
> register will contain the actual value. This affects passed pointers and
> callchain content since it is not part of the register dump.
> 
> Use %p for the hashed pointer output if the pointer has not been
> resolved.

...

> -		return sprintf(buffer, "0x%lx", address - symbol_offset);
> +		return sprintf(buffer, "0x%p", address - symbol_offset);

Hmm... Do we need a 0x here? I believe it's embedded into %p output, no?

-- 
With Best Regards,
Andy Shevchenko


