Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33C8834
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172885; cv=none; b=uiGn/ZjIlywkCVjP/4D4itn9CnZ86wsbAmB/3t8rV46syqBrCmp7ztTsTnS7ow5QOjdAitSCjFQcbEkXq+u//lfusGojgZ38IafOUVK/pV7KnUzcg4vzZhRzdfB4sabAs3Nd9wUOV2+0MeqvNeMffyIH6NeMPQDXQ/dvFvjD0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172885; c=relaxed/simple;
	bh=s6RTd87ejHnpper2/RZR8zUsmJByUU/0oBapURZQmy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFwL+iUm0qmSH078fuAC7wVfjmFifxBkRy8o9QPuxcKFsstuenyDd82TV+dLwN1zXCKEZlCuDWy1lg2g8KtShmYJbRg9sfxY7Q0mH+pOr1x18IBc3xPHIQ7292Lj0RL+45S3byWIhLYe0rqycS3z95hskpC0+TLB4XewcUohfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYwL6taq; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYwL6taq"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910704e63a9so8037636d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791172882; x=1791777682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TqrTtOgz71bOwQTMjtxUUo0BC1fH58wEyMEb4MWuhU0=;
        b=XYwL6taqZ/Rb4F5K8W9HNpeGzUGimVq408Sl/5JB2JsmLq+M3yh+98myDQ3h+ZxS/i
         AdXPrmVrLxqjqPm+lRGgoREoL2r7/Fz6wksdOx5t1G1cpnAVFyv5AHUFkfyHnLXTC+lG
         P8qlcr/VP3mfsE25W8/QW9D4E1HeJ1lekFYlsUwQyeCx4qSfucOC2avszwTyElpBJZQ5
         98G+LqpaGLgHpTgssVAMyqt3dwtgMzcA74CGtQGLsnn8mm8uC3JPNTMriReScKC2Cuyh
         p8QNEfDCJl0nb0fc/H/YyD3PszSuKqMbbWg9JRMgVUKv3C+Pez4RBjWszBS2h75lxnUK
         r1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172882; x=1791777682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqrTtOgz71bOwQTMjtxUUo0BC1fH58wEyMEb4MWuhU0=;
        b=tKIWrFjm6rVM26ijQxjitlegKYgbhw2gEgOVhEAbDV6z1efH7Uc8jcRa1HUtqk9zwk
         OwR8cAPQEUx+KDTbXDewL2TsTfC202IkXJfvf7ixtwCeZ2OI0komi8bxegxv7pd+pWCD
         i/nhfBNQDLcDYqpyCuOz+frpV50KcxBuKXQmqu9w2CcKwuDnRGXXFeZMQapRBnOZRmza
         yuu47d2bGFxRjaNy52eVXIYCFIh6py3i8IGdW5hPgPaxe+CkUgJ2NFgL/aMh1KkeIktG
         KTUiiFghfWfUH4iUpbR2nNmymjzFIaM4cTDfdY7a86w1Q9xXCcZGMhlB9KOHO0SCt2OO
         4Wnw==
X-Forwarded-Encrypted: i=1; AKwUvBzAJ9pxWmZ2DZuIYH7TjCVkB6UBJPJzQ5W/T4GQbCrmlLy0y/7K2MzxpUDZPs1EFd36ftjBDEIfP0lGWrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiGfCyO9T9rHqZlvH4e8ryHl0uNxVIIHzuEFMHryfc4ujHkfkp
	9/Wu1IlDBBJv+nCBBWbH5fycWpFQ+40RQ7ICtsW3I1ws/dB3nY4KPCxl
X-Gm-Gg: AYBFou0GhwPmRXghP5BrOiCjEatx0IMQXQpd4nmkE5yASu8tlC5MeSbBjd9CQb4mLNR
	jWF8mZEH8Sys4q/DuwTmYz2Z1CrR61tZaJ0InKmuVpxkwlgA9UXma05X48S0CHqeEHPWXyDdpWq
	CGQ0RUVcF3CtB8X0CBQyCXcq51r/GzqhbFpZBjioEKWBmgBSomnlio/FAuZ51p53KfXs3bwGCiz
	HXPsruUHuIJ+ImkzEx8zpD1qEZjpX7fnA/Gzn4sHb5ZkYd+KFjl7uj3unVfFv6U4mK1y0mrGu4o
	oSiJsYrv8XGOA2B0OhwSSwMoklQnYDLnKs1ls3gpAvV+Xgwr+XMuZ5ACjDMdolacbNyJ/QczSXy
	ApABnHX84s8oqQFGzJIBImAckaU2H20GO7+RBGoXcMkOV5C29QZvcAzFUgR73Ig0gjB+uI5olrY
	1kdfzuoU5E5ubB37mz9I0JPQzGTABG3YWOILFyBdNBcCQCMyLYAc2TXJAobk5dlqY38owEZlvfn
	+8Gpm7+XzgVbhWtB2SDAEai8UnQiQ==
X-Received: by 2002:a05:6214:5196:b0:90c:c1eb:ae42 with SMTP id 6a1803df08f44-917c00de4c6mr180429206d6.13.1791172882520;
        Sun, 04 Oct 2026 21:01:22 -0700 (PDT)
Received: from dhoja (S01067483c248479d.wp.shawcable.net. [50.72.244.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c43c47sm77948746d6.48.2026.10.04.21.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:01:21 -0700 (PDT)
Date: Sun, 4 Oct 2026 23:01:19 -0500
From: Curtis Vogt <curtis.vogt@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] USB: quirks: Ignore wakeup from the Valve Index HMD hub
Message-ID: <asMhD7WvhIk6DjIc@dhoja>
References: <20260924034200.421686-1-curtis.vogt@gmail.com>
 <a2f981e4-ac6a-4d1f-8c5c-bf529e0a16e2@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2f981e4-ac6a-4d1f-8c5c-bf529e0a16e2@amd.com>

On Thu, Sep 24, 2026 at 10:44:18AM -0500, Mario Limonciello wrote:
> 
> I guess this would make sense:
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/4333

I agree that the issue can now be closed. The source of the "bad state"
was ddcutil which fixed https://github.com/rockowitz/ddcutil/pull/637
which was included in version 3.0.2.
