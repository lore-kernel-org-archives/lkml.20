Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83CA3A48E6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224314; cv=none; b=MJpjwAObVvw2d3HZZLIfmq1hzhNCopjJXM2Ylb9fPk5qLJDfnnnraAJU0ZTInDc+lVBJ3mRr2xPKbIa9oXo5Syq6y9hAx9rWS/MgTkV2M/NQFx/efblojR3qoYObtPfqYrpLuo0Btoe4Oh36dFFguNSAW1mTp6oWDcxSqOqUvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224314; c=relaxed/simple;
	bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9eYJAr/PtDfT7K78zcCVm+RzT7+160GQlbepXfhMcucvDIbtUdOyhouXUH4SoCNuUA+XDyFlU14O4yEK4u6mDuMqRZ/alwFfJfLye1P7LY5Yfdeu8fNLoqvR7fBfGGL/5oViyCZMkTTaW0IlGCaYhuR6JApgcVBA7bPlE2mY1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGMKEW1o; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGMKEW1o"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d249c5so1045098b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224311; x=1790829111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=KGMKEW1orZvBY4yw+WOCDo7fvXIDazj7Xjhu/dAb4swk0MDdpUQKXAX1ZdP+epMayb
         mj5dle/aTGZ4fCpry0AZXNp4Bk1R3Xs/7tyuzkii672jvgnjYorfkDxrgeFZvUqcvIdD
         zaUauQdwUYbLpJ9CL64Dsg8UDo1Xp7m3pbjuqRfTZyYrZB5mFDKzXSssB0QPFEnXEyNz
         iHgf+TXoOdMTKVd8yp2d/gtDTXzriUBuxOzhrHHRRamIgT6q9NJ9YUe/Gz5QDDshmNWV
         0dzxI6KsWpCqyU746qAJobnmOwagHDOKX57krgsnZhY7ODOJGjFyksDoWtVCjeEqL5km
         d+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224311; x=1790829111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=eC911hOb7Fvm/vJoBz/ecVrjSQpMD+tNL7JEeFHc9zqWvJuESSHeeJTmye73ksDbPa
         FBHg09ZUG9FoICdLEyDUCVOZPrb40UHWDZi7MPzLCabHwYVtpf6ZGQ0JeF9+YAiVnpmY
         jZECrD2oh7GzhXic/ptiAzFvTtFNIydn5sXniJhcCakw/iUmGU2YH2GwcBxqAyDPTjUx
         LLAmzmIgUdGQ0F4Qc3DW7rMBjrGO6f/lGgDvKPAEj1vkHRq9rrJKlqMKKE9IxsIyU4WS
         gcWdMtC5GmvqwircvNGGqSUpE01FZmncj3tVFsBCTLmcwBTf/RcWaKPxTdTQw/LziMSJ
         P4sQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6J17TQ7eAU/KDabb1+qVnV2XkcwJeoWuCRO+F74alHcFUOcZ9UcrS/5rw2Sr8G9ZNuYwX1P3GQo3RJPY=@vger.kernel.org
X-Gm-Message-State: AFuF++kYBgdWTOmAUiRAd/rMQ8tRbbSCN/mNc6vpgRLFIwWr++qsiPkZ
	fD6+MpOGWqCluUVTWilHapgSSr/7ehqFCvfmcgY0tHlFgDgdlAa35mNo
X-Gm-Gg: AYBFou05o6spwpW6wam09n6yEGfDD/xK65xhFotK/rlA+2DMQaJy7PYCjgbetVagAZM
	boxip0j9vpPwvy6D4dEtdsu5OA+nPvwUf/Ll4wtcRNjJQgq+TpaW2P6ZFi2yF6I+gRIs3SacQxn
	beUZJSL7YtzOZW3gMmZqsx+aLigRrGLWywAvp9g1vkBRbkfNbmkTk4rVjy6+Mi8+nbCEUVu3GI9
	hEFIOe9OZHzD/u7N+NxBpMU5ie+0UlJnrOENgbAqg0cUzFvj3G2fyTaNTq/QcaczO8KXTp19cw5
	78dWaUH6RqEdiMQViZblHHyoKnQ4/bkG+V6BWW20hhCwufZCTVzYl2LLPm3hUpDgW6SXSRnxMrZ
	R7S5oGuBaljq4kgXOML90NbWc7vFmwvJzp2MXTZCjRrnluj4WMG7oB4yJ1BuszpbGiT0Wz2vEwo
	sYN2BBwXuZS5lExFNFMwqoxgKzDLVV6SpzvY1xJkx3DzxjBhjBi/rEZOVEoLsfRTWiGvvEEoPWC
	kmRO24ZGUMqKIC0IxTGja+1haCoRfztR2hvdsR9CyRu3cUEGihf39oenbSYSFYxUVa9yiY+PTpB
	LaXRoz0LFS6PyLVB3BSRm5QZcX5HwrilFupY8R32XBzm4Y2NUo7aNi3ZU0r0I5Nn8VQHXw==
X-Received: by 2002:a05:6a00:398b:b0:878:34d7:6a2c with SMTP id d2e1a72fcca58-87e9c069ab3mr997440b3a.46.1790224311140;
        Wed, 23 Sep 2026 21:31:51 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c12besm2165286b3a.29.2026.09.23.21.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:31:50 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 4/6] qnx6: release sb_buf on mmi_fs error path in qnx6_fill_super()
Date: Thu, 24 Sep 2026 12:31:47 +0800
Message-ID: <20260924043147.3896456-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921042511.1473629-4-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org> <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-4-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to 1/6.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
