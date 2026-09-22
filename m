Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B19539763
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075817; cv=none; b=M2BBagb/W9xfsoFKwdOk6F+KbHJZ3VXF7Q7OFb7HDonI8Lx66Nd9Hd6b+I8KdY42ac7VqAsG+qygOYVx475z/1G2An4coas1+14LZUJ2K7BykG8vkfW6FvKZIVBVKo8GYLIl0YXqpFyTSonpDfjWhJus3Y6N0xp1TpQlVtJNfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075817; c=relaxed/simple;
	bh=X0vNJnpNs6hOMaqFf2v45FfFc3LhXGrCSlWSamftktA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IoPP70Y5kjqfOlHHkB8RKget7f5TCr6U3NUoMaz0uFgeD+ZBnQiJdgjeqOU57qZBFNMX3fb4MtdSuIN22gaWv+yNy1eSz5D63+vQztzFqAimftD3OzDaseqcv8p5SKkNPXxFt8xnSMZG3e8ETKo1Yzw8KUsEcc8UTHGCWtwEJ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OB6ca9em; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OB6ca9em"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso30142515e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790075814; x=1790680614; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pz5XMLJlH/ksqI/ieLps3ISvdTbA9aZ9LqHyagA1F+o=;
        b=OB6ca9emDtCKpUcJmgMH5lJJmDzOk4JvkCuMy9CXjDAB0AL+86zMI+J1MsbmxxHLnj
         msqJECkWrqP2Rltz/AiewuQhN82daEcFQxi+GWpr9uZfQM7veZRkD8oUg59eJJMmy+pp
         F5UGOEvoEXg7fNDfG6sF3krSVbnDvPzHUp3d5IlHKJRNc5dn/Nz1vET6x4f8w7knzgBa
         P34CBHWM3VXErgnMTPwWzoywuKdo07boVT6M7s4GQLNTlrUfyQztxQfm+4wdS682V+IG
         CHNzjrTEPCiuyjSTSP6/lVCpNpZPfxJWBtyfyIPNJHvdDNSwlIPwEKUPhl+YfEoBnZX/
         QCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075814; x=1790680614;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pz5XMLJlH/ksqI/ieLps3ISvdTbA9aZ9LqHyagA1F+o=;
        b=h1Zfx0jot+sKz/5IwWPs4TR7xCdbT0pBpIwjJcCe9dQ0ZQ0jBaTsjj0h7VOOVwY80x
         3CtS3NYlWQj2m1jCsVR6l3ar0MetTjh+0jsEtRcsUtYjhMfZ5zZ87FddRKJRn5PTIoop
         Rtqi4VNITUq8wOXHO0RE5/x7sj19ifuYcTk1Yw4D7d72VXEcsL2MfFjek24o5ghDg1Ep
         FA47KODG7eN1TyP2f4wijO+HWHoM80yzg2HHXMTLk6xgEupdJV1oI88cXqRYp94qw2EB
         PWO5KxWbUfUfE4STrADIw6n5+SmOWSwiuNh/s3KnD69/9+26oDS/6fZsAybjvLh7Mb1m
         FFHA==
X-Forwarded-Encrypted: i=1; AKwUvBzPry3rDsKRMbr8jkqRofVF7JheII7wdGAJ7QVRDbg8clgazF41WnU5UrS807SbN8hltZnlKl2LMrKbgKE=@vger.kernel.org
X-Gm-Message-State: AFuF++k1vACZX+QFKM7GgTRX0NqOVxlZfPYW6BOLx5dFYCiAmukhnE4g
	GcuOopglrcw8QeT4kOKTFBMLZ4k1GqeVottI6BXs4RhzqSt11uwpRHTDYTpVnGKBZ63BHANCIYV
	AyPNX07hfSz+YLy8xrwhCMEnG7Q==
X-Received: from wmdp20.prod.google.com ([2002:a05:600c:5d4:b0:49e:8337:332])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr246286785e9.8.1790075813829;
 Tue, 22 Sep 2026 04:16:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:16:52 +0000
In-Reply-To: <20260921165841.93EE21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921165841.93EE21F000FF@smtp.kernel.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922111652.1024606-1-snehalreddy@google.com>
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Vincent Donnefort <vdonnefort@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2026 at 04:58:41PM +0000, sashiko-bot wrote:
> [Severity: Low]
> Does the missing 32-bit counterpart for FFA_FN64_MEM_RECLAIM2 break
> FFA_FN_NATIVE() compatibility on 32-bit architectures?
> 
> Every other FFA_FN64_ prefix in the header has a 32-bit counterpart. If
> FFA_FN_NATIVE(MEM_RECLAIM2) is ever used on a 32-bit build, it will evaluate
> to FFA_MEM_RECLAIM2 due to the architecture-conditional logic, which does
> not exist here, and would cause a compilation failure.
> 
> For 64-bit exclusive ABIs like FFA_MSG_SEND_DIRECT_REQ2, the convention
> is to omit the FN64_ prefix entirely.

Ack, I will rename this to FFA_MEM_RECLAIM2 in v2 to follow the existing
convention for 64-bit-only ABIs in arm_ffa.h.

Thanks,
Snehal
