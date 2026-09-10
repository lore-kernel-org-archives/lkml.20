Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9098328B7F;
	Thu, 10 Sep 2026 07:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024017; cv=none; b=Su+ICR9EicmL62Ow6kUFGGFSBkoln1xOWzmfQ56BPE87GeXMoS4UxquXszuFvzUfzYlGVD+3C+aa7xn1X1Wk8bRJS9WopIsmpJTIljE77UsxAGCWJeK/4s493j7O6ewrhYSwSsYiOuwDwA4gN3bh1FOyqk5ZJ1WI1INQxMd00zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024017; c=relaxed/simple;
	bh=4s4UqO1fBxQv9AyWmVnt50A582KPLonm1IFwa5Ve7Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/fiKx/k9inYnm5Rz7GOhBF2l5CvAm+V7CJwzHtPso7IdG4JIqYs5A8SmdAe6xln3NCXVUIfysi0fgWr8PWIai9uKnUiAU1NZyoknTjheXRUtq5Bm7wTcLK8vOjp3Qtv1ZR5Na4DUOZBsFj6RevDS7YYS5MeUSX+NL739G/giLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOJSsZwj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOJSsZwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789024015; x=1820560015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4s4UqO1fBxQv9AyWmVnt50A582KPLonm1IFwa5Ve7Cg=;
  b=FOJSsZwjPdeX5OI+58r4VrcV+Axu5cM/KvLiWGgpnvqw45DYaZEXRm1C
   BWkoRSgOR9YP6l5II/IFFTjvTueC8l41SELwGfNdKGBK1JVJAesbvqZvE
   v61c+8x1smhLM9spqhS/Atwr8+9WnQmwJidyid6g2ye6TpQ3worQL/wVI
   VJ9+qDMflA4dVErPkHtCrYm/TuVXts4RFraNmQX2BLugWs2OSIOJ+T96W
   tWWjw2PAyE8umOOVoMit1tH+S9jbsXk83KGwV8rSodwTr51BiMezUC82T
   ZiEdfdXwCyaj6xs2XHCWejAjPh1r0ItmPgP35wL8sxDBZj9iU3lL3ijx1
   Q==;
X-CSE-ConnectionGUID: UV60inUkT9C8ODJ+G5gemQ==
X-CSE-MsgGUID: 4uTC2wNQRBucRt4/gl6+pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91981881"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="91981881"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:06:52 -0700
X-CSE-ConnectionGUID: eIP53DZdRTiOObWLcz/VUQ==
X-CSE-MsgGUID: sOokH2uqSU2NMn7ZwSLm5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="301444430"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:06:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 43D83121BCD;
	Thu, 10 Sep 2026 10:06:51 +0300 (EEST)
Date: Thu, 10 Sep 2026 10:06:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Su, Jimmy" <jimmy.su@intel.com>
Cc: "Zhang, Qingwu" <qingwu.zhang@intel.com>,
	Pierre Pinon <pierre@pinon1.fr>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Vadillo, Miguel" <miguel.vadillo@intel.com>,
	"Yeh, Serin" <serin.yeh@intel.com>
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Message-ID: <aqJXC9SbhJCz2KFJ@kekkonen.localdomain>
References: <20260904134604.595685-1-pierre@pinon1.fr>
 <ap_YYNDTG7Va4MD8@kekkonen.localdomain>
 <PH3PPF7708D4D9D95D62B6929DEB21637B888B02@PH3PPF7708D4D9D.namprd11.prod.outlook.com>
 <DM4SPRMB0091FCB6C62990275CABC68F9DBF2@DM4SPRMB0091.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4SPRMB0091FCB6C62990275CABC68F9DBF2@DM4SPRMB0091.namprd11.prod.outlook.com>

Hi Jimmy,

On Thu, Sep 10, 2026 at 06:28:59AM +0000, Su, Jimmy wrote:
> Hi Sakari, 
> As I know, one of Chrome MTL project is using ov08x40 sensor. 
> It supports "3856x2416@4 lanes linear mode" & "1928x1208@ 4 lanes linear mode".
> 
> Then Linux projects support 3856x2176@ 4 lanes & 2 lanes linear mode.   
> BTW, Some Linux projects have CV solution. 
> From one CV vendor's feedback, 1928x1088 resolution only supports sHDR mode. 

But this CVS device still works in non-binned mode. Are the exact
limitations known? Is this CVS device used in other systems?

Staggered HDR isn't supported in upstream in any case.

> But our sensor driver only supports 1928x1088@linear mode. 
> It could have unexpected issue while this device has CVS board. 

One way to address this would be to set the minimum image size to some
larger, known to work size, for that CVS device in the CVS driver. This may
require changes on libcamera side, too, but that's a separate issue.

-- 
Kind regards,

Sakari Ailus
