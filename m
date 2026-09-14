Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58A2DC792
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426661; cv=none; b=DAn2xw6/8AXucgxlGKWMppa1g9J/KkNDfnJWYRQhIjwu2rXBPcmsfP8dwFXgz8sXSJN+eQNCkWJQIR3MoycSH23nW/EhZm5l82/58V+qrxUrMkvJVkpfCRnKz9ka6tLFUpFygty/DqIeOiSfBqOAK5g7UOYekFwiOp+ZdeEXWqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426661; c=relaxed/simple;
	bh=jnpNYGOL6sfDBOazEbyulky4u41SGDCYC7tFf0/tHa4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jE153NkVGWu6LmskIwEJ3Ihzb3Np84Pqu9jekf3FUQPa9E9BLhAHFMtRwbNyYGG/sDO8SzoaZCXD2NG4lrdI0NnFnIT+lIj37BiOK5z9Ct5QT2sXjqW3n/HhLK4qYpIFMlF6wflBvAsI8kYQZ/I0kyaTQ2V2URnITwDGbBEJ28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIuxZSJ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIuxZSJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1BE1F000FF;
	Mon, 14 Sep 2026 22:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789426659;
	bh=jnpNYGOL6sfDBOazEbyulky4u41SGDCYC7tFf0/tHa4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KIuxZSJ8rae56kQLcyhTX6TyIR3qov2HhgBBafROMp6pVPYK1nyjOv40pWCetbcb/
	 HSVscb353P3kWFz8jtSGvRZBq9WOuzUTiVLp34I+33lTZqibJ9kPVuA5Oi1S/ZS2Hf
	 FCNC2sBOOiWfidMmV2Gu8LUxtUzq04tCmn8FQde+9j5Ypq4aOFz/IRCDN0WHZM4di5
	 YQi3F90VRUQGuyC58SAF+vGRtYTIyhY1eHkcCyZY18cY2XXi3t3kp21jbsk/RfPVmP
	 z83xTg+lEsWDGnSsozwakT7wgFQXsFfZ8Njg9f4a3iExIho/8SFSN7emBK7znGtW0E
	 h+gRBb4B/C/Sg==
Date: Mon, 14 Sep 2026 15:57:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Al Viro <viro@zeniv.linux.org.uk>, David Laight
 <david.laight.linux@gmail.com>, Ben Horgan <ben.horgan@arm.com>, Johannes
 Berg <johannes@sipsolutions.net>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Akihiko Odaki
 <odaki@rsg.ci.i.u-tokyo.ac.jp>, Fuad Tabba <fuad.tabba@linux.dev>, Arnaldo
 Carvalho de Melo <acme@redhat.com>, Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH] bitfield: get rid of __MAKE_OP machinery
Message-ID: <20260914155738.6e50dc59@kernel.org>
In-Reply-To: <20260914204929.240310-1-ynorov@nvidia.com>
References: <20260914204929.240310-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 16:49:29 -0400 Yury Norov wrote:
> The __MAKE_OP machinery hides the fixed-width bitfield helper definitions
> from source searches and makes the end result highly obscured and largely
> uncontrolled.

Acked-by: Jakub Kicinski <kuba@kernel.org>
