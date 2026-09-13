Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC502E7185
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342090; cv=none; b=f+FVyNrI34wqNDC6x9odih572VTmQQnlTv/CzXLybnnExU4p5OjuTe5B+H/wmLODHuq877XPIHoXbfR9z3Df5YSXKT56SpqI2PLfWHZIVvfo638H112s6kn48BV8wA5A/2mKDwwWDENi5qcgSI43DNeBxoe3KlQdgyjAGASlOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342090; c=relaxed/simple;
	bh=B5wmYvgAumOgkvL+j3miHf8Yd6fnFpMGVGSUtvMSkrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bN6VPzjO97BqXCqQr7O3F8aSetl0l3+bM0aFojxUmoTn80bvDyGcNPVcBE6h7xaLt3jwJR+Nr/vAei9s9KITFQIilE8tpE+3DF6cOqHwZ9hqU16m6mAZYRWyCjSd2CFmTHnwdFmTyv2tociMxrDSysNVLkLDwchdu2d4o1IAy8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Saf5WQM8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Saf5WQM8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6d28aa26cso19555155ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789342088; x=1789946888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R7s+G6iKjm40YpfgASlG1A6+cEJNeaXA4iyKbV5zAO4=;
        b=Saf5WQM8vef8YCeLDc9hPtZT4h9JT+xN7+fcCvGfS1WXryNCvWXtor+FnteyX9eQq7
         cH9ZRFYv2r9N4gDFQDdUIJGBpGHByOzCGOCsiCrGXXmig7dqgcuFJc+pqpgsnQbavwnB
         WZ4hiJT6YjQDOuNoaJmpm9TbzMnFzdMz05YGWpJK6ij48XUtEYMLvczmb5KdSqSRC6O2
         nOJzssr5aNh52ziIGXIH+euxQli4VfEfVjmyojCWImuWBstaiQCmdxc53/mKQmIQuq3n
         rPmvuzW3XZMD2lKF5tadr+8WxGIq5SyTWRQIFjeJO4bCidMFrXH0Y6xj/olI3g/JMHn9
         Pidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342088; x=1789946888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7s+G6iKjm40YpfgASlG1A6+cEJNeaXA4iyKbV5zAO4=;
        b=Wgpt4TbPHK0WVk3629a7p6zoGi/eHgqceFP6+3xGltYis65GwGfDJXyhGZt8syxBDG
         XoOZHhz45H7TfDFmua5+GsYOkOB8+9K9hV8uTDvXyPMa4XzrMrfHdQeuKnUBHGsM66Xg
         +zf7qX11kGy0xLbCyiZYNo908HD4TjVIOnkR1EwYpWnLVd1cfha1OlpVybU3NSizQDKw
         waQ510BssoXh59Ng9+8WSyHfYx5vKNoRwNw34Qe2kYS362DtlVuOFozjzLTd/efXcmIQ
         cxO3NsIOr6Ih2kXYVcyF/SM3oN8+bTMAuho7nt2zI+mu4P4u3oNYB5MZyIfqVV+jnCAn
         MWqw==
X-Forwarded-Encrypted: i=1; AKwUvBxGzqjg0sUfHtKzQBjF7l410NGJP0b68Ykn6NlJSh+f3FUm8WYhR9YBTN79ruZRF3IOb1rBXwkPb5O/9Nc=@vger.kernel.org
X-Gm-Message-State: AFuF++mL5qHonrcUDt4B4nS6Wn8o+Z4DeEG5piKrq77nqTuWBBLcm4e8
	xDDXOuKSMpSbvOPxQ0yIyWQccn6oY+1OjyZ5vCgd/L+ysvB1JesIIe6rdi420Q==
X-Gm-Gg: AYBFou1ijOYq67O+kwAre822JM0B7id3AFFDwD/LEDwiUfrj0+YJkORbLHBO1sa4kJN
	3JTtB24aS8efipr/Eam5xQ2AQ2UdfGOUDCsOfKpnUTv1kcvHimstydErMaQ+BFXt2uKHkRmWfSG
	FXbZ/iIW67oLZ17LjG+ssqD7oGBNLJPn3HFryqlccTzXj8zl87bOz9YaCleq+uQcDOJ/tSDDpdK
	HzOZP27eIayY4AJNc4Zo66qD8xtp65w1fhwAJstIUDQu2e1yq+on7T1z2laREbAwB+1f/KL9a/K
	f3Wb6r22eOC0dGFMKngA4BP95S3gvFXhoz34ZlHWSHe0MGzkcfjN6ir2z/+f3WRgtB+qlB6FkqY
	58sggY4oovXmwOxM6AKLQC9bLZ1LAlvMIna2Y/XTWW7DV44AklqJv3ysPzl1RI6eFat2OBLiSeQ
	J6GcBZox9B/5O6kT2Y66zZcoRIHb4bWGKpjJVEwPNNJ5Bqs+KxfSneczvGBXm1BsXZ4IqMgh8Cm
	fDld7DBJvq4S2WgMQqHSf2sJ6b/DH+/eclkIRoE
X-Received: by 2002:a17:903:2310:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2dd6c6d75demr2017215ad.10.1789342088253;
        Sun, 13 Sep 2026 16:28:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm23728160eec.31.2026.09.13.16.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:28:07 -0700 (PDT)
Date: Sun, 13 Sep 2026 16:28:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Sommers <chris.sommers@icloud.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add quirk for Acer Aspire Go 15 AG15-42P
Message-ID: <aqcxe2U81KD2uPYi@google.com>
References: <20260907182723.2709981-1-chris.sommers@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907182723.2709981-1-chris.sommers@icloud.com>

On Mon, Sep 07, 2026 at 11:27:23AM -0700, Chris Sommers wrote:
> On the Acer Aspire Go 15 (AG15-42P), the internal keyboard drops out
> ~5 seconds after boot on both Linux and Linux-LTS kernels. Keystrokes on
> the built-in keyboard stop registering while the trackpad and external
> keyboards remain functional.
> 
> Testing confirms that booting with the i8042.reset kernel parameter
> resolves the issue and keeps the internal keyboard responsive.
> 
> Add SERIO_QUIRK_RESET_ALWAYS to i8042_dmi_quirk_table for the Acer
> Aspire AG15-42P to automatically apply this quirk on boot.
> 
> Signed-off-by: Chris Sommers <chris.sommers@icloud.com>

Applied, thank you.

-- 
Dmitry
