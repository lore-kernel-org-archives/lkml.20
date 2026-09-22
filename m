Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E02868B5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036269; cv=none; b=Z/Znx5qYIcL1uSoPjBGHpD4UCdsuUOjS8qx3UuWS8JHvaUYkuzCDxew5uIKb5k+MHC6ILi9ZO1DXj0VjPHHeipQH4avRlKqXMSioQpKraI9WHw6vMqgssYuXW2C5PiO327pOvxNGQewytWniep8xrQ5TcBNpjmsyzJirCNnnxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036269; c=relaxed/simple;
	bh=u+qYaHk4FhI6AKTBtEqajiVbAdcU0mep39YThATDWfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOgwhEYqLM9ucsMdryjhXdsddEJ3qyhkNyprNFpqyb4Qo55CcIWb9mjEBdYBHKAAlYZ7LIcGtyuL68yflU0EyScVP1ihdl/5QIwwROKrxKBuR3BTLSxbutdyDoEOr/eEq1TwjLJlcyLAYFC82U/iYybF6WROHSHPIKB+np+mu7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWJZI5nE; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWJZI5nE"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so24312175ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790036267; x=1790641067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q01jEK+Fv5Yz/6Fpb8bxfLq3szcVIomFVIfW+quCfqw=;
        b=nWJZI5nEbRrjKk3hU8pA/OWlhu6UtEZMbZYxbWaezroCgBFrNVE/2TPnF0DNEQHhKF
         /v4zGsqnvAHjrT/Z2IJP65Fox+GPINbNEU2E5eGh+M0Pc5ahPlpQ5I2EJav2s7cL1g9q
         iFbV3HyyWAFUFxrdgdviEAy5Y7X2LA68pzT75ExYQS9h5wixWTLk87YsNkiyM2xlAxmX
         VBaydJh4iVET11ZFna/A3LebHOiI96RhV0hoWXEyo8q1ff+qNXHFbhkeYkNSg8lDE9j6
         PEKBSX6riQCOyDOWXYhjYfvsPGTH1YA86PK4GSumYNbW720AKW4XfdJDXvw+IEr2oVMp
         fw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036267; x=1790641067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q01jEK+Fv5Yz/6Fpb8bxfLq3szcVIomFVIfW+quCfqw=;
        b=nw+n4vcyrw7woYWz6J32DfN2L0+P2LpdMOWvEXalv+/CpsPK6vFS6+xV3gtzMwVU5h
         dT6b+Gl94SyjKFIuUfenPpV47S7LO5bd55/55TBk2mBOOCyPcAlG7qaAVMfR0YNs4j2k
         Vl/A0mI+hUNW9mBTA+EQ7mG46/Mj8Od8wguxJXO5ybi1o3qNAoU8COI45/2/bizxruu/
         lY/nAYGuyjwc6k4ktf4PzO0N+OT5/FbQr6xERdGB7h1u5pa6BbML05kUVXfdv59OiVA+
         0uoLZKOy4/T6V70vfLqU4HHe0qVA+R377UWTaeeQH1+8Ww3PP2iM9sLQUD7/DT/iuWUA
         K3OA==
X-Forwarded-Encrypted: i=1; AKwUvByuqJdSrwhScmJ4h9iLQa8FEwzeEUy8j7YeBYOKJs2LGVtEjH+98OVOxfxjomb6111354Wb0tVjD+5cO1c=@vger.kernel.org
X-Gm-Message-State: AFuF++nAZTA+Rvb9XWoOEvw5BFnwwRwHSGlXC2n1K+6gkvBtGpjf8tJx
	WmVS+WI23C0u/qIlkLD8H88lU87/oNsEvDcUZW+5OaGo7f6ZVMV+mYP9
X-Gm-Gg: AYBFou3mckKn8K7LY0/nS7upe3pNFEcmz+lw2lVAOvDcRTy0lrow+ytX3Y8lYFJpAQy
	9MVi1aGKpndV363QM2UW40mh/BbZAe2GQKslGYfclKcwyZa4fzwz2A5pzPXO9gw3Xo5eCuPVYFe
	6RvNcomGU6GIweaCEIDiDi3bR4bkcptHuGgHkrXoneg+6ZamcBTkCyS1dDJc2OKYm3me7Y0aaE6
	cLO2uDP3USH8uPU1M01cmzrLLjrZO/OM4zWSMBFkyGU58C61ziRBXs5Y2XsdSGTcjZAwcgC0Qpp
	gDC/MZIYOE7lypekYJevfleSw5NI0tnw8SVV3GtxdmyPsf/MX6HjP8zUVTIKjlejXxENssA04RJ
	FiTTCplU1XQad72YZ/qlDYkoZxxS8pK049aZDvPUT+leWi2jxht3pbEbvp9jyO+pp6dL9UTGB1z
	EsVjHIbAZGssf05+03KEJXm2EXDqjgQ3TEKwekX4WhXnZZilDZwoNrP4Gw7Uh4klw=
X-Received: by 2002:a17:903:26c3:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2ddb16e734emr168049675ad.0.1790036266904;
        Mon, 21 Sep 2026 17:17:46 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d056dafsm512335ad.72.2026.09.21.17.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:17:46 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: westeri@kernel.org
Cc: andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: stream: Make read return framing error to the userspace
Date: Mon, 21 Sep 2026 18:17:42 -0600
Message-ID: <20260922001742.14332-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>
References: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 11:19 AM UTC, Mika Westerberg wrote:
> +                     if (!nbytes) {
> +                             pr_warn("corrupted frame received, flags %#x\n",
> +                                     sf->frame.flags);
> +                             tbstream_dev_consume_rx(sdev);
> +                             ret = -EIO;
> +                     }
> +                     break;

One question: EPOLLIN is set unconditionally in the rx callback
regardless of frame flags, and tbstream_dev_fops_poll() only checks
tbstream_ring_available() (pure ring depth), never frame flags.
EPOLLERR is used elsewhere in this file but only for device-level
invalidity, not per-frame corruption. So userspace still has no way
to learn a corrupted frame is queued via poll() before calling
read() and getting -EIO. I'm just wondering, is this intentional,
or worth a follow-up?

Also, fwiw, this doesn't apply cleanly against current usb-next for
me, git apply fails on the rx_callback hunk. Looks like it's against
a tree predating the busy-polling changes.

Not a blocker either way.

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>
