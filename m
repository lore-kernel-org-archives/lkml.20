Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99EE2F363F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197636; cv=none; b=b0TE+VZQFchKCX3441qHrmMwygMyKqYdDfwjEBaPB7DGBPDj+7x+bVrAN5GWbkMBICAp+saH2BKuFBSemWG1P6kBjaP5eNWn8aKzYfccsG27ahFru/c7dihyl84Bq1g8tF00sWE9+BdfWZO/LnYhFrXPdFY/36bG92zQxZf2YCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197636; c=relaxed/simple;
	bh=zEqhspQnn1c6mH3XPpbLp1ww9/CFLXcb/gmcD9NQkrk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=JubeCO6cYAVniXP9+j3Wdt3VzSg0q2RTt8KNCI1aZri7kdEP6JYTn8xBkVxxwU91MCz/p6Wd78ox55VJvumDDIWN+S38pWAHWHeMiZ7AE00WYX3dQqtqsKfPQloGq4h5pzQ5lB/HeRSkeCN3Jp6MT+2W7yyoktT5BA3uZO0mc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEHtCQLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEHtCQLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC171F00A3D;
	Mon, 31 Aug 2026 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788197635;
	bh=zEqhspQnn1c6mH3XPpbLp1ww9/CFLXcb/gmcD9NQkrk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dEHtCQLG7YBUfuhRfyQ4XA5nb5XEPitAyIKfsxVSv1BMkhrjFHsbLR+zqBLuhvZ/a
	 YAIVv6acaKppqO0/X8+PhLFkpyg9HAzT2OqTcJuD0Ze9ifRtEq/4Xcsp4fnmMtH3QD
	 JNPbPsjEbsRTLyywIcZbrWYijx0QZrPoyshsMvJsNuRLiskg2lauKFBrfeljtJBxZB
	 ZmLVzI7nI30JbXR6h2yy4ZEF/kw9Pejb08t/XaSG2SmQeBzi3z4nOXz/dFfsyFy09j
	 0qINL3gOnjnAh38DzUNfsrnyXas4NBXTKcdy+0FkCIMCEnHbwf949xPvFD7PCiXbJd
	 KG/JLY4ezqlfg==
Date: Mon, 31 Aug 2026 07:33:54 -1000
Message-ID: <e6434866c7d5bed7048d33c413f409ad@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] workqueue: reject watchdog thresholds that overflow jiffies
In-Reply-To: <20260825070315.75540-1-stitch@zju.edu.cn>
References: <20260825064805.70744-1-stitch@zju.edu.cn> <20260825070315.75540-1-stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The posted patch was whitespace-damaged (tabs expanded to spaces) and
didn't apply as-is. Restored the tabs and applied to wq/for-7.3-fixes.
Please fix up the email setup for future postings.

Thanks.

--
tejun
