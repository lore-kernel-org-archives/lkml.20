Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538743CE65
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309960; cv=none; b=l5M++2SSc4ZLOuOxyFAz+FlLLwta3Wgl5/2JxVIWp/L5BEKNPnHTY72iPfozhpjMmSYQsB3VcS1of30AP9V3v8m9wwmsegm6b9XkCflMTZGQthueS121JXd7UD1vb0Kp9wGiEkpWH6/p8ahMEUyWyQuv1gGW7c+dU9wTG/Rh0uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309960; c=relaxed/simple;
	bh=OKJgmjKos8BeQqOvQHHZfy/Qo2rKCnOBeIDaMRkegwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bJrQKO/HgIzD2tbX0PQSorUh95AOlL7eSZvHKAaD0dHS4KcHa23Yq7f773myNLEjDY6+/nJfX5n3zeam37FGN72ViXXnkTzZGpUfEPaI/1jEz03M6YHQNa+qCtO0v4XOh0UU59I1RDNqbnFG6i0qORcz/8DONCKxa3LtRTPIS2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV7IffEr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV7IffEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309959; x=1823845959;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OKJgmjKos8BeQqOvQHHZfy/Qo2rKCnOBeIDaMRkegwo=;
  b=hV7IffErCF0gYb9kbrgtvb6UdxPzDcg/+I14b7qKAoTzTMWNv4iA/jVt
   7RQS8Ra9rxwsooFi4oewDRuicv7v1KP5/Jy0XLPj/BGrJbAB4eJ7WnGBY
   KQPKL+dTaBNow6l8bEoW4IkuuwXvOjXb5AxkyvUax3m4EN08Civ4g101Q
   5tHKE1z8dOfBuSx/6RalGFkB4sQPGqz/yxvv4vw/W7qxSmL7/tL9+DvxU
   oRlgxOAzZAWCiXXaqxut1fvPKfHQCcsYVEcLRHdssU/e0dTBl0EcNVOb0
   LLL8ng5/z+xqUcAtxGlJR+XqUdGLX+faPdI9ie60n65eHuLv9NmSNtLXO
   w==;
X-CSE-ConnectionGUID: qL8EwdzFQxGqTPzTZWV3Gw==
X-CSE-MsgGUID: wj/l2+A5QpKfTPxha19ZMA==
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908863"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908863"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:37 -0700
X-CSE-ConnectionGUID: RpvKxAz2RS699rYscI3d3A==
X-CSE-MsgGUID: wyjdF1C2RgKYlE+wycO1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115558"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xi-1iCR;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:46:01 +0200
From: kernel test robot <lkp@intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: [tip:sched/core 35/37] ld.lld: error: relocation refers to a
 symbol in a discarded section: __UNIQUE_ID_addressable_overflowuid_553
Message-ID: <202610170544.6hPndDUW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64

dHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
aXAvdGlwLmdpdCBzY2hlZC9jb3JlCmhlYWQ6ICAgYjk5YjdmNjBjNWI0NzNkMzc0YzY4YjUzNzUz
MTUzYjRhYTllMDcwMgpjb21taXQ6IGZjY2ViN2RhOTQ2NTk2OTVkNmNiYTk3MTkwZTE4ZTg3ZDlj
Y2U4MmMgWzM1LzM3XSBzY2hlZC9jYWNoZTogQXZvaWQgcHVibGlzaGluZyBwYXJ0aWFsIExMQyB1
dGlsaXphdGlvbgpjb25maWc6IHJpc2N2LXJhbmRjb25maWctMjAwMC0yMDI2MTAxNiAoaHR0cHM6
Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjYxMDE3LzIwMjYxMDE3MDU0NC42
aFBuZERVVy1sa3BAaW50ZWwuY29tL2NvbmZpZykKY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMjQu
MC4wZ2l0IChodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgOGE2Nzk0NjRmMTlj
NDI2ZWY3NmFhZDlmNDU4N2I3MDNkZDNlNTg0ZCkKcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1
aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI2MTAxNy8y
MDI2MTAxNzA1NDQuNmhQbmREVVctbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpCgpJZiB5b3UgZml4
IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5l
dyB2ZXJzaW9uIG9mCnRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZ3MKfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cnwg
Q2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjYxMDE3MDU0
NC42aFBuZERVVy1sa3BAaW50ZWwuY29tLwoKQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQg
YnkgPj4pOgoKPj4gbGQubGxkOiBlcnJvcjogcmVsb2NhdGlvbiByZWZlcnMgdG8gYSBzeW1ib2wg
aW4gYSBkaXNjYXJkZWQgc2VjdGlvbjogX19VTklRVUVfSURfYWRkcmVzc2FibGVfb3ZlcmZsb3d1
aWRfNTUzCiAgID4+PiBkZWZpbmVkIGluIHZtbGludXgubwogICA+Pj4gcmVmZXJlbmNlZCBieSAE
BRQD0gQIrAUGBkoFCQYDAwk6MjM3MTkKICAgPj4+ICAgICAgICAgICAgICAgdm1saW51eC5vOihs
dGMyNjY0X2RhY19jb2RlX3dyaXRlKQoKLS0KMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQpo
dHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL3dpa2kK
