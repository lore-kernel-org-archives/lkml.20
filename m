Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA0B434992
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909991; cv=none; b=CJMD71Rs7cXNqHjnl002Ql06HymOwnvw/wQ+VtVyQEUlEEFqEHMsubt3bm5cD+8VfsjyPNgQDY60M9edqJd6ccyvNM6nGjdL7+uXJ02/Eu5sGiEpHahptQsCrRLw6Wdu/v66O/pOoTK8Ls32Cd6j1i+CS2DXRA7ml01d9dzbtw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909991; c=relaxed/simple;
	bh=H/oFXs//cRM+d4MUQBASyHViAbewnwnjMGKsThJUOw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdSyU49IqPUZcF+CeFNkORla1LWhuIqZJHFPGLfKL9U8j6nxV7XSZyB5aamZykIQOS4MbkB/nzqF8aZt7EH1Jz379WLHAj2aYGa7hO9gR89sExn6+ajEE36pzuN2Y8+3ehg5fPjFLB+VaoWNDfofhYnZrUQUVd3sD6rMsGVchG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J43nFqcZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J43nFqcZ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so25862475ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789909984; x=1790514784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PU/+R0zMOo7wyj2oD36GxlHMQyt+r5CHwX5Gco7PteE=;
        b=J43nFqcZQUYEF428dEVRn+ZhHytZzWuBe23IYX/o2EogFMZtDMQoNIqYM4mMESieZk
         o/qKMPUOcixiCHVbuh8BRQei6pzLXQigwNBOQNjuu5YeFWUTo0btbxGJsplRbbxF4wic
         4YFW+OsHVddqGhnnSjuDUrGYGapmFdf6BWR8eosSPnP6TVoJd1Rv0uGYOyCl8fYTpELn
         kTiKpWLADnQBVKCnbIppdHw9YPfXIqdCpsBX0bcPVB7olHXDa71yjPE7jbYwCFAre9ny
         9uRjAB0GDLczkMJGEhvSVO+gL0et0C7sv3TK8lhcWna3A7G9SGcjFdbwUyCphzHhZtap
         pM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789909984; x=1790514784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PU/+R0zMOo7wyj2oD36GxlHMQyt+r5CHwX5Gco7PteE=;
        b=HEKvD65HPdwi63lbkSfb8dZEU509d3zEhFq7umgOc61WBwFto/o4QrYJnOMR1+DaY1
         woM15CwjOWfMXZDk12WxEHV5GQPgg1f2RT5ZELNWa40xgs9BpJkbvDEJoZ3qGIqeAjEi
         CaI3vv/ydSCsFKbdR/2HpYXvKEs9fwecuRB/J2rnQbXHEl/SNkO/zknp4qFJssedWawS
         8HdQ4l/7rvoK4OAGDU4U6QemHmQ8q4OO5E0S34J6nFSbLFgkbqErn3UbuPRvWVUQFB77
         c4949WIbda4Jy5TlVXPmZBPTv/reiIf5AneblO3tZCzs9z5b4Kmjqx9bxQs+YApZojwA
         vjxQ==
X-Forwarded-Encrypted: i=1; AKwUvByM6UpQW9dfdpIkiadSHRVUcuvhUJ/3jK5ZcyM2PcnLziVPdHh09ol3eAENkSPKGxVF9+TBLHsOmlwQ9cE=@vger.kernel.org
X-Gm-Message-State: AFuF++nnshI/jE/4n/tdknN+XhRhxpUnfuJwLO6rvS9PkPWmpUprqr4z
	651HR27UH4Tl7PqCa8agnVTgrVjseERCsPzLV36NqoK9sKW5N/MYILg=
X-Gm-Gg: AYBFou07pKNpkXxMs54xUuAtXhwq9xruNcXL9VZXlZfWkNoUthDY8bEEbejPCzSEbgT
	yK2CD8C+6ZVa91MGQwHGfzlGdP9EYGDUmNBJGTLYCCPcU5ZoQrEv6CG2h4L1O/onTDPq3xsVwXi
	LTR5uNHfHhpQk0aSZKVccpk1ibbyuNSCw6OttbRxl8I/jdqLgbk8Hewtx9N7XIjgdtbbY0prqrH
	f+Bujm8szhWyPBYC5Vb8xQqUlMHyQPCL6fK48X14QIQORXDft0htCoe3hba7nvJT5xOPzKsoWxs
	2MiDtZX7CfbOc4MsIBcakHt2a9CldjSoZBOY/+Gwxx5UI617tvIw4AHFWeiCJV0dKreK06S2sCY
	UOVGpHeD6fKYhMHUjVEuuOGSejyNlcZmYKuBmieu/Yfu51GVrIoXcjW3I5u31TgDaROKCFcvcoW
	32kJzAW7RGcG7ShW29XxlnpIpb6+VFPu2tuLeeTINCxbISNIF/wSwA14VbTNOrt6RzgkpmfumRL
	wP5EceWDV+GUnfbPDRGKofhzIY=
X-Received: by 2002:a17:903:124c:b0:2dd:ad74:ac84 with SMTP id d9443c01a7336-2ddb1be0d9bmr131483275ad.31.1789909984048;
        Sun, 20 Sep 2026 06:13:04 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179ed79sm20599695ad.43.2026.09.20.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:13:03 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v2 1/3] mm/damon/core: prevent size quota overflow in the temporal goal tuner
Date: Sun, 20 Sep 2026 22:12:58 +0900
Message-ID: <20260920131258.613770-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920123959.48279-1-sj@kernel.org>
References: <20260920023111.2466265-2-donggeunyoo.kernel@gmail.com> <20260920103714.47722-1-sj@kernel.org> <20260920122430.610257-1-donggeunyoo.kernel@gmail.com> <20260920123959.48279-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 05:39:58 -0700 SJ Park <sj@kernel.org> wrote:
> Don't post a new version without ensuring the discussion on the current version
> is completed.  Also give time for others to chime in.  As a rule of thumbs,
> ensure all questions on the thread are answered, and give at least ~1 day since
> the last comment on the thread before posting a new version.
>
> I will not review the v3.

I did not know.  I will keep it in mind for the next patches.  Thanks.

> So 256 MiB means nothing special, isn't it?  Why you mention it?

I mentioned it because it is a value users are likely to set, and it wraps
to exactly zero, which I thought could be the worst case.  But the problem
is explained well enough without it, so I am dropping it.

> Let's put "The scheme makes no progress ..." before "so it is unlikely ...".

Will do.

> Seems unnecessarily verbose.  I'd suggest keeping only the first sentence.

Will do.

Thanks,
Donggeun
