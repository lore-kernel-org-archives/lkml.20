Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96793BC68A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359545; cv=pass; b=p8ejVXEV/4jFngj1wKgylBbajd22uxuLb4acuYPXel1Lb7gij+E1SikSvhET8MGAI4Sks7qp61StV7d56v9ti3RKkdsg+eVN0tw/HgAaBXrjKmNNzWl+hkJ4flF/oDEJdBRSMpof4wu5zAsYZd3a8kd6PQMfC2aQ46E7UwQXJZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359545; c=relaxed/simple;
	bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJrhgx6AukKkaWpvO/bMwcNZfyCElRMSN23nKUDOiVk39LN3//s95RHQlDZCBnL9VL/vBBLZCMGR09g35tUYrWgC5Ygs9iCIvxCtW2Y49xP5FcKasEZkThyjGsPIWGfIoPKzDXlZjnzLdMcKoAscN9H8hNWroHZuLZ7s0CC2Mo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLa6lL+z; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLa6lL+z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so958407f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790359542; cv=none;
        d=google.com; s=arc-20260327;
        b=PwXoL/P4YeDnZ99fkDyDPTwl+AF6+8NWEK9A8lV8QM+yPNzr+baVePKKUF36qVaPfx
         5GAuwHFLzD7amjHsGQ8sT5Hv48TcPTRZUDqOa6Tr8npHBUu0ILZp5nrBKC4NNbvLIXWX
         QaVufcnZUDUGLLGZGxZpgVZ7hYLNNmssiav2x1sM/5RHvIaXjIjSU8GdEUkBFaSReR76
         ONCvfcNxFDE4PP5ciq9P+FurIkQ3szGdW9XqQ5XP7/pGCXAMiARfFTDmOgF5x2BAZKrH
         6n0E6lN58ubCanF6D5EGGCzBHlMV3UvBcQYUeQi1ia/S8in4Fdor+JyLBT/jfxrRFjRl
         nSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
        fh=cMzcU/C0+UcXedIvtGkXT0ihDx194Cwg0Y7M8ZkBZVA=;
        b=MIavdDiTOr5RaHiov26Dg03Qq87j2+LXZueozJNyZrri64M1Gm32xYT8cXFkoxisfd
         YxGXVjzEaqJSJUqjRWUHdADpYaKnogMVUbZpW0UNazOswELRStVSi2oBOMvkJebhLtuE
         ldNckOigNrGPfGbrA6BFOBCCZPCYWRFHZjuEc17eOkywA0f/XNCbm46JtA3RJMxEyQpk
         fhtmof68cIQIq8R+BK0bTrnGkCS7oNh3kX14MXmVLHTLlI8VvAWEyDj40NNMBUuUVvXL
         a1PMs0S6aji8nLEzXHQsaYq5aPQrk+m5THfBLRbuaJj6RBpL7uGHuCMoUQ8zp6LXfaNf
         ccwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359542; x=1790964342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
        b=KLa6lL+zPRyMOjuLiH/8JgxeU/fAGEsQqf4/nPlCjE3PJ8wWRNUw797EPyMYOTDIQ5
         C0tgmoI8GCj5fbRM6DHIsp+OagNx79Yl4A+FO4AZXXXtgdWRmyR1GqzBtyVmP/59ZG0E
         mwKAPNSpRtQTSR2lUdHX/bA6IMuZNLck4FwGrKMmmYIf2AJB7H8lWPf3Y0z6s1OOA6oB
         F7RgX3ZPO2iR/xKGlqHgeQneyqgLtChQw0jX4prgOgGGS+iSePcbcjXXRia319pVtijf
         QmNOmibxTcQW92MBWq6YHMaiOqk7uty6IODSQstj6DyIAnQluDHV75gAsuwJSSnf2ZsN
         dxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359542; x=1790964342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfl4b7+zGwYXjBAY/2HSLJql1XSMJI3mCRWp0qvuwyk=;
        b=zV8cdahTOV0AWTF7MmYsRolH40vIkEjtBtdZ1KLq10hZkCkLR8LJjOFCaxJCujjFcs
         heiM3TLpM/QflS4+j756X82dp3WFEIbq+6qvTdb98KdrfRlXdOtIKXicjk6hL0Ijo9o5
         rsjNe+CJjEy6Q+2xT9L8evCEyPlB6KUady+TkQFPQ+GZdlTUkrNw9Qzyl4qlJ1izdPMh
         s/YHVL6W50vfENbq9rSTXb1lQ4QOV/2YSdjeYJ2g9EGNLQ8Q2svRZX89fIg3GU8BWGOn
         vKe3L8JFN2pKN0zSmo3zCeVnoCCJ/4KLz+Uv+0BtbBevlxL1utJGJAilLrLqICxrW2xk
         oeuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPmFcgJm2157EmB+z24BZUCwah3FhNX1/EQFH3s0SxhrVNhgfDca/JJWCDFaHc0MABDnc+WacBbIZbOUM=@vger.kernel.org
X-Gm-Message-State: AFuF++l8FPDhMGSrhIYXBXx0DWXg5K4kGO08/0yKpGcJ/n1Stk2k3tV1
	Zhrza6eQNxZThAtkCI6F151E2gMgD2k7xmL+Yi8r6Te2EcJfeQZsthC+ov9HXobBoRcvJ4SyARw
	Tr+V5Ch2SXUGuRqz0RXX9vgd59lEic14=
X-Gm-Gg: AYBFou32lNDX5rnvLFWTepcW+RUe8rSFYnVWGxv7zAbwmot+JhVy+5LZ4y0A9j0G0Xz
	ARF54Dv0Ww26/XkNPXkYslR3+27NEbXJ+Lj0D4a9HjpMPA05F+miiqdvxVbDPHiGW5WN8kX/X0T
	jQOEjRzTiWrIqylcJeoB3gmuu0821JZddQsKy0/4kSEv3Yt4rdNke9bJV17/TcqEO/gTalpqj3/
	dvTN3HL3ysDTJL286PuM+crjVaUvjj5AcwxlDJgPXlJrBtdXRMs1pRseBARSKE5EmLcnyYrmkt8
	vQHgLkM0Wu49goqbrbh//d2w2uw1bJT2uoPsOlVn9odtfyD3SWKjJtHvqrNyx7hWoUz6+PaPSnF
	LBpD1HujyJ+8ob2kwU3ZMfA==
X-Received: by 2002:a05:6000:2284:b0:488:8011:6834 with SMTP id
 ffacd0b85a97d-48880116940mr4896261f8f.53.1790359541945; Fri, 25 Sep 2026
 11:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com>
 <CACePvbVQsHXt4=+qfKz-KTar9CG+3OiAfLd1EZgnRE-1gyoKOQ@mail.gmail.com> <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com>
In-Reply-To: <CAKEwX=M8pJUYhmADfvdk+09O53EROyDRC+_b05vtimQE5VN=qQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 25 Sep 2026 11:05:30 -0700
X-Gm-Features: AclHuK-FobqVPyDTMFnDSZvekiS4h2oZG-GWPYqDDrJKQs4ZBSnYi2HsqkCoGUU
Message-ID: <CAKEwX=NQtWudSHhR7-bbL8PuwFEW3uATj39DhSG4LR+mLVSusQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
>
>
> 1. It moves the metadata from a new dynamic cluster struct and shoves
> it into the existing physical struct.
>
> Like, you can check patch 11 of this series. It's practically the same
> thing, with the only difference being ou

being our interface choice.

Sorry that got cut off. I must have accidentally deleted it.
