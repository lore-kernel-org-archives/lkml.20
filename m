Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F683F329D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176323; cv=none; b=A1pJd4/UazTwpOe1Gxe+kThe6fhoRczE6Eiz32u6DGLmsy8+EHpeYUCnRy82UskeM7f5QxY4rs8A8un9stBPCQK67TCkWJAVri4xjpvDON6QvRQ0uy/dwElqGvFlzuDusLp5TC3tXzCcpcejDLdEhnIqf96zznAgoPETPfZSDBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176323; c=relaxed/simple;
	bh=GmxuKM3Dnre8HSR4Ltvylx5sp6fCdJ/dwIyDTk+Iw/s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OzlIzBtfyQEVSmmV4qnZkPJZJkJ2wmF5OUsKi/2hY7bRRBrzxWdSxZ7ZfmwBbceg1xF5IcnvKH0EABmaiE1U7YleDcKwUM9uBwEWplMufZRL6OWjQ3+i++9lE3wogUejEXI+NG13iwY5yThdR1WhTrUJ1qWmtLXkG+FPG0/YqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzSOPxnD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzSOPxnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176322; x=1819712322;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=GmxuKM3Dnre8HSR4Ltvylx5sp6fCdJ/dwIyDTk+Iw/s=;
  b=RzSOPxnD+vjMRFzygJhUp7qn9ySxl/R6VafnwwcANKbpvpettYysygjx
   4E3Ydx5w3FDL9m4apOtEWH+8jMKhKeGTQXFMAfdtM582M14vfzHk4qOWj
   Hj6ooQ1+6CdOMt9Wu0BLaLN39EAt5VpvicfeE1N2ceqxeb9JBXIGbVb11
   3s63Yvagfb/ocIZtylvlLIF9IxdR4Y0K95otdTCu2HsG4T6wRWpozCEJI
   8On3/ExTxfEo37Mp2b2ZHAX9pvLFfEPtV9bboqveFbet4tgRKfTnIa3lt
   I+TlGX0kW81T4Hd2ipDFYb4H2D7Xn4Ha2YJzQRbfs/w/5FbiPHMlPhSDF
   g==;
X-CSE-ConnectionGUID: 3oG67IN2QoK+jg2PVMqT8w==
X-CSE-MsgGUID: vnddGRetROOQmYYXDV7CXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="76129318"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="76129318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:41 -0700
X-CSE-ConnectionGUID: QemgHv+aQj+p/h29AP2w0w==
X-CSE-MsgGUID: BjMoKkyGQLi/RoVGYN6COQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262645102"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:40 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH char-misc-next 0/4] mei: csc: add and enable polling option
Date: Mon, 31 Aug 2026 14:38:30 +0300
Message-Id: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gbaCv6uIiJSUw1olVSkIN7d6
 nIWb24IJEwB2uwGoYsD7z6FzjOwy+hnQp5Sg1GmVHWh0QoPx76u7GdsjKXKNarUzkASh5Dj+N+
 6jwtuHCx6iif0z/MCZMS3YW0AAAA=
X-Change-ID: 20260831-cri_polling-92ce7f9061f2
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Menachem Adin <menachem.adin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788176320; l=935;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=GmxuKM3Dnre8HSR4Ltvylx5sp6fCdJ/dwIyDTk+Iw/s=;
 b=M7vDlS9Z+ifgVYLG3ld04uGFAmUn4iveUAoI8mF6+u+e2r68BL/eBbUPyIVVl2cUFhk3clFKp
 7jfpgrYUNkMCJWqgeInAbc6aR1c3P+f7iECWGzZ4ZGjvCCW4TriN57y
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add polling option for CSC hardware with not working interrupt line.
Enable it by default as current hardware is broken.
Fix common mei-me polling code to avoid stalls and access to
powered down hardware.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
Alexander Usyskin (4):
      mei: make polling wait interruptible
      mei: csc: add option for polling and enable it
      mei: me: avoid hw access in polling when not active
      mei: me: reduce active polling timeout to 20 ms

 drivers/misc/mei/gsc-me.c  |  2 +-
 drivers/misc/mei/hw-me.c   | 99 +++++++++++++++++++++++++++-------------------
 drivers/misc/mei/pci-csc.c | 71 +++++++++++++++++++++++++--------
 3 files changed, 115 insertions(+), 57 deletions(-)
---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260831-cri_polling-92ce7f9061f2

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

