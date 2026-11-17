Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922724;
	b=UQfnTPmG+n450Yj4FYr8sNyKZvQ6wxHsBk3C9PI4ZMpTt0R3vi2OnYG2tqfzVANDMbvk
	 FhF9I7apAvcOdKlSGxUD9V35TbL4My7znIZogMfyvaHNEdrzknP4vMWRlmwQLqgKp7V5W
	 nRvh1276bwshCVpqOyBznjG6Ol3FLq8vIRqNQaMKNG+ZGhhm56SgwqMRHzFp64jHGw8JN
	 R9KIJxY8Xdlc+9D72JcNKL8tpbWLJNVKE7wZQoj8Iy9avMHpzwehK2ozUQ12mfcWuI4Tx
	 iZUBZKrzidKOyyUHbqQA0i0T78iX6iiNSs4hqd8M+U4vggeTWV7o3VkE7OhRQo2tWGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922724;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0/Y3+x+ZHQOTWG7gZPw0jS+YReTvgU22AIjJFVkPiYo=;
	b=oZhG6AdH9XoSSYC1gy7qXKS48b4w/fS7DynZH6hi69NnBxljAcQHEMo19Tescr3W3pit
	 fEd3GFilTtrO7sKdl9xD3aCgRSf7sOL60odOBdaGPHRToN2EvrEMsBucaDIGeR8Vjf70s
	 pcSHVPBBInrkpulIO322mAUItwIsSv1fTOwmdLa+JIyKj1DjVvPj4+cgytyFI1F64mnJd
	 3DzfjzX7ifFsTKUgU2+yP/vN5iqYxs493rQazDWG8kfBK+CmdGte/BZZkgy9tWPMb5s8v
	 3i6ophRvBDNb36QtgY17zP2Nvamzb62T7EFhxDlAFglSbrMWqJhBvlz2md1U24/4Hjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvYszcjh;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD26F606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD26F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvYszcjh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794922724; x=1826458724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6+18ZyCod2gmg1WtLZfBTT/AgTwXyFDh9QUHLcA5O2Y=;
  b=DvYszcjhziQ0M5oV7860zOK5IbkrfdU1bvQgB3aV2sesQk8RlrKeuk1u
   5zCb92u7FT4KNl0YzAcGG5KRdq78EIUNqHoYTZ/OHRQePcy8k9098wFY4
   AkDKh+hQjQxdZAW79bETzTpVj/8pBOKAp6wsWxTWnCa+kpRFBgpPozCxQ
   yc+a/aGcaMC6aZ4TGHOMxLVcatrPfq5NR7kiGNjXG5JTCJB8vFm4MlF5b
   J9nfxjBSFs33HMJyZMYoOkgXqO52vRootvyC45JqobS0rMNUBVGkjgkhq
   fGtbqBE2o1Uf7e87yZhORUSnBzsMWyiKVWH2kn6KJ8C5GWkYRLU37Y6bD
   w==;
X-CSE-ConnectionGUID: rpz6H4H9SIiy1cjuDyTGwg==
X-CSE-MsgGUID: s04fo8nOQzaZeJtKCktiUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3682068"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3682068"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:38:43 -0800
X-CSE-ConnectionGUID: TWpu5+0ARqiCsTt/bmZLnw==
X-CSE-MsgGUID: UWw9D1tITdiuh7318trnKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10233633"
Received: from weba0534.iind.intel.com ([10.66.226.131])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2026 05:38:42 -0800
From: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	jeff.johnson@oss.qualcomm.com,
	Sai Teja Aluvala <aluvala.sai.teja@intel.com>
Subject: [PATCH v1] mailmap: update email address for Sai Teja Aluvala
Date: Tue, 17 Nov 2026 19:00:08 +0530
Message-ID: <20261117133008.2560155-1-aluvala.sai.teja@intel.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Map my former Qualcomm email address to my current Intel email address.

Signed-off-by: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index bb8cd0c84747..c3679c76517e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -828,6 +828,7 @@ Rui Saraiva <rmps@joel.ist.utl.pt>
 Sachin Mokashi <sachin.mokashi@intel.com> <sachinx.mokashi@intel.com>
 Sachin P Sant <ssant@in.ibm.com>
 Sai Prakash Ranjan <quic_saipraka@quicinc.com> <saiprakash.ranjan@codeaurora.org>
+Sai Teja Aluvala <aluvala.sai.teja@intel.com> <quic_saluvala@quicinc.com>
 Sakari Ailus <sakari.ailus@linux.intel.com> <sakari.ailus@iki.fi>
 Sam Protsenko <semen.protsenko@linaro.org>
 Sam Protsenko <semen.protsenko@linaro.org> <semen.protsenko@globallogic.com>
-- 
2.53.0

