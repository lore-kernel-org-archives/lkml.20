Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B803D8121
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859048; cv=none; b=mZy+rl0x/1btcFH1UVivE1TbufybZYkmwHVudyD34outLV6pxTSvDQ1MEgHPl4w7cbDiuqqMvE8cZsQApfzq6NJLk2xKAb/Zeu4rsAySfn7wsnwP+3AWwojkNpFqATpT5co2I6V2mzpesBOM8Ig18V2ON/iiMIu4YGOX5T96og8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859048; c=relaxed/simple;
	bh=0fdJqXzFPfspnsaQxtUBLrb4T7g26YsIA7I4yNfXBLk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gXr/iZTKtGfjseYOZCcUPXNxD7FapbVf4zCBa+CrFYQYec4gPBayvPbLVEOzun3uiYYZHNoL4H3JIxQvR0HOoyVjMyW7g5H1IFMbSO8N2dHJv17ECYdtgTJxjggIdcFrmE3aATL6CLZE9YJrBTvU4uKR7daFj1/YPr4ibI/vNEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uZMrdEpU; arc=none smtp.client-ip=95.215.58.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uZMrdEpU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0fdJqXzFPfspnsaQxtUBLrb4T7g26YsIA7I4yNfXBLk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790859043; v=1; x=1791463843;
 b=uZMrdEpUJr+O5G93iBrPZucm2RoRdVdNucLSACxb35lSDFj/gclpsoS6MWJ6twoQFrGcZIIV
 aBupBeYFd6aIEiU1FeLeePKgNPHcVFzexLmor6Z9zbE+67tnhTS2X2y/oNKUik0RAIx6U3MUqU+
 ufV+w+8pQInQ4v5qEHF+Ky9Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 0be64d2780400ce6;
	Thu, 01 Oct 2026 12:50:29 +0000
X-Mizu-Trace-ID: 0be64d2780400ce6
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/2] MAINTAINERS: add include/linux/hugetlb_cgroup.h to
 HUGETLB SUBSYSTEM
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261001123747.634845-1-lienze@kylinos.cn>
Date: Thu, 1 Oct 2026 20:50:14 +0800
Cc: osalvador@suse.de,
 david@kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <835335E1-70DD-47A6-92E2-2D20AD863670@linux.dev>
References: <20261001123747.634845-1-lienze@kylinos.cn>
To: Enze Li <lienze@kylinos.cn>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 1, 2026, at 20:37, Enze Li <lienze@kylinos.cn> wrote:
> 
> include/linux/hugetlb_cgroup.h is the header file paired with
> mm/hugetlb_cgroup.c, but it is not listed among the HUGETLB SUBSYSTEM
> F: entries.  As a result get_maintainer.pl does not attribute the header
> to the hugetlb maintainers explicitly.  Add the F: entry so the file is
> covered.
> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks

