Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6873ECA4E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791055874; cv=none; b=rIYbXB6f+2GFW76wmIQTDxPXB0zRNjlTOUgowvI27lLzIMiLBt65+RoN8P4kJQjrTAvnBUvpy7H6BCtkAvCAmULOi58Kn4hrsFJCU5ZEVOiH6mAguEt9WHTPrH9ZCbb+8lFtFCE+abCicC0ZMz+SLTOnW1XAGQHmdn/dE8BH90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791055874; c=relaxed/simple;
	bh=OB9zM0JTLIAacoQmJykY6XTIYS1GIz8lgt4xJMA36Ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOjxwH9zwuzOQCLisDgk7HottNAsd2z6EIGmhj9w5yzQtFvVsiDNum4hsIVZJv4sp6s+LuCjd2TJhlkyUwf2qWbCCdQVMAjBsqfLoPv8PzfaOW7Gl3SzftPUdS5pLbWhQiAPlCBz/tf/bv6qxC0rJd4561ZKRfP1YrL5yElNsfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwrykJ/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwrykJ/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AB01F0089B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791055873;
	bh=OB9zM0JTLIAacoQmJykY6XTIYS1GIz8lgt4xJMA36Ws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iwrykJ/lLZTUmO9GQUrZ/oJVsiT0aDeggS9VH07Sy9En/4Tq3ngb5lwrFZ+My9F4o
	 4moVb8n4Puq9HQ/D6z1fIZm8YKkRt6EjvRmjcYfMt1hoFpFIdGlky7oPx4OQ3HaRAa
	 J3tmrLnig/U5xQGxcXpVN7cCjQ2Y+g2ESA7jgMWOcnWfKvG44zCN5Na45kUAEF6PKW
	 S88PJ3Cf528ac47SXyDAdp05MLutAe2ROQJDAO/bFuJffVJt3BhRE5TBrw4ZNtEBMI
	 DxHrk/nSoFEvbNc76Vc5M29FrqoRpZym/1bqGzhp1rbP+tm/ijpruL6IGsl+tUUkiA
	 jLXnO4CYZnbnw==
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6fa788e6so593978a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:31:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAjhg5p+epcYLoD4sb8/lkECGk7+cwm/S9wPfKMpoA7curPa/XgD87SeU+NjiM31KgH1Pt8x+d5LRpztM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVGxmJomeyhGgbkOqP26ko0cmAYBbaRAMYCSwLFP6k8j9WvGbe
	XHhBDypjpmwtBw0lsKoKoD3NzQHPN5vXR6HAyt+2u1cwQCmOrBhA++L1HO8ZJRksn2QW2UoJ2XD
	JHN8sBZI93OkqdS/ON+idJDe5buc+WHM=
X-Received: by 2002:a05:6402:4399:b0:6ac:9a44:d409 with SMTP id
 4fb4d7f45d1cf-6af9e0215c4mr4185754a12.4.1791055872062; Sat, 03 Oct 2026
 12:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728075422.10977-1-amarjeet@intel.com>
In-Reply-To: <20260728075422.10977-1-amarjeet@intel.com>
From: Len Brown <lenb@kernel.org>
Date: Sat, 3 Oct 2026 15:31:00 -0400
X-Gmail-Original-Message-ID: <CAJvTdK=j4iwd8Aei+0r7L+sPWRRqcW6xgG11H3pxGdx7zg4CFw@mail.gmail.com>
X-Gm-Features: AclHuK_QfyJxYxydp72GYxJCr-U46m0y57qWZeRszV29v32S4XNQs2TibqaXlro
Message-ID: <CAJvTdK=j4iwd8Aei+0r7L+sPWRRqcW6xgG11H3pxGdx7zg4CFw@mail.gmail.com>
Subject: Re: [PATCH] tools/power/x86: Fix write_sysfs() return type
To: amarjeet@intel.com
Cc: Len Brown <len.brown@intel.com>, Kaushlendra Kumar <kaushlendra.kumar@intel.com>, 
	Malaya Kumar Rout <mrout@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Applied, thanks!

-Len
