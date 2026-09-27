Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685F2931C0;
	Sun, 27 Sep 2026 05:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790488801; cv=none; b=i8uoibDfXSl00EZ/qx9vE8lf7eq6+5UkifFsXs8oPG1zxXA4dgNbjy2K/8bwWjSVcy79TQr6xMbUPpuGV1Ogq6LX6u4Z0/ZskcoblSoZsVBKZAOrkfm/u3RkD6a1AvML++MXepQaQt50xgwT+GhuUQp1RPstZU9tq5OFaA1CRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790488801; c=relaxed/simple;
	bh=dFrMRTaM50w6MUSwIBo5810D1BGxuc88L4LqmAIJ6L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOvb14EYKjDcxxURIXi242uTTm9nhzJkHsqawcv5y2X8KkVIP0zVGgG/XZ6GZGghxH0//R6hrKu7FN0hTXG0RNXquBXH1t/vx5h4pMt9A188D0jn6Nb28brGnzg2GHk6F9Rh4FiA187+N6kITRGjGnsFFHtfo4kqWT9TrwRW/60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZE7H6T+h; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE7H6T+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790488799; x=1822024799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dFrMRTaM50w6MUSwIBo5810D1BGxuc88L4LqmAIJ6L4=;
  b=ZE7H6T+hT/v6kN2JrH1LeHoEL/ppDgGGdNbNtn7xAkKine+9lbvKjbGa
   72fSUieymDDp14HFiLLeJZASducYZaEHwQsThp8BpTdh/KnEqLbq1tEl+
   fLA495K2h4AluPzVRFvp0jVxqIrDVZqVJ7ju7lZIjh6NaVgcPXcmGHPkp
   7sxZsUV9CewkjZ8kqJxWX88r1t+lS6hGq/GUmRp7jelvDXQyC/MGl4zA3
   JsyWithxkYZ9DUfniBrCWswBDdMU/WkPMete9I6zMvZUUiiXOYg1oBNbc
   ECwLE60tlBSG5eE34+qjaUJc6RYjkMrkAbpU+ahpKy7vIAPxn3x6yRPj5
   Q==;
X-CSE-ConnectionGUID: QQ9sITOST3W560eBA4ISxg==
X-CSE-MsgGUID: lGZxISUcQbaxO7oHedniHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="91318916"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="91318916"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 22:59:58 -0700
X-CSE-ConnectionGUID: +dPMM4q4Tty31MYDW9Lmvw==
X-CSE-MsgGUID: 2EWn7My+TXKhut47WgceXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274796968"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.231])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 22:59:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CA832121182;
	Sun, 27 Sep 2026 08:59:55 +0300 (EEST)
Date: Sun, 27 Sep 2026 08:59:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Message-ID: <ariw2_Eepxeu73Hc@kekkonen.localdomain>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
 <arfW_sncBRNsyP4L@kekkonen.localdomain>
 <81dbeb60-2531-4a1e-ba04-2add8e819e0a@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81dbeb60-2531-4a1e-ba04-2add8e819e0a@ti.com>

On Sun, Sep 27, 2026 at 10:38:06AM +0530, Rishikesh Donadkar wrote:
> > Can the sensor output Bayer pattern as well?
> 
> No, the sensor give only gives out RGB+Ir where the CFA is a 4x4 repetition
> of B,G,R and Ir.

There are some other Omnivision sensors that can't, AFAIR ov5678 is one of
those as well. These two will still need to wait until we have the common
raw sensor model patches in (they're in the set). See
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=a6ea06f3d920f93bece27053e1193a483bcaf4af>.

-- 
Sakari Ailus
