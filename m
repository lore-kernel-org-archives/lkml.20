Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AD54FB9C2;
	Tue, 13 Oct 2026 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896127; cv=none; b=Fx5lTknvIj1yNnDV+8qIVzge0y9q5y+Bo7dOnuH/MdtcFx44Bsisw9IUOzVIPjt+lmGBNQ2YCTL4GENbPp3brvF+6hHwD1vX6Ef0VLhMmdJVWjMTjDrX56YWoppmrB2eGj0SA9LGo2SNeMv+rELDum8YrjQGghjnjR/8oygz4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896127; c=relaxed/simple;
	bh=jk+b5BO8IhARdpbzaUbNAwZq2pHMGujmhXgQQs30fck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRV/YOc04D0r6PG9EJnB4RUd4vQmy0v/hdEnTAs+ykwOR05JHHVLyIIzOLSeZbRLu0Oa0Z3oSCIJ5hACGrWnkCvfx2Sm4ky2/RWTCvmkftS/Iwqd2yySRs76sONklgNfhNFVRag4z778DM2JL8GwcB2aztOXk3oZ1kdbkUdmdbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TQGoaEmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TQGoaEmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545A71F000FF;
	Tue, 13 Oct 2026 12:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791896125;
	bh=dmROEowtB5uhyl8cra+WwXT9quaRtaXkZwjSZbUykks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQGoaEmN/o+Y/AsOfG2PLe4lnQDvy/R4k8kohUoZsRYfAHXiHtrouiQI57NUJ+mvm
	 5tNq/CIwgyyO+rXWjJFzcM0SHFWNIkS9s6HEuJpVNj8GnXd+EIFIyXFQfxpvWmQ4GT
	 lBc00tXawlA4FA5wpNYadjbuQ+1WQGAJHIkm5bok=
Date: Tue, 13 Oct 2026 14:46:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: huaweicloud <luogengkun@huaweicloud.com>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: CVE-2026-93275: perf/x86/intel/pt: Fix stop/start with no update
Message-ID: <2026101344-darn-elsewhere-8829@gregkh>
References: <2026092412-CVE-2026-93275-76ec@gregkh>
 <7cbd5c40-55e4-4db3-8175-aec9516f9ba6@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cbd5c40-55e4-4db3-8175-aec9516f9ba6@huaweicloud.com>

On Fri, Oct 09, 2026 at 04:52:22PM +0800, huaweicloud wrote:
> Dear Linux Kernel CVE Team,
> 
> I would like to request an update to the affected version for
> CVE-2026-93275.
> 
> Although the patch carries a "Fixes:" tag pointing to commit
> 52ca9ced3f707 ("perf/x86/intel/pt: Add Intel PT PMU driver"), which was
> introduced in v4.1, the commit message itself explicitly notes that
> this buggy code path is only exposed after commit 9734e25fbf5ae ("perf:
> Fix the throttle logic for a group") was merged in v6.16.
> 
> Therefore, kernel versions prior to v6.16 that do not include commit
> 9734e25fbf5ae should be considered safe and unaffected by this CVE.
> Please consider updating the CVE record to avoid widespread false
> positives in older LTS branches.
> 
> Proposed Data Amendment:
> • Vulnerability ID: CVE-2026-93275
> • Current Affected Range: From v4.1 (commit 52ca9ced3f707) up to fixed version
> • Corrected Affected Range: From v6.16 (commit 9734e25fbf5ae) up to fixed version
> 
> Thank you for your time and verification.

I've fixed this up now, thanks.  In the future, you can always just send
a patch that adds an updated .vulnerable file for the specific record
and we will be glad to take that.

thanks,

greg k-h
