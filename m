Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241D44A403;
	Thu,  8 Oct 2026 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459026; cv=none; b=u4ZiTdIVEWWONTiujccrLdaf0Z5lgWCDr2GINgtDE5C+QLLz5QGxPByy1oeZ1ey18YHpQ420Xsn9Ur3DtxG2lxnaxpQMnBHMZ50f8UP2SLLJBoWJqx979lzODZosiaqh/GCAD0d2XBB4DN0ToJKBbKWlXbZACo2PzdVjgNo4IMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459026; c=relaxed/simple;
	bh=GoMKzIiD1for1rm2csxnHhJnVJYVVf4hcCx/xHmlVh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abHGEuxeIf0UrgN1ZIigFGpQpBriZNfwPkSTs9do2mQDiGxCLugVL4H+KyesKlCn0R8h11Ru9hIROAHVJgDYVVnFOAWFcZeI/ps4BfPf9VsvE/xQnBw1DP7H8pjVx7/lQ1Q0cW3Sg/TmWHuBgFcyYrlP7Z6e+/L2zMHF7G3q3Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8Hz1Y/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8Hz1Y/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFAD1F000FF;
	Thu,  8 Oct 2026 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459025;
	bh=JyZEXCsrjIRssFr/XscNfX4V4CetnsdggN0Nwhan5is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F8Hz1Y/SBwi1BdY46Ig3T8lYjqv1KCqjC+yNvHC4mkiyTe0couKTWG8QhjbId/Tk9
	 4yHtOuzVeAeJvZ/TwL9NCXxEIWaRpZvfVAcZRF/ROXeDbV3enliR1RFa58tAjt3Sbz
	 9vQWB/zFLBYwOnBE9/UbOSDRSdqeiTiFIhJfcI9OQwiXqawVQJ4zxuzjKXvUrLkFob
	 yDnbvkuO3YM5XOezquzGDbIQF+RmvEn5wGMP7/71m/fsnQVwJQfqSqnp3wl52R+G4G
	 3MfVPEWQqHUkERgYl2d0qXWM9COxJNDCrd2sG8e0og68G/84fu0zsbJ/o6sOnPCh7W
	 rtiAO/oC0T5Ng==
From: SJ Park <sj@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: SJ Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [PATCH] docs: kernel-parameters: adjust reserve_mem build option
Date: Thu,  8 Oct 2026 04:30:20 -0700
Message-ID: <20261008113021.44149-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003213457.96408-1-rdunlap@infradead.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  3 Oct 2026 14:34:57 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:

> "[RAM]" means that the command line option is applicable when
> "RAM disk support is enabled." However, the reserve_mem command line
> option is not related to RAM disk support, so modify its build option
> relevance to "[MM]" instead.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
