Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8AB4A35
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966749; cv=none; b=D5FUDNgmivCzPga/mejeSnT1UtabhVxrx7IOJPFGKQ3YVsus0mx/07qGbBOB9LTpXTWO86bhMeg8gXCxKes/aeL8zGihu9fzNZ/XIpAVeg5j0RpgbihcQVX2XgFE9G7wJ/APPouOFEfy5XY7AorhLNmUOuy8O6rfIaFmzWK/9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966749; c=relaxed/simple;
	bh=j+BiDm2gHGa6EiGJWa2ChJoT3/o7ax/62RwOTr65b/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sxj/zgr1/eMOxlCVrQW4Qv6Wcri5K7G3yPfJ0dV9OCJXvVxfODha38VsWYQYmEc5HaSF0S22Uxexj5s6j7PpW+fHY7LksqVU4d3HePf2UkBx38NA9Gicksie7eY6+2KthgIfzbam5unWwWOaWCZoeRgbTEQk4fA8GYXibaoAa7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/B1UlzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/B1UlzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CAF1F000FF;
	Fri,  2 Oct 2026 18:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790966748;
	bh=jdO8oFrHyfPHpTduxdn2W65ZwXyk2ZPDC9NIAqHTviU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j/B1UlzWmMc05S9yhUR8u+Wl3HKdikuFa1aEGhfAMdGKyzvHHcG7Du8ai/Q7QKdIW
	 PSzx90YFamWOeRQ+O0/ClYaH9ISgd1AXHDPTH53hU6kpC7jtNLHOyDq2xs9YJYgBW9
	 PJYmI0gzsnwwd/8352kMpMq7Wwb/qpTiN5Il0oZMgqHD1gYC+jF+WFudV4eTGlnqEw
	 ue8120gafUNDfPRFJEKNArWNpeXBS+Nu0j3yUyBMuYtkqGAfwydtfDDIw22IvMseAZ
	 qDF6m5NL6bY3md5JsKuOnprimiYlugiX/RRXIzcN1T6Nvprtp8VnEJfq7yEmEeJvcw
	 oj7H7ocWKc04w==
From: SJ Park <sj@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 2/3] mm/memory: remove the mkwrite argument from __vm_insert_mixed()
Date: Fri,  2 Oct 2026 11:45:42 -0700
Message-ID: <20261002184542.41220-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002160535.661399-3-ekffu200098@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  3 Oct 2026 01:05:33 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> __vm_insert_mixed() is only called from vmf_insert_mixed() with
> mkwrite == false, so mkwrite is also always false in vm_mixed_ok()
> and insert_pfn().
> 
> So remove the argument and the unreachable code in insert_pfn().
> 
> No functional change.

Looks correct to me.

> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
