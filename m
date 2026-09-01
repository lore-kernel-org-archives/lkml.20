Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A14E32B12C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234913; cv=none; b=EdHyyw4PEghScty/rir2XfJOF13hCOA+4eP5buwBMfiqrquoTecvZ1dCdieEublGevX4enMbPlciWryY7TWfTkth6fSy3LvpRGNZJFCM+tYDYZ6jKwdVTM+ClxpA5VbLerzWuKRzs1QJZFFYZ2wzUHPCVT3DR+NhwM3m/G1CGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234913; c=relaxed/simple;
	bh=LktZ9n/n2TaNQh0zX740SxuawXqn6C3zElNQjLEAUBE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Plg6xZU4NgmnQXj+aEiSUXrw1tHMKeQNG8PUBPwO8Y27dkyxjs6cmZt6katImHgGJoIaVdar3wots389mAfnaVWoDUJlsTmApRWk3djrHQlCKyPbqv9hGsaV8yW8vyyfY/yNMgq7L8NE2hklhB45nAXjORJW0W26rYc79U0Ikvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jMPzhTZx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jMPzhTZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D865F1F00ADB;
	Tue,  1 Sep 2026 03:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788234912;
	bh=TYXB82Qsybeg5iY25Bm5OAl9uF1pmFTukh9FuExQnn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jMPzhTZx+hLGKAjBAGN7uBD5YVN+OT8JS47cpFkoqDPDz6F4mM7AX3KByJTLNvir2
	 mdJLT9zLNm6m9HuWWTpDIjOmXjKz6/BO1QUgJXwQvgcSAdLtPdycxf9bC7G2z7P5lz
	 OWtuBhHuUdq4XOVM4PPf2OZkxcGxAPgKMM1eKwtM=
Date: Mon, 31 Aug 2026 20:55:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Cryolitia PukNgae
 <cryolitia@uniontech.com>
Subject: Re: [PATCH v4 0/3] checkpatch: userspace improvements
Message-Id: <20260831205511.9bf609fc3d8c5ab98df2a1a5@linux-foundation.org>
In-Reply-To: <20260810164552.1049483-1-pvorel@suse.cz>
References: <20260810164552.1049483-1-pvorel@suse.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 18:45:49 +0200 Petr Vorel <pvorel@suse.cz> wrote:

> Changes v3->v4:
> * Change test for directory to be more more generic (Joe)
> * Allow to use --no-userspace (sashiko)

Sashiko had a few more questions?
	https://sashiko.dev/#/patchset/20260810164552.1049483-1-pvorel@suse.cz
