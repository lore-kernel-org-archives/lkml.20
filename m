Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E353D1AA2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277472; cv=none; b=ZG40uPZYGNooqmavJxUSEt5LoyO/XID3+OKKN60spcKTHOBBI0RcJ3SrhnsXVET5Q9ZzOUJztGep28Ed6SlYnlanlxMa6y4XVahHDUjEVsKKJtbatcL73brwVIxK1tHdi5uqaeL9lFE+fYL6Y44ODtyjPkMiXaarZdTBewmdcCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277472; c=relaxed/simple;
	bh=TmZnIZCNgL/2xt8NVz6zX0y2W0+vT6oawMgOtfFQ+oc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LzMSS48KFmhla/KJsyVnvVO4rNiHCWtvwO8ShSV745EXyVjar7qPM/Ix0NBU0r8lo+8E/+UyojDfUkDexl/BP+tStl0R997X41nCgglTvqLL8M+v6t3pwoQVdczEBmY5fesNlgKiJVFi6fBR0J+Q5yp3UBBQEo4LVy0YpfxYhvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5tjx8gi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5tjx8gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790277467; x=1821813467;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=TmZnIZCNgL/2xt8NVz6zX0y2W0+vT6oawMgOtfFQ+oc=;
  b=A5tjx8gi1pZVYm+DlYaeEZ7ZO4EIJBP0ENRc7+cUHIXS2o+u0FNhQjTl
   cCGgmNEF1fT5RLVaYxSv+6xi/A1hc2tIL4cCWa4va6g6KfQSVEScGWCH0
   lTAgH/UUzKURkGEQqcOY8l6nb48IYS4MhF4o5e5Fk7X1GcLOodmmKf0wu
   SkiZGXnYgJM6wxXb+OYDjkizJBmhBYX2dYBM5lf+CGc4j3siQD5PyFwph
   sP+zAOSqofQ/65OvU876fAWpFvvdql4odXX7UGBf2UYNDuNMKwcgnitk3
   v3W7ywMC9t3AfIRxf8f5QALhwzSfw6O7W9QFKic4+MW3LdbMRJBfLrufj
   A==;
X-CSE-ConnectionGUID: vs1knbQERWyxql5Nz1amJQ==
X-CSE-MsgGUID: tRAoLextTWugyYu1kcgUPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93781507"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93781507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 12:17:44 -0700
X-CSE-ConnectionGUID: cN4xpfu+SeGwHmgBm05U0Q==
X-CSE-MsgGUID: q6an91LyTgq63Dp09aOrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="312034289"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2026 12:17:43 -0700
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id DB98380;
	Thu, 24 Sep 2026 21:17:41 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: =?utf-8?q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <20260921044555.90187-1-rdunlap@infradead.org>
References: <20260921044555.90187-1-rdunlap@infradead.org>
Subject: Re: [PATCH] docs: ABI: auxdisplay: use literal blocks for commands
Message-Id: <179027746188.869200.10514116524330264859.b4-ty@b4>
Date: Thu, 24 Sep 2026 21:17:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sun, 20 Sep 2026 21:45:54 -0700, Randy Dunlap wrote:
> Use literal blocks for console I/O to separate it from the
> surrounding text. Otherwise the lines run together, without any
> clear break before or after the commands.

Applied, thanks!

[1/1] docs: ABI: auxdisplay: use literal blocks for commands
      commit: f63dc0eea92d07c5bb799a406571b555cd2bbd97

Best regards,
-- 
With Best Regards,
Andy Shevchenko




