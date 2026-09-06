Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E8F2EEE93
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727188; cv=none; b=l3AI0/j8JqdfZ9T8z9Ix2fVmchXyc6NHXdRdvcmCEpngyZliLSuRgM5Ma3QbQOuIPgBQ6+p4D0kG7YjLEIzzGU+URNvmIosXfrc7ws11kghLZrSTWj68h2hgMIu2RU97ue/8m0rM8CxUF6NqYPhFTiDvFKWuSafMnQSIp8verjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727188; c=relaxed/simple;
	bh=LR3EL8+UCmvdyt5RnYTz1EpjknVnrgzKSF1MRXhd3ko=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sA5/yztwriFpWgTiebcggW05G2NSKo0d7oMIfohFR7/hTA4c5m2nyZoWhWlyzdKDjRmZ+madg1ZWkX7ZkFyTSohdXlPjLfTSRM+p/ruNsJXIp33XYbwxXnVbtBz5Q+vVTMRwtHtjXHyVwPljDueMsvCOZfD2biPQTvJMFDkEhXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cp8wQt8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cp8wQt8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F841F00A3A;
	Sun,  6 Sep 2026 20:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788727187;
	bh=9lfkzVniauHBDUZUWwmYVmAXW8jioDZoVwHD1zl/aeo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cp8wQt8aNj9FIuyGPFzrAcRmVtPOlyFJs6mbjmxyTlntQd9qnR2Rmve+W1ZA3fBv+
	 6+H5TpbE0vf9TAZZ4DSuyMBRvoEZL/BllBU0dc/g2eEf61w78Ka38iXC7RiWUXlXo0
	 dRnyL2RPbFrV2sNfipbi9kMPUldv5J1xSUHeZK2cOghPOVE+EZjbdNJl4CJRIR+KGX
	 a5igwscUE7ctwAA048l5Py4Hc4jVtrsy1mlY9NurCjNn6SN4rBlHdXX7aAGIvyeF8U
	 jGbOXs9AMbG7IHcewhwZvUFvUW4EeIAc1QWiLnhTz/bzHfHFylAnj6OvvaVU9XUJ65
	 5q6FgCKLIZpCw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/1] liveupdate: luo_file: Add documentation for
 dependencies
From: Mike Rapoport <rppt@kernel.org>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Alexander Graf <graf@amazon.com>, David Matlack <dmatlack@google.com>, 
 tarunsahu@google.com, open list <linux-kernel@vger.kernel.org>, 
 "open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
 "open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
In-Reply-To: <20260904220555.589752-2-skhawaja@google.com>
References: <20260904220555.589752-1-skhawaja@google.com>
 <20260904220555.589752-2-skhawaja@google.com>
Date: Sun, 06 Sep 2026 23:39:41 +0300
Message-Id: <178872718104.3691424.15410189304450384708.b4-review@b4>
X-Mailer: b4 0.17-dev

Hi Sami,

> Add documentation for dependencies between FDs preserved by File
> Handlers. This supplements the previously added

Why capital F and H? :)

I think we use "file handler" in the most places.

-- 
Sincerely yours,
Mike.

